From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Nov 2012 08:23:06 +0100
Subject: [Buildroot] [git commit] package: drop games/ subdir
Message-ID: <20121105081344.74B5F99BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b809e1a6ad2a82bfe0d2383f69f45ae8c6283bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed during the dev day.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    8 ++++----
 package/{games => }/doom-wad/Config.in             |    0
 package/{games => }/doom-wad/doom-wad.mk           |    0
 package/games/games.mk                             |    1 -
 package/{games => }/gnuchess/Config.in             |    0
 .../gnuchess/gnuchess-5.07-getline-conflicts.patch |    0
 package/{games => }/gnuchess/gnuchess-5.07.patch   |    0
 package/{games => }/gnuchess/gnuchess.mk           |    0
 package/{games => }/prboom/Config.in               |    0
 .../prboom/prboom-2.5.0-libpng-1.4.patch           |    0
 package/{games => }/prboom/prboom.mk               |    0
 package/{games => }/rubix/Config.in                |    0
 .../rubix-1.0.5-dont-use-legacy-functions.patch    |    0
 package/{games => }/rubix/rubix-1.0.5.patch        |    0
 package/{games => }/rubix/rubix.mk                 |    0
 15 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6125abc..1df099b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -97,10 +97,10 @@ source "package/yasm/Config.in"
 endmenu
 
 menu "Games"
-source "package/games/gnuchess/Config.in"
-source "package/games/prboom/Config.in"
-source "package/games/doom-wad/Config.in"
-source "package/games/rubix/Config.in"
+source "package/gnuchess/Config.in"
+source "package/prboom/Config.in"
+source "package/doom-wad/Config.in"
+source "package/rubix/Config.in"
 endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
diff --git a/package/games/doom-wad/Config.in b/package/doom-wad/Config.in
similarity index 100%
rename from package/games/doom-wad/Config.in
rename to package/doom-wad/Config.in
diff --git a/package/games/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
similarity index 100%
rename from package/games/doom-wad/doom-wad.mk
rename to package/doom-wad/doom-wad.mk
diff --git a/package/games/games.mk b/package/games/games.mk
deleted file mode 100644
index 5813b44..0000000
--- a/package/games/games.mk
+++ /dev/null
@@ -1 +0,0 @@
-include package/games/*/*.mk
diff --git a/package/games/gnuchess/Config.in b/package/gnuchess/Config.in
similarity index 100%
rename from package/games/gnuchess/Config.in
rename to package/gnuchess/Config.in
diff --git a/package/games/gnuchess/gnuchess-5.07-getline-conflicts.patch b/package/gnuchess/gnuchess-5.07-getline-conflicts.patch
similarity index 100%
rename from package/games/gnuchess/gnuchess-5.07-getline-conflicts.patch
rename to package/gnuchess/gnuchess-5.07-getline-conflicts.patch
diff --git a/package/games/gnuchess/gnuchess-5.07.patch b/package/gnuchess/gnuchess-5.07.patch
similarity index 100%
rename from package/games/gnuchess/gnuchess-5.07.patch
rename to package/gnuchess/gnuchess-5.07.patch
diff --git a/package/games/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
similarity index 100%
rename from package/games/gnuchess/gnuchess.mk
rename to package/gnuchess/gnuchess.mk
diff --git a/package/games/prboom/Config.in b/package/prboom/Config.in
similarity index 100%
rename from package/games/prboom/Config.in
rename to package/prboom/Config.in
diff --git a/package/games/prboom/prboom-2.5.0-libpng-1.4.patch b/package/prboom/prboom-2.5.0-libpng-1.4.patch
similarity index 100%
rename from package/games/prboom/prboom-2.5.0-libpng-1.4.patch
rename to package/prboom/prboom-2.5.0-libpng-1.4.patch
diff --git a/package/games/prboom/prboom.mk b/package/prboom/prboom.mk
similarity index 100%
rename from package/games/prboom/prboom.mk
rename to package/prboom/prboom.mk
diff --git a/package/games/rubix/Config.in b/package/rubix/Config.in
similarity index 100%
rename from package/games/rubix/Config.in
rename to package/rubix/Config.in
diff --git a/package/games/rubix/rubix-1.0.5-dont-use-legacy-functions.patch b/package/rubix/rubix-1.0.5-dont-use-legacy-functions.patch
similarity index 100%
rename from package/games/rubix/rubix-1.0.5-dont-use-legacy-functions.patch
rename to package/rubix/rubix-1.0.5-dont-use-legacy-functions.patch
diff --git a/package/games/rubix/rubix-1.0.5.patch b/package/rubix/rubix-1.0.5.patch
similarity index 100%
rename from package/games/rubix/rubix-1.0.5.patch
rename to package/rubix/rubix-1.0.5.patch
diff --git a/package/games/rubix/rubix.mk b/package/rubix/rubix.mk
similarity index 100%
rename from package/games/rubix/rubix.mk
rename to package/rubix/rubix.mk
