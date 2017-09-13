From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 15:01:15 +0200
Subject: [Buildroot] [PATCH 2/2] bind: use http:// instead of ftp:// for site
In-Reply-To: <20170913130115.25010-1-peter@korsgaard.com>
References: <20170913130115.25010-1-peter@korsgaard.com>
Message-ID: <20170913130115.25010-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To avoid issues with firewalls blocking ftp.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 97d98d0b21..f6aa7253ed 100644
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
-- 
2.11.0
