From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 23:25:11 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/python3: security
 bump to version 3.8.7
Message-ID: <20210105220828.B96E181383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0b9dc672b369eaa230fa6ed992d7363b38ad28d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes:
https://www.python.org/downloads/release/python-387/

Changelog:
https://docs.python.org/release/3.8.7/whatsnew/changelog.html

Fixes the following security issues:

- bpo-42103: Prevented potential DoS attack via CPU and RAM exhaustion when
  processing malformed Apple Property List files in binary format.

- bpo-42051: The plistlib module no longer accepts entity declarations in
  XML plist files to avoid XML vulnerabilities.  This should not affect
  users as entity declarations are not used in regular plist files.

- bpo-40791: Add volatile to the accumulator variable in
  hmac.compare_digest, making constant-time-defeating optimizations less
  likely.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 4c03293dd1..d829fb9713 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-386/
-md5  69e73c49eeb1a853cefd26d18c9d069d  Python-3.8.6.tar.xz
+# From https://www.python.org/downloads/release/python-387/
+md5  60fe018fffc7f33818e6c340d29e2db9  Python-3.8.7.tar.xz
 # Locally computed
-sha256  a9e0b79d27aa056eb9cce8d63a427b5f9bab1465dee3f942dcfdb25a82f4ab8a  Python-3.8.6.tar.xz
+sha256  ddcc1df16bb5b87aa42ec5d20a5b902f2d088caa269b28e01590f97a798ec50a  Python-3.8.7.tar.xz
 sha256  1dceef1677a39befa8bf0285ab2db441ba117520bb2de839547ace006a17750d  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1a2edc6471..6675f84042 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.8
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
