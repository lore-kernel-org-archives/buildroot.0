Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5750ECCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 12:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F33E240FEB;
	Sun, 12 Oct 2025 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qIUBCCAkSMR; Sun, 12 Oct 2025 12:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 007E940FE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007E940FE4;
	Sun, 12 Oct 2025 12:39:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD4BBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 12:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5A3840FE3
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 12:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlUA2iGKpQjg for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 12:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF4A040FDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4A040FDA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF4A040FDA
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 12:39:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.106.214]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysVs-1uKvb814mg-00qs1K; Sun, 12
 Oct 2025 14:39:12 +0200
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 12 Oct 2025 14:38:52 +0200
Message-ID: <20251012123853.3862795-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:1QD53OHxjI1t1dvN/G62bQ16avIb89l2/9P9uQsLeDUOSwoi5gK
 9aDI88XwLbK2JqtU9CvWssp1+uYvswGhRss/gf/um1Q7zU6GNKvC8hlGVJifmHO0P/+ntl9
 ruvPw8GrU6rp/UR8Mpyuxz/2/qz61bYS7BH587Kzcf42l6+2aIGdcUMV3tWsHUtu9M2JblF
 2vEsawge4Kf+FQo0slCHg==
UI-OutboundReport: notjunk:1;M01:P0:2B8418GQ0OE=;7nBqHn+6zFd5ulRuxJ9A0cqRtBL
 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
 6bBm0GZz2UIzFXeyoUNhsE9nZr19wFpkFVr63y
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760272752; x=1760877552; i=fiona.klute@gmx.de;
 bh=btGxhdFBJYDah6mGspguy9QQIGE2WIxkwCTX3E2A+S4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=P2nkes7Xt80vNlvzumAYBzAUIorCx+ftaAh+hTfjZU0CimP0QpYsjKu+r3pULmz9
 TY72YZTrcKMrhFzzxlixIEQ2gjb7/8Ybj9KUYXNxPWJ1mePgCnh1M9ZsGivl5vL4n
 NuiDT4TF9h5H7KVS72TBojeaPEqrGovqZs10C5ZFiRLI/16ocdnxQSsc0ELAEg1oj
 yk+M47Pmt5ct//fTVRZcdIE+pCG8ciE3noS55wvQ3P0jJoLvMGXzkldujf8sAJKdI
 GquTED91bGLpax1/DRVBLeQGU5ZrUM7pQ/QCku1OoGR9JmveUqt/bMH5Js8XZYDDf
 of7VpNlzyTlaO8gnrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=P2nkes7X
Subject: [Buildroot] [PATCH v2 1/1] package/refpolicy: add option to set
 policy booleans
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Policy booleans allow adjusting certain policy rules at runtime
(including whether changing policy booleans is allowed). The new
option allows setting their defaults at build time.

A monolithic policy (like built by package/refpolicy) does not support
persistent changes to policy booleans, so changing the defaults is
required to make changes across boots. Adjusting policy/booleans.conf
after "make conf" is intended for that purpose [1, 2].

[1] https://github.com/SELinuxProject/refpolicy/pull/355#issuecomment-792758725
[2] https://github.com/SELinuxProject/refpolicy/blob/4d97523c71603b12e92cf1b80cd0e01ac75bc067/README#L186-L191

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Avoid make "let" function for compatibility with GNU Make <4.4
* Add a runtime test

 package/refpolicy/Config.in                | 13 +++++++++++++
 package/refpolicy/refpolicy.mk             | 10 ++++++++++
 support/testing/tests/core/test_selinux.py | 18 ++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 242d7f34e0..f330c685ab 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -121,6 +121,19 @@ config BR2_REFPOLICY_EXTRA_MODULES
 
 endif
 
+config BR2_REFPOLICY_SET_BOOLEANS
+	string "Set policy booleans"
+	help
+	  Set default values for policy booleans before compiling the
+	  policy (see policy/booleans.conf in the refpolicy
+	  README). The value of this option is a space separated list
+	  of either plain names (to set that boolean to true), or
+	  "name=(true|false)" pairs (to set the given value).
+
+	  Boolean values can still be changed at runtime if the policy
+	  permits, but such changes cannot be persisted with a
+	  monolithic policy.
+
 config BR2_REFPOLICY_ENABLEAUDIT
 	bool "remove dontaudit rules from policy (debugging only)"
 	help
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 698f38f738..c5d8ce3b57 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -107,6 +107,15 @@ define REFPOLICY_CONFIGURE_ENABLEAUDIT
 endef
 endif
 
+# Override defaults for policy booleans. name=(true|false) will result
+# in the given value, just a name implies "true".
+define REFPOLICY_CONFIGURE_BOOLEANS
+	$(foreach b,$(call qstrip,$(BR2_REFPOLICY_SET_BOOLEANS)),
+		read -r name value < <(echo "$(subst =, ,$(b))"); \
+		$(SED) "/^$${name} =/c\\$${name} = $${value:-true}" $(@D)/policy/booleans.conf
+	)
+endef
+
 define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
 		$(@D)/build.conf
@@ -119,6 +128,7 @@ define REFPOLICY_CONFIGURE_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) bare conf
 	$(REFPOLICY_CONFIGURE_ENABLEAUDIT)
 	$(REFPOLICY_CONFIGURE_MODULES)
+	$(REFPOLICY_CONFIGURE_BOOLEANS)
 endef
 
 define REFPOLICY_BUILD_CMDS
diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index 683a424d6f..e72431211d 100644
--- a/support/testing/tests/core/test_selinux.py
+++ b/support/testing/tests/core/test_selinux.py
@@ -51,6 +51,24 @@ class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
         self.assertEqual(out[2].strip(), "buildroot_test_t")
 
 
+class TestSELinuxSetBooleans(TestSELinuxInfra):
+    config = TestSELinuxInfra.config + \
+        """
+        BR2_REFPOLICY_SET_BOOLEANS="user_dmesg user_all_users_send_syslog=false"
+        """
+
+    def test_run(self):
+        TestSELinuxInfra.base_test_run(self)
+
+        out, ret = self.emulator.run("seinfo -x -b", 15)
+        self.assertEqual(ret, 0)
+        # lines follow the pattern "name (true|false);", plus indentation
+        bools = dict(line.strip().rstrip(';').split()[1:] for line in out[2:])
+        # both of these booleans have the opposite default in refpolicy
+        self.assertEqual(bools["user_dmesg"], "true")
+        self.assertEqual(bools["user_all_users_send_syslog"], "false")
+
+
 class TestSELinuxCustomGit(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
         """
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
