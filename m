From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:16:49 +0100
Subject: [Buildroot] [PATCH 02/10] ipsec-tools: add host-flex dependency
In-Reply-To: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
References: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3b3801f861a1528e8b5a8bc1b765993ea26bf1b4.1267046193.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the following build failure:

checking lex output file root...
configure: error: cannot find output from flex; giving up

Caused by the fact that a host version of flex is missing
in $(HOST_DIR).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipsec-tools/ipsec-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index a8b87a6..38cd57b 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -145,7 +145,7 @@ ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT), y)
 IPSEC_TOOLS_PROGS+= $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL)
 endif
 
-ipsec-tools: openssl flex $(IPSEC_TOOLS_PROGS)
+ipsec-tools: openssl flex host-flex $(IPSEC_TOOLS_PROGS)
 
 ipsec-tools-source: $(DL_DIR)/$(IPSEC_TOOLS_SOURCE)
 
-- 
1.6.3.3
