Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1843C433F5
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 15:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42548405F6;
	Sun, 28 Nov 2021 15:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7FQ2gLLt0dm4; Sun, 28 Nov 2021 15:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E920409DC;
	Sun, 28 Nov 2021 15:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4426C1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 15:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26076409DC
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 15:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqFE88w6veZK for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 15:17:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD8D8405F6
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 15:17:08 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso10518605wmr.5
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 07:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHYPNsWUJq6XL36jIZPuF2xIzDdR5wEhIICTxTfqZ3E=;
 b=cjcm7avj8ovRyM4LZIRT/V0uEe9wMOR6DnyTATtnrWni8AIudFY0hEaJ99I9Sb+ie2
 Nh4WO15Bop6iWRkydrRiq287OcADApBewosjkQyXsop9SGdVi88x28eSryxZ2voiXbg5
 LP3QaByHN5MabA2ENkJ1J8OKw6MJcs5lh/1IEAVBN4Z2NBl0+SQ9IweBMasZwyHJV8GF
 dq9ophYhNMBz2PXiVxIZ0Ni770HZo0iC0n8082NVmOFrowHB4S5Rc3QW+ZZnrVFCUFqT
 MfoL8Ty8XMsX1El1ICD5tI8Q2jdUbRIT9xr7BTxufRmhFoL+lJI6M6Lvl7vSURioVddG
 ohBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHYPNsWUJq6XL36jIZPuF2xIzDdR5wEhIICTxTfqZ3E=;
 b=QDPigt0wz+Kf9ZwhiACPLKA5FYJsGijEt+TlAk2KkL5ESyDhRJqhs1gmrLppGnnuwG
 OHEPfAVAarNGm9u82LXND0n09CDAUoMD6NuH/TWGSvhYvEXmyQvJnikPFfwj2SW4nAHp
 aP9wx4e5sKT8JMyCL+XDTQQ9Rcil+c8RsABMs6IA5xhJquyO0YtHa1i2nvPM8u1JvcBo
 M4wio9gP6hdIi77YIeqpiTZZI0vvUNPVHfYwtQ3o5VAfZtPv+vurGuZ3d5pkd0dRG01C
 mGSeXsvYPBv9wcd1EE2UjbH3o4lFz0io16tvTWC6go+COxUXl/5LUv2U7GJJlMuQcnoT
 ZEGw==
X-Gm-Message-State: AOAM531V2plQFRoMaVRmbj1//dSC1lIHgWo6bSRnm+NarxDyYEn/EC5+
 qp8XZHeID4+ZMqGcCg82SAn/gUaAh7Y=
X-Google-Smtp-Source: ABdhPJwcWVs6W8AiVmULrKcCm7Nx31wb7OAHXdq7kadPSz96Z3xJ74pviaElak8zu+auEBfdqrRnlw==
X-Received: by 2002:a1c:790d:: with SMTP id l13mr31078265wme.101.1638112626764; 
 Sun, 28 Nov 2021 07:17:06 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id h15sm19806696wmq.32.2021.11.28.07.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 07:17:06 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 16:17:02 +0100
Message-Id: <20211128151703.260928-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/testing: add github download helper
 testing
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Back in 2013, a github download helper has been introduced to cope with
changes in github download-URL's [1][2].

Since then a testing infrastructure has been introduced in Buildroot
but no tests has been added to check if the github download helper is
still working.

It was reported recently [3] that the github helper doesn't work anymore
using tags. Buildroot is not the only project having the issue, see
Github feedback discussions [4].

Add tests for direct archive download (archives uploaded by maintainers),
download from a git tag and git hash using the github helper.
Make sure that Buildroot doesn't use BR2_BACKUP_SITE
(http://sources.buildroot.net).

[1] https://bugs.busybox.net/show_bug.cgi?id=6302
[2] c7c7d0697c00e45bcfad15b027f5c66005f4c005
[3] https://bugs.busybox.net/show_bug.cgi?id=14396
[4] https://github.com/github/feedback/discussions/8149

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
Currently the github-helper-tag test is failing due to [1].
---
 .../download/br2-external/github/Config.in    |  0
 .../br2-external/github/external.desc         |  1 +
 .../download/br2-external/github/external.mk  |  1 +
 .../github-helper-hash.hash                   |  3 ++
 .../github-helper-hash/github-helper-hash.mk  | 11 +++++
 .../github-helper-tag/github-helper-tag.hash  |  3 ++
 .../github-helper-tag/github-helper-tag.mk    | 11 +++++
 .../github-release/github-release.hash        |  3 ++
 .../package/github-release/github-release.mk  | 12 ++++++
 .../testing/tests/download/test_gitforge.py   | 41 +++++++++++++++++++
 10 files changed, 86 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/github/Config.in
 create mode 100644 support/testing/tests/download/br2-external/github/external.desc
 create mode 100644 support/testing/tests/download/br2-external/github/external.mk
 create mode 100644 support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash
 create mode 100644 support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk
 create mode 100644 support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash
 create mode 100644 support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk
 create mode 100644 support/testing/tests/download/br2-external/github/package/github-release/github-release.hash
 create mode 100644 support/testing/tests/download/br2-external/github/package/github-release/github-release.mk
 create mode 100644 support/testing/tests/download/test_gitforge.py

diff --git a/support/testing/tests/download/br2-external/github/Config.in b/support/testing/tests/download/br2-external/github/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/github/external.desc b/support/testing/tests/download/br2-external/github/external.desc
new file mode 100644
index 0000000000..b8beea8839
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/external.desc
@@ -0,0 +1 @@
+name: GITHUB
diff --git a/support/testing/tests/download/br2-external/github/external.mk b/support/testing/tests/download/br2-external/github/external.mk
new file mode 100644
index 0000000000..e4e5524ceb
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GITHUB_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash
new file mode 100644
index 0000000000..a941060b31
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4064739881453831bceeae81af8947cbd6c1fe03e052ac17b82ae5b3360d83f8  github-helper-hash-e2fba6457bd9d9c720540332eaf0c1f8c29eab00.tar.gz
+sha256  9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk
new file mode 100644
index 0000000000..e1fa5aabc2
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# github-helper-hash
+#
+################################################################################
+
+GITHUB_HELPER_HASH_VERSION = e2fba6457bd9d9c720540332eaf0c1f8c29eab00
+GITHUB_HELPER_HASH_SITE = $(call github,buildroot,buildroot,$(GITHUB_HELPER_HASH_VERSION))
+GITHUB_HELPER_HASH_LICENSE_FILES = COPYING
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash
new file mode 100644
index 0000000000..466d2ac401
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  959a953bbd91e6ed6db8d63a45a986400878b6bb486455231b2976218301c3d2  github-helper-tag-2021.02.tar.gz
+sha256  9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk
new file mode 100644
index 0000000000..b1ff66d817
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# github-helper-tag
+#
+################################################################################
+
+GITHUB_HELPER_TAG_VERSION = 2021.02
+GITHUB_HELPER_TAG_SITE = $(call github,buildroot,buildroot,$(GITHUB_HELPER_TAG_VERSION))
+GITHUB_HELPER_TAG_LICENSE_FILES = COPYING
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash b/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash
new file mode 100644
index 0000000000..78a25dd271
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  f4cb17b21928e36ec27de5c5294dea6ec1de4acd7ee6c56d6ecc75319cbcaefa  systemd-bootchart-233.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk b/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk
new file mode 100644
index 0000000000..34409e1cad
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# github-release
+#
+################################################################################
+
+GITHUB_RELEASE_VERSION = 233
+GITHUB_RELEASE_SITE = https://github.com/systemd/systemd-bootchart/releases/download/v$(GITHUB_RELEASE_VERSION)
+GITHUB_RELEASE_SOURCE = systemd-bootchart-$(GITHUB_RELEASE_VERSION).tar.xz
+GITHUB_RELEASE_LICENSE_FILES = LICENSE.LGPL2.1
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
new file mode 100644
index 0000000000..c2d98d0853
--- /dev/null
+++ b/support/testing/tests/download/test_gitforge.py
@@ -0,0 +1,41 @@
+import os
+import shutil
+
+import infra
+
+
+class GitforgeTestBase(infra.basetest.BRConfigTest):
+    config = \
+        """
+        BR2_BACKUP_SITE=""
+        """
+
+    def setUp(self):
+        super(GitforgeTestBase, self).setUp()
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.b and not self.keepbuilds:
+            self.b.delete()
+
+    def check_download(self, package):
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up at the end
+        dl_dir = os.path.join(self.builddir, "dl")
+        # enforce we test the download
+        if os.path.exists(dl_dir):
+            shutil.rmtree(dl_dir)
+        env = {"BR2_DL_DIR": dl_dir}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-legal-info".format(package)],
+                     env)
+
+
+class TestGitHub(GitforgeTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/github")]
+
+    def test_run(self):
+        self.check_download("github-helper-tag")
+        self.check_download("github-helper-hash")
+        self.check_download("github-release")
+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
