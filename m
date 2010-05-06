From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 May 2010 20:20:02 +0200
Subject: [Buildroot] [PATCH 2/7] Add staging libraries directories to -L in
	external case
In-Reply-To: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273169997.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2eb4b09529a891e07d09ddf36c483b28edcd19ae.1273169997.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to solve issues of libtool trying to link target components
against host libraries, it seems that specifying -L$(STAGING_DIR)/lib
and -L$(STAGING_DIR)/usr/lib works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0bec9a1..2ed7f42 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -98,6 +98,7 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TARGET_CFLAGS+=--sysroot $(STAGING_DIR)/
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
 #########################################################################
 
-- 
1.6.3.3
