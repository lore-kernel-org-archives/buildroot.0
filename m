From: Will Newton <will.newton@gmail.com>
Date: Fri, 25 Feb 2011 17:46:43 +0000
Subject: [Buildroot] [PATCH 8/8] gnuconfig: Update README.buildroot.
Message-ID: <AANLkTimjsM5-DjkNc7uOMbmsvrX7ndkCBgptCxNfKLQ9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU config is now managed in git so we cannot use the old method
of doing a cvs up to get the latest changes.

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/gnuconfig/README.buildroot |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/gnuconfig/README.buildroot
b/package/gnuconfig/README.buildroot
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0008-gnuconfig-Update-README.buildroot.patch
Type: text/x-patch
Size: 1276 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110225/e2d3d63e/attachment.bin>
