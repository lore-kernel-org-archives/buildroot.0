From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 17 Jan 2011 14:29:20 +0100
Subject: [Buildroot] [PATCH 1/2] socat: bump 2.0.0-b4 version
In-Reply-To: <y>
References: <y>
Message-ID: <1295270961-20268-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

security:
	fixed a stack overflow vulnerability that occurred when command
	line arguments (whole addresses, host names, file names) were longer
	than 512 bytes.
	Note that this could only be exploited when an attacker was able to
	inject data into socat's command line.
	Full credits to Felix Gr??bert, Google Security Team, for finding and
	reporting this issue

new features:
	added inter addresses for execution of external programs or scripts:
	EXEC2 and SYSTEM2 are bidirectional, EXEC1 and SYSTEM1 are
	unidirectional

	option commtype replaces the now obsolete "socketpair" and "pipes"
	options and selects the communication mechanism on the left side of
	EXEC and SYSTEM addresses

	options leftfd, leftinfd, leftoutfd; and rightfd, rightinfd,
	rightoutfd override the default file descriptor numbers provided to
	exec'd programs

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/socat/socat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 2b53d88..1687f3c 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -6,7 +6,7 @@
 
 #SOCAT_MAJOR_VERSION=1.4
 #SOCAT_MINOR_VERSION=.0.3
-SOCAT_MAJOR_VERSION=2.0.0-b2
+SOCAT_MAJOR_VERSION=2.0.0-b4
 SOCAT_MINOR_VERSION=
 
 # Don't alter below this line unless you (think) you know
-- 
1.7.1.1
