Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08027C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933D76064B;
	Sun, 27 Sep 2026 10:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNMfTdi0E02s; Sun, 27 Sep 2026 10:27:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 93DBD6060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790504840;
	b=RWyi3miJB5rWpsOHaHZV275ug7kr5kYpwL1XuN6HVqClPX1o6lgGC3aYEWxw4Y/sj/nA
	 CLi3kBqqW+yqL4wtJGzTxDUdolVgIISA2YJfLrs3ixmolODFoseBOQR1Pncvaziawx9qd
	 S2Y5s07a4JrLmHr18URk8vctiLrN+rhUh3zeihaEDZS0B9LRF4NbMfHAAi8fGzHWVgx+k
	 M7BbOzmU36LHqnBhmv0WUXsagpwC0ZAyQpvavPlG5QOyfKkCdmiyzPXrbXk6fBdiW+ROU
	 E7PBURyWdxlivDcUFzDqwOIpfCg4DhCTxll5+vHcrgffKjrVqtmQuh0UzcMp8e7V5hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790504840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9G/FtM96qvnFgh4gB9yDKnhWwR4o8KhKv7oq9SmmNmc=;
	b=ZFEQpKV6a48Hqai2EVEVDPEU5yWXVMFWZtcCD3v/Fitl1CfJJ3ba3UZK96XU/bjicIa0
	 ykEFubSmok7OwRfdnz1hWSTtTLOdyWe4YHVf45HLKSlPxFV31qsHUjDYGyeKTRETgaXAr
	 6wXPV3QLW5VM1+PaIbwXQWQAGNZQHCLzvC498Q+R4fWi4J22DjSBG4A670+/Rz+aRSiza
	 fqVqNTFw+MvU0vpyBdVB9UvIWWLCHbgIyJVYHzYknMyi01ox1Fd1dvjj3Nu6d5WbOfwjF
	 DpJ33rHfMZi33++1Yfk3pqCP0XVk0bFH7pw8V0m17A8au43tAZef49fEr574M1zdxsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790504840;
	bh=9G/FtM96qvnFgh4gB9yDKnhWwR4o8KhKv7oq9SmmNmc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NVCU2XaddybbmAwEhqAS+OO0D3Zfqi1bbZwc1dMJ3BJTwF2A62zhheQQszUGZrrxY
	 lFCmJGB1evmcWkcdb3MLZfLtxrz7U0YtG1PHxebdmjcSaZnB5pqkQenu9/OZyXVW5u
	 3sBZL0l3q8w+IDrnBv0zOBOotdi8sEAR1bN/XiZE5suI9+knoPwdrJh7wTwNmhZ38Q
	 6HP++ctMXSwFr1CaknikZkW+VX3P+KXMwxWihNRO+LQzEzJ6waKq0MdBPVBqYJjdbi
	 Rh+3uRF0TMWcBej2x0cHCZx3XDQWn7zWcHYtWY2KrQ1FgXw3z1yh7cp1Q9WT2tNQsz
	 DGjTBGFSmz8rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93DBD6060E;
	Sun, 27 Sep 2026 10:27:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49C4C335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E72C40068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S86xYKVdFZ3J for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:27:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 78D1340059
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790504837;
 b=Snn0XnokS5wNjKTzmiWMBC0/92PntA/jg1mRXL92mvwFIcVv3cqsMmw7hM7cemWH9Y3g
 tb/OBa3P5gV0/iovYWEedqy9HA51mUfMBpAnbE1KrFwTMZOdJxdA75hP5HVOWwZsOoJQ/
 mnkKU//Vq1tsrtGsxI+SA+GrtzWwo7i6Y78WZe5rVE4EIFjkPR8FVIhYNLtfCBcLUiCuB
 PYDhWOXAavpRJ4bq+sEi/AbkwRRPWzwVFRCb3GqVusbrJ8qenduqdVkWqWsJgR3ECl+tn
 gKbF5AUUuQLax43i3pmfI28JZFVYkp0ChTZfW0JsOEVjdvr2yUoetRv3cLrVLJhdgfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790504837;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=dJwCeNVPo3G5mL7wcV+rasVQBfMg8UYPHKB+db40o10=;
 b=SjmiGhfE3CX6R+4LAHX3j+1O4p7a2o/7L7BwFk47MC9ia91uTlHiW3DvgnkxNTJo5Yw/
 smULFshtl6unNbZiYNs8xGtckXiTfAL6OZ+5Ga1mIuBj3z3OKYVS2z8mb0n1+vtnLc1vh
 ErlKGizntAStQt6m6TzDoVZH88NHi6YqOgaU7LQdAUr/GkOhJ86napojr+ZxP7NO3VP2l
 018DQVVmnGS3FGSZDpowDCY0kz9qIq3msmEyvm+Ts7r86Ud3qCALHmVQ86XWIFfKokHXj
 BMY1nTQXRyryhwjWgRv5YL0CUSDXxeiYTpJLtoI75NqSRbpQEQmzn594kfIMOlZR/MA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YiN52plf; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78D1340059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:27:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A2F9919F5BE;
 Sun, 27 Sep 2026 12:27:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 27 Sep 2026 12:27:13 +0200
MIME-Version: 1.0
Date: Sun, 27 Sep 2026 12:27:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260927085308.2871714-1-giulio.benetti@benettiengineering.com>
References: <20260927085308.2871714-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <cb14dfb8de885d7e0ccd8784c75e51c1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.19
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjcvMDkvMjAyNiAxMDo1MywgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gRml4ZXMgdGhlIGZv
bGxvd2luZyB2dWxuZXJhYmlsaXRpZXM6Cj4gCj4gLSB3bnBhLXNlYy0yMDI2LTkzIMK3IFNDVFAg
cHJvdG9jb2wgZGlzc2VjdG9yIGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9z
ZWN1cml0eS93bnBhLXNlYy0yMDI2LTkzCj4gICBDVkUtMjAyNi05NTM4OS4KPiAKPiAtIHducGEt
c2VjLTIwMjYtOTYgwrcgSUVFRSBDMzcuMTE4IFN5bmNocm9waGFzb3IgcHJvdG9jb2wgZGlzc2Vj
dG9yCj4gICBtZW1vcnkgbGVhay4KPiAgIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJp
dHkvd25wYS1zZWMtMjAyNi05Ngo+ICAgQ1ZFLTIwMjYtOTUzOTUuCj4gCj4gLSB3bnBhLXNlYy0y
MDI2LTk3IMK3IFNQRFkgcHJvdG9jb2wgZGlzc2VjdG9yIGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cu
d2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTk3Cj4gICBDVkUtMjAyNi05NTM4
Ny4KPiAKPiAtIHducGEtc2VjLTIwMjYtOTggwrcgTWljcm9zb2Z0IE5ldHdvcmsgTW9uaXRvciBm
aWxlIHBhcnNlciBsYXJnZSBsb29wLgo+ICAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1
cml0eS93bnBhLXNlYy0yMDI2LTk4Cj4gICBDVkUtMjAyNi05NTM5NC4KPiAKPiAtIHducGEtc2Vj
LTIwMjYtOTkgwrcgQ1NOLjEgcHJvdG9jb2wgZGlzc2VjdG9yIGNyYXNoLgo+ICAgaHR0cHM6Ly93
d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTk5Cj4gICBDVkUtMjAyNi05
NTM5My4KPiAKPiAtIHducGEtc2VjLTIwMjYtMTAwIMK3IE1CSU0gcHJvdG9jb2wgZGlzc2VjdG9y
IGNyYXNoLiB3c2J1Z2xpbms6MjE1NDksCj4gICBodHRwczovL3d3dy53aXJlc2hhcmsub3JnL3Nl
Y3VyaXR5L3ducGEtc2VjLTIwMjYtMTAwCj4gICBDVkUtMjAyNi05NTM5Mi4KPiAKPiAtIHducGEt
c2VjLTIwMjYtMTAxIMK3IFNoYXJrZCB1dGlsaXR5IGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cud2ly
ZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTEwMQo+ICAgQ1ZFLTIwMjYtOTUzODgu
Cj4gCj4gLSB3bnBhLXNlYy0yMDI2LTEwMiDCtyBGcmFtZSBwcm90b2NvbCBtZXRhZGlzc2VjdG9y
IGNyYXNoLgo+ICAgaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0y
MDI2LTEwMgo+ICAgQ1ZFLTIwMjYtOTY0MjIuCj4gCj4gLSB3bnBhLXNlYy0yMDI2LTEwMyDCtyBV
U0IgSElEIHByb3RvY29sIGRpc3NlY3RvciBpbmZpbml0ZSBsb29wIGFuZAo+ICAgbWVtb3J5IGxl
YWsuCj4gICBodHRwczovL3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5L3ducGEtc2VjLTIwMjYt
MTAzCj4gICBDVkUtMjAyNi05NjQyMS4KPiAKPiAtIHducGEtc2VjLTIwMjYtMTA0IMK3IFJGNENF
IHByb3RvY29sIGRpc3NlY3RvciBjcmFzaC4KPiAgIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcv
c2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDQKPiAgIENWRS0yMDI2LTk2NDE3Lgo+IAo+IC0gd25w
YS1zZWMtMjAyNi0xMDUgwrcgVG9zaGliYSBmaWxlIHBhcnNlciBjcmFzaC4KPiAgIGh0dHBzOi8v
d3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDUKPiAgIENWRS0yMDI2
LXh4eC4KPiAKPiAtIHducGEtc2VjLTIwMjYtMTA2IMK3IFByb2ZpbGUgaW1wb3J0IGNyYXNoIGFu
ZCBwb3NzaWJsZSBjb2RlIGV4ZWN1dGlvbi4KPiAgIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcv
c2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDYKPiAgIENWRS0yMDI2LTk2NDE5Lgo+IAo+IC0gd25w
YS1zZWMtMjAyNi0xMDcgwrcgVElGRiBwcm90b2NvbCBkaXNzZWN0b3IgaW5maW5pdGUgbG9vcC4K
PiAgIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMDcK
PiAgIENWRS0yMDI2LTk2NDE4Lgo+IAo+IC0gd25wYS1zZWMtMjAyNi0xMDggwrcgWDExIHByb3Rv
Y29sIGRpc3NlY3RvciBjcmFzaC4KPiAgIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2VjdXJp
dHkvd25wYS1zZWMtMjAyNi0xMDgKPiAgIENWRS0yMDI2LTk2NDIzLgo+IAo+IC0gd25wYS1zZWMt
MjAyNi0xMDkgwrcgSUVFRSA4MDIuMTEgcHJvdG9jb2wgZGlzc2VjdG9yIGNyYXNoLgo+ICAgaHR0
cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI2LTEwOQo+ICAgQ1ZF
LTIwMjYtOTY0MTYuCj4gCj4gLSB3bnBhLXNlYy0yMDI2LTExMCDCtyBDYXRhcHVsdCBEQ1QyMDAw
IHByb3RvY29sIGRpc3NlY3RvciBjcmFzaC4KPiAgIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcv
c2VjdXJpdHkvd25wYS1zZWMtMjAyNi0xMTAKPiAgIENWRS0yMDI2LTk2NDE1Lgo+IAo+IEZvciBt
b3JlIGluZm9ybWF0aW9uIG9uIHRoZSB2ZXJzaW9uIGJ1bXAsIHNlZToKPiAgIC0gaHR0cHM6Ly93
d3cud2lyZXNoYXJrLm9yZy9kb2NzL3JlbG5vdGVzL3dpcmVzaGFyay00LjQuMTkuaHRtbAo+IAo+
IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5n
aW5lZXJpbmcuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
