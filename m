From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Sep 2019 09:27:15 +0200
Subject: [Buildroot] [git commit] package/ascii-invaders: drop the SOURCE
 variable
Message-ID: <20190912072338.5A8248DFAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=902fed518468c38ad6e7c5d6af2a6eff625b5121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need to override the SOURCE variable when the github macro
is used, and in fact keeping the default SOURCE value gives a much
more sensible tarball name, so let's drop the SOURCE variable
entirely.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ascii-invaders/ascii-invaders.hash | 2 +-
 package/ascii-invaders/ascii-invaders.mk   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ascii-invaders/ascii-invaders.hash b/package/ascii-invaders/ascii-invaders.hash
index e8d482b2aa..f08fc2a7da 100644
--- a/package/ascii-invaders/ascii-invaders.hash
+++ b/package/ascii-invaders/ascii-invaders.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha512	326708ffc2c277e04575920c58f6a267e0bf46f8d2a3dbca9b5c317fb01006d4f673ab35f92f292549cc52dbee4400a84c85478eb81b9bd7703689a705547bc7	1.0.1.tar.gz
+sha512	326708ffc2c277e04575920c58f6a267e0bf46f8d2a3dbca9b5c317fb01006d4f673ab35f92f292549cc52dbee4400a84c85478eb81b9bd7703689a705547bc7	ascii-invaders-1.0.1.tar.gz
 
 # Hash for license file
 sha512	1e455684996d7733b2f1ccd4606d034694d16ceff6ede6125d7f1537d20dabe05976cca4cef5cbf6c31352cbd62a515fd8e34a2ffb54dae1181c1116b24c6cf7	LICENSE
diff --git a/package/ascii-invaders/ascii-invaders.mk b/package/ascii-invaders/ascii-invaders.mk
index fc1a019291..a5a25d7abe 100644
--- a/package/ascii-invaders/ascii-invaders.mk
+++ b/package/ascii-invaders/ascii-invaders.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 ASCII_INVADERS_VERSION = 1.0.1
-ASCII_INVADERS_SOURCE = $(ASCII_INVADERS_VERSION).tar.gz
 ASCII_INVADERS_SITE = $(call github,macdice,ascii-invaders,v$(ASCII_INVADERS_VERSION))
 ASCII_INVADERS_DEPENDENCIES = ncurses
 ASCII_INVADERS_LICENSE = GPL-2.0+
