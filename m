Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86B5E776C2
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 20:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51E5E40530;
	Mon,  2 Oct 2023 20:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51E5E40530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SQ5Hure7ELo; Mon,  2 Oct 2023 20:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84A77416F6;
	Mon,  2 Oct 2023 20:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A77416F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66E6C1BF5F8
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 20:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D395610D7
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 20:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D395610D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkC2Mz6guu9p for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 20:43:40 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30EE06103A
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 20:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30EE06103A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:71b1:17da:abc1:f019])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 95A3360132;
 Mon,  2 Oct 2023 22:43:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Oct 2023 22:43:28 +0200
Date: Mon, 2 Oct 2023 22:43:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20231002204328.GC2957@scaer>
References: <20230802111447.41714-1-thomas@devoogdt.com>
 <20230806141506.GS421096@scaer> <20231002173310.GA2957@scaer>
 <CACXRmJgyWvL4jr7-mtWJgCCYGFE3ookcU3TwoNE5bHFLjXaM6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACXRmJgyWvL4jr7-mtWJgCCYGFE3ookcU3TwoNE5bHFLjXaM6Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696279416;
 bh=0SUda+6xmcxVJWWs8fpMNzcssmhi5NVmgpFl/YQukYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c3ZOrhcxAHi37WHybWb9oiiBbVXyXkIKMY9dXvmwslOObXgwSEZQc4yr+JQqcCsqR
 3QXpe7glTE76jBNhWd0SYKG4yu050u+SytjO7ONN5FfVTQpFPUpCfJ/abtflW2ti2v
 Na1Tn14EknKS+DSY9Ry11GKB1d2U0Zv2mKO65oS+lLTC5xde0YtdhYfGzTwi3CBaCu
 Gfk4t2aTXoSHnrWzHyzIvLyvRh66szJlZaqaXVC85bIbOg0zw9wX1TMeuQ8++sKffA
 M6i/KC1/XP/v9bIH1ZINe8SPTgbaFoTyoeEcypHMS56vSY2OWDFAYzv24jX3nTY4YB
 R0CZsPTvarm/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c3ZOrhcx
Subject: Re: [Buildroot] [PATCH v6 1/4] pkg-cmake: add option to select the
 Ninja generator
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, John Keeping <john@metanate.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIzLTEwLTAyIDIyOjI2ICswMjAwLCBUaG9tYXMgRGV2b29nZHQg
c3Bha2UgdGh1c2x5Ogo+IEkgd2lsbCBjaGVjayB3aGF0IEkgY2FuIGRvLiBBIHF1aWNrIHNlYXJj
aCBnaXZlcyBtZSB0aGlzIGZsYWc6Cj4gWzFdaHR0cHM6Ly9jbWFrZS5vcmcvY21ha2UvaGVscC9s
YXRlc3QvdmFyaWFibGUvQ01BS0VfU0tJUF9JTlNUQUxMX0FMTF9ERVBFTkRFTkNZLmh0bWwgLAo+
IHdoaWNoIGlzIHByb2JhYmx5IHdoYXQgd2Ugd2FudC4gT3RoZXJ3aXNlIEkgZG9uJ3Qgc2VlIG11
Y2ggYWRkaXRpb25hbCBpbnN0YWxsIG9wdGlvbnMuCgpJZiBJIHVuZGVyc3Rvb2QgaXQgcHJvcGVy
bHksIHRoaXMgbWFrZXMgJ2luc3RhbGwnIGJlaGF2ZSBhcwonaW5zdGFsbC9mYXN0JyBieSBkZWZh
dWx0LCBzbyBsb29rcyBsaWtlIHdlIHNob3VsZCBpbmRlZWQgYmUgcGFzc2luZwp0aGlzIG9wdGlv
biBpbnN0ZWFkLiBJZiB0aGF0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgZm9yIHRoZSBuaW5qYSBjYXNl
LAp0aGVuIHdlJ2Qgc2V0IGl0IG9ubHkgZm9yIHRoZSBtYWtlZmlsZXMgY2FzZS4KCj4gQW5kIGNh
bGxpbmcgdGhlIG1ha2UgaW5zdGFsbC9mYXN0IHRhcmdldAo+IGRpcmVjdGx5IGlzIG5vdCB2ZXJ5
IGdlbmVyYXRvciBnZW5lcmljLgoKSWYgd2UgcmVpbnN0YXRlICdpbnN0YWxsL2Zhc3QnIGFzIGl0
IHdhcyBwcmV2aW91c2x5LCB3ZSdkIGRvIHRoYXQgb25seQpmb3IgdGhlIG1ha2VmaWVscyBjYXNl
LCBvZiBjb3Vyc2UuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBLciwKPiBUaG9tYXPCoAo+
IE9wIG1hIDIgb2t0LiAyMDIzIDE5OjMzIHNjaHJlZWYgWWFubiBFLiBNT1JJTiA8IFsyXXlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPjoKPiAKPiAgIFRob21hcywgQWxsLAo+IAo+ICAgT24gMjAyMy0w
OC0wNiAxNjoxNSArMDIwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4gICA+IE9uIDIw
MjMtMDgtMDIgMTM6MTQgKzAyMDAsIFRob21hcyBEZXZvb2dkdCBzcGFrZSB0aHVzbHk6Cj4gICA+
ID4gRnJvbTogVGhvbWFzIERldm9vZ2R0IDwgWzNddGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4K
PiAgID4gPiBDbWFrZSBzdXBwb3J0cyBtdWx0aXBsZSBnZW5lcmF0b3JzLiBOaW5qYSBpcyBhIHNt
YWxsIGJ1aWxkIHN5c3RlbSB3aXRoIGEKPiAgID4gPiBmb2N1cyBvbiBzcGVlZC4gSXQgaXMgbWFp
bmx5IHVzZWQgd2l0aCB0aGUgbWVzb24gYnVpbGQgc3lzdGVtLCBidXQgYWxzbwo+ICAgPiA+IGNt
YWtlIGhhcyB2ZXJ5IGdvb2Qgc3VwcG9ydCBmb3IgaXQuIFRoaXMgYWRkcyBvcHRpb25hbCBzdXBw
b3J0IGZvciB0aGUKPiAgID4gPiBOaW5qYSBidWlsZCBzeXN0ZW0uCj4gICBbLS1TTklQLS1dCj4g
ICA+IFBsZWFzZSByZXZpZXcgdGhlIG5ldyBjb2RlLiBJZiBJIGJyb2tlIHNvbWV0aGluZywgcGxl
YXNlIHNlbmQgZm9sbG93dXAKPiAgID4gZml4dXAgcGF0Y2hlcyB3aXRoIGFwcHJvcHJpYXRlIGV4
cGxhbmF0aW9ucyAodGhlcmUncyBhIGtpbmQgb2YgZMOpasOgLXZ1Cj4gICA+IGhlcmUuLi4pCj4g
Cj4gICBXaGlsZSByZXZpZXdpbmcgYW5vdGhlciBwYXRjaCwgSSBub3cgbm90aWNlZCB0aGF0IHdl
IGRpZCBsb3NlIHNvbWV0aGluZwo+ICAgd2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoaXMgbmlu
amEgYmFja2VuZC4gdGhhdCBJIHRvdGFsbHkgbWlzc2VkIHdoZW4KPiAgIEkgYXBwbGllZCBpdC4K
PiAKPiAgIEluZGVlZCwgcHJldmlvdXNseSwgdGhlIGluc3RhbGwgc3RlcCB3YXMgZG9uZSB3aXRo
IHRoZSBpbnN0YWxsL2Zhc3QKPiAgIHJ1bGU6Cj4gCj4gICDCoCDCoCAkKDIpX0lOU1RBTExfU1RB
R0lOR19PUFRTwqAgwqAgwqAgPz0gREVTVERJUj0kJChTVEFHSU5HX0RJUikgaW5zdGFsbC9mYXN0
Cj4gICDCoCDCoCAkKDIpX0lOU1RBTExfVEFSR0VUX09QVFPCoCDCoCDCoCDCoD89IERFU1RESVI9
JCQoVEFSR0VUX0RJUikgaW5zdGFsbC9mYXN0Cj4gCj4gICBCdXQgdGhpcyBnb3QgcmVtb3ZlZCB3
aXRoIHlvdXIgcGF0Y2gsIHdpdGggbm90aGluZyB0byByZXBsYWNlIGl0Lgo+IAo+ICAgU2VlIGNv
bW1pdCBkZmNjMThmODRiMGQgKHBrZy1jbWFrZTogU2tpcCBjb21waWxhdGlvbiBpbiBpbnN0YWxs
YXRpb24KPiAgIHN0ZXApIGZvciB0aGUgcmF0aW9uYWxlIG9mIHVzaW5nIGluc3RhbGwvZmFzdC4K
PiAKPiAgIENvdWxkIHlvdSBsb29rIGludG8gcmVzdG9yaW5nIHRoaXMsIHBsZWFzZT8KPiAKPiAg
IFJlZ2FyZHMsCj4gICBZYW5uIEUuIE1PUklOLgo+IAo+ICAgLS0KPiAgIC4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCj4gICB8wqAgWWFubiBFLiBNT1JJTsKgIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gICB8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlwqAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR07CoCDCoCDCoHzCoCBfX1/C
oCDCoCDCoCDCoCDCoCDCoAo+ICAgwqAgwqB8Cj4gICB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06wqAgWMKgIEFHQUlOU1TCoCDCoCDCoCB8wqAgXGUvwqAgVGhlcmUgaXMg
bm/CoCB8Cj4gICB8IFs0XWh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUzCoCDCoCB8wqAgwqB2wqAgwqBjb25zcGlyYWN5LsKgIHwKPiAgICctLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCj4gCj4gTGlua3M6Cj4gMS4gaHR0cHM6Ly9jbWFrZS5vcmcvY21ha2Uv
aGVscC9sYXRlc3QvdmFyaWFibGUvQ01BS0VfU0tJUF9JTlNUQUxMX0FMTF9ERVBFTkRFTkNZLmh0
bWwKPiAyLiBtYWlsdG86eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnIKPiAzLiBtYWlsdG86dGhvbWFz
LmRldm9vZ2R0QGJhcmNvLmNvbQo+IDQuIGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8KCi0t
IAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
