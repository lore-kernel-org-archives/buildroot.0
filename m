Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB645C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F9A860E7E;
	Tue,  1 Nov 2022 22:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F9A860E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9YBQGVyCGbX; Tue,  1 Nov 2022 22:26:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81E3C60E64;
	Tue,  1 Nov 2022 22:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81E3C60E64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FEA81BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2747A415D8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2747A415D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKWuxH8WGqOD for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:26:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1054409DD
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1054409DD
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:26:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E259E240004;
 Tue,  1 Nov 2022 22:26:38 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:26:37 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221101232637.4320e485@windsurf>
In-Reply-To: <20221015215829.116064-1-fontaine.fabrice@gmail.com>
References: <20221015215829.116064-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+RrKluIzL3sopYHT9GHe44GzbPx5znIv/7TGod5DTk=;
 b=OqZouijen58sR9sshC7x5FYcHhtbnNdMcQPuPdE+8BB41drnYcRW9PInYPwxyBK2a1+bqp
 YvT1KGOGgOFlCTiNdjHO+c0kARLHYInB1jbtBR1F9zIeFtSMM2PKW4Q/8d8y8C9RlUjCiN
 VNS0hkmdutQMxzcJuFchxOlai491OC7v7B0W+8bze5sY19hR2qRhpFEMWcJlA7oSYWShJg
 j/thuFHoFjjdUpoiy/va64d5mUUI7AUtf9Xg0Kfhy0fkxmjAkYnVgidYzzHrujTqxxayzP
 wbIoYtD0qIWEa65FJ4qZXDTVKKJH5IIvY+UAL5mo8NcDScXVHCVW1HbwGbk0VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OqZouije
Subject: Re: [Buildroot] [PATCH 1/1] package/igd2-for-linux: bump to version
 2.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 15 Oct 2022 23:58:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the build with pupnp >= 1.14.13 raised since commit
> a9ee25b01b741ad4f68575974c89c65146ab87f2 and
> https://github.com/pupnp/pupnp/commit/2f99af26731ec7d5677e5576c006a35128b59d55:
> 
> In file included from src/threadutil/FreeList.h:43,
>                  from src/threadutil/TimerThread.h:39,
>                  from src/gatedevice.h:32,
>                  from src/gatedevice.c:38:
> src/threadutil/ithread.h:917:12: error: expected ';' before 'int'
>   917 | EXPORT_SPEC int pthread_mutexattr_setkind_np(
>       |            ^~~~
>       |            ;
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2eebf8264327bd492ee8cadc0c539d42c4f2e252
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/igd2-for-linux/igd2-for-linux.hash | 2 +-
>  package/igd2-for-linux/igd2-for-linux.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
