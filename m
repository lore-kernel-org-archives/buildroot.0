From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 11:33:48 -0300
Subject: [Buildroot] [PATCH v4] testing/tests/download: test git branch with
 slash
In-Reply-To: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
References: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
Message-ID: <20180429143349.24010-12-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Add a branch with slash in its name (often called feature branch) to the
static repo and check on the git refs test case the download of a git
package:
 - with the name of a branch with slash as version.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Layout of static repo with the series applied until this patch:
 $ git -C support/testing/tests/download/git-remote/repo.git \
   log --all --decorate --graph --oneline --decorate
 * ce5d9d4 (myfeature/mybranch) feature/branch
 | * 2fa37f6 (submodule) sub0-2
 | * a9dbc1e sub0-1
 |/
 | * b72ff60 (refs/changes/01/1/2) specialref
 |/
 | * a8f7364 (tag: mybranchandtag) tag
 |/
 | * 83e0f40 (mybranchandtag) branch
 |/
 | * 68c197d (mybranch) branch2
 | * 3174063 branch1
 |/
 | * 516c9c5 (tag: mytag) tag2
 | * 46bae5b tag1
 |/
 * a238b1d (HEAD -> master) initial

Changes v1 -> v4:
  - not included on v2 or v3;
  - rewrite from v1 using new git test infra with static repo;
---
 .../git-branch-with-slash/git-branch-with-slash.hash      |   2 ++
 .../git-branch-with-slash/git-branch-with-slash.mk        |  11 +++++++++++
 .../objects/b8/5af389ad1ce39dfb897f8403b12f8d830053f2     | Bin 0 -> 49 bytes
 .../objects/ce/5d9d43cc09b37eb0ebe677b18f81933b950b60     | Bin 0 -> 187 bytes
 .../objects/ed/aa7c3edd6ff3866f476824babd820ae42f1040     | Bin 0 -> 31 bytes
 .../git-remote/repo.git/refs/heads/myfeature/mybranch     |   1 +
 support/testing/tests/download/test_git.py                |   1 +
 7 files changed, 15 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-branch-with-slash/git-branch-with-slash.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-branch-with-slash/git-branch-with-slash.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/b8/5af389ad1ce39dfb897f8403b12f8d830053f2
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/ce/5d9d43cc09b37eb0ebe677b18f81933b950b60
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/ed/aa7c3edd6ff3866f476824babd820ae42f1040
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/heads/myfeature/mybranch

diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-branch-with-slash/git-branch-with-slash.hash b/support/testing/tests/download/br2-external/git-refs/package/git-branch-with-slash/git-branch-with-slash.hash
new file mode 100644
index 0000000000..c1357f994f
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-branch-with-slash/git-branch-with-slash.hash
@@ -0,0 +1,2 @@
+sha256  3a4012781e10f4fb29863683c1ca913e94c3472ab3ce9289a95173bb41827d3c  git-branch-with-slash-myfeature_mybranch.tar.gz
+sha256  7352fd35e0917ad431ec18051e641a4ca1b6ac8b8d523384040346d70a7f0efc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-branch-with-slash/git-branch-with-slash.mk b/support/testing/tests/download/br2-external/git-refs/package/git-branch-with-slash/git-branch-with-slash.mk
new file mode 100644
index 0000000000..d39ab246c6
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-branch-with-slash/git-branch-with-slash.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-branch-with-slash
+#
+################################################################################
+
+GIT_BRANCH_WITH_SLASH_VERSION = myfeature/mybranch
+GIT_BRANCH_WITH_SLASH_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_BRANCH_WITH_SLASH_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/b8/5af389ad1ce39dfb897f8403b12f8d830053f2 b/support/testing/tests/download/git-remote/repo.git/objects/b8/5af389ad1ce39dfb897f8403b12f8d830053f2
new file mode 100644
index 0000000000000000000000000000000000000000..c41f3bdbffe7d7d13bff65a0a1a60d4587e90d67
GIT binary patch
literal 49
zcmV-10M7q-0V^p=O;s>9VlXr?Ff%bxNXyJgWq7-)#_n$Z=eB(J43%Abo4B6n3pfA(
H6kiVG);$!C

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/ce/5d9d43cc09b37eb0ebe677b18f81933b950b60 b/support/testing/tests/download/git-remote/repo.git/objects/ce/5d9d43cc09b37eb0ebe677b18f81933b950b60
new file mode 100644
index 0000000000000000000000000000000000000000..76ec78178dbf70b5d6b94a7083763e14cd4cdb08
GIT binary patch
literal 187
zcmV;s07U<I0j-WfP6Qzk06p^xJ}_%TgVSs_#t(Q|U(nF7OO(MNd+_%=i3jh-Yo$`D
z)LW}lBjUpxIqOKC3sPV)DPxclDXfJYU^KRn5CV8CR(<lw+th54qLGq>tQWWLg4+Yh
zTZ_)DiJUPKKosBRwGVx+iHCIk%460o^{@A;PvZw3+An;$G_D_q)Z4Q*9tfTStVS<j
p0n|?S>6!m2r%L8|8~HH~-qKa6w|d#KEWMN^ejoqxtnRJqZ_li-TuT4|

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/ed/aa7c3edd6ff3866f476824babd820ae42f1040 b/support/testing/tests/download/git-remote/repo.git/objects/ed/aa7c3edd6ff3866f476824babd820ae42f1040
new file mode 100644
index 0000000000000000000000000000000000000000..1f0a114eb866aff4797ae3f69388b581f2346312
GIT binary patch
literal 31
ncmb<m^geacKghr&)x+CYM^o49s=t=k8Sirsm>8nxvF`)`vi1vx

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/myfeature/mybranch b/support/testing/tests/download/git-remote/repo.git/refs/heads/myfeature/mybranch
new file mode 100644
index 0000000000..2c6892cc06
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/myfeature/mybranch
@@ -0,0 +1 @@
+ce5d9d43cc09b37eb0ebe677b18f81933b950b60
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 36ed04937e..9fca2bb693 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -67,6 +67,7 @@ class TestGitRefs(GitTestBase):
             self.check_download("git-wrong-sha1")
         self.check_download("git-branch")
         self.check_download("git-branch-takes-precedence-over-tag")
+        self.check_download("git-branch-with-slash")
         self.check_download("git-partial-sha1-branch-head")
         self.check_download("git-partial-sha1-reachable-by-branch")
         self.check_download("git-partial-sha1-reachable-by-tag")
-- 
2.14.1
