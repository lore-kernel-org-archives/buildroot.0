From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 21:37:40 +0100
Subject: [Buildroot] [git commit] sam-ba: select BR2_HOSTARCH_NEEDS_IA32_LIBS
Message-ID: <20130106204313.0ED9B9A631@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ec970246547dce915aaeff8394a3b0303a205db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sam-ba is a pre-built binary tool built for x86 Linux, so on x86-64,
it requires the 32 bits compatibility libraries to be installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sam-ba/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
