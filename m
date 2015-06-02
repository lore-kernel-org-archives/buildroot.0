From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 22:58:19 +0200
Subject: [Buildroot] [git commit] build: remove deprecated sstrip option
Message-ID: <20150602205903.9BD3B7FEB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=106f5b8c509352dc64249ca941dabb34ccc31f8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been deprecated since the 2014.05 release (a year).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/Config.in b/Config.in
index bdff7df..eaf47dd 100644
--- a/Config.in
+++ b/Config.in
@@ -372,19 +372,6 @@ config BR2_STRIP_strip
 	  symbols on the target are needed for native debugging, but
 	  not when remote debugging is used.
 
-config BR2_STRIP_sstrip
-	bool "sstrip"
-	select BR2_PACKAGE_SSTRIP_HOST
-	depends on !BR2_PACKAGE_HOST_ELF2FLT
-	depends on BR2_DEPRECATED_SINCE_2014_05
-	help
-	  Binaries and libraries in the target filesystem will be
-	  stripped using the 'sstrip' command, which strips a little
-	  bit more than the traditional 'strip' command. This allows to
-	  save space, mainly by removing debugging symbols. Debugging
-	  symbols on the target are needed for native debugging, but
-	  not when remote debugging is used.
-
 config BR2_STRIP_none
 	bool "none"
 	help
