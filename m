From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  9 Oct 2017 09:13:52 +0300
Subject: [Buildroot] [PATCH] pdbg: needs host dtc
Message-ID: <94be5c0c4d4ec6468ff65ba442c2232fd9813a4b.1507529632.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/722/722e043ef7503abe5fd6517c82b0f12627f4b0f4/
http://autobuild.buildroot.net/results/891/8918121581f9834fef55169599766a9134600e89/
http://autobuild.buildroot.net/results/475/475106ec793e16bf8c250d3a69e853537e3e0def/

Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pdbg/pdbg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 1a3a6b7422a9..70adb0a166d1 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -9,6 +9,7 @@ PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
 PDBG_AUTORECONF = YES
+PDBG_DEPENDENCIES = host-dtc
 
 PDBG_MAKE_OPTS = "GIT_SHA1=\"$(PDBG_VERSION)\""
 
-- 
2.14.2
