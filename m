Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D219C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 583D3417A5;
	Wed,  5 Feb 2025 12:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63Hbfbi6UzMg; Wed,  5 Feb 2025 12:18:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA2254176E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA2254176E;
	Wed,  5 Feb 2025 12:18:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DA6F12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4D6760B7C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TrWMj2ojiqJu for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:18:42 +0000 (UTC)
X-Greylist: delayed 2259 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Feb 2025 12:18:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2B5760B75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B5760B75
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.172.162;
 helo=18.mo561.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 18.mo561.mail-out.ovh.net (18.mo561.mail-out.ovh.net
 [87.98.172.162])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2B5760B75
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:18:41 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.9.127])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4Ynywt13qsz1Y5p
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:02 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8564F1FED8;
 Wed,  5 Feb 2025 11:41:01 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T4
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:41:01 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:53 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-3-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5642447383934069728
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=EyIHLSW7Z16FwZu/WFsyzEeil9BHfZEreACkhA6Uap4=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755662; v=1;
 b=gsjFA2IJK4fp3uA6hAiHhNYMyw6utSnpjGuWk0RISjTqKGwOsMzDjJqE1tZsbbR7WBpdbf+b
 OGO46W1DzGxHdms1dlycAu7zZJp4s1ymE32PmCSqc7WQIjwVWVq7hUoTIIZUf1wMDxHcFiuZYcr
 gHsxnXax0lx6NsDFbcbF3jVf5Mp5DYfjnYwt3CUc/KvYL3CYGrJ7szVlcg2XcJUcIRTYvTBmXrO
 H+gvXKpsBJfAKnxanvngmkIe/A0E4nofUZqT500ijhkJnT15rVwaSA2vVeypBlxB1SJ8xRbS4Jf
 onRIWj4wv+fy0JgFqFby5hys3u2cXcERIOdXHGIQy2X3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=gsjFA2IJ
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S0070f5c55f4-01cf-48e6-a0ca-7cdce71f8ffb,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 03/11] package/freescale-imx/imx-codec: bump to
 version 4.9.0
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
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB2ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gImxmLTYu
Ni41Mi0yLjAuMCIuCgpMaWNlbnNlIGhhc2hlcyBjaGFuZ2VkIGJlY2F1c2UgdGhlIExBX09QVF9O
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY0OSBTZXB0ZW1iZXIgMjAyMyIgdG8g
InY1NiBBcHJpbCAyMDI0Ii4KQWRkIFNDUi1pbXgtY29kZWMudHh0IHRvIF9MSUNFTlNFX0ZJTEVT
LgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5z
a2lAYXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtY29kZWMvaW14
LWNvZGVjLmhhc2ggfCA3ICsrKystLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtY29kZWMv
aW14LWNvZGVjLm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
Y29kZWMvaW14LWNvZGVjLmhhc2ggYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWNvZGVjL2lt
eC1jb2RlYy5oYXNoCmluZGV4IDY2NmQzOGQwMDEzOTRjMzczNzJmMTQ0MWY4MjdmNGJhMmI4OTVh
MjEuLjE4YTJjZWJlYzk4NzdlZTYxYjU4MjZiY2U0Nzc4ZTlhYzlkZWUxMjAgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtY29kZWMvaW14LWNvZGVjLmhhc2gKKysrIGIvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2lteC1jb2RlYy9pbXgtY29kZWMuaGFzaApAQCAtMSw0ICsxLDUg
QEAKICMgbG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICBiMDc0NGE5MWMyNjUyMDJhNzlhMDE5Yzcy
ZjE3Y2FlMDFmZDViNjNhM2JhNDUxNTkyYjZjODM0OWQ5NTcxOWUwICBpbXgtY29kZWMtNC44LjIu
YmluCi1zaGEyNTYgIDI0ZDdjYjNhN2U1MTAxMTQ2NmExNDliZDk5YWNmODkzODdiODMyYmUyZDA4
OTBjZTJlMTgzZGZiYzlkN2NiODQgIENPUFlJTkcKLXNoYTI1NiAgMzI4MmQ4OGZhZDc2Njg5N2Y5
M2IwODI3Mjk3YTcwYzI3MDdkOTM1OGRiMjRjY2NkNTc3N2FiZjdjOTk3ZGE3NyAgRVVMQQorc2hh
MjU2ICAxYTQxYTNjYWQ5ZTBmNGJhYTkwNGZjZWM4OTYxMDVkMzQ3NGUxOGQxM2YxNjlkYWQxMTcy
ZDU2OTFmYzExYzlhICBpbXgtY29kZWMtNC45LjAuYmluCitzaGEyNTYgIGM5ZWU1MTg1MTBkNzJl
MjU0ZDYyNzQzZjUwOTgxNjNlYWNkYjY0MjhjNmJhNGQ4MTE5YWZlMmQxMmVkYmEwNjggIENPUFlJ
TkcKK3NoYTI1NiAgMTY1ZjZjMGVhY2I0ZDNhMDUyODlkZmI3OTMzMWM5YTJjMDUyMDdlYjdhNjdl
ZjI4YTExN2YyNDZhMDE0NTQyOCAgRVVMQQorc2hhMjU2ICA1ODMyYzU5MjE1ZmNjNWZmZDI1NjZj
MGJiMzVjN2U1YzgxODFjYTYwOWY1Mjk5NjJjMmJkMDYwNmYzZjEyYWEzICBTQ1ItaW14LWNvZGVj
LnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1jb2RlYy9pbXgtY29k
ZWMubWsgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWNvZGVjL2lteC1jb2RlYy5tawppbmRl
eCA1NGJhNmYxMjZlOWMzNzFiZGUyYThmMWY5ODA1NWUyNmI5YmFmOGIyLi4wY2ZlNzRkZjBiMzc5
OTY1OGNkMmE1OTA3Y2FlZWNlY2VkMTc3ZmI5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvaW14LWNvZGVjL2lteC1jb2RlYy5taworKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
aW14LWNvZGVjL2lteC1jb2RlYy5tawpAQCAtNCwxMyArNCwxMyBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotSU1YX0NPREVDX1ZFUlNJT04gPSA0LjguMgorSU1YX0NPREVDX1ZFUlNJ
T04gPSA0LjkuMAogSU1YX0NPREVDX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKIElNWF9D
T0RFQ19TT1VSQ0UgPSBpbXgtY29kZWMtJChJTVhfQ09ERUNfVkVSU0lPTikuYmluCiBJTVhfQ09E
RUNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiAKIElNWF9DT0RFQ19MSUNFTlNFID0gTlhQIFNlbWlj
b25kdWN0b3IgU29mdHdhcmUgTGljZW5zZSBBZ3JlZW1lbnQsIEJTRC0zLUNsYXVzZSAoZmxhYywg
b2dnIGhlYWRlcnMpCi1JTVhfQ09ERUNfTElDRU5TRV9GSUxFUyA9IEVVTEEgQ09QWUlORworSU1Y
X0NPREVDX0xJQ0VOU0VfRklMRVMgPSBFVUxBIENPUFlJTkcgU0NSLWlteC1jb2RlYy50eHQKIElN
WF9DT0RFQ19SRURJU1RSSUJVVEUgPSBOTwogCiBpZmVxICgkKEJSMl9hYXJjaDY0KSx5KQoKLS0g
CjIuNDUuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
