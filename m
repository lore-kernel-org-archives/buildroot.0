From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Oct 2011 17:00:20 +0200
Subject: [Buildroot] [PATCH 3/6] libftdi: add host variant
In-Reply-To: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bddab802e1cc86346a7636ba7dc9275f68ecf278.1317481137.git.thomas.petazzoni@free-electrons.com>
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
