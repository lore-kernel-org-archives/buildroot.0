From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 14 Sep 2020 11:47:04 +0200
Subject: [Buildroot] [PATCH] package/localedef: depend host build on python3
Message-ID: <20200914094703.2788070-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

needed for parallel build.

fixes:
 - http://lists.busybox.net/pipermail/buildroot/2020-September/291929.html

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/localedef/localedef.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index e3c571241c..8eefb84a29 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -14,6 +14,7 @@ HOST_LOCALEDEF_DL_SUBDIR = glibc
 
 HOST_LOCALEDEF_DEPENDENCIES = \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
+	$(BR2_PYTHON3_HOST_DEPENDENCY) \
 	host-bison \
 	host-gawk
 
-- 
2.25.1
