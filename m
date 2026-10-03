Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FD5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BE560622;
	Sat,  3 Oct 2026 07:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXQoVA5p1umC; Sat,  3 Oct 2026 07:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CA84E60628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011418;
	b=cKo4NEFgslzFsJjHCRgEV0qoHllS8JOOIL+iwT2BxZe2XppgSW7of2nM5Cm+E30/Pp5S
	 ht0462dR9JIvECAHW7pKfD17gBjH3/+pm8MkTOvXMkv6crduZe301bjqjDMGBKC6AOKRR
	 eSILHMvlq6RtMN3B8uKYRw1YDNuaTljGTA9/R/sWJmhat0WWpFyFio2216GSyf6grzSJh
	 feOKMIe+CpSkaqvdI8OGs2XN0C4lbEzhkbQDeAT1YiMSlLYBJ4f/oa45f5Vg8e5kAIsyz
	 ZHn3vVoPSlcf+kFe8duZ1EVeg3CxM2KbDWRCzPgClmIuoY5F4zp4Yf/kLN4yGaX2x2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kC8HRl2No+GEMqdbw4iwd+0f33t2SEP/I40/makZ2EU=;
	b=rPflI9COV68/2efheJdY4YiDyHPZ5rL0r7rm6CCnYkBwilvVwD+K4JnssyIvxjTavPc9
	 kcVFDI6VCRmoMbMJN5kr3jtkCoyT5VK/gIGWLdTBzfs9Ebgt26WjXR2UeiohZrQFbg+Y3
	 yXAoKa6mEHyKDWPN1SgkybotI9P1vm195tU0qv0q12farV1NZY4T28JLlpBfq93WEgfIO
	 +Yb6o7cn0gSLICz5wbNHiSwn4YXcS62xASboYD0ObhdXTa6BkwKH4jGumPjQuvVb+C7wI
	 co0ErJky0V5FE+EzULm97g0deTS+h6TXLweK6DbMgQSYjSRCKHtToOJ9WG0/YqeDPqQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011418;
	bh=kC8HRl2No+GEMqdbw4iwd+0f33t2SEP/I40/makZ2EU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IGFu+OdO55lFEArG1Q1m5c9871DMicElFv2qXViAgO3H3YSmVsOtBfmlSR/gfumQk
	 cazVWRuUK3ofFomGmIQZUHbRaCxo9dSam75P7CY7+OMS48h5ho2HJ3cI4lFwuwFeX/
	 SdBmvx8zBVmvvFCSXJw72OhSoIs1AjEL3aOSIVhjKKOcAh6lIw6rJ5c1rmrUMUgBQV
	 cERuDAFLnIaHNeJFyvjVIlfCVTVpivQDwLXnguWHn4hZpdS/+/6wvvOeRBi8TsFnRi
	 Gvekv16dxC6dDLK2w+ocAQcfhZn6NKUpSzr/64OMLvhAbl8nzupBybtFWwm8bqlRb3
	 MPQFzzkTJTIzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA84E60628;
	Sat,  3 Oct 2026 07:10:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7291263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4E5440EBD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkALCufcvG0b for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B5E2940EAB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011416;
 b=b22SXGpLO3d2bNM+c4wGqVKtNrsK6B/LspIXJ3nvcqu0/L/ddAlkzZOzxCozPmEXj8xq
 8i0a4UPkk8tI0MZQ1+2BtgJGkmlTXiqa7ajKK9++rLJPYQLnnuCYtyAs8wMjcqEcDlZas
 s0Dwd9dbVgjOEIfM2MBVGSDdZz/L493T/1Rq6LTZMu+rSFIMiYVl/pnBBqU8RkWSq0PGb
 ZaUbrMfG7DNS7Z/kjbTRaiul/HGuTO7nYXrFSFgmTDFJWuqdMUrJsxZNLF4Nrg/Z4aKVC
 TvYXrmvFIro1lPYbR8+0bEUwWKmWDO2rnBRp58NolWNob5utHAP5R07suKCegrXk9dQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011416;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IfY6VEy+2F/HQXJHStPTstgk/oeZlCt4v22g0KN86w4=;
 b=WCsQvCAcTWeG6zt/tvtTa/AHRkltmdriGiMUwXfmDKDLrqOABzrZXJTim6oyg8/aWTrg
 6e410LgZVqYWpcCPvtMP95vXMBdpb0s/e5s5VuizMa0T2gQgz1tpEVEQDWME7ge311cp+
 ub3SbAtLPu4GHAXnyQuECco/EAlGNaN7GH21ZtddDGwyGSX62C9LfNzMBUB7inS8tpctX
 4NrhvA6F+ZhZ4q74xg/B6pfocqgdeCk0solLDAtLfa80oaktv8F6yBSYxcVzLdR0RFQZo
 D+PLBnutMRoVdKaIie6uYx+gUPUyvfyORSwefWOa1+54ptuS9HD8Ol7nmjC2uYatP6w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pdcwPnWk; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pdcwPnWk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5E2940EAB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010929;
 bh=IfY6VEy+2F/HQXJHStPTstgk/oeZlCt4v22g0KN86w4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pdcwPnWkqU0hRoNsLWUuzhkntq4FQoFYou4B0JSK0njORL4kbzPpLHi4aqfvCPTQH
 jTSxXGKtvoUJsHkW3LhRyxH4YLDOZ/9yxTscTsmwR07Wgwce477HLs8vX+hE0c+jQp
 83LfpQuSo0AskGOCFz212cDKSMLZjhEeHWZbcs774z0jYIuo71ryR4zh4+/QPmCBCU
 9SJT+qyqTMPpuakvk0iXUjMw6ZIKfwbnsz5FKHK+KFhHG1ET+EZjcs+Cayj6QRuS88
 zJwLcN7ztp0kjoqXo8/4fLsLbzNzdCHIgiGyBr+4d+USQH07iV7lsiZi/GokV177Qo
 JKmjWjvDfkvFg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 Sy7O+upLBCYAWlb4EcrItPPFpXZgTcJdUgqhcfZpnii62qWzFmAwztXtAlYAyiUxXxvjAz3Hcko
 sMNmgfQZmcCl2d3GAYiFRIsggWsvig827+9jMkNnc+Yh1Ov1JCGwL43wssV+kkfHBcWIdOxujGF
 FrA6MbkJTKF7f69fkZssZ3vzAnm60KGCgG1SZM5v5bBC64Z4AZTNjwigGK816tam4XbRFc0iHI2
 pxs68CsTQtdMaf34y4klXYi3kUYbcne9X+kOG66sIrTAWiQ9mQwHGo8/jlHjXRxIhpjfIIBZMQO
 SLJSRzBMXfeOfPgaiEoKYGPhtBjH+78KYAc6KinI5EESXalISjhOdKegfRBXqdCI0UL1gqo0uXd
 gequ94mOHOgg5WADuDXzEPLpRwEgZrmrUB8fU9R1vFkJzDEFM9hqVfQN+EIRSrqIxn2WVg0P8aa
 wcp4pLT2PNK9b/L5TuXNbqQDLKQ80+B2RFaQwDmd+ULbebhffUyKLoMQtA/IimnUuypkaIB+Gl7
 Go59CjGsbp0+8P4xlx0XOk6MuJLkC/67TO+TfjXZtLr2JCuF/A21w36CyNu2o8EvZHR+VMmx1kj
 6LYDCGPWXSvtz0JqPjM8xv3Xk9iws7MuktQYrZF+kAnZax4ksZZ2KpnJ8N+OkSjG
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4A35A4C5433;
 Sat,  3 Oct 2026 09:02:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-1L06;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:52 +0200
Message-ID: <20261003070128.1295458-80-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 080/114] package/python-sdbus: bump version to
 0.14.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgpDYzogUmFwaGHDq2wgTcOpbG90dGUg
PHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgpDYzogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3Rz
QGdvb2dsZW1haWwuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5o
YXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMubWsgICB8IDQg
KystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLmhhc2ggYi9wYWNr
YWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFzaAppbmRleCA2ODBmNTAxMTM3Li4zODVh
Nzk5Y2ZmIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFz
aAorKysgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFzaApAQCAtMSw1ICsx
LDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvc2RidXMvanNv
bgotbWQ1ICBiN2I5OGJmZDg5MzRiNjc2YTQ4YTllNGM2YzE4MGY4ZSAgc2RidXMtMC4xNC4yLnRh
ci5negotc2hhMjU2ICA0ZjVkMTNiMTk2ZTFlMWRlMzUzMTFlYmIyNTYzYTMyZGU3OTE0NTFhMzBm
NWI5YTQ4OTQ1MjhiYTk4NzY2NDEyICBzZGJ1cy0wLjE0LjIudGFyLmd6CittZDUgIDkwMWU5M2M3
Yjc0MTM1Nzk5NDU5ZGRhMDdjYTcyMmM4ICBzZGJ1cy0wLjE0LjMudGFyLmd6CitzaGEyNTYgIDRl
YzRmYTQxMDg2MjliYWU1YWIyNzc1ZTU1NzViMDI1MWZkYjU1NWQ0YTM2MTNjOWRkYjM3ZmM3M2Y4
ODI5ODMgIHNkYnVzLTAuMTQuMy50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hl
Y2tzdW1zCiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUx
NGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cy5tayBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1z
ZGJ1cy5tawppbmRleCA2ODU2MjZmZmI0Li44NGZhNmEyYWIwIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMubWsKKysrIGIvcGFja2FnZS9weXRob24tc2RidXMv
cHl0aG9uLXNkYnVzLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAotUFlUSE9OX1NEQlVTX1ZFUlNJT04gPSAwLjE0LjIKK1BZVEhPTl9TREJVU19WRVJTSU9O
ID0gMC4xNC4zCiBQWVRIT05fU0RCVVNfU09VUkNFID0gc2RidXMtJChQWVRIT05fU0RCVVNfVkVS
U0lPTikudGFyLmd6Ci1QWVRIT05fU0RCVVNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy83Yy8wZi8wY2Y2YjJmYjAzMzhmYjNhYjU2NGNiOGE4ZDY4YWExYzZk
ZTc2Nzg1MWY1ZjlkZTlhM2M4M2RiYWJlYWIKK1BZVEhPTl9TREJVU19TSVRFID0gaHR0cHM6Ly9m
aWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzY5LzBlLzE0YjBmMTYwODdjZjdmMWUxODE3
ZGE5MjgyZGNiNTkwZmUyNzAzMGM2YmExMzZjM2UzNWRmZjY0N2YzYQogUFlUSE9OX1NEQlVTX1NF
VFVQX1RZUEUgPSBzZXR1cHRvb2xzCiBQWVRIT05fU0RCVVNfTElDRU5TRSA9IExHUEwtMi4xKwog
UFlUSE9OX1NEQlVTX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCi0tIAoyLjQ3LjMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
