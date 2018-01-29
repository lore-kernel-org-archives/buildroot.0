From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 22:07:54 +0100
Subject: [Buildroot] [git commit] daq: add necessary dependencies on
 host-flex and host-bison
Message-ID: <20180129210806.0506D87FB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c683d37cdcd920497cbd15cc7fadac756b641a04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

daq depends on flex and bison to be configured.

Fixes:
http://autobuild.buildroot.net/results/43da4ae3b7fc26e6712d369d4d030954d0d85149
http://autobuild.buildroot.net/results/0fc2bcf9da758f427adf2fddca8ad1dace6a080e
http://autobuild.buildroot.net/results/7411ac4ae5bef71b78c69b680de2b72f389ad2ee
... and many more.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/daq/daq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index a1edc20d2a..a23a9dc5ee 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -9,6 +9,7 @@ DAQ_SITE = https://www.snort.org/downloads/snort
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
+DAQ_DEPENDENCIES = host-bison host-flex
 
 # package does not build in parallel due to improper make rules
 # related to the generation of the tokdefs.h header file
