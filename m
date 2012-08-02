From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:55:20 -0000
Subject: [Buildroot] [git commit branch/next] sam-ba: only propose it if the
	host is x86 or x86_64
Message-ID: <20120802195256.2E0668E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=498ea22be27863c8eff99033384f9d268167a2b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As sam-ba is delivered as a binary for x86

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sam-ba/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index f2ea01f..20b2b36 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_SAM_BA
 	bool "host sam-ba"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
 	  Atmel SAM-BA software provides an open set of tools for
 	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
