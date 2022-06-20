Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE9AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F238F4056E;
	Mon, 20 Jun 2022 19:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F238F4056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbyULahuS6vl; Mon, 20 Jun 2022 19:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DCA040B19;
	Mon, 20 Jun 2022 19:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DCA040B19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 136C71BF28A
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0A8E40B19
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A8E40B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjjtX9PCBWSb for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:01:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A8F640B0A
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A8F640B0A
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:01:22 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 203D4201A6;
 Mon, 20 Jun 2022 14:01:21 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 14:01:14 -0500
Message-Id: <20220620190115.541032-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620170940.513445-1-vfazio@xes-inc.com>
References: <20220620170940.513445-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1655751681; bh=kaJNoB0YGxh/X1x1zfGY18wA7SWld0ai4Jfyx7+9qSU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YDm/9RrxHn1tKSp4CQepNgaLbLCmv0KnYsHXXxW6kQ8QQJoIruOhY3BsfH83UsU8V
 diAWyyoi7j98QgcOTMVYyt3hnyKe6fY91BoJOke+fvQvyxs6lTTJYDTLUGdoD1ss3l
 Cdm8k4TkeUp/hORS1JKCLnSi04wF34msss9KyYa8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=YDm/9Rrx
Subject: [Buildroot] [PATCH 1/2] package/nvidia-driver: define
 IGNORE_CC_MISMATCH
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Leverage IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
where NVIDIA's `cc_version_check` in kernel/conftest.sh may fail due
to matching on the pkgversion substring of the GCC version string in
the kernel's include/generated/compile.h.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/nvidia-driver/nvidia-driver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 54c2aa46d8..ec070e3ca6 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -137,6 +137,7 @@ endif
 # because they don't recognise the usual variables set by the kernel
 # build system. We also need to tell them what modules to build.
 NVIDIA_DRIVER_MODULE_MAKE_OPTS = \
+	IGNORE_CC_MISMATCH=1 \
 	NV_KERNEL_SOURCES="$(LINUX_DIR)" \
 	NV_KERNEL_OUTPUT="$(LINUX_DIR)" \
 	NV_KERNEL_MODULES="$(NVIDIA_DRIVER_MODULES)"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
