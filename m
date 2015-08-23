From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 20:59:43 +0200
Subject: [Buildroot] [git commit] package: add comment about ipkg/opkg/rpm
Message-ID: <20150823190046.5B69F817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c1bff77f47f3d031b8f9471fdf4fa8c2da4a8c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Too often the question is raised, that ipkg, opkg and rpm do not work,
and users complain they can not install packages.

Even though we do have a clear and clearly explained section in our
manual, people do not read it (when will users read manuals? sigh...).

So, add a big fat comment about ipkg/opkg/rpm, that Buildroot does not
generate binary packages and does not provide any package database for
any of those package manager.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..2c92439 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1371,6 +1371,18 @@ endif
 endmenu
 
 menu "Package managers"
+comment "-----------------------------------------------------"
+comment "Please note:                                         "
+comment "- Buildroot does *not* generate binary packages,     "
+comment "- Buildroot does *not* install any package database. "
+comment "*                                                    "
+comment "It is up to you to provide those by yourself if you  "
+comment "want to use any of those package managers.           "
+comment "*                                                    "
+comment "See the manual:                                      "
+comment "http://buildroot.org/downloads/manual/manual.html#faq"
+comment "-no-binary-packages                                  "
+comment "-----------------------------------------------------"
 	source "package/ipkg/Config.in"
 	source "package/opkg/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
