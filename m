From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 20:37:11 +0100
Subject: [Buildroot] [git commit] package/sredird: bump version to 2.2.2,
	add hash
Message-ID: <20160201224705.6D5667F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33433e1b2bca5c282cfd81b46d8c1b1ff49bf091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While Debian still uses version 2.2.1 the bump to 2.2.2 was committed to
FreeBSD ports back in 2005:
https://www.freshports.org/commit.php?category=comms&port=sredird&files=yes&message_id=200512291935.jBTJZfff072190 at repoman.freebsd.org

FreeBSD ports lists the new upstream URL as no. 12:
https://www.freshports.org/comms/sredird/
and http://freecode.com/projects/sredird also links to it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sredird/Config.in    | 2 ++
 package/sredird/sredird.hash | 2 ++
 package/sredird/sredird.mk   | 5 ++---
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/sredird/Config.in b/package/sredird/Config.in
index 463269a..d8c5ef9 100644
--- a/package/sredird/Config.in
+++ b/package/sredird/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_SREDIRD
 	  Sredird is a serial port redirector that is compliant with
 	  the RFC 2217 "Telnet Com Port Control Option" protocol. This
 	  protocol lets you share a serial port through the network.
+
+	  http://freecode.com/projects/sredird
diff --git a/package/sredird/sredird.hash b/package/sredird/sredird.hash
new file mode 100644
index 0000000..63a419f
--- /dev/null
+++ b/package/sredird/sredird.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	640c47dcd84b3b90640165a38eb336a675fdab06c14c09cae2f4a604cae560d3	sredird-2.2.2.tar.gz
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index ebd7122..b564f1a 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SREDIRD_VERSION = 2.2.1-1.1
-SREDIRD_SOURCE = sredird_$(SREDIRD_VERSION).tar.gz
-SREDIRD_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/sredird
+SREDIRD_VERSION = 2.2.2
+SREDIRD_SITE = http://www.ibiblio.org/pub/Linux/system/serial
 SREDIRD_LICENSE = GPLv2+
 SREDIRD_LICENSE_FILES = COPYING
 
