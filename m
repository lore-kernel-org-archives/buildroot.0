Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54851C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 09:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEDD4418BB;
	Thu,  6 Oct 2022 09:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEDD4418BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2jzskd2G_Xz; Thu,  6 Oct 2022 09:58:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C4C4172A;
	Thu,  6 Oct 2022 09:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88C4C4172A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90D331BF957
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 09:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BDF661012
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 09:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BDF661012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwsXd_FHrMHn for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 09:58:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A052A60A9E
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A052A60A9E
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 09:58:48 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ogNeO-00BGvz-FX; Thu, 06 Oct 2022 11:58:44 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 06565371;
 Thu, 6 Oct 2022 09:58:33 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  6 Oct 2022 12:58:28 +0300
Message-Id: <20221006095833.1116173-1-aperez@igalia.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221004133057.2003750-1-aperez@igalia.com>
References: <20221004133057.2003750-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LuxR5kvqAPBmITtugbp6msta1M0ikIhQg9um4Z5vFi4=; b=ETg15KjLix9CPWTy65cnOrY2JA
 Q9w1brA9hJpXiohHcdvfhtm+x1F/CSYX13PmkY7JovWqM7/NHdE5TwnOsKprTQlXiN0khyS2KGcy8
 T6qwlXT2n4hkqaXLBITIj9//G3aE/4U8DSQNiYI/94UkHjEJaGuBdZ12brJMv9p2ty3xChaA5yLeE
 BoRd/Watz1a6GBEwciNjxpWwcRLGMoZwKMH7XKEfsiP9x5CagZMLl2GMNWtVB3TPMGOUxmMujc/K4
 Ys6O9hJUbpE2mk/9z3mGUp/fKnOHKr3dMctPD6At2FNB411Ht7KMy2zq7cyyNoo0zlyWZ5aBzoFxe
 Tnz66NxQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=ETg15KjL
Subject: [Buildroot] [PATCH v3 0/5] Update WPE WebKit to 2.36.8,
 and then 2.38.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series bump wpewebkit to the 2.36.8 release first, which includes
security updates. Then the set of packages needed to run WPE (libwpe,
wpebackend-fdo, cog) are updated to the recommended versions for the
2.38.x series, as documented at:

  https://wpewebkit.org/release/schedule/#compatible-components

The separate patch with the 2.36.8 update is intended to be cherry
picked into stable branches, as it does not need newer tools (compiler,
C++ standard library, CMake, etc.)

=)


Adrian Perez de Castro (5):
  package/wpewebkit: security bump to version 2.36.8
  package/libwpe: bump to version 1.14.0
  package/wpebackend-fdo: bump to version 1.14.0
  package/wpewebkit: bump to version 2.38.0
  package/cog: bump to version 0.16.0

 ...m-dependency-when-protocols-are-used.patch |  36 ++
 package/cog/cog.hash                          |   8 +-
 package/cog/cog.mk                            |  37 +-
 package/libwpe/libwpe.hash                    |   8 +-
 package/libwpe/libwpe.mk                      |   2 +-
 package/wpebackend-fdo/wpebackend-fdo.hash    |   8 +-
 package/wpebackend-fdo/wpebackend-fdo.mk      |   2 +-
 ...cpp-fails-to-build-NEON-fast-path-se.patch | 328 ++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |   8 +-
 package/wpewebkit/wpewebkit.mk                |   8 +-
 10 files changed, 407 insertions(+), 38 deletions(-)
 create mode 100644 package/cog/0001-wl-Fix-libdrm-dependency-when-protocols-are-used.patch
 create mode 100644 package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch

---
Changes v2 -> v3:
  - Fixed Cog build due to incorrect Meson option usage (pointed out by
    Gary Bisson).
  - Add Cog patch to fix picking libdrm headers correctly (also Gary Bisson).
---
Changes v1 -> v2:
  - Added a first patch with a 2.36.8 update (suggested by Thomas
    Petazzoni).
  - Added a 2.36.x version of the ARM NEON build fix (suggested by
    Michael Nostoff).
  - Added one additional patch updating cog to 0.16.0, which has been
    released in the interim.

-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
