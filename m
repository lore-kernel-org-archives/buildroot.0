From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:38:28 +0200
Subject: [Buildroot] [git commit] fan-ctrl: mark as broken until SourceForge
	is back up
Message-ID: <20150723213928.CBB4081EAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89d21ce29b5be996d130f7944095918b3e8dd613
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SourceForge is down, so we can't download fan-ctrl.c anymore, and it's
not on sources.buildroot.net nor anywhere else on the Internet
apparently. So let's mark this not-so-important package as broken for
now, until SourceForge goes back to life.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fan-ctrl/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/fan-ctrl/Config.in b/package/fan-ctrl/Config.in
index 8696316..fa23aed 100644
--- a/package/fan-ctrl/Config.in
+++ b/package/fan-ctrl/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_FAN_CTRL
 	bool "fan-ctrl"
 	depends on BR2_USE_MMU # fork()
+	# SourceForge is down, not backup location, let's disable for
+	# now.
+	depends on BR2_BROKEN
 	help
 	  Fan-ctrl is a little daemon that controls the speed of one
 	  or more system or CPU fans. It does so by monitoring
