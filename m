Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DA2C52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 20:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC41781751;
	Sat, 24 Aug 2024 20:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4X_0tJBf-ysT; Sat, 24 Aug 2024 20:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E1B8117C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E1B8117C;
	Sat, 24 Aug 2024 20:11:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA621BF28D
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 20:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A4C7402E1
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 20:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpjb6gftJndm for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 20:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDA78402DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA78402DD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDA78402DD
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 20:11:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([84.44.134.213]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KUT-1s2ZrH0TAP-010y7s; Sat, 24
 Aug 2024 22:11:06 +0200
Date: Sat, 24 Aug 2024 22:11:02 +0200
MIME-Version: 1.0
Message-Id: <20240824-x264-textrel-v1-1-fbfcedc7179d@gmx.net>
X-B4-Tracking: v=1; b=H4sIAFU+ymYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyMT3QojMxPdktSKkqLUHF0zwzTjRAszC8sUyzQloJaCotS0zAqwcdG
 xtbUAwC9TfF4AAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724530265; l=1535;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=4H3VsGBF9Eho70cyu7+VcYnNntxo8tQKZ/rmdZX3QEE=;
 b=TAkAh1woCxBVJP4KF6HrY/oets53RNqfqZFuL1DNbtLrEwv7mmiOh3O5LBpTHl6ZWOiRDbWs+
 pP6z8DGlnf3C/Yn9oG3I0MUZygYFl3bok/bnh/aaJesaqp9RmV3JSpf
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:HFvwqqZjhTd5lXYzxVIRlnOHqb4IQq56bYkCZI7949Xoso3geEk
 /m2nAM73QgZfMl5cNYbb1KTW+zQNujh/Bq8fVTorxBv3PdmHOhFF2qpa9B4qZJi7xkiIO/r
 K6mXB+1gw2KJEoqM2+VxCmDeojtP5s34meTVTPuPw9BT8Nt0CQ0QXCx7nNsy5rWFWMuNhp1
 NEjkaB7jneyDkaUS4bB0w==
UI-OutboundReport: notjunk:1;M01:P0:oP20I8nrEo0=;7UU5Or99iDc7iy8Dqya7Pk06JMb
 3vcpnranlOYsswHIPL2uacaCZ4fBUrBLeJ//NpSyjfKjzE6VXqKJezIku82sYcVuKgH63ATeY
 CnqUeth136Jqo8/xnqj+joEqV0Sa/wGKPZPN1OjuP/TyCrIZTvUjuWrKm2Oc3wKI5bqj4OyZf
 jxPoCAC1tA16T/Hjgbn9DQryMFf6ezg8/0vcc6R0CAX0nZzV8INPOq+zokKbKuEHYq+Thhldm
 raN6BQ9Yadtcp/F4bDqoTRjBQmpOnO0YgsNEv2biq3WfpcuEo1jnp5r+pC8VNz8ixH5NSys2c
 R3CKKwlqZqgDYfssJzADoUgaM7V/sKPs8VpLO2mZ2GAofxiU10yZTpiSj6t7hSwTxFY96DObN
 piVdhRja2dam0hemWy7mEa3ZULCZssTCu9n+n1YQcudePlF+HYpEDz+1vAfdQSHJIYvCxxrbj
 MN7WJ9ABgQpoOCOwDXE7PDamIVYnMakxVXfznHV32QIpdIYD7nmiRSyUb5dneuKqyDK0aAgcY
 44NaJBlwmtqlTcEsjNKTDzJA47w7v6JFtlKhUdIC5o5dvhGNHn5UkJxYJG/hpJU2sO1V/H69V
 EbHMx29/jCimSjenJ+SeLBxrLrjEJTVK+Ld7LJyTp9OVPw8ZZYfYMhI5wPl8FHkjsz+8UbZqG
 Vvdc0OBPtHhyf1f/uOQeRdN0kFFWO1vFYJGtot6ZCReNfCQxLEZxHJ6M8Y3y14R31nZqX1cSx
 HEaghIxrlZqb5ePIPzmt7ZFWj6tOZ5WfCPHlg0WvJ3zPJM52j5zhdyCxn73Swdsvr0WE3XiyH
 5FAP5fk2RgWY0W7jWXiCD4EQBeEPy1+2QkxnsgAtt0tbU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724530266; x=1725135066; i=j.neuschaefer@gmx.net;
 bh=BX2myZdtS8D3U6fTMI4LOZ9hMwgcEmR98q6hP2L7tkw=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=W4oPn7UMrsp66aZmBDX1snIdNrvjLei5osYN4j+jxrEyiYVSmDnP1jZm4rDzo3C+
 MZgm5OoMgT8XJlC7HU+rox1SiHqJp2mHludZwLYuzEqYYEztLaxhcNsh6LlVoK9Ob
 iuLq7x0SMg4FJvSGzZ+pJG86lgJZAdipdnBkeoxkKMZsg2SrUtJOBiui9XiiBv23B
 j+pM6npgIr+5nJ6q24aDfigcts1y06JdomE+Mu5aZWv5VtSTc86Q3+KGHujIVZWb9
 hjLiCbJI05OpTyzquP2sdRvmFICEh+bnEGqa5TbiBXcJYVw7tGbpqNnb6bQdbnTXK
 M/Zgmo+9A6kCshA6YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=W4oPn7UM
Subject: [Buildroot] [PATCH] package/x264: disable assembly code on x86 +
 musl + PIC/PIE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Yann Morin <yann.morin@orange.com>,
 David du Colombier <0intro@gmail.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHgyNjQgcGFja2FnZSB1c2VzIGxhcmdlIGFtb3VudHMgb2Ygbm9uLVBJQyBhc3NlbWJseSBj
b2RlCihlLmcuIGNvbW1vbi94ODYvZGN0LWEuYXNtKSwgd2hpY2ggcmVzdWx0cyBpbiB0ZXh0cmVs
cywgd2hpY2ggYXJlbid0CnN1cHBvcnRlZCBieSBtdXNsLWxpYmMncyBkeW5hbWljIGxpbmtlci4K
CkRpc2FibGUgeDI2NCdzIGFzc2VtYmx5IGNvZGUgd2hlbiBjb21waWxpbmcgZm9yIHg4NiB3aXRo
IFBJQy9QSUUgYW5kCm11c2wtbGliYyB0byBhdm9pZCB0aGlzIHBhcnRpY3VsYXIgaW5jb21wYXRp
YmlsaXR5LgoKUmVwb3J0ZWQtYnk6IFlhbm4gTW9yaW4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4K
Rml4ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9acnNpcm5ydmdzRUlwQUpJ
QHRsLWxueC1ueW1hNzQ4Ni0yLwpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVz
Y2hhZWZlckBnbXgubmV0PgotLS0KIHBhY2thZ2UveDI2NC94MjY0Lm1rIHwgNiArKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3gyNjQv
eDI2NC5tayBiL3BhY2thZ2UveDI2NC94MjY0Lm1rCmluZGV4IDk3Y2FmMTk0NjYuLmU5NmQ5OTMw
MTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UveDI2NC94MjY0Lm1rCisrKyBiL3BhY2thZ2UveDI2NC94
MjY0Lm1rCkBAIC0xNCw5ICsxNCwxNSBAQCBYMjY0X0lOU1RBTExfU1RBR0lORyA9IFlFUwogWDI2
NF9DT05GX09QVFMgPSAtLWRpc2FibGUtYXZzIC0tZGlzYWJsZS1sYXZmIC0tZGlzYWJsZS1zd3Nj
YWxlCgogaWZlcSAoJChCUjJfaTM4NikkKEJSMl94ODZfNjQpLHkpCitpZmVxICgkKEJSMl9UT09M
Q0hBSU5fVVNFU19NVVNMKSQoQlIyX1BJQ19QSUUpLHl5KQorIyBsaWJ4MjY0IHVzZXMgbGFyZ2Ug
YW1vdW50cyBvZiBub24tcGljIGFzc2VtYmx5IGNvZGUsIHJlc3VsdGluZyBpbiB0ZXh0CisjIHNl
Y3Rpb24gcmVsb2NhdGlvbnMsIHdoaWNoIGFyZSBub3Qgc3VwcG9ydGVkIG9uIG11c2wtbGliYydz
IGxkLnNvLgorWDI2NF9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWFzbQorZWxzZQogIyBuYXNtIG5l
ZWRlZCBmb3IgYXNzZW1ibHkgZmlsZXMKIFgyNjRfREVQRU5ERU5DSUVTICs9IGhvc3QtbmFzbQog
WDI2NF9DT05GX0VOViArPSBBUz0iJChIT1NUX0RJUikvYmluL25hc20iCitlbmRpZgogZWxzZSBp
ZmVxICgkKEJSMl9BUk1fQ1BVX0FSTVY3QSkkKEJSMl9hYXJjaDY0KSx5KQogIyBXZSBuZWVkIHRv
IHBhc3MgZ2NjIGFzIEFTLCBiZWNhdXNlIHRoZSBBUk0gYXNzZW1ibHkgZmlsZXMgaGF2ZSB0byBi
ZQogIyBwcmVwcm9jZXNzZWQKCi0tLQpiYXNlLWNvbW1pdDogOGJkMDBjMTZkOGFmMmI0YjYyMGEw
YjJjMTM2ZTY4MzBiOWQ2YjNhMApjaGFuZ2UtaWQ6IDIwMjQwODI0LXgyNjQtdGV4dHJlbC02MWYz
YTg2ODlkOWYKCkJlc3QgcmVnYXJkcywKLS0KSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJA
Z214Lm5ldD4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
