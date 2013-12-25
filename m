From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 10:17:27 +0100
Subject: [Buildroot] [git commit] menu: visually split Shells from Utilities
Message-ID: <20131225091740.35D3B9C1BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91a4ce48762154cd60de807c5d273ed72afffdf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed in [1], add comments to distinghuish shells from utilities in
the 'Shells and Utilities' menu.

[1] http://lists.busybox.net/pipermail/buildroot/2013-December/083836.html

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3685807..fe31cd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,12 +948,14 @@ source "package/xenomai/Config.in"
 endmenu
 
 menu "Shell and utilities"
-source "package/at/Config.in"
+comment "Shells"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bash/Config.in"
 source "package/dash/Config.in"
 source "package/zsh/Config.in"
 endif
+comment "Utilities"
+source "package/at/Config.in"
 source "package/dialog/Config.in"
 source "package/dtach/Config.in"
 source "package/file/Config.in"
