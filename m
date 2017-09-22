From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:28:10 +0200
Subject: [Buildroot] [git commit] bind: use http:// instead of ftp:// for
	site
Message-ID: <20170922212108.70C608104F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=771bb2d58d945ebd2909dc8ca5cccf30f189c581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To avoid issues with firewalls blocking ftp.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 97d98d0..f6aa725 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BIND_VERSION = 9.11.2
-BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
+BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
