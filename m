Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742E5C25B79
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 08:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A33E4092B;
	Thu, 16 May 2024 08:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pn8zUeCLGNrt; Thu, 16 May 2024 08:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E70140B75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E70140B75;
	Thu, 16 May 2024 08:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E20071BF855
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 08:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBFEA40B75
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 08:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6yWR15wSVDt for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 08:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=friedtj@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 742E74092B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742E74092B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 742E74092B
 for <buildroot@buildroot.org>; Thu, 16 May 2024 08:34:24 +0000 (UTC)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp3-g21.free.fr (Postfix) with ESMTP id B0F3213F8E2;
 Thu, 16 May 2024 10:34:21 +0200 (CEST)
Date: Thu, 16 May 2024 10:34:21 +0200 (CEST)
From: friedtj@free.fr
To: buildroot <buildroot@buildroot.org>
Message-ID: <1829902423.330785126.1715848461667.JavaMail.zimbra@free.fr>
In-Reply-To: <20240512095911.17df30df@windsurf>
References: <1392555888.1047670733.1711087389627.JavaMail.zimbra@free.fr>
 <1322751925.1056008247.1711141112983.JavaMail.zimbra@free.fr>
 <20240512095911.17df30df@windsurf>
MIME-Version: 1.0
X-Originating-IP: [194.167.45.227]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF124 (Linux)/9.0.0_GA_1337)
Thread-Topic: package/gnuradio: add optional IIO support to GNU Radio
Thread-Index: lGx4AppNIRVWr9x0y5X2YIJtpAaC9w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715848461;
 bh=+/T4OLKhrDWBgfKdmeNeUAJvOxNbSC5YLzxXjfPlAHQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hgR6TUXgVilosTeJJFa1iW8ywaQi4D8BfbHMOpaKHpbP7zu0sSMTf5vz/nf28JxNE
 8B22hmZt5qOyp2nRs4Dwbq6U6ka7XxTJ5c/iuHudrqKBtQaTuv2c6xKjixuYkj+Szw
 D+6tGmPHofGiCwEGhyZmZ+9ZFaxBhxXggZgWt7OkdJJRoDf6Ig/C3z9DBFVkIG51+1
 gPZJrS6jF9FApK5+rNij4ZPE9CRJzoMDg9R6TgKreezAnkJlPQEdAjc/NSWANQD7it
 /kIWhLDOeULxqH8nJSgiW6v8iwXbvMMnhOrfZdN6puQK7Ztp2fwjtIrtlvTECrei4N
 BaI2fqTubqkXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hgR6TUXg
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: add optional IIO support
 to GNU Radio
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
Cc: gwenhael.goavec-merou@trabucayre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW5kZWVkIGxpYmlpbyBkZXBlbmRlbmN5IG11c3QgYmUgYWN0aXZhdGVkLiBUaGUgZm9sbG93aW5n
IHBhdGNoIGFpbXMgYXQKcHJvdmlkaW5nIG9wdGlvbmFsIElJTyBzdXBwb3J0IGluIEdOVSBSYWRp
byBzaW5jZSBpdCBpcyBub3cgaW5jbHVkZWQgYW5kCm5vIGxvbmdlciBhbiBleHRlcm5hbCBwYWNr
YWdlOgoKClNpZ25lZC1vZmYtYnk6IEplYW4tTWljaGVsIEZyaWVkdCA8am1mcmllZHRAZmVtdG8t
c3QuZnI+Ci0tLQogcGFja2FnZS9nbnVyYWRpby9Db25maWcuaW4gICB8IDcgKysrKysrKwogcGFj
a2FnZS9nbnVyYWRpby9nbnVyYWRpby5tayB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbnVyYWRpby9Db25maWcuaW4g
Yi9wYWNrYWdlL2dudXJhZGlvL0NvbmZpZy5pbgppbmRleCBiZTk5N2U5MWUyLi43OGJlZTllMjIx
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dudXJhZGlvL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2du
dXJhZGlvL0NvbmZpZy5pbgpAQCAtMTM2LDYgKzEzNiwxMyBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
R05VUkFESU9fRklMVEVSCiAgICAgICAgaGVscAogICAgICAgICAgRmlsdGVyIHNpZ25hbCBwcm9j
ZXNzaW5nIGJsb2NrcwogCitjb25maWcgQlIyX1BBQ0tBR0VfR05VUkFESU9fSUlPCisgICAgICAg
IGJvb2wgImdyLWlpbyBzdXBwb3J0IgorICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfTElCSUlP
CisgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9HTlVSQURJT19CTE9DS1MKKyAgICAgICAgaGVs
cAorICAgICAgICAgIElJTyBzdXBwb3J0CisKIGNvbmZpZyBCUjJfUEFDS0FHRV9HTlVSQURJT19O
RVRXT1JLCiAgICAgICAgYm9vbCAiZ3ItbmV0d29yayBzdXBwb3J0IgogICAgICAgIHNlbGVjdCBC
UjJfUEFDS0FHRV9HTlVSQURJT19CTE9DS1MKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ251cmFkaW8v
Z251cmFkaW8ubWsgYi9wYWNrYWdlL2dudXJhZGlvL2dudXJhZGlvLm1rCmluZGV4IDRlODJjOWUx
MjkuLmJkYWFiODZmMzUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ251cmFkaW8vZ251cmFkaW8ubWsK
KysrIGIvcGFja2FnZS9nbnVyYWRpby9nbnVyYWRpby5tawpAQCAtMTEyLDYgKzExMiwxMyBAQCBl
bHNlCiBHTlVSQURJT19DT05GX09QVFMgKz0gLURFTkFCTEVfR1JfTkVUV09SSz1PRkYKIGVuZGlm
CiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfR05VUkFESU9fSUlPKSx5KQorR05VUkFESU9fQ09ORl9P
UFRTICs9IC1ERU5BQkxFX0dSX0lJTz1PTgorR05VUkFESU9fREVQRU5ERU5DSUVTICs9IGxpYmlp
bworZWxzZQorR05VUkFESU9fQ09ORl9PUFRTICs9IC1ERU5BQkxFX0dSX0lJTz1PRkYKK2VuZGlm
CisKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfR05VUkFESU9fUFlUSE9OKSx5KQogR05VUkFESU9fREVQ
RU5ERU5DSUVTICs9IHB5dGhvbjMgcHl0aG9uLXB5YmluZCBcCiAgICAgICAgaG9zdC1weXRob24t
bnVtcHkgaG9zdC1weXRob24tcGFja2FnaW5nCi0tIAoyLjQzLjAKClRoYW5rcywgCgotLS0tLSBN
YWlsIG9yaWdpbmFsIC0tLS0tCkRlOiAiVGhvbWFzIFBldGF6em9uaSIgPHRob21hcy5wZXRhenpv
bmlAYm9vdGxpbi5jb20+CsOAOiAiZnJpZWR0aiIgPGZyaWVkdGpAZnJlZS5mcj4KQ2M6ICJidWls
ZHJvb3QiIDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4KRW52b3nDqTogRGltYW5jaGUgMTIgTWFp
IDIwMjQgMDk6NTk6MTEKT2JqZXQ6IFJlOiBbQnVpbGRyb290XSBwYWNrYWdlL2dudXJhZGlvOiBh
Y3RpdmF0ZSBnci1paW8KCkhlbGxvIEplYW4tTWljaGVsLAoKT24gRnJpLCAyMiBNYXIgMjAyNCAy
MTo1ODozMiArMDEwMCAoQ0VUKQpmcmllZHRqQGZyZWUuZnIgd3JvdGU6Cgo+IEZyb20gZTI2OTg5
Y2MzMGQ0NDc2ZDczODRlNjIwNjRjZmE2NDg2NzA2YmY4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKPiBGcm9tOiBKTSBGcmllZHQgPGptZnJpZWR0QGZlbXRvLXN0LmZyPgo+IERhdGU6IEZyaSwg
MjIgTWFyIDIwMjQgMjA6NTU6NDQgKzAwMDAKPiBTdWJqZWN0OiBbUEFUQ0ggMS8xXSBwYWNrYWdl
L2dudXJhZGlvOiBhZGQgSUlPIGFzIG9wdGlvbmFsIGZlYXR1cmUgb2YgR05VIFJhZGlvCgpJJ20g
bm90IHN1cmUgd2hhdCBoYXBwZW5lZCwgYnV0IHlvdXIgcGF0Y2ggaXMgYmFkbHkgZm9ybWF0dGVk
LiBBbHNvCnlvdXIgU2lnbmVkLW9mZi1ieSBsaW5lIGlzIG1pc3NpbmcuCgo+ICtjb25maWcgQlIy
X1BBQ0tBR0VfR05VUkFESU9fSUlPCj4gKyAgICAgICBib29sICJnci1paW8gc3VwcG9ydCIKPiAr
ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJJSU8KClNpbmNlIHlvdSBzZWxlY3QgbGliaWlv
Li4uCgo+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0dOVVJBRElPX0JMT0NLUwo+ICsgICAg
ICAgaGVscAo+ICsgICAgICAgICBJSU8gc3VwcG9ydAo+ICsKPiAgY29uZmlnIEJSMl9QQUNLQUdF
X0dOVVJBRElPX05FVFdPUksKPiAgICAgICAgIGJvb2wgImdyLW5ldHdvcmsgc3VwcG9ydCIKPiAg
ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9HTlVSQURJT19CTE9DS1MKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9nbnVyYWRpby9nbnVyYWRpby5tayBiL3BhY2thZ2UvZ251cmFkaW8vZ251cmFkaW8u
bWsKPiBpbmRleCA0ZTgyYzllMTI5Li4yMjY3ZTc1NjFhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Z251cmFkaW8vZ251cmFkaW8ubWsKPiArKysgYi9wYWNrYWdlL2dudXJhZGlvL2dudXJhZGlvLm1r
Cj4gQEAgLTExMiw2ICsxMTIsMTIgQEAgZWxzZQo+ICBHTlVSQURJT19DT05GX09QVFMgKz0gLURF
TkFCTEVfR1JfTkVUV09SSz1PRkYKPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0Vf
R05VUkFESU9fSUlPKSx5KQo+ICtHTlVSQURJT19DT05GX09QVFMgKz0gLURFTkFCTEVfR1JfSUlP
PU9OCgpkb24ndCB5b3UgbmVlZCBsaWJpaW8gYXMgYSBidWlsZCBkZXBlbmRlbmN5PwoKPiArZWxz
ZQo+ICtHTlVSQURJT19DT05GX09QVFMgKz0gLURFTkFCTEVfR1JfSUlPPU9GRgo+ICtlbmRpZgoK
VGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
