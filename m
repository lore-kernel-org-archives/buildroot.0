From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 11:33:47 -0300
Subject: [Buildroot] [PATCH v4] testing/tests/download: test git special ref
In-Reply-To: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
References: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
Message-ID: <20180429143349.24010-11-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Add a special ref to the static repo and check on the git refs test case
the download of a git package:
 - with the name of a special ref as version;

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Layout of static repo with the series applied until this patch:
 $ git -C support/testing/tests/download/git-remote/repo.git \
   log --all --decorate --graph --oneline --decorate
 * 2fa37f6 (submodule) sub0-2
 * a9dbc1e sub0-1
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
 .../git-refs/package/git-special-ref/git-special-ref.hash |   2 ++
 .../git-refs/package/git-special-ref/git-special-ref.mk   |  11 +++++++++++
 .../objects/17/c409592968d17600ff9912e96fdd461bb72e74     | Bin 0 -> 48 bytes
 .../objects/53/122a7b0454b33c6d9e159c10657173db77899e     | Bin 0 -> 27 bytes
 .../objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885     | Bin 0 -> 186 bytes
 .../download/git-remote/repo.git/refs/changes/01/1/2      |   1 +
 support/testing/tests/download/test_git.py                |   1 +
 7 files changed, 15 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2

diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash
new file mode 100644
index 0000000000..13e21aaeca
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash
@@ -0,0 +1,2 @@
+sha256  c639b15260d098d94b8802cae812453c9f878ffd5f80cca6d87c58c01eed5c5a  git-special-ref-refs_changes_01_1_2.tar.gz
+sha256  b252b594be4679764e2e06cfea77a3e50638dd445af9b472b0f298c43b134518  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk
new file mode 100644
index 0000000000..e7561bafca
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-special-ref
+#
+################################################################################
+
+GIT_SPECIAL_REF_VERSION = refs/changes/01/1/2
+GIT_SPECIAL_REF_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SPECIAL_REF_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74 b/support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74
new file mode 100644
index 0000000000000000000000000000000000000000..8c19de6455168ac65c81d70219e01eb2431c069e
GIT binary patch
literal 48
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5l|$^(sx;1<Ig_pZOZptL5<kBEbgq)&X$db2
E0EbQzfdBvi

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e b/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e
new file mode 100644
index 0000000000000000000000000000000000000000..d72d49eed56298f84aaf85967dbf051da94f3871
GIT binary patch
literal 27
icmb<m^geacKghr&MMKZS_ngleO)uZaObmAQY+e9~zX?PD

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885 b/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885
new file mode 100644
index 0000000000000000000000000000000000000000..6727b2e8083f2a31c48e849caa4cd772a6778e07
GIT binary patch
literal 186
zcmV;r07d_J0j<tKP6QzkKvCD6f(!Jd3TU8=F<!upo`9x`k<8Fc7+iRJJ8|LOxP6PC
zpL=U{YHR3W4iSwZJD`;e`N$YNKq*9MgnVIk9=9zR2~OS8kbUZ8Y}}Ab=4e)SfunV)
z*t{BJ-4TlpkqKC(&-u}ZeyceR?)o*2S@+!Um#Uw}51!gDzMNaC*HiB8S>p<UJc0{)
o0SllGJ*KDpQ%>D)l54sSDN4Q9^DeyfQkL!O at h`vX8x-PgzB#pAi~s-t

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2 b/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2
new file mode 100644
index 0000000000..7066394dd0
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2
@@ -0,0 +1 @@
+b72ff6078f62522a87f5cae5e9f34dedf5ec3885
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 878cae87d6..36ed04937e 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -77,6 +77,7 @@ class TestGitRefs(GitTestBase):
         self.check_download("git-sha1-reachable-by-tag")
         self.check_download("git-sha1-tag-itself")
         self.check_download("git-sha1-tag-points-to")
+        self.check_download("git-special-ref")
         self.check_download("git-submodule-disabled")
         self.check_download("git-submodule-enabled")
         self.check_download("git-tag")
-- 
2.14.1
