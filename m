Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F96FC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA7C3401B1;
	Sun, 30 Oct 2022 18:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA7C3401B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-1GOh4uao5W; Sun, 30 Oct 2022 18:34:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80993401BA;
	Sun, 30 Oct 2022 18:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80993401BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BB9B1BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E87401B1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E87401B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZM_fvqgEKive for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:34:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A354D401A2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A354D401A2
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 18:34:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CF10813F892;
 Sun, 30 Oct 2022 19:34:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 19:34:22 +0100
Date: Sun, 30 Oct 2022 19:34:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030183422.GA1058960@scaer>
References: <20221030182027.186259-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030182027.186259-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667154864;
 bh=X6S2cNocHyyNpYvB/WM9DG/7z1e8qSJ8dUCsMMEIjxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p2skkVWEF9OiJZ3UEFvSLwIzW62IHhtNr8MV312Q19KRoEeK3uBqxAaPGktHhBgHL
 pGqcqV3+B9TUdf6tfb+kLb8evfk+VIre8+/F0js6vmsNqcmX8Pei9hUMY8UtutjNyr
 4s73tEhWY9aqXKtDk6Z+yDCvy3TRhkJMzMkJKhmTBAxj/XmQUJHTAse/tUmefzZz5Y
 nmqibURBAPei/4IdwEHPH+fJ3qJSu+FO59QjIRi5s+5WFZ2xmLwqzeUqBV3l6+ic2R
 dOYdl3GQpu0tqkVen9jH2uox5d11iKeiwvmUOlhzO4Q+zsh/bZULioAdv98ALUirKi
 TdcBgZHVaodMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p2skkVWE
Subject: Re: [Buildroot] [PATCH 1/1] package/batman-adv: bump to version
 2022.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMi0xMC0zMCAxOToyMCArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gVGhpcyBidW1wIHdpbGwgZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQg
ZmFpbHVyZSB3aXRoIGtlcm5lbCA+PSA1LjE4IHRoYW5rcyB0bwo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuLW1lc2gtbWlycm9yL2JhdG1hbi1hZHYvY29tbWl0L2YwN2EwYzM3YWIyNzhmYjZhOWU5
NWNhZDg5NDI5YjEyODJmMWFiNTk6Cj4gCj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0
YW5jZS0yL291dHB1dC0xL2J1aWxkL2JhdG1hbi1hZHYtMjAyMS40L25ldC9iYXRtYW4tYWR2L2Jy
aWRnZV9sb29wX2F2b2lkYW5jZS5jOiBJbiBmdW5jdGlvbiDigJhiYXRhZHZfYmxhX3NlbmRfY2xh
aW3igJk6Cj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1
aWxkL2JhdG1hbi1hZHYtMjAyMS40L25ldC9iYXRtYW4tYWR2L2JyaWRnZV9sb29wX2F2b2lkYW5j
ZS5jOjQ0Njo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbmV0
aWZfcnhfYW55X2NvbnRleHTigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCj4gICA0NDYgfCAgICAgICAgIG5ldGlmX3J4X2FueV9jb250ZXh0KHNrYik7Cj4gICAgICAg
fCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gCj4gSW5kZWVkLCBuZXRpZl9yeF9hbnlf
Y29udGV4dCBoYXMgYmVlbiBkcm9wcGVkIHNpbmNlIGtlcm5lbCA1LjE4Ogo+IGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvMjY1NTkyNmFlYTliZWVhNjJjOWJhODBjMDMy
NDg1NDU2ZmQ4NDhmMAo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLW1lc2gtbWlycm9yL2Jh
dG1hbi1hZHYvYmxvYi92MjAyMi4yL0NIQU5HRUxPRy5yc3QKPiAKPiBGaXhlczoKPiAgLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy81NDJiN2I5OWRhN2I3YTY1ZTZlMTFl
N2M3M2EyNjg1NmUzMjIyZTg5Cj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvYmF0bWFuLWFkdi9iYXRt
YW4tYWR2Lmhhc2ggfCA2ICsrKy0tLQo+ICBwYWNrYWdlL2JhdG1hbi1hZHYvYmF0bWFuLWFkdi5t
ayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9iYXRtYW4tYWR2L2JhdG1hbi1hZHYuaGFz
aCBiL3BhY2thZ2UvYmF0bWFuLWFkdi9iYXRtYW4tYWR2Lmhhc2gKPiBpbmRleCBjMDk4NjYzNzM5
Li5jNWFkZDRjZGVhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYmF0bWFuLWFkdi9iYXRtYW4tYWR2
Lmhhc2gKPiArKysgYi9wYWNrYWdlL2JhdG1hbi1hZHYvYmF0bWFuLWFkdi5oYXNoCj4gQEAgLTEs
NyArMSw3IEBACj4gLSMgRnJvbSBodHRwczovL2Rvd25sb2Fkcy5vcGVuLW1lc2gub3JnL2JhdG1h
bi9yZWxlYXNlcy9iYXRtYW4tYWR2LTIwMjEuNC9iYXRtYW4tYWR2LTIwMjEuNC50YXIuZ3ouc2hh
MQo+IC1zaGExICA4MGEzZTRkNzYzYjZiZjM1ZGI2ZTU2MWVkOWQ2Nzc1ZGM4NzRkN2M2ICBiYXRt
YW4tYWR2LTIwMjEuNC50YXIuZ3oKPiArIyBGcm9tIGh0dHBzOi8vZG93bmxvYWRzLm9wZW4tbWVz
aC5vcmcvYmF0bWFuL3JlbGVhc2VzL2JhdG1hbi1hZHYtMjAyMi4yL2JhdG1hbi1hZHYtMjAyMi4y
LnRhci5nei5zaGExCj4gK3NoYTEgIGUxODI5ZTEwZmMzN2VhNjc0YTIwY2I5YmExZDZjMTQ4MzA0
MmZiZmEgIGJhdG1hbi1hZHYtMjAyMi4yLnRhci5nego+ICAKPiAgIyBIYXNoIGZvciBsaWNlbnNl
IGZpbGVzCj4gLXNoYTI1NiAgY2ZmN2EyZjE2MDA0NWZkMGRiZjFmMWNkN2UzNWU5M2JmNDg5ZTgx
Y2I4Yjk1MDFiMzc1NmRhYTM5MWYzZWIxYiAgYmF0bWFuLWFkdi0yMDIxLjQudGFyLmd6Cj4gK3No
YTI1NiAgOGFjYTI3YzZmMTY4YjEzN2E3ZWQ3MDMxZDU4MTY5Mzk2YzFhOTdmOTU4YzJlYTk1Yjlj
MzBhOWI5MjU3NmZlMCAgYmF0bWFuLWFkdi0yMDIyLjIudGFyLmd6Cj4gIHNoYTI1NiAgY2VjYmY1
M2QxMTQ4ZTEzMjU2YWMyOWY4YjkwMDY1NWI3ZmM4ZGMxMmQ1OTkzOWE5NWJjMjMyM2VhMTc0NzAy
NSAgTElDRU5TRVMvcHJlZmVycmVkL0dQTC0yLjAKPiAgc2hhMjU2ICAzMjNjNTg3ZDBjY2YxMGUz
NzZmOGJmOWE3ZjMxZmI0Y2E2MDc4MTA1MTk0YjQyZTBiMWUwZWUyYmM5YmRlNzFmICBMSUNFTlNF
Uy9wcmVmZXJyZWQvTUlUCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmF0bWFuLWFkdi9iYXRtYW4t
YWR2Lm1rIGIvcGFja2FnZS9iYXRtYW4tYWR2L2JhdG1hbi1hZHYubWsKPiBpbmRleCA2YTFhYWE2
OTljLi5kMjc5Njk0YmY1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYmF0bWFuLWFkdi9iYXRtYW4t
YWR2Lm1rCj4gKysrIGIvcGFja2FnZS9iYXRtYW4tYWR2L2JhdG1hbi1hZHYubWsKPiBAQCAtNCw3
ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtQkFUTUFOX0FE
Vl9WRVJTSU9OID0gMjAyMS40Cj4gK0JBVE1BTl9BRFZfVkVSU0lPTiA9IDIwMjIuMgo+ICBCQVRN
QU5fQURWX1NJVEUgPSBodHRwczovL2Rvd25sb2Fkcy5vcGVuLW1lc2gub3JnL2JhdG1hbi9zdGFi
bGUvc291cmNlcy9iYXRtYW4tYWR2Cj4gIEJBVE1BTl9BRFZfTElDRU5TRSA9IEdQTC0yLjAsIE1J
VCAoYmF0bWFuX2Fkdi5oKQo+ICBCQVRNQU5fQURWX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFUy9w
cmVmZXJyZWQvR1BMLTIuMCBMSUNFTlNFUy9wcmVmZXJyZWQvTUlUCj4gLS0gCj4gMi4zNS4xCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
