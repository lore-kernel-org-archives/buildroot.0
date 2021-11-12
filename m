Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FC1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:34:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5C261057
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A5C261057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 148EB60665;
	Fri, 12 Nov 2021 19:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjRt0IwilH8D; Fri, 12 Nov 2021 19:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5872F61516;
	Fri, 12 Nov 2021 19:34:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 362ED1BF429
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CB9781D2D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jor7yUmkKw-h for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 19:34:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B1BA81854
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 19:34:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 629A819F5A7;
 Fri, 12 Nov 2021 20:33:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636745638;
 bh=WmB8V61ND7Kl1UqnR7kmVfKLPWLQN2lYuj2titnuFMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5Kq9DfSgvr4hHI0geu8Ei7hWQqweThDbnSaM3RIDOOefJT7cLjNr9QDV1AJVRAcn
 4/tvZhzA4yOv+qP/QontAF2cQSnPtzSJLoAbU48UHiDBpL5XkzFBwGVEAfroPN5ZBq
 n3SsTVa29UNdoQgxED+kRDyBz16GZ5dDIwrfMWYmjgDjt6DvuR9frbhOiNvKoFbLF3
 1+7lmzjONG0Py6gBeQaCMDr9YwANkYhZIRNg/u73zvyE64GiGma4NjyfFqzAYwMiNC
 E1gWI/1DxYi/qfaHyYTHAnawxjd+Q6LIpRdYkx2J25Johe+iOHt4dYFJmU+zvILHCf
 Sl895BhY3g89A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 20:33:54 +0100
Date: Fri, 12 Nov 2021 20:33:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: unixmania@gmail.com
Message-ID: <20211112193354.GB247986@scaer>
References: <20211112185909.1324077-1-unixmania@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112185909.1324077-1-unixmania@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/mksh: fix project URL in Config.in
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

Q2FybG9zLCBBbGwsCgpPbiAyMDIxLTExLTEyIDE1OjU5IC0wMzAwLCB1bml4bWFuaWFAZ21haWwu
Y29tIHNwYWtlIHRodXNseToKPiBGcm9tOiBDYXJsb3MgU2FudG9zIDx1bml4bWFuaWFAZ21haWwu
Y29tPgo+IAo+IEl0J3MgaHR0cHM6Ly93d3cubWlyYnNkLm9yZy9ta3NoLmh0bQoKLi4uIHdoaWNo
IGRvZXMgbm90IHN1cHBvcnQgVExTIDEuMiwgYW5kIHNvIHJlY2VudCBicm93c2VycyB3aGluZSBh
Ym91dAphbiBpbnNlY3VyZSBjb25uZWN0aW9uLCBsaWtlIEZpcmVmb3g6CgogICAgU2VjdXJlIENv
bm5lY3Rpb24gRmFpbGVkCgogICAgQW4gZXJyb3Igb2NjdXJyZWQgZHVyaW5nIGEgY29ubmVjdGlv
biB0byB3d3cubWlyYnNkLm9yZy4gUGVlciB1c2luZwogICAgdW5zdXBwb3J0ZWQgdmVyc2lvbiBv
ZiBzZWN1cml0eSBwcm90b2NvbC4KCiAgICBFcnJvciBjb2RlOiBTU0xfRVJST1JfVU5TVVBQT1JU
RURfVkVSU0lPTgoKICAgICogVGhlIHBhZ2UgeW91IGFyZSB0cnlpbmcgdG8gdmlldyBjYW5ub3Qg
YmUgc2hvd24gYmVjYXVzZSB0aGUKICAgICAgYXV0aGVudGljaXR5IG9mIHRoZSByZWNlaXZlZCBk
YXRhIGNvdWxkIG5vdCBiZSB2ZXJpZmllZC4KICAgICogUGxlYXNlIGNvbnRhY3QgdGhlIHdlYnNp
dGUgb3duZXJzIHRvIGluZm9ybSB0aGVtIG9mIHRoaXMgcHJvYmxlbS4KCiAgICBbTGVhcm4gbW9y
ZeKApl0KCiAgICBUaGlzIHdlYnNpdGUgbWlnaHQgbm90IHN1cHBvcnQgdGhlIFRMUyAxLjIgcHJv
dG9jb2wsIHdoaWNoIGlzIHRoZQogICAgbWluaW11bSB2ZXJzaW9uIHN1cHBvcnRlZCBieSBGaXJl
Zm94LiBFbmFibGluZyBUTFMgMS4wIGFuZCBUTFMgMS4xCiAgICBtaWdodCBhbGxvdyB0aGlzIGNv
bm5lY3Rpb24gdG8gc3VjY2VlZC4KCiAgICBUTFMgMS4wIGFuZCBUTFMgMS4xIHdpbGwgYmUgcGVy
bWFuZW50bHkgZGlzYWJsZWQgaW4gYSBmdXR1cmUKICAgIHJlbGVhc2UuCgpBbmQgaW5kZWVkLCBl
bmFibGluZyBUTFMgMS4wIGFuZCAxLjEgYWxsb3dzIHRoZSBjb25uZWN0aW9uIHRvIHN1Y2NlZWQu
Li4KVG9vIGJhZC4uLiA6LSgKCkFuZCBvZiBjb3Vyc2UsIHdlIGNhbid0IGRvd25sb2FkIGl0IGVp
dGhlciwgb2YgY291cnNlLCBidXQgZm9ydHVuYXRlbHksCnRoZXJlIGlzIHRoZSBmYWxsYmFjayB0
byBzLmIubyA6CgogICAgPj4+IG1rc2ggNTljIERvd25sb2FkaW5nCiAgICB3Z2V0IC0tcGFzc2l2
ZS1mdHAgLW5kIC10IDMgLU8gJy9ob21lL3ltb3Jpbi9kZXYvYnVpbGRyb290L08vYnVpbGQvLm1r
c2gtUjU5Yy50Z3ouNWlaTUhxL291dHB1dCcgJ2h0dHBzOi8vd3d3Lm1pcmJzZC5vcmcvTWlyT1Mv
ZGlzdC9taXIvbWtzaC9ta3NoLVI1OWMudGd6JwogICAgLS0yMDIxLTExLTEyIDIwOjI0OjAwLS0g
aHR0cHM6Ly93d3cubWlyYnNkLm9yZy9NaXJPUy9kaXN0L21pci9ta3NoL21rc2gtUjU5Yy50Z3oK
ICAgIFJlc29sdmluZyB3d3cubWlyYnNkLm9yZyAod3d3Lm1pcmJzZC5vcmcpLi4uIDYyLjEzOC4x
NDUuNTIsIDIwMDE6NDcwOjFmMGI6NzZjOjoxCiAgICBDb25uZWN0aW5nIHRvIHd3dy5taXJic2Qu
b3JnICh3d3cubWlyYnNkLm9yZyl8NjIuMTM4LjE0NS41Mnw6NDQzLi4uICBjb25uZWN0ZWQuCiAg
ICBPcGVuU1NMOiBlcnJvcjoxNDI1RjEwMjpTU0wgcm91dGluZXM6c3NsX2Nob29zZV9jbGllbnRf
dmVyc2lvbjp1bnN1cHBvcnRlZCBwcm90b2NvbAogICAgVW5hYmxlIHRvIGVzdGFibGlzaCBTU0wg
Y29ubmVjdGlvbi4KICAgIHdnZXQgLS1wYXNzaXZlLWZ0cCAtbmQgLXQgMyAtTyAnL2hvbWUveW1v
cmluL2Rldi9idWlsZHJvb3QvTy9idWlsZC8ubWtzaC1SNTljLnRnei5valNkdUgvb3V0cHV0JyAn
aHR0cDovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9ta3NoL21rc2gtUjU5Yy50Z3onCiAgICAtLTIw
MjEtMTEtMTIgMjA6MjQ6MDEtLSAgaHR0cDovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9ta3NoL21r
c2gtUjU5Yy50Z3oKICAgIFJlc29sdmluZyBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQgKHNvdXJjZXMu
YnVpbGRyb290Lm5ldCkuLi4gMTcyLjY3LjcyLjU2LCAxMDQuMjYuMS4zNywgMTA0LjI2LjAuMzcs
IC4uLgogICAgQ29ubmVjdGluZyB0byBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQgKHNvdXJjZXMuYnVp
bGRyb290Lm5ldCl8MTcyLjY3LjcyLjU2fDo4MC4uLiBjb25uZWN0ZWQuCiAgICBIVFRQIHJlcXVl
c3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9LCgpNZWguLi4gOi0oCgpTaG91bGQg
d2Ugc3dpdGNoIG92ZXIgdG8gdXNpbmcgcGxhaW4gaHR0cCBpbnN0ZWFkPyBJdCBpcyBub3QgbXVj
aCBsZXNzCnNlY3VyZSB0aGFuIFRMUyAxLjAgb3IgMS4xLCBmb3Igd2hpY2ggdGhlcmUgYXJlIGtu
b3duIGFuZCBwcmFjdGljYWwKYXR0YWNrcywgYW5kIHBsYWluIGh0dHAgd2lsbCB3b3JrLiBBbHNv
LCB3ZSBkbyBoYXZlIHRoZSBoYXNoZXMsIHNvIHdlCmNhbiBhdCBsZWFzdCBhc3Nlc3MgdGhlIGlu
dGVncml0eSBhbmQgYXV0aGVudGljaXR5IG9mIHRoZSBkb3dubG9hZC4KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgo+IFNpZ25lZC1vZmYtYnk6IENhcmxvcyBTYW50b3MgPHVuaXhtYW5pYUBnbWFp
bC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvbWtzaC9Db25maWcuaW4gfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL21rc2gvQ29uZmlnLmluIGIvcGFja2FnZS9ta3NoL0NvbmZpZy5pbgo+IGluZGV4IGU2
Y2NjOTA2NDYuLjA5OGY5ODQwZTUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ta3NoL0NvbmZpZy5p
bgo+ICsrKyBiL3BhY2thZ2UvbWtzaC9Db25maWcuaW4KPiBAQCAtMjIsNCArMjIsNCBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfTUtTSAo+ICAJICBvcGVyYXRpbmcgZW52aXJvbm1lbnRzCj4gIAkgICh0
aHVzIGluY2x1ZGluZyBwYXRjaGVzIGZyb20gcGRrc2ggb24gZS5nLiBEZWJpYW4pLgo+ICAKPiAt
CSAgaHR0cDovL21pcmJzZC5kZS9ta3NoCj4gKwkgIGh0dHBzOi8vd3d3Lm1pcmJzZC5vcmcvbWtz
aC5odG0KPiAtLSAKPiAyLjI3LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
