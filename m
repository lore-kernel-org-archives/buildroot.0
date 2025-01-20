Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CF8C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 21:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C191780BED;
	Mon, 20 Jan 2025 21:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIBwKRhHEqS9; Mon, 20 Jan 2025 21:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C153B80C02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C153B80C02;
	Mon, 20 Jan 2025 21:17:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32CC0D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13B1C4145A
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIlt_sEkYxZN for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 21:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2EAD741458
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EAD741458
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EAD741458
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.125]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwUw-1tF0Nz42G4-013nLF; Mon, 20
 Jan 2025 22:17:32 +0100
To: buildroot@buildroot.org
Date: Mon, 20 Jan 2025 22:17:05 +0100
Message-ID: <20250120211707.2381182-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120211707.2381182-1-fiona.klute@gmx.de>
References: <20250120211707.2381182-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SifUU3CzMoaSmY9M4xKonrEqrS7O9SbbRHK6ilQqFYas4keTnH7
 i0EA4qQx/eGLIzMZse7SP9s+cwWlY/D8nY7TkPNxHORtYhRJD5c6KfYD6G6Wut7zAIhMMMC
 JUXHTNgVNXIYmyUr9dtz+SyxhJOI1OZuPXkuKD6lktZ/IlzQoPClMKyv/qG0Ltg3CWNXeVC
 4ONr/fEos9ZB+4Q0obiig==
UI-OutboundReport: notjunk:1;M01:P0:oUStwajJHcE=;wwAEAVEOjUbDJK7moAxwmoKfXD7
 UNQhghXpCpOHprrf9DmxNaWw8YbaYkvsFio1unyNctkBZUUNYmdcZc2Wkp1SqHoi9JPlLWT02
 JXEUepE3tBaxPiyo7nX/uEiH/0vlVKOamcZ4B0zpFJ8M7yb8sdhWWyLceHJ1IcT/ku/ny7RkZ
 eUnvhR5M2S/yF0SlRlYF8aouECGarjVVsoKBGgI+1UyUqMA51J032fZM/FVpRe76LmqUsrGrz
 TB9yIhRt3kI3GkuURW5CPRm4tjrRt/rkKLLuOYob/uv8K3gHBAbCAzwMVnt7gYlnK+N5efW4A
 64EWi0AdD4YlQK0fmjcS6aNVOb2QPigvrW+rVCyo2wgF7eT2CoE/XqvflBsFJPwgh1i+QrxLj
 1RYXUZcJamubhSAjznTuLIeDO0nQ498dEPQ1phCsZzG4Qnmy17vJSUhgNKxCQ1HtJmv5xxQ78
 AshGxnG993sxoqbtIGLcYSHsL3oZtwYVLoleBLtcLuXipogYjkELsljcfu5gWBZQ6/on7gby7
 GG/VktcDfXdzCwjXz7d6emKWrYdZGRXhKvzHOof6ynUS976SsOCgMaCBkmAcqRDUw1e4nff59
 huG6uMLuta02eeqMVidwfv8qYKONN1gCb6BKchKIVzU1v4xfYYZ05nxVz8K/LbC2MKtVYKNul
 HLVMm+0NTrkFQKncUyI3Ltz0JrNjvSoH6FWnsByxkEYk9d1DPk5pK6V9rl9/95eYGueUkTL4L
 oOYtIRDvBn7kOvQatN6XI56VDBodDaKYXw9GTjigABFD4fUnkBGmA2gngt0t71CrrRQarwPfD
 Rxuoyp896yY40dpcs5JvuiGOluBkPPs34mxCtOvPpYZ4e/qWD0VyoVeQ+7yU1YG7hg1V027/C
 4xlMl7Dri1+Nd4MZ3pzW5K2MQSCsGSb0FYnLJtHUIegYFEKhmOH+enTKa93GtB+qjJWtVmW8W
 gtni53MrMMY7lt4HEY4lckCGIdr6ycV4oD8gBcGUdR9bF9BslO2fqyGHNJets0UcddE6I/YII
 4Q4Ttn+l1xNChaA5N0VfYoVlLjlBthf37Cf+yA4uu9ss3+ZU8GwvJ0Pt4R4/zaZPrxyf0KHSs
 1HPhav/uyjsKIuQjjw2qg2qvKtz4UTRGDyMEpAFOroIhmts27q4UjGOCIYl57phtCDpe0YmyS
 CzIwL4be4y5U1DIbgkVOl009OYYe8GA1r5uYq6yDe8w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737407852; x=1738012652; i=fiona.klute@gmx.de;
 bh=rPXBoXuQNMaYICsD9IU6ikW+G10Jw2Mw7SwX7hH+ABA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=B/SfqtJlQb2PANu7h3ZNTXw8ayGdTbiDSKqYwxrZmJnjIM8NjrA5EKkGeFsGIH7J
 +T1qMKExyaLUt5T2lt/Mh8L3EIRVo1QjVA1H+BynVM+Qw0Kuz61Wpn8FN2AFHpD1p
 mBGPejSo/E98uFDjZWbgvGSyxwltpMhqpkQMoVv0/0WTG6dWV40vtjOKotswnI8q3
 GxT0d8O/UXyhzkhjl2TKjugUGExZr8LhDW99Z4AJ29CTWOym1aGOH5UrHA/LsnkG/
 Wcaa3vwZz8Iin2thc4EOhJvt0k2jsqge5J0w1g9wFpRb53wC2ixi+qCDAGVNDBk7E
 5Y+lU3Xb5jMKZ15pLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=B/SfqtJl
Subject: [Buildroot] [PATCH v9 4/6] package/python-gobject: allow build with
 musl
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Current gobject-introspection releases (>= 1.80.1) work with musl, so
relax the C library requirement for python-gobject to match.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v7 -> v8 (Fiona):
* Split python-gobject build with musl from version bump

 package/python-gobject/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 3354535637..f5d4cebe31 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -12,9 +12,9 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 
 	  https://wiki.gnome.org/action/show/Projects/PyGObject
 
-comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "python-gobject needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
