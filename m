From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 24 Aug 2018 07:56:14 +0300
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.8
Message-ID: <151004584b68ecae441b439ec19b195afb2d6b8f.1535086574.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-15473: user enumeration vulnerability due to not delaying
bailout for an invalid authenticating user until after the packet
containing the request has been fully parsed.

Some OpenSSH developers don't consider this a security issue:

  https://lists.mindrot.org/pipermail/openssh-unix-dev/2018-August/037138.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 69d34ba65ec9..0b31f70eccf4 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From http://www.openssh.com/txt/release-7.7 (base64 encoded)
-sha256 d73be7e684e99efcd024be15a30bffcbe41b012b2f7b3c9084aed621775e6b8f  openssh-7.7p1.tar.gz
+# From http://www.openssh.com/txt/release-7.8 (base64 encoded)
+sha256 1a484bb15152c183bb2514e112aa30dd34138c3cfb032eee5490a66c507144ca  openssh-7.8p1.tar.gz
 # Locally calculated
 sha256 05a4c25ef464e19656c5259bd4f4da8428efab01044f3541b79fbb3ff209350f  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b28429e1bb29..45a11ee65ec9 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 7.7p1
+OPENSSH_VERSION = 7.8p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-- 
2.18.0
