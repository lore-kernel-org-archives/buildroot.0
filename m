Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B26EEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AAA360BF0;
	Thu, 14 Sep 2023 20:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AAA360BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B042Fuu-oK-T; Thu, 14 Sep 2023 20:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F32960783;
	Thu, 14 Sep 2023 20:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F32960783
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECACC1BF31E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D425A813F9
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D425A813F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uv8yYxoLny6b for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:53:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AB6A813F6
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AB6A813F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A1CA86FC3; Thu, 14 Sep 2023 20:53:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:53:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68df20336664d4d0b1a9d8d0285d23eba631845a
X-Git-Newrev: b169bebd7ed4f3f6246f5ef2f3c6228d4e4e9978
X-Patchwork-Hint: ignore
Message-Id: <20230914205346.3A1CA86FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: add LIBSPDM_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=b169bebd7ed4f3f6246f5ef2f3c6228d4e4e9978
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:dmtf:libspdm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Admtf%3Alibspdm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libspdm/libspdm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 48c46e41f7..cbcbed29de 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -8,6 +8,7 @@ LIBSPDM_VERSION = 3.0.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
+LIBSPDM_CPE_ID_VENDOR = dmtf
 
 LIBSPDM_INSTALL_STAGING = YES
 LIBSPDM_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
