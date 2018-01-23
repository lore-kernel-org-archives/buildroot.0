From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 23 Jan 2018 20:37:59 -0200
Subject: [Buildroot] [PATCH] daq: fix build when flex and bison are not
 available
Message-ID: <1516747079-16281-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

daq depends on flex and bison to be configured.

Fixes:
http://autobuild.buildroot.net/results/43da4ae3b7fc26e6712d369d4d030954d0d85149
http://autobuild.buildroot.net/results/0fc2bcf9da758f427adf2fddca8ad1dace6a080e
http://autobuild.buildroot.net/results/7411ac4ae5bef71b78c69b680de2b72f389ad2ee
... and many more.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/daq/daq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index a1edc20d2a1a..a23a9dc5ee47 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -9,6 +9,7 @@ DAQ_SITE = https://www.snort.org/downloads/snort
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
+DAQ_DEPENDENCIES = host-bison host-flex
 
 # package does not build in parallel due to improper make rules
 # related to the generation of the tokdefs.h header file
-- 
1.9.1
