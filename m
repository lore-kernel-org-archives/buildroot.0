Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A02AD66B85
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DE940401;
	Wed, 17 Dec 2025 20:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PRvR--lFxgi; Wed, 17 Dec 2025 20:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 394B74045D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766001836;
	bh=iLs8VMoqc/SWwQhKeoZJ4oYeSt+argi+MUE5lUaX7Bw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PPuMZpk4jbMYmG4xeWdPQukfgUZEKZgvE+iN+Kd6Z+c98PhmZwUlGQ0LmZ26ToHH6
	 7oiJwjfpiND6YpR3bzBl7bPhpzdgnxuJNYU/vawErulbxWe2qbMiV6mfS6M1/LQff5
	 8/7Lo0UlJkeb6dDToDPTOOceGKh+yUlvOLZAAa5WoDePOmuwF6LUIOXxiE3TReYEak
	 RYqNgvuVp6ZU3JVP3gpSlPUgxujv6SQprXHLA4KuiML3YOMknpW7iJ021cSf9tYXWV
	 hAjbO1yQ6QUX40zs5cdgYeyYUgkItNjjeFVKGEtf1oCCnsFGiBBIAz8NAq5DFupuMB
	 0vIxTEkpZhsVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394B74045D;
	Wed, 17 Dec 2025 20:03:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C949361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73F114045D
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4LuNwSDox6T for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 806D140401
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 806D140401
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:03:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7187E87105; Wed, 17 Dec 2025 20:03:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 21:01:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d7261b27a9cb47c25602061333bea632ad80c2c
X-Git-Newrev: 6c512c8be0249e1d0e7a83186dff6482701d779f
X-Patchwork-Hint: ignore
Message-Id: <20251217200353.7187E87105@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: properly propagate wlroots
 dependencies
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6c512c8be0249e1d0e7a83186dff6482701d779f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6 added a wlroots ->
libgbm dependency, but forgot to propagate it to package/sway.

Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Tested-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sway/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 1f4b497af3..1e4c8bfd3e 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SWAY
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango, wlroots
 	depends on BR2_PACKAGE_HAS_LIBEGL # wlroots
 	depends on BR2_PACKAGE_HAS_LIBGLES # wlroots
+	depends on BR2_PACKAGE_HAS_LIBGBM # wlroots
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
 	depends on BR2_USE_WCHAR # pango
@@ -53,11 +54,12 @@ config BR2_PACKAGE_SWAY_SWAYNAG
 
 endif # BR2_PACKAGE_SWAY
 
-comment "sway needs systemd, udev, EGL and OpenGL ES support"
+comment "sway needs systemd, udev, EGL, OpenGL ES and GBM support"
 	depends on !BR2_PACKAGE_SYSTEMD || \
 		!BR2_PACKAGE_HAS_UDEV || \
 		!BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBGLES
+		!BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_PACKAGE_HAS_LIBGBM
 
 comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
