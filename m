Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742B3C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 16:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE9B40549;
	Tue, 28 Nov 2023 16:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DE9B40549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqirWWobCQt0; Tue, 28 Nov 2023 16:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C21402E8;
	Tue, 28 Nov 2023 16:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C21402E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 815E61BF3F9
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6206240488
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6206240488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THC8PhWvJS0n for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 16:17:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25A24400D8
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 16:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25A24400D8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:c5a3:8084:a241:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9E19813F8C2;
 Tue, 28 Nov 2023 17:16:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Nov 2023 17:16:59 +0100
Date: Tue, 28 Nov 2023 17:16:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231128161659.GH3177259@scaer>
References: <20231127213138.1062051-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127213138.1062051-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701188222;
 bh=bITzRAjVt9eMm6t69rG1APtN/ZcFb85Qh5kf54GnTM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IngepY7GDHoTCFnZgEvnwv0xN3EXxw6E8Gn0UHIGsZxyKKjCJ+BtjOD6uY9DBeaSX
 o45JxF7PuRMA+Agh/WnenXStKbjvW5krMa8Qz/jgUCYoV2kf98eiw35kOULu19kKxc
 I+RKoJwBl1CLvPFj40bVMifbxhWzyg8IaN8BSvUpTC1KIXLy/c59fBhjUn6zCEd1mm
 AEnljP2QRQUtl7oV4hnCysl9j12tVBf+jPdOi6/6997pdCPbMhBbcuW2HigMLsPRjT
 cQeQAGFSmO3EHghdd5fFWbGgh8axkXkX2qRD9OxFy74inVvx4dLwi25QJJbZ1aVe0O
 4yM2NMOMLR9gQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IngepY7G
Subject: Re: [Buildroot] [PATCH 1/1] package/openrc: fix uclibc build
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
Cc: =?utf-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-11-27 22:31 +0100, Fabrice Fontaine spake thusly:
> Fix the following uclibc build failures raised since bump to version
> 0.51 in commit 730c90faa3ec13ee1ead47113c9c5c7d3a8dac55:
[--SNIP--]
> Fixes:
>  - http://autobuild.buildroot.org/results/494ef392a971ddb3c5c7b01e0149c6439018dbe7
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/OpenRC/openrc/pull/674

It looks like upstream is not happy with this patch. Given the feedback
there, I think we'll unfortunately have to hide openrc away for uClibc,
until upstream has a proper fix.

Regards,
Yann E. MORIN.

> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 9f4fc5ee5..9ab293c3a 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -149,7 +149,7 @@ else
> + endif
> + 
> + if os == 'Linux' or os == 'GNU-kFreeBSD'
> +-  cc_os_flags = ['-D_DEFAULT_SOURCE']
> ++  cc_os_flags = ['-D_DEFAULT_SOURCE', '-D_GNU_SOURCE']
> + elif os == 'FreeBSD'
> +   cc_os_flags = ['-D_BSD_SOURCE']
> + elif os == 'GNU'
> -- 
> 2.42.0
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
