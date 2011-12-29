From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2011 18:40:45 +0100
Subject: [Buildroot] [PATCH 3/7] libftdi: add host variant
In-Reply-To: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d6050c9d11a97ec3a5a2601393d798e502ec7cc7.1325178529.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libftdi/libftdi.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 55481d9..2c0afe7 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -20,4 +20,7 @@ else
 LIBFDTI_CONF_OPT += --disable-libftdipp
 endif
 
+HOST_LIBFTDI_DEPENDENCIES = host-libusb-compat host-libusb
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.4.1
