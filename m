From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 21:20:43 +0100
Subject: [Buildroot] [PATCH 2/2] xstroke: mark as deprecated
In-Reply-To: <1355862043-17165-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355862043-17165-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1355862043-17165-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xstroke is just a tarball on the avr32linux.org site, the 0.6 version
has been released in April 2004, so we can consider the upstream to be
dead. So let's mark this package as deprecated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xstroke/Config.in |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
