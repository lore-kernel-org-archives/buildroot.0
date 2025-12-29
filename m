Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE7AE92734
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 15:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB1160AFD;
	Mon, 29 Dec 2025 15:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gy-w-D13HHiq; Mon, 29 Dec 2025 15:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C695E60823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767022007;
	bh=2SB0B1tL9d7ji+lmy6kuPeuhONd2TkqXc1tbCt+Jfi0=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AYhM5Ov4gvLQYM+KKmRb/hpK3/OaIZCJLOJb6BvBKpwZkd7jQipYgR9qTmEIML+P/
	 qOQWiXzWOhmJQC9TQn88bYw3lYyb6rDyUu1AFLx1jBm7edrrPz1iF+Iic8qG4AmOsf
	 c48XrL+9yE6IzbwKlIDCLafru1K3/mr0+78Ik2vnejY0duIf79Qez4+CLgTRbY3G2F
	 Umz+WnfcbnEqOtlG05F+GbY2rMFkUFyBJ9V/ctTtS9Vh4w0p3F4hxWVvTkMMbuQta0
	 t1WzAEL051i7X9O8AfLO600vTfc32hYldPBD2H8cxFw54OyJfOBlu/6OhTYjnZqa4A
	 JwNHFjpvQ40sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C695E60823;
	Mon, 29 Dec 2025 15:26:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 786D1B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 15:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A610403AC
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 15:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMNHd0D7xfkL for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 15:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15AAC40259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15AAC40259
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15AAC40259
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 15:26:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.100.107]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK0X-1vs2yP1dTd-00x1RJ; Mon, 29
 Dec 2025 16:26:32 +0100
Date: Mon, 29 Dec 2025 16:26:22 +0100
MIME-Version: 1.0
Message-Id: <20251229-rgbmatrix-bump-v2-1-e89d8f364991@gmx.net>
References: <20251229-rgbmatrix-bump-v2-0-e89d8f364991@gmx.net>
In-Reply-To: <20251229-rgbmatrix-bump-v2-0-e89d8f364991@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767021991; l=2634;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=3FJqV27AJTjF47qI2Ur8Zhb14Vmms3Ao3QBHBg3eyl4=;
 b=GzBcR4NZ3R4HktudP2OprJXV3SGw3gzcJugKjzBcibxp8ZxXurN19VpBehb41qCHaeGpvR2QZ
 hS7o6COf5tDDl0+017FAv1PT26AaEw8mUxl2q49xAANngtyrdAkmIM7
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:mECxxYR+izvYGs6uJOYIOFe5CRBWmkLPFLsJ7obHe10AUTo95ju
 bkYNQkk6jRVuno44gGLexythU6oIYlcII8y8P6VWtWJQcVi+911+y0Q84qilJGomKMFF0Ci
 fb8Eeu8PaOC8NHrGg+CrwVkxNhRB4ckEEQzI6FPHP7XZ151WPLjZPHidEUy6kdnL6EVi3+z
 OrjNRjWgBc4g5BSQ87LQw==
UI-OutboundReport: notjunk:1;M01:P0:LgQ5zhph+Ac=;/Xkww2YeneMUBXlrAMOC7ida/JO
 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
 V2nRrTF/ks/iyJF7bUZc11TNJvX7A
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1767021992; x=1767626792; i=j.neuschaefer@gmx.net;
 bh=YJqYTcJjndO1K6mfJ9CYPVc5SpTHYUymZB67HFuhrKM=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pBfzLQ5mSHn+GkJKgvM8FxAsTllzWjkf+toWlus+9KCyhZIDzSfUbVClJ15apQI8
 X0lNjs92frJdcOeX38/IYEr7LPHrXAwlCkkl7ajnbpmuKQJ7yehtX525cvutFwsEE
 xTxZDrzxj3rqE7fnH0m25lrajSUrRA7BAvNNA07bDIK7PiTrbmbLF2yUW6NuQZ9zY
 Hpe8vLc+9JBXtxapkidIY2O+/aVNRT4ZI4A/Oean8Y9pGjhQhgL05KWqkNnv0QrLF
 I6EAhrzr/n74sZ5+s7BddDKvDaoAGILnqGDesZcrf1Imf0ZOgMkTA1qzE76/VhskU
 +Uy4lWOe932aibWmIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=pBfzLQ5m
Subject: [Buildroot] [PATCH v2 1/2] package/python-pillow: install
 libImaging headers
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWx0aG91Z2ggcHl0aG9uLXBpbGxvdyBpcyBhIHB5dGhvbiBtb2R1bGUsIGl0IGlzIHBhcnRpYWxs
eSBpbXBsZW1lbnRlZAppbiBDLiAgcHl0aG9uLXJnYm1hdHJpeCAodGhlIHB5dGhvbiBtb2R1bGUg
Y29ycmVzcG9uZGluZyB0byB0aGUgQysrCmxpYnJhcnkgcnBpLXJnYi1sZWQtbWF0cml4KSBhY2Nl
c3NlcyBpbnRlcm5hbCBzdGF0ZSBvZiBvYmplY3RzIGNyZWF0ZWQKYnkgcHl0aG9uLXBpbGxvdywg
dGhyb3VnaCBuYXRpdmUgY29kZS4gUHJldmlvdXNseSwgcHl0aG9uLXJnYm1hdHJpeAppbmNsdWRl
ZCBpdHMgb3duIGRlZmluaXRpb24gb2Ygc3RydWN0IEltYWdpbmdNZW1vcnlJbnN0YW5jZSAoY2Fs
bGVkClBpbGxvd0ltYWdpbmdJbnN0YW5jZSk7IHNpbmNlIGNvbW1pdCBiZjQ1Njc2ICgiUmVmYWN0
b3IgYnJva2VuIHVuc2FmZQpTZXRJbWFnZVBpbGxvdygpIilbMV0gaXQgaW5jbHVkZXMgcGlsbG93
J3MgSW1hZ2luZy5oIHRvIGdldCB0aGUgc3RydWN0CmxheW91dCBhbmQgdWx0aW1hdGVseSB0aGUg
b2Zmc2V0IG9mIHRoZSAiaW1hZ2UzMiIgbWVtYmVyLiBUaGVyZSBpcyBubwpkaXJlY3QgbGlua2lu
ZywgYm90aCBuYXRpdmUgbGlicmFyaWVzIGFyZSBsb2FkZWQgaW50byB0aGUgc2FtZSBwcm9jZXNz
CmFzIHBhcnQgb2YgdGhlaXIgY29ycmVzcG9uZGluZyBQeXRob24gbW9kdWxlcy4KCkR1ZSB0byB0
aGlzIG5ldyBkZXBlbmRlbmN5IG9uIEltYWdpbmcuaCBhbmQgcmVsYXRlZCBoZWFkZXJzIGl0IGlz
IG5lY2Vzc2FyeSB0bwpjaGFuZ2UgcHl0aG9uLXBpbGxvdyB0byBpbnN0YWxsIHRoZSBoZWFkZXJz
LCBwcmlvciB0byBidW1waW5nIHB5dGhvbi1yZ2JtYXRyaXguCgpEZWJpYW4gb25seSBpbnN0YWxs
cyBmb3VyIGhlYWRlcnNbMl0sIGJ1dCB0aGlzIHNlZW1zIGluc3VmZmljaWVudCwgYmVjYXVzZQpJ
bWFnaW5nLmggaW5jbHVkZXMgYXQgbGVhc3Qgb25lIGhlYWRlciB0aGF0IGlzIG5vdCBvbiB0aGlz
IGxpc3QgKEFycm93LmgpLgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vaHplbGxlci9ycGktcmdi
LWxlZC1tYXRyaXgvY29tbWl0L2JmNDU2NzZhY2I5YWFkM2U0NTM4MzNjM2ExMzAzM2FiMDY1MGFi
YjMKWzJdOiBodHRwczovL3NvdXJjZXMuZGViaWFuLm9yZy9zcmMvcGlsbG93LzEyLjAuMC0xL2Rl
Ymlhbi9ydWxlcyNMMTA2CgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hh
ZWZlckBnbXgubmV0PgotLS0KCk9uZSBwb3NzaWJseSBvcGVuIHF1ZXN0aW9uIGlzIHdoZXJlIHRv
IGluc3RhbGwgdGhlIGhlYWRlcnMuIEN1cnJlbnRseSwgSSdtCmluc3RhbGxpbmcgdGhlbSB0byAk
KFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZSwgd2hpY2ggbWFrZXMgdGhlbSBlYXN5IHRvIHBpY2sK
dXAsIGJ1dCBhcmd1YWJseSBwb2xsdXRlcyB0aGUgdXNyL2luY2x1ZGUgZGlyZWN0b3J5LiBEZWJp
YW4sIGZvciBjb21wYXJpc29uLAppbnN0YWxscyB0aGVtIHRvIC91c3IvaW5jbHVkZS9weXRob24z
LjE0LyAoYWNjb3JkaW5nIHRvIHRoZSBQeXRob24gdmVyc2lvbikuCgp2MjoKLSBSZXdvcmQgdGhl
IGNvbW1pdCBtZXNzZ2FlIHRvIGluY2x1ZGUgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcmVx
dWlyZW1lbnRzCiAgb2YgcHl0aG9uLXJnYm1hdHJpeAotLS0KIHBhY2thZ2UvcHl0aG9uLXBpbGxv
dy9weXRob24tcGlsbG93Lm1rIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1waWxsb3cvcHl0aG9uLXBpbGxvdy5t
ayBiL3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rCmluZGV4IDgwOTYxYjky
YTUuLjNhZTQ5MzhkYzUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9weXRob24t
cGlsbG93Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rCkBA
IC0xMiw2ICsxMiw3IEBAIFBZVEhPTl9QSUxMT1dfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKIFBZ
VEhPTl9QSUxMT1dfQ1BFX0lEX1ZFTkRPUiA9IHB5dGhvbgogUFlUSE9OX1BJTExPV19DUEVfSURf
UFJPRFVDVCA9IHBpbGxvdwogUFlUSE9OX1BJTExPV19TRVRVUF9UWVBFID0gc2V0dXB0b29scwor
UFlUSE9OX1BJTExPV19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIAogUFlUSE9OX1BJTExPV19ERVBF
TkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYKIFBZVEhPTl9QSUxMT1dfQlVJTERfT1BUUyA9IFwKQEAg
LTc1LDQgKzc2LDkgQEAgZWxzZQogUFlUSE9OX1BJTExPV19CVUlMRF9PUFRTICs9IC1DemxpYj1k
aXNhYmxlCiBlbmRpZgogCitkZWZpbmUgUFlUSE9OX1BJTExPV19JTlNUQUxMX0xJQklNQUdJTkdf
SEVBREVSU19TVEFHSU5HCisJJChJTlNUQUxMKSAtRCAtbSAwNjQ0IC10ICQoU1RBR0lOR19ESVIp
L3Vzci9pbmNsdWRlICQoQEQpL3NyYy9saWJJbWFnaW5nLyouaAorZW5kZWYKK1BZVEhPTl9QSUxM
T1dfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9PS1MgKz0gUFlUSE9OX1BJTExPV19JTlNUQUxMX0xJ
QklNQUdJTkdfSEVBREVSU19TVEFHSU5HCisKICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKCi0t
IAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
