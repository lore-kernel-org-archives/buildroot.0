Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A4CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 20:35:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4897E61B32
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 20:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4897E61B32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A15D40697;
	Sat,  2 Oct 2021 20:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0c3mcXuRGJBR; Sat,  2 Oct 2021 20:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 744FC40695;
	Sat,  2 Oct 2021 20:35:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B9E31BF2B9
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 20:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5544140695
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 20:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYgYHRxTRG1c for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 20:34:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B9EE4068F
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 20:34:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6B6A7B004E8;
 Sat,  2 Oct 2021 22:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633206895;
 bh=e572Oynzd/fv571DRLp5w/2JbglJqdyrd/Px8aNv30g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9KXgrACvjbDyf8PprvNAhr/TegxW8iuHqmNUZPia1P3zXQAVTAxcJPnsQX7e0dx1
 jmilvUW7Ryq4kolQWi6OWaiNTxzHJ4XFGAm8IfV2iQ8EQB2Pa0cpELls/x0sWkeOi5
 NW2E6kGVajw1qsAcUOfitCe4OKnVygDpKgxTTW95tuIV3DTCCRie0qDBrJIQ1zOchj
 jT/wyrrJTwUayjsWGcaWYI0Kbvs2sxrzV5Y24pzpeNePKUfb9M6TzTvbw9njozYHy7
 CCn+Dc8UJlSQeUgU9wfObn3ctJhDlxq/1ypfPBDjVRQ8Ztc2cBjM539DM3nZeLoOeq
 BPlNA+ZAjREVw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Oct 2021 22:34:47 +0200
Date: Sat, 2 Oct 2021 22:34:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211002203447.GY1504958@scaer>
References: <37a2790a-8c48-1cfd-a160-567618850bbe@gmail.com>
 <24407e05-d940-826a-690f-5bbe1aeec252@mind.be>
 <6d635d7e-e88a-3b23-9682-a19ff3d08b7d@gmail.com>
 <20211002202534.40ca92ee@windsurf>
 <96717f4f-256e-0fc6-fa20-979233a6093a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96717f4f-256e-0fc6-fa20-979233a6093a@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] csky 8xx toolchain issue
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
Cc: Guo Ren <ren_guo@c-sky.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIxLTEwLTAyIDIyOjIxICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDAyLzEwLzIwMjEgw6AgMjA6MjUsIFRob21hcyBQZXRhenpvbmkgYSDD
qWNyaXTCoDoKPiA+IE9uIFNhdCwgMiBPY3QgMjAyMSAxNzo1ODoyNCArMDIwMAo+ID4gUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3cm90ZToKPiA+PiBUaGUgY3NreSB0b29s
Y2hhaW4gaXMgc3RpbGwgYnJva2VuIHdpdGggcmVjZW50IGhvc3QgY29tcGlsZXIgYW5kIG91ciBD
SSB3aWxsCj4gPj4gc3dpdGNoIHRvIERlYmlhbiBidWxsc2V5ZSBzb29uLgpbLS1TTklQLS1dCj4g
PiBDb25zaWRlcmluZyB0aGVzZSBpc3N1ZXMgYW5kIHRoZSBmYWN0IHRoYXQgdGhlcmUgaGFzIGJl
ZW4gbm8gdXBkYXRlcyBpbgo+ID4gdGVybXMgb2YgQy1TS1kgc3VwcG9ydCBmb3IgYSBsb25nIHRp
bWUsIEkgdGhpbmsgd2Ugc2hvdWxkIGNvbnNpZGVyCj4gPiBkcm9wcGluZyBzdXBwb3J0IGZvciB0
aGUgQy1TS1kgQ1BVIGFyY2hpdGVjdHVyZS4KPiBjc2t5ODYwIHdpbGwgYmUgc3VwcG9ydGVkIGJ5
IGdjYyAxMjoKPiBodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9Y29tbWl0ZGlm
ZjtoPWRiOTJiZDIyM2UzOTU3ZWU1OGI1YTBjMGZmZmQ4Yjc3NjZmMWRlZjMKCkluIHRoZSBtZWFu
dGltZSwgd2hhdCBhYm91dCBqdXN0OgoKICAgIGRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbiBi
L2FyY2gvQ29uZmlnLmluCiAgICBpbmRleCAxODUzZTI2YmI0Li5hYjQwMjk0ZGRjIDEwMDY0NAog
ICAgLS0tIGEvYXJjaC9Db25maWcuaW4KICAgICsrKyBiL2FyY2gvQ29uZmlnLmluCiAgICBAQCAt
NzcsNiArNzcsNyBAQCBjb25maWcgQlIyX2FhcmNoNjRfYmUKICAgICAKICAgICBjb25maWcgQlIy
X2Nza3kKICAgICAJYm9vbCAiY3NreSIKICAgICsJc2VsZWN0IEJSMl9BUkNIX0hBU19OT19UT09M
Q0hBSU5fQlVJTERST09UCiAgICAgCXNlbGVjdCBCUjJfQVJDSF9IQVNfTU1VX01BTkRBVE9SWQog
ICAgIAkjIE1vc3QgdmFyaWFudHMgYXJlIHN1cHBvcnRlZCBieSBnY2MtOSssIGV4Y2VwdCBvbmUg
dGhhdCBpcwogICAgIAkjIGhhbmRsZWQgYXMgYSBzcGVjaWFsIGV4Y2VwdGlvbiBpbiBwYWNrYWdl
L2djYy9Db25maWcuaW4uaG9zdAoKV2hlbiB3ZSBpbnRyb2R1Y2UgZ2NjIDEyLCB3ZSBjYW4gbW92
ZSB0aGF0IGRvd24gdG8gdGhlIGluZGl2aWR1YWwKdmFyaWFudHMgaWYgbmVlZCBiZS4uLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
