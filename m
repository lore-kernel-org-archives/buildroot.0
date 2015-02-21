From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 23:47:07 +0100
Subject: [Buildroot] [git commit branch/next] system: Defaulting
	TZ_LOCALTIME to UTC
Message-ID: <20150221224712.638DF80444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fa62b4ca5835f4a5b45d3d54aad1a4d046cf83b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch sets the default timezone to UTC if not overwritten.
Some packages need a configured system timezone for properly
operating like mono based software.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index fb8b686..4d1c3d2 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -369,6 +369,7 @@ config BR2_TARGET_TZ_ZONELIST
 
 config BR2_TARGET_LOCALTIME
 	string "default local time"
+	default "Etc/UTC"
 	help
 	  The time zone to install as the default local time, expressed as a
 	  tzdata location, such as:
