From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 22:28:42 +0100
Subject: [Buildroot] [git commit] ffmpeg: Add sse4 related options
	BR2_X86_CPU_HAS_SSE4 / BR2_X86_CPU_HAS_SSE4
Message-ID: <20140113212946.C125B9C49F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e8e3c2879c55ee9552a6f4161ea2d28aff62543
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86       |    4 ++++
 package/ffmpeg/ffmpeg.mk |   12 ++++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce30605..15d5c16 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -9,6 +9,10 @@ config BR2_X86_CPU_HAS_SSE3
 	bool
 config BR2_X86_CPU_HAS_SSSE3
 	bool
+config BR2_X86_CPU_HAS_SSE4
+	bool
+config BR2_X86_CPU_HAS_SSE42
+	bool
 
 choice
 	prompt "Target Architecture Variant"
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index e60ced7..35c03a3 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -249,6 +249,18 @@ else
 FFMPEG_CONF_OPT += --disable-ssse3
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
+FFMPEG_CONF_OPT += --enable-sse4
+else
+FFMPEG_CONF_OPT += --disable-sse4
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
+FFMPEG_CONF_OPT += --enable-sse42
+else
+FFMPEG_CONF_OPT += --disable-sse42
+endif
+
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
