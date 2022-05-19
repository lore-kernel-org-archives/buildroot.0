Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCE7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 07:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7922405E0;
	Thu, 19 May 2022 07:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNRcl8p7cClV; Thu, 19 May 2022 07:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA11E40126;
	Thu, 19 May 2022 07:26:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59B041BF393
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 07:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D3A83032
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 07:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=agner.ch
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2cGDuIdGzEw for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 07:26:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0F1482EF0
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:26:51 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 4CB385C4ED8;
 Thu, 19 May 2022 09:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1652945208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWx9mXmfr9yfd3y5A2AW5em1NQ0xiGxBt6NitD53CBI=;
 b=b42qIzJVFHk0BQkjsc4kXyWpat6Ke3jRojJv7Sne3XvdU00UTJQ+rDIgVnoswl4UZ9vL7W
 CpJqY9D3vNJHqncCmcekQ+7D0nB8zi9RLe6EtVpXlhPMkSCTHJOipM/O9mR+R2pOWz3DNg
 9znHptsA9y2v0kuEfEwCiGYpSCmmyGk=
MIME-Version: 1.0
Date: Thu, 19 May 2022 09:26:47 +0200
From: Stefan Agner <stefan@agner.ch>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <87pmkaqkuv.fsf@tarshish>
References: <fa9bd454f0e7d72a0eac64ddae226513b2968126.1652914532.git.stefan@agner.ch>
 <87pmkaqkuv.fsf@tarshish>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <10a2a6a7a65b927bd3833f2053fd4290@agner.ch>
X-Sender: stefan@agner.ch
Subject: Re: [Buildroot] [PATCH] package/openvmtools: bump version to 11.3.5
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
Cc: kaszak@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAyMi0wNS0xOSAwNTowNiwgQmFydWNoIFNpYWNoIHdyb3RlOgo+IEhpIFN0ZWZhbiwKPiAK
PiBPbiBUaHUsIE1heSAxOSAyMDIyLCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4+IFJlYmFzZSBwYXRj
aGVzIGFzIG5lY2Vzc2FyeSBhbmQgYnVtcCB2ZXJzaW9uIHRvIDExLjMuNS4gVGhpcyBhbGxvd3MK
Pj4gdG8gYnVpbGQgb3BlbnZtdG9vbHMgZm9yIGFhcmNoNjQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgo+PiAtLS0KPj4gIC4uLl9wb2xsLWgtdG8t
Zml4LWJ1aWxkLWZhaWx1cmUtb24tbXVzbC5wYXRjaCB8IDg1ICsrKysrKysrKysrLS0tLS0tLS0K
Pj4gIC4uLi10ZXN0LWZvci1mZWF0dXJlLWluc3RlYWQtb2YtcGxhdGZvci5wYXRjaCB8ICAxICsK
Pj4gIC4uLi8wMDA5LVNldC1wZXJtaXNzaW9ucy1vbi1ydWxlcy1maWxlLnBhdGNoICB8IDIzIC0t
LS0tCj4+ICAuLi4vMDAxMC1DaGFuZ2UtREVWUEFUSC10by1kZXZwYXRoLnBhdGNoICAgICAgfCAy
NSAtLS0tLS0KPj4gIHBhY2thZ2Uvb3BlbnZtdG9vbHMvb3BlbnZtdG9vbHMuaGFzaCAgICAgICAg
ICB8ICAyICstCj4+ICBwYWNrYWdlL29wZW52bXRvb2xzL29wZW52bXRvb2xzLm1rICAgICAgICAg
ICAgfCAgNCArLQo+PiAgNiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA4NiBkZWxl
dGlvbnMoLSkKPj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29wZW52bXRvb2xzLzAwMDkt
U2V0LXBlcm1pc3Npb25zLW9uLXJ1bGVzLWZpbGUucGF0Y2gKPj4gIGRlbGV0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL29wZW52bXRvb2xzLzAwMTAtQ2hhbmdlLURFVlBBVEgtdG8tZGV2cGF0aC5wYXRj
aAo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVudm10b29scy8wMDAzLVJlbmFtZS1wb2xs
LWgtaW50by12bV9wb2xsLWgtdG8tZml4LWJ1aWxkLWZhaWx1cmUtb24tbXVzbC5wYXRjaCBiL3Bh
Y2thZ2Uvb3BlbnZtdG9vbHMvMDAwMy1SZW5hbWUtcG9sbC1oLWludG8tdm1fcG9sbC1oLXRvLWZp
eC1idWlsZC1mYWlsdXJlLW9uLW11c2wucGF0Y2gKPj4gaW5kZXggZTk0OTVjZTQzZi4uNDc0OWYz
ZjQ2MiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9vcGVudm10b29scy8wMDAzLVJlbmFtZS1wb2xs
LWgtaW50by12bV9wb2xsLWgtdG8tZml4LWJ1aWxkLWZhaWx1cmUtb24tbXVzbC5wYXRjaAo+PiAr
KysgYi9wYWNrYWdlL29wZW52bXRvb2xzLzAwMDMtUmVuYW1lLXBvbGwtaC1pbnRvLXZtX3BvbGwt
aC10by1maXgtYnVpbGQtZmFpbHVyZS1vbi1tdXNsLnBhdGNoCj4+IEBAIC0xLDQgKzEsNSBAQAo+
PiAtRnJvbSA5ZDEzZTMyZTM2MmFkM2NlNTE2OWY0OWI3ZjBmZTFkOTM4MGU1NThjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbSAxZGZhYjQ2ZDM2N2QxMWU5MTMyNTA2ZWUwZjdkM2Vi
MmNlZmY1ZjNjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArTWVzc2FnZS1JZDogPDFkZmFi
NDZkMzY3ZDExZTkxMzI1MDZlZTBmN2QzZWIyY2VmZjVmM2MuMTY1MjkxMzgzMi5naXQuc3RlZmFu
QGFnbmVyLmNoPgo+PiAgRnJvbTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Cj4+ICBEYXRlOiBNb24sIDMwIFNlcCAyMDE5IDEzOjMyOjM1ICswMjAwCj4+ICBT
dWJqZWN0OiBbUEFUQ0hdIFJlbmFtZSBwb2xsLmggaW50byB2bV9wb2xsLmggdG8gZml4IGJ1aWxk
IGZhaWx1cmUgb24gbXVzbAo+PiBAQCAtMjUsNyArMjYsNyBAQCBhc3luY3NvY2tldC5jOjI1Mzg6
MzM6IGVycm9yOiDigJhQT0xMSU7igJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVu
Y3Rpbwo+PiAgICAgICAgICAgIHBmZFtpXS5ldmVudHMgPSByZWFkID8gUE9MTElOIDogUE9MTE9V
VDsKPj4KPj4gIFNvIHJlbmFtZSBwb2xsLmggaW50byB2bV9wb2xsLmggYXMgc3VnZ2VzdGVkIGJ5
IHNyb3dlIGluCj4+IC1odHRwczovL2dpdGh1Yi5jb20vdm13YXJlL29wZW4tdm0tdG9vbHMvaXNz
dWVzLzM1OSNpc3N1ZWNvbW1lbnQtNTMzNTI5OTU2Cj4+ICtodHRwczovL2dpdGh1Yi5jb20vdm13
YXJlL2lzc3Vlcy8zNTkjaXNzdWVjb21tZW50LTUzMzUyOTk1Ngo+IAo+IFRoaXMgbGVhZHMgdG8g
NDA0IGVycm9yIHBhZ2UuCgpVaCwgc2VkIGdvbmUgd2lsZCA6KS4KCldpbGwgc2VuZCB2Mi4KCi0t
ClN0ZWZhbgoKPiAKPj4gIEZpeGVzOgo+PiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvNGY1NzVlZjQyYmJjNDM4N2EwN2UzOTYyMDUwNTJiMmRhMDgxYzY0ZAo+PiBA
QCAtMzMsMjQgKzM0LDI0IEBAIEZpeGVzOgo+PiAgRml4ICMzNTkKPj4KPj4gIFNpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+PiAtW1Vw
c3RyZWFtIHN0YXR1czogaHR0cHM6Ly9naXRodWIuY29tL3Ztd2FyZS9vcGVuLXZtLXRvb2xzL3B1
bGwvMzgzXQo+PiArW1Vwc3RyZWFtIHN0YXR1czogaHR0cHM6Ly9naXRodWIuY29tL3Ztd2FyZS9w
dWxsLzM4M10KPiAKPiBBbHNvIGhlcmUuCj4gCj4gYmFydWNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
