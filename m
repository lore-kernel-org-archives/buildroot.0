Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75BBC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 903E68174D;
	Tue,  8 Aug 2023 22:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903E68174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9HEOiAot148; Tue,  8 Aug 2023 22:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C031A82137;
	Tue,  8 Aug 2023 22:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C031A82137
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74C1F1BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A05640C0E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A05640C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jojzXdiJKDPC for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:18:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CC1140A97
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC1140A97
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B27384F15; Tue,  8 Aug 2023 22:18:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 00:12:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc2a530c5b8a700978e29eae2ef6deef3cefe20c
X-Git-Newrev: cd379c7224e584e46b589d5483a2eeda7eafe6f4
X-Patchwork-Hint: ignore
Message-Id: <20230808221841.4B27384F15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcoap: add CPE ID
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd379c7224e584e46b589d5483a2eeda7eafe6f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcoap:libcoap is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/FA3B1D63-B4E6-4EAD-A2C9-CE4E52D83E37?namingFormat=2.3&orderBy=CPEURI&keyword=libcoap&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcoap/libcoap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index c0a941a0c8..4b536d8117 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -9,6 +9,7 @@ LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
 LIBCOAP_LICENSE_FILES = COPYING LICENSE
+LIBCOAP_CPE_ID_VENDOR = libcoap
 LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
