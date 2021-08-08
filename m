Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C52C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A1960F42
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25A1960F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D28CA401E1;
	Sun,  8 Aug 2021 20:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3kt-dfSMYJZ; Sun,  8 Aug 2021 20:34:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDE46401E2;
	Sun,  8 Aug 2021 20:34:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1721BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A250401E2
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kq-EpnSeezZF for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:34:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE381401E1
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:34:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3dd8:70d6:61ba:47fd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3026320039C;
 Sun,  8 Aug 2021 22:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628454838;
 bh=1orFfOfAq2L6fU1dM7bkyWNNtTn3AQjp8kbJvWcoRFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FOEHlaG7UBzQGLXoCaYR8OI6vv4QYrSRh6qBBcGANMfxV0GgpXbWkAjCz1p259MW3
 0TXHFwrUN69QSg97g7Lzn7Pvleqdonm9rvsfl56/9YLFoV5HHH/PSTP/QmA98kxMUD
 5K8Twnm97+SU7ioMPnF+de1qgvU5bXoZFEFiQ7Br/NQXK6MAqIJj9FpUSpIPLjIhkO
 NjJ0W6ZAoSxH1qEjDiHMAs5wt+oS2qYcj/MiWspOo64XRyozVdXJ4eLSu5TehqljXq
 WxZGQrZWc3v0WGvSc19W/FdtqNsZsSDivZd3A5EGyIU3UvgZBk4EBl79+xmgPkm4ha
 elVUHLGaPaEvA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Aug 2021 22:33:51 +0200
Date: Sun, 8 Aug 2021 22:33:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <20210808203351.GN27036@scaer>
References: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
 <20210806125047.1832422-2-tomi.valkeinen@ideasonboard.com>
 <20210808092935.GK27036@scaer>
 <ee9c4a7c-82c2-3b5e-7e41-0bad306e80fe@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee9c4a7c-82c2-3b5e-7e41-0bad306e80fe@ideasonboard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/kmsxx: update to latest
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VG9taSwgQWxsLAoKT24gMjAyMS0wOC0wOCAyMToxMiArMDMwMCwgVG9taSBWYWxrZWluZW4gc3Bh
a2UgdGh1c2x5Ogo+IE9uIDA4LzA4LzIwMjEgMTI6MjksIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4g
Pk9uIDIwMjEtMDgtMDYgMTU6NTAgKzAzMDAsIFRvbWkgVmFsa2VpbmVuIHNwYWtlIHRodXNseToK
PiA+PldlIGNhbiBkcm9wIGFsbCB0aGUgcGF0Y2hlcyBhcyB0aGV5IGhhdmUgYmVlbiBzb3J0ZWQg
b3V0IGluIHVwc3RyZWFtLgpbLS1TTklQLS1dCj4gPj4tCS1Eb21hcD1kaXNhYmxlZCBcCj4gPj4t
CS1EdXNlLXN5c3RlbS1mbXQ9dHJ1ZSBcCj4gPj4tCS1EdXNlLXN5c3RlbS1weWJpbmQxMT10cnVl
Cj4gPlRob3NlIG9wdGlvbnMgaGF2ZSBiZWVuIGRyb3BwZWQgdXBzdHJlYW0uIERvZXMgdGhhdCBt
ZWFuIHRoYXQgdGhleSBub3cKPiA+YWx3YXlzIHVzZSBhIHN5c3RlbS1wcm92aWRlZCBmbXQgYW5k
IHB5YmluZDExLCBvciB0aGF0IHRoZXkgYWx3YXlzIHVzZQo+ID50aGVpciBidW5kbGVkIHZlcnNp
b25zPwpbLS1TTklQLS1dCj4gPkFwcGxpZWQgdG8gbmV4dCwgd2l0aCB0aGUgYWJvdmUgY2hhbmdl
cy4gVGhhbmtzLgo+IEFjdHVhbGx5LCBsb29rcyBsaWtlIEkgbWVzc2VkIHVwIGEgYml0LiBJIHdh
cyBwcm9iYWJseSBhIGJpdCB0aXJlZCBvbgo+IEZyaWRheS4uLgoKSXQgc2VlbXMgSSB0b28gd2Fz
IHByb2JhYmx5IG9mZiBteSBzaG9lczogSSBpbml0aWFsbHkgbWlzc2VkIHRoYXQKdXNlLXN5c3Rl
bS1mbXQgd2FzIGFkZGVkIGJ5IG9uZSBvZiB0aGUgcGF0Y2hlcyB3ZSBoYWQuCgpPaCwgSSBqdXN0
IHJlYWxpc2VkIHlvdSBhcmUgdGhlIHVwc3RyZWFtLiBHcmVhdCwgdGhhbmtzIGZvciBrZWVwaW5n
Cmttc3h4IHVwLXRvLWRhdGUgaW4gQnVpbGRyb290ISDwn5GNCgo+IC0gSSBkaWRuJ3QgcHVzaCBr
bXMrKyA4MjRiYmIxZjRjZDA2MmQ2NmI0NTdmYWNhNTBmOTA0YjM0ZGZkOTZjIHRvIG1hc3Rlcgo+
IGJyYW5jaC4gQnV0IGl0J3MgaW4gJ3RyYXZpcycgYnJhbmNoLCBzbyBpdCdzIGF2YWlsYWJsZSBm
b3IgZmV0Y2hpbmcuCgpJIHNlZSBpdCdzIGluIG1hc3RlciBub3cuCgo+IC0gSSBkcm9wcGVkIGJv
dGggc3lzdGVtLWZtdCBhbmQgc3lzdGVtLXB5YmluZDExIG9wdGlvbnMsIGFzIHRoZXkgZGlkbid0
IHNlZW0KPiBuZWNlc3NhcnkgWypdLiBIb3dldmVyLCBJIGZvcmdvdCB0byByZW1vdmUgc3lzdGVt
LXB5YmluZDExIGZyb20KPiBtZXNvbl9vcHRpb25zLnR4dCwgZXZlbiBpZiBpdCdzIG5vdCB1c2Vk
IGFueXdoZXJlLgoKQWgsIEkgb25seSBsb29rZWQgYXQgbWVzb25fb3B0aW9ucy50eHQuCgo+IC0g
TXkgcGF0Y2ggZGVzY3JpcHRpb25zIHdlcmUgc2hhbWVmdWxseSB0ZXJzZS4gU29ycnkgYWJvdXQg
dGhhdC4KClVzdWFsbHksIGEgdmVyc2lvbiBidW1wIGRvZXMgbm90IG5lZWQgbXVjaCBleHBsYW5h
dGlvbnMsIHNvIHlvdXIgY29tbWl0CmxvZyB3b3VsZCBoYXZlIGJlZW4gcHJldHR5IE9LLiBCdXQg
d2hlbiBvcHRpb25zIGdldCByZW1vdmVkLCBpdCdzIG5pY2UKdG8gaGF2ZSBhIGxpdHRsZSBibHVy
YiBhYm91dCBpdCwgaWYganVzdCB0byBhY2tub3dsZWRnZSB0aGUgcmVtb3ZhbCB3YXMKaW50ZW50
aW9uYWwuCgo+ICBUb21pCj4gCj4gWypdIEZvciBmbXQsIEkgZGlkbid0IHNlZSBhIG5lZWQgZm9y
IHVzaW5nIG1lc29uIHN1YnByb2plY3QgYXQgYWxsLCBhcyBmbXQKPiBzZWVtcyB0byBiZSBhdmFp
bGFibGUgImV2ZXJ5d2hlcmUiLCBhbmQgYWZhaWNzIGl0J3MgYmVlbiBxdWl0ZSBzdGFibGUuIEZv
cgo+IHB5YmluZDExLCBJIHN0aWxsIGxpa2UgdG8ga2VlcCB0aGUgb3B0aW9uIGZvciBtZXNvbiBz
dWJwcm9qZWN0IHRvIGVhc2lseQo+IHRlc3QvdXNlIHNwZWNpZmljIHZlcnNpb25zLiBIb3dldmVy
LCB0aGlzIGRvZXNuJ3QgbmVlZCBhbiBvcHRpb24gaW4KPiBtZXNvbi1vcHRpb24udHh0LCBhcyB0
aGUgYmVoYXZpb3Igb2YgdGhlIGZhbGxiYWNrLXRvLXN1YnByb2plY3QgY2FuIGJlCj4gbWFuYWdl
ZCB3aXRoIG1lc29uIGNvbW1hbmRsaW5lIG9wdGlvbnMuIEFsc28sIGlmICdweWttcycgb3B0aW9u
IGlzIHNldCB0bwo+IGRpc2FibGVkLCBweWJpbmQxMSBpcyBza2lwcGVkIGFsc28uCgpUaGUgdGhp
bmcgaXMsIGlmIHB5YmluZDExIGlzIG5vdCBhdmFpbGFibGUgaW4gdGhlIHN5c3RlbSwgdGhlbiBr
bXN4eAp3aWxsIGJ1aWxkIGl0cyBidW5kbGVkIHZlcnNpb24gd2hlbiBweWttcyBpcyBlbmFibGVk
LgoKU28sIGJ5IGZvcmNpYmx5IGRpc2FibGluZyBweWttcyBpbiBCdWlsZHJvb3QsIHRoaXMgbWVh
bnMgdGhhdCBweWJpbmQxMQppcyBub3QgbmVlZGVkIGFuZCB0aHVzIHRoZSBidW5kbGVkIHZlcnNp
b24gaXMgbm90IGJ1aWx0LgoKSSBhbSBieSBmYXIgbm90IGEgbWVzb24gZXhwZXJ0LCBzbyB3aGVu
IHlvdSBzYXkgInRoZSBmYWxsYmFjay10by1zdWJwcm9qZWN0CmNhbiBiZSBtYW5hZ2VkIHdpdGgg
bWVzb24gY29tbWFuZGxpbmUgb3B0aW9ucyIsIEknZCBiZSBtdWNoIGludGVyZXN0ZWQKaW4gaG9z
IHRvIGRvIHRoYXQsIHNvIHRoYXQgaW4gQnVpbGRyb3Qgd2Uga25vdyBob3cgdG8gZm9yY2libHkg
Zm9yYmlkCmJ1bmRsZWQgc3ViLXByb2plY3RzIChvciB3cmFwcz8pIHRvIGJlIHVzZWQuLi4KClRo
YW5rcyBhZmFpbiBmb3IgeW91ciBwYXRjaGVzISA6LSkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4u
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
