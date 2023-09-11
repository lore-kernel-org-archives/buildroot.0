Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD05BEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F49D414E9;
	Mon, 11 Sep 2023 19:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F49D414E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxutlrQwQI9B; Mon, 11 Sep 2023 19:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA29D41532;
	Mon, 11 Sep 2023 19:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA29D41532
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 184FC1BF860
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53DB61055
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B53DB61055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mcRFsAjF8yb for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:08:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9EDC60ADE
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9EDC60ADE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA90486CB0; Mon, 11 Sep 2023 19:08:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:19:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5b6e8f15e6b5965771ad7b5b844f27e1185a2c35
X-Git-Newrev: d504025058e484b64cc8c32d0fc0b141ddbd4576
X-Patchwork-Hint: ignore
Message-Id: <20230911190853.DA90486CB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcoap: add CPE
 ID
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d504025058e484b64cc8c32d0fc0b141ddbd4576
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

libcoap:libcoap is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/FA3B1D63-B4E6-4EAD-A2C9-CE4E52D83E37?namingFormat=2.3&orderBy=CPEURI&keyword=libcoap&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd379c7224e584e46b589d5483a2eeda7eafe6f4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
