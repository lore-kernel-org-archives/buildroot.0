Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDC7C4332F
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 15:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB7D60C1A;
	Tue, 27 Dec 2022 15:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADB7D60C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hf_KgyrNZYoz; Tue, 27 Dec 2022 15:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D297760C15;
	Tue, 27 Dec 2022 15:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D297760C15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC88B1BF41F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 15:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4FC260C15
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 15:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4FC260C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFKPIxbSoyEW for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 15:43:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A0F60BDA
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0A0F60BDA
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 15:43:07 +0000 (UTC)
Received: from pps.filterd (m0266029.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2BRFc9m5008897; Tue, 27 Dec 2022 15:43:06 GMT
Received: from xnwpv38.utc.com ([167.17.239.18])
 by mx0a-00105401.pphosted.com with ESMTP id 3mpkmdw739-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Dec 2022 15:43:06 +0000
Received: from qusnwaff.utcapp.com (qusnwaff.utcapp.com [10.161.48.102])
 by xnwpv38.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BRFh5H8045361
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Dec 2022 15:43:05 GMT
Received: from dtulimr01.rockwellcollins.com ([10.172.224.19])
 by qusnwaff.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BRFh5ht029026
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 27 Dec 2022 15:43:05 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab
 [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id C2FAB60428;
 Tue, 27 Dec 2022 09:43:04 -0600 (CST)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 09:43:00 -0600
Message-Id: <20221227154300.10556-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Proofpoint-GUID: WT9CvPJlQwt6YPIAH9HNgC6C3eNL6qn2
X-Proofpoint-ORIG-GUID: WT9CvPJlQwt6YPIAH9HNgC6C3eNL6qn2
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212270128
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=DHJZ5GcD6nqPrw7YVnjLUNQGKORHmuIFAfzjmw3//I0=;
 b=XarZFRriNuygLW+z3q1INshCfOw70XnVgrJRZWj+l6EU7UPmEQo1Ccan58PBU9ZZgr3Y
 ytdE6bvHRx6pPXzuE+ZwNlo6LeaXkVT0Gso3FuYjUztSRiSx03c2eM59QurxuGYBZiK1
 bsGB9f5f6ttx+TYF6kaGLj2Z9ipQRD7GE2BRBtWGnHDIWg3koZ5YMG+FuxUl81XbNA2m
 zA2Y4hKJDHAEmv+BcspCZTjCh90/EGa2VCTZUkT5q4ecfPrqFC5xEfy31Qf+Hsg/GnEx
 W97HOBFVsRic/4uA6hZTjzOWBk/Vo9gzM4rRVhfnqfirFVEt24xGNYrUHKwuEGM0t+Z6 hQ== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=XarZFRri
Subject: [Buildroot] [PATCH v2 1/1] Makefile: fix SDK relocation for
 per-package-dirs
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The relocate-sdk.sh script does not work correctly when
BR2_PER_PACKAGE_DIRECTORIES is enabled. relocate-sdk.sh expects
everything to point at $HOST_DIR, but each package will be pointing at
its $(O)/per-package/*/host.

Use the same command for scrubing host paths during the build, to scrub
to the final host directory location.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
v2:
- drop original implementation in favor of reusing the existing
  PPD_FIXUP_PATHS code.
---
 Makefile               |  1 +
 package/pkg-generic.mk | 12 +-----------
 package/pkg-utils.mk   | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 88f90cd2fa..ac3540b36c 100644
--- a/Makefile
+++ b/Makefile
@@ -598,6 +598,7 @@ prepare-sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
 	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging
+	$(call ppd-fixup-paths,$(BASE_DIR))
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f24e03a325..210af1bbef 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -92,18 +92,8 @@ endif
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 
-# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
-# proper staging and host directories for the current package: find
-# all text files that contain the PPD root, and replace it with the
-# current package's PPD.
 define PPD_FIXUP_PATHS
-	$(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
-	|while read -d '' f; do \
-		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
-		printf '%s\0' "$${f}"; \
-	done \
-	|xargs -0 --no-run-if-empty \
-		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
+	$(call ppd-fixup-paths,$(PER_PACKAGE_DIR)/$($(PKG)_NAME))
 endef
 
 # Remove python's pre-compiled "sysconfigdata", as it may contain paths to
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0945e6ed31..f22562fbed 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -233,6 +233,21 @@ define prepare-per-package-directory
 	$(call per-package-rsync,$(1),host,$(HOST_DIR))
 	$(call per-package-rsync,$(1),target,$(TARGET_DIR))
 endef
+
+# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
+# proper staging and host directories for the current package: find
+# all text files that contain the PPD root, and replace it with the
+# current package's PPD.
+# $1: destination root directory containing host and staging
+define ppd-fixup-paths
+	$(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
+	|while read -d '' f; do \
+		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
+		printf '%s\0' "$${f}"; \
+	done \
+	|xargs -0 --no-run-if-empty \
+		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(1)/:g'
+endef
 endif
 
 #
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
