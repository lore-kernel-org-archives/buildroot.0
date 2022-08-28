Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD174ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5692A4046B;
	Sun, 28 Aug 2022 09:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5692A4046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqzUJHpKs09y; Sun, 28 Aug 2022 09:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F39B4040D;
	Sun, 28 Aug 2022 09:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F39B4040D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3D681BF5AE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEE8F60AF7
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE8F60AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVHG5oWkRg65 for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:53:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC0E060ABA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC0E060ABA
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:53:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D50D7780514;
 Sun, 28 Aug 2022 11:53:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 11:53:08 +0200
Date: Sun, 28 Aug 2022 11:53:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220828095308.GK37358@scaer>
References: <20220828092430.21572-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828092430.21572-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661680392;
 bh=578UpKzHsJL3vrjiqoHpVeyIxa4OJICNrv6xSyrVb+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j0Y/sW6pIlXhLIi7zLpnPaChtTmsiyzJ+TTNIMtmx7CozEeOLGLGZCQDd/XaCTk7X
 ukbH3upDQdL/mkuh2Erm7c6uEdcv13TcXtYdspUngTwoXyOL09EcuzeosPigApJ7gV
 P7n6z9nv1R093NjDEttbOB7EBZU49jDa76cAwEBjGjgmtIEG+YpBc+w/PwDIjo2JC8
 CTbhArTix3t0mykO5pBS1vxKRZH1ABl9bLUCnGHYktyvsEdAvJgs6FQhJZ/+GGxxlm
 r7Qxj9BHRSMPtDlUwEeFCFiAukSkOg6er+AAYlz8cp+XIX8n8WLANeymWqoLJhaSfG
 CjTtRr1SaV+/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j0Y/sW6p
Subject: Re: [Buildroot] [next 1/1] docs/manual/patch-policy.txt: patch
 subjects shall not be numbered
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-08-28 11:24 +0200, Julien Olivain spake thusly:
> The script "utils/check-package" checks that patch email prefix are
> not be numbered. See:
> https://git.buildroot.org/buildroot/tree/utils/checkpackagelib/lib_patch.py?h=2022.08-rc1#n42
> 
> The error message recommends to generate patches to be included in
> Buildroot with the command 'git format-patch -N'.
> 
> The patch policy section in the Buildroot manual does mention that.
> 
> This commit adds a note about that requirement.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

I've shortened the subject prefix to "docs/manual:", and even though you
marked it for next, this is still documentation and thus material for
master.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/patch-policy.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index e704a0d3f3..063ef984d8 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -44,6 +44,11 @@ These patch files should be named +<number>-<description>.patch+.
>  - The field +<number>+ in the patch file name refers to the 'apply order',
>    and shall start at 1; It is preferred to pad the number with zeros up to 4
>    digits, like 'git-format-patch' does. E.g.: +0001-foobar-the-buz.patch+
> +- The patch email subject prefix shall not be numbered. Patches shall
> +  be generated with the +git format-patch -N+ command, since this
> +  numbering is automatically added for series. For example, the patch
> +  subject line should look like +Subject: [PATCH] foobar the buz+ rather
> +  than +Subject: [PATCH n/m] foobar the buz+.
>  - Previously, it was mandatory for patches to be prefixed with the name of
>    the package, like +<package>-<number>-<description>.patch+, but that is
>    no longer the case. Existing packages will be fixed as time passes. 'Do
> -- 
> 2.37.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
