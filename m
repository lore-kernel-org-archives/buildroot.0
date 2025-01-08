Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C770BE77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9382C80D6B;
	Wed,  8 Jan 2025 20:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLoLv9hsdk3L; Wed,  8 Jan 2025 20:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B54AC80D8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B54AC80D8C;
	Wed,  8 Jan 2025 20:35:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA1D31EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E425F6086D
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyVhfu4x6XZn for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3DC226083A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC226083A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DC226083A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:35:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1559455254; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 20:35:44 +0000 (UTC)
Message-ID: <3176f967-29c6-47c2-a1f5-d4bd96ec6567@korsgaard.com>
Date: Wed, 8 Jan 2025 21:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241230182234.CBDEF828A6@busybox.osuosl.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241230182234.CBDEF828A6@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mHqce8LO4herDb1P3Pudd6/4baxCTNr3l19M5+KZ1eLtHcBKDXdkIn1B/uUjta5ZuNrJ2fCbyjsFNddlZsijasNgocaASKSYs4c65noGTENpD2lDokCZGK7sOMrA7uWeaiaViCKR4APhlTRhL4YVpeC+OYdEQz9o/zFp4k+lBF3loyvaG2ep18suo5nLS7YpaNKKJhfWjdMRmbw6ztOfu2Zesr9Qxp61VYIBqMOWABmcVDj6taYTBukxs4osatcrg+6QiQlrq7OjND1Vf27V9p2nQ/XiZp6o8HXGFA4Yl/+tF3t7JShP9r5zXksRf4KxNgU8hy2R5Ozj6/9kbQpumw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=bB0s4WJd0JWjC+sPL/N/GpELz2BL8bEMwuOti0We9jg=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mHqce8LO
Subject: Re: [Buildroot] [git commit] linux: select
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed
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

On 12/30/24 19:18, Julien Olivain wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=5dae966a30c5485e45b94f750a739d36810cba4c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The autobuilders are regularly reporting issues when building the
> Linux kernel due to BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL not being
> enabled.
> 
> Since the autobuilders are always using
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG, let's have this option
> select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when the latest kernel is
> used.
> 
> For now, we enable this for ARC, Sparc and x86-64, but it might have
> to be extended for additional architectures based on build results.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/596699ede6e651163a23fa50386d84aca24c9a28
>    http://autobuild.buildroot.net/results/77a767bcd78f9ed21668cc268e91a4584a821661
>    http://autobuild.buildroot.net/results/e846d13c9f001b76a08ffb94f69c8dd26b4f5811
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
