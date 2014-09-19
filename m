From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Sep 2014 23:12:49 +0200
Subject: [Buildroot] [git commit] BR2_DEPRECATED: update option label and
	help
Message-ID: <20140919211333.5EF9E9D46E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8515ef02569464d1196812cdc68d8afa500d485f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We should use positive logic (show things that are otherwise hidden...)
for the help since it's what it does.
It also applies to more options than just packages alone, for example
the AVR32 architecture so add an "options" label to it.

[Peter: tweak help text as suggested by Yann]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 14ff55b..24aa883 100644
--- a/Config.in
+++ b/Config.in
@@ -301,9 +301,10 @@ config BR2_CCACHE_INITIAL_SETUP
 endif
 
 config BR2_DEPRECATED
-	bool "Show packages that are deprecated or obsolete"
+	bool "Show options and packages that are deprecated or obsolete"
 	help
-	  This option hides outdated/obsolete versions of packages.
+	  This option shows outdated/obsolete versions of packages and
+	  options that are otherwise hidden.
 
 if BR2_DEPRECATED
 
