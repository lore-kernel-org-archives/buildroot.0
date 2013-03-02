From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sat,  2 Mar 2013 14:35:28 +0800
Subject: [Buildroot] [PATCH] stress: honor the BR2_PREFER_STATIC_LIB
	preference
Message-ID: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: roylee17 <roylee17@gmail.com>

Change-Id: I13f849e76557fac81b488ab26b4ac8b999888bc1
---
 package/stress/stress.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 3a047b5..af79bf2 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -10,4 +10,7 @@ STRESS_VERSION = 1.0.4
 STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
 STRESS_AUTORECONF = YES
 
+STRESS_CONF_OPT = \
+	$(if $(BR2_PREFER_STATIC_LIB),--enable-static,--disable-static)
+
 $(eval $(autotools-package))
-- 
1.8.1.2
