Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A1FC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 14:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5505E80BBD;
	Thu,  6 Jan 2022 14:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VG8aKs_Gru1d; Thu,  6 Jan 2022 14:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9EA80BA2;
	Thu,  6 Jan 2022 14:56:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 398D71BF406
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 275236FC06
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5So2wNc8G4Fj for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 14:56:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AC2B6FC05
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 14:56:35 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0C511C0014;
 Thu,  6 Jan 2022 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1641480993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFOH3g/8OTclFnpcQKumGLJKwhlUGx945LXFpskJR6o=;
 b=pw7nBljxBCMamKOM+55zNIulcPNfpeKKk5G+UdSSiAlrNLnajL34tLshq/sAhMO5HuZreR
 WA7wvLrJesHYul89GnyM38woc9HVDwzyYqSYBzdpj3BGs0f/3hoKiVulKKaNHv6pCgw0QX
 zbhxse8S31I2pwG4Tme+F4Y/eQq8+hK9J/I7+mEVqvlhXe29Yv95r7exxPXgzzde1yJJeO
 qDWB+ck2Cfsfg4WikHtiEbsZ+2AYSJEICgYy97dkoLbh5fmLlhIzAMFObI1ZmPJfxMtw/a
 3oVXy8vAS76acUIt1XAJBLIZWo3a4r/jf/Zvf68XPJGlvr99/LrE0LSK6EXPVA==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
 <20211223111348.3532601-2-thierry.bultel@linatsea.fr>
 <20220105231654.GL614810@scaer>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <365b8f6c-18b5-e30b-3c94-4dff3c51215f@linatsea.fr>
Date: Thu, 6 Jan 2022 15:56:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105231654.GL614810@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3 2/3] package/dracut: new host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gQW5kIHdoYXQgYWJvdXQgZ2xpYmM/IG11c2w/Cj4KPiBDYW4gd2UgdW5jb25kaXRpb25hbGx5
IGluc3RhbGwgdGhlIG1vZHVsZXMgYW5kIGNoYW5nZSB0aGVpciBjaGVjaygpCj4gZnVuY3Rpb25z
IHRvIGRlY2lkZSB3aHRoZXIgdGhlIG1vZHVlbHMgaXMgdXNhYmxlIG9yIG5vdD8gT3Igc29tZXRo
aW5nCj4gZWxzZSBkeW5hbWljPwoKVGhlcmUgaXMgbm90IGV4dHJhIHdvcmsgdG8gZG8gZm9yIGds
aWJjICh0aGlzIGlzIG15IGRlZmF1bHQgCmNvbmZpZ3VyYXRpb24pLiBJIGRpZCBub3QgdGVzdCB3
aXRoIG11c2wsIHlldC4KCj4+ICtpZmVxICgkKEJSMl9JTklUX0JVU1lCT1gpLHkpCj4+ICtkZWZp
bmUgSE9TVF9EUkFDVVRfUE9TVF9JTlNUQUxMX0JVU1lCT1hfTU9EVUxFCj4+ICsJJChJTlNUQUxM
KSAtRCAtbSAwNzU1IHBhY2thZ2UvZHJhY3V0LzA1YnVzeWJveC1idWlsZHJvb3QvbW9kdWxlLXNl
dHVwLnNoIFwKPj4gKwkJJChIT1NUX0RJUikvbGliL2RyYWN1dC9tb2R1bGVzLmQvMDVidXN5Ym94
LWJ1aWxkcm9vdC9tb2R1bGUtc2V0dXAuc2gKPj4gK2VuZGVmCj4+ICtIT1NUX0RSQUNVVF9QT1NU
X0lOU1RBTExfSE9PS1MrPUhPU1RfRFJBQ1VUX1BPU1RfSU5TVEFMTF9CVVNZQk9YX01PRFVMRQo+
IEFuZCB3aGF0IGFib3V0IHN5c3RlbWQgYXMgYW4gaW5pdCBzeXN0ZW0/IG9wZW5yYz8gc3lzdi1p
bml0PyBPdGhlcnM/CktlZXBpbmcgaW4gbWluZCB0aGF0IHN5c3RlbWQgaXMgdGhlIG9mZmljaWFs
bHkgc3VwcG9ydGVkIGluaXQgc3lzdGVtIGJ5IApkcmFjdXQsIHRoZXJlIGlzIG5vIGV4dHJhIHdv
cmsKZm9yIGl0LiBIb3dldmVyLCBJIGJyb3VnaHQgc3VwcG9ydCBmb3IgYnVzeWJveCBpbml0LCB0
aHJvdWdoIHRoZSBhYm92ZSAKZHJhY3V0IG1vZHVsZSAoMDVidXN5Ym94LWJ1aWxkcm9vdCkuCkFk
ZGluZyBzdXBwb3J0IGZvciB0aGUgb3RoZXIgb25lcyBjb3VsZCBiZSBkb25lIGxhdGVyLCBzbyBJ
IHN1Z2dlc3Qgd2UgCnNpbXBseSBkaXNhYmxlIGRyYWN1dCB3aGVuIHRoZQppbml0IHN5c3RlbSBp
cyBub3Qgc3VwcG9ydGVkOyBieSBhZGRpbmcKCiDCoMKgwqAgZGVwZW5kcyBvbiAhQlIyX0lOSVRf
U1lTVgogwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9JTklUX09QRU5SQwoKaW4gQ29uZmlnLmluLmhv
c3Q7IHdpdGggdGhlIGFwcHJvcHJpYXRlIGNvbW1lbnQuIERvZXMgdGhhdCBzb3VuZCAKYWNjZXB0
YWJsZSA/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
