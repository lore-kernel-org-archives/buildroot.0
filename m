Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775BAC02184
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 11:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B0380DF1;
	Tue, 14 Jan 2025 11:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYfbvmYkM8vR; Tue, 14 Jan 2025 11:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2944E80E67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2944E80E67;
	Tue, 14 Jan 2025 11:32:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F72B94B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8B1340B02
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHbtAzAzwxRs for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 11:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B30740AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B30740AC4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B30740AC4
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw3X-1t79uU0tRz-00joH4; Tue, 14
 Jan 2025 12:32:25 +0100
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 12:32:10 +0100
Message-ID: <20250114113212.1791033-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114113212.1791033-1-fiona.klute@gmx.de>
References: <20250114113212.1791033-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NgMMQ6p1RW8/cxufJm15t9DYCtQA/2J4ijC5/i/0NuXMrtP/gry
 xBVHDAbTvniXLyrg/Hli7HODw0QHbLXygWiWMEWNr2RWu7XCkdjxptDt1Z0h399qra1N29s
 cfeBBxMOU2dnirUCiq6euTdC+k/MIK1R26KqUNbiG3ljRqsYHbdt702tVvxgg4aJ8CGY5cC
 j7Co+WpJx0BLNUQNaq/oA==
UI-OutboundReport: notjunk:1;M01:P0:m2YGA8dUdaI=;6FmfrbrviqujlJxvlYcrXItnR4q
 RZ+0lKabQhcrnLkRwo1XddMMM8bda1Uy/DsEoCA35GU7neX2miMo+sfTPYeFQohcGSlnTsYpW
 Iz0/ZZaiyuVSyUUYCg/gcvRvpDev4D32mZmkMyu3bUkk+SsMezgvgXLlSNbg4FefWZxIKp2Pp
 eaJwt+OuMNC9okTaX0iPchLmKr0+iFmU3csLMGLmVl4xYxUXurQSet7IuQhwtehg56CXqW3AM
 WJ54a/9J+1lIuqauThgsCMjRAjA2LHhqkA5OpSLkQ+UcFvzjnzumKsMMsjFZ6PhfCvViPIdH+
 DNduBmxUgzGgu1ra0nCSyZk0S8SZNLfeckpMTwXlB/3e8PLCcgpDEI+DS3V4U3Yh7sUyCwszg
 0OOGQjTngriJH9Ur+5SQgS3VyAuPklgPa8+jU/pOKqp6OVxQMd08ifO5U/klF2gHx+CiVZqK+
 mLp8MSeVZKao9Hjo6ZPZy416bY7qQTO3ykD5jNJLBpkoisLkowVMqGxfFiQCvhQYL4WUv3iZX
 8MkYfNObU6cdCncjVClINRqFGc2kuiCElaL6PrNORLUQ688MFfxNs+6+xH9bniXQo2p5V8Ec9
 dXZ0xKiAwujnvwSoC8lv/oy/G4aCzGBaBDq5u+bYid7OOGN2sDDBPqZ8XrZP2QP4K2H/2U2Ce
 9fu9eVYVSImfhkEgXWhZSDHkDnYJWhR9usU1iUsAOILymnNnmewn4t3QyDrTUYHbomJSZDBOE
 z5n2yTH8x7mnNzOqegOHALLuEgKJqnE4S2FkD0jqXm9uL/4YCMXf+Pz+ZTbuYLxfEQcQzLDGM
 ApHun+9Y+3AV4lmFp/07ZHwgTYWDfT9L80y4XflVXWDk+1T8h0EG6XeeT8H2TRnI237oWP2+F
 hnybrTmkwqOa+Ra7BSl1n8P6Li3IC85dir0fu9HGy2bisKEIEViikYHoRba9PUJ6R+g59l+ic
 YALBn7ZXgdHMdhKhqoGshLZ9zzFHhqzmu3rqhTavuYMYoCJrPCXVt0maoNhpTke7TxQi2ia6a
 +vkiR2IiGB4sf5S2qKl0qJojitjwr/anvOj4iO/s59nPq2wi4KKiZ10YVfPyfCgaj75qDgyVO
 ldUtbOCHc/6qOTwerOjonKpj4FVPDb
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736854345; x=1737459145; i=fiona.klute@gmx.de;
 bh=rPXBoXuQNMaYICsD9IU6ikW+G10Jw2Mw7SwX7hH+ABA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XQc34OZahYhLRVGZyqc/EEMK5U/UhfzqGsH8TCqbgkHyWQSm4wj651He/H4Iqlkb
 /ISD6ITJYYqjPNpxM+H4JHnwPYYK5lAKJvj9bNajmeLdtUDarexzq7VfQlI1Ub2pk
 xiiqFtwQTU8ihmzSr6OZJ9l/h9u7K6c6HfFs9Y2Hq/HmPbO0+/I3XD0W8hpWTIB/e
 Csi/DBSRatfT4G6uL8yIi6MtN9+P7eqm0cYkOdA8EaolMdIUx7OnSnOQrx2VSVkST
 sYUb1Jd8u2S3qgWN8rl3ThfhZpT+zJIigr9i2F3cU5XIqmoqI/W3U1p0k5neutaK6
 Ms30kAuR5cr9+chT8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=XQc34OZa
Subject: [Buildroot] [PATCH v8 4/6] package/python-gobject: allow build with
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
