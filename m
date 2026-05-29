Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDFDCD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 14:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B22E6136C;
	Fri, 29 May 2026 14:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4j60xP91FAa; Fri, 29 May 2026 14:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EE8E60EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780065940;
	bh=cFpGUoBPwX7twrQ+WpIcCprJwNHMuT+uEgdFGRI13JM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gUsTcSJEJat4mBdNUaUM9vtXvJgMYbPPyjs6H2f/XxltYBZ/ykTCxhZWBloN3OmSJ
	 ye6WishDqFXsWTlRdOYPRu8lQoWdlJTHK5mohv5p+TCEPS3DqGArc44Uxiqyo3970b
	 h2GjggfV6CmXmYfViyXZxUd8D8mKRJnSoz9SlO1CLv7HWPnx8cXcnYYvq3wnGtvR+N
	 ez5Yu2pJTxYCpdKokDAVL7kUBFg3mz+U3ZbfYc9H2UeGk8ys/jfxjvJJZ9aGeEMH0J
	 xvOOXfs+67fDX4rdQluU5ugCc2r+pVjwVuhgh0MQjRHAZDaL0qPe+u2t8ChEuGF2z+
	 n8y/gZDIQba9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE8E60EBA;
	Fri, 29 May 2026 14:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 630C0288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A7740063
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiKwxUGLbbfc for <buildroot@buildroot.org>;
 Fri, 29 May 2026 14:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9316940015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9316940015
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03534873E8; Fri, 29 May 2026 14:45:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 16:45:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bbf5d842be40e1a7cd0722729f8e071cd643f581
X-Git-Newrev: ba6cc945be10c1d8fb335f95eeebea3a016195e4
X-Patchwork-Hint: ignore
Message-Id: <20260529144524.03534873E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wpewebkit: fix
 stale libepoxy dependency comments
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba6cc945be10c1d8fb335f95eeebea3a016195e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

wpewebkit depends directly on OpenGL ES and EGL support, but those
dependencies are not imposed by libepoxy itself. Update the inline
comments so they describe the actual dependency source before relaxing
libepoxy's package-level EGL/GL dependency.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a4b761f39541dcb210b356583a767f67095253a3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wpewebkit/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 710fbca247..300c95c970 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -38,8 +38,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
-	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
-	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
