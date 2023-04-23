Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF95C77B60
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 21:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B7C607E3;
	Sun, 23 Apr 2023 21:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1B7C607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pujFRlZbM_rI; Sun, 23 Apr 2023 21:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E415F607F5;
	Sun, 23 Apr 2023 21:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E415F607F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1931C2B11
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 21:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6186F607F5
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 21:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6186F607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c208jW7Z0-UJ for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 21:32:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8E15607E3
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8E15607E3
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 21:32:37 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqhJy-00AYb8-4w; Sun, 23 Apr 2023 23:32:34 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 230d2418;
 Sun, 23 Apr 2023 21:32:33 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 00:32:33 +0300
Message-Id: <20230423213233.2961770-1-aperez@igalia.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R8jW8bjVWH+atj49qnHimVepQLslVCZDA1IaWbsHMWY=; b=NNrTjMb6BMLKvzoz/KAdQRGcPq
 eCTYyo43TCVY3s7mYBEylpf2amlvpOvf0hA2zQl2bmc1UaL051vsIco2HYf7PhLOkGtkgZraaqivU
 M1QS+QrHqCyFtatcvV8xheysFEzTtT1zhrsEHVbNmxeW8oIFlEna9puqnPUGRBzXCj3k/51+WSM9I
 YORwB2nlv4vkJHQU4ZmgsGW5Bf5EL4Mf4PrsKBQUFaGF9TTCNkWywmIO+bNjykNZuzQK3ycxqH7Dr
 1UfnW1C8b50r6u+zuPpAV4kjeF4jCCHYh8mZyKTnWDA8ZBYfKSJ0Iww2J12NwULW5UB8Y8I0lobOf
 rzBJvyZA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=NNrTjMb6
Subject: [Buildroot] [PATCH] package/wpewebkit: import build fix for some GL
 drivers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Import an upstream patch which solves build issues with OpenGL headers
from some GPU drivers.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...nsGLOpenGLES.cpp-uses-GLES3-symbols-.patch | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 package/wpewebkit/0002-WPE-GTK-ExtensionsGLOpenGLES.cpp-uses-GLES3-symbols-.patch

diff --git a/package/wpewebkit/0002-WPE-GTK-ExtensionsGLOpenGLES.cpp-uses-GLES3-symbols-.patch b/package/wpewebkit/0002-WPE-GTK-ExtensionsGLOpenGLES.cpp-uses-GLES3-symbols-.patch
new file mode 100644
index 0000000000..f7e0d208ed
--- /dev/null
+++ b/package/wpewebkit/0002-WPE-GTK-ExtensionsGLOpenGLES.cpp-uses-GLES3-symbols-.patch
@@ -0,0 +1,110 @@
+From 5a2536dee79f6bdb6a75b40f9a33f7c1ba6dda85 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sun, 23 Apr 2023 23:44:51 +0300
+Subject: [PATCH] [WPE][GTK] ExtensionsGLOpenGLES.cpp uses GLES3 symbols
+ unconditionally in 2.38.x https://bugs.webkit.org/show_bug.cgi?id=255847
+
+Reviewed by NOBODY (OOPS!).
+
+EGLNativeWindowType can be aliased to a different type depending on the
+EGL implementation headers, and static_cast (or reinterpret_cast) may
+not always work. This is similar to 194561@main, but with the conversion
+being done in the opposite direction, therefore we apply the same
+solution using a C style cast expression, which works in all cases.
+
+For the build failures related to the usage of OpenGL ES 3 symbols, add
+the needed HAVE(OPENGL_3_ES) guards and avoid using GL_MAJOR_VERSION
+and instead parse the GL_VERSION string in a way similar as in the
+GLContext::version() function.
+
+* Source/WebCore/platform/graphics/egl/GLContextEGL.cpp:
+(WebCore::GLContextEGL::createWindowContext): Use a plain C cast expression.
+* Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp:
+(WebCore::ExtensionsGLOpenGLES::platformSupportsExtension): Apply
+HAVE(OPENGL_3_ES) guards, avoid using GL_MAJOR_VERSION.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/WebKit/WebKit/pull/13083
+---
+ .../platform/graphics/egl/GLContextEGL.cpp    |  5 +++-
+ .../graphics/opengl/ExtensionsGLOpenGLES.cpp  | 28 ++++++++++++++++---
+ 2 files changed, 28 insertions(+), 5 deletions(-)
+
+diff --git a/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp b/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp
+index 262b2fb90237..2b76c2974394 100644
+--- a/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp
++++ b/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp
+@@ -195,7 +195,10 @@ std::unique_ptr<GLContextEGL> GLContextEGL::createWindowContext(GLNativeWindowTy
+ 
+     if (surface == EGL_NO_SURFACE) {
+         RELEASE_LOG_INFO(Compositing, "Cannot create EGL window surface: %s. Retrying with fallback.", lastErrorString());
+-        surface = eglCreateWindowSurface(display, config, static_cast<EGLNativeWindowType>(window), nullptr);
++        // EGLNativeWindowType changes depending on the EGL implementation, reinterpret_cast
++        // would work for pointers, and static_cast for numeric types only; so use a plain
++        // C cast expression which works in all possible cases.
++        surface = eglCreateWindowSurface(display, config, (EGLNativeWindowType) window, nullptr);
+     }
+ 
+     if (surface == EGL_NO_SURFACE) {
+diff --git a/Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp b/Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp
+index 027da1081f5f..813a6f9be33a 100644
+--- a/Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp
++++ b/Source/WebCore/platform/graphics/opengl/ExtensionsGLOpenGLES.cpp
+@@ -40,6 +40,8 @@
+ #include <EGL/egl.h>
+ #endif
+ 
++#include <wtf/text/StringToIntegerConversion.h>
++
+ namespace WebCore {
+ 
+ ExtensionsGLOpenGLES::ExtensionsGLOpenGLES(GraphicsContextGLOpenGL* context, bool useIndexedGetString)
+@@ -253,23 +255,41 @@ void ExtensionsGLOpenGLES::vertexAttribDivisorANGLE(GCGLuint index, GCGLuint div
+ bool ExtensionsGLOpenGLES::platformSupportsExtension(const String& name)
+ {
+     if (name == "GL_ANGLE_instanced_arrays"_s) {
++#if HAVE(OPENGL_ES_3)
+         auto majorVersion = []() {
++            // Loosely inspired by GLContext::version()
+             GLint version = 0;
+-            ::glGetIntegerv(GL_MAJOR_VERSION, &version);
+-            return version;
+-        };
++            auto versionString = String::fromLatin1(reinterpret_cast<const char*>(::glGetString(GL_VERSION)));
++            Vector<String> versionStringComponents = versionString.split(' ');
+ 
++            Vector<String> versionDigits;
++            if (versionStringComponents[0] == "OpenGL"_s) {
++                // If the version string starts with "OpenGL" it can be GLES 1 or 2. In GLES1 version string starts
++                // with "OpenGL ES-<profile> major.minor" and in GLES2 with "OpenGL ES major.minor". Version is the
++                // third component in both cases.
++                versionDigits = versionStringComponents[2].split('.');
++            } else {
++                // Version is the first component. The version number is always "major.minor" or
++                // "major.minor.release". Ignore the release number.
++                versionDigits = versionStringComponents[0].split('.');
++            }
++            return parseIntegerAllowingTrailingJunk<GLint>(versionDigits[0]).value_or(0);
++        };
++#endif
+         if (m_availableExtensions.contains(name)) {
+             m_glVertexAttribDivisorANGLE = reinterpret_cast<PFNGLVERTEXATTRIBDIVISORANGLEPROC>(eglGetProcAddress("glVertexAttribDivisorANGLE"));
+             m_glDrawArraysInstancedANGLE = reinterpret_cast<PFNGLDRAWARRAYSINSTANCEDANGLEPROC >(eglGetProcAddress("glDrawArraysInstancedANGLE"));
+             m_glDrawElementsInstancedANGLE = reinterpret_cast<PFNGLDRAWELEMENTSINSTANCEDANGLEPROC >(eglGetProcAddress("glDrawElementsInstancedANGLE"));
+             m_supportsANGLEinstancedArrays = true;
+-        } else if (majorVersion() >= 3 || (m_availableExtensions.contains("GL_EXT_instanced_arrays"_s) && m_availableExtensions.contains("GL_EXT_draw_instanced"_s))) {
++        }
++#if HAVE(OPENGL_ES_3)
++        else if (majorVersion() >= 3 || (m_availableExtensions.contains("GL_EXT_instanced_arrays"_s) && m_availableExtensions.contains("GL_EXT_draw_instanced"_s))) {
+             m_glVertexAttribDivisorANGLE = ::glVertexAttribDivisor;
+             m_glDrawArraysInstancedANGLE = ::glDrawArraysInstanced;
+             m_glDrawElementsInstancedANGLE = ::glDrawElementsInstanced;
+             m_supportsANGLEinstancedArrays = true;
+         }
++#endif
+         return m_supportsANGLEinstancedArrays;
+     }
+     
+-- 
+2.40.0
+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
