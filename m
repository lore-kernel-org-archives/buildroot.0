From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 22:59:03 +0200
Subject: [Buildroot] [git commit] mongoose: patch to avoid _LARGEFILE_SOURCE
	redefinition warning
Message-ID: <20140806210114.D3DFC9D342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef1d365c4153047f21759e1435f3cde7ad196260
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Davide Viti <zinosat@tiscali.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ongoose-0001-largefile-conditional-define.patch |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/mongoose/mongoose-0001-largefile-conditional-define.patch b/package/mongoose/mongoose-0001-largefile-conditional-define.patch
new file mode 100644
index 0000000..b1d759a
--- /dev/null
+++ b/package/mongoose/mongoose-0001-largefile-conditional-define.patch
@@ -0,0 +1,22 @@
+Avoid the following warning, due to duplicate definition of
+"_LARGEFILE_SOURCE"
+
+mongoose.c:52:0: warning: "_LARGEFILE_SOURCE" redefined [enabled by default]
+ #define _LARGEFILE_SOURCE       // Enable fseeko() and ftello() functions
+ ^
+<command-line>:0:0: note: this is the location of the previous definition
+
+Signed-off-by: Davide Viti <zinosat@tiscali.it>
+
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
