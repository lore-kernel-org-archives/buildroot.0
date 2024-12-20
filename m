Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596B1E7718B
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 21:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B4982F4A;
	Fri, 20 Dec 2024 21:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSP8482DCv8v; Fri, 20 Dec 2024 21:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05A3E82F20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05A3E82F20;
	Fri, 20 Dec 2024 21:32:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C84796C
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B576640962
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aj5_LzBoCznW for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 21:31:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AB7F4026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AB7F4026F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AB7F4026F
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:31:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EC8E713F89A;
 Fri, 20 Dec 2024 22:31:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53836])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 22:31:54 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 22:31:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <66affdb182eb8f587dea7762cee43f0c203a7ba0.1734701459.git.yann.morin@orange.com>
References: <cover.1734701459.git.yann.morin@orange.com>
 <66affdb182eb8f587dea7762cee43f0c203a7ba0.1734701459.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3ff701ca8621ac087b9e617d7da803c2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734730316;
 bh=lsVBiXR9LF8ffXe/TGK1cVU9ZwQxjjQIQwvDabu35Og=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fo1Q+eMCvGySZQ4hIcqENnCjPNfT2b495jpON0f3/iJljC6V6arsR7grf+4/Jjtt/
 4ilB7uVJv7tpUlnhzVmUo3s1mKEkGWc9sortinxoVxssB61sGBMXqKVp672vvxHntD
 s4BpCs4ie8pOJbqfmWI3+p6d9AnPxRqcGys4KHouWsmfFnd0r2uEilKucz+fI5HrQ6
 kdW4zibNm1dwcDJ8bvtZEuasBS0KRO/8os1p2AI/xQvzkaMcgM9cNycHoOmC08xMo4
 u60oXGqxc8EMRoR93O7KXA+H08uwFl+f5a7CFL4zYMiEv0+6ghpDnLkp/ghXfTiXMr
 yGas2gtUwYHUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fo1Q+eMC
Subject: Re: [Buildroot] [PATCH 2/5] utils/get-developers: use parser.error
 rather than canned print+return
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Thanks for the patch!

On 20/12/2024 14:31, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  utils/get-developers | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/get-developers b/utils/get-developers
> index 33980366d6..8e5796beaf 100755
> --- a/utils/get-developers
> +++ b/utils/get-developers
> @@ -40,11 +40,9 @@ def __main__():
>      if len(args.patches) != 0:
>          action += 1
>      if action > 1:
> -        print("Cannot do more than one action")
> -        return
> +        parser.error("Cannot do more than one action")
>      if action == 0:
> -        print("No action specified")
> -        return
> +        parser.error("No action specified")

This change breaks the get-developers runtime test. You can
see the failure with the command:

     utils/docker-run support/testing/run-tests \
         -d dl -o output_folder \
         tests.utils.test_get_developers

I believe this is due to moving the error message from stdin to
stderr. So this patch should also update accordingly the file:

     support/testing/tests/utils/test_get_developers.py

Can you have a look to fix this test, please?

> 
>      devs = getdeveloperlib.parse_developers(args.filename)
>      if devs is None:
> --
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations 
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez 
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les 
> messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme 
> ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged 
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and 
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have 
> been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
