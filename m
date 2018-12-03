From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:09:50 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] ghostscript: security
 bump to version 9.26
Message-ID: <20181203220620.C0E637FF3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07b8c1ecd31184346ff79849edd323fe8674c5f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes the following security vulnerabilities:

 - CVE-2018-17961: Artifex Ghostscript 9.25 and earlier allows attackers to
   bypass a sandbox protection mechanism via vectors involving errorhandler
   setup.  NOTE: this issue exists because of an incomplete fix for
   CVE-2018-17183.

- CVE-2018-18284: Artifex Ghostscript 9.25 and earlier allows attackers to
  bypass a sandbox protection mechanism via vectors involving the 1Policy
  operator.

- CVE-2018-19409: An issue was discovered in Artifex Ghostscript before
  9.26.  LockSafetyParams is not checked correctly if another device is
  used.

- CVE-2018-19475: psi/zdevice2.c in Artifex Ghostscript before 9.26 allows
  remote attackers to bypass intended access restrictions because available
  stack space is not checked when the device remains the same.

- CVE-2018-19476: psi/zicc.c in Artifex Ghostscript before 9.26 allows
  remote attackers to bypass intended access restrictions because of a
  setcolorspace type confusion.

- CVE-2018-19477: psi/zfjbig2.c in Artifex Ghostscript before 9.26 allows
  remote attackers to bypass intended access restrictions because of a
  JBIG2Decode type confusion.

For more details, see the release notes:
https://www.ghostscript.com/doc/9.26/History9.htm#Version9.26

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e52b02677a2b207e89092bcd67a1c03450a26f66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index f8ca6c8d4e..15ef95e77a 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs925/SHA512SUMS
-sha512 7a1c0b7546ed523f50c1452d4a1c13fcf043d6060fc9708bbc4b543f66ecb1b619b6e71998094ac702ef44a2fd159b6523271de19b1cae352981ef51fb637651  ghostscript-9.25.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926/SHA512SUMS
+sha512 3ddb83029edf32282357bf606f4045a9ac73df6543cd423cfad09158ec12ada083a0dbb5aac3b73ae24cbc6c1e9d7574257a5c1fae63ba8776fbb00150ef2a3e  ghostscript-9.26.tar.xz
 
 # Hash for license file:
 sha256 6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index b1f5e1edb1..357fd08c32 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.25
-GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs925
+GHOSTSCRIPT_VERSION = 9.26
+GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
