From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 22:23:04 +0100
Subject: [Buildroot] [git commit] skeleton/S40network: tweak for debian
	ifupdown
Message-ID: <20150112220328.E2AFA804FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a005f10e8811956df65ed852ac899ec2a4ecf1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the S40network script create the /run/network directory for the
debian variant of ifupdown which uses it as a lock directory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/init.d/S40network |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/etc/init.d/S40network b/system/skeleton/etc/init.d/S40network
index e69e613..bfdd491 100755
--- a/system/skeleton/etc/init.d/S40network
+++ b/system/skeleton/etc/init.d/S40network
@@ -3,6 +3,9 @@
 # Start the network....
 #
 
+# Debian ifupdown needs the /run/network lock directory
+mkdir -p /run/network
+
 case "$1" in
   start)
  	echo "Starting network..."
