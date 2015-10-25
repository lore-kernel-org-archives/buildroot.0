From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:24:36 +0100
Subject: [Buildroot] [git commit] avahi: drop unneeded avahi-autopid patch
Message-ID: <20151025202516.43B1A807EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a8378696634b9a93ecf21f567961b6402b2c9ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The reason for the patch is not entirely clear as it dates back to the
original addition of avahi (in 2006), and it contains no description - But
presumably it is to work around a permission issue with the address files,
similar to what is explained here:

https://bugs.launchpad.net/ubuntu/+source/avahi/+bug/83521

That particular issue got fixed by upstream in 2007 using umask(2):

https://github.com/lathiat/avahi/commit/747f75372063371865bf5fc9857982defcffdca4

So the patch isn't needed any more and can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/0001-autoipd-perms.patch |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/package/avahi/0001-autoipd-perms.patch b/package/avahi/0001-autoipd-perms.patch
deleted file mode 100644
index c740e3f..0000000
--- a/package/avahi/0001-autoipd-perms.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- avahi-0.6.14/avahi-autoipd/main.c.cls	2006-09-13 12:49:45.000000000 -0700
-+++ avahi-0.6.14/avahi-autoipd/main.c	2006-09-25 20:34:10.000000000 -0700
-@@ -239,7 +239,7 @@
- 
-     fprintf(f, "%s\n", inet_ntop(AF_INET, &addr, buf, sizeof (buf)));
-     fclose(f);
--
-+    chmod(fn, S_IRUSR|S_IWUSR);
-     return 0;
-     
- fail:
