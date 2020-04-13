From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Apr 2020 17:47:24 +0300
Subject: [Buildroot] [PATCH] package/libssh: security bump to version 0.9.4
Message-ID: <9aa0bdcf9bae257961438cd369b273fade725f95.1586789244.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2020-1730: Possible DoS in client and server when handling
AES-CTR keys with OpenSSL.

Format hash file with two spaces delimiter.

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index ca296701bf27..62b860300aea 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
 # https://www.libssh.org/files/0.9/libssh-0.9.3.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256 2c8b5f894dced58b3d629f16f3afa6562c20b4bdc894639163cf657833688f0c  libssh-0.9.3.tar.xz
-sha256 1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
+sha256  150897a569852ac05aac831dc417a7ba8e610c86ca2e0154a99c6ade2486226b  libssh-0.9.4.tar.xz
+sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 52517a5dd0d7..abc9aec9a3cb 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.9
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.25.1
