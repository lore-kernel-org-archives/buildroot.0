From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:07 +0100
Subject: [Buildroot] [RFC v3 02/30] xinetd: use TARGET_LDFLAGS in order to
	support per-package staging
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/xinetd/xinetd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 92d0d53..a0d41f7 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -10,6 +10,7 @@ XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
 XINETD_CFLAGS = $(TARGET_CFLAGS)
+XINETD_LIBS = $(TARGET_LDFLAGS)
 
 # Three cases here:
 #  1. We have libtirpc, use it by passing special flags
-- 
2.3.1
