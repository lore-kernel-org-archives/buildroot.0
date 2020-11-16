From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 19:54:51 +0100
Subject: [Buildroot] [git commit] package/openntpd: needs host-bison
Message-ID: <20201116184056.7827F80E53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8de3cb3741712dff891568cc57751dee7111334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails when no yacc alternative is installed.

Fixes:
http://autobuild.buildroot.net/results/1ba8e339cbb5646663d0bf4e158d89e54433b242/
http://autobuild.buildroot.net/results/a00a53d6635c64e72c50d4841658155de5380110/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openntpd/openntpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index f2eaee7efd..9076f3ddda 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -8,6 +8,7 @@ OPENNTPD_VERSION = 6.2p3
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
+OPENNTPD_DEPENDENCIES = host-bison
 # Need to autoreconf for our libtool patch to apply properly
 OPENNTPD_AUTORECONF = YES
 
