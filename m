Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027C606A324
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WUAkT1ij;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aYDEeTz/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB598321B;
	Wed, 11 Nov 2026 18:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cdcp0TsTpPqg; Wed, 11 Nov 2026 18:38:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C66BF81E3E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794422302;
	b=ZI1h5I8wCha40SB88h/CxF9tfeMtdF2vSvGvrmWBDifC2M0y/jiRtaoRyEq4qvEFmscZ
	 Jtu95XG5NU1OcgJqZ6nuAgleWDY6a+Baw+eD1iX3T1fBLueSUGIRa2uzLkf9l+anU0Js4
	 jaWQVVRyiN5L4szLfdRAMMuJQ1SjeGYw4mw4XpkuN7/katnMaAcwMGB2kvALP1SF6Bba7
	 IaWOqvDi3imYcC6k8mrt2/nMcoSiV5TqU8KmSdjHjkkRFyUhuGXDjK4fueGRNHnL3JCke
	 bxwTl6TiWQkpAnGJOdwsf3NuwQWHYA8yZsYvdBT3hXLa5S8TLSG4U0A0Hul7wfHsiGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794422302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+wq88TLlH9XYD9+TjqJtlgx45XnzZefUL6g1UowV26w=;
	b=mXlWFORND6cT4HTGXH/qL/Dyia5gkssto5uVpKx0jc6tEcwnXXG7aK3i8sV8WZzoYJy4
	 icMrGM59MfOHmVky6DByLsIYgiocij9oKZfwK7GRV7N3rBeDtXvMZ4IlCEYx+FTghDeIE
	 EtAeKrTNnTRKXy0G0mSEVZ235DZrNhwesP7T7h3lGEtd/of5slFFrmqgA11YPN9WIwr65
	 A5G4ugSdyvaVmyRf+FD3Aui1AvHajL4vm2kV5PSQAlvGU2xaFzycpjt9wojEZAvhtcuNF
	 TB9ADntUTGH3S1ZKWf7HzxW0fsnfRBygzPGCg9jlSERl/iFE2tNFq0kncVZnmvdwe9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aYDEeTz/";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794422302;
	bh=+wq88TLlH9XYD9+TjqJtlgx45XnzZefUL6g1UowV26w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WUAkT1ijqquSZinEdGsC4wg7Pi3ggpoyAPG/q6J/u6ah0BqU1P5B2PT21QieAEpMW
	 nz4zQ7yW01YaVy1LIcJ3rvE3IrQd/QAHTG9BNbSL6EgTr7/gNHOXXoXUEf6vMYEtwd
	 lwJsiD8BB/4b8cahistQSsDDMHfXex29nBA2WtQ0Z1ld6j0ZHlKiF5470TocYI1UCv
	 B1x4JLWR2carlBNnTKQopURM2Wrq2od83eMwlUNPFtMXsQYk4WDYjA6PLbgWdkkL7I
	 QFMiEQUrtYUQ6EdqX8/tvsbUV5M/8R/TOt1YId0XE0hXEaXEXhZ/Wffs2tGnMQSRIz
	 utO9cDTKE915w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66BF81E3E;
	Wed, 11 Nov 2026 18:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B59B1EC3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59A8C85070
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WUIAhAKdqC0 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:38:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C20EA850B0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=aYDEeTz/
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C20EA850B0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so25956725e9.2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794422279; x=1795027079; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FBiKLhP8aFc/GpXNHFK7cedOJLiQ9lz4iIec4fl3cmY=;
 b=aYDEeTz/UaFgwyQTJAERbpWoEjOoylqmquntQHfoksVO5nPIPmudITpFOtALSHLCin
 tLgenueA3LFN3CC/hA9795o16botVhDrI9l7EdGucKqY7VytnAP5cS9fop5rWsluVzjg
 BesUtUjKbsrDzoIgGp8pLlnLZMLODcfA5tp9B11kJBCCkS99PHYmYq00ZnXQKBVCYikk
 /ZUARrNQhqK8eD7h/hsqMuAeAvIQPTdVMoUxM9kOYyxVO2suCnp51Kj8NRoiDrajJVG8
 q8QXF63gXDp813xZ9Clrd7cgnS7MQxvsAJgAQ0I2afmkLESMJ2JlX9WtK2nKeyGgn2ye
 qeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794422279; x=1795027079;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FBiKLhP8aFc/GpXNHFK7cedOJLiQ9lz4iIec4fl3cmY=;
 b=QKUetgPMnphPL3JZGnMds3R0EShNOW59jF6jZSRgHEksxTRpKUeiopxUoVY7+fhgeu
 DDGrfE/5+IDv4Y36ukMWFWTMIG3LWrHgRG5lGpxZHr5L/YFV/2jO6hrhkr7gB8gG97U7
 jsVM1+Wp6bZ0yv7JTzMe6y/Zyvf+ZrNnQOM0FrueuMso/5mJPRe1VeB4zY2FKUs9dOln
 yz4CxU/sD5i3q8YrEiXz59O6HRWt59zej6ShSwkPNtyEByIIvJ1ydIm9cI4V2MPsalDC
 sLUoZVQqUa4Fk/utyBxSLmnm7hI72AAy8uo8DC50QKBAOwUtLIMMJcbd4ID0GYKAvZ3V
 xOjg==
X-Gm-Message-State: APuU4Z9mv3uaundvxU0Z27Z33Vu2uwCIJxsGxoXodM6nmjFGNiiXdthq
 JchuyrSpNYeQ/GDrt8axplknNSpXMv/5DrxwEyoQ5sex+zjvtAMfW5UuZU16aFA3
X-Gm-Gg: AYBFou2D6QcohEbtXxTHa3rL7v57aFUhZvXqNPJUa9WZneyHlSLrh8FCg8H3y9fw7vD
 o4BAVm7M6MQPVeKqukNijbBfvQyhfA7kXtzu5F4Cii0qzzH9REazAhO6tJHOsUB5Z/G/rzQmEVB
 lKSCLj8vzpR+nHzGQaSTZUhTlcNA74ei3dDy2sokeAMEuPBaEaZXDgflrt8+yOLne3Ew30uUny+
 rdS+Dkex6q+1yjjrRZMLXPGj6U6Qdu8G7oGprV8Zi5gkhlaE9ZIQDu6EVBC6XnDM4RoAFlGqrR0
 Rbl+H42pBkH3EwDY/YtVrE1Rs7ekzQlrWrixv607jWHyKYSsubBEVuohSJ46yzwPnkqjTGCiYz3
 U/SNDmsV9H540TD+QEmhMKpipaydU75LtaGwHsSt5ZvG6uLQn1pkm7ilFTGcZ46LeifwfaQM4/n
 sovAn+udPh5obcHpkdtega4Su65X9gruF6bFiB1rADYFfSpocqMcPobTk32RlmGDu+bBAML2ZfG
 Ha+4cwjZ1rjJKsJPGtYMcSsyXd5HG0ICdmQJuQ4ePpKy0slynBNZrzkG96aPU67WKNOOMxvn0So
 OsRdXLoaORnqVGVf7CTuIDYERScmiLIJXjST6eOObGpZ8Zvg3WTG
X-Received: by 2002:a05:600c:348d:b0:4a2:148b:c88c with SMTP id
 5b1f17b1804b1-4ba0935cdafmr54634995e9.8.1794422278856; 
 Wed, 11 Nov 2026 10:37:58 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988bdef64dsm11007672f8f.20.2026.11.11.10.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 10:37:58 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 19:37:50 +0100
Message-ID: <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
References: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/7] boot/at91bootstrap3: bump 3.x series to
 3.10.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIHBhdGNoIGZpeGluZyB0aGUgYnVpbGQgd2l0aCBHQ0MgMTUgaXMgbm90IHVwc3RyZWFtIGlu
IDMuMTAuNCB5ZXQKYW5kIGFwcGxpZXMgYXMgaXM6IGNvcHkgaXQgdG8gdGhlIHYzLjEwLjQgZGly
ZWN0b3J5LiBUaGUgdjMuMTAuMyBjb3B5CnN0YXlzLCB1c2VkIGJ5IHRoZSBkZWZjb25maWdzIHRo
YXQgZmV0Y2ggdjMuMTAuMyBmcm9tIGdpdAooYWNtZXN5c3RlbXNfYWNxdWFfYTVfKiBhbmQgYXQ5
MXNhbTl4NWVrXyopLgoKUmVsZWFzZSBub3RlczoKaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNh
bS9hdDkxYm9vdHN0cmFwL3JlbGVhc2VzL3RhZy92My4xMC40CgpTaWduZWQtb2ZmLWJ5OiBBbmdl
bG8gQ29tcGFnbnVjY2kgPGFuZ2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+ClRlc3RlZC1ieTog
RWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+CkFja2VkLWJ5OiBFZGdhciBCb25l
dCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KLS0tCkNoYW5nZXMgdjIgLT4gdjM6CiAgLSBub25l
CgpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gY29sbGVjdCBUZXN0ZWQtYnkgYW5kIEFja2VkLWJ5IFtF
ZGdhcl0KLS0tCiBib290L2F0OTFib290c3RyYXAzL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
fCAgNCArLQogYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5oYXNoICAgICAgIHwg
IDIgKy0KIC4uLmNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaCB8IDQ3
ICsrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L2F0OTFib290c3RyYXAzL3Yz
LjEwLjQvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxz
ZS1hbmQtLnBhdGNoCgpkaWZmIC0tZ2l0IGEvYm9vdC9hdDkxYm9vdHN0cmFwMy9Db25maWcuaW4g
Yi9ib290L2F0OTFib290c3RyYXAzL0NvbmZpZy5pbgppbmRleCA4M2QzYTAyMTIxLi42MTgxZjM5
YmIxIDEwMDY0NAotLS0gYS9ib290L2F0OTFib290c3RyYXAzL0NvbmZpZy5pbgorKysgYi9ib290
L2F0OTFib290c3RyYXAzL0NvbmZpZy5pbgpAQCAtMjIsNyArMjIsNyBAQCBjb25maWcgQlIyX1RB
UkdFVF9BVDkxQk9PVFNUUkFQM19MQVRFU1RfVkVSU0lPTgogCWJvb2wgIjQuMC4wIgogCiBjb25m
aWcgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19MQVRFU1RfVkVSU0lPTl8zWAotCWJvb2wgIjMu
MTAuMyIKKwlib29sICIzLjEwLjQiCiAKIGNvbmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAz
X0NVU1RPTV9HSVQKIAlib29sICJDdXN0b20gR2l0IHJlcG9zaXRvcnkiCkBAIC02MSw3ICs2MSw3
IEBAIGVuZGlmCiBjb25maWcgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19WRVJTSU9OCiAJc3Ry
aW5nCiAJZGVmYXVsdCAidjQuMC4wIiBpZiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xBVEVT
VF9WRVJTSU9OCi0JZGVmYXVsdCAidjMuMTAuMyIgaWYgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQ
M19MQVRFU1RfVkVSU0lPTl8zWAorCWRlZmF1bHQgInYzLjEwLjQiIGlmIEJSMl9UQVJHRVRfQVQ5
MUJPT1RTVFJBUDNfTEFURVNUX1ZFUlNJT05fM1gKIAlkZWZhdWx0IEJSMl9UQVJHRVRfQVQ5MUJP
T1RTVFJBUDNfQ1VTVE9NX1JFUE9fVkVSU0lPTiBcCiAJCWlmIEJSMl9UQVJHRVRfQVQ5MUJPT1RT
VFJBUDNfQ1VTVE9NX0dJVCB8fCBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9TVk4K
IAlkZWZhdWx0ICJjdXN0b20iCWlmIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1RB
UkJBTEwKZGlmZiAtLWdpdCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMuaGFz
aCBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMuaGFzaAppbmRleCBlNjExZjE2
M2M5Li45NzI3YTg4ODUwIDEwMDY0NAotLS0gYS9ib290L2F0OTFib290c3RyYXAzL2F0OTFib290
c3RyYXAzLmhhc2gKKysrIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5oYXNo
CkBAIC0xLDQgKzEsNCBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgYjZhZTViY2Fh
Y2M1YTk0OWY0MDAxODJlMDM2YWUwNTMwNDk2Mzg0NDRhM2JhOGIxZGQxNTRlYzVmNzg5OGQ4ZSAg
YXQ5MWJvb3RzdHJhcDMtdjMuMTAuMy50YXIuZ3oKK3NoYTI1NiAgYjZiNGNkNGIxMjdlZmJlMTAz
NzU0NjczZDI4ZWIyYWJiOTc3MmI1Mzc4ZDljOGNiZmMwMWM2M2I1OGQyNzQ1MSAgYXQ5MWJvb3Rz
dHJhcDMtdjMuMTAuNC50YXIuZ3oKIHNoYTI1NiAgMDhjNWI5NWRmMjhiZTdmMmUwNDM5ZmIyYjc3
ZmUyNzUyNGY5N2M0OTk4NTA2NDFlNDU0MGMwN2VhMGIyYzI1ZCAgYXQ5MWJvb3RzdHJhcDMtdjQu
MC4wLnRhci5negogc2hhMjU2ICA1YTM4MDliMWMyYmExM2I3MjQyNTcyMzIyOTUxMzExYzU4NDQx
OWYxZjg1MTZmNjY1ZDZjMDZmMDY2OGQ3OGRlICBMSUNFTlNFUy9NSVQudHh0CmRpZmYgLS1naXQg
YS9ib290L2F0OTFib290c3RyYXAzL3YzLjEwLjQvMDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0
aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoIGIvYm9vdC9hdDkxYm9vdHN0cmFw
My92My4xMC40LzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wt
ZmFsc2UtYW5kLS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4z
NTJjMWMwYTQzCi0tLSAvZGV2L251bGwKKysrIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC40
LzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5k
LS5wYXRjaApAQCAtMCwwICsxLDQ3IEBACitGcm9tIDkwOGM2NTY3ODg2NzU2NWE5MzRlYTVhOTY3
YmZlN2UyMDRkMWNjYWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBFZGdhciBCb25l
dCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KK0RhdGU6IFdlZCwgMjUgSnVuIDIwMjUgMTE6MTM6
NDMgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gaW5jbHVkZS90eXBlcy5oOiBjb25kaXRpb25hbGx5
IGRlZmluZSBib29sLCBmYWxzZSBhbmQgdHJ1ZQorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGlu
ZzogOGJpdAorCitpbmNsdWRlL3R5cGVzLmggdHlwZWRlZnMg4oCYYm9vbOKAmSBhbmQgbWFjcm8t
ZGVmaW5lcyDigJhmYWxzZeKAmSBhbmQg4oCYdHJ1ZeKAmS4KK0hvd2V2ZXIsIHNpbmNlIEMyMywg
dGhlc2UgYXJlIHByZWRlZmluZSBrZXl3b3Jkcy4gQXMgQzIzIGlzIHRoZSBkZWZhdWx0CitDIGRp
YWxlY3QgZm9yIEdDQyAxNSwgYnVpbGRpbmcgd2l0aCB0aGlzIGNvbXBpbGVyIGZhaWxzIHdpdGg6
CisKKyAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9yOiDigJhib29s4oCZIGNhbm5vdCBi
ZSBkZWZpbmVkIHZpYSDigJh0eXBlZGVm4oCZCisgICAgICAgMjMgfCB0eXBlZGVmIHVuc2lnbmVk
IGNoYXIgYm9vbDsKKyAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+CisgICAg
aW5jbHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDigJhib29s4oCZIGlzIGEga2V5d29yZCB3aXRo
IOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKKworRml4IHRoaXMgYnVpbGQgZmFpbHVyZSBieSBvbmx5
IGRlZmluaW5nIOKAmGJvb2zigJksIOKAmGZhbHNl4oCZIGFuZCDigJh0cnVl4oCZIG9uIEMKK2Rp
YWxlY3RzIG9sZGVyIHRoYW4gQzIzLgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xp
bnV4NHNhbS9hdDkxYm9vdHN0cmFwL3B1bGwvMTg4CitbRWRnYXI6IGJhY2twb3J0IHRvIHYzLjEw
LjNdCisKK1NpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZy
PgorLS0tCisgaW5jbHVkZS90eXBlcy5oIHwgMyArKysKKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9pbmNsdWRlL3R5cGVzLmggYi9pbmNsdWRlL3R5cGVz
LmgKK2luZGV4IDEyNDZhNGRmLi4yYzFhNDFjZiAxMDA2NDQKKy0tLSBhL2luY2x1ZGUvdHlwZXMu
aAorKysrIGIvaW5jbHVkZS90eXBlcy5oCitAQCAtNDIsOCArNDIsMTEgQEAgdHlwZWRlZiBzaWdu
ZWQgbG9uZyBsb25nIHM2NDsKKyB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgc2l6ZV90OworIHR5cGVk
ZWYgc2lnbmVkIGxvbmcgc3NpemVfdDsKKyAKKysvKiBib29sLCBmYWxzZSBhbmQgdHJ1ZSBhcmUg
cHJlZGVmaW5lZCBzaW5jZSBDMjMuICovCisrI2lmIF9fU1REQ19WRVJTSU9OX18gPCAyMDIzMTFM
CisgdHlwZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7CisgI2RlZmluZSBmYWxzZQkwVQorICNkZWZp
bmUgdHJ1ZQkxVQorKyNlbmRpZgorIAorICNlbmRpZiAvKiBUWVBFU19IXyAqLworLS0gCisyLjQz
LjAKKwotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
