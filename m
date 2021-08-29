Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA10C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:47:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C5F60E74
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95C5F60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70E2D83E3E;
	Sat,  4 Sep 2021 18:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqNWgT8nSl5l; Sat,  4 Sep 2021 18:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A622983AC8;
	Sat,  4 Sep 2021 18:47:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10E9D1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEE9E40173
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xEKBiXj_Jn8K for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D735940238
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A759F8834A; Sat,  4 Sep 2021 18:23:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 11:37:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1259d40b0ab2d436fad088f4b9288b9899ef19a4
X-Git-Newrev: c938698b4a9e537d3e43c692a5c2a3a15c5d8d37
X-Patchwork-Hint: ignore
Message-Id: <20210904182356.A759F8834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests: add test for
 check_bin_arch
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c938698b4a9e537d3e43c692a5c2a3a15c5d8d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This tests build a bogus package that installs a binary built for the
host architecture into $(TARGET_DIR), which should cause a build
failure, at least as long as the host architecture isn't ARM.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
[yann.morin.1998@free.fr: drop uneeded subprocess import to fix flake8]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tests/core/br2-external/detect-bad-arch/Config.in  |  1 +
 .../core/br2-external/detect-bad-arch/external.desc    |  1 +
 .../core/br2-external/detect-bad-arch/external.mk      |  1 +
 .../detect-bad-arch/package/detect-bad-arch/Config.in  |  4 ++++
 .../package/detect-bad-arch/detect-bad-arch.mk         | 15 +++++++++++++++
 support/testing/tests/core/test_bad_arch.py            | 18 ++++++++++++++++++
 6 files changed, 40 insertions(+)

diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/Config.in b/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
new file mode 100644
index 0000000000..530c077bbe
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_DETECT_BAD_ARCH_PATH/package/detect-bad-arch/Config.in"
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/external.desc b/support/testing/tests/core/br2-external/detect-bad-arch/external.desc
new file mode 100644
index 0000000000..3c4232c90d
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/external.desc
@@ -0,0 +1 @@
+name: DETECT_BAD_ARCH
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/external.mk b/support/testing/tests/core/br2-external/detect-bad-arch/external.mk
new file mode 100644
index 0000000000..71b9821ddc
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_DETECT_BAD_ARCH_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
new file mode 100644
index 0000000000..9893e9afc1
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_DETECT_BAD_ARCH
+	bool
+	default y
+
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
new file mode 100644
index 0000000000..5e78c55f1f
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# detect-bad-arch
+#
+################################################################################
+
+define DETECT_BAD_ARCH_BUILD_CMDS
+	echo "int main(void) { return 0; }" | $(HOSTCC) -x c -o $(@D)/foo -
+endef
+
+define DETECT_BAD_ARCH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/foo $(TARGET_DIR)/usr/bin/foo
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/core/test_bad_arch.py b/support/testing/tests/core/test_bad_arch.py
new file mode 100644
index 0000000000..316231e28e
--- /dev/null
+++ b/support/testing/tests/core/test_bad_arch.py
@@ -0,0 +1,18 @@
+import infra
+import infra.basetest
+
+
+class DetectBadArchTest(infra.basetest.BRConfigTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + infra.basetest.MINIMAL_CONFIG
+    br2_external = [infra.filepath("tests/core/br2-external/detect-bad-arch")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.b.build()
+        logf_path = infra.log_file_path(self.b.builddir, "build",
+                                        infra.basetest.BRConfigTest.logtofile)
+        if logf_path:
+            s = 'ERROR: architecture for "/usr/bin/foo" is'
+            with open(logf_path, "r") as f:
+                lines = [l for l in f.readlines() if l.startswith(s)]
+            self.assertEqual(len(lines), 1)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
