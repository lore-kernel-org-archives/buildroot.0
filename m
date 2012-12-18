From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 21:40:25 +0100
Subject: [Buildroot] [git commit] xstroke: mark as deprecated
Message-ID: <20121218204103.2DBB09A387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0a4e72f4a58385e2992d2956d3b8bd14f3c6db9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xstroke is just a tarball on the avr32linux.org site, the 0.6 version
has been released in April 2004, so we can consider the upstream to be
dead. So let's mark this package as deprecated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xstroke/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 1269934..4f3f5f6 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
 	depends on BR2_PACKAGE_XORG7
+	# dead upstream, probably not many users
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXPM
