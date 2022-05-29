Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69EFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E4C8403C8;
	Sun, 29 May 2022 21:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Knn0gWgTWF38; Sun, 29 May 2022 21:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B2540351;
	Sun, 29 May 2022 21:47:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAAE11BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA07A82EC7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqftyf_1ct1g for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:47:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D855F82EB6
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:47:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 104757802B2;
 Sun, 29 May 2022 23:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653860823;
 bh=fcZqb2b24bQn8Wl+xviiP5lLhHdpqUnWqKYpb0T1kFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qc7BPyrX7cDR2gOl/zoDZL3VSPC8gCaCydyBNm1L0vaVF1Z5eKEerouJ6HGS3iNVW
 1/JP2xky6Ie9AuO8WKarl2KMMf/ePnx8vXRBLbiTWt7IM/VgdJHXI4U4ACCTz2baYw
 HPqnV+E0gWFZZZoO8LilESVK6d19zCqioX5K/G5kXmLTxJfPa7lQCOgpxfj16l5Vyj
 PhpLvFsODR3O4UYwGf3I0nEd+iTbp8qdI93/UIyZ18nMsFwb7Sp4Sgl/E31GB0cwOu
 k4V5IL+qlSYOLDB7p0NCvDWmRwYZT3mG/QnHBy0AQG+yiNgxoH0JK2W9XTIbAsegZ7
 Nq8usYzDylMcw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 23:46:57 +0200
Date: Sun, 29 May 2022 23:46:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220529214657.GM993669@scaer>
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
 <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
 <CADvTj4re+hCC9n=HRMsLQ+SaEPPH=XBkCG83mTp_U79rr9Nvyg@mail.gmail.com>
 <e3350a95-d9ca-8d7d-0f48-22c86289a3db@gmail.com>
 <CADvTj4rWQx=g3MK6AoV7bbRS7ZOA4K7SMR2Qb+OhaOdX4y8odg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rWQx=g3MK6AoV7bbRS7ZOA4K7SMR2Qb+OhaOdX4y8odg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 2.1.2
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
Cc: Romain Naour <romain.naour@gmail.com>, Lionel Flandrin <lionel@svkt.org>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjItMDUtMjkgMTQ6MTcgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIE1heSAyOSwgMjAyMiwgMTo1MyBQTSBSb21haW4gTmFvdXIg
PCBbMV1yb21haW4ubmFvdXJAZ21haWwuY29tPiB3cm90ZToKPiAgIExlIDI5LzA1LzIwMjIgw6Ag
MjE6NDEsIEphbWVzIEhpbGxpYXJkIGEgw6ljcml0wqA6Cj4gICA+IE9uIFN1biwgTWF5IDI5LCAy
MDIyLCAxOjI5IFBNIFJvbWFpbiBOYW91ciA8IFsyXXJvbWFpbi5uYW91ckBnbWFpbC5jb20KPiAg
ID4gPG1haWx0bzogWzNdcm9tYWluLm5hb3VyQGdtYWlsLmNvbT4+IHdyb3RlOgpbLS1TTklQLS1d
Cj4gICA+wqAgwqAgwqBEbyB5b3Uga25vdyBpZiBidW1waW5nIHB5dGhvbi1mbGFzaCBhbmQgcHl0
aG9uLXdlcmt6ZXVnIG1heSBpbnRyb2R1Y2Ugb3RoZXIKPiAgID7CoCDCoCDCoHJ1bnRpbWUgaXNz
dWU/IElzIGFueSBmb2xsb3d1cCB2ZXJzaW9uIGJ1bXAgcmVxdWlyZWQ/Cj4gICA+IEkgc2VudCBh
IGZldyBweXRob24gcGFja2FnZSBidW1wcyB0aGF0IHNob3VsZCBmaXggaXQuCj4gICBPaywgYnV0
IGl0J3Mgbm90IGV4cGxpY2l0bHkgc3RhdGVkIGlmIGl0J3MgaW50ZW5kZWQgZm9yIG1hc3RlciAo
dXBjb21pbmcKPiAgIDIwMjIuMDUpIG9yIG5leHQgYnJhbmNoLgo+ICAgQ2FuIHlvdSBsaXN0IHdo
aWNoIHBhdGNoIG11c3QgYmUgbWVyZ2VkIGluIG1hc3Rlcj8KPiBJIHRoaW5rIGFsbCBteSBweXRo
b24gcGF0Y2hlcyB0aGF0IHdlcmUgc2VudCBpbiB0aGUgMTd0aDoKPiBbNl1odHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3N1Ym1pdHRlcj02NjMwMQoK
V2Ugd2VyZSByZWFsbHkgbGF0ZSBpbiB0aGlzIGN5Y2xlLCBidXQgcmMxIHdhcyB0YWdnZWQgb24g
dGhlIDE4dGgsIGp1c3QKYSBkYXkgYWZ0ZXIgeW91IHNlbnQgeW91ciBweXRob24gYnVtcHMsIHNv
IHRoZXkgY291bGQgbm90IGFsbCBiZQphcHBsaWVkLCBleGNlcHQgZm9yIHB5dGhvbi1mbGFzayBh
bmQgcHl0aG9uLXdlcmt6ZXVnIHdoaWNoIGRvIGZpeCBhCnJ1bnRpbWUgdGVzdC4KCklmIHRoZSBy
ZXN0IGFyZSByZWxhdGVkIHRvIHRoZSBmbGFzayBhbmQgd2Vya3pldWcgYW5kIG5lZWQgdG8gYmUg
dXBkYXRlZCAKdG9nZXRoZXIgaW4gbG9jay1zdGVwLCB0aGVuIHRoZXkgc2hvdWxkIGhhdmUgYmVl
biBncm91cGVkIGluIGEgc2VyaWVzCnRvZ2V0aGVyLgoKQW55d2F5LCBsZXQncyBzZWUgd2hhdCBv
dXIgZ2l0bGFiLWNpIHBpcGVsaW5lIHNob3dzIHdpdGgganVzdCBmbGFzayBhbmQKd2Vya3pldWcu
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
