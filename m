From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Oct 2017 09:53:40 +0200
Subject: [Buildroot] [git commit] pdbg: needs host dtc
Message-ID: <20171009074818.A870580431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a46bb7d9af2ff924989db11409e9f03791d9f2c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/722/722e043ef7503abe5fd6517c82b0f12627f4b0f4/
http://autobuild.buildroot.net/results/891/8918121581f9834fef55169599766a9134600e89/
http://autobuild.buildroot.net/results/475/475106ec793e16bf8c250d3a69e853537e3e0def/

Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pdbg/pdbg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 1a3a6b7..70adb0a 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -9,6 +9,7 @@ PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
 PDBG_AUTORECONF = YES
+PDBG_DEPENDENCIES = host-dtc
 
 PDBG_MAKE_OPTS = "GIT_SHA1=\"$(PDBG_VERSION)\""
 
