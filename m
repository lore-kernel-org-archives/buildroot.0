Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17474C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D912C41066;
	Sun, 20 Sep 2026 17:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxdYAKIS8WmP; Sun, 20 Sep 2026 17:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F24AF4100F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924886;
	b=mIJtjmlvXjZZ/HERIQjmFmvQZE13d/f9ipz/5ipjcuPJ3g7mGKplrIUaqOmmc3w3V9x2
	 eEFRNFbTB1hfzkIFjyo38jwjsMR32Fj1r/ojdK1K6ydqqfOp9GHOC90SBzckhp0KxZfWN
	 W/orBTFm0n1asIFx//wDjN2vTGYS+lvH+aV1pNFcuxvJEEIVNwcG288Wj0Z/ecMsxth7+
	 7k+WU4iNhjTWZGQcZL2HgFL/bsD9HZSNjDtXW1HhQOjfhiThsXeXamukkRfgpDYRf5LFP
	 lr1vNuRGAMDIGoIhZzOwQxjFi1CIUNAZBnRvjlI12oaC/6rPW0Iz+gwJP+YJiGRRKIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924886;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	b=IRR4wKNmMtc6Q1N8XU1n5P1sJCG7Je8UFuIg+10NRDg+XJorJloDndLvCapy1qJ8Qiei
	 HxRDCpXVp7nP6yAAFi/BQ56QlTNhKsrNAPyz+P5V/UlEl//eIiLM7j++M+dzKJKz/cFvY
	 MhXtXjYRRxZzM9Ee9FZzGn89dtaCeuohh3W8MGS1z0qVJjUf2e/M0KmwXDp+78sPFu/u1
	 ITh0NaQR0K8PnPwSXAn3AW/Hkglr6cV3wyqzdkFAT7es2hIJRtj9+3TE5WlSq8up1Y31Q
	 kPVzlOPn311nEkFGr1l0HFvOLA6eifB4zTyuPYByvGhfT8JwjEKkkAyCccsjHCNjswA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924886;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VQLuLUp7gWm/qbizbI4bn9b/uVcJ5bnRilhPEoYeT7GUjkUhbqdIqTEuGSHTgO6T4
	 HXaj5EziHl9FhBSNW4FYpPhbxu9JxlxE9pNwNos31pBiW9DkgEF3d8EnZUJU8FYRgy
	 GHII+DoD9Zav9cOoSzXVdQAia/okjYuhmNL4gN2+ORMdBlMkK0BTOichmWzJ0sT1o8
	 cxd3jGYERH7HS+vx1Wh2RiICuNYpu0vtGreJC174X7oyOlNDVq/5BImf3DIjrb91H2
	 KUIv9DVhUi8WdRu7W8dLOYYTTS1B71L5N+PmN3usOBc0fJsGVBh85OHiF2+3BvIvAC
	 +JeH/F0xmqwow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F24AF4100F;
	Sun, 20 Sep 2026 17:21:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E890C3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAC96606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssr7T0hsUYGo for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:21:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EBAEA60601
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924884;
 b=qkBrqdphZvk3Mn55vEI+R9ZC7EwsCGyI/MKo2ri/sJPMPrh+EtIoVIkJG7/jQgggC5w/
 2eCeoH1vNTkH+rZdIcPvQhFZunYrwNehUEE/AIraHIIU1K8gMxtD1aHLqsxeAivUfwlQt
 Z2m0bSKManz2ucE+eqx6P2t2r0xYwym80TQGTdGN3QsGZ1pwyBs4qgRUJii3C/4rUF6QI
 WUn7gAGN3FDoj0ew7Hz77zHdX9Z8jGZ7UyVRvI/+MfMlYqs6WC90NcjmgdTOqZ3MaFqo8
 mQJjQuVE0hMj8Ua4OPnz2OPBlkswjZrY3/zIsywQfTmKtY/ss18TqPN9RyuGqJGLcpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924884;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 b=fEuIonCEVWat3WWkDzk8nL2HzoZDIszHYH+sBj/QHcIzqlo3gf/ewb+L0XMhD1DB4Jr/
 gSieX653eFdET+/nAQqOIxlYXrH2UI2dipphysXxS05PmaVeCyTDwO60hxxdt8fwPr+67
 lk4+LcPfqdQxky/CWsyjZ7ih6K05SP4E5ScEBm6jEm9arrB5/E/iGwwSbchO5JYm7j4XM
 h42j8r/A/nO8uxWgJiTwHsvQb4jsI+pI0PlAaGohysUSbx3Ho3exPgCgFX6yhwYyVtC8R
 F8L9aWsA2jhY9X1HwZ40wNp/n99Wd/dP2E3Bk2lE1EfklsRktp0WLmp/6+2WUFMOPKA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jshx9moq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jshx9moq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBAEA60601
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924167;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jshx9moqLteZB2yZGimQg9vONNvW34CYRQRib51ry9JDyEmVEFodqlOp60XjiIHAh
 UlLbwNdsm659zMxtlVR0w5BIvDARk5DmkLl7JXVJQOBk8LdCDhms+RXTMt2PKQ5Mc4
 1DZGiOEU6566BZDAI5dplBh8+l8PqHs6qc2enwWy+DUvrwknGtjCQ8TfgnUKezJRhX
 LxDn9FXn5TejVWv17nAPz3Bq7Zb3+L8lAKw8rk7o4WmNt+ugbK8LWaAgM/I/l29abM
 IHdb7Bxdpf6AcjUIm6iXTcSG8X17/1p0l/48t7uzuk7EVJ3OA12e0D3EagnUD50bor
 pRZY/iEbvTIWg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:zsydC1x9skRfo6/U7bknGP1jLQ5wgbvNTO4Dprt36unPsisNp61Ubd/Ew+Dm0UfiI3YhZ7lOAl5XRc2S/RVLoZ+ctFHogVxyblM0oj25Mw0OYsDB8wIwjRNg/V+2ffYwsJjMLUgsatjzz9q7Bn8lBnTWxt5RFMG0anfzcBRzV79MOXT4Vf1uhu3k3yS8FaqfRPMPvaWWQjY2FjL6tSKYAPMnb5PTGQMJBlUfvyPuRo/NWiDvYILjPh/3FCk+rkGrTYm3FRrN5RfgvPn2FWTAWu+oD0OQbNfFUYNm9Jf0kMw+YTrR45ZRet5VZ2M2Z9cje7Wp+D0RgpoXh24lsUDHjQ2m1l7jh8pKfvPGfmRG5ewZ928IL2s7Pcq4Q3PE4A48ouCTkL0nSX7szfa3iUm+ajZ9S6bEMOgHHEaQwr0vY0xGxqNDAlaIdTU0eRrEjHe+eL1iw9fdgssk5V+eYpBgDVG1dvkRihz4covC17e3HOdx4KVZfZUrPByqLM2qd1AL0sDpaFbHCwnJBw6dGq+m2A43qhpk7u4dED76DGfUHG5R8+eoD+os/fc+rIxnXTW80Nkp/QF0ftQJbLRq1cWh6H1GrffTtCvzz4OZ91n144c6Ac
 FP7zMMkoxThmEuqV1Po3ZCyaygBUEF8QVx6OSJWNo3
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FE52A4C48A5;
 Sun, 20 Sep 2026 19:09:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1f-000000000o7-14Bj;
 Sun, 20 Sep 2026 17:08:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:59 +0200
Message-ID: <20260920170815.240247-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 52/67] package/rauc: Fix build with OpenSSL
 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5OMV9T
VFJJTkdfZ2V0MF9kYXRhLWFuZC1BU04xX1NUUklOR18ucGF0Y2ggfCA0OCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcmF1Yy8wMDAxLXNpZ25hdHVyZS11c2UtQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
LWFuZC1BU04xX1NUUklOR18ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JhdWMvMDAwMS1z
aWduYXR1cmUtdXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNo
IGIvcGFja2FnZS9yYXVjLzAwMDEtc2lnbmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEt
YW5kLUFTTjFfU1RSSU5HXy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5iYTgwMzJjNmU3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9yYXVjLzAwMDEtc2ln
bmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5HXy5wYXRjaApA
QCAtMCwwICsxLDQ4IEBACitGcm9tIDEwMWFhY2FmODJkMjUwYmZiOGU1ODFlMDAyYjJjMzgwODY5
MDgwZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCcnVubyBUaG9tc2VuIDxicnVu
by50aG9tc2VuQGdtYWlsLmNvbT4KK0RhdGU6IFNhdCwgMTEgQXByIDIwMjYgMTc6MDY6MTAgKzAy
MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2lnbmF0dXJlOiB1c2UgQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
IGFuZCBBU04xX1NUUklOR19sZW5ndGgKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworVXNlIEFTTjFfU1RSSU5HX2dldDBfZGF0YSgpIGFuZCBBU04xX1NUUklOR19sZW5ndGgo
KSBmdW5jdGlvbnMKK2FsbG93IGFuIEFTTjFfU1RSSU5HIHN0cnVjdHVyZSB0byBiZSBtYW5pcHVs
YXRlZC4gQXZvaWQgZXJyb3JzCitsaWtlIHRoaXMgd2hlbiBjb21waWxpbmcgYWdhaW5zdCBPcGVu
U1NMIDQuMDoKKworZXJyb3I6IGludmFsaWQgdXNlIG9mIGluY29tcGxldGUgdHlwZWRlZiDigJhB
U04xX09DVEVUX1NUUklOR+KAmSB7YWthIOKAmHN0cnVjdCBhc24xX3N0cmluZ19zdOKAmX0KKwor
U2lnbmVkLW9mZi1ieTogQnJ1bm8gVGhvbXNlbiA8YnJ1bm8udGhvbXNlbkBnbWFpbC5jb20+CisK
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcmF1Yy9yYXVjL2NvbW1pdC8xMDFhYWNhZjgy
ZDI1MGJmYjhlNTgxZTAwMmIyYzM4MDg2OTA4MGVmCisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBzcmMvc2lnbmF0dXJlLmMgfCA0ICsrLS0KKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL3NpZ25hdHVyZS5jIGIvc3JjL3NpZ25hdHVyZS5jCitpbmRleCBkMmFjYWM2Yi4u
OTFiZTdiYjcgMTAwNjQ0CistLS0gYS9zcmMvc2lnbmF0dXJlLmMKKysrKyBiL3NyYy9zaWduYXR1
cmUuYworQEAgLTEzNDQsNyArMTM0NCw3IEBAIGdib29sZWFuIGNtc19nZXRfdW52ZXJpZmllZF9t
YW5pZmVzdChHQnl0ZXMgKnNpZywgR0J5dGVzICoqbWFuaWZlc3QsIEdFcnJvciAqKmVyCisgCQkJ
CSJtaXNzaW5nIG1hbmlmZXN0IGluIGlubGluZSBzaWduYXR1cmUiKTsKKyAJCWdvdG8gb3V0Owor
IAl9CistCWlmICghKCpjb250ZW50KS0+ZGF0YSB8fCAoKCpjb250ZW50KS0+bGVuZ3RoIDw9IDAp
KSB7CisrCWlmICgoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSA9PSBOVUxMKSB8fCAo
QVNOMV9TVFJJTkdfbGVuZ3RoKCpjb250ZW50KSA8PSAwKSkgeworIAkJZ19zZXRfZXJyb3IoCisg
CQkJCWVycm9yLAorIAkJCQlSX1NJR05BVFVSRV9FUlJPUiwKK0BAIC0xMzUzLDcgKzEzNTMsNyBA
QCBnYm9vbGVhbiBjbXNfZ2V0X3VudmVyaWZpZWRfbWFuaWZlc3QoR0J5dGVzICpzaWcsIEdCeXRl
cyAqKm1hbmlmZXN0LCBHRXJyb3IgKiplcgorIAkJZ290byBvdXQ7CisgCX0KKyAKKy0JdG1wID0g
Z19ieXRlc19uZXcoKCpjb250ZW50KS0+ZGF0YSwgKCpjb250ZW50KS0+bGVuZ3RoKTsKKysJdG1w
ID0gZ19ieXRlc19uZXcoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSwgQVNOMV9TVFJJ
TkdfbGVuZ3RoKCpjb250ZW50KSk7CisgCWlmICghdG1wKSB7CisgCQlnX3NldF9lcnJvcl9saXRl
cmFsKAorIAkJCQllcnJvciwKKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
