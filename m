Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACE8FA3752
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 532FB60586;
	Fri,  2 Jan 2026 15:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8vdj_8xCv_c; Fri,  2 Jan 2026 15:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6491860596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368760;
	bh=6z+Evs4hmqoR3WzR3jbg0Q9C2HWa7adp3gf3ctDkGY8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OVk/dZoe5O7pIU3mohNbjH4h3YiCDZpzoZ/GTReYQgWO+Yt49rJoVME+uv+Rfph6T
	 enrATicvPQUwLgD64fQhJjsaoSremrastQVNsmn/tDkl2ZelIfV6Tfn2x49GCOC08q
	 V7qUDxHgbH4o6jXKiyIjd2A3ypdVaw+lBtSRnANC91q8ZKNL1ZYNGxUuzasjoAvHn/
	 QMvMTW6itesp9Tpv3cNYrqEacmHnlcXIuM4APWDUrBb+UzcLpv38XoymfngAyq/pd/
	 OtOxnue6jNuBaJ2xeOit2pGRDxlp5hFqGqw42bEW1huqWnEHY0NrOYH7uQviffjfZM
	 OY0Uhr6kwW8Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6491860596;
	Fri,  2 Jan 2026 15:46:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66FC5D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5953E80C1F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9KSwOhslhbI for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFFE80C17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AFFE80C17
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:45:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D2EB87F24; Fri,  2 Jan 2026 15:45:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:45:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 451e735aa06b2bd986418118923ea7590a5b83a7
X-Git-Newrev: f11279d81eab1b88d3a505cf9dea05b9569a496f
X-Patchwork-Hint: ignore
Message-Id: <20260102154558.6D2EB87F24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcnano-binaries: bump version to
 6.4.21
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f11279d81eab1b88d3a505cf9dea05b9569a496f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the latest version of the gcnano-binaries blobs, which are
compatible with the last v6.6-stm32mp-r2 kernel from the
STMicroelectronics BSP.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index d3c64d44a3..f1c8b48b0d 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c7454ac44c9e3ead20a978a5c009e8489fa90ce5cf291be31016a7f497bea26  gcnano-binaries-bbaae49a0e4859ed53f898a250269c8a237261bc.tar.gz
+sha256  b4cb4c1e8a39c131fe52781038fea8ae33120eee41eaddb3feb329c4b2205068  gcnano-binaries-7c181cacf89f918039e64934fdc33fe817a052cd.tar.gz
 sha256  29c78804b097b5cfee0e802bef9f60348a635640eadd8a91b7ce82ddf17fbf5a  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 03912ea585..f171c03059 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.4.15
+GCNANO_BINARIES_LIB_VERSION = 6.4.21
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
 
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
-GCNANO_BINARIES_VERSION = bbaae49a0e4859ed53f898a250269c8a237261bc
+GCNANO_BINARIES_VERSION = 7c181cacf89f918039e64934fdc33fe817a052cd
+GCNANO_BINARIES_USERLAND_DATE_VERSION = 20250226
 ifeq ($(BR2_arm),y)
-GCNANO_BINARIES_USERLAND_VERSION = stm32mp1-$(GCNANO_BINARIES_LIB_VERSION)-20240206
+GCNANO_BINARIES_USERLAND_VERSION = stm32mp1-$(GCNANO_BINARIES_LIB_VERSION)-$(GCNANO_BINARIES_USERLAND_DATE_VERSION)
 GCNANO_BINARIES_ARCH_TYPE = arm
 GCNANO_BINARIES_SOC_PLATFORM = st-mp1
 else
-GCNANO_BINARIES_USERLAND_VERSION = stm32mp2-$(GCNANO_BINARIES_LIB_VERSION)-20240517
+GCNANO_BINARIES_USERLAND_VERSION = stm32mp2-$(GCNANO_BINARIES_LIB_VERSION)-$(GCNANO_BINARIES_USERLAND_DATE_VERSION)
 GCNANO_BINARIES_ARCH_TYPE = arm64
 GCNANO_BINARIES_SOC_PLATFORM = st-mp2
 endif
@@ -68,7 +69,7 @@ define GCNANO_BINARIES_INSTALL
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
 	for file in *.pc ; do \
-		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|23.0.3|" $$file > $$file.temp ; \
+		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|24.0.7|" $$file > $$file.temp ; \
 		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
 	done
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
