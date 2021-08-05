Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B136C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:13:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD6E60EC0
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AD6E60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4EDE83AD0;
	Thu,  5 Aug 2021 20:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4oNAKi1Vm6Ec; Thu,  5 Aug 2021 20:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF7D83A6E;
	Thu,  5 Aug 2021 20:13:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB0E1BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 695AD83A6E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhFVzoUirFfP for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:13:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 706A7839BF
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 20:13:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:70be:8b43:5d22:5801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BC3AEB0054E;
 Thu,  5 Aug 2021 22:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628194423;
 bh=GTZaQdrkcxW0iyQXbErFJoQVL9G2CkURVJ1IKeiAl90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YEY2796Xe/3QiUYOHlUSR68E6D46b63I1XEAaIHBIGJ9sOk9RcznYzaQgdBJuV9sH
 3FjXZ2dx+EaIenuuaOuSDcsD2Ll3Nc6Dcx+zFZNEsDukrYEO3crTzLDvUg1VbPWnqd
 gVqhu91xxRKLjJ/SELdITmWvgplKEyQMeSPbd1/aQclI3BvOmLLfm5w3nTq7oTJWFF
 Kys27hbD3d3rZSq+l/9rcUA2yIX4qLWjq2grbtVJv5XzUYonqtBZiF5Sw+SuEOwl5q
 5lG51GuRf6RwjPwp1RsVBTPebiVBEPPIgMVV7GgwK62pmXyITpaZL95kTC1ejnIFAr
 a4CCEXsnAlcsw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Aug 2021 22:13:38 +0200
Date: Thu, 5 Aug 2021 22:13:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20210805201338.GQ27036@scaer>
References: <20210802180616.3304814-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802180616.3304814-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libcap: bump to version 2.52
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIxLTA4LTAyIDIwOjA2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgo+IC0tLQo+ICBwYWNrYWdlL2xpYmNhcC9saWJjYXAuaGFzaCB8
IDIgKy0KPiAgcGFja2FnZS9saWJjYXAvbGliY2FwLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYmNhcC9saWJjYXAuaGFzaCBiL3BhY2thZ2UvbGliY2FwL2xpYmNhcC5oYXNoCj4g
aW5kZXggZWM4N2EzOGRmLi5lYjhmZTQzZjYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJjYXAv
bGliY2FwLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYmNhcC9saWJjYXAuaGFzaAo+IEBAIC0xLDUg
KzEsNSBAQAo+ICAjIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2xpYnMvc2VjdXJp
dHkvbGludXgtcHJpdnMvbGliY2FwMi9zaGEyNTZzdW1zLmFzYwo+IC1zaGEyNTYgIDY2MDlmM2Fi
N2FlYmNjOGY5Mjc3ZjUzYTU3N2M2NTdkOWYzMDU2ZDEzNTJlYTYyM2RhN2ZkN2MwZjAwODkwZjkg
IGxpYmNhcC0yLjUxLnRhci54ego+ICtzaGEyNTYgIGEyZmFhY2Q1NWFlNTk1OWRiMWIwYzY5NWY5
MWYyNTZhYzRjNWU2YjEwYWNhZWFlYWY1MDhlYTFlZTg4N2ZhOTcgIGxpYmNhcC0yLjUyLnRhci54
ego+ICAKPiAgIyBIYXNoIGZvciBsaWNlbnNlIGZpbGU6Cj4gIHNoYTI1NiAgZjU4YzgwYmNjZThj
OTI5ZGIzOWEyM2MzMmU5MjQ4NzZlMzMxMWYzZmZhNTRmNjYwNzZjMzgwNTZkMzhmYTU5YiAgTGlj
ZW5zZQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNhcC9saWJjYXAubWsgYi9wYWNrYWdlL2xp
YmNhcC9saWJjYXAubWsKPiBpbmRleCAzZGMwOWJkNTUuLjQ1NzAwZTU2ZSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xpYmNhcC9saWJjYXAubWsKPiArKysgYi9wYWNrYWdlL2xpYmNhcC9saWJjYXAu
bWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAK
PiAtTElCQ0FQX1ZFUlNJT04gPSAyLjUxCj4gK0xJQkNBUF9WRVJTSU9OID0gMi41MgoKSG93IGRp
ZCB5b3UgdGVzdCB0aGlzIGJ1bXA/IFRoZSBwYXRjaGVzIHdlIGhhZCBpbiBCdWlsZHJvb3QgZGlk
IG5vdCBldmVuCmFwcGx5IGFueW1vcmU6CgogICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvMmY2MTliMjMzZTJjZmI0ZDdlZWIzY2MxNzhjODQ5Yzc0ZDExZjJjYS8KClRo
aXMgaGFzIGJlZW4gZml4ZWQgaW4gbmV4dCwgbm93OgoKICAgIGh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTA4MDUxNjE2NTMuMjIxMzY4OS0x
LWlsbGlhLmJpdGtvdkBtaW5kLmJlLwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIExJQkNB
UF9TSVRFID0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgvbGlicy9zZWN1cml0eS9s
aW51eC1wcml2cy9saWJjYXAyCj4gIExJQkNBUF9TT1VSQ0UgPSBsaWJjYXAtJChMSUJDQVBfVkVS
U0lPTikudGFyLnh6Cj4gIExJQkNBUF9MSUNFTlNFID0gR1BMLTIuMCBvciBCU0QtMy1DbGF1c2UK
PiAtLSAKPiAyLjMwLjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVzeWJveC5u
ZXQKPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Ci0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICsz
MyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAg
X19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9y
aW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25z
cGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
