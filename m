From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 14:12:21 +0200
Subject: [Buildroot] [git commit] chrony: bump version
Message-ID: <20160428121244.24E377FA3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc208df5b9a11c288826e605ae14da383eaeddbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:

Enhancements
------------
* Add support for NTP and command response rate limiting
* Add support for dropping root privileges on Mac OS X, FreeBSD, Solaris
* Add require and trust options for source selection
* Enable logchange by default (1 second threshold)
* Set RTC on Mac OS X with rtcsync directive
* Allow binding to NTP port after dropping root privileges on NetBSD
* Drop CAP_NET_BIND_SERVICE capability on Linux when NTP port is disabled
* Resolve names in separate process when seccomp filter is enabled
* Replace old records in client log when memory limit is reached
* Don't reveal local time and synchronisation state in client packets
* Don't keep client sockets open for longer than necessary
* Ignore poll in KoD RATE packets as ntpd doesn't always set it correctly
* Warn when using keys shorter than 80 bits
* Add keygen command to generate random keys easily
* Add serverstats command to report NTP and command packet statistics

Bug fixes
---------
* Fix clock correction after making step on Mac OS X
* Fix building on Solaris

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.hash | 6 +++---
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index fb8a655..f39d316 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,3 +1,3 @@
-# From http://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2016/01/msg00000.html
-md5  ce46990540aab3670d093311ee43fe17         chrony-2.2.1.tar.gz
-sha1 290b761478dc90d4921c98b7030ead07c49f2afd chrony-2.2.1.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2016/02/msg00001.html
+md5  db6d46afea66f75dcc362f44623c1af4         chrony-2.3.tar.gz
+sha1 c5e2aac4e4ad904bf73663ed63964bec91482a8a chrony-2.3.tar.gz
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 59faa10..6416b83 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 2.2.1
+CHRONY_VERSION = 2.3
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
