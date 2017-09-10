From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Sep 2017 21:52:58 +0300
Subject: [Buildroot] [PATCH] iperf: bump to version 2.0.10
Message-ID: <d4461323ccf774ac8504cedb015dc3ecaf6a294b.1505069578.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop unused configure environment.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iperf/iperf.hash | 5 +++--
 package/iperf/iperf.mk   | 5 +----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 3e961435b660..0752bfc3561b 100644
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
index d2071bd274aa..644980754f52 100644
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
 
-- 
2.14.1
