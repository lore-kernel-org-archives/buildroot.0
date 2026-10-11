Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A881CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64DEB60658;
	Sun, 11 Oct 2026 13:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Zgaq_nu72Ce; Sun, 11 Oct 2026 13:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 780A66060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724119;
	b=AZgrF/vyCfMj2veJXW+5JhsgkYsG8aAamebfTw/JU3uSxvf9j2m7f8mzb5tAyqwaYVxt
	 ptXz7wmH72YZJG+nJxIIgTA8Cc7II0pmkUauvS7Jk2Qprz7SJeEVdh2vCsyuy0K9R4GKa
	 5EtzV2OBjLZDqHWx+O41a6hN+lPcan9ov+6UJa5Rro34bSA+uElhItITel+4BdnCHbTdb
	 zCdUhuGr7CxmrtnQL1ndXeWhxCkFgrPCKsU2sbXrzp47OpTFaO/o+NdQbYwJgpWQMs7FB
	 WwRU0fuq1i178gml9EF0vn181Dgnjj/O/Fb2cD2tYLrdtfnq75odv5Ytk+eKa9GCI3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724119;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tw31wVszLp9vaZdLesfL4tQX4gHrqkYVuPU52Hwxcc4=;
	b=GgNwRQ9COEX0OXjom+JaPDsX8e9i+OW0mT5YR8cFC5+8HJl/iKf3D2wCsuMSIpWrJqPv
	 BX955nxXw7rjf3zzY6jHTIodM9+MnS2jiCj9U1RdcMt8zjL7e1L+KkqvU5eM12yy8Gq2A
	 MF8vsyGeBaJSYr802IFQHHwsvoSdkXRTGgsmXTK3HRELmdgFFeIQfzYEeIdcupPpdvn1c
	 4QYkU5Ksh4ykk0TYM48LlEzt4Cglc+qYla8z47/+Id3fFKPNsk4S4TcCLTanOeeAcUDfS
	 psvKzpYgPYMOY2LFqRc/Johp68/9Pm1o6NS9oHY5DyvC0xQ9qY9t0miylCI/qmBP7oA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724119;
	bh=Tw31wVszLp9vaZdLesfL4tQX4gHrqkYVuPU52Hwxcc4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M2p3okT+F8WzXTlxTcL8sIdEdKm1ZWuVoce42ABO5BenhG0lDIQm3sb1nfjSXaukW
	 AIsFfV/bN8yz20PLeTwjfAi+3UmsaXqSfwfI8pbOZr3lZfwyGTUZEm5NhpPUR6CvXH
	 /TCWQ2xmUObwb+adytIkKFL2B5ByfwR+zmaRvYHtlycWHxbYTttqlmUtV8Er/o6eZX
	 tSvTwv9x3FQd8sLIpGS/e+B4J9aESMnX21cyI7Ef7+D3BQanCx/SidsjFaSvTb5clY
	 7PsvPIkWHEaLLXFYKl9ErGqQQAmuYeCa3Y6NiyAfMnpJqnbkeV0g3UZ/bwfTp3tlui
	 5kpI4v2NqCf4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 780A66060E;
	Sun, 11 Oct 2026 13:08:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB7E72E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B186440595
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fWpa37AMhCC for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CBDEF406BE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724117;
 b=TeULR7C3O4pXVDqvGJTx4ZSjqSA6bBP/eRx+JyKkZR1t+Mxp1yKv33EVkcV5ZCJqkpLw
 4A2tBFV2VJFB0w3XK3cHw0HvBZkcERAykjTf7geB5Xr1YWv9uTSvYlB6KNHwCdu4ebUXb
 ctx2pC9QYxO+C3h40VSw8Jl22bDagh+udQzhxQbhhZ7kH9r+sidW2ip91Ay6wgN6CbTs9
 25Y5KDc73YuNsLnLqWUFvy0Biebok40bGVpC9o1MjST4Oz5W/dBFtTQAfLHFF5WQ24Rzn
 WQOeCRBQ58dNIE/FyZkL9H+tN6W+3dKwkbh+oCN/lMY6GD6OG3yoBOONu6S2G8qPeGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724117;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dgWJrDiIZQxJh6n3dAFVh1uoX0stUG5fOV6WQwgQWnI=;
 b=YkLfGD0yh6diapGEouRwvOrmigtCXZzuXb2MkeCoshBJMAuUefrxGDxDzRq/PiCz2RP/
 oJYPp1lM5z9zR034XfO5VLrQa7ZKjSU9yhz9Kc65b6aY08IZvz6TdRPv/Xy4HTF5qF5Xb
 9mJD3t24tpzic46sw7LwyALGT70Qfid75sSrHBKKVlfGWKUkC2iW5pnUvW5Goio19A134
 J4FWQAL5ilOMeFIhtxJsDXY0JpgVvF9SYxhXAVq981tQrEjUfHKXRaDhYInDYQasZ7Gll
 AsyFvbsP0N8wzR5dg91mv/Y6DoRnCyT6gHI7UWmyXwjLbgXe/rslH05GQeQwWA/uYtg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=brDsCb39; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=brDsCb39
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBDEF406BE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723683;
 bh=dgWJrDiIZQxJh6n3dAFVh1uoX0stUG5fOV6WQwgQWnI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=brDsCb39Hc2CwTJbydJwaD3ECOaIm/VkfZXviEMRa8eZ8rq85AnWXK02+aIB/NpY2
 IpVBVrqorPGZ1O2kAsSfrLcjeW1RHOxOQacDXhTPYy7+8AN++HxvlF5RvaAiouFBfU
 QqE6u/eKEShE/0BJxjlT6rW2UxvZaz6EY/zLrXzNJWH1wT9R1kdJziALp/2fbY9laI
 prno0Dyg7sQrC/Ip5Av6i2CS+6/Xzjko6e7HI6Sl0vVAlEPqdX7qsqlY9uVGPkCzYx
 3dusBngQ6cOYV4OkJbzQt69z6Q9GO/7rqcgOYpntSCkOCJt3JMPMoX9hPaGX5PLwwQ
 yTTASz/t055sg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 e49tKRwk0Wu4k7pDP2hOjYMl33zaoNb79zl896n0FSaMwW1vEhLLai0ad7RjtHrDBuknXC/+cHk
 E81uc64x7laok/H95Zmd5jnzPsfPMCt6jrmC9Hvr9AGcg0yViPDONftpJ+Sgv0pHt01YseiAkqq
 /nj+7zat3j4tIm/lWT0S0HJ5qyN2ufr7lqkP8L8MAKJUsM//dgui8hRusuFR42x9ZKePBbziVTw
 lmA7piHHNwCaizXVMgGrj2P4YbvViwIDQFwM78oO4yswvFYFT7z/v27qFzmqApb142Tp9rC6IaQ
 jwJrG3zecwdi28JVvrWHjxTOuR0YzlmLtoPAdlKIFw2z3nocmfHUUjuZW8VqT8ewmarV33mEenP
 kNVwFBHN9bqL1DIcv8j3ZOo+hw6WFrr+OXTOK2ZPX3R//eNKIU4HH8svqK0sXsD0hW6T3y+ijcN
 8jmA0msRrIwuep8EMmehz5sZvLcWxZMPTLVDdncPOVtRvrBYNvEk1xR9UlPeF9HhSrar/Bws6J1
 J09tV+VLD4hbihZjNR82CwJPvK0EPYJ4yhniskVE7gim3YPxMtrGINg4fPSN7w51usfeSrZ2kTQ
 xtJKLSQ=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17450A4C5328
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-3f01
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:48 +0200
Message-ID: <20261011130058.3443432-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 43/52] package/kodi-pvr-zattoo: bump version
 to 22.2.3-Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replaced dependency rapidjson with nlohmann-json:
https://github.com/rbuehlma/pvr.zattoo/commit/3a5b4bb46b7c89f1f6c5f5a6ebf30fc0728a5671

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/Config.in            | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-zattoo/Config.in b/package/kodi-pvr-zattoo/Config.in
index 9a6eb3fec5..7596e7e7f7 100644
--- a/package/kodi-pvr-zattoo/Config.in
+++ b/package/kodi-pvr-zattoo/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_ZATTOO
 	bool "kodi-pvr-zattoo"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi PVR-Addon for Zattoo
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 8b5509d947..57e847e230 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d57efceff2f451cc8864d429abed6c7d808ea5092fddf3ece3f598d4a5e26b1f  kodi-pvr-zattoo-21.0.7-Omega.tar.gz
+sha256  0fb9f133124efa1e19b38fb7748e371295ed2d74c38b1b0ba907321a927a0a60  kodi-pvr-zattoo-22.2.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 12d2d5ff09..413b783d3a 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.7-Omega
+KODI_PVR_ZATTOO_VERSION = 22.2.3-Piers
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-KODI_PVR_ZATTOO_DEPENDENCIES = kodi rapidjson tinyxml2
+KODI_PVR_ZATTOO_DEPENDENCIES = json-for-modern-cpp kodi tinyxml2
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
