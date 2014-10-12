From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sun, 12 Oct 2014 18:34:44 +0200
Subject: [Buildroot] [PATCH 1/2] Config.in: update description of
	BR2_PREFER_STATIC_LIB
In-Reply-To: <1413131685-5567-1-git-send-email-abrodkin@synopsys.com>
References: <1413131685-5567-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1413131685-5567-2-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With time BR2_PREFER_STATIC_LIB option meaning changed from "prefer static
libs when possible" to "do not build dynamic libs and build statically linked
applications".

This patch changes variable description.

Note that variable name is kept unchanged on purpose - it will be modified later
when real "prefer static" mode will be introduced.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index 24aa883..66cea4a 100644
--- a/Config.in
+++ b/Config.in
@@ -536,15 +536,18 @@ comment "enabling Stack Smashing Protection requires support in the toolchain"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
 config BR2_PREFER_STATIC_LIB
-	bool "prefer static libraries"
+	bool "build statically linked applications, no dynamic libraries"
 	help
-	  Where possible, build and use static libraries for the target.
-	  This potentially increases your code size and should only be
+	  Build all application for the target statically linked.
+	  This potentially increases your filesystem size and should only be
 	  used if you know what you do.
-	  The default is to build dynamic libraries and use those on
-	  the target filesystem.
 
-	  WARNING: This is highly experimental at the moment.
+	  Note that some applications cannot be build statically and so are
+	  intentionally disabled.
+
+	  The default is to build dynamic libraries and dynamically linked
+	  applications to use those on the target filesystem.
+
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
-- 
1.9.3
