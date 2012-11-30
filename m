From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 11:48:52 -0800
Subject: [Buildroot] [git commit] Add /var/www to device table
Message-ID: <20121130195702.6392E8017A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2af1822252af1a70a5b199921ede15572b46d0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The /var/www directory is listed in /etc/passwd in the skeleton target
filesystem as the home directory of the www-data user (uid 33).

In the final target filesystem, /var/www should be owned by www-data. This
is important for the lighttpd package, for example.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/device_table.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/system/device_table.txt b/system/device_table.txt
index fc397a9..421728b 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -10,6 +10,7 @@
 /tmp					d	1777	0	0	-	-	-	-	-
 /etc					d	755	0	0	-	-	-	-	-
 /home/default				d	2755	1000	1000	-	-	-	-	-
+/var/www				d	755	33	33	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
