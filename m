From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:29:53 +0200
Subject: [Buildroot] [git commit] gnupg: security bump to version 1.4.17
Message-ID: <20140625203128.B711F9D0A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2402634f5a2142202f2b34e206fbebaf58ca1a3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-4617: The do_uncompress function in g10/compress.c in
GnuPG 1.x before 1.4.17 and 2.x before 2.0.24 allows context-dependent
attackers to cause a denial of service (infinite loop) via malformed
compressed packets, as demonstrated by an a3 01 5b ff byte sequence.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index c334ac6..4c96967 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.16
+GNUPG_VERSION = 1.4.17
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
