Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EBAC87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 12:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14CFA83CFC;
	Wed, 30 Jul 2025 12:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0P3V0l6gY6GB; Wed, 30 Jul 2025 12:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 144BB83D03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 144BB83D03;
	Wed, 30 Jul 2025 12:47:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B461186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 721154097A
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buC46jZjlbcX for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 12:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 579CC4096F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579CC4096F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 579CC4096F
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 12:47:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCAC4439A2;
 Wed, 30 Jul 2025 12:47:21 +0000 (UTC)
Date: Wed, 30 Jul 2025 14:47:14 +0200
MIME-Version: 1.0
Message-Id: <20250730-openscap-v1-2-46e4a32e26da@bootlin.com>
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
In-Reply-To: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrghruhgthhesthhkohhsrdgtohdrihhlpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhim
 hhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhmpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753879642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iweaS75TYpk0uPvPLeSTxF1b+GBpvIkFyZZxeNapgB0=;
 b=jzJBEh93P07v07jcZfqVBnjJX6G4gWcHs0STdX/ZCs52nrYJPyxKUxySKuWepBX2PphLM8
 33ZqV30rThvkqxBgr86tFFHjoGC+7sANuOkuUKINlPHA0AC8d2KmJPyIe/rIP2CJfQu7eM
 d+7sp7kiKmvu0yix7xfevewTgcgwfboQuCxF+e9Txy/rbBDARLBKoiebGDF1J+SeceDtC+
 FWVE4uVUOgN3ehjLrjvo0W9Mjjjye+1tvRGdqxbWWIjGTtfupST1m05yab5hKweeHvVRXp
 PkwH6v+ijrp5Pq3ov650hrhrN9eVDSDI6hgPG8b34BSmJPnY77/5ZUDZCxnvZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jzJBEh93
Subject: [Buildroot] [PATCH 2/4] package/libcurl: Reapply "libcurl: add host
 variant"
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGliY3VybCBob3N0IGJ1aWxkIHN1cHBvcnQgaGFzIGluaXRpYWxseSBiZWVuIGFkZGVkIHdpdGgg
NzM2ZTBmYzVkNjEwCigibGliY3VybDogYWRkIGhvc3QgdmFyaWFudCIpIHdoaWxlIGFkZGluZyBz
dXBwb3J0IGZvciBob3N0LWNhcmdvIGJ1aWxkLAphbmQgcmV2ZXJ0ZWQgd2l0aCA2OWU4NDAwOGFi
ZjggKCJSZXZlcnQgImxpYmN1cmw6IGFkZCBob3N0IHZhcmlhbnQiIikKd2hlbiBzdGFuZGFsb25l
IGNhcmdvIGJ1aWxkIGhhcyBiZWVuIHJlbW92ZWQuIEluIG9yZGVyIHRvIGJyaW5nIGEgbmV3Cmhv
c3QgcGFja2FnZSBkZXBlbmRpbmcgb24gbGliY3VybCwgcmUtZW5hYmxlIGhvc3QtbGliY3VybCBi
dWlsZCBzdXBwb3J0LgoKVGhpcyByZXZlcnRzIGNvbW1pdCB3OWU4NDAwOGFiZjg3ZWFlZWIzZjJk
NTNjODgwY2YzMzQ5MmEzYmY4LgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4
aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL2xpYmN1cmwvbGliY3VybC5tayB8
IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsgYi9wYWNrYWdlL2xpYmN1cmwvbGli
Y3VybC5tawppbmRleCAxY2ZkZGEyN2QyMTU3NzVjYjgwMjE5NzliYzk1NWMzMGFlNGZlYTRjLi43
MDBjMTYxYWRlNmNmYjlkODc3MjdkMDNkZTlkZmNlYjk3Y2ZiN2NmIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2xpYmN1cmwvbGliY3VybC5taworKysgYi9wYWNrYWdlL2xpYmN1cmwvbGliY3VybC5tawpA
QCAtMTg5LDQgKzE4OSwxNyBAQCBlbmRlZgogTElCQ1VSTF9QT1NUX0lOU1RBTExfVEFSR0VUX0hP
T0tTICs9IExJQkNVUkxfVEFSR0VUX0NMRUFOVVAKIGVuZGlmCiAKK0hPU1RfTElCQ1VSTF9ERVBF
TkRFTkNJRVMgPSBob3N0LW9wZW5zc2wKK0hPU1RfTElCQ1VSTF9DT05GX09QVFMgPSBcCisJLS1k
aXNhYmxlLW1hbnVhbCBcCisJLS1kaXNhYmxlLW50bG0td2IgXAorCS0tZGlzYWJsZS1jdXJsZGVi
dWcgXAorCS0td2l0aC1zc2wgXAorCS0td2l0aG91dC1nbnV0bHMgXAorCS0td2l0aG91dC1tYmVk
dGxzIFwKKwktLXdpdGhvdXQtbnNzCisKK0hPU1RfTElCQ1VSTF9QT1NUX1BBVENIX0hPT0tTICs9
IExJQkNVUkxfRklYX0RPVF9QQworCiAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCiskKGV2
YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkKCi0tIAoyLjUwLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
