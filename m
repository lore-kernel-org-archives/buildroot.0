From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 10:57:26 +0100
Subject: [Buildroot] [git commit] testing/tests/download: test git tag
Message-ID: <20190206095622.406298385C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed3cda38cd533ffae68258ca5586c3df4789c120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a tag to the static repo and check on the git refs test case the
download of a git package:
 - with the name of a tag as version;
 - with the sha1 of a tag itself as version;
 - with the partial sha1 of a tag itself as version;
 - with the sha1 of a commit pointed by a tag as version;
 - with the partial sha1 of a commit pointed by a tag as version;
 - with the sha1 of a commit reachable only by a tag as version;
 - with the partial sha1 of a commit reachable only by a tag as version.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../git-partial-sha1-reachable-by-tag.hash                 |   2 ++
 .../git-partial-sha1-reachable-by-tag.mk                   |  11 +++++++++++
 .../git-partial-sha1-tag-itself.hash                       |   2 ++
 .../git-partial-sha1-tag-itself.mk                         |  11 +++++++++++
 .../git-partial-sha1-tag-points-to.hash                    |   2 ++
 .../git-partial-sha1-tag-points-to.mk                      |  11 +++++++++++
 .../git-sha1-reachable-by-tag.hash                         |   2 ++
 .../git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk |  11 +++++++++++
 .../package/git-sha1-tag-itself/git-sha1-tag-itself.hash   |   2 ++
 .../package/git-sha1-tag-itself/git-sha1-tag-itself.mk     |  11 +++++++++++
 .../git-sha1-tag-points-to/git-sha1-tag-points-to.hash     |   2 ++
 .../git-sha1-tag-points-to/git-sha1-tag-points-to.mk       |  11 +++++++++++
 .../br2-external/git-refs/package/git-tag/git-tag.hash     |   2 ++
 .../br2-external/git-refs/package/git-tag/git-tag.mk       |  11 +++++++++++
 .../objects/2b/0e0d98a49c97da6a618ab36337e2058eb733a2      |   1 +
 .../objects/46/bae5b639e5a18e2cc4dc508f080d566baeff59      |   1 +
 .../objects/51/6c9c5f64ec66534d4d069c2e408d9ae4dce023      |   2 ++
 .../objects/92/ef85be57d627f280d8ce3724452ac21c9a6452      | Bin 0 -> 20 bytes
 .../objects/cf/0f4f85d7a1237e377a2d25b996518a877ea001      | Bin 0 -> 49 bytes
 .../objects/e2/2695cbf976fed1f543ad7486a531c0af473482      | Bin 0 -> 49 bytes
 .../objects/f6/476b879f65e956d7dedd5b08736369e9a24acc      | Bin 0 -> 20 bytes
 .../tests/download/git-remote/repo.git/refs/tags/mytag     |   1 +
 support/testing/tests/download/test_git.py                 |   7 +++++++
 23 files changed, 103 insertions(+)

diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
new file mode 100644
index 0000000000..7696086690
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
@@ -0,0 +1,2 @@
+sha256  f2ef9772f13a9ef9a2c7cde0795e179defb12320d1747fc8d2408748ef5844c2  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4.tar.gz
+sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.mk b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.mk
new file mode 100644
index 0000000000..05aa659dd2
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-partial-sha1-reachable-by-tag
+#
+################################################################################
+
+GIT_PARTIAL_SHA1_REACHABLE_BY_TAG_VERSION = 46bae5b639e5a18e2cc4
+GIT_PARTIAL_SHA1_REACHABLE_BY_TAG_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_PARTIAL_SHA1_REACHABLE_BY_TAG_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
new file mode 100644
index 0000000000..e627caf91e
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
@@ -0,0 +1,2 @@
+sha256  721143b41b8e56cfd9025833f1602e900a490627db2504e5b4907baa23e0019e  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61.tar.gz
+sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.mk b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.mk
new file mode 100644
index 0000000000..515492397e
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-partial-sha1-tag-itself
+#
+################################################################################
+
+GIT_PARTIAL_SHA1_TAG_ITSELF_VERSION = 2b0e0d98a49c97da6a61
+GIT_PARTIAL_SHA1_TAG_ITSELF_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_PARTIAL_SHA1_TAG_ITSELF_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
new file mode 100644
index 0000000000..f957a0e23c
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
@@ -0,0 +1,2 @@
+sha256  0fbf7fe935f962ceaafcf8e0ffd25dd2a83752c3f0fd055a942a53f8c9235fa7  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d.tar.gz
+sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.mk b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.mk
new file mode 100644
index 0000000000..c810e81175
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-partial-sha1-tag-points-to
+#
+################################################################################
+
+GIT_PARTIAL_SHA1_TAG_POINTS_TO_VERSION = 516c9c5f64ec66534d4d
+GIT_PARTIAL_SHA1_TAG_POINTS_TO_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_PARTIAL_SHA1_TAG_POINTS_TO_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
new file mode 100644
index 0000000000..0eb0ca0917
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
@@ -0,0 +1,2 @@
+sha256  9b20256a3058221a8e91031f11700d9945ea84e8f328fa8e42e1cb9f7a30e3b2  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59.tar.gz
+sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk
new file mode 100644
index 0000000000..b5fde7b586
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-sha1-reachable-by-tag
+#
+################################################################################
+
+GIT_SHA1_REACHABLE_BY_TAG_VERSION = 46bae5b639e5a18e2cc4dc508f080d566baeff59
+GIT_SHA1_REACHABLE_BY_TAG_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SHA1_REACHABLE_BY_TAG_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
new file mode 100644
index 0000000000..48c1348538
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
@@ -0,0 +1,2 @@
+sha256  7d301c1a1054d6aee49193ca9e938f4da561ff73fb01719662865aa38bdc4361  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2.tar.gz
+sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.mk b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.mk
new file mode 100644
index 0000000000..8914496653
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-sha1-tag-itself
+#
+################################################################################
+
+GIT_SHA1_TAG_ITSELF_VERSION = 2b0e0d98a49c97da6a618ab36337e2058eb733a2
+GIT_SHA1_TAG_ITSELF_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SHA1_TAG_ITSELF_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
new file mode 100644
index 0000000000..3dcafc2094
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
@@ -0,0 +1,2 @@
+sha256  c1f9f5734529a31140a71c031534460811f001b4db37d26833f386358150ab47  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023.tar.gz
+sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.mk b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.mk
new file mode 100644
index 0000000000..adaae7329c
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-sha1-tag-points-to
+#
+################################################################################
+
+GIT_SHA1_TAG_POINTS_TO_VERSION = 516c9c5f64ec66534d4d069c2e408d9ae4dce023
+GIT_SHA1_TAG_POINTS_TO_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SHA1_TAG_POINTS_TO_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
new file mode 100644
index 0000000000..1cd0b15f27
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
@@ -0,0 +1,2 @@
+sha256  85dcb5bcf9bed496688d0eb01c7a3ce05c5b46b984cc1e9e76a6dbefd976e6b3  git-tag-mytag.tar.gz
+sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.mk b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.mk
new file mode 100644
index 0000000000..6960ceb2cb
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-tag
+#
+################################################################################
+
+GIT_TAG_VERSION = mytag
+GIT_TAG_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_TAG_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/2b/0e0d98a49c97da6a618ab36337e2058eb733a2 b/support/testing/tests/download/git-remote/repo.git/objects/2b/0e0d98a49c97da6a618ab36337e2058eb733a2
new file mode 100644
index 0000000000..39c913094a
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/objects/2b/0e0d98a49c97da6a618ab36337e2058eb733a2
@@ -0,0 +1 @@
+xE?K!]s????~Bb?p??i	*?A6s{1?p?R?E???`6jWo?f?????f??(uD?I?F}`?Q*??7?Rr}4?:?G?\3?+\B?y??yf8?MN?/?????F?4N??'???[?L3
\ No newline at end of file
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/46/bae5b639e5a18e2cc4dc508f080d566baeff59 b/support/testing/tests/download/git-remote/repo.git/objects/46/bae5b639e5a18e2cc4dc508f080d566baeff59
new file mode 100644
index 0000000000..3bf8865ea6
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/objects/46/bae5b639e5a18e2cc4dc508f080d566baeff59
@@ -0,0 +1 @@
+x??1n!@Q?????0?a?(???'?e`????????-??????Z?F???S?1??r?B)![?~??????(?1?~??mh??%X/?$????[?( ??????*??4??}?-??w????????r???V?4xC?p?z2h???}z?????:?uK2??????????Fkb
\ No newline at end of file
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/51/6c9c5f64ec66534d4d069c2e408d9ae4dce023 b/support/testing/tests/download/git-remote/repo.git/objects/51/6c9c5f64ec66534d4d069c2e408d9ae4dce023
new file mode 100644
index 0000000000..0bda23ab4d
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/objects/51/6c9c5f64ec66534d4d069c2e408d9ae4dce023
@@ -0,0 +1,2 @@
+x??KN1EQ?^?7???BQ6?????\n??6r??'???y????Z???4?dc|ZK
+?p???\?V????u??O?O??????udC?2??EE????R 	???>?[%??W?????*_??/?????@??D?\?UJ??=??????q???y??,???_J?7?le
\ No newline at end of file
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/92/ef85be57d627f280d8ce3724452ac21c9a6452 b/support/testing/tests/download/git-remote/repo.git/objects/92/ef85be57d627f280d8ce3724452ac21c9a6452
new file mode 100644
index 0000000000..1f2474ba32
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/92/ef85be57d627f280d8ce3724452ac21c9a6452 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/cf/0f4f85d7a1237e377a2d25b996518a877ea001 b/support/testing/tests/download/git-remote/repo.git/objects/cf/0f4f85d7a1237e377a2d25b996518a877ea001
new file mode 100644
index 0000000000..fd22455251
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/cf/0f4f85d7a1237e377a2d25b996518a877ea001 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/e2/2695cbf976fed1f543ad7486a531c0af473482 b/support/testing/tests/download/git-remote/repo.git/objects/e2/2695cbf976fed1f543ad7486a531c0af473482
new file mode 100644
index 0000000000..15d80c78fa
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/e2/2695cbf976fed1f543ad7486a531c0af473482 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/f6/476b879f65e956d7dedd5b08736369e9a24acc b/support/testing/tests/download/git-remote/repo.git/objects/f6/476b879f65e956d7dedd5b08736369e9a24acc
new file mode 100644
index 0000000000..ee01041e0a
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/f6/476b879f65e956d7dedd5b08736369e9a24acc differ
diff --git a/support/testing/tests/download/git-remote/repo.git/refs/tags/mytag b/support/testing/tests/download/git-remote/repo.git/refs/tags/mytag
new file mode 100644
index 0000000000..8c09448ad2
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/tags/mytag
@@ -0,0 +1 @@
+2b0e0d98a49c97da6a618ab36337e2058eb733a2
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 723f00d188..2455557298 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -68,7 +68,14 @@ class TestGitRefs(GitTestBase):
             self.check_download("git-wrong-sha1")
         self.check_download("git-partial-sha1-branch-head")
         self.check_download("git-partial-sha1-reachable-by-branch")
+        self.check_download("git-partial-sha1-reachable-by-tag")
+        self.check_download("git-partial-sha1-tag-itself")
+        self.check_download("git-partial-sha1-tag-points-to")
         self.check_download("git-sha1-branch-head")
         self.check_download("git-sha1-reachable-by-branch")
+        self.check_download("git-sha1-reachable-by-tag")
+        self.check_download("git-sha1-tag-itself")
+        self.check_download("git-sha1-tag-points-to")
         self.check_download("git-submodule-disabled")
         self.check_download("git-submodule-enabled")
+        self.check_download("git-tag")
