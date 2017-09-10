From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Sep 2017 23:55:38 +0200
Subject: [Buildroot] [git commit] iperf: bump to version 2.0.10
Message-ID: <20170910215008.561AF8101F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e30bf17f70f0b172fe4207b8d1fdcbcd647c89f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop unused configure environment.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iperf/iperf.hash | 5 +++--
 package/iperf/iperf.mk   | 5 +----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 3e96143..0752bfc 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,4 +1,5 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1	59820895df9106ba189ccfdc5677077535ad50e7	iperf-2.0.9.tar.gz
+sha1	8b44a23385044bb454e7891966c37339d3bb3711	iperf-2.0.10.tar.gz
 # Locally computed:
-sha256  db02911f35686e808ed247160dfa766e08ae3f59d1e7dcedef0ffb2a6643f0bf  iperf-2.0.9.tar.gz
+sha256  7fe4348dcca313b74e0aa9c34a8ccd713b84a5615b8578f4aa94cedce9891ef2  iperf-2.0.10.tar.gz
+sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index d2071bd..6449807 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.0.9
+IPERF_VERSION = 2.0.10
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
 # patching configure.ac
 IPERF_AUTORECONF = YES
 
-IPERF_CONF_ENV = \
-	ac_cv_func_malloc_0_nonnull=yes
-
 IPERF_CONF_OPTS = \
 	--disable-web100
 
