From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Sep 2012 23:25:11 +0200
Subject: [Buildroot] [git commit] erlang: don't build the Java stuff on the
	host
Message-ID: <20120916212615.2562B9965B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bf020f54415345a22f11754d8280e4ae8fa8ef4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't need the Java stuff, and it causes build failures on certain
machines:

 http://autobuild.buildroot.org/results/99035e89e101c41d5e8b5ef6a025856f4af88ae2/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/erlang/erlang.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
