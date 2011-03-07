From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Mar 2011 23:31:27 +0100
Subject: [Buildroot] [git commit master 1/1] gnuconfig: Update
	README.buildroot.
Message-ID: <20110308062855.ED0358EB73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=314ff6e54b671c4659a933ed91f99ae905ec4890
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU config is now managed in git so we cannot use the old method
of doing a cvs up to get the latest changes.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnuconfig/README.buildroot |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/gnuconfig/README.buildroot b/package/gnuconfig/README.buildroot
index 521f120..fd43a68 100644
--- a/package/gnuconfig/README.buildroot
+++ b/package/gnuconfig/README.buildroot
@@ -8,8 +8,12 @@ To use, just add this to your unpack rule in the package.mk:
 $(CONFIG_UPDATE) $(PACKAGE_DIR)/
 
 --- UPDATE ---
-This is a CVS checkout of the config project, so just run `cvs up` 
-to get the latest config.sub / config.guess files.
+GNU config is now managed in git, so to update:
+
+# git clone git://git.savannah.gnu.org/config.git
+# cp config/config.* .
+# for p in $(ls patches/*.patch); do patch -p0 < $p; done
+# rm -rf config
 
 A few local customizations are used to support uClibc so you may
 have to make sure they're still needed.  The patches are broken 
-- 
1.7.3.4
