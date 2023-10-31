Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB30C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 10:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CC6380E38;
	Tue, 31 Oct 2023 10:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CC6380E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVG5ANewIuax; Tue, 31 Oct 2023 10:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C2E4835A9;
	Tue, 31 Oct 2023 10:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C2E4835A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70FF81BF321
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 10:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49CFB6129E
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 10:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49CFB6129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01ymx2BcNl7B for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 10:22:24 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4E0F6129D
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 10:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4E0F6129D
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 11:22:22 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Oct 2023 11:22:21 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 11:22:19 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 11:22:19 +0100
X-IronPort-AV: E=Sophos;i="6.03,265,1694728800"; d="scan'208";a="59898088"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 31 Oct 2023 11:22:17 +0100
Message-ID: <31538ce771c6cd9f4719a969740b6ff04e3c8e62.1698747732.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698747732.git.yann.morin@orange.com>
References: <cover.1698747732.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX208.corporate.adroot.infra.ftgroup (10.115.27.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698747745; x=1730283745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4cPRviSBqf4CXbTUc3k5GbU1l6BM9VlFs8pHbxPlB8=;
 b=oZ3zx86BusuS3ZxxrIkXylGu9wbFYV1y3FGntCmZlqrhedJHcpCguuC4
 9pYrhkwuygom6dS44u+VxTiQiPprFv5zZ2kg/xCZwLftgKc/Ap1xFosYW
 GSF4dEJVFtVpPTWq4AiWJf0t+jAsbv4T29wu0tj7xyk7Mfr42H6IoTItM
 jV/z0pfEsPmQienU3G/dBPBx4kYTw2HqcYPBZGUmv1ZIO6ixhqaCICXTG
 cQSC5aJk+72JmQbMfoTQ3AMaVTE4LVbdQrGaaLsz/4jOLo7Q/aIM5LajA
 o5ZdJnEEwmPTE+1LXdFrIRuOf+veFPWSiem9BvIKqd0hQJkWhN4GKaWyb
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=oZ3zx86B
Subject: [Buildroot] [PATCH 2/2] utils/docker-run: propagate user's proxy
 settings
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
Cc: yann.morin@orange.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CgpXaGVuIGRlYWxp
bmcgaW4gZW50ZXJwcmlzZS1ncmFkZSBuZXR3b3JrcywgaXQgaXMgbW9yZSBvZnRlbiB0aGFuIG5v
dCB0aGUKY2FzZSB0aGF0IHRoZSB3aWRlciBpbnRlcm5ldCBpcyB1bnJlYWNoYWJsZSBidXQgdGhy
b3VnaCBwcm94aWVzLgoKVGhlcmUgaXMgYSB1c3VhbCBzZXQgb2YgdmFyaWFibGVzIHRoYXQgdXNl
cnMgY2FuIHNldCBpbiB0aGUgZW52aXJvbm1lbnQKdG8gcG9pbnQgdmFyaW91cyB0b29scyAoY3Vy
bCwgZ2l0Li4uKSB0byB1c2UgdGhvc2UgcHJveGllcy4KClByb3BhZ2F0ZSB0aG9zZSB2YXJpYWJs
ZXMgaW5zaWRlIHRoZSBjb250YWluZXIuCgpOb3RlIHRoYXQgdGhlcmUgYXJlIGEgZmV3IHRvb2xz
IChlLmcuIGN2cywgc3ZuKSB0aGF0IG1heSBub3QgcmVjb2duaXNlCnRob3NlIHZhcmlhYmxlczsg
aW5zdGVhZCwgdGhleSByZXF1aXJlIGN1c3RvbSBzZXR1cCB0aGF0IGlzIHRvbyBjb21wbGV4CnRv
IGhhbmRsZSwgc28gaXMgbGVmdCBhcyBhbiBleGVyY2lzZSB0byBpbnRlcmVzdGVkIHBhcnRpZXMu
CgpTaW1pbGFybHksIHRoZXJlIGV4aXN0cyBhbm90aGVyIHR5cGUgb2YgcHJveHksIHNvY2tzNCBv
ciBzb2NrczUsIHRoYXQKYWxzbyByZXF1aXJlcyBjdXN0b20gc2V0dXAgdGhhdCBpcyBub3QgdHJp
dmlhbCB0byByZXBsaWNhdGUgaW4gYQpjb250YWluZXIsIHNvIGlzIGFsc28gbGVmdCBvdXQgYXMg
YW4gZXhyY2lzZSBmb3IgaW50ZXJlc3RlZCBwYXJ0aWVzLgoKSW4gdGhlIGxhcmdlIG1ham9yaXR5
IG9mIGNhc2VzLCB0aG9zZSBmZXcgdmFyaWFibGVzIGFyZSBlbm91Z2ggdG8gTWFrZQpUaGluZ3Mg
V29ya+KEoi4KClNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW5Ab3Jhbmdl
LmNvbT4KQ2M6IFJpY2FyZG8gTWFydGluY29za2kgPHJpY2FyZG8ubWFydGluY29za2lAZGF0YWNv
bS5jb20uYnI+Ci0tLQogdXRpbHMvZG9ja2VyLXJ1biB8IDIwICsrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3V0aWxzL2Rv
Y2tlci1ydW4gYi91dGlscy9kb2NrZXItcnVuCmluZGV4IDQ2NGNiZjY5MWYuLjc5Njk0NDc0YzEg
MTAwNzU1Ci0tLSBhL3V0aWxzL2RvY2tlci1ydW4KKysrIGIvdXRpbHMvZG9ja2VyLXJ1bgpAQCAt
MjksNiArMjksMjYgQEAgZGVjbGFyZSAtYSBtb3VudHBvaW50cz0oCiAgICAgIiQocHdkKSIKICkK
IAorIyBjdXJsIGxpc3RzIChhbmQgcmVjb2duaXNlcyBhbmQgdXNlcykgb3RoZXIgdHlwZXMgb2Yg
Kl9wcm94eSB2YXJpYWJsZXMsCisjIGJ1dCBvbmx5IHRob3NlIG1ha2Ugc2Vuc2UgZm9yIEJ1aWxk
cm9vdDoKK2ZvciBlbnYgaW4gYWxsX3Byb3h5IGh0dHBfcHJveHkgaHR0cHNfcHJveHkgZnRwX3By
b3h5IG5vX3Byb3h5OyBkbworICAgIGlmIFsgIiR7IWVudn0iIF07IHRoZW4KKyAgICAgICAgZG9j
a2VyX29wdHMrPSggLS1lbnYgIiR7ZW52fSIgKQorICAgICAgICAjIFRoZSBsb3dlci1jYXNlIHZh
cmlhbnQgdGFrZXMgcHJlY2VkZW5jZSBvbiB0aGUgdXBwZXItY2FzZSBvbmUKKyAgICAgICAgIyAo
ZGl4aXQgY3VybCkKKyAgICAgICAgY29udGludWUKKyAgICBmaQorICAgICMgaHR0cF9wcm94eSBp
cyBvbmx5IGxvd2VyLWNhc2UgKGRpeGl0IGN1cmwpCisgICAgaWYgWyAiJHtlbnZ9IiA9IGh0dHBf
cHJveHkgXTsgdGhlbgorICAgICAgICBjb250aW51ZQorICAgIGZpCisgICAgIyBBbGwgdGhlIG90
aGVycyBhbHNvIGV4aXN0IGluIHRoZSB1cHBlci1jYXNlIHZhcmlhbnQKKyAgICBlbnY9IiR7ZW52
Xl59IgorICAgIGlmIFsgIiR7IWVudn0iIF07IHRoZW4KKyAgICAgICAgZG9ja2VyX29wdHMrPSgg
LS1lbnYgIiR7ZW52fSIgKQorICAgIGZpCitkb25lCisKICMgRW1wdHkgR0lUX0RJUiBtZWFucyB0
aGF0IHdlIGFyZSBub3QgaW4gYSB3b3JrZGlyLCAqYW5kKiBnaXQgaXMgdG9vIG9sZAogIyB0byBr
bm93IGFib3V0IHdvcmt0cmVlcywgc28gd2UncmUgbm90IGluIGEgd29ya3RyZWUgZWl0aGVyLiBT
byBpdCBtZWFucwogIyB3ZSdyZSBpbiB0aGUgbWFpbiBnaXQgd29ya2luZyBjb3B5LCBhbmQgdGh1
cyB3ZSBkb24ndCBuZWVkIHRvIG1vdW50IHRoZQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkNlIG1lc3NhZ2UgZXQgc2VzIHBp
ZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVzIGluZm9ybWF0aW9ucyBjb25maWRlbnRp
ZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZlbnQgZG9uYw0KcGFzIGV0cmUgZGlmZnVz
ZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRvcmlzYXRpb24uIFNpIHZvdXMgYXZleiBy
ZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxsZXogbGUgc2lnbmFsZXINCmEgbCdleHBl
ZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBt
ZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sDQpP
cmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFs
dGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2kuDQoNClRoaXMgbWVzc2FnZSBhbmQgaXRz
IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9y
bWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3RlZCBieSBsYXc7DQp0aGV5IHNob3VsZCBub3QgYmUg
ZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29waWVkIHdpdGhvdXQgYXV0aG9yaXNhdGlvbi4NCklmIHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNl
bmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzLg0KQXMgZW1h
aWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMgbm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhh
dCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQgb3IgZmFsc2lmaWVkLg0KVGhhbmsgeW91Lgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
