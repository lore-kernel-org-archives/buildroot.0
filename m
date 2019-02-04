From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  4 Feb 2019 19:05:53 +0100
Subject: [Buildroot] [PATCHv2 8/8] support/download/{bzr, cvs, git,
 svn}: highlight unimplemented source-check
In-Reply-To: <20190204180553.18394-1-patrickdepinguin@gmail.com>
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
Message-ID: <20190204180553.18394-9-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

For bzr, cvs, git and svn, there is no method of checking whether the
revision exists remotely, without actually cloning the repository.
Therefore, there is no actual implementation for '-C' (checkonly) for these
download helpers. The script will fall back to the normal download logic,
which would effectively fail if the revision does not exist.

For completeness, mention this unimplemented feature in the usage text.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/download/bzr | 2 ++
 support/download/cvs | 2 ++
 support/download/git | 2 ++
 support/download/svn | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/support/download/bzr b/support/download/bzr
index 5289a421cd..278d8778af 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -7,6 +7,8 @@ set -e
 #
 # Options:
 #   -q          Be quiet
+#   -C          (unimplemented) Only check that the revision exists in the
+#               remote repository.
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset (or revision) CSET.
diff --git a/support/download/cvs b/support/download/cvs
index 9d0dc3cb3a..d9a586293a 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -7,6 +7,8 @@ set -e
 #
 # Options:
 #   -q          Be quiet
+#   -C          (unimplemented) Only check that the revision exists in the
+#               remote repository.
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Checkout from repository at URI.
 #   -c REV      Use revision REV.
diff --git a/support/download/git b/support/download/git
index 17ca04eb98..e9c02d6712 100755
--- a/support/download/git
+++ b/support/download/git
@@ -7,6 +7,8 @@ set -E
 #
 # Options:
 #   -q          Be quiet.
+#   -C          (unimplemented) Only check that the revision exists in the
+#               remote repository.
 #   -r          Clone and archive sub-modules.
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Clone from repository at URI.
diff --git a/support/download/svn b/support/download/svn
index 542b25c0a2..5fff064683 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -7,6 +7,8 @@ set -e
 #
 # Options:
 #   -q          Be quiet.
+#   -C          (unimplemented) Only check that the revision exists in the
+#               remote repository.
 #   -o FILE     Generate archive in FILE.
 #   -u URI      Checkout from repository at URI.
 #   -c REV      Use revision REV.
-- 
2.19.2
