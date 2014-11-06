From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Nov 2014 10:36:47 -0300
Subject: [Buildroot] [PATCH 1/7] skeleton/S40network: tweak for debian
	ifupdown
In-Reply-To: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415281013-1077-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the S40network script create the /run/network directory for the
debian variant of ifupdown which uses it as a lock directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/etc/init.d/S40network | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/system/skeleton/etc/init.d/S40network b/system/skeleton/etc/init.d/S40network
index e69e613..4317d14 100755
--- a/system/skeleton/etc/init.d/S40network
+++ b/system/skeleton/etc/init.d/S40network
@@ -3,6 +3,9 @@
 # Start the network....
 #
 
+# Debian ifupdown needs the /run/network lock directory
+[ -h /sbin/ifup ] || mkdir -p /run/network
+
 case "$1" in
   start)
  	echo "Starting network..."
-- 
2.0.4
