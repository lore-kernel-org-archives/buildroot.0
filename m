Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2196C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 13:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B20D40994;
	Thu,  8 Feb 2024 13:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xh2YUTxodNFQ; Thu,  8 Feb 2024 13:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5542940910
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5542940910;
	Thu,  8 Feb 2024 13:05:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96FDD1BF99F
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 13:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84DB240900
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 13:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mv7MKj4Llylj for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 13:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.63.121;
 helo=1.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EBF240047
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EBF240047
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net
 [46.105.63.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EBF240047
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 13:05:24 +0000 (UTC)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.25.74])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id E65C428323
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 12:55:35 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kdf48 (unknown [10.110.168.250])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 514DA1FE0D;
 Thu,  8 Feb 2024 12:55:35 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
 by ghost-submission-6684bf9d7b-kdf48 with ESMTPSA
 id h+h4EEfPxGWDugAAre/mpQ
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 08 Feb 2024 12:55:35 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 13:54:20 +0100
Message-ID: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 14935906691734367211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrtdeggdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepvddttddvffdvteekieejheffhfdvhefhjeeltdeluedvuddviefhjefhtdegtdelnecuffhomhgrihhnpeguvghngidruggvnecukfhppeduvdejrddtrddtrddupdelvddrudegkedrvdehfedrvdegfedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00620122513-853a-456a-8a5f-4ae70c9a4389,
 EE170601DD7FCE57948E905AF537FA7E68A97F37)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v5 0/3] i.MX91 and i.MX93 support
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYWRkcyBpLk1YOTEsIGkuTVg5MyBhbmQgaS5NWDkzIDExeDExIEVWSyB0byBC
dWlsZHJvb3QuCgotLS0KQ2hhbmdlcyBmb3IgdjU6Ci0gZm9sbG93IEJSIGNvZGluZyBzdHlsZSBm
b3IgdGhlIGdlbmltYWdlLmNmZy50ZW1wbGF0ZV9pbXg5IGZpbGUKICAoR2l1bGlvIEJlbmV0dGkp
CgpDaGFuZ2VzIGZvciB2NDoKIC0gImkuTVggcGxhdGZvcm0gYXNpYyB2ZXJzaW9uIiAtPiAiaS5N
WCBTaWxpY29uIFJldmlzaW9uIiAoR2FyeSBCaXNzb24pCiAtIG1vdmUgaS5NWCBTaWxpY29uIFJl
dmlzaW9uIGNoYW5nZXMgaW50byBmaXJzdCBwYXRjaCAoR2FyeSBCaXNzb24pCiAtIEJSMl9QQUNL
QUdFX0ZJUk1XQVJFX0lNWF9ERFJfVkVSU0lPTiBkZWZhdWx0IHRvICJ2MjAyMjAxIiBpbnN0ZWFk
IG9mCiAgIGp1c3QgIjIwMjIwMSIgKEdhcnkgQmlzc29uKQogLSBDb3B5IGFsbCBERFIgZmlsZXMg
dG8gJChCSU5BUklFU19ESVIpIGFzIFUtQm9vdCBjYW4gbm93IGNyZWF0ZSBhCiAgIGJvb3RhYmxl
IGltYWdlOgogICBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9jb21taXQv
ZjYzN2RmZThjNDY4MjI5YzlmYjMxM2QxM2M0NmQ1MWNkYmI4ODgyNAogLSByZW1vdmUgInBtdV90
cmFpbiIgZnJvbSBnZW5lcmF0ZWQgX3BhZCBiaW5hcnkgZmlsZSBuYW1lcwoKQ2hhbmdlcyBmb3Ig
djM6CiAtIHJlbmFtZSBwYWNrYWdlIGZpcm13YXJlLXNlbnRpbmVsIHRvIGZpcm13YXJlLWVsZS1p
bXgKIC0gYWRkIGEgbm90ZSBhYm91dCB0aGUgZGVidWcgVUFSVCBpbiB0aGUgcmVhZG1lLnR4dCBm
aWxlIChKdWxpZW4gT2xpdmFpbikKIC0gYWRkIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNT
TD15IGFuZAogICBCUjJfVEFSR0VUX1VCT09UX05FRURTX0dOVVRMUz15IHRvIHRoZSBkZWZjb25m
aWcgZmlsZSAoSnVsaWVuIE9saXZhaW4pCiAtIGJ1bXAgQVRGLCBVLUJvb3QgYW5kIExpbnV4IHRv
IGxhdGVzdCBOWFAgcmVsZWFzZSBsZi02LjEuNTUtMi4yLjAKICAgKEp1bGllbiBPbGl2YWluKQoK
Q2hhbmdlcyBmb3IgdjI6CiAtIHBhdGNoIDEgb2YgdjEgaGFzIGJlZW4gYXBwbGllZAogLSBtb3Zl
IFNvQyBhc2ljIHZlcnNpb24gc2VsZWN0aW9uIHRvIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9Db25m
aWcuaW4KIC0gbWlub3IgZml4ZXMgaW4gbGF0ZXN0IHBhdGNoCgotLS0KU8OpYmFzdGllbiBTenlt
YW5za2kgKDMpOgogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXg6IGFkZCBpLk1YOTEgYW5kIGku
TVg5MyBTb0Mgc3VwcG9ydAogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxl
LWlteDogbmV3IHBhY2thZ2UKICAgICAgY29uZmlncy9mcmVlc2NhbGVfaW14OTNldms6IG5ldyBk
ZWZjb25maWcKCiAuLi4vY29tbW9uL2lteC9nZW5pbWFnZS5jZmcudGVtcGxhdGVfaW14OSAgICAg
ICAgICB8IDQyICsrKysrKysrKysrKwogLi4uL2NvbW1vbi9pbXgvaW14OS1ib290bG9hZGVyLXBy
ZXBhcmUuc2ggICAgICAgICAgfCAzNCArKysrKysrKysrCiBib2FyZC9mcmVlc2NhbGUvY29tbW9u
L2lteC9wb3N0LWltYWdlLnNoICAgICAgICAgICB8ICA0ICsrCiBib2FyZC9mcmVlc2NhbGUvaW14
OTNldmsvcmVhZG1lLnR4dCAgICAgICAgICAgICAgICB8IDc3ICsrKysrKysrKysrKysrKysrKysr
KysKIGNvbmZpZ3MvZnJlZXNjYWxlX2lteDkzZXZrX2RlZmNvbmZpZyAgICAgICAgICAgICAgIHwg
MzkgKysrKysrKysrKysKIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgIHwgMzggKysrKysrKysrKysKIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2Fy
ZS1lbGUtaW14L0NvbmZpZy5pbiAgIHwgMjEgKysrKysrCiAuLi4vZmlybXdhcmUtZWxlLWlteC9m
aXJtd2FyZS1lbGUtaW14Lmhhc2ggICAgICAgICB8ICA0ICsrCiAuLi4vZmlybXdhcmUtZWxlLWlt
eC9maXJtd2FyZS1lbGUtaW14Lm1rICAgICAgICAgICB8IDI3ICsrKysrKysrCiBwYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L0NvbmZpZy5pbiAgICAgICB8ICA5ICsrKwogcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXgubWsgfCAyNSArKysrKysr
CiAxMSBmaWxlcyBjaGFuZ2VkLCAzMjAgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IGFl
NTI3NGRkNTQ1ZWIwMTFmMThjYWUyNDMzMTMwMGQ5NDRiOGJlMGYKY2hhbmdlLWlkOiAyMDI0MDEx
NS1pbXg5My1zdXBwb3J0LTE2NjcxYjViN2YxMgoKQmVzdCByZWdhcmRzLAotLSAKU8OpYmFzdGll
biBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
