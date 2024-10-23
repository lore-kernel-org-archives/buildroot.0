Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4D5D0BB43
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98AE740879;
	Wed, 23 Oct 2024 22:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9nckqbCQxZN; Wed, 23 Oct 2024 22:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59AA94087B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59AA94087B;
	Wed, 23 Oct 2024 22:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9256E2073
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73E4560A4F
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUfJEp66y-iV for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF8C160A4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF8C160A4B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF8C160A4B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:45:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.23]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1u03Go1FW0-00sNFX; Thu, 24
 Oct 2024 00:45:30 +0200
Date: Thu, 24 Oct 2024 00:45:24 +0200
Message-Id: <20241024-ska-bump-v1-0-776aa5d8b655@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIR8GWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyNj3eLsRN2k0twCXUsTS/NUk2SDVBNzUyWg8oKi1LTMCrBR0bG1tQC
 YFNd/WgAAAA==
X-Change-ID: 20241023-ska-bump-9497e4c0e475
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723527; l=1949;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=y5HUaECGlL3Bm3Jcqa7ntsO7c4tba6bnnqxTfCVZaHQ=;
 b=wjK3mS83ucuUXGZkfcm/7E2sNwQD7ev8TEWL5LUCiJ0FS17QFagCc4DSxgoikOiW+zC6X5Gro
 X+JuWDS0jEJCZZyKU1uqEm5fmdarWb9+tsLF/Wdsebwia2y7QhmIPgI
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:UcRes1eWXR/EXkJzP0K0Fw4kDY4Jo3WYr4XnPgr0DrZxv5G2XDU
 +arDRKkpaMmZ7KFDR/abnmk9JB8S0IV8BCZDN//XYlGfMOsfIHLx9us6Md+v4KhINHa8mDK
 hvHaKLmaeJvLkmMWqnQlDjyt4//yiIk2fh9QXPXnhlKtdAfDRa5bBXijDC9HHAytXxcDKZ8
 bjBSDuxdRHfPbbTCRf9mw==
UI-OutboundReport: notjunk:1;M01:P0:sFSjhj8pWzk=;G++a28/+FjDngQgLQxmERlbV2Pg
 z752kuoiz3HGtSWzxwbYBoRdpn1o7OvqPHdiy0Tr+nSHblxTIgZGeB7ytNLUh5MKhEaUdpAr4
 W0HuLwKXTMWtZNiu7K+1SRoq8FB8NiGVma966bO2ra7kZo8W843eN7VCqatAGg7NjJyH5KROS
 TD9Qy109TKxPTsVpOQ+t1Lq0BFL85VmfwnmB3I4ebsQ4n7Nsg0co4nlBZ/UfTAreSBZdLR0eF
 /V/exyuDrp4UuCEJmWyBEjfhiMXv7LLGNIl53s1TidQ9spsAicnKHLqMkz4n2Q4/hWdTy6rQ/
 6mYk8byp95wIsqtgmLFgpuc4VgRKhyhTGxzZHXWx47I4zOSqiSPObRnUlry+UcrPKxI4t2tL7
 BoJCmU5AI5DboTgRbzRygWNx15H5PXYqh15dtJaeKubyqFp/XmtmvnOx9CmaQ7z0TtWAICF4J
 6aQyMGie5ZvnHEjZA0N1kBG3dj6V9RodHTiGGRabA/xYxAJEwRtCkvwf0p8pQ591n4ONMYTEJ
 63gT3mshMxhlWfxo5SUiRl857wpZ3gRDfUmRRlUWp2wVRgjduM1PSFjOFuwWUbLwKoqnxmSKc
 aWh3fbNJWgWUembNPnFTkZXGY8hd8FB/FJnZzQ+1viu4vr5/HVsGbe6FCjl/twpHrDRuJkbMn
 4AT+imOMGqVG3oVHKqlXOXPvIp/Uedy/wZTpXTDGMMP3z5eKy6N9Q+62YxFqGL3e/7TR4jmxx
 8Mg9fDBWiKxieJNU8PB84R6b9jZNlX7uYpLPXbx73Xy176xEWUl3XOirSG0hb2GEyXKYe4f6+
 0cvbM5h4gTA3hP5xWtY8RFCw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1729723530; x=1730328330; i=j.neuschaefer@gmx.net;
 bh=ynu10sz/XR21EO1hPK3tB0rc+jnV8CntwSIMlxFvOos=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ELmqYZ4jbZJ2yIpnU0WLw0/LOHlfxZcGpJ3QUZ8wg62uv9GhTrUDNcmyYqHq1Rgp
 HopDQjEtpmXeoA5lu3wTM+A7hQOWbIfr6oL7PpIevOlXzeVPY/3OqtqqsQad/pKTg
 LoGaKm6j+1ajWVhZ8mt1oTOn93w3PsvBUg8TUh2G42KIUKUhR85fOd8U8in7+CCHN
 MHEC152945mZpXv/LKnAsZdCuHJMIp1HQrrE3QpQ7IhEn6/ioNCFCZ9yBqz039OVJ
 QchOKG7CwnUgL445L7l3pCBfwQ/3mw+uz9IVqRb0Hr3dHsSdV/mXk3hBCpuv2AMnb
 j0lfO0iIJuy6Try1aA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ELmqYZ4j
Subject: [Buildroot] [PATCH 0/3] Update skarnet.org packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaHNldCB1cGRhdGVzIHRoZSBwYWNrYWdlcyB0aGF0IGNvbWUgZnJvbSBza2FybmV0
Lm9yZyAoaW4gb25lCmNvbW1pdCwgYmVjYXVzZSB0aGF0J3MgdGhlIGVhc2llc3Qgd2F5IHRvIGRl
YWwgd2l0aCB0aGUgdmVyc2lvbgpyZXF1aXJlbWVudHMpLCBhbmQgYWxzbyBkb2VzIHNvbWUgY2xl
YW51cHMgd2hpbGUgYXQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVz
Y2hhZWZlckBnbXgubmV0PgotLS0KSi4gTmV1c2Now6RmZXIgKDMpOgogICAgICBza2FybmV0Lm9y
ZyBwYWNrYWdlczogUmVtb3ZlIC0tcHJlZml4PS8KICAgICAgc2thcm5ldC5vcmcgcGFja2FnZXM6
IGJ1bXAgdG8gbmV3IHZlcnNpb25zCiAgICAgIHBhY2thZ2UvZXhlY2xpbmU6IFJlbW92ZSAtRF9H
TlVfU09VUkNFCgogcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5oYXNoICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tayAgICAgICAgICAgICAgICAg
ICAgIHwgNiArKy0tLS0KIHBhY2thZ2UvbWRldmQvbWRldmQuaGFzaCAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIHBhY2thZ2UvbWRldmQvbWRldmQubWsgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDUgKystLS0KIHBhY2thZ2UvczYtZG5zL3M2LWRucy5oYXNoICAgICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2UvczYtZG5zL3M2LWRucy5tayAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDUgKystLS0KIHBhY2thZ2UvczYtbGludXgtaW5pdC9zNi1saW51eC1pbml0
Lmhhc2ggICAgICAgICB8IDIgKy0KIHBhY2thZ2UvczYtbGludXgtaW5pdC9zNi1saW51eC1pbml0
Lm1rICAgICAgICAgICB8IDUgKystLS0KIHBhY2thZ2UvczYtbGludXgtdXRpbHMvczYtbGludXgt
dXRpbHMuaGFzaCAgICAgICB8IDQgKystLQogcGFja2FnZS9zNi1saW51eC11dGlscy9zNi1saW51
eC11dGlscy5tayAgICAgICAgIHwgNSArKy0tLQogcGFja2FnZS9zNi1uZXR3b3JraW5nL3M2LW5l
dHdvcmtpbmcuaGFzaCAgICAgICAgIHwgMiArLQogcGFja2FnZS9zNi1uZXR3b3JraW5nL3M2LW5l
dHdvcmtpbmcubWsgICAgICAgICAgIHwgNSArKy0tLQogcGFja2FnZS9zNi1wb3J0YWJsZS11dGls
cy9zNi1wb3J0YWJsZS11dGlscy5oYXNoIHwgMiArLQogcGFja2FnZS9zNi1wb3J0YWJsZS11dGls
cy9zNi1wb3J0YWJsZS11dGlscy5tayAgIHwgNSArKy0tLQogcGFja2FnZS9zNi1yYy9zNi1yYy5o
YXNoICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogcGFja2FnZS9zNi1yYy9zNi1yYy5t
ayAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQogcGFja2FnZS9zNi9zNi5oYXNo
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogcGFja2FnZS9zNi9zNi5tayAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQogcGFja2FnZS9za2FsaWJz
L3NrYWxpYnMuaGFzaCAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogcGFja2FnZS9za2FsaWJz
L3NrYWxpYnMubWsgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KIHBhY2thZ2UvdGlwaWRl
ZS90aXBpZGVlLmhhc2ggICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2UvdGlwaWRl
ZS90aXBpZGVlLm1rICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogMjIgZmlsZXMgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDog
NmJlYWI1YjczOTkzMDI3NjQzZDVkYTNiYmRkY2E2ZjQ0ZDFlZDZlNApjaGFuZ2UtaWQ6IDIwMjQx
MDIzLXNrYS1idW1wLTk0OTdlNGMwZTQ3NQoKQmVzdCByZWdhcmRzLAotLQpKLiBOZXVzY2jDpGZl
ciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
