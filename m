From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Oct 2011 23:26:39 +0200
Subject: [Buildroot] [git commit] makedevs: remove compiler warning about
	used-but-set
Message-ID: <20111009221637.8518B8E2EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95af4fbfa56977d7c93ef6339c37829a47275f77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4171

Based on patch by Hector Oron <hector.oron@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    1 +
 package/makedevs/makedevs.c |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 70d4a79..6dc8789 100644
--- a/CHANGES
+++ b/CHANGES
@@ -60,6 +60,7 @@
 	#3631: Error while compiling with Xorg
 	#3925: midori not getting compile
 	#4045: Add support for downloading i386 toolchains from codesourcery
+	#4171: makedevs-unused-but-set-variable.patch
 	#4183: Codesourcery toolchain download site has changed
 
 2011.08, Released August 31th, 2011:
diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 95c079a..5d5668d 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -536,5 +536,5 @@ loop:
 	}
 	fclose(table);
 
-	return 0;
+	return ret;
 }
