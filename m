Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164E8606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MCxQ4bk4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9A9B406ED;
	Sat, 24 Oct 2026 20:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Vq8fl7on05j; Sat, 24 Oct 2026 20:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 08425406E8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875366;
	b=Jnin9R9Sl+SVWMZmZcMHV31ofDW7seFJoRYVc0ZMbajnAonITWCh5DMQP1uKmVkLQlUP
	 W+Qu2ebJjBnzumApgLPtRY6NWKs5PSXCpEAT6Nig5wsbohtXKKyK19lhysKPj9OCyCZkP
	 HRaPfkjuytxmMYfnipFG2PRSLj/CwSLJSYcJjHdu8j2azbIkcThmmf4En3WCnJQj4t5OX
	 ZuBHvMkDHMBbGGcy8sIb5iQ2x3GQ2RMB7pD3uEpIL5nab5xBmFJHMgEULKXT2HBgbCHCQ
	 gFohKHblGFIQ3CCgB86F/HEtfM3If5EiAc4aOD/AE0tkqZABwUwdZgOJYNuBwoyGxoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H1o0Q2ne856RljuAqMS+iPhUlB6M2H/hCi+Nf9r7t38=;
	b=FSHXH81BQahLOkhh0kRLwj7HpsKD1u5zw17NEWkEDnDBLestghNQle9Cxqg/pgMxfzDZ
	 C7pzpRaL284MH5h/gH+CK3l96Jo2fmR0U5wfMcpt4DYIoEoc79HEm5dEprbgotyziX7Qi
	 HYRwEIlzZSEh4l8y8PAnogmr1SKZMgaaWggIF4Ytw1XsFBtE1AloAJ8rwHQuSxk9hEd1z
	 xspEjMq4cspTOAmuK+gwrUDSWvDuh6CZaB1vbRBMmoL4/XBmUUl5iULqnM32N09zmMMLg
	 BP2n+B4cgYkII0iXc/Ywecy63hSr51tr01QxPJx/Bi2kxtAn5LFY6cfwolxU30zq0ww==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875366;
	bh=H1o0Q2ne856RljuAqMS+iPhUlB6M2H/hCi+Nf9r7t38=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MCxQ4bk4T82sr55+/3d8SmUJcXBZtBhcuAqz6FmUuZ9cS+NiqUzwQTcPNrD7k0mRX
	 VWyzmWHBxriewYWcDHHhrVwEvSD7706NF/tZX7p9GHT8Y6p39KetDrXubw6hX0ypT4
	 mexLnT++g4nEi+e/RgGTLZLX65Ar4UcLAi3F7UZAjJJ3pikgDHftsAkYPsqN3ywI8V
	 CMenK+Sdtsh9h03wjWKGurfD6VKlNMOHs7wMEemzoU0RApzZmwBzs9TpjRLbHB1pYM
	 7m4hWAtaPW9tzL2xGoIcFgGTOg6ajyKuuSkSL0taNTmEF7Oobc01hO5fHjbsxyEvGI
	 sDSW0UhGouuGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08425406E8;
	Sat, 24 Oct 2026 20:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9FB765
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BFE4605EB
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLYX7j4LxA-v for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BD5DB60626
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875363;
 b=gNJjWw4oJ2Q4oRcHAyfOfAlRbDTTRCQOMXMsdzlh0tWDu7t68P30sBYdi4TC2rRcx593
 Y+5V1C66HN5LQnbwFwbVJkbX2NiAOXshb1Wl/B7DZa8TqlMrme3Ivg+MN6ATrt6mLB0yn
 u+dnOaxZphNsXpe84AVxl0WYYj5kFw64c4/qwTRwArpUPwv1U1Kh5ZJYp1qe6T5dtIDmr
 QjIgxAP37Xy5b+lV8DhOvirNyWnNfE5lchsS5wCeIaAx0JqyYVv38VYTD4O6bq5KVh3Db
 rMzjeV+JTvh4c+zDvs7gMDFtf6eRfS8Xyj5QK8BChe0RgIXleLba1/SD7JFI9z3viXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875363;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5MnH3TCAz2+SIEVdDW30D0P01fCXO5Q5F05pDOMAKvQ=;
 b=Gc9Nn7ms3O4xMnT9vnQQofywRpq+p3LY7vkIoAuTpQrpnuLepcr5ZF0l4gm4RXRnyIDw
 ZWdef8AuQ8kaRE4GIdql0QhDMWPZr8UYybLy5vsghx1bdWdDqIfpyaBIdcLjY2utU4YdN
 noo5KibtAhF8MdUASn2R+g4P1Tg3EsqM9TzqYgI5MGmJP3LLIxITP7Ieo/PgmpfgOQq2K
 wlu5oXkvKzY4mo40VEdNbZqIsL6tjE8G14DZLO0zEAeYNm8ewbDSij9+n37CFnEPit/3Y
 dC+9mT/vEoNxmiH4Pi6qOWfWdwZQkGqRZxnahODem0tomhhr5CybTXzbYq+EDiFhUtA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD5DB60626
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 822979CC9A; Sat, 24 Oct 2026 20:54:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:45:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d72c97667a38aa9ff6da75b318e62bc86604b9c8
X-Git-Newrev: d39464398d3d14dd2176bc33cc8531f6f2299072
X-Patchwork-Hint: ignore
Message-Id: <20261024205438.822979CC9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ethtool: bump version to 7.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d39464398d3d14dd2176bc33cc8531f6f2299072
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index f19f646832..58b4f60cbc 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  4d78c26edc0255bc92f4b995b5fd66108d75ff966ed4694f6025a6d370bc2496  ethtool-7.1.tar.xz
+sha256  44256ddf4631ed08d816b7b8725f4b2e0f05e96b8c7ca64ee5c81449da2b6507  ethtool-7.2.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 77798971bd..82ec32897e 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 7.1
+ETHTOOL_VERSION = 7.2
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
