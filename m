Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AACC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B646F81317;
	Wed, 10 Aug 2022 21:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B646F81317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymuBPjZOscMk; Wed, 10 Aug 2022 21:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D288D812E1;
	Wed, 10 Aug 2022 21:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D288D812E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE7AB1BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60BAF40338
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60BAF40338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xu1BTXf3ZCkv for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:18:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B607D400A8
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B607D400A8
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:18:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 452DF240005;
 Wed, 10 Aug 2022 21:18:41 +0000 (UTC)
Date: Wed, 10 Aug 2022 23:18:39 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220810231839.1b6164f7@windsurf>
In-Reply-To: <20220809224427.1421622-1-giulio.benetti@benettiengineering.com>
References: <20220809224427.1421622-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660166321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=366XImS3RiQAVtPdPzuNVc7sFt0ZFntpWXyJsRF50OM=;
 b=d+TP49AhRxAN3xGzGkl2/u7jiwznKi7Jwsee4fx9ammk+nHO6ig6HBbnB9fYVPGacCrj84
 5sAsGQdMmta9t1DAAsB4co73PfJeYtshoNyRinmu69WnRk3IoARYzVfu/Q+cSxUpcZToei
 syUcgP4n88G0gWUDrATfh/BrwrVU5s2cQNprrSJ83nYQwBfajqrItGug5XaNfqATNFp0U1
 F0JBVaUePyXhzWHSzkK9hUgJ+wycybf2tnOwwsamCLMgJZY9RDeISGBpI9dEWZ4sxHNivR
 GcKRow1Odc1shbk7MnKF1Z+rASHXJIO/P7Be12tl4C9RQGe7UmWAsO9Jk+fqJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d+TP49Ah
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.6.2
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

Hello Giulio,

On Wed, 10 Aug 2022 00:44:27 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> nfs-utils 2.6.2 adds nfsrahead tool to set readahead through sysfs, but
> this tool is mandatory and requires libmount that in order requires
> libblkid. Also we need a local patch that is already pending upstream to
> avoid failing static linking:
> https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
> 
> So let's select:
> - BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> - BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> and add the pending patch for fixing static linking failure due to wrong
> order of libraries in linker list(-lblkid must follow -lmount). This is
> achieved by using pkg-config that is already a dependency of this package.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks, I have applied to master, but I have a comment below.

> diff --git a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
> new file mode 100644
> index 0000000000..b8dcea63f7
> --- /dev/null
> +++ b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
> @@ -0,0 +1,34 @@
> +From a69014a1b4e5b8068630abe3109f31eb64b6a076 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 10 Aug 2022 00:10:51 +0200
> +Subject: [PATCH] nfsrahead: fix linking while static linking
> +
> +-lmount must preceed -lblkid and to obtain this let's add:
> +`pkg-config --libs mount`
> +in place of:
> +`-lmount`
> +This ways the library order will always be correct.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> +Pending Upstream:
> +https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
> +---
> + tools/nfsrahead/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/nfsrahead/Makefile.am b/tools/nfsrahead/Makefile.am
> +index 845ea0d5..280a2eb4 100644
> +--- a/tools/nfsrahead/Makefile.am
> ++++ b/tools/nfsrahead/Makefile.am
> +@@ -1,6 +1,6 @@
> + libexec_PROGRAMS = nfsrahead
> + nfsrahead_SOURCES = main.c
> +-nfsrahead_LDFLAGS= -lmount
> ++nfsrahead_LDFLAGS= `pkg-config --libs mount`

This is not the correct way of using pkg-config in an autotools based
project. Instead, the configure.ac should use the PKG_CHECK_MODULES
macro, and use the appropriate variables in Makefile.am.

Approximately something like this in configure.ac:

PKG_CHECK_MODULES([LIBMOUNT], [mount])

and in the Makefile.am:

nfsrahead_CFLAGS = $(LIBMOUNT_CFLAGS)
nfsrahead_LDFLAGS = $(LIBMOUNT_LIBS)

see https://bootlin.com/doc/training/autotools/autotools-slides.pdf
slide 85 and following.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
