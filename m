Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D053C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 16:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C56684AD6;
	Fri,  7 Feb 2025 16:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABAcMb4Pl9St; Fri,  7 Feb 2025 16:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 248B684AA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 248B684AA9;
	Fri,  7 Feb 2025 16:26:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 845C9CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E6F429C9
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLdMLdILblFD for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 16:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.251.118;
 helo=19.mo581.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF2F1429C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF2F1429C3
Received: from 19.mo581.mail-out.ovh.net (19.mo581.mail-out.ovh.net
 [178.33.251.118])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF2F1429C3
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:26:52 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.139.54])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4YqJKn0VpDz1QqW
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:45 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-77ppr (unknown [10.110.168.229])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B97131FDE8;
 Fri,  7 Feb 2025 15:48:44 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-77ppr with ESMTPSA
 id fwALCVwrpmdVAyMA54ZK/A:T2
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 07 Feb 2025 15:48:44 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 07 Feb 2025 16:48:34 +0100
MIME-Version: 1.0
Message-Id: <20250207-nxp-mwifiex-fix-v1-1-6d0e9a7a7892@armadeus.com>
References: <20250207-nxp-mwifiex-fix-v1-0-6d0e9a7a7892@armadeus.com>
In-Reply-To: <20250207-nxp-mwifiex-fix-v1-0-6d0e9a7a7892@armadeus.com>
To: buildroot@buildroot.org
Cc: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 3124372243904654315
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfelvdefjeeivefhuefhledtjeduieevvefhffehjefgudetfedufeeuhedvudenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=hd5R5j+k2FzDEMTqyYL7B9sbUrFhsOuYm+u/rGs5NNE=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738943325; v=1;
 b=kLwJdQvgQo6V1g8IFGeBqYvnfkLLuDgzMmMFRAoWMfcfY6R3iYoaE8xNXAE9Y5Zz91dqwQit
 PRIv8P+RCONZcBnV1waslFR8O/qXxwBA9iCwAW9YpBREF1oxW8NRXet+ONeJq1/85M9AldyAyHR
 IpC/npGG+7zz6zrqgxuKoIY/qxbqpB064upikRltB9glp1veOnpmr0M9z5O3F6qW+/pTdkP7Ves
 jwPOm6YBKWK2i6UY6vm6PEOgBmBpkNr2Y2rif3AyIAtuH1zHwQlvp61aOibS5pjNhII4U7YYkU3
 1Wddb4z6rLug2nqMCAE1XJfzoUWdCNzV0hPvGoS+62jog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=kLwJdQvg
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007a9becc51-a803-4c2d-b675-5a9e4f02cf13,
 7D5C4D31AAFF8108D9FE7567D41352C5D36F9163)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: fix build failure on
 s390x
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

czM5MHggZG9lc24ndCBzdXBwb3J0IFdpLUZpIG9uIExpbnV4IHNvIGxldCdzIGRpc2FibGUgdGhl
IHBhY2thZ2UgZm9yIHN1Y2gKYXJjaGl0ZWN0dXJlLgoKRml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy80NGFlZjlkNzQ4NTdkOTNkOTBjZWZiMWQ1OTExMGU4NTdm
ZjRkZmFmCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6
eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS9ueHAtbXdpZmlleC9Db25maWcuaW4g
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbnhwLW13aWZpZXgvQ29uZmlnLmluIGIvcGFja2FnZS9ueHAtbXdpZmlleC9Db25maWcuaW4K
aW5kZXggNzM5OTcwNWIyODdlODFiNWY2MTE0MzlmMDllNzVjMDEyOWM3MDE4Ni4uN2Q1NWExY2My
MWE2NDMzMjJlNmVlZTNmNjlmMzg1ODg4ZTJjMzk4ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9ueHAt
bXdpZmlleC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9ueHAtbXdpZmlleC9Db25maWcuaW4KQEAg
LTEsNSArMSw2IEBACiBjb25maWcgQlIyX1BBQ0tBR0VfTlhQX01XSUZJRVgKIAlib29sICJueHAt
bXdpZmlleCIKKwlkZXBlbmRzIG9uICFCUjJfczM5MHgKIAlkZXBlbmRzIG9uIEJSMl9MSU5VWF9L
RVJORUwKIAloZWxwCiAJICBMaW51eCBrZXJuZWwgZHJpdmVyIGZyb20gTlhQIGZvciBXaUZpIGNo
aXBzZXRzCgotLSAKMi40NS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
