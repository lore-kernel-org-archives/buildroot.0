From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 11 May 2018 23:58:31 -0300
Subject: [Buildroot] [PATCH v5 08/10] testing/tests/download: test git tag
In-Reply-To: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
References: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
Message-ID: <20180512025833.22998-9-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

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
---
Layout of static repo with the series applied until this patch:
 $ git -C support/testing/tests/download/git-remote/repo.git \
   log --all --decorate --graph --oneline --decorate
 * 2fa37f6 (submodule) sub0-2
 * a9dbc1e sub0-1
 | * 68c197d (mybranch) branch2
 | * 3174063 branch1
 |/
 | * 516c9c5 (tag: mytag) tag2
 | * 46bae5b tag1
 |/
 * a238b1d (HEAD -> master) initial

Changes v4 -> v5:
  - no changes

Changes v1 -> v4:
  - not included on v2 or v3;
  - rewrite from v1 using new git test infra with static repo;
---
 .../git-partial-sha1-reachable-by-tag.hash        |   2 ++
 .../git-partial-sha1-reachable-by-tag.mk          |  11 +++++++++++
 .../git-partial-sha1-tag-itself.hash              |   2 ++
 .../git-partial-sha1-tag-itself.mk                |  11 +++++++++++
 .../git-partial-sha1-tag-points-to.hash           |   2 ++
 .../git-partial-sha1-tag-points-to.mk             |  11 +++++++++++
 .../git-sha1-reachable-by-tag.hash                |   2 ++
 .../git-sha1-reachable-by-tag.mk                  |  11 +++++++++++
 .../git-sha1-tag-itself/git-sha1-tag-itself.hash  |   2 ++
 .../git-sha1-tag-itself/git-sha1-tag-itself.mk    |  11 +++++++++++
 .../git-sha1-tag-points-to.hash                   |   2 ++
 .../git-sha1-tag-points-to.mk                     |  11 +++++++++++
 .../git-refs/package/git-tag/git-tag.hash         |   2 ++
 .../git-refs/package/git-tag/git-tag.mk           |  11 +++++++++++
 .../2b/0e0d98a49c97da6a618ab36337e2058eb733a2     | Bin 0 -> 137 bytes
 .../46/bae5b639e5a18e2cc4dc508f080d566baeff59     | Bin 0 -> 182 bytes
 .../51/6c9c5f64ec66534d4d069c2e408d9ae4dce023     | Bin 0 -> 182 bytes
 .../92/ef85be57d627f280d8ce3724452ac21c9a6452     | Bin 0 -> 20 bytes
 .../cf/0f4f85d7a1237e377a2d25b996518a877ea001     | Bin 0 -> 49 bytes
 .../e2/2695cbf976fed1f543ad7486a531c0af473482     | Bin 0 -> 49 bytes
 .../f6/476b879f65e956d7dedd5b08736369e9a24acc     | Bin 0 -> 20 bytes
 .../download/git-remote/repo.git/refs/tags/mytag  |   1 +
 support/testing/tests/download/test_git.py        |   7 +++++++
 23 files changed, 99 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/2b/0e0d98a49c97da6a618ab36337e2058eb733a2
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/46/bae5b639e5a18e2cc4dc508f080d566baeff59
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/51/6c9c5f64ec66534d4d069c2e408d9ae4dce023
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/92/ef85be57d627f280d8ce3724452ac21c9a6452
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/cf/0f4f85d7a1237e377a2d25b996518a877ea001
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/e2/2695cbf976fed1f543ad7486a531c0af473482
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/f6/476b879f65e956d7dedd5b08736369e9a24acc
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/tags/mytag

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
index 0000000000000000000000000000000000000000..39c913094a3f2d8d9d84cda13a89306bc577f982
GIT binary patch
literal 137
zcmV;40CxX)0Y#2W4gw(%1zmHBzJQY+enMi57jWYZuxSY at gF!ZPdoi<c^HQlr<@JzY
zHfmRI52g-gw&cm&t!A>;C>?b~>q)Xk7kywIiBT%i*Ea*zQgRo4G|D>mM~NF;Gldo_
rTte%4q564dIJQkr<uA{vg#4OD<}^;=!5b&h!5$T&5L at yK5lk}^QNuc<

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/46/bae5b639e5a18e2cc4dc508f080d566baeff59 b/support/testing/tests/download/git-remote/repo.git/objects/46/bae5b639e5a18e2cc4dc508f080d566baeff59
new file mode 100644
index 0000000000000000000000000000000000000000..3bf8865ea67386bd0fd88ab7222392d5b66b3607
GIT binary patch
literal 182
zcmV;n07?IN0j<t4ZUZ3 at KvCD6f(xw0FyLXMDDnl;#3z_#V2u)%2$RCMx1|*BEw``u
z`mxnohDM9K(Noefo9uG%LJSruArV`#ewpWkhrod-u`!^2xu<Ptwip(W93@yUjwGPt
zjL}<*4k!i(AhQw0f8*S`{wk5XH2ukalr6T)chT?tANTcv$F*|#*~eBtG<ZX^4{-2$
kGH8st>wS8p7v<F86_h%abxSg}oTugb_ROie0nJ8hV&q3%KL7v#

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/51/6c9c5f64ec66534d4d069c2e408d9ae4dce023 b/support/testing/tests/download/git-remote/repo.git/objects/51/6c9c5f64ec66534d4d069c2e408d9ae4dce023
new file mode 100644
index 0000000000000000000000000000000000000000..0bda23ab4d6487524fc254c54b673e53bfe69435
GIT binary patch
literal 182
zcmV;n07?IN0j<tUP6IIzMN!6Hg*VWVf8`HCQ8vJYtf0DFZmi%oa-0FXClLeYi0OIK
z)1}^8ozfcnGzYU}V|)TyOA5Yl)&-o!99;AWR+GZwf_2e|PaM2Y>HLZetG9^(b!0>2
zGJ%RkMU}xn=29RDyv_GM<Xa^ixyx4^v+mTdmnvVz4<6btp0<Yd<3PO~r3MueL>;VL
klvPUH^&UO>pYFuO%?NR>+s=9Er7Y{$^IuBEH_8ueWztGniU0rr

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/92/ef85be57d627f280d8ce3724452ac21c9a6452 b/support/testing/tests/download/git-remote/repo.git/objects/92/ef85be57d627f280d8ce3724452ac21c9a6452
new file mode 100644
index 0000000000000000000000000000000000000000..1f2474ba3209802c0f297f390eb517b4419621f9
GIT binary patch
literal 20
bcmb<m^geacKgb|e!_&w72@`|F8|EAUOXLRI

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/cf/0f4f85d7a1237e377a2d25b996518a877ea001 b/support/testing/tests/download/git-remote/repo.git/objects/cf/0f4f85d7a1237e377a2d25b996518a877ea001
new file mode 100644
index 0000000000000000000000000000000000000000..fd224552518d57b0b8b0a1d618eef507f798555f
GIT binary patch
literal 49
zcmV-10M7q-0V^p=O;s>9VlXr?Ff%bxNXyJgWtjB7bzk^3^-m2q&Y7#YY8{f9l at bI1
H7n%=ExH=M#

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/e2/2695cbf976fed1f543ad7486a531c0af473482 b/support/testing/tests/download/git-remote/repo.git/objects/e2/2695cbf976fed1f543ad7486a531c0af473482
new file mode 100644
index 0000000000000000000000000000000000000000..15d80c78fac8655d4dfe4b8b543076c8bd26408e
GIT binary patch
literal 49
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5^~bY$ckS%Irr!8kUB1||YqD{?-X|+&2Jxc;
FIRMOk6Sn{W

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/f6/476b879f65e956d7dedd5b08736369e9a24acc b/support/testing/tests/download/git-remote/repo.git/objects/f6/476b879f65e956d7dedd5b08736369e9a24acc
new file mode 100644
index 0000000000000000000000000000000000000000..ee01041e0abcefa3c783ef3fc91e31c33edfb7cf
GIT binary patch
literal 20
bcmb<m^geacKgb|e!_&w75fg*NJLX&fOWg+C

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/tags/mytag b/support/testing/tests/download/git-remote/repo.git/refs/tags/mytag
new file mode 100644
index 0000000000..8c09448ad2
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/tags/mytag
@@ -0,0 +1 @@
+2b0e0d98a49c97da6a618ab36337e2058eb733a2
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 803a50d054..ce3655121c 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -67,7 +67,14 @@ class TestGitRefs(GitTestBase):
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
-- 
2.17.0
