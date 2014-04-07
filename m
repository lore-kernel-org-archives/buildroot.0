From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 00:55:15 +0200
Subject: [Buildroot] [git commit] package/exim: uses fork(), needs an MMU
Message-ID: <20140407225719.935F599B2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ee5c166b8ff60170621708299a17fa00fbf0040
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/95d/95ddd8e9be96f3808612db02642d72cfe77b3c26/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Romain Naour<romain.naour@openwide.fr>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/exim/Config.in b/package/exim/Config.in
index 70038a2..a71106b 100644
--- a/package/exim/Config.in
+++ b/package/exim/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EXIM
 	bool "exim"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_BERKELEYDB
 	help
