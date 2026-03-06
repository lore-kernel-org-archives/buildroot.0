Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8F5FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CF6F613E0;
	Fri,  6 Mar 2026 19:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jF9AqkyLRjgK; Fri,  6 Mar 2026 19:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C9F613D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826663;
	bh=6FGYA78ujkvW9TgyQJbG9KOkOpFrxdwKVjI9TaBCqB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jiok7EJGFDwOizGC09AssTvYE+qwlW7/FrcQvjcwju8JKF+vqcbzmSNjibnBLDy5z
	 tpJk1SDsoNfslJU8nMXJWQPnu+CIjmMuVYxaEzHIcI1ZNzZ2byIu7MLBuuo3Hu4Myx
	 TakwGIZa7fff40dW0SltDJm0D+/rtZgk3RgU3EDfI4LpVLrs9uN06/wh0rp60y5BlT
	 l+wzgUt1fESsfzznhlWKWvaWAQkMG0GMu6RfvSd8CWkWEB8qvCH4BM7Acg9fMwXwqi
	 E7UQCuEAsulPdc1Ms0Cp48zVplWMBkN4xJ3SlDuJbXJ57ELknPpKG7cRlS0vEQnU8I
	 1sq6PXvcuBAYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C9F613D6;
	Fri,  6 Mar 2026 19:51:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E35D25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AEEF60E09
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKzI_Z_b4VOb for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02CE61088
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E02CE61088
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E160186823; Fri,  6 Mar 2026 19:50:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:36:55 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6930cbca0d3a25c72ff3389e6a17298688b8aad8
X-Git-Newrev: e728b91276d63d667e0d7eae4dad88def4c0c672
X-Patchwork-Hint: ignore
Message-Id: <20260306195049.E160186823@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/wpewebkit: add
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e728b91276d63d667e0d7eae4dad88def4c0c672
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
index 73ba4e6bdf..c8602f1de6 100644
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
