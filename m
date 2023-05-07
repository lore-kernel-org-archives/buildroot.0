Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E0EC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 20:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662AF61321;
	Sun,  7 May 2023 20:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 662AF61321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKL16jRzdcyv; Sun,  7 May 2023 20:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9D660F51;
	Sun,  7 May 2023 20:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C9D660F51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5C621BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 994E48226F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 20:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994E48226F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFG7ySRbXDdV for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 20:13:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B1AD82244
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B1AD82244
 for <buildroot@buildroot.org>; Sun,  7 May 2023 20:13:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7D39319F57C;
 Sun,  7 May 2023 22:12:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 22:12:54 +0200
Date: Sun, 7 May 2023 22:12:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <20230507201254.GK252090@scaer>
References: <ed1bff77-5934-f09a-ab39-ca4eea6b4b12@threespeedlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed1bff77-5934-f09a-ab39-ca4eea6b4b12@threespeedlogic.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683490377;
 bh=ADvU2B/7Nb3m0Z6RMP1uRUiNkv3+E4hsNShporp4a9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lkntj8zVBJhdffMJSkIeN5ilZ1PvzUh06l7FMyp+azdnPo/I0ZJjru7I4or29bq4L
 mLMRAPVdmWcc7O27mgWyL79tCby/RpXpNXy7RkZ+AHAYX4PW72PxeK/njIDnaE9mzo
 cfpXEpb6OE8aeUk3cpGmF2dmssEIUc0giX4YUkvcQ+kZU1TZaOiWI30NrBEUprjepl
 7USNhKMiyz4omZFm+kg8JuVNFQm9ppDSO0pSVZ0JlgZK09FuDylrhNm9n6WEUevc12
 J5KLrCBP9+qD0OJrB0638jHMMago9iANvJL7cWU2x1DJ7PllVWUw5CGZJgNCz359QK
 fBM2eoLp6Bxag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lkntj8zV
Subject: Re: [Buildroot] Suitability for upstreaming - JupyterLab 4.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R3JhZW1lLCBBbGwsCgpPbiAyMDIzLTA1LTAyIDE0OjMzIC0wNzAwLCBHcmFlbWUgU21lY2hlciBz
cGFrZSB0aHVzbHk6Cj4gSnVweXRlckxhYiBpcyBhYm91dCB0byByZWxlYXNlIHZlcnNpb24gNC4w
LjAgWzFdLiBCZWNhdXNlIHRoZXkndmUKPiBzd2l0Y2hlZCB0byBoYXRjaGxpbmcgWzJdLCBpdCBz
ZWVtcyB0byBiZSBtdWNoIGVhc2llciB0byBwYWNrYWdlIHRoYW4KPiBpdCB1c2VkIHRvIGJlLiAo
TXkgcHJldmlvdXMgZXhwZXJpbWVudHMgcGFja2FnaW5nIGp1cHl0ZXJsYWIgb3IKPiBpcHl0aG9u
LW5vdGVib29rIHdlcmUgYmFmZmxpbmcgZmFpbHVyZXMuKQo+IAo+IEhhdmluZyBhc3NlbWJsZWQg
YSBtb3N0bHktd29ya2luZyBzZXQgb2YgYnVpbGRyb290IHBhY2thZ2VzIGZvcgo+IEp1cHl0ZXJM
YWIgNC4wLjByYzEsIEkgdGhpbmsgaXQnZCBiZSB1c2VmdWwgdG8gYXNrIGhvdyBhIHJlcXVlc3QK
PiB0byBpbmNsdWRlIGl0IGluIHVwc3RyZWFtIGJ1aWxkcm9vdCB3b3VsZCBiZSByZWNlaXZlZC4g
V2UgY2FuCj4gbWFpbnRhaW4gaXQgb3V0LW9mLXRyZWUsIGJ1dCBpZiBKdXB5dGVyTGFiIGlzIHVz
ZWZ1bCB1cHN0cmVhbSBJJ20KPiBoYXBweSB0byBncm9vbSBpdCBmb3IgaW5jbHVzaW9uLgoKRnJv
bSBteSB1bmRlcnN0YW5kaW5nLCBKdXB5dGVyIGlzIGEgbm90ZWJvb2ssIGFuZCB3aGF0IEkgdW5k
ZXJzdGFuZCBieQp0aGF0LCBpcyB0aGF0IGl0IGlzIGFuIGludGVyYWN0aXZlIHRvb2wgdG8gaXRl
cmF0ZSBvbiBzb21lIHByb2JsZW0gYXQKaGFuZCB1bnRpbCBpdCBnZXRzIGZpeGVkLCBvciB0byB1
c2UgYXMgdHV0b3JpYWwgdG8gZXhwbGFpbiBzb21lIHNwZWNpZmljCnByb2JsZW0tc29sdmluZy4K
CkV2ZW4gaWYgbXkgdW5kZXJzdGFuZGluZyBpcyBsaW1pdGVkLCBKdXB5dGVyIGlzIHN0aWxsIGEg
bm90ZWJvb2ssIGFuZApieSBpdHMgdmVyeSBuYXR1cmUsIGEgbm90ZWJvb2sgaXMgYSB2ZXJ5IGlu
dGVyYWN0aXZlIHRvb2wsIHNvIEkgZmFpbCB0bwpzZWUgaG93IGl0IGNhbiBmaXQgaW4gYW4gZW1i
ZWRkZWQgc3lzdGVtLi4uCgo+IFVuZm9ydHVuYXRlbHksIHRoZXJlIGFyZSBhIGxhcmdlIG51bWJl
ciBvZiBuZXcgUHl0aG9uICJzY2FmZm9sZGluZyIKPiBwYWNrYWdlcyB0aGF0IGFyZSByZXF1aXJl
ZC4gQXQgbGVhc3QgdGhlIGZvbGxvd2luZzoKWy0tU05JUC0tXQo+IEkgYW50aWNpcGF0ZSBzb21l
IGNoYWxsZW5nZXM6Cj4gLSBUaGUgbnVtYmVyIG9mIHBhY2thZ2VzIHByZXNlbnRzIGEgbWFpbnRl
bmFuY2UgbG9hZCwKCkl0J3Mgbm90IGEgc21hbGwgbGlzdCBpbmRlZWQsIGJ1dCB0aGVyZSBhcmUg
d29yc2Ugc3RhY2tzISA6LSkKCkFsc28sIGlmIHRoZXkgYXJlIHByb3BlciBweXRob21uIHBhY2th
Z2VzIG9uIFB5UEksIHdlIGhhdmUgYSB1dGlsaXR5CnNjcmlwdCB0aGF0IGNhbiBoZWxwY3JlYXRl
IEJ1aWxkcm9vdCBwYWNrYWdlczogLi91dGlscy9zY2FucHlwaQoKPiAtIFNvbWUgcGFja2FnZXMg
aGF2ZSBkdWJpb3VzIHZhbHVlIG91dHNpZGUgSnVweXRlciAoc2VuZDJ0cmFzaCkKCkl0IGlzIHBl
cmZlY3RseSBhY2NlcHRhYmxlIHRoYXQgYSBwYWNrYWdlIGlzIGFkZGVkIGFzIHRoZSBkZXBlbmRl
bmN5IG9mCmp1c3QgYSBzaW5nbGUgb3RoZXIgb25lLgoKPiAtIFNvbWUgKGp1cHl0ZXJsYWItcHln
bWVudHMpIGFyZSBzdGlsbCBtYXR1cmluZywKClN1cmUsIGJ1dCBpZiBKdXB5dGVyICh0aGUgbWFp
biBwYWNrYWdlKSByZWxpZXMgb24gdGhvc2UsIGFuZCB0aGV5IGFyZQpub3Qgb3B0aW9uYWwsIHRo
ZW4gdGhleSBhcmUgc3RhYmxlIGVub3VnaCBhcyBzZWVuIGZyb20gdXBzdHJlYW0sIGV2ZW4gaWYK
dGhleSBhcmUgbWFuZGF0b3J5IGZvciBqdXN0IGEgInRlY2hub2xvZ3kgcHJldmlldyIgZmVhdHVy
ZS4KCj4gLSBTb21lIHJlcXVpcmUgcGF0Y2hlcyBvciBieXBhc3NlcyB0byBidWlsZCBpbiBhIGJ1
aWxkcm9vdCBlbnZpcm9ubWVudAo+ICAgdGhhdCB3aWxsIG5lZWQgdG8gZXZvbHZlIGFzIHRoZSB1
cHN0cmVhbSB0cmVlIGRvZXMuCgpUaGUgYmVzdCBzb2x1dGlvbiBmb3IgdGhhdGlzIHRvIHNlbmQg
dGhvc2UgZml4ZXMgdXBzdHJlYW0hIDotKQoKPiBGaW5hbGx5LCBJIGRvbid0IGhhdmUgYSBnb29k
IHNlbnNlIGhvdyBhcHByb3ByaWF0ZSB0aGUgcHl0aG9uLXdoZWVsCj4gcGFja2FnaW5nIGlzLCBv
ciBob3cgaXQgd29ya3MgKHRoaXMgaXMgYSBob3N0IHBhY2thZ2Ugb25seSBhbmQgSSd2ZQo+IHBh
Y2thZ2VkIGl0IG5hw692ZWx5LikKCkFoLCBzbyB0aGlzIGlzIG5vdCBldmVuIGZvciB0aGUgdGFy
Z2V0IGRldmljZT8gV2hhdCBpcyB0aGUgcHVycG9zZSBvZgpoYXZpbmcgaXQgYXMgYSBob3N0LW9u
bHkgcGFja2FnZSwgdGhlbj8KCj4gSW4gc2hvcnQ6IGRvZXMgSnVweXRlckxhYiBiZWxvbmcgdXBz
dHJlYW1lZCBpbiBidWlsZHJvb3QsIG9yIGlzIGl0Cj4gdG9vIHNwZWNpYWxpemVkIHRvIGJlIGJy
b2FkbHkgdXNlZnVsPwoKIkJyb2FkIiBvciAibmFycm93IiB1c2UgaXMgdmVyeSBiYXNlZCBvbiB0
aGUgcGVyc3BlY3RpdmUgb25lIHNlZXMgdGhlCndvcmxkIGZyb20uLi4gU29tZXRoaW5nIEkgbWln
aHQgc2VlIGFzIGhhdmluZyBhIHZlcnkgbmFycm93IHVzZSwgb3RoZXJzCm1heSBzZWUgYXMgYmVp
bmcgdmVyeSBpbXBvcnRhbnQgYW5kIGNyaXRpY2FsIHRvIHRoZWlyIGZpZWxkLi4uCgpTbyBJIHdv
dWxkIG5vdCB3YW50IHRvIGRpc2NvdXJhZ2UgeW91IGZyb20gc3VibWl0dGluZywgb3IgZW5jb3Vy
YWdlIHlvdQppbnRvIHN1Ym1pdHRpbmcuLi4gSWYgeW91IGhhdmUgc29tZXRoaW5nIHRoYXQgd29y
a3MsIGFuZCB5b3UgY2FuIHByb3ZpZGUKYSBnb29kIHJlc29uIHRvIGhhdmUgaXQgaW4gQnVpbGRy
b290LCB0aGVuIGZlZWwgZnJlZSB0byBzZW5kIHBhdGNoZXMuCgpXaGF0IHdvcnJpZXMgbWUsIGlz
IHdoeSBpdCBpcyBhIGhvc3QgcGFja2FnZSwgYW5kIHdoYXQgaXRzIHVzZSBpbiB0aGlzCmNhc2Ug
aXMuIE1heWJlIGFuIGFuc3dlciB3b3VsZCBiZSBzb21ldGhpbmcgbGlrZToKCiAgICBXZSBuZWVk
IEp1cHl0ZXIgdG8gaW50ZXJwcmV0IG5vdGVib29rcywgdGhhdCBwcm9jZXNzIFtyYXctZGF0YV0g
aW50bwogICAgW29wdGltaXNlZC1kYXRhXSB1c2luZyBbZGF0YS1wcm9jZXNzXSwgYW5kIHdyaXR0
ZW4gYnkgdGhvc2UgcGVza3kKICAgIGRhdGEtc2NpZW50aXN0cyB3aG8gZG9uJ3Qga25vdyBiZXR0
ZXIgKHNuYXJrKS4KCihJIGtub3cgc29tZSBjb2xsZWFndWVzIHdpbGwgc25hcCBiYWNrIGF0IG1l
IHdoZW4gdGhleSByZWFkIHRoaXM6LV0pCgpBbHNvLCBhcyBhIGhvc3Qtb25seSBwYWNrYWdlLCBo
b3cgY2FuIHdlIHRlc3QgdGhhdCBpdCB3b3JrcywgdG8gdmFsaWRhdGUKdGhlIHBhY2thZ2luZywg
YW5kIHRvIGF2b2lkIHJlZ3Jlc3Npb25zIGluIHRoZSBmdXR1cmU/CgpSZWdhcmRzLApZYW5uIEUu
IE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
