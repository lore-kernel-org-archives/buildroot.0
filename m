Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170ABC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B419D815CE;
	Mon,  3 Feb 2025 14:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x0SO-i1WFJu; Mon,  3 Feb 2025 14:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9F0B81757
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F0B81757;
	Mon,  3 Feb 2025 14:05:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EA121A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C4E1400C4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MF9u89td7LFJ for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:05:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C90B409B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C90B409B1
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C90B409B1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:05:07 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id BEEAD440F42;
 Mon,  3 Feb 2025 15:53:58 +0200 (IST)
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250203-ramsmp-fix-url-v1-1-26c570b209a8@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Mon, 03 Feb 2025
 12:19:36 +0100")
References: <20250203-ramsmp-fix-url-v1-1-26c570b209a8@armadeus.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 03 Feb 2025 15:58:59 +0200
Message-ID: <874j1byvrw.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1738590838;
 bh=q73pXrqnms/5uI6Io8YyaY8RT24yI6K6rtb6uea65V8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=r7JZvw9nHxj0PjOo6sy3v80P75C/Jxk+dIQPzvlCq6rODlVi1mex8z191Rcg6e1pu
 125TEplWKBJ0rV+embfJ7Bo+Wsoji42od5UYal1sa7rwd9riEcl+3rzUs/qMeEZSpn
 h0uenIh72qTN3pbl8ECeYwPpsbWhXBtLoPmW/aoJLveHOaxxPcOl+LlZwdsjjl1r77
 pA5eF3jGu8jumBcJD5nuxq0tcreC7sqN6odTyDBMN4iS3SjAxOerbiD9LQ6kB4N2tJ
 R0JiMkXy2fvzPaidXB0I1JPxcAzRfRAlYGXmPvkVQKWO3erB5dkOpZ3nJJAtZoeyQa
 j8vOvKPcJeaBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=r7JZvw9n
Subject: Re: [Buildroot] [PATCH] package/ramsmp: switch to a Github repo
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU8OpYmFzdGllbiwKCk9uIE1vbiwgRmViIDAzIDIwMjUsIFPDqWJhc3RpZW4gU3p5bWFuc2tp
IHdyb3RlOgo+IFRoZSBwYWNrYWdlIGlzIG5vIG1vcmUgYXZhaWxhYmxlIGF0IGFsYXNpci5jb20u
Cj4gU29tZW9uZSBwdXRzIHRoZSBwYWNrYWdlIG9uIGEgZ2l0aHViIHJlcG9zaXRvcnkgc28gdXNl
IHRoYXQgcmVwb3NpdG9yeS4KPgo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tp
IDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAtLS0KPiBJIGhhdmUgY2hlY2tl
ZCB0aGF0IHRoZSBjb250ZW50IGFyZSB0aGUgc2FtZToKPgo+ICQgZGlmZiAtciByYW1zbXAtMy41
LjAvIHJhbXNwZWVkLXNtcC02YWYzMzMwYWEzYjE1ZjZlNzllZGE0NWQwYTg4ZmU1MjU0ZDQ2Mzc3
Lwo+IE9ubHkgaW4gcmFtc21wLTMuNS4wLzogdGVtcAo+Cj4gdGVtcCBkaXIgaXMgZW1wdHkuCj4g
LS0tCj4gIHBhY2thZ2UvcmFtc21wL3JhbXNtcC5oYXNoIHwgMSArCj4gIHBhY2thZ2UvcmFtc21w
L3JhbXNtcC5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmFtc21wL3JhbXNtcC5o
YXNoIGIvcGFja2FnZS9yYW1zbXAvcmFtc21wLmhhc2gKPiBpbmRleCBjNWUyOWEzOTAwYjFmZmM1
M2I5OWU5MGNjZGYzNmRkN2NiYjA3NWZmLi5mNmU3YmRiYjU2YjRiMmMxMTZhMGQ5MDVjNzlkZjBl
YThmZTkwNDU2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcmFtc21wL3JhbXNtcC5oYXNoCj4gKysr
IGIvcGFja2FnZS9yYW1zbXAvcmFtc21wLmhhc2gKPiBAQCAtMSwzICsxLDQgQEAKPiAgIyBMb2Nh
bGx5IGNvbXB1dGVkCj4gK3NoYTI1NiAyMjBmMDU2MDE5ZjFkYmY4OWNiYzAyZDU5MDJlYTY2Y2Mz
MWMxY2E1OWQ5NzU1ZjE5YTAxMzg1NjI0ZTVkMjNiCj4gcmFtc21wLTZhZjMzMzBhYTNiMTVmNmU3
OWVkYTQ1ZDBhODhmZTUyNTRkNDYzNzcudGFyLmd6Cj4gIHNoYTI1NiAgMzlmYjE1NDkzZmIzYzI5
MzU3NTc0NmQ1NmY2YWI5ZmFhYTFkODc2ZDhiMWYwZDhlNWE0MDQyZDJhY2U5NTgzOSAgcmFtc21w
LTMuNS4wLnRhci5negoKVGhpcyBoYXNoIGxpbmUgbG9va3MgcmVkdW5kYW50IG5vdy4KCmJhcnVj
aAoKPiAgc2hhMjU2ICAyYzMwOGNmZmJhYjAxNzYyZjhmNmIxMTcyNTcyNWEyMjcwODA3NDZlZjg2
NWYyNzU2YzljOWUxNTkxZGRkYWFkICBMSUNFTkNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmFt
c21wL3JhbXNtcC5tayBiL3BhY2thZ2UvcmFtc21wL3JhbXNtcC5tawo+IGluZGV4IDYwOTgzNzZk
YTU5NjcyNTk2OWJjNDIzNDFiNjliMDkzODVhMDA3OWMuLmY4ZGU2YzkzNmNlMjJlOGUwNWQ2ZjA0
MWFjNmM0ZmI1NTIxNjQ3ZTUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9yYW1zbXAvcmFtc21wLm1r
Cj4gKysrIGIvcGFja2FnZS9yYW1zbXAvcmFtc21wLm1rCj4gQEAgLTQsOCArNCw4IEBACj4gICMK
PiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLVJBTVNNUF9WRVJTSU9OID0gMy41LjAK
PiAtUkFNU01QX1NJVEUgPSBodHRwOi8vd3d3LmFsYXNpci5jb20vc29mdHdhcmUvcmFtc3BlZWQK
PiArUkFNU01QX1ZFUlNJT04gPSA2YWYzMzMwYWEzYjE1ZjZlNzllZGE0NWQwYTg4ZmU1MjU0ZDQ2
Mzc3Cj4gK1JBTVNNUF9TSVRFID0gJChjYWxsIGdpdGh1YixjcnV2b2xvLHJhbXNwZWVkLXNtcCwk
KFJBTVNNUF9WRVJTSU9OKSkKPiAgUkFNU01QX0FSQ0ggPSAkKGlmICQoQlIyX2kzODYpLGkzODYp
JChpZiAkKEJSMl94ODZfNjQpLHg4Nl82NCkKPiAgUkFNU01QX0xJQ0VOU0UgPSBBbGFzaXIgTGlj
ZW5zZQo+ICBSQU1TTVBfTElDRU5TRV9GSUxFUyA9IExJQ0VOQ0UKPgo+IC0tLQo+IGJhc2UtY29t
bWl0OiA4NTM3NmE3MTgxNGVlZmIwMDIxMmNhYTZiMmQ1MjZmY2RkZmJiMDg0Cj4gY2hhbmdlLWlk
OiAyMDI1MDIwMy1yYW1zbXAtZml4LXVybC0yZTJlZTU3MjhiYzIKPgo+IEJlc3QgcmVnYXJkcywK
Ci0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAtIGJhcnVjaEB0
a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwg
LQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
