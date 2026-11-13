Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29714606A334
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A/z0sqEF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6409D814C7;
	Fri, 13 Nov 2026 14:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYf4gAI9e87h; Fri, 13 Nov 2026 14:50:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 490D581468
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794581456;
	b=KmYM/Eswin++zN7o7V0mD+q/7hFQ5m0l/9mSYR1TU7N/e30camcBUURzhw2ngnpQAOFA
	 2mj1T+LWva1N9DdeDzxLI4I0yd1TNFRzB+/oT33q19PIaxTxPmvdLyx2pL/EgmDOEByfm
	 38FGZ0oVh45ZwOJgng91XnjBmtxxHYUZrtQK+57GbNChOMGhqVMjzdnORLAc0//aDZd1Z
	 jltpakdvDfTVLsQSAMO029wnAcg/FA98wH/83NXrqjUtleSSWAMC6e2h5KQt0Y2T1w1vF
	 /181RQQXoGSzjhkTPpfmiII9XdWj3+12aqskF1ZuyCf3sXMNxnU8kV+6azEbOHZd8Ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794581456;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=7e+umwPbxj4+4PSaM84lfGnKVw2EygUpKS0UWwTAibU=;
	b=G4IECqpK2gjS7a0LIOtCT4yb8xbIdrWRsRQGCuS2FUyh3W1jNBEp8XjVX6zh43vOUsHU
	 ZGy9Io1LJjZgsRzFqlQdIqno5pUdhAKMsiVuZBj3ijTyM3m4/WrVcwse5X09p0FTxX74r
	 P0zarKAXxrr6FvtpkaXrK7848I8i8z/RAWU2V3CpLisOQf9ZNqjCqZ9sNL5UGUZjkGqXt
	 JMUfJpNy4XxSk7bUnjzgQeCdmYoZPabZn8w16hyxqOTq+0pr3TStkakKu8wsKeq4AKa0t
	 p6YieFFXYAsZIMsihOrZ4seo9iFDOxm1QQCpuSfR76n8iViIFDNpYNl+eZjkslQGHBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794581456;
	bh=7e+umwPbxj4+4PSaM84lfGnKVw2EygUpKS0UWwTAibU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=A/z0sqEFXUHrzKV1z0dDFXTv8mubdlWW7RFKwTiPCHDoskdYein07/q/mCvruJV10
	 BYj1QOuUFnOC1CSMb8blK6kJpV2Q+I3IdmA6LHUGo/WHLE4whbEI3b38/7eJiJVMiK
	 8AKYOHTMnqRFzl2RVvBrXMr93K0Zs43t2UPSUgVxsuerGA7HaCyXZePx8OYCFGMEwS
	 SmawNA9M3bWYnGkjN5kM/HIhonJmlR5Vcw6wz8JEfUxdZz3ubGn/epzLG+x+ca2pLJ
	 xMmndg5r0bkp+TcSPFmFct9H7U5/MV6rOlbKOd79hcFRg8JSn3risQ917Pv8AUgif1
	 FA7Ihgx6yfbNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 490D581468;
	Fri, 13 Nov 2026 14:50:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6EFB28C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8DFD400F9
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PouejBHkC-qH for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 14:50:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0C4074009F
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C4074009F
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:50:52 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 29DE2183EB6;
 Fri, 13 Nov 2026 15:50:49 +0100 (CET)
Message-ID: <bcd55a3c-2355-455e-907e-e435c48d59d5@grenoble.cnrs.fr>
Date: Fri, 13 Nov 2026 15:50:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Luca <davidluca3000@yahoo.com>,
 Julien Olivain via Buildroot <buildroot@buildroot.org>
References: <813093532.2289630.1794564858648.ref@mail.yahoo.com>
 <813093532.2289630.1794564858648@mail.yahoo.com>
Content-Language: en-US, fr
In-Reply-To: <813093532.2289630.1794564858648@mail.yahoo.com>
Subject: Re: [Buildroot] Fail to compile Linux kernel 5.14 with GCC15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8hCgpPbiAyMDI2LTExLTEzLCBEYXZpZCBMdWNhIHdyb3RlOgo+IEhlbGxvLMKgCj4gQXMg
bWVudGlvbmVkIGluIHRoZSB0aXRsZSwgSSByZWNlaXZlIGEgY29tcGlsZSBlcnJvciBmb3IgYXJj
aC94ODYvcmVhbG1vZGUvcm0vd2FrZW1haW4uYzoKPiAuL2luY2x1ZGUvbGludXgvc3RkZGVmOjEx
Ojk6IGVycm9yOiBjYW5ub3QgdXNlIGtleXdvcmQgJ2ZhbHNlJyBhcyBlbnVtZXJhdGlvbiBjb25z
dGFudAo+IE5vdGU6ICdmYWxzZSdpcyBhIGtleXdvcmQgd2l0aCcgJy1zdGQ9YzIzJyBvbndhcmRz
LsKgCj4gU28gSSBwYXRjaGVkIG15IGJ1aWxkcm9vdCBsaW51eC9saW51eC5tayB0byBhZGQ6Cj4g
aWZlcSAoJChCUl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzE1KSx5KQo+IExJTlVYX0NGTEFHUyAr
PSAtc3RkPWdudTE3Cj4gZW5kaWYKPiBIb3dldmVyIHRoZSBjb21waWxlciBlcnJvciBpcyBzdGls
bCBoYXBwZW5pbmcsIGFueSBpZGVhIGhvdyB0byBmaXg/wqAKTGludXggNS4xNCBpcyBzdXBwb3Nl
ZCB0byBiZSBidWlsdCB3aXRoIOKAmC1zdGQ9Z251ODnigJkuIEl0cyBtYWluIE1ha2VmaWxlCnBy
b3ZpZGVzIHRoaXMgZGVmaW5pdGlvbjoKCiAgICBLQlVJTERfQ0ZMQUdTIDo9IC1XYWxsIC1XdW5k
ZWYgWy4uLl0gLXN0ZD1nbnU4OQoKVGhlIHByb2JsZW0gaXMgdGhhdCBzb21lIG9mIHRoZSBzdWIt
bWFrZWZpbGVzIG92ZXJyaWRlIHRoZSBkZWZpbml0aW9uIG9mCktCVUlMRF9DRkxBR1MgYW5kIGZv
cmdldCB0byBhZGQgdGhlIGxhbmd1YWdlIGRpYWxlY3Qgb3B0aW9uLiBUaGlzIGhhcwpiZWVuIHBh
cnRpYWxseSBmaXhlZCBpbiBMaW51eCBjb21taXQgYjNiZWUxZTdjM2YyICgieDg2L2Jvb3Q6IENv
bXBpbGUKYm9vdCBjb2RlIHdpdGggLXN0ZD1nbnUxMSB0b28iKS4gVGhlIHZhcmlvdXMgZGVmaW5p
dGlvbnMgb2YgdGhpcyBmbGFnCndlcmUgZXZlbnR1YWxseSBjb25zb2xpZGF0ZWQgaW4gZWM0YzI4
Mjc2YzE0ICgia2J1aWxkOiBDb25zb2xpZGF0ZSBDCmRpYWxlY3Qgb3B0aW9ucyIpLiBUaG9zZSB0
d28gY29tbWl0cyBhcmUgd2F5IG1vcmUgcmVjZW50IHRoYW4gTGludXgKNS4xNCwgYXMgdGhleSBs
YW5kZWQgaW4gNi43IGFuZCA3LjEgcmVzcGVjdGl2ZWx5LgoKVGhlIGJlc3Qgc29sdXRpb24gaXMg
cHJvYmFibHkgdG8gZm9sbG93IEp1bGllbiBPbGl2YWluJ3MgYWR2aWNlIGFuZAp1cGdyYWRlIHRv
IGEgbmV3ZXIga2VybmVsLiBJdCB0aGF0IGlzIG5vdCBwcmFjdGljYWwsIGRvd25ncmFkZSB0byBh
bgpvbGRlciBjb21waWxlci4gT3RoZXJ3aXNlIHlvdSBtYXkgdHJ5IHRvIGZpeCB0aGUgZmF1bHR5
IG1ha2VmaWxlcyBieQphZGRpbmcgdGhlIGxhbmd1YWdlIGRpYWxlY3Qgb3B0aW9uIHdoZXJlIG5l
ZWRlZC4gSSBnYXZlIHRoaXMgbGFzdCBvcHRpb24KYSB0cnk6IGRyb3BwaW5nIHRoZSBhdHRhY2hl
ZCBwYXRjaCBpbiBsaW51eC81LjE0LyBhbmQgdXNpbmcgdGhpcwpkZWZjb25maWc6CgogICAgQlIy
X3g4Nl82ND15CiAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKICAgIEJSMl9MSU5VWF9LRVJO
RUw9eQogICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15CiAgICBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE0IgogICAgQlIyX0xJTlVYX0tFUk5FTF9V
U0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CgpJIGNvdWxkIHN1Y2Nlc3NmdWxseSBidWlsZCB0aGUg
a2VybmVsIHVzaW5nIHRoZSBCb290bGluIHRvb2xjaGFpbgrigJx4ODYtNjQgZ2xpYmMgYmxlZWRp
bmctZWRnZSAyMDI1LjA4LTHigJ0sIHdoaWNoIGlzIGJhc2VkIG9uIEdDQyAxNS4xLgoKQ2hlZXJz
LAoKRWRnYXIgQm9uZXQKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSA+OCAtLQpGcm9tIGY1ODJlNzc5YWY1MDM4YWNhNGI3
OWMwNWU0MzhiYzVlZGJmZTE0M2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IEVkZ2Fy
IEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgpEYXRlOiBGcmksIDEzIE5vdiAyMDI2IDE1
OjAwOjI0ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gU3BlY2lmeSB0aGUgQyBzdGFuZGFyZCBpbiBz
dWItbWFrZWZpbGVzIHRvbwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxh
aW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVGhlIG1h
aW4gTWFrZWZpbGUgaGFzIHRoZSBvcHRpb24g4oCYLXN0ZD1nbnU4OeKAmSBpbiBLQlVJTERfQ0ZM
QUdTLiBIb3dldmVyLAp0aGlzIHZhcmlhYmxlIGlzIG92ZXJyaWRkZW4gaW4gc29tZSBzdWItbWFr
ZWZpbGVzLCB3aGljaCBsZWFkcyB0byBidWlsZApmYWlsdXJlcyB3aXRoIHJlY2VudCBHQ0MgdmVy
c2lvbnMuIEUuZy46CgogICAgLi9pbmNsdWRlL2xpbnV4L3N0ZGRlZi5oOjExOjk6CiAgICBlcnJv
cjogY2Fubm90IHVzZSBrZXl3b3JkIOKAmGZhbHNl4oCZIGFzIGVudW1lcmF0aW9uIGNvbnN0YW50
CiAgICBub3RlOiDigJhmYWxzZeKAmSBpcyBhIGtleXdvcmQgd2l0aCDigJgtc3RkPWMyM+KAmSBv
bndhcmRzCgpUaGlzIGJhY2twb3J0cyBhbmQgZXh0ZW5kcyBiM2JlZTFlN2MzZjIgKCJ4ODYvYm9v
dDogQ29tcGlsZSBib290IGNvZGUKd2l0aCAtc3RkPWdudTExIHRvbyIpLCBzcGVjaWZ5aW5nIHRo
ZSBDIHN0YW5kYXJkIHVzZWQgYnkgTGludXggNS4xNAppbnN0ZWFkIG9mIGdudTExLgotLS0KIGFy
Y2gveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBhcmNoL3g4Ni9ib290
L2NvbXByZXNzZWQvTWFrZWZpbGUgICAgIHwgMiArLQogZHJpdmVycy9maXJtd2FyZS9lZmkvbGli
c3R1Yi9NYWtlZmlsZSB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L01ha2VmaWxlIGIvYXJjaC94ODYv
TWFrZWZpbGUKaW5kZXggMzA3ZmQwMDAwYTgzLi5kMDdhZDU0OWE4ODYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L01ha2VmaWxlCisrKyBiL2FyY2gveDg2L01ha2VmaWxlCkBAIC0yNCw3ICsyNCw3IEBA
IGVuZGlmCiAKICMgSG93IHRvIGNvbXBpbGUgdGhlIDE2LWJpdCBjb2RlLiAgTm90ZSB3ZSBhbHdh
eXMgY29tcGlsZSBmb3IgLW1hcmNoPWkzODY7CiAjIHRoYXQgd2F5IHdlIGNhbiBjb21wbGFpbiB0
byB0aGUgdXNlciBpZiB0aGUgQ1BVIGlzIGluc3VmZmljaWVudC4KLVJFQUxNT0RFX0NGTEFHUwk6
PSAtbTE2IC1nIC1PcyAtRERJU0FCTEVfQlJBTkNIX1BST0ZJTElORyBcCitSRUFMTU9ERV9DRkxB
R1MJOj0gLXN0ZD1nbnU4OSAtbTE2IC1nIC1PcyAtRERJU0FCTEVfQlJBTkNIX1BST0ZJTElORyBc
CiAJCSAgIC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLW1hcmNoPWkzODYgLW1yZWdwYXJtPTMg
XAogCQkgICAtZm5vLXN0cmljdC1hbGlhc2luZyAtZm9taXQtZnJhbWUtcG9pbnRlciAtZm5vLXBp
YyBcCiAJCSAgIC1tbm8tbW14IC1tbm8tc3NlICQoY2FsbCBjYy1vcHRpb24sLWZjZi1wcm90ZWN0
aW9uPW5vbmUpCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvTWFrZWZpbGUg
Yi9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvTWFrZWZpbGUKaW5kZXggNDMxYmY3Zjg0NmMzLi5j
OGE4OGU2NzIwMWIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9NYWtlZmls
ZQorKysgYi9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvTWFrZWZpbGUKQEAgLTI4LDcgKzI4LDcg
QEAgS0NPVl9JTlNUUlVNRU5UCQk6PSBuCiB0YXJnZXRzIDo9IHZtbGludXggdm1saW51eC5iaW4g
dm1saW51eC5iaW4uZ3ogdm1saW51eC5iaW4uYnoyIHZtbGludXguYmluLmx6bWEgXAogCXZtbGlu
dXguYmluLnh6IHZtbGludXguYmluLmx6byB2bWxpbnV4LmJpbi5sejQgdm1saW51eC5iaW4uenN0
CiAKLUtCVUlMRF9DRkxBR1MgOj0gLW0kKEJJVFMpIC1PMgorS0JVSUxEX0NGTEFHUyA6PSAtc3Rk
PWdudTg5IC1tJChCSVRTKSAtTzIKIEtCVUlMRF9DRkxBR1MgKz0gLWZuby1zdHJpY3QtYWxpYXNp
bmcgLWZQSUUKIEtCVUlMRF9DRkxBR1MgKz0gLVd1bmRlZgogS0JVSUxEX0NGTEFHUyArPSAtRERJ
U0FCTEVfQlJBTkNIX1BST0ZJTElORwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkv
bGlic3R1Yi9NYWtlZmlsZSBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvTWFrZWZpbGUK
aW5kZXggZDA1Mzc1NzM1MDFlLi40N2UzZTY2ODczYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZmly
bXdhcmUvZWZpL2xpYnN0dWIvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGli
c3R1Yi9NYWtlZmlsZQpAQCAtMjksNyArMjksNyBAQCBjZmxhZ3MtJChDT05GSUdfUklTQ1YpCQk6
PSAkKHN1YnN0ICQoQ0NfRkxBR1NfRlRSQUNFKSwsJChLQlVJTERfQ0ZMQUdTKSkgXAogCiBjZmxh
Z3MtJChDT05GSUdfRUZJX0dFTkVSSUNfU1RVQikgKz0gLUkkKHNyY3RyZWUpL3NjcmlwdHMvZHRj
L2xpYmZkdAogCi1LQlVJTERfQ0ZMQUdTCQkJOj0gJChjZmxhZ3MteSkgLU9zIC1ERElTQUJMRV9C
UkFOQ0hfUFJPRklMSU5HIFwKK0tCVUlMRF9DRkxBR1MJCQk6PSAtc3RkPWdudTg5ICQoY2ZsYWdz
LXkpIC1PcyAtRERJU0FCTEVfQlJBTkNIX1BST0ZJTElORyBcCiAJCQkJICAgLWluY2x1ZGUgJChz
cmN0cmVlKS9pbmNsdWRlL2xpbnV4L2hpZGRlbi5oIFwKIAkJCQkgICAtRF9fTk9fRk9SVElGWSBc
CiAJCQkJICAgLWZmcmVlc3RhbmRpbmcgXAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
