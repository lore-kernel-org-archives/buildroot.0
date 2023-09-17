Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97A8CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6553B4054E;
	Sun, 17 Sep 2023 20:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6553B4054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwxDrwlqTu3F; Sun, 17 Sep 2023 20:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C63E4056A;
	Sun, 17 Sep 2023 20:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C63E4056A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 303391BF399
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 167D14056A
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 167D14056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLAjscGlpI2p for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:27:02 +0000 (UTC)
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63D074054E
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63D074054E
Received: from [192.168.50.162] ([146.241.100.148])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyM7qTt6jvDh7hyM8qmXAL; Sun, 17 Sep 2023 22:27:00 +0200
Message-ID: <3aa598e9-44ba-36c1-c891-f692f7ab2816@benettiengineering.com>
Date: Sun, 17 Sep 2023 22:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230914191726.28670-1-giulio.benetti@benettiengineering.com>
 <20230914214942.41dd792a@windsurf>
 <8b5fbe25-dc3d-5117-d955-b2f63ed2bf85@benettiengineering.com>
 <20230915221728.GP2571@scaer>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230915221728.GP2571@scaer>
X-CMAE-Envelope: MS4xfFO0rzDU1a5F28z73GTYooPEXDHje7IMr4uN0MV5XrNvnuyZRdnWy/D3Vso2eKtQs8g82JvgMciLz9cGeKhtB3sUo77K93gU537W1QlgTpWU4kLwoDV1
 0G0NycQRKGPrCP2BbLrUiaXMHslCqWkm0uIhNQjWg5T1Xfkn17WTkeSWTxwfKs5XGMUxrMYnOQpBHAIJeenPq8XffFzFstyJlgVJ2Rv912t95EnZOGrfJewU
 jhfIeWrFLUk2HQ8Ap/w/jpwXPIfLxdcx+4H7UVdK++MedDJiKMuQhnomlyFCkg5FHicPj7s9v7W5YNWS4jp2YCg3IChOBywF2MvGmQ0Wr6Bh+TAAt95PvNak
 X1lMyH2a+ciMmOwEQLiC8uZfz1rRkdg6Gd/q9tXLA4fC+dCwLTL+BDtMz5YniY8MKQxU2d05yNZgDSs51PLK5McJSxad8S2tAihAfwVmbOthDX1pxxc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694982420; bh=1MC4xq2Q4XWW7+Hne+LHz7NAzlmT1XiUq6REwjwXpgc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EzZR6+qpP+M1kOav+7m8F2DCDX6ge1ItqqfDPhkOXPDQYq57PhsXfVVkZWvXTsCLF
 4TZ6+CW6E2nJ0KTkg6C+f+kpW0hYgRAEl+wU5/wqUPFqwFVQW+kNJme7mcZV/AV7/b
 /fNRbNDBpO4GndAmU6VKnepYy6aOKlrLyB/57SnTyBtUAacXXHc626G3sUnjuFqffM
 413WARRlLJLmdJg+YRGqOkm2lpQLqB5u1XbEYm01azuRWO9tD0Knc7N6tU1Ft9z6Yc
 JfGwcTwB4aanqXt600sjzG8r60susb+ARXYx24qF+fxk2TGfpr6Q7W8OHJu/8ZK32d
 Ds7QNc6W205+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EzZR6+qp
Subject: Re: [Buildroot] [PATCH] package/apache-utils: new package
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Jim Reinhart <jimr@tekvox.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgVGhvbWFzLCBBbGwsCgpPbiAxNi8wOS8yMyAwMDoxNywgWWFubiBFLiBNT1JJTiB3
cm90ZToKPiBHaXVsaW8sIFRob21hcywgQWxsLAo+IAo+IE9uIDIwMjMtMDktMTQgMjI6MTEgKzAy
MDAsIEdpdWxpbyBCZW5ldHRpIHNwYWtlIHRodXNseToKPj4gT24gMTQvMDkvMjMgMjE6NDksIFRo
b21hcyBQZXRhenpvbmkgd3JvdGU6Cj4+PiBPbiBUaHUsIDE0IFNlcCAyMDIzIDIxOjE3OjI2ICsw
MjAwCj4+PiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5n
LmNvbT4gd3JvdGU6Cj4+Pj4gRnJvbTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpK3Rl
a3ZveEBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4+IEJ1aWxkIGh0ZGlnZXN0IGFuZCBodHBh
c3N3ZCB1dGlsaXRpZXMgb25seSB3aXRob3V0IGJ1aWxkaW5nIGVudGlyZSBBcGFjaGUKPj4+PiBw
YWNrYWdlLgo+IFstLVNOSVAtLV0KPj4+IFRoYW5rcyBmb3IgdGhlIHByb3Bvc2FsLiBJJ20gYWx3
YXlzIGEgYml0ICJtZWgiIHdoZW4gaXQgY29tZXMgdG8gYWRkaW5nCj4+PiBhIG5ldyBwYWNrYWdl
IHRoYXQgdXNlcyB0aGUgc2FtZSBzb3VyY2UgY29kZSBhcyBhbm90aGVyIHBhY2thZ2UuIEl0Cj4+
PiBjYXVzZXMgZXh0cmEgbWFpbnRlbmFuY2Ugd29yayAoeW91IG5lZWQgdG8gdXBkYXRlIGJvdGgg
cGFja2FnZXMsIGFwcGx5Cj4+PiBwYXRjaGVzIHRvIGJvdGgsIGtlZXAgdHJhY2tpbmcgb2YgQ1ZF
cyBmb3IgYm90aCwgZXRjLikuCj4+IEkgd2FzIHVuc3VyZSBpZiBkZWFsIHdpdGggaXQgdGhpcyB3
YXkgYW5kIGFmdGVyIHNlYXJjaGluZyBJJ3ZlIGZvdW5kCj4+IHBhY2thZ2VzIHVib290IGFuZCB1
Ym9vdC10b29scy4KPiAKPiBXZSBjYW4gc2xpZ2h0bHkgbG9vc2VuIHRoZSByZXN0cmljdGlvbnMg
Zm9yIHRob3NlIHNwZWNpYWwgcGFja2FnZXMsIGxpa2UKPiB0aGUga2VybmVsIG9yIHRoZSBib290
bG9hZGVycy4gVS1Cb290IGlzIGEgYm9vdGxvYWRlciwgc28gZGV2aWF0aW9uIGlzCj4ga2luZGEg
YWNjZXB0YWJsZSAoYW5kIHVuYXZvaWRhYmxlKS4KPiAKPj4+IFdoYXQgaXMgdGhlIHVzZSBjYXNl
IGZvciBuZWVkaW5nIHRoaXMgd2l0aG91dCB0aGUgQXBhY2hlIHNlcnZlcj8KPj4gSSBuZWVkIGh0
ZGlnZXN0IHRvIG1hbmlwdWxhdGUgLmh0ZGlnZXN0IGZpbGUgb24gdGFyZ2V0IHVzZWQgYnkgU1dV
cGRhdGUKPj4gdG8gZGVhbCB3aXRoIGNyZWRlbnRpYWxzLgo+IAo+IEFDSywgdmFsaWQgbmVlZCDi
iJogOy0pCgpJJ3ZlIGZvcmdvdHRlbiB0byBtZW50aW9uIHRoYXQgTW9uZ29vc2UgcmVxdWlyZXMg
aXQgZm9yIGEgd2VicGFnZSB3aXRoCmNyZWRlbnRpYWxzIHRvbywKCj4gCj4+PiBDYW4gd2UKPj4+
IGNoYW5nZSB0aGUgQXBhY2hlIHBhY2thZ2UgdG8gaW5zdGVhZCBhbGxvdyBpbnN0YWxsaW5nIG9u
bHkgdGhvc2UgdG9vbHM/Cj4+Cj4+IFllcywgSSBjYW4gbW9kaWZ5IGJ5IGFkZGluZyBhbiBvcHRp
b24gdG8gcGFja2FnZSBhcGFjaGUgbGlrZQo+PiBCUjJfUEFDS0FHRV9BUEFDSEVfQlVJTERfVE9P
TFNfT05MWSBhbmQgdGhlbiBpbiBhcGFjaGUubWsgSSBkbyBsaWtlOgo+PiBpZmVxICgkKEJSMl9Q
QUNLQUdFX0FQQUNIRV9CVUlMRF9VVElMU19PTkxZKSx5KQo+PiAJd2hhdCBJIGRvIGluIGFwYWNo
ZS11dGlscyBwYWNrYWdlCj4+IGVsc2UKPj4gCXdoYXQgaXQncyBhY3R1YWxseSBkb25lIGluIGFw
YWNoZSBwYWNrYWdlCj4+IGVuZGlmCj4gCj4gSSBhbSBub3QgdG9vIGZvbmQgb2YgdGhhdCwgYW5k
IGl0IGlzIGdvaW5nIHRvIGJlIGEgYml0IG1vcmUgY29tcGxleCB0aGF0Cj4gdGhhdC4gSW5kZWVk
LCBpZiBidWlsZGluZyBvbmx5IHRoZSB0b29scywgd2UgZG9uJ3Qgd2FudCB0byBkZXBlbmQgb24g
YWxsCj4gdGhlIG9wdGlvbmFsIGRlcGVuZGVuY2llcyAoemxpYiwgbHVhLCBicm90dGxpLi4uKS4K
PiAKPiBBbmQgaW50cm9kdWNpbmcgYSB3aG9sZS1maWxlIGlmZXEtZWxzZS1lbmRpZiBibG9jayBp
cyBub3QgbXVjaCBiZXR0ZXIKPiB0aGFuIGEgZHVwbGljYXRlIHBhY2thZ2U7IEkgZXZlbiBmaW5k
IGl0IHdvcnNlLCBiZWNhdXNlIGl0IG9iZnVzY2F0ZSB0aGUKPiBwYWNrYWdlJ3MgLm1rLi4uCj4g
Cj4+IFRoaXMgaXMgYmVjYXVzZSBJIGNhbid0IGJ1aWxkIG9ubHkgaHRkaWdlc3QgYW5kIGh0cGFz
c3dkIGJ5IHVzaW5nCj4+IHN0YW5kYXJkIGF1dG90b29scy1wYWNrYWdlIGluZnJhc3RydWN0dXJl
IGFuZCBJIG5lZWQgdG8gbWFrZSBzcGVjaWZpYwo+PiB0YXJnZXRzIHVuZGVyICQoQEQpL3N1cHBv
cnQuIE90aGVyd2lzZSBpdCB3aWxsIHRyeSB0byBidWlsZChhbmQgZmFpbCkKPj4gdG8gYnVpbGQg
YSBwYXJ0IG9mIGh0dHBkLgo+IAo+IEkgdGhpbmsgaXQgd291bGQgYmUgcmVsYXRpdmVseSB0cml2
aWFsIHRvIHByb3ZpZGUgeW91ciBvd24gaHRkaWdlc3Qgd2l0aAo+IGEgc2ltcGxlIHNoZWxsIHNj
cmlwdDoKPiAKPiAgICAgICMhL2Jpbi9zaAo+IAo+ICAgICAgY3JlYXRlPWZhbHNlCj4gICAgICBp
ZiBbICIkezF9IiA9ICItYyIgXTsgdGhlbgo+ICAgICAgICAgIGNyZWF0ZT10cnVlCj4gICAgICAg
ICAgc2hpZnQKPiAgICAgIGZpCj4gICAgICBwYXNzd2RfZmlsZT0iJHsxfSIKPiAgICAgIHJlYWxt
PSIkezJ9Igo+ICAgICAgdXNlcj0iJHszfSIKPiAKPiAgICAgIGlmIGNyZWF0ZTsgdGhlbgo+ICAg
ICAgICAgID4gIiR7cGFzc3dkX2ZpbGV9Igo+ICAgICAgZmkKPiAgICAgIGlmICEgWyAtZiAiJHtw
YXNzd2RfZmlsZX0iOyB0aGVuCj4gICAgICAgICAgcHJpbnRmICdDb3VsZCBub3Qgb3BlbiBwYXNz
d2QgZmlsZSAlcyBmb3IgcmVhZGluZy5cbicgIiR7cGFzc3dkX2ZpbGV9Igo+ICAgICAgICAgIHBy
aW50ZiAnVXNlIC1jIG9wdGlvbiB0byBjcmVhdGUgbmV3IG9uZS5cbicKPiAgICAgICAgICBleGl0
IDEKPiAgICAgIGZpID4mMgo+IAo+ICAgICAgaWYgZ3JlcCAtcSAiXiR7dXNlcn06JHtyZWFsbX06
IiAiJHtwYXNzd2RfZmlsZX0iOyB0aGVuCj4gICAgICAgICAgcHJpbnRmICdDaGFuZ2luZyBwYXNz
d29yZCBmb3IgdXNlciAlcyBpbiByZWFsbSAlc1xuJyAiJHt1c2VyfSIgIiR7cmVhbG19Igo+ICAg
ICAgICAgIHNlZCAtciAtaSAtZSAiL14ke3VzZXJ9OiR7cmVhbG19Oi9kIiAiJHtwYXNzd2RfZmls
ZX0iCj4gICAgICBlbHNlCj4gICAgICAgICAgcHJpbnRmICdBZGRpbmcgdXNlciAlcyBpbiByZWFs
bSAlc1xuJyAiJHt1c2VyfSIgIiR7cmVhbG19Igo+ICAgICAgZmkKPiAgICAgIGV4ZWMgMz4mMQo+
ICAgICAgZXhlYyA+L2Rldi9udWxsCj4gICAgICBwcmludGYgJ05ldyBwYXNzd29yZDogJyA+JjMK
PiAgICAgIHJlYWQgLXIgcGFzc3dkCj4gICAgICBwcmludGYgJ1JlLXR5cGUgbmV3IHBhc3N3b3Jk
OiAnID4mMwo+ICAgICAgcmVhZCAtciBwYXNzd2QyCj4gICAgICBleGVjID4mMwo+ICAgICAgZXhl
YyAzPiYtCj4gICAgICBpZiBbICIke3Bhc3N3ZH0iICE9ICIke3Bhc3N3ZDJ9IiBdOyB0aGVuCj4g
ICAgICAgICAgcHJpbnRmICJUaGV5IGRvbid0IG1hdGNoLCBzb3JyeS5cbiIKPiAgICAgICAgICBl
eGl0IDEKPiAgICAgIGZpID4mMgo+IAo+ICAgICAgaGFzaD0iJCggcHJpbnRmICclczolczolcycg
IiR7dXNlcn0iICIke3JlYWxtfSIgIiR7cGFzc3dkfSIgfG1kNXN1bSApIgo+ICAgICAgcHJpbnRm
ICIke3VzZXJ9OiR7cmVhbG19OiR7aGFzaCUgIC19IiA+PiIke3Bhc3N3ZF9maWxlfSIKPiAKPiBU
b3RhbGx5IHVudGVzdGVkLCBVc2UgYXQgeW91ciBvd24gcmlzay4uLgoKVGhhbmsgeW91IGZvciB0
aGUgc2NyaXB0LCBidXQgSSBwcmVmZXIgdG8gdXNlIHRvb2xzIGFscmVhZHkgcHJvdmlkZWQgYW5k
CnRlc3RlZC4gQW5kIGh0ZGlnZXN0IGFuZCBodHBhc3N3ZCBjYW4gYmUgdXNlZnVsIGZvciBvdGhl
ciB1c2FnZSBpbgpCdWlsZHJvb3QKCj4gaHRwYXNzd2QgaXMgcXVpdGUgYSBiaXQgbW9yZSBjb21w
bGV4LCB0aG91Z2guLCBzbyBpZiB5b3UgcmVhbGx5IG5lZWQgaXQsCj4gaW1wZXJzb25hdGluZyBp
dCBpcyBub3QgZ29pbmcgdG8gYmUgZWFzeS4uLgo+IAo+IEJvdHRvbSBsaW5lOiBpZiBvbmx5IGh0
ZGlnZXN0IG5lZWRlZCwgdGhlbiBhIHNjcmlwdCB3aWxsIGhlbHAgKG5vdCBzdXJlCj4gd2UnZCBu
ZWVkIHN1Y2ggYSBwYWNrYWdlIGluIEJ1aWxkcm9vdCwgdGhvdWdoKS4gT3RoZXJ3aXNlLCBJIGRv
bjt0IGhhdmUKPiBhIGdvb2QgaWRlYSB5ZXQuLi4KCkluIHRoZSBlbmQgSSd2ZSBzZW50IGEgcGF0
Y2hbMF0gZm9yIHBhY2thZ2UgYXBhY2hlIGFuZCBpdCBsb29rcyBnb29kIHRvCm1lLiBVc2luZyBh
dXRvdG9vbHMgaXMgYSByZWFsIG1lc3MsIHNvIEkndmUgbW92ZWQgd2hhdCBJJ3ZlIGRvbmUgZm9y
CnBhY2thZ2UgYXBhY2hlLXV0aWxzIHRvIHBhY2thZ2UgYXBhY2hlIGNoZWNraW5nIGZvciBvcHRp
b24gCkJSMl9QQUNLQUdFX0FQQUNIRV9VVElMU19PTkxZPXkKClswXTogCmh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA5MTcyMDI1MzkuMzY1
ODM4LTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KCkJlc3QgcmVnYXJk
cwotLSAKR2l1bGlvIEJlbmV0dGkKQ0VPJkNUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
