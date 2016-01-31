From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 08:28:51 +0100
Subject: [Buildroot] [git commit] package/lshw: fix musl build
Message-ID: <20160201224700.3B0997FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0be67b6f717414718e6931c970b5ab4d926f42e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/aa3/aa3abc215b7a4e95b60be9a635758d8448e4959f/
http://autobuild.buildroot.net/results/075/075423a70b9bb80b2f13cac4fb95502180e68b43/
http://autobuild.buildroot.net/results/61f/61fb9b93af41b565fd44bab95955ab6f63c1f1ad/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lshw/lshw.hash | 2 ++
 package/lshw/lshw.mk   | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index 4f3a2e8..416d496 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -1,2 +1,4 @@
 # Locally calculated
 sha256	eb9cc053fa0f1e78685cb695596e73931bfb55d2377e3bc3b8b94aff4c5a489c	lshw-B.02.17.tar.gz
+sha256	2e5a3d63da8475db17fd90969bcb1930cf19d2b8da7be41edeea5c2a53878382	no-private-uint.patch
+sha256	c8365f7ac8fc7a751c78d89ab446111bb1a235bc977a1b21e1b826c2e62361d1	basename-limits-long-bits.patch
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index f516933..a4a2603 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -6,6 +6,9 @@
 
 LSHW_VERSION = B.02.17
 LSHW_SITE = http://ezix.org/software/files
+LSHW_PATCH = \
+	http://git.alpinelinux.org/cgit/aports/plain/testing/lshw/basename-limits-long-bits.patch \
+	http://git.alpinelinux.org/cgit/aports/plain/testing/lshw/no-private-uint.patch
 LSHW_LICENSE = GPLv2
 LSHW_LICENSE_FILES = COPYING
 
