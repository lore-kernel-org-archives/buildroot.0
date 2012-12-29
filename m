From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 17:14:51 +0100
Subject: [Buildroot] [PATCH 4/4] sam-ba: select BR2_HOSTARCH_NEEDS_IA32_LIBS
In-Reply-To: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fbccee70c941bfc2e0c8d0c62cf78e726ae35170.1356797653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sam-ba is a pre-built binary tool built for x86 Linux, so on x86-64,
it requires the 32 bits compatibility libraries to be installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sam-ba/Config.in.host |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index 20b2b36..6093865 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Atmel SAM-BA software provides an open set of tools for
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
-- 
1.7.9.5
