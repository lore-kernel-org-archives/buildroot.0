From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:27:40 +0200
Subject: [Buildroot] [git commit] iperf3: security bump to version 3.1.3
Message-ID: <20160609222756.76625819B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=678db6ba60a3dc6665d99383e4e6ba2efd2ca2b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
ESNET-SECADV-2016-0001 - A malicious process can connect to an iperf3
server and, by sending a malformed message on the control channel,
corrupt the server process's heap area.  This can lead to a crash (and a
denial of service), or theoretically a remote code execution as the user
running the iperf3 server. A malicious iperf3 server could potentially
mount a similar attack on an iperf3 client.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 48a2b2a..1accccd 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  48b5c783bb4a9c44f2bdcfe52c5d45b77ab1e1c82de3d0131f692457950811f9  iperf3-3.1.2.tar.gz
+# From http://software.es.net/iperf/news.html#security-issue-iperf-3-1-3-iperf-3-0-12-released
+sha256  60d8db69b1d74a64d78566c2317c373a85fef691b8d277737ee5d29f448595bf  iperf-3.1.3.tar.gz
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 2438955..3d2a708 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.1.2
-IPERF3_SITE = $(call github,esnet,iperf,$(IPERF3_VERSION))
+IPERF3_VERSION = 3.1.3
+IPERF3_SITE = http://downloads.es.net/pub/iperf
+IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
 IPERF3_LICENSE_FILES = LICENSE
 
