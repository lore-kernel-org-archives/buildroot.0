Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBF2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 10:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E36DB40ADC;
	Thu, 17 Mar 2022 10:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euVJIyhX7INV; Thu, 17 Mar 2022 10:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC2724052B;
	Thu, 17 Mar 2022 10:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 322C11BF2CA
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 10:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 206EE84354
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 10:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30id-VNYHfMm for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 10:06:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C879A8434D
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 10:06:21 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 p10-20020a056820044a00b00320d7d4af22so5846923oou.4
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D4ODI7gFnwNxL+eLtqLw4jRdxAE6wICXpYYuwHyR4NE=;
 b=J4q3GF5RXISIIzQPKUPUPxxM8QjLkmUyR4NNr+eB9TSoZgp1KJqVJ/JlEwGC+/Lje9
 OKbyB22kjgur7US0FVwfX12sP6/w3fQrji3/C+7asDCS7x6nzN2P+Qet9us8Wr9tc77G
 tMRVNNeKrr92itVCpOA+v30GKe9XusYAl4XslgvwSFYlEthEAy9W8aQaHjgH6XKI+OER
 XqvYas6CTVKZb2zOTQMyp9xA4cyREqo6OQeJlqDKoL47qgzJPesf2BroVccR7UJpeC8o
 DGPbOMDPus+4+6oIoPYDSNBJknPWS4Iwg1zKbb+vrqWnDA77RViivrL419lFv1V03Sse
 +Ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D4ODI7gFnwNxL+eLtqLw4jRdxAE6wICXpYYuwHyR4NE=;
 b=4bsIp3Yt1MEjnQMC6zsrel4eV0+9mL4ISV35g7wtpljjSXldnCEyQDsiiSf7X+scRo
 iT/dPWDSmEOqA+Zov9VF3nenkq5zwZd0h6LslfuTBLfGzYpUp7P8DP2wTum5sivcLiW4
 YDRCjOKmKf0XuFoYVdYIALm5JnW5HR/5t2CG5/0jhdaqq1Si5cCa3yuxgKlpAIGUEQ0t
 xqZpVkfSMJFG1NLVmImNJ95HtWFYTPlyuyjbmktEdwq73ZND8HB1pTz7M1PI7qbgKBi5
 z8jPswvggNpnGCKPFdLhXroNxf5j0cKVmrBwhJwqQmYlCcQ9PGuGE5Qqg9R60eGqNYVb
 4CGA==
X-Gm-Message-State: AOAM531Ohl7bpLovGIcaSiTn2uYa4SKof+EsVxS0rGNKSZaGX1FSKvbZ
 SFT+FXREDFvh7mFNgr08Frz2+LdRfCWSL1Zk/ps=
X-Google-Smtp-Source: ABdhPJy1wTM1HA5VDdjM535Z77yIDn0Ozx+tgiQMJAeZvaewC/0Fv7URgn+bvt3pkhP8hHTGXaw8hYtCHeXpN0SV914=
X-Received: by 2002:a05:6870:d28d:b0:da:b3f:3234 with SMTP id
 d13-20020a056870d28d00b000da0b3f3234mr1326697oae.228.1647511580651; Thu, 17
 Mar 2022 03:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <YQXPR01MB6121BE84B9F8581AC02FCD43AE119@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YQXPR01MB6121BE84B9F8581AC02FCD43AE119@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 17 Mar 2022 11:06:09 +0100
Message-ID: <CAPi7W83bsJA_-nmeyzWmpv1r+dOerjVaZ_6MvyE1RW_R0EgYEw@mail.gmail.com>
To: "Sassen, Rutger" <rsassen@comecer.com>
Subject: Re: [Buildroot] package gdk-pixbuf relocatable issue
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSBtZXIuIDE2IG1hcnMgMjAyMiDDoCAxMjowOSwgU2Fzc2VuLCBSdXRnZXIgPHJz
YXNzZW5AY29tZWNlci5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvLAo+Cj4gQSByZWNlbnQgcGF0
Y2ggZm9yIHBhY2thZ2UgZ2RrLXBpeGJ1ZiB0byBlbmFibGUgdGhlIHJlbG9jYXRhYmxlIG9wdGlv
biBmb3IgdGhlIGhvc3QgcGFja2FnZSBoYXMgaW50cm9kdWNlZCBhIHByb2JsZW0gZm9yIHRoZSB0
YXJnZXQgcGFja2FnZS4KPgo+IFRoZSBsb2FkZXJzLmNhY2hlIGZvciB0aGUgdGFyZ2V0IGN1cnJl
bnRseSBpcyBnZW5lcmF0ZWQgYnkgY29weWluZyB0aGUgbG9hZGVycy5jYWNoZSBmcm9tIHRoZSBo
b3N0IHBhY2thZ2UgYW5kIGVkaXRpbmcgaXQgdXNpbmcgYSBzZWQgY29tbWFuZCB0byByZXBsYWNl
IHRoZSBob3N0IHBhdGhzIHdpdGggdGFyZ2V0IHBhdGhzLiBUaGUgc2VkIGNvbW1hbmQgaXMgbm8g
bG9uZ2VyIGNvcnJlY3QsIHNpbmNlIHRoZSBob3N0IGxvYWRlcnMuY2FjaGUgZG9lcyBub3QgY29u
dGFpbiBhYnNvbHV0ZSBwYXRocyBhbnltb3JlLgo+Cj4gVGhlIGNvbnNlcXVlbmNlIGlzLCB0aGF0
IHRoZSB0YXJnZXQgbG9hZGVycy5jYWNoZSBub3cgY29udGFpbnMgZW50cmllcyBsaWtlICJsaWIv
Z2RrLXBpeGJ1Zi0yLjAvMi4xMC4wL2xvYWRlcnMvbGlicGl4YnVmbG9hZGVyLSoiLiBUaGVzZSBw
YXRocyBhcmUgaW5jb3JyZWN0LCBhbmQgYXBwbGljYXRpb25zIHVzaW5nIGdkay1waXhidWYgd2ls
bCBjcmFzaCBiZWNhdXNlIHRoZXkgYXJlIG5vIGxvbmdlciBhYmxlIHRvIGxvYWQgaW1hZ2VzLiBC
ZWZvcmUgdGhlIHBhdGNoLCBpdCB3b3VsZCBjb250YWluIGFic29sdXRlIHBhdGhzIGxpa2UgIi91
c3IvbGliL2dkay1waXhidWYtMi4wLzIuMTAuMC9sb2FkZXJzL2xpYnBpeGJ1ZmxvYWRlci0qIi4K
Pgo+IEknbSBub3Qgc3VyZSB3aGF0IHRoZSBiZXN0IGFwcHJvYWNoIHdvdWxkIGJlIHRvIGZpeCB0
aGlzIGlzc3VlLiBFaXRoZXIgYnkgbW9kaWZ5aW5nIHRoZSBTRUQgc3RhdGVtZW50LCBvciBieSBt
b2RpZnlpbmcgdGhlIHdheSB0aGUgdGFyZ2V0IGxvYWRlcnMuY2FjaGUgaXMgZ2VuZXJhdGVkIChp
LmUuIGJ5IG5vdCB1c2luZyB0aGUgaG9zdCBsb2FkZXJzLmNhY2hlIGFzIGEgYmFzZSkuCgpUaGFu
a3MgZm9yIHNwb3R0aW5nIHRoaXMgaXNzdWUsIEkgdGhpbmsgdGhlIGJlc3QgYXBwcm9hY2ggaXMg
dG86CiAtIHNldCByZWxvY2F0YWJsZSB0byB0cnVlIGZvciB0aGUgdGFyZ2V0IChzZWUKaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDIxOTEy
MjUyNi4yOTU0MzU0LTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20pCiAtIGRyb3AgR0RLX1BJ
WEJVRl9VUERBVEVfQ0FDSEUgKHdoaWNoIGhhcyBubyBlZmZlY3QgYW55bW9yZSkKCkNhbiB5b3Ug
Y29uZmlybSB0aGF0IHRoaXMgYXBwcm9hY2ggaXMgd29ya2luZz8KSW4gdGhpcyBjYXNlLCBjYW4g
eW91IHNlbmQgYSBwYXRjaCB0byB0aGUgbWFpbGluZyBsaXN0Pwo+Cj4gTXkgY29uZmlndXJhdGlv
bjoKPiBIb3N0OiBEZWJpYW4gMTAgKGJ1c3RlcikKPiBCdWlsZHJvb3QgdmVyc2lvbjogMjAyMi0w
Mgo+IFRhcmdldDogQWFyY2g2NCAocmFzcGJlcnJ5IHBpIGNtMykKPiBQYWNrYWdlOiBnZGstcGl4
YnVmCj4KPiBUaGUgcHJvYmxlbWF0aWMgc25pcHBldHMgZnJvbSBnZGstcGl4YnVmLm1rOgo+Cj4g
PT09PT09PT09PT09PT0KPiBIT1NUX0dES19QSVhCVUZfQ09ORl9PUFRTID0gXAo+IC1EZ2lvX3Nu
aWZmaW5nPWZhbHNlIFwKPiAtRGluc3RhbGxlZF90ZXN0cz1mYWxzZSBcCj4gLURpbnRyb3NwZWN0
aW9uPWRpc2FibGVkIFwKPiAtRHJlbG9jYXRhYmxlPXRydWUgXAo+IC1EbWFuPWZhbHNlCj4gPT09
PT09PT09PT09PT0KPiAjIGdkay1waXhidWYgcmVxdWlyZXMgdGhlIGxvYWRlcnMuY2FjaGUgZmls
ZSBwb3B1bGF0ZWQgdG8gd29yayBwcm9wZXJseQo+ICMgUmF0aGVyIHRoYW4gZG9pbmcgc28gYXQg
cnVudGltZSwgc2luY2UgdGhlIGZzIGNhbiBiZSByZWFkLW9ubHksIGRvIHNvCj4gIyBoZXJlIGFm
dGVyIGJ1aWxkaW5nIGFuZCBpbnN0YWxsaW5nIHRvIHRhcmdldC4KPiAjIEFuZCBzaW5jZSB0aGUg
Y2FjaGUgZmlsZSB3aWxsIGNvbnRhaW4gYWJzb2x1dGUgaG9zdCBkaXJlY3RvcnkgbmFtZXMgd2UK
PiAjIG5lZWQgdG8gc2FuaXRpemUgKHN0cmlwKSB0aGVtLgo+IGlmZXEgKCQoQlIyX1NUQVRJQ19M
SUJTKSwpCj4gZGVmaW5lIEdES19QSVhCVUZfVVBEQVRFX0NBQ0hFCj4gR0RLX1BJWEJVRl9NT0RV
TEVESVI9JChIT1NUX0RJUikvbGliL2dkay1waXhidWYtMi4wLzIuMTAuMC9sb2FkZXJzIFwKPiAk
KEhPU1RfRElSKS9iaW4vZ2RrLXBpeGJ1Zi1xdWVyeS1sb2FkZXJzIFwKPiA+ICQoVEFSR0VUX0RJ
UikvdXNyL2xpYi9nZGstcGl4YnVmLTIuMC8yLjEwLjAvbG9hZGVycy5jYWNoZQo+ICQoU0VEKSAi
cywkKEhPU1RfRElSKS9saWIsL3Vzci9saWIsZyIgXAo+ICQoVEFSR0VUX0RJUikvdXNyL2xpYi9n
ZGstcGl4YnVmLTIuMC8yLjEwLjAvbG9hZGVycy5jYWNoZQo+IGVuZGVmCj4gR0RLX1BJWEJVRl9Q
T1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9IEdES19QSVhCVUZfVVBEQVRFX0NBQ0hFCj4gZW5k
aWYKPiA9PT09PT09PT09PT09PQo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gUnV0Z2VyIFNhc3Nlbgo+
Cj4gcC5zLiBwbGVhc2UgaWdub3JlIHRoZSBlbWFpbCBkaXNjbGFpbWVyIHRoYXQgaXMgYXV0b21h
dGljYWxseSBhZGRlZCB0byBhbGwgbXkgb3V0Z29pbmcgbWFpbC4uLgo+Cj4KPiBEaXNjbGFpbWVy
Cj4KPiBUaGlzIGVtYWlsIGNvbW11bmljYXRpb24gaXMgQ09ORklERU5USUFMLiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCB5b3UgbWF5IG5vdCB1c2UsIGNvcHkgb3IgZGlz
Y2xvc2UgdG8gYW55b25lIHRoZSBtZXNzYWdlIG9yIGFueSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhlIG1lc3NhZ2UgYW5kIEkgYXNrIHRoYXQgeW91IHBsZWFzZSBub3RpZnkgbWUgYnkgcmV0
dXJuIGVtYWlsIGFuZCBkZWxldGUgdGhpcyBjb21tdW5pY2F0aW9uIGltbWVkaWF0ZWx5LiBUaGFu
ayB5b3UuCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
