From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Oct 2014 00:18:11 +0200
Subject: [Buildroot] [git commit] Config.in: update description of
	BR2_PREFER_STATIC_LIB
Message-ID: <20141013060647.7DA2EB2C49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d9c0df074ef412fe5012ad6e2b4d96e04c95859
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With time BR2_PREFER_STATIC_LIB option meaning changed from "prefer static
libs when possible" to "do not build dynamic libs and build statically linked
applications".

This patch changes the option description.

Note that variable name is kept unchanged on purpose - it will be modified later
when real "prefer static" mode will be introduced.

[Peter: tweak help text as suggested by Thomas and Yann]
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index 24aa883..9cefcbc 100644
--- a/Config.in
+++ b/Config.in
@@ -536,15 +536,19 @@ comment "enabling Stack Smashing Protection requires support in the toolchain"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
 config BR2_PREFER_STATIC_LIB
-	bool "prefer static libraries"
+	bool "build statically linked applications, no dynamic libraries"
 	help
-	  Where possible, build and use static libraries for the target.
-	  This potentially increases your code size and should only be
+	  Build all applications for the target statically linked.
+	  This potentially increases your filesystem size and should only be
 	  used if you know what you do.
-	  The default is to build dynamic libraries and use those on
-	  the target filesystem.
 
-	  WARNING: This is highly experimental at the moment.
+	  Note that some applications cannot be build statically and so are
+	  intentionally disabled.
+
+	  The default (if this option is disabled) is to build dynamic
+	  libraries and dynamically link applications to use those on the
+	  target filesystem.
+
 
 config BR2_PACKAGE_OVERRIDE_FILE
 	string "location of a package override file"
