Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704DAC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F323416FF;
	Wed, 22 Feb 2023 17:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F323416FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZAPuTAvSTfh; Wed, 22 Feb 2023 17:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4799141736;
	Wed, 22 Feb 2023 17:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4799141736
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 953741BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0174781442
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0174781442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxkQJojLANfo for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4D3582005
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4D3582005
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF508867D1; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:48:49 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 22b99575bdd79222c0f6e78eb401261abc930de7
X-Git-Newrev: a01ee07c7925b3a8f0ced7c7b85a8b714cb2aba9
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.AF508867D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ti-sgx-km:
 properly handle legacy for removed options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a01ee07c7925b3a8f0ced7c7b85a8b714cb2aba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "c38b5566fe package/ti-sgx-{km, um, demos}: bump to latest TI
version", added in release 2020.02, removed some options that were
previously renamed in release 2018.05.

Update the legacy entry for 2018.05 and add the corresponding legacy
entries for 2020.02.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b2661fe63990386cf2626ce1dd26919346ca86c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 66 +++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0ed989f8b0..1b8d197882 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1468,6 +1468,35 @@ config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
 	help
 	  The vcfiled support was removed upstream.
 
+config BR2_PACKAGE_TI_SGX_KM_AM335X
+	bool "ti-sgx-km AM335X option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_TI_SGX_KM
+	help
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
+
+config BR2_PACKAGE_TI_SGX_KM_AM437X
+	bool "ti-sgx-km AM437X option removed"
+	select BR2_LEGACY
+	help
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
+
+config BR2_PACKAGE_TI_SGX_KM_AM4430
+	bool "ti-sgx-km AM4430 option removed"
+	select BR2_LEGACY
+	help
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
+
+config BR2_PACKAGE_TI_SGX_KM_AM5430
+	bool "ti-sgx-km AM5430 option removed"
+	select BR2_LEGACY
+	help
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
+
 comment "Legacy options removed in 2019.11"
 
 config BR2_PACKAGE_OPENVMTOOLS_PROCPS
@@ -2441,45 +2470,34 @@ config BR2_PACKAGE_MEDIAART_BACKEND_QT
 	  BR2_PACKAGE_MEDIAART_BACKEND_QT has been renamed to
 	  BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
 
-# Note: BR2_PACKAGE_TI_SGX_AM335X is still referenced from
-# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM335X
-	bool "ti-sgx-km AM335X option renamed"
+	bool "ti-sgx-km AM335X option removed"
 	select BR2_LEGACY
+	select BR2_PACKAGE_TI_SGX_KM
 	help
-	  For consistency reasons, the option
-	  BR2_PACKAGE_TI_SGX_AM335X has been renamed to
-	  BR2_PACKAGE_TI_SGX_KM_AM335X.
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
 
-# Note: BR2_PACKAGE_TI_SGX_AM437X is still referenced from
-# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM437X
-	bool "ti-sgx-km AM437X option renamed"
+	bool "ti-sgx-km AM437X option removed"
 	select BR2_LEGACY
 	help
-	  For consistency reasons, the option
-	  BR2_PACKAGE_TI_SGX_AM437X has been renamed to
-	  BR2_PACKAGE_TI_SGX_KM_AM437X.
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
 
-# Note: BR2_PACKAGE_TI_SGX_AM4430 is still referenced from
-# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM4430
-	bool "ti-sgx-km AM4430 option renamed"
+	bool "ti-sgx-km AM4430 option removed"
 	select BR2_LEGACY
 	help
-	  For consistency reasons, the option
-	  BR2_PACKAGE_TI_SGX_AM4430 has been renamed to
-	  BR2_PACKAGE_TI_SGX_KM_AM4430.
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
 
-# Note: BR2_PACKAGE_TI_SGX_AM5430 is still referenced from
-# package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM5430
-	bool "ti-sgx-km AM5430 option renamed"
+	bool "ti-sgx-km AM5430 option removed"
 	select BR2_LEGACY
 	help
-	  For consistency reasons, the option
-	  BR2_PACKAGE_TI_SGX_AM5430 has been renamed to
-	  BR2_PACKAGE_TI_SGX_KM_AM5430.
+	  Starting from buildroot release 2020.02, the buildroot package
+	  only supports the target am335x.
 
 config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
 	bool "janus-gateway audio-bridge option renamed"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
