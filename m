From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Apr 2020 21:48:39 +0200
Subject: [Buildroot] [PATCH 2/3] package/daq: bump version to 2.0.7
In-Reply-To: <20200414194840.1344508-1-bernd.kuhls@t-online.de>
References: <20200414194840.1344508-1-bernd.kuhls@t-online.de>
Message-ID: <20200414194840.1344508-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Please note that building this version without autoreconf is broken on
my system in contrast to version 2.0.6, reason unknown after comparing
the source code of both versions. The configure script is re-run during
build causing an error because of variables missing at this stage in
DAQ_CONF_ENV to fix libpcap detection. Running autoreconf fixes this
problem so I took the freedom to add the parallel build fix used by
Gentoo in this series to save some build time again.

 package/daq/daq.hash | 4 +++-
 package/daq/daq.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/daq/daq.hash b/package/daq/daq.hash
index 6a0cb5ed07..680988c6d7 100644
--- a/package/daq/daq.hash
+++ b/package/daq/daq.hash
@@ -1,5 +1,7 @@
+# From https://www.snort.org/downloads/snort/md5s
+md5 ea796f001d1b00302e4e69e337ab2460 daq-2.0.7.tar.gz
 # Locally computed:
-sha256 d41da5f7793e66044e6927dd868c0525e7ee4ec1a3515bf74ef9a30cd9273af0  daq-2.0.6.tar.gz
+sha256 bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e  daq-2.0.7.tar.gz
 
 # Hash for license files:
 sha256 07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index 06983c0b6d..f7360cdb3d 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ_VERSION = 2.0.6
+DAQ_VERSION = 2.0.7
 DAQ_SITE = https://www.snort.org/downloads/snort
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
-- 
2.25.0
