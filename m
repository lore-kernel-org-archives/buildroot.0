Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46493C3ABBF
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 11:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D029180D7E;
	Tue,  6 May 2025 11:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTOO6xGMd68f; Tue,  6 May 2025 11:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1B5E80C5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1B5E80C5B;
	Tue,  6 May 2025 11:36:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C19D5
 for <buildroot@buildroot.org>; Tue,  6 May 2025 11:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0804E6067E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 11:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfObG3ewUVRU for <buildroot@buildroot.org>;
 Tue,  6 May 2025 11:36:35 +0000 (UTC)
X-Greylist: delayed 7801 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 May 2025 11:36:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B17CA60A9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B17CA60A9D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.57.91;
 helo=1.mo583.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 1.mo583.mail-out.ovh.net (1.mo583.mail-out.ovh.net
 [188.165.57.91])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B17CA60A9D
 for <buildroot@buildroot.org>; Tue,  6 May 2025 11:36:34 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.176.198])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZsCL34tw6z1WmZ
 for <buildroot@buildroot.org>; Tue,  6 May 2025 09:10:51 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hvfz4 (unknown [10.110.168.221])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5A7FC1FEB2;
 Tue,  6 May 2025 09:10:51 +0000 (UTC)
Received: from armadeus.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-hvfz4 with ESMTPSA
 id tXJvGRrSGWjOQgAADTKBBw:T3
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 06 May 2025 09:10:51 +0000
X-OVh-ClientIp: 90.11.248.239
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 06 May 2025 11:10:32 +0200
MIME-Version: 1.0
Message-Id: <20250506-bump-imx-packages-lf-6-12-v1-2-56ee2884287a@armadeus.com>
References: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
In-Reply-To: <20250506-bump-imx-packages-lf-6-12-v1-0-56ee2884287a@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15139694573487385568
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiudefueehuefgkeelheefjeejgfefvdeuuddtffekvefhtdelgfehheffheeggfenucfkphepuddvjedrtddrtddruddpledtrdduuddrvdegkedrvdefledpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=nGbkn2+fddDY7wd+Nc5k2jsl0sWbS8476otZNQuf0X0=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1746522651; v=1;
 b=oXKn47oYzgMj8ndzq5e+Z0+auKJw3w4gycTKrDc9IxwzLdnTlqt660CKRp22AGTKkfzvaMDx
 xTxRFlDueqDvBXE6rP5ZCfO871UztC1d3RlCWsAu650D0guJPbPF7sS90RG9rz1eBDYIFaegojr
 rMC4ynyBM86/C4wlckaeV6gqOHUUlWyRM+FFgU+GkQ8iR1gUTYBe5Rj2wwiaZ7pp+IBuZbglVBq
 jyhg1avTIDKjc1zsGIIAdV9FOZ3c+PpckjlAqv8tvwJGRqnviU3f1diY4KUyzfZtFrdlgs7SABD
 W3QH9yq+WOvauTMdKHejwY7jlf+eG39hqN8w2frX9XGIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=oXKn47oY
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004688b3c33-b8f6-4260-8550-5b29455ffc19,
 89164E2DADC3E9651536EDF06570BAAA20166E3F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 2/7] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.11.p3.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB2ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gImxmLTYu
MTIuMy0xLjAuMCIuCgpMaWNlbnNlIGhhc2hlcyBjaGFuZ2VkIGJlY2F1c2UgdGhlIExBX09QVF9O
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY1NyBKdWx5IDIwMjQiIHRvICJ2NTgg
Tm92ZW1iZXIgMjAyNCIuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14
L2lteC1ncHUtZzJkL2lteC1ncHUtZzJkLmhhc2ggfCA4ICsrKystLS0tCiBwYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsgICB8IDYgKysrLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQuaGFzaCBiL3BhY2th
Z2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5oYXNoCmluZGV4IGYwNDBl
MDBmNjgwZmJhYTNmMDkzNjUzNmZlNWQ5YTQ5YzliZjViYjYuLjRiZDgzMDkwYThkZDEzMmE1Yjg5
Zjc3MDY3NjA0ZDc5MjM0NTQyMmUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5oYXNoCkBAIC0xLDYgKzEsNiBAQAogIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKLXNoYTI1NiAgNzgwNDc5ZjE5MTQyMTI2ZWQ1OGUxMjIyMmI4MGY4ZjNiODgyYWQz
ZDIyM2ZmNjFiN2VhMDIwMDFmNTE3ZmYwMyAgaW14LWdwdS1nMmQtNi40LjExLnAyLjEwLWFhcmNo
NjQtYWNjZGQ2NC5iaW4KLXNoYTI1NiAgY2Q0ZmQwNWRkNmY2ODgwZWRjMzI1NWM4NWZlMDgwOTRh
MDdlYTRjZDNlZWU5NDdkZjAwNGRjYjhmMzdiYzhmYSAgaW14LWdwdS1nMmQtNi40LjExLnAyLjEw
LWFybS1hY2NkZDY0LmJpbgotc2hhMjU2ICA2MDFmYTc5MGM1YjRkMDM1NzliZDE4MmZiNGQ2NWE2
ZjMyOWEzMmZhZjQ5ZGIyMmY5OGU0NjA4MjIxZTg2MWY3ICBDT1BZSU5HCi1zaGEyNTYgIGMzZDlh
N2IyYTVhN2RiNWRhNjkwZTljMTA4MWI5OGI2NjU4MDJjM2VmYmJiYTdmYjIzNzMzOTM5NWE5MmY2
MDcgIEVVTEEKK3NoYTI1NiAgZTZjMzM2YzBiODc2ZWZhYjc1OThhMmQ3ODE3MTExNzcyMjg0NDg3
ZjY0NmQ1ZDgzYzQwMDY5MmYyY2RmZWJlMyAgaW14LWdwdS1nMmQtNi40LjExLnAzLjAtYWFyY2g2
NC1jNjAwZDAzLmJpbgorc2hhMjU2ICA2ZTFhNDJmMmM1NzA1ODJiODAzOGQxYjVjODZkYmRjZDY0
NWU3NWNjMTBhMWRiMjNlNzE2ZjY2MmQxYzEzMjlmICBpbXgtZ3B1LWcyZC02LjQuMTEucDMuMC1h
cm0tYzYwMGQwMy5iaW4KK3NoYTI1NiAgM2Y0YTEyYzgyYTg0YmQxYzM1NzhjOWM5ODZkNjM3MWE2
MWQzMzk5NTI1ZTc2Mjg4ZWNiYmFlMDFkYWYwYWUyNiAgQ09QWUlORworc2hhMjU2ICAzOGYxNDA4
ZDZlOTM1YzU2NGVmZDkxMTljMzEzMjY5ZTY0M2MxYTg1Y2FiMWQ5MzBjM2M1YmQ3MGJjMjYxNzY5
ICBFVUxBCiBzaGEyNTYgIDNmM2I4MTdjYTk0OTBmYmU4OWE4MzM5NWEwOTYxMTIyYWNhMTM4YmY0
M2FjZDg2OWM2Y2EwODY1MDJhMWUxMzEgIFNDUi1pbXgtZ3B1LWcyZC50eHQKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5tayBiL3BhY2th
Z2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5tawppbmRleCAzZDY3ZDIy
ZjY3ZjU4ZGRhZDgzZjNiMThjNjA0OWNhYTE0NDdkYTE4Li40ZDI5OTc0ZGIxNmU5NzZmMGNkNTBj
NmNiZTQ5NGM3YmQ3MjNjYmU1IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14
LWdwdS1nMmQvaW14LWdwdS1nMmQubWsKKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1n
cHUtZzJkL2lteC1ncHUtZzJkLm1rCkBAIC00LDExICs0LDExIEBACiAjCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwogCi1JTVhfR1BVX0cyRF9SRVZJU0lPTiA9IGFjY2RkNjQKK0lNWF9HUFVfRzJE
X1JFVklTSU9OID0gYzYwMGQwMwogaWZlcSAoJChCUjJfYWFyY2g2NCkseSkKLUlNWF9HUFVfRzJE
X1ZFUlNJT04gPSA2LjQuMTEucDIuMTAtYWFyY2g2NAorSU1YX0dQVV9HMkRfVkVSU0lPTiA9IDYu
NC4xMS5wMy4wLWFhcmNoNjQKIGVsc2UKLUlNWF9HUFVfRzJEX1ZFUlNJT04gPSA2LjQuMTEucDIu
MTAtYXJtCitJTVhfR1BVX0cyRF9WRVJTSU9OID0gNi40LjExLnAzLjAtYXJtCiBlbmRpZgogSU1Y
X0dQVV9HMkRfU0lURSA9ICQoRlJFRVNDQUxFX0lNWF9TSVRFKQogSU1YX0dQVV9HMkRfU09VUkNF
ID0gaW14LWdwdS1nMmQtJChJTVhfR1BVX0cyRF9WRVJTSU9OKS0kKElNWF9HUFVfRzJEX1JFVklT
SU9OKS5iaW4KCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
