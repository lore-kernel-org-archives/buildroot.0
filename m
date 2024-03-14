Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC336C54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 16:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9372F4009F;
	Thu, 14 Mar 2024 16:33:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z31zUc5ySUME; Thu, 14 Mar 2024 16:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64BB3400BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64BB3400BA;
	Thu, 14 Mar 2024 16:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4613B1BF3BD
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 16:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F320417B5
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 16:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKL5_krBAuBP for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 16:33:44 +0000 (UTC)
X-Greylist: delayed 601 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 14 Mar 2024 16:33:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD3B24011F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD3B24011F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.41.146;
 helo=1.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net
 [46.105.41.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD3B24011F
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 16:33:43 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.140.28])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4TwXZ33qWTz1K0C
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 16:16:27 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-b2v6c (unknown [10.111.182.122])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2EFE61FEA7;
 Thu, 14 Mar 2024 16:16:27 +0000 (UTC)
Received: from armadeus.com ([37.59.142.99])
 by ghost-submission-6684bf9d7b-b2v6c with ESMTPSA
 id ziV4Bdsi82VFDgEA60DLjw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Thu, 14 Mar 2024 16:16:27 +0000
X-OVh-ClientIp: 92.140.169.135
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 17:16:20 +0100
Message-ID: <20240314161620.5779-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2511601217428319211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeejgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepveefkeffhedtkefgjeejudetleelffejleektdegudejkeekjedtgedufefffefgnecuffhomhgrihhnpehhrghrthifohhrkhdrohhrghdpghhithhhuhgsrdgtohhmpdhsohhurhgtvghfohhrghgvrdhnvghtnecukfhppeduvdejrddtrddtrddupdelvddrudegtddrudeiledrudefhedpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038ad05ffc-75b3-48fa-971f-a23d2c47b0f2,
 2F466AE43E0B538CCB0794578D49CED9E992BEED)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.6.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2VjdXJpdHkgZml4ZXM6CgktIENWRS0yMDI0LTI4NzU3IC0tIFByZXZlbnQgYmlsbGlvbiBsYXVn
aHMgYXR0YWNrcyB3aXRoIGlzb2xhdGVkCgkgIHVzZSBvZiBleHRlcm5hbCBwYXJzZXJzLiAgUGxl
YXNlIHNlZSB0aGUgY29tbWl0IG1lc3NhZ2Ugb2YKCSAgY29tbWl0IDFkNTBiODBjZjMxZGU4Nzc1
MDEwMzY1NmY2ZWI2OTM3NDY4NTRhYTggZm9yIGRldGFpbHMuCgpodHRwczovL2Jsb2cuaGFydHdv
cmsub3JnL3Bvc3RzL2V4cGF0LTItNi0yLXJlbGVhc2VkLwpodHRwczovL2dpdGh1Yi5jb20vbGli
ZXhwYXQvbGliZXhwYXQvYmxvYi9SXzJfNl8yL2V4cGF0L0NoYW5nZXMKClNpZ25lZC1vZmYtYnk6
IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4K
LS0tCiBwYWNrYWdlL2V4cGF0L2V4cGF0Lmhhc2ggfCA4ICsrKystLS0tCiBwYWNrYWdlL2V4cGF0
L2V4cGF0Lm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lmhhc2ggYi9wYWNr
YWdlL2V4cGF0L2V4cGF0Lmhhc2gKaW5kZXggOTgwYTlhYjZhNzlkLi42Mzg5MGI1NGRmMjkgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvZXhwYXQvZXhwYXQuaGFzaAorKysgYi9wYWNrYWdlL2V4cGF0L2V4
cGF0Lmhhc2gKQEAgLTEsNyArMSw3IEBACi0jIEZyb20gaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQv
cHJvamVjdHMvZXhwYXQvZmlsZXMvZXhwYXQvMi42LjEvCi1tZDUgIDg0ZDBlZTFjNTU0MjEyZGM4
ZjA2OGU1MzhkZTViODIzICBleHBhdC0yLjYuMS50YXIueHoKLXNoYTEgIDFhMTgwNGI3YzU2NWE4
YjIxYWJiZDM0MzNlZjY3ZWQ4YTQ0NzY5NjAgIGV4cGF0LTIuNi4xLnRhci54egorIyBGcm9tIGh0
dHBzOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3RzL2V4cGF0L2ZpbGVzL2V4cGF0LzIuNi4yLwor
bWQ1ICAwY2I3NWM4ZmViODQyYzA3OTRiYTg5NjY2Yjc2MmEyZCAgZXhwYXQtMi42LjEudGFyLnh6
CitzaGExICBkOWU1Zjk1M2RjYWNkYTNjOWU2OWI0ODg2MzgyYzNkODg0N2I4MWJkICBleHBhdC0y
LjYuMS50YXIueHoKIAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgY2I1ZjVhOGVhMjEx
ZTFjYWJkNTliZTBhOTMzYTUyZTNjMDJjYzMyNmU4NmE0ZDM4N2Q4ZDIxOGU3ZWU0N2EzZSAgZXhw
YXQtMi42LjAudGFyLnh6CitzaGEyNTYgIGVlMTRiNGM1ZDg5MDhiMWJlYzM3YWQ5Mzc2MDdlYWIx
ODNkNGQ5ODA2YTA4YWRlZTQ3MmMzYzMxMjFkMjczNjQgIGV4cGF0LTIuNi4yLnRhci54egogc2hh
MjU2ICAxMjJmMmMyNzAwMDQ3MmEyMDFkMzM3YjliMzFmN2ViMmI1MmQwOTFiMDI4NTcwNjFhODg4
MDM3MTYxMmQ5NTM0ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1r
IGIvcGFja2FnZS9leHBhdC9leHBhdC5tawppbmRleCBlMDlmY2M2NzNmYTUuLmM2YjdmYzhiNDRm
MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9leHBhdC9leHBhdC5taworKysgYi9wYWNrYWdlL2V4cGF0
L2V4cGF0Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAot
RVhQQVRfVkVSU0lPTiA9IDIuNi4xCitFWFBBVF9WRVJTSU9OID0gMi42LjIKIEVYUEFUX1NJVEUg
PSBodHRwOi8vZG93bmxvYWRzLnNvdXJjZWZvcmdlLm5ldC9wcm9qZWN0L2V4cGF0L2V4cGF0LyQo
RVhQQVRfVkVSU0lPTikKIEVYUEFUX1NPVVJDRSA9IGV4cGF0LSQoRVhQQVRfVkVSU0lPTikudGFy
Lnh6CiBFWFBBVF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKLS0gCjIuNDMuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
