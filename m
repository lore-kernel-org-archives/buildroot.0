Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A701EC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 20:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB3160FCB;
	Sun, 21 May 2023 20:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB3160FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMpb8HIeBN2F; Sun, 21 May 2023 20:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5395A605EA;
	Sun, 21 May 2023 20:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5395A605EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20D021BF3C1
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 917C2414CE
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 917C2414CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKWh7toU0Yzc for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 20:00:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33D7417C1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D33D7417C1
 for <buildroot@buildroot.org>; Sun, 21 May 2023 20:00:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a137:d754:ea62:50f7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 117C65FFC1;
 Sun, 21 May 2023 22:00:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 22:00:26 +0200
Date: Sun, 21 May 2023 22:00:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230521200026.GC621937@scaer>
References: <20230520210153.3944842-1-dario.binacchi@amarulasolutions.com>
 <20230521151038.GA171618@scaer> <20230521151644.GC171618@scaer>
 <CABGWkvo-xhQAJWc2+Jqn=ni-kzH7fqqzOnzwkGLVhe7_wn2GWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvo-xhQAJWc2+Jqn=ni-kzH7fqqzOnzwkGLVhe7_wn2GWQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684699230;
 bh=yZ2335EFG14Y2maNgenEpLzVpo08OHIQJRttII2UYj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nkrrhc0mBYX+5hUw5wF12JgQuv1VLf646YoO42AK5WQ/EtjayFjOB9g8nlDAfdPHs
 ln/rTUliyFrBAyn4TlwqLJzBXRot1KfI3FgJhDx36uZuGKoXJ/7cVMXVvT53gFLzPW
 Xi+qTWv6eJLfbhRzZpbEmLYmesz1+cx3TA4HWgaeziSSOBcNrD9rcbPz8IwVil7to/
 in6TIHXTcrkgoYgofcBmaGLnZlnxDbJa5aFbLCXhvn24n6rjZgXY/44P/T7HR2lkMP
 Yb979Hl6QWjd1jshNh2P0dBn7OhSYZAYayzrqmnDUfeBYiUhIPE7HRc2GdCT+XfHSV
 E4MdGdUWsFoKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nkrrhc0m
Subject: Re: [Buildroot] [PATCH 1/1] package/libmnl: fix build failure
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
Cc: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjMtMDUtMjEgMjA6MzYgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIE1heSAyMSwgMjAyMyBhdCA1OjE24oCvUE0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4gT24gMjAyMy0wNS0yMSAx
NzoxMCArMDIwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4gPiA+IE9uIDIwMjMtMDUt
MjAgMjM6MDEgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNwYWtlIHRodXNseToKPiA+ID4gPiBUaGUg
YWRkZWQgcGF0Y2ggaXMgYW4gYWRhcHRhdGlvbiBvZiB0aGUgb25lIHN1Ym1pdHRlZCB0byB0aGUg
bGlibW5sCj4gPiA+ID4gcHJvamVjdC4KPiA+ID4gPgo+ID4gPiA+IEZpeGVzOgo+ID4gPiA+IC0g
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMzZjMTYxOWM4YjAyZWZlYWY5
Y2FlYmFlOGJiNWMzZWI4YTI2MjM4Yi8KPiA+ID4gPiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzLzE1ZjZkYzEwM2VlYzdiZGViNTAyMGFjYmMwYWU5OWRjOTdjMDBlNGUv
Cj4gPiA+IFRob3NlIGZhaWx1cmVzIGFyZSBkdWUgdG8gaW1wcm9wZXIgZGVwZW5kZW5jeSBvbiBr
ZXJuZWwgaGVhZGVyczoKPiA+IFN0aWxsLCB0aGUgcHJvcGVyIHdheSBpcyB0byBhZGQgYSBkZXBl
bmRlbmN5IG9uIGtlcm5lbCBoZWFkZXJzID49IDQuMTEKPiA+IGZvciB0aGUgbGlibW5sIGV4YW1w
bGVzLgo+IEluIHRoZSBsaWJtbmwgcmVwb3NpdG9yeSwgdGhlcmUgYXJlIGNvbW1pdHMgYWRkaW5n
IGtlcm5lbCBoZWFkZXJzIHRvIGF2b2lkCj4gZGVwZW5kZW5jeSBpc3N1ZXMuIFRoZSBDQU4gaGVh
ZGVyIHdhcyBtaXNzaW5nIGJlY2F1c2UgdGhlIGFkZGVkIGV4YW1wbGUKPiB3YXMgdGhlIGZpcnN0
IG9uZSByZWxhdGVkIHRvIENBTi4gSXQncyB3b3J0aCBub3RpbmcgdGhhdCBldmVuIHRoZQo+IGNh
bi11dGlscyBwYWNrYWdlCj4gc3luY2hyb25pemVzIGl0cyBpbnRlcm5hbCBoZWFkZXJzIHdpdGgg
dGhlIGtlcm5lbCBoZWFkZXJzIHdoZW5ldmVyIHRoZXkgY2hhbmdlLgo+IEluIGZhY3QsIGluIHRo
ZSBjYW4tdXRpbHMgcGFja2FnZSBpbiBidWlsZHJvb3QsIHRoZXJlIGFyZSBubwo+IGRlcGVuZGVu
Y2llcyBvbiBrZXJuZWwKPiBoZWFkZXJzLiBJZiB5b3UgYWdyZWUsIEkgd291bGQgd2FpdCB0byB2
ZXJpZnkgaWYgdGhlIHBhdGNoIEkgc3VibWl0dGVkCj4gdG8gbGlibW5sIGlzCj4gYWNjZXB0ZWQu
IElmIGl0IGlzLCB3ZSBjYW4gYXBwbHkgb25seSB0aGF0IHBhdGNoLgo+IAo+IFdoYXQgZG8geW91
IHRoaW5rPwoKSSB0aGluayB0aGF0IEkgc2hvdWxkIG5vdCBoYXZlIGFwcGxpZWQgdGhlIENBTiBl
eGFtcGxlIHBhdGNoLCBhcyBpdCB3YXMKY2xlYXJseSBhIGZlYXR1cmUgcGF0Y2g7IEkgb25seSBh
cHBsaWVkIGl0IGJlY2F1c2UgdGhlIHBhdGNoIHdhcyBhbHJlYWR5CmFwcGxpZWQgdXBzdHJlYW0s
IHNvIGl0IHdhcyBhIHBhdGNoIHdlIHdvdWxkIG5vdCBoYXZlIHRvIGNhcnJ5IGZvcmV2ZXIsCiph
bmQqIGV4YW1wbGVzIGFyZSBqdXN0IHRoYXQsIGV4YW1wbGVzLCBhbmQgYXJlIG5vdCBuZWVkZWQg
Zm9yIGEKZnVuY3Rpb25hbCBwYWNrYWdlLCAqYW5kKiBpdCBsb29rZWQgcHJldHkgc2VsZi1jb250
YWluZWQuCgpIb3dldmVyLCBpdCBiIHJlYWtzIHRoZSBidWlsZCwgc28gdGhpcyBpcyBub3Qgbmlj
ZS4KClNvLCBteSBwb3NpdGlvbiBpcyB0aGF0IHdlIHNob3VsZCByZWFsbHkgYWRkIHRoZSBkZXBl
bmRlbmN5IG9uIGtlcm5lbApoZWFkZXJzIGluIG1hc3RlciwgYW5kIGlmL3doZW4gdXBzdHJlYW0g
YXBwbGllcyB0aGUgaGVhZGVycyBpbmNsdWRlCnBhdGNoLCB0aGVuIHdlIGNhbiBzZWUgdG8gcmVs
YXggdGhlIHJlc3RyaWN0aW9uLgoKQSBzbGlnaHRseSBsZXNzIHJlc3RyaWN0aXZlIHNvbHV0aW9u
IHdvdWxkIGJlIHRvIG9ubHkgaW5jbHVkZSB0aGUgQ0FOCmV4YW1wbGUgd2hlbiB0aGUgdG9vbGNo
YWluIGhlYWRlcnMgYXJlIGZpdHRpbmcsIGUuZy4gc29tZXRoaW5nIGxpa2UKKHdpdGggZnVsbCBy
ZW9yZ2FuaXNhdGlvbiBvZiBleGFtcGxlcyB3aGljaCBJIHJlZnJhaW5lZCBmcm9tIGRvaW5nIHdo
ZW4KYXBwbHlpbmcgeW91ciBwcmV2aW91cyBwYXRjaCAyNzE3NDVjMzdhMDQsIGJ1dCBub3cgd2Un
ZCBuZWVkIGl0IHRvIGJlCmV2ZW4gY2xlYW5lci4uLik6CgogICAgIExJQk1OTF9FWEFNUExFU19n
ZW5sID0gZ2VubC1mYW1pbHktZ2V0IGdlbmwtZ3JvdXAtZXZlbnRzCgogICAgIExJQk1OTF9FWEFN
UExFU19rb2JqZWN0ID0ga29iamVjdC1ldmVudAoKICAgICBMSUJNTkxfRVhBTVBMRVNfbmV0Zmls
dGVyID0gXAogICAgICAgICBuZmN0LWNyZWF0ZS1iYXRjaCBcCiAgICAgICAgIG5mY3QtZGFlbW9u
IFwKICAgICAgICAgbmZjdC1kdW1wIFwKICAgICAgICAgbmZjdC1ldmVudCBcCiAgICAgICAgIG5m
LWxvZyBcCiAgICAgICAgIG5mLXF1ZXVlCgogICAgIExJQk1OTF9FWEFNUExFU19ydG5sID0gXAog
ICAgICAgICBydG5sLWFkZHItYWRkIFwKICAgICAgICAgcnRubC1hZGRyLWR1bXAgXAogICAgICAg
ICBydG5sLWxpbmstZHVtcCBcCiAgICAgICAgIHJ0bmwtbGluay1kdW1wMiBcCiAgICAgICAgIHJ0
bmwtbGluay1kdW1wMyBcCiAgICAgICAgIHJ0bmwtbGluay1ldmVudCBcCiAgICAgICAgIHJ0bmwt
bGluay1zZXQgXAogICAgICAgICBydG5sLW5laWdoLWR1bXAgXAogICAgICAgICBydG5sLXJvdXRl
LWFkZCBcCiAgICAgICAgIHJ0bmwtcm91dGUtZHVtcCBcCiAgICAgICAgIHJ0bmwtcm91dGUtZXZl
bnQKCiAgICAgaWZlcSAoJChCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNF8xMSkseSkK
ICAgICBMSUJNTkxfRVhBTVBMRVNfcnRubCArPSBydG5sLWxpbmstY2FuCiAgICAgZW5kaWYKCiAg
ICAgTElCTU5MX0VYQU1QTEVTX0lOU1RBTExfVEFSR0VUUyA9IFwKICAgICAgICAgJChmb3JlYWNo
IHQsIFwKICAgICAgICAgICAgIGdlbmwga29iamVjdCBuZXRmaWx0ZXIgcnRubCwgXAogICAgICAg
ICAgICAgJChhZGRwcmVmaXggZXhhbXBsZXMvJCh0KS8sJChMSUJNTkxfRVhBTVBMRVNfJCh0KSkp
KQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+IERhcmlv
Cj4gPgo+ID4gUmVnYXJkcywKPiA+IFlhbm4gRS4gTU9SSU4uCj4gPgo+ID4gLS0KPiA+IC4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCj4gPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+ID4gfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKPiA+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gPiB8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAo+ID4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKPiAKPiAKPiAKPiAt
LSAKPiAKPiBEYXJpbyBCaW5hY2NoaQo+IAo+IFNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9w
ZXIKPiAKPiBkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiAKPiAKPiBBbWFydWxhIFNvbHV0aW9ucyBTUkwK
PiAKPiBWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKPiAKPiBU
LiArMzkgMDQyIDI0MyA1MzEwCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IAo+IHd3dy5h
bWFydWxhc29sdXRpb25zLmNvbQoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
