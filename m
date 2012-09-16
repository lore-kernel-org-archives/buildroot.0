From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Sep 2012 22:41:02 +0200
Subject: [Buildroot] [PATCH] erlang: don't build the Java stuff on the host
Message-ID: <1347828062-24022-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't need the Java stuff, and it causes build failures on certain
machines:

 http://autobuild.buildroot.org/results/99035e89e101c41d5e8b5ef6a025856f4af88ae2/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: with this patch, the build of Erlang still works on my
machine. However, I have never reproduced the build problem of
host-erlang on gcc14, so I can't be sure that this patch solves it,
but I'm fairly sure.
---
 package/erlang/erlang.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 63c655b..6d51376 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -17,6 +17,7 @@ ERLANG_LICENSE_FILES = EPLICENCE
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
 
 ERLANG_CONF_OPT = --without-javac
+HOST_ERLANG_CONF_OPT = --without-javac
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 ERLANG_CONF_OPT += --with-termcap
-- 
1.7.9.5
