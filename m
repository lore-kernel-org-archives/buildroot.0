From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 19:14:14 +0200
Subject: [Buildroot] [git commit] busybox 1.20.x: add if-post-up.d and
	if-pre-down.d to device table
Message-ID: <20120429171458.C16E396BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40c20cd40e74c97c8995dbf2ca0d6570b46d9261
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox 1.20.0 add functionality to execute scripts from if-post-up.d
and if-pre-down.d, so add the missing directories to the device table to
get them created and avoid unnecessary warnings if not.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/device_table.txt |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index d3e394b..fc397a9 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -14,7 +14,9 @@
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
 /etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
+/etc/network/if-post-up.d		d	755	0	0	-	-	-	-	-
 /etc/network/if-down.d			d	755	0	0	-	-	-	-	-
+/etc/network/if-pre-down.d		d	755	0	0	-	-	-	-	-
 /etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
 # uncomment this to allow starting x as non-root
 #/usr/X11R6/bin/Xfbdev		     	f	4755	0	0	-	-	-	-	-
