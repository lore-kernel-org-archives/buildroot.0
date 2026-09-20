Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD520C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 07:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C94810A5;
	Sun, 20 Sep 2026 07:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7wQluCui3VJ; Sun, 20 Sep 2026 07:41:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 25164810AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789890087;
	b=XLW1rDvcCpFETeQz3xq6VRSCMMdE8JCWZWKpKnuy6vWe5o1HS8yOxpkyQ137UT0JBK+Y
	 fmZZL+Y/LBTy5HQaxil3/+/9530BGpPtXNn3urVCBvWhZ8DonCOOtR8HwZUWTtf9POaY8
	 NwPJgZO/x5oMOO62LqX6KBuR2Os9IeunvKS6lrasBso7KRzGBK5Xx1dgPyoLapn9JG149
	 06Rsb+96DNIn+RAHHQKSWfIshlmyG88TljmXXn4aKaLIvGnKx3npAWScK3N3u2B4Y6We9
	 RNzM7MGt/aNfpqOK9GHVRoACK2Ja3pWmxgJOZjzXpDM2VRdDevTZ6Zy9oimRbYGPjNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789890087;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-Alimail-AntiSpam:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+spO4MURs+Sw51pUButMGWxl52p3I4XtMW/KQNUCis4=;
	b=ooGHmpCBvtb3gYlqGtaqibf/YwfltO47mtH+VcEDq0GchIgpRJsmqmrvJAyv2y5jEBmB
	 +/SfFIOdNi6Q/5F76ltMo+Pqu8xXwQZgt6ACnNYfz1TEEBZt0d1BSJsR7oJ+NMSIYxR93
	 k9bqsmfVaKmIpj6yQYVeHROCJObKXvZ9v8nvavOoXGMUYvOuyFCO6D6TxTrNGC0TXrhBQ
	 Jv6VvCmUyEtYd81m2dJsCpiXXwOq6LiCWwXiwF2zNCU96MGiJpwQyAEszVXw9PT7w1M49
	 SPZ/ls8kwC1zsXrJQ58epkJ3GpNPZK4puK52FFPd5Ufyz3Xg1nc3vXrTunmwW+SbP5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789890087;
	bh=+spO4MURs+Sw51pUButMGWxl52p3I4XtMW/KQNUCis4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sPiqPk5mza1EUYcxPI87b/6FvnxZ7z3Y1cdouOr9vn9Tkyr/uF/cACx1mPUP3U0Ow
	 vWqHEOjLfIqVTvc/tL+OxI7e/oZBlimOn4jczy2pU21WPXfi1OsDFuE94qloNTNlIV
	 +Cr+K7NjonUom3skpc9qG75HznR7EuXPpg1Di10ZqbUfnp79VNUP1OsXxpL/Q4Wacu
	 Uo8Vip9jBwi/yj4L7P5SmCAtQv/QDd/Ajv9gZSc8P5wti7qMR4o7VZgdXC+IYXIBTH
	 uac4sZAOFDAMqoh012ox6dElgTw9udIqh1EZAjWjfvsrJ4v5DqGNN6DBhM4rqRZJXK
	 rMEbigvKqBAXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25164810AE;
	Sun, 20 Sep 2026 07:41:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42FE03DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 286E440B2F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3uKR1K_8Sgs for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 07:41:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AA9DD40B05
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=115.124.28.53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789890083;
 b=fDM8HQMLCQGv6TjThmTM4lyDmVq8q3LSSqV1twJTIR39xR0jtX0BN1fRR/JI+n5Nb96A
 8sBxj0Ym4QKZZvCCAGfUniusdpWxKfBPmlGl4Rtw9vnbnvxNGerYEoA4sswHtdMyxIhwm
 Yt3NdhkiTIxw72Wt4R7VSOipRhjIVul7E2SN3xK3hWLhG5HRZijTFN4fzjGG8NFs9WAts
 8AvpU6DhAGUlJytRID9WtJvf2M+iyDywRorvStrpOCOBlB0ZeYkg0JsxRtHRJjavJlGFk
 5J/pWZsBfRqbcWllRHAhAWknqpiPSe8TnVKOZaAfGQgoZW0H96oXY66KLxaUXWh4Rgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789890083;
 h=Received-SPF:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nPWSPipy5mBEbgT201n3JlEY44maK9LCbi0pgZcPSO4=;
 b=EWKgG3n3dDAb5OlkhJauh5DErGli820kyUJyjWrXDW4NiMygS2FK89PLZloohuyV4vIv
 W9BfeCHqIUV/Rba+pi01+RPoCIKzltRjaQctuUk25MJrMz4AYidPgxyRQCRm8lxeeou5o
 GS5NIR4ku0xHYSGOEqiwqTAp78J2lMZSIqsd1SzjaX8xTDSE5yu1G4MHal5fd5J3wA5XA
 b2PhCeOWOP65ywgpP2mCICn6z6tvAVRA6tUabRSNxgqtN+KY7pWe3pnT2T97DfL5yKEU4
 X3HtZ7okSpv4BD1bLuRW/Lr1wOWtqskYWzSpBMqgLBys9HxnS5e+mKPI4lQqJ9zP0kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=sunkaisens.com; 
 arc=none smtp.remote-ip=115.124.28.53
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.28.53;
 helo=out28-53.mail.aliyun.com; envelope-from=daiwei@sunkaisens.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none)
 header.from=sunkaisens.com
Received: from out28-53.mail.aliyun.com (out28-53.mail.aliyun.com
 [115.124.28.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA9DD40B05
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4276892|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0162048-0.000606493-0.983189;
 FP=14154203872580778489|0|0|0|0|-1|-1|-1;
 HT=maildocker-contentspam033037071049; MF=daiwei@sunkaisens.com; NM=1; PH=DS;
 RN=3; RT=3; SR=0; TI=SMTPD_---.jHw7Zfm_1789890068; 
Received: from Builder(mailfrom:daiwei@sunkaisens.com
 fp:SMTPD_---.jHw7Zfm_1789890068 cluster:ay29) by smtp.aliyun-inc.com;
 Sun, 20 Sep 2026 15:41:10 +0800
From: Wei Dai <daiwei@sunkaisens.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Wei Dai <daiwei@sunkaisens.com>
Date: Sun, 20 Sep 2026 15:40:55 +0800
Message-ID: <20260920074056.1320014-2-daiwei@sunkaisens.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260920074056.1320014-1-daiwei@sunkaisens.com>
References: <20260920074056.1320014-1-daiwei@sunkaisens.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/strongswan: add eap-aka-3gpp support
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

Add the eap-aka-3gpp plugin, an EAP-AKA backend implementing the
3GPP MILENAGE algorithms in software. Select the EAP-AKA plugin
it depends on.

Signed-off-by: Wei Dai <daiwei@sunkaisens.com>
---
 package/strongswan/Config.in     | 5 +++++
 package/strongswan/strongswan.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 6847ca4f62..827634c071 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -135,6 +135,11 @@ config BR2_PACKAGE_STRONGSWAN_EAP_AKA
 	bool "Enable EAP-AKA"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
 
+config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP
+	bool "Enable EAP AKA backend plugin implementing 3GPP MILENAGE algorithms"
+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
+
 config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2
 	bool "Enable EAP-AKA 3GPP2 algorithms"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 0823732d1b..78c1ec535d 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -43,6 +43,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
 	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
 	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
+	--enable-eap-aka-3gpp=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP),yes,no) \
 	--enable-eap-aka-3gpp2=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2),yes,no) \
 	--enable-eap-simaka-sql=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL),yes,no) \
 	--enable-eap-simaka-pseudonym=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM),yes,no) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
