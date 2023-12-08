Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E911C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 11:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEEFE41E61;
	Fri,  8 Dec 2023 11:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEEFE41E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaLLkO4TmjuN; Fri,  8 Dec 2023 11:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5620240895;
	Fri,  8 Dec 2023 11:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5620240895
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF3941BF37A
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B846560EE6
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 11:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B846560EE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1AB0AqiPtbN for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 11:34:05 +0000 (UTC)
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52ED960C11
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 11:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52ED960C11
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BZ7KrUoF6izmmBZ7KrKzOL; Fri, 08 Dec 2023 12:34:02 +0100
Message-ID: <77d444a0-5b99-4b21-8a4e-0e3a4f29f159@benettiengineering.com>
Date: Fri, 8 Dec 2023 12:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
 <e43a1b9b-fa82-43f3-8225-e5a76ac1cbde@benettiengineering.com>
 <CAOf5uwkW9-aVA3UUTHF85De-b+zPJP9RWEaUsj+cix_M2Xn6rw@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAOf5uwkW9-aVA3UUTHF85De-b+zPJP9RWEaUsj+cix_M2Xn6rw@mail.gmail.com>
X-CMAE-Envelope: MS4xfHUDASywbGq5iHNKfEFo4CMTGPfryQjUlFXp5cE1z4qcgL5S2pp5rA/tafSPxCcOL3r6ta5aCRPaBPQzK5llboe2UYMixr3IBjKxKbFFcaHyDBhHHPER
 VGkN/W3ZQ91xQbVcGAQaWPZnTTpTSZPEhCFX8QAgnOKD1l2K6D71EelTreoBZd+rXR36zrRQ1mcbhDapA+1TZC95LcKSdpXyynh65zw97ErW9Ob4mUoJqkRL
 /QetR1vZKLlX3EQBY0c/N1WNER1aFjsZr2IPtktkFkt3qI0x+KY84Le7D1Eo3hLauOV9+xP6zmHJjau1yAvFcw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1702035242; bh=hbMkSuS5m9LPkejHcZl0a3x1g3gPImBcbABt0YQhR9g=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=QC2BZk4H7aJIDIxHZfS4BD5tUwMlKf3slfIupq31XTUk81IY541RhDNdQ29RDVTjp
 3vRBlpeTF6D3gm5bk409ll84a9zJz/RY+oJyyFmR5STxJ46rti5HBCBKYRk7gIQQPR
 E5uiBMMBNn5EUOGKV5FkCQVSnVB9zQHCZqBUDOIb1rkzFA2L57+UP8BSN2gCCtrXS3
 UyOB+OmvVBZ1pGHtdCQghjTdL8JB85RxEHO5P6C+4BahJ2NNOeioZUSqlwOwf82uUH
 xMFqJxdD5KNmGDCU9gFLEg9dV7gUyPfl/Wo+w+sRPvhUaTb8GuaftECPFGkoYmima9
 Kcc1SBew3UT8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QC2BZk4H
Subject: Re: [Buildroot] help - custom user not working
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
Cc: Stefano Cottafavi <stefano.cottafavi@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbCwKCk9uIDA4LzEyLzIzIDEyOjMwLCBNaWNoYWVsIE5henphcmVubyBUcmltYXJj
aGkgd3JvdGU6Cj4gSGkgR2l1bGlvCj4gCj4gT24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMjoyOeKA
r1BNIEdpdWxpbyBCZW5ldHRpCj4gPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5j
b20+IHdyb3RlOgo+Pgo+PiBIaSBTdGVmYW5vLAo+Pgo+PiBPbiAwOC8xMi8yMyAxMTo0NSwgU3Rl
ZmFubyBDb3R0YWZhdmkgd3JvdGU6Cj4+PiBIaSwKPj4+IEknbSB0cnlpbmcgdG8gYWRkIGEgY3Vz
dG9tIHVzZXIgdG8gdGhlIG1pbmltYWwgInJhc3BiZXJyeXBpNF9kZWZjb25maWciCj4+PiBidWls
ZC4KPj4+IEknbSB1c2luZyBCdWlsZHJvb3QgMjAyMy4xMSwgZm9sbG93aW5nIHRoZSBtYW51YWwg
SSd2ZSBjcmVhdGVkIGEKPj4+ICJ1c2Vycy50eHQiIGZpbGUgKGluIHRoZSBidWlsZHJvb3Qgcm9v
dCBmb2xkZXIpIHdpdGgganVzdCBvbmUgbGluZToKPj4+Cj4+PiBwaSAtMSBwaSAtMSA9cmFzcGJl
cnJ5IC9ob21lL3BpIC9iaW4vc2ggLQo+Pj4KPj4+IFRoZSBjb25maWcgZmlsZSBjb250YWluczoK
Pj4+Cj4+PiBCUjJfUk9PVEZTX1VTRVJTX1RBQkxFUz0idXNlcnMudHh0Igo+Pj4KPj4+IFRoZSBi
dWlsZCBpcyBzdWNjZXNzZnVsIGFuZCBsb29raW5nIGFuZCB0aGUgImZ1bGxfdXNlcnNfdGFibGUu
dHh0Igo+Pj4gKG91dHB1dCBvZiB0aGUgYnVpbGQpIEkgY2FuIHNlZSB0aGUgdXNlciBkZWZpbml0
aW9uIGFib3ZlLgo+Pj4KPj4+IEhvd2V2ZXIsIHdoZW4gSSB0cnkgdG8gbG9nIG9uIGFzICJwaSIg
SSBnZXQgIkxvZ2luIGluY29ycmVjdCIgZXJyb3IuCj4+Pgo+Pj4gSWYgSSBsb2dpbiBhcyByb290
IGFuZCBjaGVjayB0aGUgL2V0Yy9wc3N3ZCwgSSBETyBOT1Qgc2VlIHRoZSB1c2VyIHBpCj4+Pgo+
Pj4gQ2FuIHlvdSBoZWxwIG1lIHVuZGVyc3RhbmQgd2hhdCBhbSBJIG1pc3Npbmc/Cj4+Cj4+IEkn
dmUgYnVpbGQgcmVwcm9kdWNlZCBoZXJlIHdoYXQgeW91J3ZlIGRlc2NyaWJlZCBhbmQgaW4KPj4g
cm9vdGZzLnRhci9ldGMvcGFzc3dkCj4+IEkgY29ycmVjdGx5IGZpbmQ6Cj4+IHBpOng6MTAwOjEw
MTo6L2hvbWUvcGk6L2Jpbi9zaAo+Pgo+PiBTaW5jZSBpdCBidWlsZHMgY29ycmVjdGx5IGl0IG1l
YW5zIGl0IGZpbmRzIHVzZXJzLnR4dCBmaWxlIGluIEJ1aWxkcm9vdAo+PiByb290IGZvbGRlciwg
c28gZXZlcnl0aGluZyBsb29rcyBnb29kIHRvIG1lLgo+Pgo+PiBJIHN1Z2dlc3QgeW91IHRvIGNo
ZWNrIHJvb3Rmcy50YXIgYXJjaGl2ZSBmb3IgdGhlIGZpbmFsIHRhcmdldCByb290ZnMuCj4+IFRo
aXMgaXMgYmVjYXVzZSB0YXJnZXQvIGZvbGRlciBkb2Vzbid0IGNvbnRhaW4gdGhlIGNvbXBsZXRl
IGZpbmFsIHJvb3Rmcwo+PiBmaWxlcywgZm9yIGV4YW1wbGUgaXQgbWlzc2VzIHBpIHVzZXIgaW4g
dGFyZ2V0L2V0Yy9wYXNzd2QgZmlsZS4KPj4KPiAKPiBXZSByZXBsaWVkIGF0IHRoZSBzYW1lIHRp
bWUuIEkgaGF2ZSBkb25lIHRoZSBzYW1lIGFuZCBhZGQgbW9yZSBpbmZvIHRvIGRlYnVnCj4gaXQK
CndlJ3JlIGluIHN5bmMgdGhlbiEgMTI6MjkgYm90aCA6LSkKCkJlc3QgcmVnYXJkcwotLSAKR2l1
bGlvIEJlbmV0dGkKQ0VPJkNUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPj4gLS0KPj4gR2l1
bGlvIEJlbmV0dGkKPj4gQ0VPJkNUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAo+IAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
