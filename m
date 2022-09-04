Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C3C6FA82
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 07:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69C02814A0;
	Sun,  4 Sep 2022 07:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C02814A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x47SS2P-z4tw; Sun,  4 Sep 2022 07:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA7A817AB;
	Sun,  4 Sep 2022 07:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA7A817AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B92B1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14002817AB
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14002817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9dec0DS5Sei for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 07:16:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D4F6817A8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D4F6817A8
 for <buildroot@busybox.net>; Sun,  4 Sep 2022 07:16:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4ec6:5d03:99e:22c7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DBFE513F86F;
 Sun,  4 Sep 2022 09:16:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Sep 2022 09:16:26 +0200
Date: Sun, 4 Sep 2022 09:16:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220904071626.GP68979@scaer>
References: <20220903092701.1848400-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903092701.1848400-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662275789;
 bh=7B4eJmduFp5UJuNdpVoTp9cgdoq8lW4ZSPMlMIFu9cY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H6uVNM4+GOrDXye/s+Y6TMwmJ/6yxg4kbOH1tLgpNf05QXwWFJxdF7V2BUxuXRNff
 2NV9S4Dizy7DNcpaIVaqNEbdrFrYCx2b7SL59D9j9VwG4RujJNuiYOrnBKU+WT6jc/
 eIst2wJjibItBaSyXrE4umY4aXlf9/wrj5YDkvIyWLJ8G5jZOxu2G4kl4VjyCJ435x
 lzgdj6tzJnzH31t+BQpRBWypEMwrIU+0yZ3ViJaPzXUnB4dCa9TTyTlezidj0/OsIb
 GVxjA4jWWNSXYQYhVzNWdiZT6eE45cm7786EAVEBB9dJAEX2D0ZoDU72cynaGVppQU
 hLOntRS7ieSZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H6uVNM4+
Subject: Re: [Buildroot] [PATCH] package/mosquitto: security bump to version
 2.0.15
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA5LTAzIDExOjI3ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IHNlZSBodHRwczovL21vc3F1aXR0by5vcmcvYmxvZy8yMDIyLzA4
L3ZlcnNpb24tMi0wLTE1LXJlbGVhc2VkLwo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBl
cnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgoKU2VjdXJpdHkgZml4LCBidWcgZml4OiBh
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0t
Cj4gIHBhY2thZ2UvbW9zcXVpdHRvL0NvbmZpZy5pbiAgICAgIHwgMiArLQo+ICBwYWNrYWdlL21v
c3F1aXR0by9tb3NxdWl0dG8uaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL21vc3F1aXR0by9tb3Nx
dWl0dG8ubWsgICB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW9zcXVpdHRvL0NvbmZpZy5p
biBiL3BhY2thZ2UvbW9zcXVpdHRvL0NvbmZpZy5pbgo+IGluZGV4IGI0ZWZmYTM2Yi4uNmZhNWY3
OWM2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbW9zcXVpdHRvL0NvbmZpZy5pbgo+ICsrKyBiL3Bh
Y2thZ2UvbW9zcXVpdHRvL0NvbmZpZy5pbgo+IEBAIC0xNyw3ICsxNyw3IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9NT1NRVUlUVE8KPiAgCSAgaW1wbGVtZW50aW5nIE1RVFQgY2xpZW50cywgYW5kIHRo
ZSB2ZXJ5IHBvcHVsYXIgbW9zcXVpdHRvX3B1Ygo+ICAJICBhbmQgbW9zcXVpdHRvX3N1YiBjb21t
YW5kIGxpbmUgTVFUVCBjbGllbnRzLgo+ICAKPiAtCSAgaHR0cDovL21vc3F1aXR0by5vcmcvCj4g
KwkgIGh0dHBzOi8vbW9zcXVpdHRvLm9yZy8KPiAgCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9NT1NR
VUlUVE9fQlJPS0VSCj4gIAlib29sICJpbnN0YWxsIHRoZSBtb3NxdWl0dG8gYnJva2VyIgo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL21vc3F1aXR0by9tb3NxdWl0dG8uaGFzaCBiL3BhY2thZ2UvbW9z
cXVpdHRvL21vc3F1aXR0by5oYXNoCj4gaW5kZXggMjRiODg2OWQxLi4yY2ZkMGQ5NDIgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9tb3NxdWl0dG8vbW9zcXVpdHRvLmhhc2gKPiArKysgYi9wYWNrYWdl
L21vc3F1aXR0by9tb3NxdWl0dG8uaGFzaAo+IEBAIC0xLDYgKzEsNiBAQAo+ICAjIExvY2FsbHkg
Y2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBncGcgc2lnbmF0dXJlCj4gLSMgZnJvbSBodHRwczov
L21vc3F1aXR0by5vcmcvZmlsZXMvc291cmNlL21vc3F1aXR0by0yLjAuMTMudGFyLmd6LmFzYwo+
IC1zaGEyNTYgIGQwZGRlOGZkYjEyY2FmNmUyNDI2YjRmMjgwODE5MTlhMmZjZTM0NDg3NzNiZGI4
YWYwZDNjZDVmZTU3NzY5MjUgIG1vc3F1aXR0by0yLjAuMTQudGFyLmd6Cj4gKyMgZnJvbSBodHRw
czovL21vc3F1aXR0by5vcmcvZmlsZXMvc291cmNlL21vc3F1aXR0by0yLjAuMTUudGFyLmd6LmFz
Ywo+ICtzaGEyNTYgIDQ3MzViMWQzMmUzZjkxYzdhODg5Njc0MWQ4OGEzMDIyZTg5NzMwYTFlZTg5
Nzk0NmRlY2ZhMGRmMjcwMzlhYzYgIG1vc3F1aXR0by0yLjAuMTUudGFyLmd6Cj4gIAo+ICAjIExp
Y2Vuc2UgZmlsZXMKPiAgc2hhMjU2ICBkM2M0Y2NhY2U0ZTVkM2NjODlkMzRjZjJhMGJjODViODU5
NmJmYzBhMzJiODE1ZDBkNzdmOWI3YzQxYjUzNTBjICBMSUNFTlNFLnR4dAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL21vc3F1aXR0by9tb3NxdWl0dG8ubWsgYi9wYWNrYWdlL21vc3F1aXR0by9tb3Nx
dWl0dG8ubWsKPiBpbmRleCAzZTdhNzI4YWMuLmM0N2U2MTg1MCAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL21vc3F1aXR0by9tb3NxdWl0dG8ubWsKPiArKysgYi9wYWNrYWdlL21vc3F1aXR0by9tb3Nx
dWl0dG8ubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAKPiAtTU9TUVVJVFRPX1ZFUlNJT04gPSAyLjAuMTQKPiArTU9TUVVJVFRPX1ZFUlNJT04g
PSAyLjAuMTUKPiAgTU9TUVVJVFRPX1NJVEUgPSBodHRwczovL21vc3F1aXR0by5vcmcvZmlsZXMv
c291cmNlCj4gIE1PU1FVSVRUT19MSUNFTlNFID0gRVBMLTIuMCBvciBFREx2MS4wCj4gIE1PU1FV
SVRUT19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQgZXBsLXYyMCBlZGwtdjEwCj4gLS0gCj4g
Mi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0t
IAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
