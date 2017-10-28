From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 19:41:15 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] openssh: security bump to
	version 7.6p1
Message-ID: <20171028174327.0F40080676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0fb2d244df34f75bc71e39bc13c209a099c23cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-15906 - The process_open function in sftp-server.c in OpenSSH
before 7.6 does not properly prevent write operations in readonly mode,
which allows attackers to create zero-length files.

For more details, see the release notes:
https://www.openssh.com/txt/release-7.6

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 70663a9a4fcb9211fcef7668a8a35de11cc54775)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 6 ++++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 3685bc0..d8a4da3 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,2 +1,4 @@
-# From http://www.openssh.com/txt/release-7.5 (base64 encoded)
-sha256 9846e3c5fab9f0547400b4d2c017992f914222b3fd1f8eee6c7dc6bc5e59f9f0  openssh-7.5p1.tar.gz
+# From http://www.openssh.com/txt/release-7.6 (base64 encoded)
+sha256 a323caeeddfe145baaa0db16e98d784b1fbc7dd436a6bf1f479dfd5cd1d21723  openssh-7.6p1.tar.gz
+# Locally calculated
+sha256 05a4c25ef464e19656c5259bd4f4da8428efab01044f3541b79fbb3ff209350f  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f9167e5..368cb33 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 7.5p1
+OPENSSH_VERSION = 7.6p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c, BSD-2c, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
