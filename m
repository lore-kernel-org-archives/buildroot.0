From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Oct 2010 16:00:41 +0200
Subject: [Buildroot] [git commit master 1/1] avahi: ensure locale data is
	installed into /usr/share, not /usr/lib
Message-ID: <20101007140137.2AC038BE96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0201ffcd16247dea9c58d2e611a4c2d96f07eff2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it won't be found / target-localepurge won't remove it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index e1bebd9..c7f9149 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -64,7 +64,8 @@ AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
-		avahi_cv_sys_cxx_works=yes
+		avahi_cv_sys_cxx_works=yes \
+		DATADIR=share
 
 AVAHI_CONF_OPT = --localstatedir=/var \
 		--disable-qt3 \
-- 
1.7.1
