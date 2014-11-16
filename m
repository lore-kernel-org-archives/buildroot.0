From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 00:25:01 +0100
Subject: [Buildroot] [git commit] package/rpm: add missing dependency to
	openssl
Message-ID: <20141116232647.A7202B46E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cc0bf0df086fb1bf991295639d226e4e3650706
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We forcibly enable use of an extrernal openssl in rpm, so we must depend
on it.

openssl is correctly selected from kconfig, but there is no build-time
dependency to it.

It was not an issue so far, because openssl always sorts before rpm, so
gets built before. Unless one wants to just build rpm to debug an
autobuilder failure, that is.

Add that build-time dependency to openssl.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index af1642f..50e6d75 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -7,7 +7,7 @@
 RPM_VERSION_MAJOR = 5.2
 RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
-RPM_DEPENDENCIES = zlib beecrypt neon popt
+RPM_DEPENDENCIES = zlib beecrypt neon popt openssl
 RPM_LICENSE = LGPLv2.1
 RPM_LICENSE_FILES = COPYING.LIB
 
