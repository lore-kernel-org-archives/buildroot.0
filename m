From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 09:46:51 +0200
Subject: [Buildroot] [git commit] core: fix download menu
Message-ID: <20150714074707.29B3F7FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3318a5a798a37bd2b55feb619f8d0a90b9c7ddd2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when one enables the "Only allow downloads from primary"
option, all the other mirror options are hidden (expected!) but the
LuaRocks and CPAN mirrors (bad!).

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index e10427f..8b1bd8d 100644
--- a/Config.in
+++ b/Config.in
@@ -218,8 +218,6 @@ config BR2_GNU_MIRROR
 	     http://ftp.gnu.org/pub/gnu
 	     http://mirror.aarnet.edu.au/pub/gnu
 
-endif
-
 config BR2_LUAROCKS_MIRROR
 	string "LuaRocks mirror"
 	default "http://rocks.moonscript.org"
@@ -239,6 +237,8 @@ config BR2_CPAN_MIRROR
 	  The list of mirrors is available at:
 	  http://search.cpan.org/mirror
 
+endif
+
 endmenu
 
 config BR2_JLEVEL
