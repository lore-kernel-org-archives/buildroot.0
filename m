Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8C8C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1822A60775;
	Sun, 18 May 2025 08:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPKMVNLS51Xs; Sun, 18 May 2025 08:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E94A660D5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E94A660D5E;
	Sun, 18 May 2025 08:57:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D73F7204
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD3BE40FDE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DezlRwyBByL4 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF335400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF335400C6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF335400C6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 022E3432FA;
 Sun, 18 May 2025 08:57:24 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:56:53 +0200
Message-ID: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefgeehkeevteetvdfhvddvkeeiuefgtdfhgfelueekfeelieeiteffhfetfeeugfenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrrghphhgrvghlrdhmvghlohhtthgvsehmihhnugdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r9iB47kqjjEW4aS+cwiIy82z0s7BlPIbI4WCapDtx9I=;
 b=S5h6mYt6ksye0gqrlALkefxfX9Fh4hh5sX/4s+kyzmmI33FSgsC5q5p9Uf7PlZH7YXN8Kb
 uBudOm53XdrOLoJivoZfnQmgpNmQtU8fTAbAYnY1N7LA/BQ4K1z5+muk6H4AIN3Cin8ROj
 sovMpb+Z+Wrw2Wkt+7VlTFpR+nn87zEQbCZ6A9GM1PYS8fA5Seoq+9cfEdot+B+FtkmoYM
 SckzfdG36HrRcNK4ZHh6+hp19A9u9yCREZ7Bj9Cd4qi9Cf17iyYPLRRxNaZeHoGwHzFEks
 otBl/fAJ58VL217R31vXpdIIAHpgXrxaJAOEpMQyAnWiA6d3goP87u+meYlPCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S5h6mYt6
Subject: [Buildroot] [PATCH 00/22] CVE updates
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpGb2xsb3dpbmcgdGhlIGFkZGl0aW9uIG9mIHN0YWxlIGlnbm9yZSBDVkUgZW50cnkg
ZGV0ZWN0aW9uIGluCnBrZy1zdGF0cyAodGhhbmtzIHRvIGdyZWF0IHdvcmsgZnJvbSBSYXBoYcOr
bCBNw6lsb3R0ZSksIEkgbG9va2VkIGF0IHRoZQpzdGFsZSBlbnRyaWVzIGFuZCBoYW5kbGVkIGFs
bCBvZiB0aGVtIGluIHRoaXMgcGF0Y2ggc2VyaWVzLgoKV2hpbGUgYXQgaXQsIEkgcmVwb3J0ZWQg
c29tZSBpc3N1ZXMgdG8gdGhlIE5WRCBtYWludGFpbmVycyAoZS1tYWlscwp3ZXJlIENjJ2VkIHRv
IHRoZSBtYWlsaW5nIGxpc3QpLiBJIGFsc28gZm91bmQgYSBudW1iZXIgb2YgQ1ZFcyBvbiBzb3gK
dGhhdCB3ZXJlIG5vdCBmaXhlZCwgc28gSSBmaXhlZCB0aGVtIChleGNlcHQgQ1ZFLTIwMjEtMzM4
NDQsIGZvciB3aGljaAp0aGUgZml4IGRvZXNuJ3QgYXBwbHkgdG8gb3VyIHZlcnNpb24gYW5kIGl0
IGlzbid0IGNsZWFyIGlmIG91ciB2ZXJzaW9uCmlzIHJlYWxseSB2dWxuZXJhYmxlKS4KClBsZWFz
ZSBoYXZlIGEgbG9vayBhbmQgbGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuIFBhdGNoZXMgYXJl
CmluZGVwZW5kZW50IGZyb20gZWFjaCBvdGhlciwgZXhjZXB0IG9mIGNvdXJzZSB0aGUgbGFyZ2Ug
c3RhY2sgb2YKcGF0Y2hlcyBvbiB0aGUgc294IHBhY2thZ2UuCgpUaG9tYXMKClRob21hcyBQZXRh
enpvbmkgKDIyKToKICBib290L2dydWIyOiBkcm9wIHN0YWxlIElHTk9SRV9DVkVTIGVudHJpZXMK
ICBwYWNrYWdlL2J1c3lib3g6IGRyb3Agc3RhbGUgSUdOT1JFX0NWRVMgZW50cmllcwogIHBhY2th
Z2UvZG5zbWFzcTogZHJvcCBzdGFsZSBJR05PUkVfQ1ZFUyBlbnRyaWVzCiAgcGFja2FnZS9kb3Zl
Y290OiBkb2N1bWVudCB3aHkgdGhlIGlnbm9yZSBDVkUgZW50cnkgaXMgbm90IHN0YWxlCiAgcGFj
a2FnZS9leGltOiBkcm9wIHN0YWxlIGlnbm9yZSBDVkUgZW50cnkKICBwYWNrYWdlL2V4aW06IHVw
ZGF0ZSBjb21tZW50IG9uIENWRS0yMDIyLTM1NTkKICBwYWNrYWdlL2xpYm9wZW5oMjY0OiBkcm9w
IHN0YWxlIGlnbm9yZSBDVkUgZW50cnkKICBwYWNrYWdlL2xpYnNzaDogZHJvcCBzdGFsZSBpZ25v
cmUgQ1ZFIGVudHJ5CiAgcGFja2FnZS9uZXRzbm1wOiBkcm9wIHN0YWxlIGlnbm9yZSBDVkUgZW50
cmllcwogIHBhY2thZ2UvcXQ1L3F0NWJhc2U6IGRyb3Agc3RhbGUgaWdub3JlIENWRSBlbnRyaWVz
LCBhZGQgQ1BFIHZlcnNpb24KICBwYWNrYWdlL3JpcGdyZXA6IGRyb3Agc3RhbGUgaWdub3JlIENW
RSBlbnRyeQogIHBhY2thZ2Uvc294OiBhZGQgU09YX0NQRV9JRF9WRVJTSU9OCiAgcGFja2FnZS9z
b3g6IGFubm90YXRlIGlnbm9yZSBDVkUgZW50cmllcwogIHBhY2thZ2Uvc294OiBhZGQgaWdub3Jl
IENWRSBlbnRyeSBmb3IgQ1ZFLTIwMTktMTAxMDAwNAogIHBhY2thZ2Uvc294OiByZXdvcmsgdGhl
IDAwMDEgcGF0Y2ggdG8gbWFrZSBpdCBHaXQtYXBwbGljYWJsZQogIHBhY2thZ2Uvc294OiBhZGQg
Zml4IGZvciBDVkUtMjAyMS0zNjQzIENWRS0yMDIxLTIzMjEwCiAgcGFja2FnZS9zb3g6IGFkZCBm
aXggZm9yIENWRS0yMDIxLTIzMTU5LCBDVkUtMjAyMS0yMzE3MiwKICAgIENWRS0yMDIzLTM0MzE4
CiAgcGFja2FnZS9zb3g6IGFkZCBmaXggZm9yIENWRS0yMDIxLTQwNDI2CiAgcGFja2FnZS9zb3g6
IGFkZCBmaXggZm9yIENWRS0yMDIyLTMxNjUwLCBDVkUtMjAyMy0yNjU5MAogIHBhY2thZ2Uvc294
OiBhZGQgZml4IGZvciBDVkUtMjAyMi0zMTY1MQogIHBhY2thZ2Uvc294OiBhZGQgZml4IGZvciBD
VkUtMjAyMy0zMjYyNwogIHBhY2thZ2UvdGlueXhtbDogc2V0IFRJTllYTUxfQ1BFX0lEX1ZFUlNJ
T04KCiBib290L2dydWIyL2dydWIyLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCAt
LQogcGFja2FnZS9idXN5Ym94L2J1c3lib3gubWsgICAgICAgICAgICAgICAgICAgIHwgMTAgLS0t
CiBwYWNrYWdlL2Ruc21hc3EvZG5zbWFzcS5tayAgICAgICAgICAgICAgICAgICAgfCAgMyAtCiBw
YWNrYWdlL2RvdmVjb3QvZG92ZWNvdC5tayAgICAgICAgICAgICAgICAgICAgfCAgNCArCiBwYWNr
YWdlL2V4aW0vZXhpbS5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQogcGFja2Fn
ZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5tayAgICAgICAgICAgIHwgIDMgLQogcGFja2FnZS9s
aWJzc2gvbGlic3NoLm1rICAgICAgICAgICAgICAgICAgICAgIHwgIDQgLQogcGFja2FnZS9uZXRz
bm1wL25ldHNubXAubWsgICAgICAgICAgICAgICAgICAgIHwgIDQgLQogcGFja2FnZS9xdDUvcXQ1
YmFzZS9xdDViYXNlLm1rICAgICAgICAgICAgICAgIHwgMTEgKy0tCiBwYWNrYWdlL3JpcGdyZXAv
cmlwZ3JlcC5tayAgICAgICAgICAgICAgICAgICAgfCAgMyAtCiAuLi4tU29YLXN1cHBvcnQtdWNs
aWJjLWJhc2VkLXRvb2xjaGFpbnMucGF0Y2ggfCAgOSArLS0KIC4uLmhvdWxkLW5ldmVyLWJlLTAt
dG8tYXZvaWQtZGl2aXNpb24tYi5wYXRjaCB8IDM0ICsrKysrKysrKwogcGFja2FnZS9zb3gvMDAw
Ny1oY29tLXZhbGlkYXRlLWRpY3RzaXplLnBhdGNoIHwgMzggKysrKysrKysrKwogLi4uLzAwMDgt
cGhlcmUtYXZvaWQtaW50ZWdlci11bmRlcmZsb3cucGF0Y2ggIHwgNDIgKysrKysrKysrKysKIC4u
LmVjdC1pbXBsYXVzaWJseS1sYXJnZS1udW1iZXItb2YtY2hhbi5wYXRjaCB8IDYzICsrKysrKysr
KysrKysrKysKIC4uLjAwMTAtZm9ybWF0cy1yZWplY3QtaW1wbGF1c2libGUtcmF0ZS5wYXRjaCB8
IDM5ICsrKysrKysrKysKIC4uLmlsdGVyLW51bGwtc2FtcGxpbmctcmF0ZS1pbi1WT0MtY29kZS5w
YXRjaCB8IDM3ICsrKysrKysrKwogcGFja2FnZS9zb3gvc294Lm1rICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNzUgKysrKysrKysrKysrKysrKysrLQogcGFja2FnZS90aW55eG1sL3Rpbnl4
bWwubWsgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDE5IGZpbGVzIGNoYW5nZWQsIDMzNyBp
bnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3NveC8wMDA2LXZvYy13b3JkLXdpZHRoLXNob3VsZC1uZXZlci1iZS0wLXRvLWF2b2lkLWRpdmlz
aW9uLWIucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NveC8wMDA3LWhjb20tdmFs
aWRhdGUtZGljdHNpemUucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NveC8wMDA4
LXBoZXJlLWF2b2lkLWludGVnZXItdW5kZXJmbG93LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9zb3gvMDAwOS1mb3JtYXRzLWFpZmYtcmVqZWN0LWltcGxhdXNpYmx5LWxhcmdlLW51
bWJlci1vZi1jaGFuLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zb3gvMDAxMC1m
b3JtYXRzLXJlamVjdC1pbXBsYXVzaWJsZS1yYXRlLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9zb3gvMDAxMS1DVkUtMjAyMy0zMjYyNy1GaWx0ZXItbnVsbC1zYW1wbGluZy1yYXRl
LWluLVZPQy1jb2RlLnBhdGNoCgotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
