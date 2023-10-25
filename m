Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19856C0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 19:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990F881FD4;
	Wed, 25 Oct 2023 19:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 990F881FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVillfRmTPTB; Wed, 25 Oct 2023 19:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE87681FCF;
	Wed, 25 Oct 2023 19:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE87681FCF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 091FF1BF377
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9A764048C
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9A764048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZtKEWEFpWq8 for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 19:52:39 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57C7D40423
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 19:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57C7D40423
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4e76:c8a5:3c3f:7e55])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 006055FE03;
 Wed, 25 Oct 2023 21:52:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 Oct 2023 21:52:32 +0200
Date: Wed, 25 Oct 2023 21:52:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231025195232.GA2582@scaer>
References: <20231025193017.1051787-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025193017.1051787-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698263556;
 bh=vuQOippr0PDZA8hJuOske0oDBxT59kkctVw4CkAjttg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tcfb1HOIcm9uknIACDMKG/RfAsHKZa6plMxa/HRTcQKtxXhOskbvQofUnYT/xYqmi
 EEfAiYq0kmZHqpDSy3nve98yjVOQqtUxRoLZTtIA+P1psWnD8KI0NUaWtBFSuwuAwV
 sEelOnH5QU7cX+Xy96gVMr3f2mQ87ZYz0tVM1DtSblkcKkn9T1ecmXEwrRWDXkpoHh
 RoW7sQ+SEFHUFo/JC+aJyrmWgxYqrRoDnbAhL0DLQWyQo7fYlZucqW12O21r1ta/vz
 Iq7yqUdT5izvZKPlHJNL2y4ulwZgCN3SZQzV/JbNzloGW+KAiVW7SaLHfLFIMk92Q8
 LKygQnCvR6UHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tcfb1HOI
Subject: Re: [Buildroot] [PATCH] package/mxsldr: add .hash file
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
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-10-25 21:30 +0200, Peter Korsgaard spake thusly:
> The host-mxsldr package was missing a hash file, add it now.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mxsldr/mxsldr.hash | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 package/mxsldr/mxsldr.hash
> 
> diff --git a/package/mxsldr/mxsldr.hash b/package/mxsldr/mxsldr.hash
> new file mode 100644
> index 0000000000..c2a7b4ad64
> --- /dev/null
> +++ b/package/mxsldr/mxsldr.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  8ef7b7abb8d17c879e70b2c3911df8c5ce97f38779fa65d40be7f34febba55e1  mxsldr-2793a657ab7a22487d21c1b020957806f8ae8383-br1.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -- 
> 2.30.2
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
