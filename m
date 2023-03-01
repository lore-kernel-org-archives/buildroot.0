Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A989C7EE23
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 22:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE315419AA;
	Wed,  1 Mar 2023 22:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE315419AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnP3I22iijBb; Wed,  1 Mar 2023 22:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8BA419A7;
	Wed,  1 Mar 2023 22:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8BA419A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2054B1BF304
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE64040602
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 22:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE64040602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrMfjmlg65NH for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 22:02:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0918405F4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0918405F4
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 22:02:17 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.224.61])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7B57419F58D;
 Wed,  1 Mar 2023 23:02:12 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 23:01:58 +0100
Message-Id: <20230301220159.161476-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677708134;
 bh=/W0W9NkWQLWMlEI/MkJFSyKdMCTEjIat3a9NFFnNipw=;
 h=From:To:Cc:Subject:Date:From;
 b=fEiTNVXEop43WRV5NQrHqJmTHb3VkqZ0yvi8neA+5o0zRt99e1LKE5/Ag3iwqvHyE
 LQ/4SvcqRfbnVKhThuxVzf4dViIeqz1pABCuDd6qkfEOvZrldhw/bbZq6wKC1K/Oo7
 ysKzTN3hPvmEoZ4GDuvI93NS2VAkM/sWncwL+Af61LSNjfVTatGhyh3smzWa1VrWw4
 BuXnOtihRzq3HmKtuyiBG5pIqX7zuxxPwoGV0FOZOSmiaonfXJcR5tRnS9eB7FZtYj
 17VCinx6EB3Wljdtm9dRGlwDV8RuBDMEVOK8hvDoQjI2ERVsT9fnQtGFMTHac5f+7p
 gz9Uy87THY7Rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fEiTNVXE
Subject: [Buildroot] [PATCH next 1/2] package/kexec: bump to version 2.0.26
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://lists.infradead.org/pipermail/kexec/2022-December/026399.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p kexec
    ...
    45 builds, 14 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 34e17339b9..4e16a53a35 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256  7ce2e5def38ec04f79feb107d02243dd586fbc68569eccf02f44bad3a13ec07d  kexec-tools-2.0.25.tar.xz
+sha256  7fe36a064101cd5c515e41b2be393dce3ca88adce59d6ee668e0af7c0c4570cd  kexec-tools-2.0.26.tar.xz
 # locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index ced7009ed3..c1411f6ab7 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.25
+KEXEC_VERSION = 2.0.26
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
