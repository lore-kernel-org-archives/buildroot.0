Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6311AC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 15:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E1C381289;
	Fri,  7 Feb 2025 15:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dt_boK8UeP6y; Fri,  7 Feb 2025 15:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E6F80BD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E6F80BD1;
	Fri,  7 Feb 2025 15:48:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 921FCCF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F4DB6073E
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgGcAgdJK3jN for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 15:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.43.173;
 helo=6.mo561.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0528C60877
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0528C60877
Received: from 6.mo561.mail-out.ovh.net (6.mo561.mail-out.ovh.net
 [188.165.43.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0528C60877
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:47 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.176.110])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4YqJKm4zkNz1K8C
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:48:44 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-77ppr (unknown [10.110.168.229])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4F8B51FE0D;
 Fri,  7 Feb 2025 15:48:44 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-77ppr with ESMTPSA
 id fwALCVwrpmdVAyMA54ZK/A
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 07 Feb 2025 15:48:44 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 07 Feb 2025 16:48:33 +0100
Message-Id: <20250207-nxp-mwifiex-fix-v1-0-6d0e9a7a7892@armadeus.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFErpmcC/x2MQQqAMAzAviI9W5hFi/gV8aCu0x6csoEOZH93e
 EwgeSFKUIkwVC8EuTXq6Qs0dQXrPvtNUG1hIEOdIcPo04XHo04lodOEC62We2ZrW4ZSXUGK/o/
 jlPMHB4Yd3GEAAAA=
X-Change-ID: 20250206-nxp-mwifiex-fix-b2cd6866dd46
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 3124372243876604907
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeehgfekfefhgfehgfeguedtieegveelieeuvdethfdtfedttdfhvdeukeegudejieenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=lfiBapo/C4wuTn78h8lI4lThcl1Dwe+fu/M+CxxrVcE=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738943324; v=1;
 b=F47ew84nTlmRwqElCre8Ad7zibR0PoPf0WT0Ol+RfmHnmQJ3CRAzpdSOq2NgEROdpHFbpRGn
 wCCcJ3zdlPnEOuIm3AFU8gjXSk4ihtjR0Imw5duhWkTM4/pFrD2Yw/kD9avn94nQsQeB4oJWQUH
 bNLbEHkIdCYu80CQ/qZct4Y0/pjl8sXc4bDVzy2hnpcyW3meF46fcVvQ/Zwzj/FGTxHFqHRUE76
 goHsS1Cb7Qo/tyHcgkO6XkH1GgbMmT0gzi+Bz5k37Ue0/cuyL+qt8RVZejAPJ3I/kgJ1VZdtpvd
 4iwTViYsrRd032sIbHXAnwLvrLFkKfDBW5zzQZwIYp6yA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=F47ew84n
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007882956fc-7e33-4805-b9de-a563460e2b33,
 7D5C4D31AAFF8108D9FE7567D41352C5D36F9163)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 0/2] package/nxp-mwifiex: fix build failures
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

VGhpcyBzZXJpZXMgZml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlcyBmb3VuZCBieSBh
dXRvYnVpbGQ6CgpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYzY3OWI3
OTNkMGI4MWU3NTY5ODkzYTAzZjk1YjJlMGI4YzgzZTI2OApodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvNDRhZWY5ZDc0ODU3ZDkzZDkwY2VmYjFkNTkxMTBlODU3ZmY0ZGZh
ZgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5z
a2lAYXJtYWRldXMuY29tPgotLS0KU8OpYmFzdGllbiBTenltYW5za2kgKDIpOgogICAgICBwYWNr
YWdlL254cC1td2lmaWV4OiBmaXggYnVpbGQgZmFpbHVyZSBvbiBzMzkweAogICAgICBwYWNrYWdl
L254cC1td2lmaWV4OiBmaXggYnVpbGQgZmFpbHVyZSBkdWUgdG8gbWlzc2luZyBMaW51eCBvcHRp
b25zCgogcGFja2FnZS9ueHAtbXdpZmlleC9Db25maWcuaW4gICAgICB8ICAxICsKIHBhY2thZ2Uv
bnhwLW13aWZpZXgvbnhwLW13aWZpZXgubWsgfCAxMCArKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiAyNjdhNmZlNDRmMmRjOWQxNTY1
NTY2OTc2ZDUzMGU5ZDAxNzU2YmUxCmNoYW5nZS1pZDogMjAyNTAyMDYtbnhwLW13aWZpZXgtZml4
LWIyY2Q2ODY2ZGQ0NgoKQmVzdCByZWdhcmRzLAotLSAKU8OpYmFzdGllbiBTenltYW5za2kgPHNl
YmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
