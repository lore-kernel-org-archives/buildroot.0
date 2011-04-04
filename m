From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Apr 2011 15:44:35 +0200
Subject: [Buildroot] [git commit] Makefile: remove extra quotes around host
	linker flags for cygwin
Message-ID: <20110404134731.C776481ED4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f894e85e8537ec8b54abe40db21bd8281cedd245
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3541

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES  |    1 +
 Makefile |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index aa48a56..d0a61eb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,6 +16,7 @@
 	#3457: alsamixergui: broken URL
 	#3475: Calling sync on large filesystems when not always necessary
 	#3511: make busybox-menuconfig does not download busybox package
+	#3541: Quotes in the top Makefile:217 break buildroot/kernel config...
 
 2011.02, Released February 28th, 2011:
 
diff --git a/Makefile b/Makefile
index 2e698cc..02a5c36 100644
--- a/Makefile
+++ b/Makefile
@@ -214,7 +214,7 @@ ifneq ($(findstring cygwin,$(GNU_HOST_NAME)),)
 HOST_EXEEXT:=.exe
 HOST_LIBEXT:=.lib
 HOST_SHREXT:=.dll
-HOST_LOADLIBES="-lcurses -lintl"
+HOST_LOADLIBES=-lcurses -lintl
 export HOST_LOADLIBES
 endif
 ifneq ($(findstring mingw,$(GNU_HOST_NAME)),)
-- 
1.7.3.4
