From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 16:12:11 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] openssh: security bump to
 version 7.8
Message-ID: <20180828141212.C68AC81458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=786e0559304bf4af65cc5e5bbf6e5ca40f2e7c9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes CVE-2018-15473: user enumeration vulnerability due to not delaying
bailout for an invalid authenticating user until after the packet
containing the request has been fully parsed.

Some OpenSSH developers don't consider this a security issue:

  https://lists.mindrot.org/pipermail/openssh-unix-dev/2018-August/037138.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5ef5b39bd4006526717364b39b04a663ce174517)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 69d34ba65e..0b31f70ecc 100644
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
index b28429e1bb..45a11ee65e 100644
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
