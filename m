Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81637C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 10:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DC444012B;
	Tue, 30 Jan 2024 10:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DC444012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImOVYXnkh99A; Tue, 30 Jan 2024 10:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 166D440279;
	Tue, 30 Jan 2024 10:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 166D440279
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDC61BF29C
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 10:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 602CD40279
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 10:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 602CD40279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJIEp9q2nSPM for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 10:56:31 +0000 (UTC)
Received: from aven.230ruedubac.fr (unknown [IPv6:2001:bc8:2e57:145::87])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E912D4012B
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 10:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E912D4012B
Received: from aven.230ruedubac.fr (localhost [127.0.0.1])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTP id DA31456497A;
 Tue, 30 Jan 2024 10:56:25 +0000 (UTC)
Received: from alden.230ruedubac.fr (knet.230ruedubac.fr [45.83.230.42])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTPS id B171B564979;
 Tue, 30 Jan 2024 10:56:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [62.102.240.118])
 by alden.230ruedubac.fr (230ruedubac.fr domain) with ESMTPA id 5546932BA02;
 Tue, 30 Jan 2024 10:56:25 +0000 (UTC)
From: David Barbion <davidb@230ruedubac.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 11:56:07 +0100
Message-ID: <20240130105607.1006473-1-davidb@230ruedubac.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=230ruedubac.fr; s=mail; t=1706612186;
 bh=szBB4QPYEK13h3G+9JBc+9SwEz9TIXy19H5vl3lvWsU=;
 h=From:To:Cc:Subject:Date:From;
 b=tbJdR9lfVDDtFQHILqgHAhxXuclXhqXGiOC+EZsFBgsmvdvpyzMK9boXZlI6mR2oj
 y5DsUYrSZSNVT1wvdc5vY9UvWPsROwQWKYyZqxVx+LjQQwFgJTZH0Gz/erj1xU7gvO
 FBOU0s0vlQX9p2Ex7hhckRvO1LLOObtivCX8iJxU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=230ruedubac.fr header.i=@230ruedubac.fr
 header.a=rsa-sha256 header.s=mail header.b=tbJdR9lf
X-Mailman-Original-Authentication-Results: aven.230ruedubac.fr;
 dmarc=fail (p=none dis=none)
 header.from=230ruedubac.fr
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.5
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
Cc: John Stile <johns@msli.com>, David Barbion <davidb@230ruedubac.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version contains a fix for aarch64 based systems.
On such systems, dhcpcd would crash without setting any IP addresses.
See https://github.com/NetworkConfiguration/dhcpcd/commit/6a36f96740f8fb9f9b615b157962505f1ad8a00c
and https://github.com/NetworkConfiguration/dhcpcd/issues/260 for more
details.

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
---
 package/dhcpcd/dhcpcd.hash | 2 +-
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index b015dce4ac..fb4f6064bc 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
 # sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.4
-sha256  ced5bbde8da3726eac77b9e77e4f31a89c9849d811ef8a2c749664fc5f55a718  dhcpcd-10.0.4.tar.xz
+sha256  eb1f3cfef3069781ff8c896d7cea922639964afe22db28c069dc3f37f57eb428  dhcpcd-10.0.5.tar.xz
 # Locally calculated
 sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index ba1481e83d..ab3f98dd5a 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.0.4
+DHCPCD_VERSION = 10.0.5
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
