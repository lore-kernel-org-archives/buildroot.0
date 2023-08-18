Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70057C7115A
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 15:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB2654004F;
	Fri, 18 Aug 2023 15:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB2654004F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzkCIURPaPHx; Fri, 18 Aug 2023 15:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4664C400A5;
	Fri, 18 Aug 2023 15:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4664C400A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A23691BF2EC
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C123402E5
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C123402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVXvZGwcbW6t for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 15:11:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E71D940140
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 15:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E71D940140
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C20CFA4C03EA
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 17:11:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41468)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qX18c-0007PB-1e
 for buildroot@buildroot.org; Fri, 18 Aug 2023 17:11:46 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 17:11:46 +0200
Message-Id: <20230818151146.988455-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692371506;
 bh=483Ufw+OTStooH3sKWh189eMrrA64+IaO9moArw8JVM=;
 h=From:To:Subject:Date:From;
 b=kVamqcuHRormiTpGSzA8Bf2IhqvQcRwSXNCf3Pr4nilUrGBQ5ycs2VS8/qSMLf1DT
 lM1x7mFtxQF/U04jWQv3Ttm5GzWiHJmQ4JEWXs22odO6D2lWO97rguRIxeXN8syFgM
 d0zX0nqiFFK1jPfjciCrYVsgfj8xhv/qCBAvGkrgTzltv5NHEYKY8/6w1rd5OnaOAH
 IhyAqJinKwi06niAv3Q6CxLsLrFhEHhLgT3sltj3YdoCNr/zcFppo+LuI/BYLF/uWE
 r90vmUiy7A2y80TaI/y+t3ox8nbFgMemJlcIl31ZL/pFx5M1wzSHvpc1OmGuHvqcJN
 Po04KZyqYGG9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=kVamqcuH
Subject: [Buildroot] [PATCH/next 1/1] package/openvpn: bump version to 2.6.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 16bffb7e57..b4fd3a9646 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  e34efdb9a3789a760cfc91d57349dfb1e31da169c98c06cb490c6a8a015638e2  openvpn-2.6.5.tar.gz
+sha256  3b074f392818b31aa529b84f76e8b5e4ad03fca764924f46d906bceaaf421034  openvpn-2.6.6.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7c2506870e..12c090ba3e 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.5
+OPENVPN_VERSION = 2.6.6
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
