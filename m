Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B000FC369C9
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 08:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FE5A61B3D;
	Fri, 18 Apr 2025 08:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0nhG_YJukox; Fri, 18 Apr 2025 08:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BCD36077B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BCD36077B;
	Fri, 18 Apr 2025 08:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C038D228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B008D61ACC
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e57GFmCBdeph for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 08:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A24F76103C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A24F76103C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A24F76103C
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([213.196.211.137]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQjH-1uMW732yI1-001cMB; Fri, 18
 Apr 2025 10:05:44 +0200
Date: Fri, 18 Apr 2025 10:03:45 +0200
MIME-Version: 1.0
Message-Id: <20250418-ffmpt-v1-1-5540e2621486@gmx.net>
References: <20250418-ffmpt-v1-0-5540e2621486@gmx.net>
In-Reply-To: <20250418-ffmpt-v1-0-5540e2621486@gmx.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744963541; l=854;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=H99nc52L/1gKRm52Jpi3yTFpxJhZFEKUZSrLBptgXBM=;
 b=VSZoiTUF8LuJDPO34DkqbOQ4u92NlG1jqjS97Y7ttgVdzCaEiOyDhoZfXuExD2j1+BCwwWLDG
 fCsXBbC/MPCC5Oja/RmgfNn4HIl37mtzlDG3EpNEdpHo5pkEH3yicAl
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:bl8k9M9Rr44e0eJrA3yZtmGG56F+YUR9MK3N0FDHB3TdW7UvDYU
 agKgFCjCAlZ+ZU3ZhmEXpsMglfgXdN7WrKiUh5L1eQb/igSX4ygwf40/CtMdKWcGAVvZIYo
 fh2be0okp999MxWe2RJQwU2SC9FYMAiQLtSXI2+RkUb+iu/BXRn4GWePf5pATCPZBMkrfxh
 ruSIs/cx+qoBEGDCNL28Q==
UI-OutboundReport: notjunk:1;M01:P0:Tdl4jTwdcME=;zIKAt6w7sQT60j8kcFeqJdjkeNv
 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
 88Uw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1744963544; x=1745568344; i=j.neuschaefer@gmx.net;
 bh=zoKY1Di3TuKXzxv2o9LKu2If0il9nIdz1mG7y7fhdGU=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NxmtcBRUmfQWZuDZ8T8A46IFJVsoEFTGSACCBOr6EfhaejUvQLx40vHClm/qz4AU
 HGvpSqVmS8Ja0iM2i5Rg7BrxXlDCfzERBzi7cPccQsU/aA5+Uhh8fjVPa1/Au2B2b
 dkOAdtPVQgksNdN5LoC9E8aFRKRYRtSYc4JMw7Hx96U5MfPpzcreTke86+oiXwdfh
 B9XVX5s0BWdz1YEAvck1FkJSidKWCPXZuv6dhwNGz3s49lBq7ke7W0Zldbfdac2Ng
 Wfzj4czN6n5sITSgRpUKWW7TouX8fRyHF4lmRGrPp9NW8q5cwe4h2qC4h3N7wrVX0
 LGcwVYQ/CHAfzjBUcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=NxmtcBRU
Subject: [Buildroot] [PATCH 1/2] package/libopenmpt: install to staging to
 fix pkg-config
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aG91dCB0aGlzLCBmZm1wZWcgaXMgbm90IGFibGUgdG8gZmluZCB0aGUgbGlib3Blbm1wdCBk
ZXBlbmRlbmN5LAphdCBsZWFzdCB3aXRoIEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUyBlbmFi
bGVkLgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5l
dD4KLS0tCiBwYWNrYWdlL2xpYm9wZW5tcHQvbGlib3Blbm1wdC5tayB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVubXB0L2xp
Ym9wZW5tcHQubWsgYi9wYWNrYWdlL2xpYm9wZW5tcHQvbGlib3Blbm1wdC5tawppbmRleCA3NGZm
YmRiYmQ0MjE0MDdlZTc0YjQ0MDc4MmZjYjFjYmU0M2Y0YTc2Li41N2M0NWM2ZWExMTE5MTYwM2Q0
ODEyMDE3ZThjMTViOTU5ZTFkY2JiIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm9wZW5tcHQvbGli
b3Blbm1wdC5taworKysgYi9wYWNrYWdlL2xpYm9wZW5tcHQvbGlib3Blbm1wdC5tawpAQCAtMTEs
NiArMTEsNyBAQCBMSUJPUEVOTVBUX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKIExJQk9QRU5NUFRf
TElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKIExJQk9QRU5NUFRfQ1BFX0lEX1ZFTkRPUiA9IG9wZW5t
cHQKIExJQk9QRU5NUFRfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mCitMSUJPUEVOTVBUX0lO
U1RBTExfU1RBR0lORyA9IFlFUwogCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQk9QRU5NUFRfT1BF
Tk1QVDEyMykseSkKIExJQk9QRU5NUFRfQ09ORl9PUFRTICs9IC0tZW5hYmxlLW9wZW5tcHQxMjMK
Ci0tIAoyLjQ4LjAucmMxLjIxOS5nYjZiNjc1N2Q3NzIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
