Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C1FC433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 21:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 794F460B14;
	Mon, 28 Nov 2022 21:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 794F460B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkwwU4qbs7_q; Mon, 28 Nov 2022 21:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D7A60BBE;
	Mon, 28 Nov 2022 21:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D7A60BBE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71ED31BF2A7
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 21:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A269402E5
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 21:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A269402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEbndqrAsz9L for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 21:05:16 +0000 (UTC)
X-Greylist: delayed 00:18:33 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 760494011B
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 760494011B
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 21:05:16 +0000 (UTC)
Received: from pps.filterd (m0266029.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2ASKheoB005672; Mon, 28 Nov 2022 20:46:42 GMT
Received: from xnwpv36.utc.com ([167.17.239.16])
 by mx0a-00105401.pphosted.com with ESMTP id 3m396vu8pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 20:46:41 +0000
Received: from qusnwafe.utcapp.com (qusnwafe.utcapp.com [10.161.48.101])
 by xnwpv36.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2ASKkeJ8111048
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 20:46:40 GMT
Received: from crulimr02.rockwellcollins.com ([10.172.224.19])
 by qusnwafe.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2ASKke0i019323
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 28 Nov 2022 20:46:40 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab
 [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 595F0608A5;
 Mon, 28 Nov 2022 14:46:40 -0600 (CST)
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 14:46:14 -0600
Message-Id: <20221128204614.5174-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Proofpoint-GUID: 2HtBbU-A0AKhD1_FA-n484AmYEOO8cxa
X-Proofpoint-ORIG-GUID: 2HtBbU-A0AKhD1_FA-n484AmYEOO8cxa
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211280149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=D02hl2q2nPAkYNJ5/rfcnC8vrHuaBkV3RK7Dh5VQZpM=;
 b=jdHzVYLlHiIR+lOk8Ood94YFS3iS0rOK6XbCaZDJ6+FcDupoImdIfJkZcXuclwpjnga8
 JRy3vStZ9N0iix4ZfmChqYHocwUJeA4XutRQ1L7wy/+FIAEatZULzDN0aELkx474dgCN
 4htJTEnVinmsY9p8gttTa8T16EX6oKhM9319L28n5bgpcjKXQy0pBzURKTJpI2oQ8XbS
 y2zo6Zn0w62iCYk1vAGKMuOb7QCQrteFdebhlDYpC7Hhq8146rJX5a4IChWEat/AZHXD
 E2nPOyWX4DwlSPNobwY1nsAM8Zcdf6LONefpwHZLNpYEtPb2xOtodrLKSYJSZsueJ0Ht ww== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=jdHzVYLl
Subject: [Buildroot] [PATCH 1/1] Makefile: fix SDK relocation for
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
index 8d980db3e4..8bf7ed7ad8 100644
--- a/Makefile
+++ b/Makefile
@@ -609,6 +609,7 @@ prepare-sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
 	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging
+	$(call ppd-fixup-paths,$(BASE_DIR))
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8af51f2724..f61076cddf 100644
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
index 2951e466c1..77d406fc03 100644
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
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
