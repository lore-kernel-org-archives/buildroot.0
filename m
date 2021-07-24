Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5C2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1DF60E98
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF1DF60E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA5DB605DF;
	Sat, 24 Jul 2021 20:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VijptIf4S-sL; Sat, 24 Jul 2021 20:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24C05605D0;
	Sat, 24 Jul 2021 20:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0C51BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEA1D834CB
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2o3xzK5HasCJ for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C8F783437
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 95D9B88938; Sat, 24 Jul 2021 19:34:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:08:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3662a2f0981d987eb68ad433d24e1987b2a5689a
X-Git-Newrev: de12bfae807a5620c860bb45a95dfabc7e5ba242
X-Patchwork-Hint: ignore
Message-Id: <20210724193419.95D9B88938@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: add LIBVIRT_CPE_ID_VENDOR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=de12bfae807a5620c860bb45a95dfabc7e5ba242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:redhat:libvirt is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aredhat%3Alibvirt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvirt/libvirt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index eeedfbdc51..a0fd5af951 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -9,6 +9,7 @@ LIBVIRT_SITE = https://libvirt.org/sources
 LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
 LIBVIRT_LICENSE_FILES = COPYING
+LIBVIRT_CPE_ID_VENDOR = redhat
 LIBVIRT_DEPENDENCIES = host-nfs-utils host-pkgconf host-python-docutils \
 	gnutls libglib2 libpciaccess libtirpc libxml2 udev zlib
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
