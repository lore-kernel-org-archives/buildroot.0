Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62F1C3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7492360612;
	Thu, 18 Jul 2024 20:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNrK0aSRVGqa; Thu, 18 Jul 2024 20:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 711FF60E77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 711FF60E77;
	Thu, 18 Jul 2024 20:53:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58FEE1BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4630A40F3C
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wZZd-OCwPXW for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D21B140F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21B140F3B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D21B140F3B
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:53:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5rO-1shpoU2sV6-00Yh4J; Thu, 18
 Jul 2024 22:53:18 +0200
Date: Thu, 18 Jul 2024 22:53:17 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZpmAvdJnGWB5T4DG@probook>
References: <20240704-svtree-v1-1-8fbd93dcfbb9@gmx.net>
 <0d66f3e0-cec6-487a-8bfa-880142420e52@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d66f3e0-cec6-487a-8bfa-880142420e52@mind.be>
X-Provags-ID: V03:K1:8pjtDKDxSZZvgPx3B6Ak96hIZTwNv9WHDIyYTJp2zCb7hD4cYYk
 fPaQwUQdEpJBYlS5zAxoP65iLZ9mXSSnCcSjhwjN7wRM4LKh2k0rzrVrb14rH8mJY3W3Vur
 K+iVvSCz76PiwSevV0GzpEFMH/krHv6N4mEDA9mnthxiaxS3ENs/sy+8trArW+qNZAd0057
 jjOwN/zrx29BRX744ibbA==
UI-OutboundReport: notjunk:1;M01:P0:tJ9yE9Fgodw=;6+oPdwbIA4Wx1SUodx4cwg1zHIm
 1f/QmVjGbjjzVgtLwEQGom9GvHE+qSJ9FxXUDNytgcNn/M5pq6ovPq0fl5PryHRVoWZpXjZBe
 ehB1mg0oAehL9LeJIHer9KMDXS5ao3fZerQSpqXS0MpT/re8yjux/PzwxR243J1LeDkyJwRzL
 95cUCTJHwerj/WE6hGwG0t8uvt9KSipmyJ/pR8JK2DEKk8I0Xj0RtO50iTB95CkVrL3DfCblP
 3iKXtVXTyCbBfLupAAFGYPuyNN1U9uToMdUeIcch+1LS+gUTIVzhqPoBqyDYIeuXAS00JcQiV
 O3mFmAfKKA8uOw2g+rApbLq4U2iSTC2r2LTHAfrQoJAGXzmC4R8qLXBpgZWsl87fLNeZv0En0
 /YWRIEIhDHbDlMLQ+c54bnaw7bH8L0Zn4ETpxxHN/NgnZ6PEX+D+4o61IFGoqc/hBEbd6Q/Nz
 +LeKywq9pGlbUCS6mmnWNvISiOJHZdfoGwoyRbbN3/0bSXPUL0fMO/njK+iS7Dn76RDHpWbky
 duQ2bIEhQXr0ZL4fIirPNRUdDfGqdhvLXQ821EJxhakxPjwCKhQ6EtpLuD61pyVBBO+G31K3b
 RDnwQEx37pscftwxAG/RHoDKdGOUAZPsXwJFKK+eC31wT09Y23X0eGKb5L9Kpu3FZBO9P2Mkl
 23zYyDNsXLYzVX+aXlkptijhoxeiKZBowUD+0jXPlt9trbsbIlKhyr7LwUoB+ABPFJAFjG6gW
 VTc9htyPDV+BwYDp4uf2eLPbpJpYqELyMDEVF4JAAGz/NoO6hHcJu4+q56gT7uYPYuWw5M/X8
 4UVj4twoqhiHswDGbzAvnrUw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721335998; x=1721940798; i=j.neuschaefer@gmx.net;
 bh=DAx5ciiVsU3BgvOLaoUtxqP75gkBwR/3T1ebV0nIxeE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ass34gFFJL9GQccMFWKHPxKiR2OtvWwcy1a2Exc1+cNKIigP7KldcU1ZfynwsT5v
 kSd0GbtKhEW5EsHRvanontzloAmazRAzdwbqwtT/VGsrTz2FQqB6pVZLfoUanwmX7
 uU++71iL8KfYy2ftTQAfZSaCt6gvb/181yMsL16gaP3d6+4r9QY4xqiaG6v/pwArq
 CmczpD/ZEUmMXfGOL3ct/EKtf1NLKcgPWjtPTZm8m9Jsv1vaJzZAgS3bas2j0OVYH
 lWOxrgG8qKoMVTmyw9sepHBlquxl9U4dImrJcAsyc1s2MmPokAPX/UOXoPjQ2IciC
 IlgedP79FStVxDJ5BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ass34gFF
Subject: Re: [Buildroot] [PATCH] system: Add option to maintain a
 supervision tree
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBKdWwgMTQsIDIwMjQgYXQgMTE6MTE6NTdQTSArMDIwMCwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgd3JvdGU6Cj4gIEhpIEouLAo+Cj4gT24gMDQvMDcvMjAyNCAyMTowMCwgSi4gTmV1c2No
w6RmZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiA+IE9uZSBvZiB0aGUgbWFqb3IgZHJhd2JhY2tz
IG9mIGNsYXNzaWMgaW5pdC9yYyBzeXN0ZW1zIGlzIHRoYXQgZGVhZAo+ID4gZGFlbW9ucyByZW1h
aW4gZGVhZDogT25jZSBzdGFydGVkIGJ5IHRoZSByYyBzY3JpcHRzLCB0aGV5IGFyZSBsZWZ0IHRv
Cj4gPiBsb29rIGFmdGVyIHRoZW1zZWx2ZXMuCj4gPgo+ID4gQSBzaW1wbGUgYXBwcm9hY2ggdG8g
a2VlcCB0aGVtIHJ1bm5pbmcgcmVsaWFibHkgaXMgdG8gc3VwZXJ2aXNlIHRoZW06Cj4gPiBJbiBh
IHRyZWUgd2l0aCBQSUQgMSBhdCBpdHMgcm9vdCwgZXZlcnkgcHJvY2VzcyBrbm93cyB3aGljaCBj
aGlsZHJlbgo+ID4gb3VnaHQgdG8gcnVuIHVuZGVyIGl0LCBhbmQgaXQgcmVzcGF3bnMgdGhlbSBh
Y2NvcmRpbmdseS4gVGhpcyBpcyB0aGUKPiA+IHN1cGVydmlzaW9uIHRyZWUuCj4gPgo+ID4gQ2xh
c3NpYyBpbml0IGFscmVhZHkgcHJvdmlkZXMgcnVkaW1lbnRhcnkgc3VwZXJ2aXNpb24gaW4gdGhl
IGZvcm0gb2YKPiA+IGluaXR0YWIuIFRoaXMgcGF0Y2ggdXNlcyBpbml0dGFiIHRvIGVzdGFibGlz
aCBhIG1vcmUgZmxleGlibGUKPiA+IHN1cGVydmlzaW9uIHRyZWUgYmFzZWQgb24gcnVuaXQncyBy
dnN2ZGlyIG9yIHM2J3MgczYtc3ZzY2FuLgo+Cj4gIFdlIGRpc2N1c3NlZCB0aGlzIHBhdGNoIGhl
cmUgYXQgdGhlIEJ1aWxkcm9vdCBoYWNrYXRvbi4gQWx0aG91Z2ggd2UgZnVsbHkKPiBhZ3JlZSB0
aGF0IGhhdmluZyBhIHN1cGVydmlzb3IgaXMgZXh0cmVtZWx5IHVzZWZ1bCwgd2UgYWxzbyBmZWVs
IHRoYXQgdGhpcwo+IHBhdGNoIGlzIHZlcnkgaW52YXNpdmUgZm9yIHNvbWV0aGluZyB0aGF0IGlz
IHJlbGF0aXZlbHkgc2ltcGxlIHRvIGltcGxlbWVudAo+IGF0IHRoZSBtb21lbnQuIFRoZSBvbmx5
IHRoaW5nIHlvdSBuZWVkIHRvIGRvIGlzIHRvIHNlbGVjdCB0aGUgc3VwZXJ2aXNvciB5b3UKPiB3
YW50IHRvIHVzZSwgYW5kIHB1dCBhIGN1c3RvbSBpbml0dGFiIGluIHRoZSBmaWxlc3lzdGVtIG92
ZXJsYXkgdGhhdCBzdGFydHMKPiB0aGUgc3VwZXJ2aXNvci4gT2gsIGFuZCB5b3UgcHJvYmFibHkg
YWxzbyB3YW50IGEgcG9zdC1idWlsZCBzY3JpcHQgdG8gcmVtb3ZlCj4gZXZlcnl0aGluZyBpbiAv
ZXRjL2luaXQuZCBmb3Igd2hpY2ggeW91IGNyZWF0ZWQgYSBzZXJ2aWNlIGluc3RlYWQgLSBidXQg
dGhhdAo+IHBhcnQgaXNuJ3QgZXZlbiBoYW5kbGVkIGJ5IHRoaXMgcGF0Y2guCj4KPiAgT25lIG9m
IEJ1aWxkcm9vdCdzIG1haW4gcHJpbmNpcGxlcyBpcyBrZWVwaW5nIGl0IHNpbXBsZS4gT3ZlciB0
aGUgeWVhcnMsCj4gd2UndmUgYWxyZWFkeSBjb2xsZWN0ZWQgd2F5IHRvbyBtdWNoIGNvbXBsZXhp
dHkuIFRoZXJlZm9yZSwgd2UndmUgZGVjaWRlZCB0bwo+IHJlamVjdCB0aGlzIHBhdGNoLgoKRmFp
ciBlbm91Z2ggLS0gdGhlIHBhcnRpY3VsYXIgZGVzaWduIHRyYWRlLW9mZnMgY2FuIGJlIGEgYml0
IGRpZmZpY3VsdAp0byBzZWUgZnJvbSB0aGUgb3V0c2lkZS4gRm9yIGV4YW1wbGUgKGFuZCB0aGlz
IGlzIG5vdCBhIHJlYXNvbiB0byBtZXJnZQpteSBwYXRjaCwganVzdCBhbiBleHBsYW5hdGlvbiBv
ZiBteSB0aG91Z2h0IHByb2Nlc3MpLCBhZGRpbmcgYSBjdXN0b20KaW5pdHRhYiByZXF1aXJlcyBr
bm93aW5nL2NvcHlpbmcgdGhlIHdob2xlIGluaXR0YWIsIHdoZXJlYXMgdGhlIHVzZXIgb2YKdGhp
cyBvcHRpb24gd291bGQgb25seSBuZWVkIHRvIGtub3cgdGhhdCB0aGV5IHdhbnQgYSBzdXBlcnZp
c2lvbiB0cmVlLAp3aGljaCBpcyBmcm9tIHRoYXQgcGVyc3BlY3RpdmUgc2ltcGxlci4KCj4KPiAg
UmVnYXJkbGVzcywgdGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbnMhCgpBZ2FpbiwgdGhh
bmsgeW91IGZvciB5b3VyIHRob3VnaHRmdWwgYW5kIGZyaWVuZGx5IHJldmlld3MgOikKCgotLSBq
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
