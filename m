Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0700AC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 17:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79D1E81E3C;
	Wed, 23 Nov 2022 17:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D1E81E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yva-DBrcdwr; Wed, 23 Nov 2022 17:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E8581E8F;
	Wed, 23 Nov 2022 17:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E8581E8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E41F31BF5A5
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 17:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C49FE400E7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 17:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C49FE400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFDdhhjAMmwi for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 17:31:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D3440592
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08D3440592
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 17:31:58 +0000 (UTC)
Received: from pps.filterd (m0083135.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2ANHTPaV039421; Wed, 23 Nov 2022 17:31:56 GMT
Received: from xmnpv39.utc.com ([167.17.239.13])
 by mx0a-00105401.pphosted.com with ESMTP id 3m1psxgva4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Nov 2022 17:31:56 +0000
Received: from qusnwaff.utcapp.com (qusnwaff.utcapp.com [10.161.48.102])
 by xmnpv39.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2ANHVs9W150752
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Nov 2022 17:31:54 GMT
Received: from crulimr02.rockwellcollins.com ([10.172.224.19])
 by qusnwaff.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2ANHVsTk002498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 23 Nov 2022 17:31:54 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab
 [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 64264608A5;
 Wed, 23 Nov 2022 11:31:54 -0600 (CST)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:31:49 -0600
Message-Id: <20221123173149.17188-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: tMy9caTpWlv-5krsWFYsOn8wghSogXsc
X-Proofpoint-GUID: tMy9caTpWlv-5krsWFYsOn8wghSogXsc
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211230129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=+4LPQQ77slu206QXI8f4JmBxAYBPQ2wYjDCnD7J9iec=;
 b=LwgGQHQLMsHXYkdMtZI5vu3kohIJxtBS0iyXamND+b1KJ7IDTale8UEHMBONo3b0RLEx
 0bYEwZ7s2gETEGNwr30IXjglsKGsp66PyUErH1ryDBS3TnqCnq2IwT0YXuZ1Z0o/+ZFN
 EagDHWBgTH0AoiQEIKPxQr7QeTGyGdaOQD5MDVDn/snDVrT9ZvcJrZt0fjbIyss8zISh
 E1Nx1vZ0Hk2WaBfWUtu+p7sE765vW7k6Hfooa/CsmrInGgQSIbt9nNk/NatSa/osWRkw
 2QSwbHZ0xKT282Y1uRJF5WjMgLxxsSjNNBg8B202suhEqDPTtwIv84BB3ZrixJLbCG9R Ig== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=LwgGQHQL
Subject: [Buildroot] [PATCH 1/1] package/pkg-kconfig: fix bad config with
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If BR2_PER_PACKAGE_DIRECTORIES is enabled and Buildroot is using
HOST_MAKE for a Kconfig package. The $(1)_KCONFIG_RULES does not work
correctly, and kconfig-package-regen-dot-config will always run the
'oldconfig' target.

This is because $(1)_KCONFIG_RULES expands before the first recipe line
of .stamp_dotconfig. $(1)_KCONFIG_RULES attempts to call $(HOST_MAKE),
which requires that the per-package/<pkg>/host directory has been setup.
But that directory is not setup until a later recipe line. This results
in $(1)_KCONFIG_RULES silently failing, and so always configuring with
'oldconfig'.

Fix the issue by calling the command as part of the recipe, so
$(HOST_MAKE) will be ready in time. As the comment on $(1)_KCONFIG_RULES
describes, we should not use backticks. Use an intermediary file to
store the output of the command, so that backticks are not needed.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/pkg-kconfig.mk | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 32dcfea0bc..f4f35bf96a 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -45,11 +45,16 @@ endef
 # only, as this can fail in complex cases.
 # $(1): the name of the package in upper-case letters
 define kconfig-package-regen-dot-config
-	$(if $(filter olddefconfig,$($(1)_KCONFIG_RULES)),
-		$(Q)$($(1)_KCONFIG_MAKE) olddefconfig,
-		$(if $(filter oldnoconfig,$($(1)_KCONFIG_RULES)),
-			$(Q)$($(1)_KCONFIG_MAKE) oldnoconfig,
-			$(Q)(yes "" | $($(1)_KCONFIG_MAKE) oldconfig)))
+	$(Q)[ -e $($(1)_DIR)/.br_regen_dot_config ] || \
+		$($(1)_KCONFIG_MAKE) -pn config 2>/dev/null \
+		| sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d' >$($(1)_DIR)/.br_regen_dot_config
+	$(Q)if grep -q '\bolddefconfig\b' $($(1)_DIR)/.br_regen_dot_config; then \
+		$($(1)_KCONFIG_MAKE) olddefconfig; \
+	elif grep -q '\boldnoconfig\b' $($(1)_DIR)/.br_regen_dot_config; then \
+		$($(1)_KCONFIG_MAKE) oldnoconfig; \
+	else \
+		yes "" | $($(1)_KCONFIG_MAKE) oldconfig; \
+	fi
 endef
 
 # Macro to create a .config file where all given fragments are merged into.
@@ -147,19 +152,6 @@ $(2)_KCONFIG_MAKE = \
 	$$($(2)_MAKE_ENV) $$($(2)_MAKE) -C $$($(2)_DIR) \
 		$$(PKG_KCONFIG_COMMON_OPTS) $$($(2)_KCONFIG_OPTS)
 
-# $(2)_KCONFIG_MAKE may already rely on shell expansion. As the $() syntax
-# of the shell conflicts with Make's own syntax, this means that backticks
-# are used with those shell constructs. Unfortunately, the backtick syntax
-# does not nest, and we need to use Make instead of the shell to handle
-# conditions.
-
-# A recursively expanded variable is necessary, to be sure that the shell
-# command is called when the rule is processed during the build and not
-# when the rule is created when parsing all packages.
-$(2)_KCONFIG_RULES = \
-	$$(shell $$($(2)_KCONFIG_MAKE) -pn config 2>/dev/null | \
-		sed 's/^\([_0-9a-zA-Z]*config\):.*/\1/ p; d')
-
 # The specified source configuration file and any additional configuration file
 # fragments are merged together to .config, after the package has been patched.
 # Since the file could be a defconfig file it needs to be expanded to a
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
