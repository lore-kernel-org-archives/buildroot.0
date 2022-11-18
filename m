Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A467EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 15:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F17B94198F;
	Fri, 18 Nov 2022 15:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17B94198F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUY4zo7Zzusn; Fri, 18 Nov 2022 15:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F9C416BE;
	Fri, 18 Nov 2022 15:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F9C416BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39E3B1BF592
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 15:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DBC2416BE
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 15:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DBC2416BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SXQQUdreWMK for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 15:55:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7724E41626
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7724E41626
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 15:55:44 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MC2o9-1oo2xK2PK1-00COJJ; Fri, 18 Nov 2022 16:55:39 +0100
Message-ID: <88b60aea-117a-4b1a-2323-ac0b4ce1db33@vivier.eu>
Date: Fri, 18 Nov 2022 16:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: fr
To: buildroot@buildroot.org
References: <20221118141435.1084565-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221118141435.1084565-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:T56jpSIcGxdJn5O9Mm4KaTF2fm6+oMsVu0rAjNjrftDd0T5L5nd
 +wEpAEs2UC2mY29kYozLX8dD3euWMxWn5zbq/JCL/bV88TNHUGEeLhginVbvT3Tx5r7QiRN
 vnifcbjwZy41Gmro/FxqbNY2vn2qpokVo97NtFByCNftKo7U4JHlgJtAwjhW8cRUWEK3Rq7
 JZJ1BwopYu72BqMa6l51w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:snx8ZNN5iKU=:Y2g7wPjjKdCYTWP4yTDWXU
 vdDXz4+eR/ssf2vM7907syucH3rKUpsE3CRBeDcE8ALezCIXAyHRdmaWbSyHZFCvsYcl39Q4x
 mTG6QNNlxf2mrKkpWOFfI4taMxYZj9xBG8kDZiLBYSKjlu7xDm8TASrbMU6HgOy3eMCZSkn2q
 MXzIrB+/WOXLrmhMQC9eTKbSYmqUm61xXNps0WUf8GbNyd5z3gwhbf5BHDH9qTtp/QC36LgHz
 uhFC45ZWfh2OusfM3TjVeeF2egI2dnyDBzGj/E53KgQ3vON3etu603et354UxdnH0DbE0ADTD
 VbuN34J0XFGfgQkLp9zE5ZJNNDIoifEVb3VL1D5+uU3KPaJzeIWrBQY/kWAL9gsBz1GiRkrI5
 P6ACB29MRo1rWe0Nk3kXdEEIe4voUvNXG78m18F7FhCaVwt4ogupWHxjxE+Nj0S87a5D5KL7Z
 KOW0EnDTwyM/3HDaqU3v/I1cR1Yu3gow1XJufeFfKMKUwrl38GNKJDTie+GSvkqB2J/RiMzs5
 dGgLb/u2Y209Dy4E/cCqnoZ8kd6vE3Swh5NA3TEGQwfNS8D7rReLdEXk5PsAfhhmc/IZ0kKlr
 z9Et1MFwXNy1cE2rTe0u2lxQvu4ac42BwZhcGmoB1gBeq+YgAZIO8Q1oDJExOiZs+BW3VT0v2
 P+122zoR98yGRLSiS/hhZBqkWM5DC4ZH4gTd0ENKKJBH6HpgLNaYMq/AWqEtCdsRCHnAu/hjs
 mcGcBkSm7n1RO9a+MB/qTtEYu7v/swFlYPWlZDy3XLawHd/oBiptb8DmvAQ2tmoEWoFSBUgxq
 h1Rp2SX
Subject: Re: [Buildroot] [PATCH v7 0/3] package: add petitboot to use with
 qemu-system-m68k
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTgvMTEvMjAyMiDDoCAxNToxNCwgTGF1cmVudCBWaXZpZXIgYSDDqWNyaXTCoDoKPiBxZW11
LXN5c3RlbS1tNjhrIGhhcyBpbnRyb2R1Y2VkIGluIHY2LjAgYSBuZXcgcHVyZSB2aXJ0dWFsIG1h
Y2hpbmUKPiB0aGF0IGlzIG5vdyBzdXBwb3J0ZWQgYnkgbGludXggdjUuMTkuCj4gCj4gVGhlIGdv
YWwgb2YgdGhpcyBzZXJpZXMgaXMgdG8gcHJvdmlkZSBwZXRpdGJvb3QgYXMgYW4gZW1iZWRkZWQg
Ym9vdGxvYWRlcgo+IGZvciBpdCAobGlrZSBpdCBpcyBmb3IgdGhlIElCTSBzcGFwciBtYWNoaW5l
KS4KPiAKPiBUaGUgZmlyc3QgcGF0Y2ggaW50cm9kdWNlcyBwZXRpdGJvb3QgcGFja2FnZSwgdGhl
IHNlY29uZCBwYXRjaCB0aGUKPiBjb25maWd1cmF0aW9uIHRvIGJ1aWxkIGJ1aWxkcm9vdCB3aXRo
IHBldGl0Ym9vdCBmb3IgdGhlIFFFTVUgbWFjaGluZS4KPiAKPiBZb3UgY2FuIHRlc3QgaXQgd2l0
aDoKPiAKPiAgICBxZW11LXN5c3RlbS1tNjhrIC1NIHZpcnQgLWtlcm5lbCBpbWFnZXMvdm1saW51
eCBcCj4gICAgICAgICAgICAgICAgICAgICAtaW5pdHJkIGltYWdlcy9yb290ZnMuY3Bpby54eiBc
Cj4gICAgICAgICAgICAgICAgICAgICAtYXBwZW5kICJjb25zb2xlPXR0eUdGMCIgLS1ub2dyYXBo
aWMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+
Cj4gCj4gdjc6Cj4gICAgLSBzZXQgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RP
TV81XzE5PXkKPiAgICAtIGZpeCBlcnJvcnMgcmVwb3J0ZWQgYnkgY2hlY2stcGFja2FnZQo+ICAg
IC0gYWRkIGdpdGxhYiB0ZXN0aW5nIChDw6lkcmljKQo+ICAgIC0gdXBkYXRlIGJvb3QtcWVtdS1p
bWFnZS5weSB0byBzdXBwb3J0IHBldGl0Ym9vdAoKUUVNVSB0ZXN0aW5nIHJlc3VsdCB3aXRoIGdp
dGxhYjoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9sYXVyZW50X3Zpdmllci9idWlsZHJvb3QvLS9waXBl
bGluZXMvNjk4ODM4NjM4CgpUaGFua3MsCkxhdXJlbnQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
