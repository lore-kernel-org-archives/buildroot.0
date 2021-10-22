Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F87C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 19:07:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC7A6101D
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 19:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DC7A6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C302408CE;
	Fri, 22 Oct 2021 19:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1r_-ijJ5YbAx; Fri, 22 Oct 2021 19:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B6B408C0;
	Fri, 22 Oct 2021 19:07:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2AD1BF40D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 19:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA7D408CE
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 19:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zT3wEaVVdKZ9 for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 19:07:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5077E408C0
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 19:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634929623;
 bh=F0CE8imI2bBFi26aHjTaitGeRS0F89KVzMDQMRNfFEE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XBYk7CjyYfHi6WPgs+eG7V3eHxA7r+tSdTEqbG6PJoEg4tF61MMxSd/hsRzTmnY4A
 0YM8bZeSdX4ceMS0eS6TB5EK7vjLzUT/95tyJQ7rsewXuR/kXbjuNlwif7FcBvSrke
 5fJsEvK5QwijVwtbmz9qpkeFNyc8dfR/9nSJBBvI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.153]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MNbox-1mJRmu1eyx-00P5uu; Fri, 22 Oct 2021 21:07:03 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 21:07:02 +0200
Message-Id: <20211022190702.7782-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022190702.7782-1-ps.report@gmx.net>
References: <20211022190702.7782-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BMjKZXSdH4w53IReoAF7vkxlbz0mGQe/wfboBEajmZUpz8IKZNX
 lAWZbK8HF89XggXrsTWxB90izy+C91LoCvr3FskSo8PQeGYHlnGyV5klenV+umdfmZBdLOq
 ccHcPwMc2zbcIt1NgVOKZmOwq5RzO951d7TOER5BZluVlPMPm7FKAta7sVYctxBLnbq1fT7
 DTIMYCgbSAtXOMqR741PA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OTxNwaXM0Us=:nCskIR8dMAH/kKha7fihih
 p/5HGBQnNkjP2uwhJVSHWGQhV1DAT48/l9BeISKI3PHEBGoGONC9VlctC1ymcPU7Usc11QZKk
 YQTowTPAhLXdOTyaNlo1XIIWMFf2QaU89H70REFdfOCczFOoYjtCLPNnObBxb35GPmd8zGfn6
 vfrod56xAh3fa9p1rV9KO7ZunVFfo19C56j+ShIaRxUroSiZ4tRK25VR+wVdjkT8fk6TE7LRS
 Z6BHmtK60pt2Rg2wn4MwLSRRpEJC9mXYnKhHNeIaI1i47cRd9LQSvvb9papCXnIHVc8pPHeNS
 hSd4WBFeKRv9PBy2RwAwXjRkMUxZbc1f02/+wlqnYKIBLATijI4Y6RDiMx/Ok2edcIrqzVJzF
 r/pt16X8OX8mFgQtVPyLNIPabYrxRiBB/mTH5Uuq4jEOed/7Y3nLMNToAT87SUtFSp1AXtQvH
 3C+tcfV/itrGuSC+uTUyrGRcTMELF5+/h3HTME4axb0daKnd4Rb+GDkd0dMCZC72Enw+AreIK
 gACyu4KUm1wX3AqBMwMILdYkHOen+CgjTcOfg69qHxeP+GXOUPZYXTp8LX1cNYTFp4wIraFn3
 6z2iQNLlnbmNMggLmTooPtq+/I1h3LntP3f4DLQmK1V51ysfoa3Ak4Mx2DsIOOcCOIQn8ppRQ
 T/LzYlbDyv8AwfGuAK1rhc43BbAPGI8CSgcg4JhFwh1fQGU3QcR8saLp0Lagia/3L06W0F/kU
 aahchoqOt4BCx5mSPoDqOhhqXv5+cg4khiKDZvCrIumMgQHrXGOtWEQrbHC9x2dYdEVUTN82n
 JZke1tUsVYArgU36GaM2FzUkmUKDM5O5RFP/PkjPrgUnUuuGH7LAIWYvUBcYj8kWkfaV9cl5J
 5kZ11rc1DzvQdHodIqZcALzoMiNyFWucsuyu1dgmjI/4gthGJVYA26eZc8bfesl8AMn66wLLH
 YJWq6AswS46bMQ2L4djAIVsAIO/7O4X8fkmUmTYPGkVEISHFQF6PNfyLiEpairbjrhWUXBhhr
 sqoc7kwew51Ya4RqhGyAbc/bzHJ7QM7AAlL22H9qdQ9/XuXt590L9iX9+pVwgYEXHIRiS/INj
 9l3XPCuuWfZn2Y=
Subject: [Buildroot] [PATCH v1 2/2] package/libcamera: add lc-compliance
 test application option
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add lc-compliance test application option (and add proper dependencies
  on gtest and libevent)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/Config.in    | 18 ++++++++++++++++++
 package/libcamera/libcamera.mk |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index b7f0e5b05d..23a0040abf 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -72,6 +72,24 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC
 	help
 	  Pipeline for the vimc device.
 
+config BR2_PACKAGE_LIBCAMERA_COMPLIANCE
+	bool "lc-compliance test application"
+	depends on BR2_USE_WCHAR # gtest
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gtest
+	depends on BR2_INSTALL_LIBSTDCPP # gtest
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gtest
+	depends on BR2_USE_MMU # gtest
+	select BR2_PACKAGE_GTEST
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  lc-compliance test application
+
+comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif # BR2_PACKAGE_LIBCAMERA
 
 comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8ab95fb42a..5a5f2800b9 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -61,6 +61,13 @@ LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc
 
 LIBCAMERA_CONF_OPTS += -Dpipelines=$(subst $(space),$(comma),$(LIBCAMERA_PIPELINES-y))
 
+ifeq ($(BR2_PACKAGE_LIBCAMERA_COMPLIANCE),y)
+LIBCAMERA_DEPENDENCIES += gtest libevent
+LIBCAMERA_CONF_OPTS += -Dlc-compliance=enabled
+else
+LIBCAMERA_CONF_OPTS += -Dlc-compliance=disabled
+endif
+
 # gstreamer-video-1.0, gstreamer-allocators-1.0
 ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
 LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
