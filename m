Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055A7FCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A45EF41EB8;
	Fri,  6 Mar 2026 19:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKomYRZuKpWS; Fri,  6 Mar 2026 19:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 328D341E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826745;
	bh=Ty+5ct8dewMG5UhUzC+bDBc+XM9xRMvgLvGsEaOHgDc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hI4hkc3bnPgQSgFwBbmq5xWD8ZYb3+jLiqE24cyJDhX7EnbfJjLAQLB2L37DBzAF7
	 buo2JlsFBF2Jv8Ul3ut7xUkIY/lgI1lY7+zynsm42EAuddy2nybOsSzWuIpQz4INuu
	 M/xOmxDaMNdwFyHE6XayiRhOech8YG2U3WhvDpV0C4w9umyfsSMx3feOf3+gyMUFpi
	 jAL5vhsLYp/tpS/Ki0Bh6G23qPZmNo0H9+55bPvDNIIy8+QoqvnAMcSNVhhvO3mOl8
	 TqPiy+LDC/hFyF4UQTsEKDusSejYVY6FG8kHNQKNcKGYyeTY1/j8m+hoRqQYBY9v0U
	 xmlPY7+s90hpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 328D341E98;
	Fri,  6 Mar 2026 19:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3978F223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F6D3837AC
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjaAwVlV_4NX for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F8F081E88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F8F081E88
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 477F37FB67; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:36:31 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 13443f49697565097c092317c8ddcf19cf32d1f7
X-Git-Newrev: 4a7b4bc9dadc636746210b94e37ec44d3b82f57d
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.477F37FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wpewebkit: add
 dependencies to fontconfig & freetype
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a7b4bc9dadc636746210b94e37ec44d3b82f57d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit 2882cf4ae649f7d5e9cee72f84e672328f550845 bumped the
package from 2.44.4 to 2.48.3. This bump includes upstream commit
https://github.com/WebKit/WebKit/commit/3b54e45d63b84f8ab8d70179184c45be78386622
which was added to wpewebkit 2.45.1:
https://wpewebkit.org/release/wpewebkit-2.45.1.html
"Use Skia by default instead of Cairo for rendering."

The upstream commit includes dependencies to fontconfig & freetype which
were not added to buildroot and cause build errors with this defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WPEWEBKIT=y
BR2_PACKAGE_WPEWEBKIT_SANDBOX=y
BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y
BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM=y
BR2_PACKAGE_WPEWEBKIT_WEBDRIVER=y

Reported-by: Julien Olivain <ju.o@free.fr>
[https://patchwork.ozlabs.org/project/buildroot/patch/20251017131035.224739-1-aperez@igalia.com/#3599999]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7e12d9b4810610e75edf7d108b462804b72e519e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wpewebkit/Config.in    | 2 ++
 package/wpewebkit/wpewebkit.mk | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 5cbba43792..710fbca247 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -44,6 +44,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
 	select BR2_PACKAGE_CAIRO_PNG if BR2_ENDIAN = "BIG"
+	select BR2_PACKAGE_FONTCONFIG if BR2_ENDIAN = "LITTLE"
+	select BR2_PACKAGE_FREETYPE if BR2_ENDIAN = "LITTLE"
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JPEG
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 15a2ea93e8..31aba2a0b9 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -40,6 +40,7 @@ ifeq ($(BR2_ENDIAN),"BIG")
 WPEWEBKIT_DEPENDENCIES += cairo
 WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=OFF
 else
+WPEWEBKIT_DEPENDENCIES += fontconfig freetype
 WPEWEBKIT_CONF_OPTS += -DUSE_SKIA=ON
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
