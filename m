Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E033C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4A6040879;
	Mon, 18 Dec 2023 18:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4A6040879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjJ9d4jlVF8p; Mon, 18 Dec 2023 18:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8946408BF;
	Mon, 18 Dec 2023 18:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8946408BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 829641BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6840B40879
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6840B40879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVvb9fNvxS0s for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:58:44 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CBCF4077D
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CBCF4077D
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Sv8HN1q6Pz9sRD;
 Mon, 18 Dec 2023 19:58:40 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------Si0vea2FmjDoz3KiyqBH2n6y"
Message-ID: <dfe116cd-5cb9-4617-a9b9-02274e8d4b43@lindra.de>
Date: Mon, 18 Dec 2023 19:58:38 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
 <20231217230704.003200c7@windsurf>
From: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <20231217230704.003200c7@windsurf>
X-Rspamd-Queue-Id: 4Sv8HN1q6Pz9sRD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1702925920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YFyVHlfdv44YUOzVs+9xbURB3Smnhl2uT5E21LVC6vU=;
 b=Fann8Jh29MFSaF1zSuHce7SHD7yjNiR+wYgfyWLd8TPSQYRctLMk0Uiy5F4CNJaQSe0ckf
 PydgTwZpa5RmhTavNlUpZdLVphhTLnEm2hgRJ3ytKNu/jcX9NUULMLyK58ooRAYvXyxCHG
 jB2YAdKOqU8dFwIHapr5NkV5lFpG864hktTxpc8kUwURo6LEOpcdKIyJ41pcn052NdfE+n
 7I8jCDLGTjDINOmnaT0yXaky2hb7E/UvUXirrN+QXwZEUO075X3y4V1bbpnrzmwweIj3hO
 hBmO/nkA2A9W+CCJzy6oer1lrKKiqk7tgbH3z1CHHUjUQ1McEOTpRvk1vSck2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=Fann8Jh2
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Julien Olivain <ju.o@free.fr>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------Si0vea2FmjDoz3KiyqBH2n6y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Thomas,

attached is an updated clean patch.

Best,

Ralf


--------------Si0vea2FmjDoz3KiyqBH2n6y
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-python-qt5-add-PyQt5.sip-module.patch"
Content-Disposition: attachment;
 filename="0002-python-qt5-add-PyQt5.sip-module.patch"
Content-Transfer-Encoding: base64

RnJvbSA5ZWMzYjM4YjFlMWYwZjA2YzA1NjFhZGJiNDhhYTdlMTA2ZDM2OTc1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSYWxmIERyYWdvbiA8aHlwbm90b2FkQGxpbmRyYS5k
ZT4KRGF0ZTogVGh1LCAyMyBOb3YgMjAyMyAxODoyMzo1OSArMDEwMApTdWJqZWN0OiBbUEFU
Q0ggMi8yXSBweXRob24tcXQ1OiBhZGQgUHlRdDUuc2lwIG1vZHVsZQoKVGhpcyBmaXhlcyB0
aGUgZm9sbG93aW5nIHJ1bnRpbWUgZXJyb3Igd2hlbiBpbXBvcnRpbmcgUHlRdDUgaW4gcHl0
aG9uOgoKZnJvbSBQeVF0NS5RdENvcmUgaW1wb3J0ICoKTW9kdWxlTm90Rm91bmRFcnJvcjog
Tm8gbW9kdWxlIG5hbWVkICdQeVF0NS5zaXAnCgpTaWduZWQtb2ZmLWJ5OiBSYWxmIERyYWdv
biA8aHlwbm90b2FkQGxpbmRyYS5kZT4KLS0tCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9weXRob24tcHlxdDUtc2lw
L0NvbmZpZy5pbiAgICAgICAgICAgICB8ICA1ICsrKysrCiBwYWNrYWdlL3B5dGhvbi1weXF0
NS1zaXAvcHl0aG9uLXB5cXQ1LXNpcC5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3B5dGhvbi1w
eXF0NS1zaXAvcHl0aG9uLXB5cXQ1LXNpcC5tayAgIHwgMTUgKysrKysrKysrKysrKysrCiBw
YWNrYWdlL3B5dGhvbi1weXF0NS9Db25maWcuaW4gICAgICAgICAgICAgICAgIHwgIDEgKwog
NSBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9weXRob24tcHlxdDUtc2lwL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcHl0aG9uLXB5cXQ1LXNpcC9weXRob24tcHlxdDUtc2lwLmhhc2gKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1weXF0NS1zaXAvcHl0aG9uLXB5cXQ1LXNp
cC5tawoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcu
aW4KaW5kZXggZmNjMDliMDdjNC4uMmQ2YTA3N2QxNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9D
b25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTEyNTMsNiArMTI1Myw3IEBA
IG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIgogCXNvdXJjZSAicGFja2FnZS9weXRo
b24tcHlwaGVuL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXB5cXJjb2Rl
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXB5cXQ1L0NvbmZpZy5pbiIK
Kwlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXB5cXQ1LXNpcC9Db25maWcuaW4iCiAJc291cmNl
ICJwYWNrYWdlL3B5dGhvbi1weXJhdGVtcC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdl
L3B5dGhvbi1weXJvdXRlMi9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1w
eXJzaXN0ZW50L0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5cXQ1
LXNpcC9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1weXF0NS1zaXAvQ29uZmlnLmluCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFlNTg4MThhMWUKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1weXF0NS1zaXAvQ29uZmlnLmluCkBAIC0w
LDAgKzEsNSBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9QWVFUNV9TSVAKKwlib29s
ICJweXRob24tcHlxdDUtc2lwIgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUFlUSE9OX1NJ
UAorCWhlbHAKKwkgIFRoaXMgaXMgdGhlIFB5UXQ1LnNpcCBtb2R1bGUgd2hpY2ggaXMgbmVl
ZGVkIHRvIHJ1biBQeVF0NS4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5cXQ1LXNp
cC9weXRob24tcHlxdDUtc2lwLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1weXF0NS1zaXAvcHl0
aG9uLXB5cXQ1LXNpcC5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmE1NWM3NGVkOGYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1weXF0
NS1zaXAvcHl0aG9uLXB5cXQ1LXNpcC5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBmcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9QeVF0NS1zaXAvMTIuMTIuMQorc2hhMjU2ICA4ZmRj
NmUwMTQ4YWJkMTJkOTc3YTFkMzgyOGU3Yjc5YWFlOTU4ZTgzYzZjYjVhZGFlNjE0OTE2ZDg4
OGE2YjEwICBQeVF0NV9zaXAtMTIuMTIuMS50YXIuZ3oKK21kNSAgYzIxMTdkYTNiNGMwZTA4
MWMxYzVhOTA4OGI4YTRkNTUgIFB5UXQ1X3NpcC0xMi4xMi4xLnRhci5negpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9weXRob24tcHlxdDUtc2lwL3B5dGhvbi1weXF0NS1zaXAubWsgYi9wYWNr
YWdlL3B5dGhvbi1weXF0NS1zaXAvcHl0aG9uLXB5cXQ1LXNpcC5tawpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mMmQ1MGMyZTAzCi0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9weXRob24tcHlxdDUtc2lwL3B5dGhvbi1weXF0NS1zaXAubWsKQEAgLTAs
MCArMSwxNSBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgcHl0aG9uLXB5
cXQ1LXNpcAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworUFlUSE9OX1BZUVQ1
X1NJUF9WRVJTSU9OID0gMTIuMTIuMQorUFlUSE9OX1BZUVQ1X1NJUF9TSVRFID0gaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2MxLzYxLzQwNTVlN2EwZjM2MzM5
OTY0OTU2ZmY0MTVlMzZmNGFiZjgyNTYxOTA0Y2M0OWMwMjFkYTMyOTQ5ZmM1NQorUFlUSE9O
X1BZUVQ1X1NJUF9TT1VSQ0UgPSBQeVF0NV9zaXAtJChQWVRIT05fUFlRVDVfU0lQX1ZFUlNJ
T04pLnRhci5negorUFlUSE9OX1BZUVQ1X1NJUF9MSUNFTlNFID0gTUlUCitQWVRIT05fUFlR
VDVfU0lQX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCitQWVRIT05fUFlRVDVfU0lQX1NFVFVQ
X1RZUEUgPSBzZXR1cHRvb2xzCitQWVRIT05fUFlRVDVfU0lQX0RFUEVOREVOQ0lFUyA9IHB5
dGhvbi1zaXAKKworJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9weXRob24tcHlxdDUvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tcHlxdDUvQ29u
ZmlnLmluCmluZGV4IDlmYTc2NzZmOTguLmMyYTE5NzY5NTAgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvcHl0aG9uLXB5cXQ1L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3B5dGhvbi1weXF0NS9D
b25maWcuaW4KQEAgLTUsNiArNSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fUFlR
VDUKIAlib29sICJweXRob24tcHlxdDUiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9RVDUK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NJUAorCXNlbGVjdCBCUjJfUEFDS0FHRV9Q
WVRIT05fUFlRVDVfU0lQCiAJc2VsZWN0IEJSMl9QQUNLQUdFX1FUNUJBU0VfR1VJCiAJaGVs
cAogCSAgUHl0aG9uIGJpbmRpbmdzIGZvciBRdCA1Ci0tIAoyLjM5LjIKCg==

--------------Si0vea2FmjDoz3KiyqBH2n6y
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------Si0vea2FmjDoz3KiyqBH2n6y--
