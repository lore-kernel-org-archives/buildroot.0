Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19200C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 15:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABBFC40FC8;
	Fri, 19 Jul 2024 15:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73YrWGvCZys7; Fri, 19 Jul 2024 15:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5255140FD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5255140FD9;
	Fri, 19 Jul 2024 15:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E8B71BF2E4
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 15:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C85760EC7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 15:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iurcKqN61Me for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 15:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 171F9608E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 171F9608E4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 171F9608E4
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 15:27:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacSY-1rsks62AQc-00kTxc; Fri, 19
 Jul 2024 17:27:20 +0200
Date: Fri, 19 Jul 2024 17:27:19 +0200
MIME-Version: 1.0
Message-Id: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
X-B4-Tracking: v=1; b=H4sIANaFmmYC/1XNTQ6CMBRG0a2Qjq3pKy1tHbkP46C/0IFggBCUs
 HcLEZHh99JzO6HOt9F36JJNqPVD7GJTp8FPGbKVrkuPo0sbUUIZYSDwu/djj7m21mhTgCUapbf
 P1oc4rp3bPe0qdn3TvtbsAMt1K6hvYQAMWEvHLbXBBi6u5WM8175Hix/objj9GYoJllRJTnIao
 FBHk+9GELaZPP2jQHFHCiuNI0fD/gzIzbBkgGslGAvgndnNPM8fpH/WczQBAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721402839; l=2413;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=tfJ13mJABEEWWmB/ObtY3Pxt1OOWjeKNM/De/BmybXI=;
 b=CbgNLoUJ2ygNzFuhUob+0fvr1w1+39UpPuFLzO58LFWYn0wZ5OYwhS3i2jezIIfe+SDukefEc
 oQTHZtGrHPUDJcKjiahTb2dOeZZb9Xf8cwSDre0qo3t7MqJaaKkVj40
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:naLmFTdIWmleK/ecztkmBm69SK2hCdlpaWjglCgskU4niYqkJpT
 pq/52kEpq6XfKJIMJDWla1Irsg6lZj6mjuqCEESjaVj5LjB4ygTfa8ufdzVyD0yiwB8E7ei
 ZBX88P/ktAF3hnQ1Ii3lNs1eBss/SpTW7Hl1PoRRZXvpDMy6ysyQYKTfIUAZIi98Ib+SPvi
 RjWoaJtTXEz3JSK0RH+xw==
UI-OutboundReport: notjunk:1;M01:P0:hI8cUPcYdjI=;9a5oIcJAQfy+Rr1XhM854OIVsSb
 XojjMDvLZkcs25e46/t3Pu4RFX0IS1Y8UenNTPQnLXOAXOMwskIkC5CsN1rnDH22JYMAaTFDh
 phgg9Xvf0KX6eRcFk1Ii5fcdTEr7RiPwAdL8A8iylflojzvdgIGyyNSdecR8fAWpPOz/EJt20
 Anj8xi7VY+x+FAIteRUtKBBc0ZYH5mdUxbs/43FRONpzbFghkMviwupPKaB1jrFn4WoIh4nnV
 bbxWej0jpLJHxxTihBkbrzB1ratjt3usu6W4RXan9HjZQ7mSz2x4Q4PcNW0vw4fVgccnnqZQ+
 NUUEM1QJG5cX/wsOzksdQ5paZmr2PLxubsOjmsbdiOS2XXTemPAbkSMdyedScs6iwfF0RDlib
 DNDwGaZnVX+0rP38Cg0KrN0e/tk5LAvPVeBbP2DlPSRhvPitZQEJjbKSa3m/89wRCUtLNkJtG
 RL/0WxWA7L/daiQnMlaPk58IrbkYzyg60oh52mWii49Mxq9lq+mqxizLHWUShyKAhbGDQ3Mbw
 TVBS6ZwNv72KATHHLhv5TvKSaEWm+yoVKyTZrUttB6pDIFINH5OLhQGw4gFDbq4oRs/mB9Kzj
 7yqpUXVM7hfJ6gjUew1/dgxPb2qXt+MdGeICKa6ZmjB6k3naLJkLcvVLDEncl63aw0gqFEXyB
 fW1jQj3EK//rzdvHtc8F3sMT375K5grTcI7cI9y9nhHJ+aCfyafxIweeCaRErzrJB2g/3Jcfu
 M89thZeIjiLlQM3+ND6FTPYAMbjdyTm26xvyDcZkZAa1an2aydoat5lbNtwYEZVS+F1bSr4gI
 PK/Ee3l7fFjoB4VjJ+t12wgQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721402840; x=1722007640; i=j.neuschaefer@gmx.net;
 bh=m7P7FM6ECBwrt/DxMnuxvo4ysZpypv0MTpoIotdPRWk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tNgHv0LTscclOhY2/+qSaIMlLKJpSZZvvLAlAwNdgqPNJIcJyayCrxMe9tRQE+1c
 kmwPy96oscmfeREZcP5tjIxcHNxqcjt0Vvn5Whp2vGPJ7XO5ncxSjogMGEZZw9KcV
 +LA0EJsD+0qbKS29Ml3iie3p2jr8cYsJI8XywGN9XnKQrziU5BHMJE5ilwpCmYMdr
 v4C39M4WtE3o9qyMI00oLZpKawWLW0QXkL46DctCKznR+53tWBd+dBVGgO4aK5y4V
 d90mzvis+z52hbq9F6D9jRJN+RZPOFuJNY6EWl6qckHuL5yjFPatDJd3FdhtdoUlt
 rJ7bQ4TpUvmDBRq7rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=tNgHv0LT
Subject: [Buildroot] [PATCH v5] Config.in: ban textrels on musl toolchains
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bXVzbC1saWJjIGRvZXNuJ3Qgc3VwcG9ydCBURVhUUkVMc1sxXSBhbmQgcHJvZ3JhbXMgd2l0aCBU
RVhUUkVMcyB3aWxsCmNyYXNoIG9uIHN0YXJ0LXVwIHVuZGVyIG11c2wuCgpUaGlzIHBhdGNoIGZv
cmJpZHMgdGhlIHVzZSBvZiBURVhUUkVMcyBvbiBtdXNsIHRvb2xjaGFpbnMgd2l0aCBkeW5hbWlj
CmxpbmtpbmcuCgpUbyB2ZXJpZnkgdGhpcyBwYXRjaDoKCi0gRGVsZXRlIHBhY2thZ2UvbWljcm9w
eXRob24vMDAwMS1weS1ubHJ0aHVtYi1NYWtlLW5vbi1UaHVtYjItbG9uZy1qdW1wLXdvcmthcm91
bmQtb3B0LnBhdGNoCi0gQnVpbGQgbWljcm9weXRob24gKGJlZm9yZSB2MS4yMykgd2l0aCBhIG11
c2wgdG9vbGNoYWluIGFuZAogIEJSMl9TSEFSRURfTElCUy4gVGhlIGJ1aWxkIHNob3VsZCBhYm9y
dCB3aGlsZSBsaW5raW5nIG1pY3JvcHl0aG9uLgoKWzFdOiBodHRwczovL3d3dy5vcGVud2FsbC5j
b20vbGlzdHMvbXVzbC8yMDIwLzA5LzI1LzQKClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVy
IDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci0tLQpDaGFuZ2VzIGluIHY1OgotIEZpeCBib29sZWFu
IGxvZ2ljIChpZmVxLi4uKQotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNDA3MTgtenRleHQtdjQtMS0xNWE5NzQ0ZjFlZGJAZ214Lm5ldAoKQ2hhbmdlcyBpbiB2NDoK
LSBSZW1vdmUgQ29uZmlnLmluIG9wdGlvbiwgaW1wbGVtZW50IHRoZSB3aG9sZSBsb2dpYyBpbgog
IHBhY2thZ2UvTWFrZWZpbGUuaW4KLSBEb2N1bWVudCBob3cgdG8gdmVyaWZ5Ci0gTGluayB0byB2
MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDcwNC16dGV4dC12My0xLTkxOTVkMDZj
OGJkMEBnbXgubmV0CgpDaGFuZ2VzIGluIHYzOgotIGRyb3AgbWljcm9weXRob24gcGF0Y2ggKGFs
cmVhZHkgbWVyZ2VkKQotIHJld3JpdGUgdG8gcG9zaXRpdmUgbG9naWMsIGFzIHN1Z2dlc3RlZCBi
eSBZYW5uIEUuIE1PUklOCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI0MDUyOS16dGV4dC12Mi0wLTgyOTg1MDMyZjE2OUBnbXgubmV0CgpDaGFuZ2VzIGluIHYyOgot
IFNsaWdodGx5IGRpZmZlcmVudCB3b3JkaW5nCi0gRW5hYmxlIHRoZSBvcHRpb24gYnkgZGVmYXVs
dCBvbiBtdXNsIHRvb2xjaGFpbnMKLSBBZGQgcGF0Y2ggdG8gZml4IGJ1aWxkIG9mIG1pY3JvcHl0
aG9uCgpMaW5rIHRvIHYxOgotIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MTktenRl
eHQtdjEtMS1hOGQ1YzJjZmNmNTdAZ214Lm5ldAotLS0KLS0tCiBwYWNrYWdlL01ha2VmaWxlLmlu
IHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL01ha2VmaWxlLmluIGIvcGFja2FnZS9NYWtlZmlsZS5pbgppbmRleCA0N2E4
OWYxYWUxLi4xY2VkZmVmYTdlIDEwMDY0NAotLS0gYS9wYWNrYWdlL01ha2VmaWxlLmluCisrKyBi
L3BhY2thZ2UvTWFrZWZpbGUuaW4KQEAgLTE0OSw2ICsxNDksMTUgQEAgZW5kaWYKCiBUQVJHRVRf
TERGTEFHUyA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX0xERkxBR1MpKQoKKyMgbXVzbCdz
IGR5bmFtaWMgbG9hZGVyIGRvZXNuJ3Qgc3VwcG9ydCBEVF9URVhUUkVMLCB3aGljaCByZXN1bHRz
IGluIGEgcnVudGltZQorIyBjcmFzaCBpZiBpdCBnZXRzIHVzZWQuIFRoZSAiLXogdGV4dCIgbGlu
a2VyIG9wdGlvbiBpc3N1ZXMgYSBidWlsZC10aW1lIGVycm9yCisjIHdoZW4gRFRfVEVYUkVMIGlz
IHVzZWQsIHNvIHdlIGNhcHR1cmUgdGhlIHByb2JsZW0gZWFybGllci4KKyMKKyMgU2VlIGFsc286
IGh0dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0cy9tdXNsLzIwMjAvMDkvMjUvNAoraWZlcSAo
JChCUjJfVE9PTENIQUlOX1VTRVNfTVVTTCk6JChCUjJfU1RBVElDX0xJQlMpLHk6KQorVEFSR0VU
X0xERkxBR1MgKz0gLVdsLC16LHRleHQKK2VuZGlmCisKICMgQnkgZGVzaWduLCBfRk9SVElGWV9T
T1VSQ0UgcmVxdWlyZXMgZ2NjIG9wdGltaXphdGlvbiB0byBiZSBlbmFibGVkLgogIyBUaGVyZWZv
cmUsIHdlIG5lZWQgdG8gcGFzcyBfRk9SVElGWV9TT1VSQ0UgYW5kIHRoZSBvcHRpbWl6YXRpb24g
bGV2ZWwKICMgdGhyb3VnaCB0aGUgc2FtZSBtZWNoYW5pc20sIGkuZSBjdXJyZW50bHkgdGhyb3Vn
aCBDRkxBR1MuIFBhc3NpbmcKCi0tLQpiYXNlLWNvbW1pdDogODllM2IyZmI4NDY1MDYyMTdiNDc2
N2ZlOTE2NWYxNjQxYTQwNzMxNApjaGFuZ2UtaWQ6IDIwMjQwNDE3LXp0ZXh0LTVhY2NiYWI2MWMw
YQoKQmVzdCByZWdhcmRzLAotLQpKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
