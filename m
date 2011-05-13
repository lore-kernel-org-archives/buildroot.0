From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 May 2011 09:30:41 +0200
Subject: [Buildroot] [git commit] avahi: ensure locale data is installed
	into /usr/share, not /usr/lib v2
Message-ID: <20110513073347.D928B834EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b9d4ab0056c3b8135fc89c25995e16dd937b99db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Was fixed in 0201ffcd1624, but nowadays avahi uses DATADIRNAME rather
than DATADIR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 4dfa354..fdf0390 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -64,7 +64,7 @@ AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
 		avahi_cv_sys_cxx_works=yes \
-		DATADIR=share
+		DATADIRNAME=share
 
 AVAHI_CONF_OPT = --localstatedir=/var \
 		--disable-qt3 \
-- 
1.7.3.4
