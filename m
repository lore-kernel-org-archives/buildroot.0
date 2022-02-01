Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DB4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F44560EE9;
	Tue,  1 Feb 2022 22:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXz75dlQvtmQ; Tue,  1 Feb 2022 22:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2736607B5;
	Tue,  1 Feb 2022 22:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B00411BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC0C140168
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h5ReuF1sGuGD for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:09:11 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id E63624014E
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:09:10 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id F1DxnJO2eo6PDF1DxnoU6z; Tue, 01 Feb 2022 23:02:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643752925; bh=VUnIy2gl2df+jdIa7WHB2b8APyf2uxHNvtQiGfXSHMc=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=eiHior14OshDiU3Z8mbYOnYPonVqVOUjmE9CcS0uBT4FdOHdbtJx8eyfNvKhb6t6v
 NCUm3SZ4/VJXR1g4Z9w8wJ86PsVV3epCXCqOcbwPwM5JnwNbTbQJWtOTiCPDypeduN
 iWo9UpLIX55sRBv3WcOYgOGLCOqIRQNZcWpdHHBQhDeWv1ZlQ1NWPKxFuWdURi2nxe
 tKk7MAmGZjy9rNsldXeOTfbL5Hkr1K0ai6dkbQ02tqGD/MyOMbCezEcoeypP+0jaDE
 S/nYh3K/6oNlHlaHjt62czHYW/9SEXzGGjapyHESRiytQQDxeRSz5G3Xy6nMuixHBo
 ISUdIIVFclZog==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 1 Feb 2022 23:02:04 +0100
Message-Id: <CD04B430-5777-49D1-85BA-BB174708E3C8@benettiengineering.com>
References: <168006d0-d098-07e2-7203-489d7573a3ec@mind.be>
In-Reply-To: <168006d0-d098-07e2-7203-489d7573a3ec@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfKeqCKF5ECTfoigXPMHB/XpG9QvwGhaU4c5cAo4uv+s+Tc75P8MZCLmzydTPUTEMbRdqPigkxlA/msrG6SMghkzvi1P6u+JXAG7Z1DqehWs39e23D6yf
 QHX951wNmlHpDqvn9TYFyCvszr4JS1CcJmkmoiFdt6yovTBIOlOC7Md585TyVOqxbFOf8MzZuzdWHtYfYcZJvUiFBnPBh/S3Wh068DowWAPkjzA1qNo4eRkO
 KSu3ujnaaphVGmmih7WyykRrJRBuXJ3fjyJ9i7KqUb2o9Zj6vPDIP2loE0lO33lqldrE9OtMdwafmjHyRV4sEw==
Subject: Re: [Buildroot] [PATCH] package/efl: fix build failure with eeze
 disabled
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKPiBJbCBnaW9ybm8gMSBmZWIgMjAyMiwgYWxsZSBvcmUgMjI6NTMsIEFybm91
dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gaGEgc2NyaXR0bzoKPiAKPiDvu78KPiAK
Pj4gT24gMjQvMDEvMjAyMiAxMTowOSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEVscHV0IGRl
cGVuZHMgb24gZWV6ZSwgc28gaWYgd2UgZGlzYWJsZSBlZXplIHdlIGFsc28gbmVlZCB0byBkaXNh
YmxlIGVscHV0Cj4+IGJ5IHNldHRpbmcgdGhlIG9wdGlvbiAiaW5wdXQiIHRvIGZhbHNlLgo+PiBG
aXhlczoKPj4gaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDUzMQo+
IAo+IFRoZXJlIGFyZSB0d28gb3RoZXIgcGF0Y2hlcyB0aGF0IHNvbWVob3cgZGVhbCB3aXRoIHRo
aXMgaXNzdWUgWzFdWzJdIGluIGFkZGl0aW9uIHRvIHRoaXMgb25lIFszXS4KPiAKPiBDb3VsZCBz
b21lb25lIGNob29zZSBiZXR3ZWVuIHRoZSBhbmQgbWFyayB0aGUgcmVzdCBhcyBTdXBlcnNlZGVk
IGluIHBhdGNod29yaz8KCkZhYnJpY2UgY29tbWVudGVkIG9uIG1pbmUgdGhhdCBtaW5lIHdhcyBi
ZXR0ZXIuClRoZW4gdGhlIFJvbWFpbiBvbmUgY2FtZSBvdXQgZmV3IGRheXMgYWdvIGFuZCBJIGNh
biB0ZWxsIGhpcyBvbmUgaXMgYmV0dGVyLgoKU28gSSB3b3VsZCBnbyBmb3IgdGhlIFJvbWFpbiBw
YXRjaC4KCkkgc2V0IG1pbmUgYXMgc3VwZXJzZWRlZCBhbmQgRmFicmljZSBjYW4gZG8gdGhlIGJl
Zm9yZS4KCkJlc3QgcmVnYXJkcwpHaXVsaW8KCj4gCj4gCj4gUmVnYXJkcywKPiBBcm5vdXQKPiAK
PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRj
aC8yMDIxMTIzMDIyMTkwNC4zMDY0MDIyLTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20vCj4g
WzJdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyMjAxMjkyMjQ2NTEuMTI4MjI2My00LXJvbWFpbi5uYW91ckBnbWFpbC5jb20vCj4gWzNdIGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjAx
MjQxMDA5MjAuMzAwNTU2NC0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20v
Cj4gCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBi
ZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAtLS0KPj4gIHBhY2thZ2UvZWZsL2VmbC5tayB8IDIg
KysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZWZsL2VmbC5tayBiL3BhY2thZ2UvZWZsL2VmbC5tawo+PiBpbmRleCBlZDBhOGFjYzFk
Li5jOTM5NjE0NzVkIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2VmbC9lZmwubWsKPj4gKysrIGIv
cGFja2FnZS9lZmwvZWZsLm1rCj4+IEBAIC02NSw2ICs2NSw4IEBAIEVGTF9ERVBFTkRFTkNJRVMg
Kz0gdWRldgo+PiAgRUZMX0NPTkZfT1BUUyArPSAtRGVlemU9dHJ1ZQo+PiAgZWxzZQo+PiAgRUZM
X0NPTkZfT1BUUyArPSAtRGVlemU9ZmFsc2UKPj4gKyMgaW5wdXQoZWxwdXQpIHJlcXVpcmVzIGVl
emUsIHNvIGRpc2FibGUgaXQgYWNjb3JkaW5nbHkKPj4gK0VGTF9DT05GX09QVFMgKz0gLURpbnB1
dD1mYWxzZQo+PiAgZW5kaWYKPj4gICAgaWZlcSAoJChCUjJfUEFDS0FHRV9FRkxfVVRJTF9MSU5V
WF9MSUJNT1VOVCkseSkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
