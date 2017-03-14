From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:47:19 +0100
Subject: [Buildroot] [git commit] keepalived: fix build with musl
Message-ID: <20170314205424.BE58D82532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4744ff01732a76759f4bbc55904fa8ca6d25b4b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply upstream patch ("keepalived/ip_vs: fix integer types") removing non
standard integer types that musl does not provide.

Fixes:
http://autobuild.buildroot.net/results/503/5038874be985ad2b6588150071ced0d6589af601/
http://autobuild.buildroot.net/results/6e9/6e9f5885de99847a24cc1c3a17adf0cd1606b316/
http://autobuild.buildroot.net/results/b61/b61c2cfa949c2a20f0702522857d78651207e6d2/

Cc: Ilias Apalodimas <apalos@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/keepalived/keepalived.hash | 2 ++
 package/keepalived/keepalived.mk   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index e868587..543e60a 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,5 @@
 # From http://www.keepalived.org/download.html
 md5 744025d57c7f065c42fe925b0283897e	keepalived-1.3.2.tar.gz
 sha1	449f06dfce07e05c1ebd516d0545182e1416f264  keepalived-1.3.2.tar.gz
+# Locally calculated
+sha256	0f261e6810b3eced68dc9858a1f28694e4a91116035fe76c4400ec4ac208feda	5d98b7b69fcbba84fa69e5b5e9a019bfbcb76e8b.patch
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index da5b5d8..97a4daa 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -11,6 +11,8 @@ KEEPALIVED_LICENSE = GPLv2+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS += --disable-dbus
 
+KEEPALIVED_PATCH = https://github.com/acassen/keepalived/commit/5d98b7b69fcbba84fa69e5b5e9a019bfbcb76e8b.patch
+
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 KEEPALIVED_DEPENDENCIES += libnfnetlink
 endif
