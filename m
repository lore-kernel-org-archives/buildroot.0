Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E621AC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C860405AA;
	Wed, 27 Jul 2022 07:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C860405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fnmjbtrYnMc3; Wed, 27 Jul 2022 07:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EEFA402BD;
	Wed, 27 Jul 2022 07:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EEFA402BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4044D1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A1DC813C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1DC813C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjqR7i0Aye67 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:31:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51C3F81310
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C3F81310
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BCF5686437; Wed, 27 Jul 2022 07:17:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:30:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e3688901857c8a96d25dfce8acf8c489fd09441
X-Git-Newrev: 1fe93a688a49ecba734cb9d6b8735d441e8e8715
X-Patchwork-Hint: ignore
Message-Id: <20220727071754.BCF5686437@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencl-clhpp: add dependency on
 libopencl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1fe93a688a49ecba734cb9d6b8735d441e8e8715
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though opencl-clhpp's build does not need libopencl, as it's just
made of headers, any user of opencl-clhpp will assume libopencl is
already installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencl-clhpp/opencl-clhpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
index ab52d80547..933b40e3fe 100644
--- a/package/opencl-clhpp/opencl-clhpp.mk
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -8,6 +8,7 @@ OPENCL_CLHPP_VERSION = 2.0.16
 OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
 OPENCL_CLHPP_LICENSE = Apache-2.0
 OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
+OPENCL_CLHPP_DEPENDENCIES = libopencl
 OPENCL_CLHPP_INSTALL_STAGING = YES
 
 # OpenCL_CLHPP is a header-only library
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
