Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45671C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2252404B1;
	Mon,  6 Dec 2021 21:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiIJhSYiINzw; Mon,  6 Dec 2021 21:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA08E404B9;
	Mon,  6 Dec 2021 21:25:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DBB91BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07520404BD
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGusuaDS0he6 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F2AE404B9
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D326581422; Mon,  6 Dec 2021 21:19:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 22:12:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5
X-Git-Newrev: 8cce2ce1d253bc7f87e136a3286c186d4126202d
X-Patchwork-Hint: ignore
Message-Id: <20211206211935.D326581422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add gitlab download
 helper testing
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cce2ce1d253bc7f87e136a3286c186d4126202d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like for the github helper, add some tests to test the download of
Gitlab's generated tarball.

[1] f83826c90daf9cdb5a6196d2d2830eea8c2f0e09

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/download/br2-external/gitlab/Config.in |  0
 .../testing/tests/download/br2-external/gitlab/external.desc |  1 +
 .../testing/tests/download/br2-external/gitlab/external.mk   |  1 +
 .../package/gitlab-helper-hash/gitlab-helper-hash.hash       |  3 +++
 .../gitlab/package/gitlab-helper-hash/gitlab-helper-hash.mk  | 12 ++++++++++++
 .../gitlab/package/gitlab-helper-tag/gitlab-helper-tag.hash  |  3 +++
 .../gitlab/package/gitlab-helper-tag/gitlab-helper-tag.mk    | 11 +++++++++++
 .../gitlab/package/gitlab-release/gitlab-release.hash        |  3 +++
 .../gitlab/package/gitlab-release/gitlab-release.mk          | 12 ++++++++++++
 support/testing/tests/download/test_gitforge.py              |  8 ++++++++
 10 files changed, 54 insertions(+)

diff --git a/support/testing/tests/download/br2-external/gitlab/Config.in b/support/testing/tests/download/br2-external/gitlab/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/gitlab/external.desc b/support/testing/tests/download/br2-external/gitlab/external.desc
new file mode 100644
index 0000000000..eafc8a43ff
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/external.desc
@@ -0,0 +1 @@
+name: GITLAB
diff --git a/support/testing/tests/download/br2-external/gitlab/external.mk b/support/testing/tests/download/br2-external/gitlab/external.mk
new file mode 100644
index 0000000000..8de1203231
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GITLAB_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.hash b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.hash
new file mode 100644
index 0000000000..79684e9742
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  28f3b63454a7de6d8fb154dfa1e2e203afeb34db006661329e273137f8fe3dce  gitlab-helper-hash-21a378a7858460809ffef1c96a07a493d709730c.tar.gz
+sha256  309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.mk b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.mk
new file mode 100644
index 0000000000..44a156118e
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-hash/gitlab-helper-hash.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# gitlab-helper-hash
+#
+################################################################################
+
+GITLAB_HELPER_HASH_VERSION = 21a378a7858460809ffef1c96a07a493d709730c
+GITLAB_HELPER_HASH_SITE = $(call gitlab,solarus-games,solarus,$(GITLAB_HELPER_HASH_VERSION))
+
+GITLAB_HELPER_HASH_LICENSE_FILES = license.txt
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.hash b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.hash
new file mode 100644
index 0000000000..1c50bc3c8f
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ef08b22999431b7f81f9b74408221b8a5a3ab5b0f646a835443a3c37cb2fb979  gitlab-helper-tag-1.6.5.tar.gz
+sha256  309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.mk b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.mk
new file mode 100644
index 0000000000..fb2fc49c82
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-helper-tag/gitlab-helper-tag.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# gitlab-helper-tag
+#
+################################################################################
+
+GITLAB_HELPER_TAG_VERSION = 1.6.5
+GITLAB_HELPER_TAG_SITE = $(call gitlab,solarus-games,solarus,v$(GITLAB_HELPER_TAG_VERSION))
+GITLAB_HELPER_TAG_LICENSE_FILES = license.txt
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash
new file mode 100644
index 0000000000..7031d1b34a
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 12b88efa4d0d95af08db05a50b3dcb217c0eb2bfc67b483779e33d498ddb2f95  iucode-tool_2.3.1.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.mk b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.mk
new file mode 100644
index 0000000000..2510ac634b
--- /dev/null
+++ b/support/testing/tests/download/br2-external/gitlab/package/gitlab-release/gitlab-release.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# gitlab-release
+#
+################################################################################
+
+GITLAB_RELEASE_VERSION = 2.3.1
+GITLAB_RELEASE_SITE = https://gitlab.com/iucode-tool/releases/raw/master
+GITLAB_RELEASE_SOURCE = iucode-tool_$(GITLAB_RELEASE_VERSION).tar.xz
+GITLAB_RELEASE_LICENSE_FILES = COPYING
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
index c2d98d0853..e1ac35ec67 100644
--- a/support/testing/tests/download/test_gitforge.py
+++ b/support/testing/tests/download/test_gitforge.py
@@ -39,3 +39,11 @@ class TestGitHub(GitforgeTestBase):
         self.check_download("github-helper-hash")
         self.check_download("github-release")
 
+
+class TestGitLab(GitforgeTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/gitlab")]
+
+    def test_run(self):
+        self.check_download("gitlab-helper-hash")
+        self.check_download("gitlab-helper-tag")
+        self.check_download("gitlab-release")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
