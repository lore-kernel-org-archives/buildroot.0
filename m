Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCB9C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C3560F3C;
	Wed,  9 Aug 2023 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33C3560F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFKdTVJ12ZZN; Wed,  9 Aug 2023 20:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7095760E1D;
	Wed,  9 Aug 2023 20:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7095760E1D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B76EC1BF3EB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F4BF40891
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F4BF40891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFz3cLfTI7Ck for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:54:59 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71F7C4086B
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F7C4086B
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2EB4C13F84C;
 Wed,  9 Aug 2023 22:54:54 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 22:54:33 +0200
Message-ID: <20230809205434.312601-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809205434.312601-1-ju.o@free.fr>
References: <20230809205434.312601-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691614497;
 bh=QBCgXwrY3Cz3+871/eifKHH6xx4AO93hH/5nM3Wb6Dc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bhIVzu1DCqXBRDIPhhOSrKxnGhGpiFcc8lFDopEfg9/uw7NtGjPBm32sU3Hgyp/dr
 dVWc23gRD+07I+yXrCH38GPgbgTMonN5HYua6TdPY0xA52WcncACbHT38SOMctEa8P
 AAXWBNKXXz/lfqVJzYJto0n6uJRsxStZlRbEbKpHmEPDEYelCxSvy62w5WuCQx4ckq
 qCxi9mmFkMFVx4jcnm/In9JD37qDgYerWp3uirH9XZJBWjcR21f7GH4wHoLQNRkqo+
 ozMbkmV0XFgkOynIq3iSGEveZAKhC2D2ZnGbgEX7fVWFB8Uhhk2hZPLV/SPazLnepV
 dgZO62+BHnHXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bhIVzu1D
Subject: [Buildroot] [PATCH next 2/3] package/kmscube: add optional
 dependency to libpng
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
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

kmscube libpng support was added in:
https://gitlab.freedesktop.org/mesa/kmscube/-/commit/a09d38f94e27dcc5fe52adf99404c821028e3e9d

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kmscube/kmscube.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 699af0b6c4..a47df74f7b 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -10,4 +10,10 @@ KMSCUBE_LICENSE = MIT
 KMSCUBE_LICENSE_FILES = COPYING
 KMSCUBE_DEPENDENCIES = host-pkgconf libdrm libegl libgbm libgles
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+KMSCUBE_DEPENDENCIES += libpng
+# libpng is automatically detected in meson, there is no build
+# configuration option to pass.
+endif
+
 $(eval $(meson-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
