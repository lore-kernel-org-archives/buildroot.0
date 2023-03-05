Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA1AC6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77E8E40329;
	Sun,  5 Mar 2023 20:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E8E40329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 466h8vo-6Vwl; Sun,  5 Mar 2023 20:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B497440132;
	Sun,  5 Mar 2023 20:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B497440132
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 210E21BF3AA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 20:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87B24097D
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 20:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87B24097D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEBWYSLKqLru for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 20:43:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7330F40979
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7330F40979
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 20:43:36 +0000 (UTC)
Received: from [192.168.50.169] ([146.241.82.238])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YvCfpztRN8S3GYvCfpBvd4; Sun, 05 Mar 2023 21:43:34 +0100
Message-ID: <f5059df8-e34b-dde2-e9ce-91ecadf5d486@benettiengineering.com>
Date: Sun, 5 Mar 2023 21:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Peter Korsgaard <peter@korsgaard.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
References: <20230302151859.400567-1-giulio.benetti@benettiengineering.com>
 <CA+h8R2r5SvTysWRJO12UFCG8TdMQo1+Y+q+Mdam4nwj43+yNVw@mail.gmail.com>
 <87zg8r59qq.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <87zg8r59qq.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4xfKMflpYtj4vnBwCC7zt8bkuRqqOQiaxiTR+8HXyKOgsywYLjwYE8QlOImG04TXAEH9K2Wk+gFlTpLr4Oe6BxpJ94Ys8yR+/uGMSI3DtXYZnrPfYvK0Rj
 Hc73KaIEU7KdDydZOKaqebkvMwZ79o+89raAcFN7UUJB8irQ51JL99GWd5ZNPmuatLYYtb3gVrLWDmU/M5vgi2OKNzxNJDc6aJycEC9bhjT18n9jz/53g2D5
 q5iZUkWzoHzmy79l+xST8g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678049014; bh=HptMyDC3AsV1bCwPj2GUF/0lCEhcC1ZKyE7l2FJMm6U=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WAzN5NPVQB2rE923rwZUkkpo7Z6i83qsUBDf0W+TAjeC02N7vJRM5ZAjOt0pZdM5Y
 JabhVpSFQ8aKlViDafgT64wzrYPsVKiJSterjfhYvwOEpqC3J79eEDnKFMDR5Lh7Ur
 DNpl9ANn37AeoYWXXesGesuoI9L3wck6vTKuXzftElG/XIa/5dL2/wIscYRXhFJZv3
 7VolySzn0B524WBpln3x83cr5WhMnMuxGfVrt5BhLmSHSBZY8jQub8HTwCB1gUc+bg
 iSl6PXEunUrmw8mHgVNLuHZMM4Nn3CI70njHucYw5W0fiASYrV4Zf/VEHLMitMbm92
 9gGLUVxirgLDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WAzN5NPV
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure on
 PowerPC64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiAwNS8wMy8yMyAxOTozMywgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+Pj4+
Pj4gIkNocmlzdGlhbiIgPT0gQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1aWxkcm9vdCA8YnVpbGRy
b290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKPiAKPiAgID4gSGkgR2l1bGlvLAo+ICAgPiBPbiBU
aHUsIE1hciAyLCAyMDIzIGF0IDc6MTnigK9BTSBHaXVsaW8gQmVuZXR0aQo+ICAgPiA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gICA+Pgo+ICAgPj4gTGV0
J3MgYWRkIGxvY2FsIHBhdGNoIHBlbmRpbmcgdXBzdHJlYW0gdG8gZml4IGdldF9yYSgpIGNvbmZs
aWN0IG9uCj4gICA+PiBQb3dlclBDNjQgYXJjaGl0ZWN0dXJlLgo+ICAgPj4KPiAgID4+IFswXTog
aHR0cHM6Ly9naXRodWIuY29tL21vcnJvd25yLzg4MjFjdS0yMDIxMDExOC9wdWxsLzkzCj4gICA+
Pgo+ICAgPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20+Cj4gICA+PiAtLS0KPiAgID4+IC4uLi8wMDAxLUZpeC1idWls
ZC1vbi1Qb3dlclBDNjQucGF0Y2ggICAgICAgICB8IDEyMyArKysrKysrKysrKysrKysrKysKPiAg
ID4+IDEgZmlsZSBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKQo+ICAgPj4gY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcnRsODgyMWN1LzAwMDEtRml4LWJ1aWxkLW9uLVBvd2VyUEM2NC5wYXRj
aAo+IAo+ICAgPiBUaGUgcmVwbyBvd25lciBtb3Jyb3duciByZXF1ZXN0ZWQgdGhhdCB3ZSBzd2l0
Y2ggdG8gdGhlIG5ld2VyIHZlcnNpb24KPiAgID4gb2YgdGhlIHBhY2thZ2UsIGFuZCBzZW5kIHRo
ZSBQUiB0aGVyZS4KPiAKPiAgID4gSSBzZW50IHRoZSBQUiB0aGVyZTogaHR0cHM6Ly9naXRodWIu
Y29tL21vcnJvd25yLzg4MjFjdS0yMDIxMDkxNi9wdWxsLzczCj4gCj4gICA+IFRoZSBwYXRjaCB0
byB1cGRhdGUgdG8gdGhlIG5ldyB2ZXJzaW9uOgo+IAo+ICAgPiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwMzAzMDc0ODI5LjIxMzk4ODEt
MS1jaHJpc3RpYW5AcGFyYWwuaW4vCj4gCj4gV2hhdCBpcyB0aGUgcmVsYXRpb24gZXhhY3RseSBi
ZXR3ZWVuIHRoZXNlIHR3byBwYXRjaGVzPyBBcmUgdGhleSBmaXhpbmcKPiB0aGUgc2FtZSBpc3N1
ZT8gSXMgdGhpcyBwYXRjaCBzdXBlcnNlZWRlZCBieSB5b3VyIHBhdGNoIGNoYW5naW5nIHRoZQo+
IHZlcnNpb24/CgpUaGlzIHBhdGNoIGlzIHN0aWxsIHZhbGlkLCBpdCBmaXhlcyB0aGUgYnVnIGZv
ciB0aGUgY3VycmVudCByZXBvc2l0b3J5CnVzZWQgYnkgdGhlIHBhY2thZ2UuCkJ1dCBzb29uIHRo
ZSByZXBvc2l0b3J5IHdpbGwgYmUgbW92ZWQgdG8gYSBuZXcgb25lOgpodHRwczovL2dpdGh1Yi5j
b20vbW9ycm93bnIvODgyMWN1LTIwMjEwOTE2CmJlY2F1c2UgdGhlIGFjdHVhbCBvbmUgd2lsbCBi
ZSBkZWxldGVkKGl0J3MgYSBzdHJhbmdlIGNob2ljZS4uLikuClNvIENocmlzdGlhbiBtb3ZlZCBt
eSBQUiB0byB0aGUgbmV3IFJlcG9zaXRvcnkgYnV0IGl0J3Mgc3RpbGwgbm93IG1lcmdlZC4KU28g
SU1ITywgYXQgdGhpcyBzdGFnZSwgSSB3b3VsZDoKMSkgYXBwbHkgdGhpcyBwYXRjaAoyKSB3YWl0
IGZvciBQUiB0byBiZSBtZXJnZWQgb3IgZm9yIHJlcG9zaXRvcnkgdG8gYmUgZGVsZXRlZAozKSBz
d2l0Y2ggdG8gdGhlIG5ldyByZXBvc2l0b3J5IGtlZXBpbmcgdGhlIGxvY2FsIHBhdGNoIGFwcGxp
ZWQgd2l0aCAKcG9pbnQgMSkgb3IgaWYgaXQgd2lsbCBiZSBtZXJnZWQgdXBzdHJlYW0gd2UgY2Fu
IHJlbW92ZSBsb2NhbCBwYXRjaCBvZgpwb2ludCAxKQoKVGhpcyBpcyBteSAyIGNlbnRzLgoKS2lu
ZCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
