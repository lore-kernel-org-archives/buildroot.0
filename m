Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EC9CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8AD960D98;
	Fri,  2 Oct 2026 20:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9UD0kQJ_wtO; Fri,  2 Oct 2026 20:29:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1677F606AF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790972995;
	b=SHBO8BoflOMyJaGlafNyBwUR+FY0Mdl+W2I9qWrr64hkm0XVmh81wvU1cNyUerJPQ8o2
	 c7vGPG/4bHFK6IX4yHtBlVC1OMDe86AmqbKSZHi5AGxvQbCmKi5Tt4NrGSsEFo6STMx2o
	 WZyInDCnFPZrLYT2dUdRFlVl3U3LE8PGlrD3BOyAKIvai0TR8ubyFyLyy9h9DV1+JdxrQ
	 0slrTLfMDCwIpfUX9avPNFVXzO31XUPvhC3xDohJJGwurT9E811S6SWiGjDMuE+ZPtGou
	 1Zq2DQ5l5pBnQTGMLTrjLm6xiEG321bum3fFkh4wauLejPTZMQkBZ61GJctDJCGHqlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790972995;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=B/K2ENCsGanANnW9hx5iAQL2PKz2z8ptDNG9NtOlD+c=;
	b=TN69F5M4ksjzMFxkbcuLwnUIDgGUOH+0t6iVzknlBQYO97bRV1epFyY4+zQlNMeGTLDm
	 ZQ1e0IIdY5nKFraAzGRhhuKh7p/tsTCfvTfnNHxYeZ5jBugIQXoyOcO48hYUIVuw5IlYC
	 5tPUOn/8UfckP93e/EoCTLk8850U8+SMW51KgqWYMk+YO8QaKu2/pn4WIvrBskQE7aTxW
	 4TjSTfb3jKcDtPBJWZxPUtZkqDZUF30SC+wCAPlJwCbyfRZ6a03Zx2WBQpZmS537D+Cd/
	 pbdb2goYHqDRSXE43fzuQpPOT+dKdNDbpBnyNwhfwt2Ti9vDErKPAJxD+QQ9eiDsuLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790972995;
	bh=B/K2ENCsGanANnW9hx5iAQL2PKz2z8ptDNG9NtOlD+c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MgoisAXgNZvA8xS3YuphoI1eg25cAF7Nys79B8iNTqtuZGyr+5OVBtaDNY5TTce5d
	 jKqU3XDAZXRlvINUDkcqYmpf68f0iOI1aUyVYFByMwM3LfSJ0zfRfovQac8TTPf0c0
	 yONG28Ou37fiF/aU3y4D+COFECi7iYiRrzavKoBYArlZJolaOJDjSCHaKFu+onKpny
	 YUfxWAC5h4qSjK/BNjDu7uBqlHFUfVFBb5yJ0+JyR5ZMHc5pJGHiFTjSQ9ix01xZWx
	 DUaWcxZO59JGcLfd3BDyVeU1vJyB5NsU1O5EBv7k9mHPiIHipjoLCOnLQilxCs/Esj
	 lBlWWBg883dVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1677F606AF;
	Fri,  2 Oct 2026 20:29:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE78334D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B0081325
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QA9MROtxOlfv for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:29:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DC26980D50
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790972992;
 b=gELc3jCX2PqlUA+rNTHjYNTyM+h4/6+9Qb3ChWjgbJr5Pdzw5+gRZ350avYMC9pD6YgX
 Le/SjECdOEgUQPRnAK1GJ29lI8ESDP/NSOzWIa44BqaZEp3P5ok+6lhQo3KVYlFP6Tatn
 1kwTTR1r51MAJpqPXBT81p8EtwCHz7SjfO0XPQLDF7/Gx05vZwrG6+R7RMvYgmPh9/R8v
 Ft9cs0TbM+1bNSQn5iLINiGucSQtypPrmjqBcIRTlleGnIqo0QjHBlgxfPpkXoKQ/uJT3
 1YelDrsWEQukCZ0YJqI6md6OnZ8eT2k8TlfrFhCTMXMY3+ODQIQYHZuGWGBqoGhnzRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790972992;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=mmDSnEXo5zOt88vDjUTGckQyNpbyS+iC5caIhuGk+dI=;
 b=JpD+WktYHDkJFziZ1q3PPjyld/LFZTJZZV0ykn6pBk/TFsEbBhL77NpcUt2Wq6o/KVpv
 wPiTWwh5xxYoqeHfmJs1SULEaPAC+ZSYo4tDGhErz0GDYr1edlXYgrvnLSWa6rE2d/9Cw
 F1Ih+Lchf113IKXtqjOTBp1kCd5xrLnAukoQFoeSpiKkx3kr9UDf++et2PoUC2iSnf2J8
 eU3PFchCavc4gbMibWh+qs6KqKDAYU2SsFOEGwf4aNlq8GIsNZ27Blemx664aNOOk612S
 HG0BRywt+PVqw4aEDH9DQDQ4OHmfHnkJO8QyigGK9YZshBnlK++TJTnwqpwaFaqbziw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=bearware.dk; 
 dkim=pass header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=lEXDZBYE; 
 arc=none smtp.remote-ip=94.231.106.210
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=94.231.106.210;
 helo=smtp-out3.simply.com; envelope-from=contact@bearware.dk;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=bearware.dk
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=lEXDZBYE
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC26980D50
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:29:51 +0000 (UTC)
Received: from macmini (85.191.81.201.dynamic.dhcp.aura-net.dk [85.191.81.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4hxL4F6cbGz1DDGR;
 Fri,  2 Oct 2026 22:29:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bearware.dk;
 s=simplycom2; t=1790972989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mmDSnEXo5zOt88vDjUTGckQyNpbyS+iC5caIhuGk+dI=;
 b=lEXDZBYEFB4qljVgPo6tHfcypKf1hvXQ6ob6Z57fer/a9tNH1cyj9IxVOSWiiF996xaETh
 6ys3uo9pR+mP0ya2HlT/QuGyUkJbgIYoq8WG5qCJrRn9yAmgHAoNEJGosAinhUgRfSHqwC
 DeBXdJxzeVuBi0wNxkyA3DyF8lOo/qulV2NDnsuY7MLGEJt0TvAGyhNHUh3O2JOQF42EqJ
 NigjHA+dV6nd+tjc+creP099fyRrL/vBpq2VYaYjZwRQ/sLrIozivQnsyhrATLcuMlH7Z/
 nzk7iGdsX47ysLW0kr9ocS5A9lwUfhZ3L3gW2M5B4gYyRUkq7qjfGnoNt+r6yg==
From: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
To: buildroot@buildroot.org
Cc: Tudor Holton <buildroot@tudorholton.com>,
 =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
Date: Fri,  2 Oct 2026 22:29:35 +0200
Message-ID: <20261002202935.943329-2-contact@bearware.dk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002202935.943329-1-contact@bearware.dk>
References: <20261002202935.943329-1-contact@bearware.dk>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/openjdk: CPE ID for openjdk
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBhbGxvd3MgT3BlbkpESyB0byBjaGVja2VkIGZvciBDVkVzLgoKVGhlIGF1dG9tYXRpY2Fs
bHkgZ2VuZXJhdGVkIE9QRU5KREtfQ1BFX0lEX1ZFUlNJT04gY2Fubm90IGJlIHVzZWQKYmVjYXVz
ZSBPUEVOSkRLX1ZFUlNJT04gaW5jbHVkZXMgYSAnKycsIGUuZy4gIjI1LjAuMisxMCIuIE5WRCB3
aWxsIG5vdAphY2NlcHQgYSB2ZXJzaW9uIG51bWJlciB3aXRoICcrJy4KClNpZ25lZC1vZmYtYnk6
IEJqw7hybiBEYW1zdGVkdCBSYXNtdXNzZW4gPGNvbnRhY3RAYmVhcndhcmUuZGs+Ci0tLQogcGFj
a2FnZS9vcGVuamRrL29wZW5qZGsubWsgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3Blbmpkay9vcGVuamRrLm1rIGIvcGFj
a2FnZS9vcGVuamRrL29wZW5qZGsubWsKaW5kZXggZmJjODYwMDE5Yy4uMTBlMGY3NmFkNyAxMDA2
NDQKLS0tIGEvcGFja2FnZS9vcGVuamRrL29wZW5qZGsubWsKKysrIGIvcGFja2FnZS9vcGVuamRr
L29wZW5qZGsubWsKQEAgLTE3LDYgKzE3LDEyIEBAIE9QRU5KREtfVkVSU0lPTl9NQUpPUiA9IDE3
CiBPUEVOSkRLX1ZFUlNJT05fTUlOT1IgPSAwLjE4CiBPUEVOSkRLX1ZFUlNJT05fQlVJTEQgPSA4
CiBlbmRpZgorCitPUEVOSkRLX0NQRV9JRF9WRU5ET1IgPSBvcmFjbGUKK09QRU5KREtfQ1BFX0lE
X1BST0RVQ1QgPSBvcGVuamRrCisjIE92ZXJyaWRlIGF1dG9tYXRpYyBDUEUgSUQgYmVjYXVzZSAn
KycgaW4gJChPUEVOSkRLX1ZFUlNJT04pIGlzIGFuIGludmFsaWQgZm9yIENQRSBjaGVjaworT1BF
TkpES19DUEVfSURfVkVSU0lPTiA9ICQoT1BFTkpES19WRVJTSU9OX01BSk9SKS4kKE9QRU5KREtf
VkVSU0lPTl9NSU5PUikKKwogT1BFTkpES19WRVJTSU9OID0gJChPUEVOSkRLX1ZFUlNJT05fTUFK
T1IpLiQoT1BFTkpES19WRVJTSU9OX01JTk9SKSskKE9QRU5KREtfVkVSU0lPTl9CVUlMRCkKIE9Q
RU5KREtfU0lURSA9ICQoY2FsbCBnaXRodWIsb3BlbmpkayxqZGskKE9QRU5KREtfVkVSU0lPTl9N
QUpPUil1LGpkay0kKE9QRU5KREtfVkVSU0lPTikpCiAKLS0gCjIuNTMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
