Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81565C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 06:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18F0440B0F;
	Fri, 29 Jul 2022 06:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18F0440B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id irZ5I_RfoYPO; Fri, 29 Jul 2022 06:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AF3940179;
	Fri, 29 Jul 2022 06:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF3940179
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47A011BF3B9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 228BE40179
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 06:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228BE40179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFGEllJE3Gc3 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 06:51:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2413740017
Received: from 2.mo548.mail-out.ovh.net (2.mo548.mail-out.ovh.net
 [178.33.255.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2413740017
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 06:51:41 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7FCC820DB7;
 Fri, 29 Jul 2022 06:44:02 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:44:01 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <8e50a870-0891-366a-7c59-0041a847fbad@kaod.org>
Date: Fri, 29 Jul 2022 08:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>
References: <20220729004658.1298414-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729004658.1298414-1-joel@jms.id.au>
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 28ad157c-1b55-4fee-93fb-7335e679251c
X-Ovh-Tracer-Id: 9345532177087499162
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheegke
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004824dfba2-1642-4217-8dab-4995e9908522,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH] board/powerpc/pseries: Set x-vof on qemu
 command line
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNy8yOS8yMiAwMjo0NiwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFRoaXMgdXNlcyBhIG5ld2Vy
IGZpcm13YXJlIGltcGxlbWVudGF0aW9uIHRoYXQgaXMgbXVjaCBmYXN0ZXIgYXQgYm9vdGluZy4K
PiBJdCBpcyBzdXBwb3J0ZWQgYXMgb2YgUWVtdSA3LjAuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9l
bCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiAtLS0KPiAgIGJvYXJkL3FlbXUvcHBjNjRsZS1w
c2VyaWVzL3JlYWRtZS50eHQgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9wcGM2NGxlLXBz
ZXJpZXMvcmVhZG1lLnR4dCBiL2JvYXJkL3FlbXUvcHBjNjRsZS1wc2VyaWVzL3JlYWRtZS50eHQK
PiBpbmRleCA4ZWU3MmVhNmNmLi4zZDU1NzdhYTMyIDEwMDY0NAo+IC0tLSBhL2JvYXJkL3FlbXUv
cHBjNjRsZS1wc2VyaWVzL3JlYWRtZS50eHQKPiArKysgYi9ib2FyZC9xZW11L3BwYzY0bGUtcHNl
cmllcy9yZWFkbWUudHh0Cj4gQEAgLTEsNSArMSw1IEBACj4gICBSdW4gdGhlIGVtdWxhdGlvbiB3
aXRoOgo+ICAgCj4gLXFlbXUtc3lzdGVtLXBwYzY0IC1NIHBzZXJpZXMgLWNwdSBQT1dFUjggLW0g
MjU2IC1rZXJuZWwgb3V0cHV0L2ltYWdlcy92bWxpbnV4IC1hcHBlbmQgImNvbnNvbGU9aHZjMCBy
b290d2FpdCByb290PS9kZXYvc2RhIiAtZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5l
eHQyLGlmPXNjc2ksaW5kZXg9MCxmb3JtYXQ9cmF3IC1zZXJpYWwgc3RkaW8gLWRpc3BsYXkgY3Vy
c2VzICMgcWVtdV9wcGM2NGxlX3BzZXJpZXNfZGVmY29uZmlnCj4gK3FlbXUtc3lzdGVtLXBwYzY0
IC1NIHBzZXJpZXMseC12b2Y9b24gLWNwdSBQT1dFUjggLW0gMjU2IC1rZXJuZWwgb3V0cHV0L2lt
YWdlcy92bWxpbnV4IC1hcHBlbmQgImNvbnNvbGU9aHZjMCByb290d2FpdCByb290PS9kZXYvc2Rh
IiAtZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGlmPXNjc2ksaW5kZXg9MCxm
b3JtYXQ9cmF3IC1zZXJpYWwgc3RkaW8gLWRpc3BsYXkgY3Vyc2VzICMgcWVtdV9wcGM2NGxlX3Bz
ZXJpZXNfZGVmY29uZmlnCgpUaGUgY29tbWFuZCBsaW5lIG9wdGlvbnMgYXJlIGEgYml0IG91dGRh
dGVkLiBXZSBjb3VsZCByZW1vdmUgdGhlbSB0bwpsZXQgUUVNVSBkZWNpZGUuIFRoZSBkZWZhdWx0
IENQVSB3b3VsZCBiZSAicG93ZXI5X3YyLjAiIGFuZCBSQU0gd291bGQKYmUgc2V0IHRvIDUxMiBN
QiBSQU0uCgpBbnlob3csCgpSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4KClRoYW5rcywKCkMuCgo+ICAgCj4gICBUaGUgbG9naW4gcHJvbXB0IHdpbGwgYXBwZWFy
IGluIHRoZSB0ZXJtaW5hbCB3aW5kb3cuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
