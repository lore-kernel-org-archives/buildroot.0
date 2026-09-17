Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEF8C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD2380DDE;
	Thu, 17 Sep 2026 21:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6ywcjT-p0be; Thu, 17 Sep 2026 21:00:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1173B81101
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789678858;
	b=Nl63THF9JiwtEkm2mJ0QBRdHsnOZxdfpTP/kkV52EkVq1zdgtiwqN9RiNbJB62bToqoU
	 n5YZuWKi5lxbcPj+gxMMlJDfRc9wtQEWQ76ytkbQiKhhf9qyCD9OJ9k8rNXzGFEyM/Q7O
	 L8CJFd4zwK/zpbd/D6W2NE9bR2f8LzJ0qum4Eg2dYra8VHr1vbb6Q0TCmxq2fTsfERr65
	 Cqs7XR6B1Zf5k16ofrCBHyrS/RRhiA23gpaJsijy086JWKR7IZm5o1qm0RnSxUFYivArA
	 pzIo1ML2QqDNLX/ycQR2cRkylYuzfxyRtX1/RrMTg2HCy+QjKljo8V9ttuUQ/eV/vYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789678858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=JQxkEOVNww9qPx5LC39tgtJyLOC4OmhBDfzxZCPrm98=;
	b=oAxX3v2Oo5dlrwv2X2gxLhfjDETAnFvfDE5wEWNmOKyWeqc75aeitwljshmekL0vVaDs
	 WQhfwlhsTAPXqVbRqeel1QVm0KA+GVu0NX+qqVwPh5UG8JZsnNUS+SbbJwVa66YEeNaSk
	 oMJiAh+/RNrsoX8L6OT+iSZeWqMm609KGlA2UrRUFy7P3TEjbfrqKUUt+m3qYGB0iBcf4
	 bw4lprpPBpv79IwtFv4FalKPFRi3NOCcwvpVoPzLOcwE6amLR2Wd4CSscFLBp786R0LKh
	 LQP9h1hvQh073OcAS7Uso/dcCr3GHdpOa1MKwb78b/gK/zzvfV3KMAzZunIbDuFDxcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789678858;
	bh=JQxkEOVNww9qPx5LC39tgtJyLOC4OmhBDfzxZCPrm98=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cm1ZicxS5nWkyOk0Gh4o3DXbN1jtY7E8dlaJmqhAiic0OYx+WOQU0pUwTkaLjdeT9
	 LuXMKG0V7BIbL1pAeeLskL9m1VbSZVOX4Lk4fp2Q4TdMIur503pTwZplrWrzqz6qzE
	 /wdopZlJK6HnyAQLM4QZBmG46pqLRhf11uXrz3yY1/f3DWz+RDDIO7irIpFeivK0yw
	 O4pVadPH77BoCcDfPcJETcBZDBqZqM6JyQD43pvBwPWS2hGm3pBCwNzZWJdvsCGHII
	 joJuqtLFjEfO2kbdkk2WE/A0YDAFPX0E7r6nYBY9MJdeIr5XRL0C4VdFxKtkPpT9gx
	 LE6VSN31h4vhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1173B81101;
	Thu, 17 Sep 2026 21:00:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BF273B6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 21:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D8B660890
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 21:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFd5zuT2z0ye for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 21:00:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 610F860807
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789678855;
 b=cFaGaNA1fQmcGhWxQmPJvmJc7fYLRGq+30uv2X/w0ouSbJ51wstgsrmHHwGlAYrEwcKk
 pIBL+DyiSS3OS6jsa/Y85JXb9Q8Z4biEjX7xwYLSW39tI2SXlq9wPUZE2Q0xKA8ohmHKI
 kaRwMv0uag8l8VeE4iBi/aK3FQ5O+PwYpRJkEKBda4rEd+CW8hWwzJL9+i409YdosBj7Z
 J+NKvpWpS3q/PdekfIdaUrXHQSY1PWSFeyZ5vot6wbXk/jU+wKS3s3Ow64X7VkMH0qoUK
 crgTGsmF+4s0h4yOMvPdpbFYZzc5fZWXhmgE4RelK5JVXkgmnI9Jgf9t7keuV3o21iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789678855;
 h=Received-SPF:DKIM-Signature:Received:Received:Date:Message-ID:From:
 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type;
 bh=YFM8ec2YkMBHI+44lMXZNl1OqSNKT2uiJuHu3jnoEAk=;
 b=e1RkH6+t/8XzKEhBsM9Vrj6KjM9/udnzui2ZQPHzjnxk4rgy207hDvfOUACqPlEaRvbB
 MY3EJYUwjXRd5PmYxWhvmg96ncH8hC4XrI19wQMSHP9NLHV50/fHkOu1iuCxjgnecFbb/
 YTclIutM6YbbOAqnknQkt638PrpWtIioJjDPpS54ZZxwmgUFMpiRtoJVLxs1LPBAuw5Qf
 6THt+KPHH3OzdHnBUvc5wH/huQdwluIyiu7TFihe85MUL7hI6ZovuC/Eals5k8iDor1lJ
 myr3Ju7Y8Ebsxoap7mSvvreIx4pznd8wSbNSXgslGUcjfcPKWND6Siqkle0TcFVIFQw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=bV36APYR; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=bV36APYR
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 610F860807
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 21:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Subject:Cc:To:From:Message-ID:Date:
 From:Reply-To; bh=YFM8ec2YkMBHI+44lMXZNl1OqSNKT2uiJuHu3jnoEAk=; b=bV36APYRXqN
 iNeIrLLSlMsTuf1RN5tHWU8Nva/QNl59kyE2QQUae52bTdyOM4W7yJjLgvTyDAqCM2DtH8zvkUeWT
 PjHypd4JVm3/I362X0hBgz5CwXnBvqmtJ+p3Qfas6PmtGle55uCb6/u+U7+EQBp/j5mEsRiwSvpGD
 MSSPlFNqzpS+cZN7mID1LKbd0QXiTuX9MRUZWCSLt9tNUfLms9+dfcg6QH560tt302oJV8hPwPF8A
 xKsMUI035pq04+83/MweNPFOrI3S2B/QBGCShcJ2obSWsnlhMyoVZTNd4FipgxwE3W/dXXJ/qLOdK
 UPmflFLXanWGEM1b1AHzRyQ==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x7JDo-003eP9-8l; Thu, 17 Sep 2026 23:00:44 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id b7e51586;
 Thu, 17 Sep 2026 21:00:43 +0000 (UTC)
Date: Thu, 17 Sep 2026 23:00:38 +0200
Message-ID: <20260917230038.GJ444174328224126@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260917200852.1741639-1-thomas@devoogdt.com>
References: <20260917200852.1741639-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup3: bump to 3.7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0368324113852850436=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0368324113852850436==
Content-Type: multipart/signed; boundary="lPdWE9KJ++sOIQDm"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--lPdWE9KJ++sOIQDm
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"; hp="clear"
Date: Thu, 17 Sep 2026 23:00:38 +0200
Message-ID: <20260917230038.GJ444174328224126@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup3: bump to 3.7.3
In-Reply-To: <20260917200852.1741639-1-thomas@devoogdt.com>
References: <20260917200852.1741639-1-thomas@devoogdt.com>
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gVGhvbWFzLCBhbGwsCgpPbiBUaHUsIDE3IFNlcCAyMDI2IDIyOjA4OjUyICswMjAwIFRo
b21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4gd3JvdGU6Cj4gTmV3czoKPiAtIGh0
dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlic291cC8zLjcvbGlic291cC0zLjcu
MS5uZXdzCj4gLSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2xpYnNvdXAvMy43
L2xpYnNvdXAtMy43LjIubmV3cwo+IC0gaHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNl
cy9saWJzb3VwLzMuNy9saWJzb3VwLTMuNy4zLm5ld3MKPiAKPiBBZGQgenN0ZCBzdXBwb3J0IHdo
aWNoIHdhcyBhZGRlZCB1cHN0cmVhbToKPiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUv
bGlic291cC8tL2NvbW1pdC81NzlmZjU2NzQ3YzNhZWEyZmE3ZGNiZjEyNWJmYmQ0MjRiM2FjNTlh
Cj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29t
PgoKUmV2aWV3ZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29t
PgoKPiAtLS0KPiAgcGFja2FnZS9saWJzb3VwMy9saWJzb3VwMy5oYXNoIHwgIDQgKystLQo+ICBw
YWNrYWdlL2xpYnNvdXAzL2xpYnNvdXAzLm1rICAgfCAxMSArKysrKysrKystLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGlic291cDMvbGlic291cDMuaGFzaCBiL3BhY2thZ2UvbGlic291cDMvbGli
c291cDMuaGFzaAo+IGluZGV4IGMwYjg2MDg3NWM2Li41ODgzOTBiOTU3NSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xpYnNvdXAzL2xpYnNvdXAzLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYnNvdXAz
L2xpYnNvdXAzLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBGcm9tIGh0dHBzOi8vZG93bmxv
YWQuZ25vbWUub3JnL3NvdXJjZXMvbGlic291cC8zLjYvbGlic291cC0zLjYuNi5zaGEyNTZzdW0K
PiAtc2hhMjU2ICA1MWVkMGFlMDZmOWQ1YTQwZjQwMWZmNDU5ZTJlNWY2NTJmOWE1MTBiNzczMGUx
MzU5ZWU2NmQxNGQ0ODcyNzQwICBsaWJzb3VwLTMuNi42LnRhci54ego+ICsjIEZyb20gaHR0cHM6
Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJzb3VwLzMuNy9saWJzb3VwLTMuNy4zLnNo
YTI1NnN1bQo+ICtzaGEyNTYgIDRlNmE2N2ZiOGZmMTM3NjU3N2FmYzI0YTI2Yzg0MmEzNDdiMDAz
NGVhYmY3MWVmMTNkMDM4MmIxYzViYzA1ZTcgIGxpYnNvdXAtMy43LjMudGFyLnh6Cj4gICMgTG9j
YWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgYjc5OTMyMjUxMDRkOTBkZGQ4MDI0ZmQ4MzhmYWYz
MDBiZWE1ZTgzZDkxMjAzZWFiOThlMjk1MTJhY2ViZDY5YyAgQ09QWUlORwo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYnNvdXAzL2xpYnNvdXAzLm1rIGIvcGFja2FnZS9saWJzb3VwMy9saWJzb3Vw
My5tawo+IGluZGV4IDM0YTllZDI3NDE5Li5hODUwZmJhYTIxZSAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2xpYnNvdXAzL2xpYnNvdXAzLm1rCj4gKysrIGIvcGFja2FnZS9saWJzb3VwMy9saWJzb3Vw
My5tawo+IEBAIC00LDggKzQsOCBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
IAo+IC1MSUJTT1VQM19WRVJTSU9OX01BSk9SID0gMy42Cj4gLUxJQlNPVVAzX1ZFUlNJT04gPSAk
KExJQlNPVVAzX1ZFUlNJT05fTUFKT1IpLjYKPiArTElCU09VUDNfVkVSU0lPTl9NQUpPUiA9IDMu
Nwo+ICtMSUJTT1VQM19WRVJTSU9OID0gJChMSUJTT1VQM19WRVJTSU9OX01BSk9SKS4zCj4gIExJ
QlNPVVAzX1NPVVJDRSA9IGxpYnNvdXAtJChMSUJTT1VQM19WRVJTSU9OKS50YXIueHoKPiAgTElC
U09VUDNfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlic291cC8k
KExJQlNPVVAzX1ZFUlNJT05fTUFKT1IpCj4gIExJQlNPVVAzX0xJQ0VOU0UgPSBMR1BMLTIuMCsK
PiBAQCAtNTEsNCArNTEsMTEgQEAgZWxzZQo+ICBMSUJTT1VQM19DT05GX09QVFMgKz0gLURnc3Nh
cGk9ZGlzYWJsZWQKPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfWlNURCkseSkK
PiArTElCU09VUDNfQ09ORl9PUFRTICs9IC1EenN0ZD1lbmFibGVkCj4gK0xJQlNPVVAzX0RFUEVO
REVOQ0lFUyArPSB6c3RkCj4gK2Vsc2UKPiArTElCU09VUDNfQ09ORl9PUFRTICs9IC1EenN0ZD1k
aXNhYmxlZAo+ICtlbmRpZgo+ICsKPiAgJChldmFsICQobWVzb24tcGFja2FnZSkpCj4gLS0gCj4g
Mi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAK
CkNoZWVycywK4oCUQWRyacOhbgo=

--lPdWE9KJ++sOIQDm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaqxU9gAKCRCRxVnb5MkS
O7+EAJ0V6Ie53acJkfjNPNHS6TOvemzXSQCeM7Xi5TnPJYi1Bax2IuiXGYKB6ZY=
=6+L+
-----END PGP SIGNATURE-----

--lPdWE9KJ++sOIQDm--

--===============0368324113852850436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0368324113852850436==--
