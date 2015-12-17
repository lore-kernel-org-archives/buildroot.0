From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 21:53:00 +0100
Subject: [Buildroot] [git commit] irssi: update download URL
Message-ID: <20151217205343.F180F82563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97767366f5bcce6c8bec71706e61e82956fb4723
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Irssi source packages are now hosted on GitHub.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/irssi/irssi.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 2207daf..176dce7 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -6,7 +6,9 @@
 
 IRSSI_VERSION = 0.8.17
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.bz2
-IRSSI_SITE = http://irssi.org/files
+# Do not use the github helper here. The generated tarball is *NOT* the
+# same as the one uploaded by upstream for the release.
+IRSSI_SITE = https://github.com/irssi-import/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPLv2+
 IRSSI_LICENSE_FILES = COPYING
 IRSSI_DEPENDENCIES = host-pkgconf libglib2 ncurses
