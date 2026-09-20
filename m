Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797BEC982D0
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 07:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49DBC60657;
	Sun, 20 Sep 2026 07:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNCCAhAbTPf4; Sun, 20 Sep 2026 07:41:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EE42960661
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789890090;
	b=NNgWjbw7a4dgAi3O/wjHzf2wkX5ylVNRGg5ejxHtiDTTmhNG1VduarqECiqBKb4GIveb
	 veM8l/IpnTxBqng/OghP388OLzXnvjwRBZ7NC7OiEDDA0Sz8PDsVXE5JmIGsUBUzaoop2
	 +iTQYuVZx7S1AnSk6Q2PJ/XWizI5ro+bUaESY8QJcdl/Bl2TU2EUQUXmbEp8/YV51eLPe
	 rBZq0M5lIVc7S5We1Fi/Cp8JaCRTS6PKz6rSqBuH+EyaSIjAyduDL9O20mrdQ1QFQoAMO
	 CXpHGnDfiTLsqWkjolnNu4ON0Md9gwA92+VyUHa6N09gzlRwDTcfk6vJfwG1aWacsEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789890090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-Alimail-AntiSpam:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wmoe6UZN2nUyWf15+yYYcL55KZtqhAp99LH5vOXzku4=;
	b=hI41yliPDKmW74xJDAspWTvq4OOW3dqsHBUaSuoHXTEFYMrHpDoKCyYI6y79zRCzx0Em
	 gfvY8PvDAk9kthHilmPNivg5/FTlmUX6jf0LS5DdF4NMjIM2SVRjEZYk+upw5yhi0FZXr
	 DjPdRZgMMrd+yKcArvXOHbYXM1sNenDh4tW60Uu940Ji+NVVO/6JTYuF27D9STJ3vI/49
	 OqCpDFiUlcmZmOpWR204OyPJX3CWsYmiLER+USwyhn9W5UIXycTuHmRAoPWBIu1ecdjR2
	 n4Tj43bVdnW/20/DdPi47TKB/bfJ+zxbXDZB/QIkIkUmNyNyE0JNOIYfugB5+wrTrug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789890090;
	bh=Wmoe6UZN2nUyWf15+yYYcL55KZtqhAp99LH5vOXzku4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=apgiFKIr7JgBuX9G98QnG9goZhp+x02oxFABMV/cx1RA6mw2P9fdh8EqdeGIHnUdr
	 a64i9dnZfvbw/v3Ms6a0A2tM7EQa8d6+XbHUvARnPLxfHQ3ef2XMZWLdnhFygyFw79
	 H3iq2I/NwkxKM/s4reSg62yCqC7wbEqYIh1osVgOF2CArapz1r/AC/PLQY8JxCxGhG
	 65YXmIIYdvYk0jZIUn6ygOpG1vyvtGMoSI2sa9bmcAhTxKhDoEpjo6gJcyxM2cHu2Y
	 0njvY1L0EwdgV1RKTvVXo7XK7r0GsihF31RUNLiBbhK2spQa90I7oUeG4btQSeMnJ/
	 44OoNYqDAqRgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE42960661;
	Sun, 20 Sep 2026 07:41:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C813FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F79E810AA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBzb83ORk83Z for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 07:41:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AA730810A5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=115.124.28.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789890084;
 b=CROHPyf/o2eQHyJ+cTNWHdUUgSygSEsKqyc6kvNsc9HC/V2JKg82U7ZxMiD6MpqT97wr
 VLI3O0GW/o+cZxRD405/BxLvxo3PrcXXyvFCgiBwaGSoltuHkRsVrtDhh2hJP4tguJFMT
 H4lF3ZEqDyrvSkVFWsYZzCPCD0r2f+dt5YDap0pJaXEGlCM/HQmgWLvwS1OUl0r0Lov7f
 gJmuiFlriaC0pzsdwg8fZ/98i1z4KqPq0TSa7V+zzE6Eg4qMBUEOEoiaTA8bHNdm+T3To
 rM3IJzPo+r+Uii+sRjjMNq8BVY/Mu2Zk+e9lhHGHEXxzlvS+jcMFIkLfgaLREvRiXaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789890084;
 h=Received-SPF:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4aPrh0RkDdtWrUuP4O9app7HadHV1gI8X6RUtwNUfJE=;
 b=WieIeB+DBahQ+NDRhJspuBXsbz96WnELRg/Jk3Q7zfaJPIlEN9kXV2/verjmP+P3wnFN
 XzsTqpZExvBNfn4N/wB255E3YOQtVsICa/r9FhU/d7yGyKphW19Rl5Fx+OZeePYuNyA5F
 smJp2kqdGH3fXqNFQtcowEwG6rc9G1BjnhJwv7hL/9OKh6R92RZLLsaP3E3AgLF4qozC9
 evB/PAArMDakkYsPdBFBtajxEiepj2wzQ1TC61DjjPAJhG3MsZZ6NETqXy1pQJ1gczYc/
 /qU6oYVAmasptfi27N8HCM+hPYVXR0AztVc9luNTs+z6q0cjDICoY1ie3Rv//XNKf4Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=sunkaisens.com; 
 arc=none smtp.remote-ip=115.124.28.122
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.28.122;
 helo=out28-122.mail.aliyun.com; envelope-from=daiwei@sunkaisens.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none)
 header.from=sunkaisens.com
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com
 [115.124.28.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA730810A5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:17 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2934607|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.205547-0.00163274-0.79282;
 FP=16512042563195299143|0|0|0|0|-1|-1|-1;
 HT=maildocker-contentspam033032053168; MF=daiwei@sunkaisens.com; NM=1; PH=DS;
 RN=3; RT=3; SR=0; TI=SMTPD_---.jHw7ZiR_1789890070; 
Received: from Builder(mailfrom:daiwei@sunkaisens.com
 fp:SMTPD_---.jHw7ZiR_1789890070 cluster:ay29) by smtp.aliyun-inc.com;
 Sun, 20 Sep 2026 15:41:11 +0800
From: Wei Dai <daiwei@sunkaisens.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Wei Dai <daiwei@sunkaisens.com>
Date: Sun, 20 Sep 2026 15:40:56 +0800
Message-ID: <20260920074056.1320014-3-daiwei@sunkaisens.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260920074056.1320014-1-daiwei@sunkaisens.com>
References: <20260920074056.1320014-1-daiwei@sunkaisens.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/strongswan: add systemd support
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

When systemd is enabled, configure strongswan with --enable-systemd
and add the systemd dependency. This builds the charon-systemd IKE
daemon, which is designed for native systemd integration (using the
systemd libraries) and is managed by systemd through a service file,
with configuration handled by the swanctl backend.

Pass --disable-systemd when systemd is not selected to keep the
build deterministic.

Signed-off-by: Wei Dai <daiwei@sunkaisens.com>
---
 package/strongswan/strongswan.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 78c1ec535d..ab4300cf14 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -71,6 +71,13 @@ endif
 # setup piddir if BR2_PACKAGE_STRONGSWAN_PIDDIR is not empty
 STRONGSWAN_CONF_OPTS += $(if $(call qstrip,$(BR2_PACKAGE_STRONGSWAN_PIDDIR)),--with-piddir=$(BR2_PACKAGE_STRONGSWAN_PIDDIR))
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+STRONGSWAN_DEPENDENCIES += systemd
+STRONGSWAN_CONF_OPTS += --enable-systemd
+else
+STRONGSWAN_CONF_OPTS += --disable-systemd
+endif
+
 ifeq ($(BR2_PACKAGE_STRONGSWAN_NONROOT),y)
 STRONGSWAN_CONF_OPTS += \
 	--with-user=charon \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
