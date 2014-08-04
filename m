From: Davide Viti <zinosat@tiscali.it>
Date: Mon,  4 Aug 2014 23:31:43 +0200
Subject: [Buildroot] [PATCH 2/2] mongoose: patch to avoid _LARGEFILE_SOURCE
	redefinition warning
In-Reply-To: <1407187903-10013-1-git-send-email-zinosat@tiscali.it>
References: <1407187903-10013-1-git-send-email-zinosat@tiscali.it>
Message-ID: <1407187903-10013-2-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/mongoose/largefile-conditional-define.patch |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/mongoose/largefile-conditional-define.patch

diff --git a/package/mongoose/largefile-conditional-define.patch b/package/mongoose/largefile-conditional-define.patch
new file mode 100644
index 0000000..4fbaa04
--- /dev/null
+++ b/package/mongoose/largefile-conditional-define.patch
@@ -0,0 +1,12 @@
+--- mongoose-5.4/mongoose.c~	2014-07-28 13:19:00.000000000 +0200
++++ mongoose-5.4/mongoose.c	2014-08-04 23:10:59.164092500 +0200
+@@ -49,7 +49,9 @@
+ #define _XOPEN_SOURCE 600       // For flockfile() on Linux
+ #define __STDC_FORMAT_MACROS    // <inttypes.h> wants this for C++
+ #define __STDC_LIMIT_MACROS     // C++ wants that for INT64_MAX
++#ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE       // Enable fseeko() and ftello() functions
++#endif
+ #define _FILE_OFFSET_BITS 64    // Enable 64-bit file offsets
+ 
+ #ifdef _MSC_VER
-- 
1.7.10.4
