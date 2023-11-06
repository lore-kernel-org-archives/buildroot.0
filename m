Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F07C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A2B840296;
	Mon,  6 Nov 2023 21:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A2B840296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9fbo2P4nduR; Mon,  6 Nov 2023 21:00:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80309409A3;
	Mon,  6 Nov 2023 21:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80309409A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2957E1BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0161F612AC
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0161F612AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XRQ1Dm4Fju8 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:00:14 +0000 (UTC)
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1DE26129E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1DE26129E
ARC-Seal: i=1; a=rsa-sha256; t=1699304410; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=B3GktNgGPmeXWDPaB8JiA8bg6pok3w7O89FcH5Uscb9sWYWONu5wRkCbMUpuMBVL+dGVYsvvQbE8tQrN+1b1ycBQYQyu/S47mDq5+BoCNz3JMVI3R9aFZV7pIXyPFB8ft+tVDsBttRc9mlhqsUsJ+xuJpeZ/HWeb+hE5wqgNKG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1699304410;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4JCTlIX+Car0Wk3/sGXJlPeEKKcO47P1TuAlja55Sjo=; 
 b=LyCBL7JKf31/+5KubMVQ1PRMP1tevknWNhV3MIyYdKhs1J6D6KPCLK6RmHxikxq4JfH4niOEOVJPJJ14LZgQ+nh1NwM06emFPg1u94ZOqGLalD6EMJmgLY63y8PE9kfqYAcS2p9UKXmYaQNlDRWi+kTv//dx1O3QejddQfsJCNw=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1699304402701248.1395043025883;
 Mon, 6 Nov 2023 13:00:02 -0800 (PST)
Date: Mon, 06 Nov 2023 22:00:02 +0100
From: enki <enki@fsck.pl>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <18ba66f6ef4.c5fba63142993.3459614153541394630@fsck.pl>
In-Reply-To: <20231106133012.GB2625@scaer>
References: <20231106130835.116844-1-enki@fsck.pl>
 <20231106133012.GB2625@scaer>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1699304410; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4JCTlIX+Car0Wk3/sGXJlPeEKKcO47P1TuAlja55Sjo=;
 b=lS/NGYnfh9VaEsRHynjsmaMrJk9c7YLoZn5tuZgm+cNawkzTWmABPZi6n5dJqjae
 6S2c8JY9n/NQ+k2WuFtG5l5xSDyx1qYPDa2xxup6Sy+Hj5uw++xxLEtzMDYsAVZcA38
 vLx4fr7sXFqT1qA8NawmQ3h/nwutCzzZIznqBINA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=lS/NGYnf
Subject: Re: [Buildroot] [PATCH v4 1/1] package/spirv-tools: fix build issue
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LS0tLSBPbiBNb24sIDA2IE5vdiAyMDIzIDE0OjMwOjEyICswMTAwICBZYW5uIEUuIE1PUklOICB3
cm90ZSAtLS0gCiA+IE1hY2llaiwgQWxsLAogPiAKID4gCiA+IAogPiBPbiAyMDIzLTExLTA2IDE0
OjA4ICswMTAwLCBNYWNpZWogR3JlbGEgc3Bha2UgdGh1c2x5OgogPiAKID4gPiBzcGlydi10b29s
cyByZXF1aXJlcyBhIHRvb2xjaGFpbiB3LyBzaGFyZWQgbGlicywgYWRkIGZsYWcgZGVwZW5kZW5j
eSBhbmQgY29tbWVudC4KID4gCiA+ID4gCiA+IAogPiA+IEZpeGVzOiBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9hMWY2MTVkMjQxMGJmZmI2ZmRhY2M4NTg2NzYxYzlkZWYw
NWFhZmE5CiA+IAogPiA+IEZpeGVzOiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVz
dWx0cy8yOTRhZGU4YzlhYTNkNjUwZmE1YWI2Y2MzNDcwMWM0MTc2YmMxOTdmCiA+IAogPiAKID4g
CiA+IFNvcnJ5LCBidXQgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5zZCBob3cgdGhvc2UgdHdvIGJ1
aWxkIGZhaWx1cmVzIHJlbGF0ZQogPiAKID4gdG8gc3RhdGljIGJ1aWxkcy4KID4gCiA+CiA+IAog
PiBCb3RoIGZhaWxlZCBidWlsZCBsb2dzIGFyZSBhYm91dCBhIGJyb2tlbiBDKysgY29tcGlsZXI6
CiA+IAogPiAKID4gCiA+ICAgICAtLSBEZXRlY3RpbmcgQ1hYIGNvbXBpbGVyIEFCSSBpbmZvCiA+
IAogPiAgICAgLS0gRGV0ZWN0aW5nIENYWCBjb21waWxlciBBQkkgaW5mbyAtIGZhaWxlZAogPiAK
ID4gICAgIC0tIENoZWNrIGZvciB3b3JraW5nIENYWCBjb21waWxlcjogL3Vzci9iaW4vY2xhbmcr
KwogPiAKID4gICAgIC0tIENoZWNrIGZvciB3b3JraW5nIENYWCBjb21waWxlcjogL3Vzci9iaW4v
Y2xhbmcrKyAtIGJyb2tlbgogPiAKID4gCiA+IAogPiBBbmQgaW5kZWVkLCBpdCBpcyBub3Qgc3Vy
cHJpc2luZyB0aGF0IHRoZSBob3N0IEMrKyBjb21waWxlciBiZSBicm9rZW4KID4gCiA+IHdoZW4g
ZG9pbmcgY3Jvc3MtY29tcGlsYXRpb24sIGFzIGl0IGlzIHVzZWQgdG8gdGVudGF0aXZlbHkgYnVp
bGQgdGFnZXQKID4gCiA+IGNvZGU6CiA+IAogPiAKID4gCiA+ICAgICAvdXNyL2Jpbi9jbGFuZysr
IC0tc3lzcm9vdD0vaG9tZS90aG9tYXMvYXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0LTEvaG9z
dC9hcm1lYi1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFiaS9zeXNyb290IC1PMyAtRE5ERUJV
RyAtc3RhdGljICBDTWFrZUZpbGVzL2NtVENfZmFlZmUuZGlyL3Rlc3RDWFhDb21waWxlci5jeHgu
byAtbyBjbVRDX2ZhZWZlCiA+IAogPiAgICAgL3Vzci9iaW4vbGQ6IC9ob21lL3Rob21hcy9hdXRv
YnVpbGQvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L2FybWViLWJ1aWxkcm9vdC1saW51eC11Y2xp
YmNnbnVlYWJpL3N5c3Jvb3QvdXNyL2xpYi9jcnQxLm86IHJlbG9jYXRpb25zIGluIGdlbmVyaWMg
RUxGIChFTTogNDApCiA+IAogPiAgICAgL3Vzci9iaW4vbGQ6IC9ob21lL3Rob21hcy9hdXRvYnVp
bGQvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L2FybWViLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNn
bnVlYWJpL3N5c3Jvb3QvdXNyL2xpYi9jcnQxLm86IGVycm9yIGFkZGluZyBzeW1ib2xzOiBmaWxl
IGluIHdyb25nIGZvcm1hdAogPiAKID4gICAgIGNsYW5nOiBlcnJvcjogbGlua2VyIGNvbW1hbmQg
ZmFpbGVkIHdpdGggZXhpdCBjb2RlIDEgKHVzZSAtdiB0byBzZWUgaW52b2NhdGlvbikKID4gCiA+
IAogPiAKID4gU28sIGlmIGl0IHJlYWxseSBpcyBhYm91dCBhIHN0YXRpYyBsaW5raW5nIGlzc3Vl
LCB3ZSBuZWVkIG1vcmUKID4gCiA+IGRldGFpbHMuLi4KID4gCiA+IAoKSWYgeW91IHRha2UgKGFz
IGFuIGV4YW1wbGUpIHRoZSBjb25maWcgZnJvbSBhMWY2MTVkMjQxMGJmZmI2ZmRhY2M4NTg2NzYx
YzlkZWYwNWFhZmE5LCBlbmFibGUgdGhlIEMrKyBzdXBwb3J0IGFuZCB0cnkgdG8gYnVpbGQgeW91
IGdldCB0aGUgCmZhaWx1cmUgY2F1c2VkIGJ5IGxkIHRyeWluZyB0byBkbyBhIGR5bmFtaWMgbGlu
ayB3aXRoIGEgc3RhdGljIGxpYnJhcnk6CgpbIDU0JV0gQnVpbGRpbmcgQ1hYIG9iamVjdCBzb3Vy
Y2Uvb3B0L0NNYWtlRmlsZXMvU1BJUlYtVG9vbHMtb3B0LmRpci9kYXRhZmxvdy5jcHAubwovaG9t
ZS9lbmtpL2ExZjYxNWQyNDEwYmZmYjZmZGFjYzg1ODY3NjFjOWRlZjA1YWFmYTkvb3V0cHV0L2hv
c3QvbGliL2djYy9hcm1lYi1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFiaS8xMi4zLjAvLi4v
Li4vLi4vLi4vYXJtZWItYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkvYmluL2xkOiAvaG9t
ZS9lbmtpL2ExZjYxNWQyNDEwYmZmYjZmZGFjYzg1ODY3NjFjOWRlZjA1YWFmYTkvb3V0cHV0L2hv
c3QvYXJtZWItYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkvc3lzcm9vdC91c3IvbGliL2xp
YmMuYShfX3VDbGliY19tYWluLm9zKTogaW4gZnVuY3Rpb24gYF9fdUNsaWJjX2ZpbmknOgpfX3VD
bGliY19tYWluLmM6KC50ZXh0KzB4MTQwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19maW5p
X2FycmF5X3N0YXJ0JwovaG9tZS9lbmtpL2ExZjYxNWQyNDEwYmZmYjZmZGFjYzg1ODY3NjFjOWRl
ZjA1YWFmYTkvb3V0cHV0L2hvc3QvbGliL2djYy9hcm1lYi1idWlsZHJvb3QtbGludXgtdWNsaWJj
Z251ZWFiaS8xMi4zLjAvLi4vLi4vLi4vLi4vYXJtZWItYnVpbGRyb290LWxpbnV4LXVjbGliY2du
dWVhYmkvYmluL2xkOiBfX3VDbGliY19tYWluLmM6KC50ZXh0KzB4MTQ0KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgX19maW5pX2FycmF5X2VuZCcKL2hvbWUvZW5raS9hMWY2MTVkMjQxMGJmZmI2
ZmRhY2M4NTg2NzYxYzlkZWYwNWFhZmE5L291dHB1dC9ob3N0L2xpYi9nY2MvYXJtZWItYnVpbGRy
b290LWxpbnV4LXVjbGliY2dudWVhYmkvMTIuMy4wLy4uLy4uLy4uLy4uL2FybWViLWJ1aWxkcm9v
dC1saW51eC11Y2xpYmNnbnVlYWJpL2Jpbi9sZDogX191Q2xpYmNfbWFpbi5jOigudGV4dCsweDE0
OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZmluaV9hcnJheV9zdGFydCcKL2hvbWUvZW5r
aS9hMWY2MTVkMjQxMGJmZmI2ZmRhY2M4NTg2NzYxYzlkZWYwNWFhZmE5L291dHB1dC9ob3N0L2xp
Yi9nY2MvYXJtZWItYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkvMTIuMy4wLy4uLy4uLy4u
Ly4uL2FybWViLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpL2Jpbi9sZDogL2hvbWUvZW5r
aS9hMWY2MTVkMjQxMGJmZmI2ZmRhY2M4NTg2NzYxYzlkZWYwNWFhZmE5L291dHB1dC9ob3N0L2Fy
bWViLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpL3N5c3Jvb3QvdXNyL2xpYi9saWJjLmEo
X191Q2xpYmNfbWFpbi5vcyk6IGluIGZ1bmN0aW9uIGBfX3VDbGliY19tYWluJzoKX191Q2xpYmNf
bWFpbi5jOigudGV4dCsweDQzMCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fcHJlaW5pdF9h
cnJheV9zdGFydCcKL2hvbWUvZW5raS9hMWY2MTVkMjQxMGJmZmI2ZmRhY2M4NTg2NzYxYzlkZWYw
NWFhZmE5L291dHB1dC9ob3N0L2xpYi9nY2MvYXJtZWItYnVpbGRyb290LWxpbnV4LXVjbGliY2du
dWVhYmkvMTIuMy4wLy4uLy4uLy4uLy4uL2FybWViLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVl
YWJpL2Jpbi9sZDogX191Q2xpYmNfbWFpbi5jOigudGV4dCsweDQzNCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYF9fcHJlaW5pdF9hcnJheV9lbmQnCi9ob21lL2Vua2kvYTFmNjE1ZDI0MTBiZmZi
NmZkYWNjODU4Njc2MWM5ZGVmMDVhYWZhOS9vdXRwdXQvaG9zdC9saWIvZ2NjL2FybWViLWJ1aWxk
cm9vdC1saW51eC11Y2xpYmNnbnVlYWJpLzEyLjMuMC8uLi8uLi8uLi8uLi9hcm1lYi1idWlsZHJv
b3QtbGludXgtdWNsaWJjZ251ZWFiaS9iaW4vbGQ6IF9fdUNsaWJjX21haW4uYzooLnRleHQrMHg0
MzgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2luaXRfYXJyYXlfc3RhcnQnCi9ob21lL2Vu
a2kvYTFmNjE1ZDI0MTBiZmZiNmZkYWNjODU4Njc2MWM5ZGVmMDVhYWZhOS9vdXRwdXQvaG9zdC9s
aWIvZ2NjL2FybWViLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpLzEyLjMuMC8uLi8uLi8u
Li8uLi9hcm1lYi1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFiaS9iaW4vbGQ6IF9fdUNsaWJj
X21haW4uYzooLnRleHQrMHg0M2MpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2luaXRfYXJy
YXlfZW5kJwovaG9tZS9lbmtpL2ExZjYxNWQyNDEwYmZmYjZmZGFjYzg1ODY3NjFjOWRlZjA1YWFm
YTkvb3V0cHV0L2hvc3QvbGliL2djYy9hcm1lYi1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFi
aS8xMi4zLjAvLi4vLi4vLi4vLi4vYXJtZWItYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkv
YmluL2xkOiBsaWJTUElSVi1Ub29scy1zaGFyZWQuc286IGhpZGRlbiBzeW1ib2wgYF9fcHJlaW5p
dF9hcnJheV9zdGFydCcgaXNuJ3QgZGVmaW5lZAovaG9tZS9lbmtpL2ExZjYxNWQyNDEwYmZmYjZm
ZGFjYzg1ODY3NjFjOWRlZjA1YWFmYTkvb3V0cHV0L2hvc3QvbGliL2djYy9hcm1lYi1idWlsZHJv
b3QtbGludXgtdWNsaWJjZ251ZWFiaS8xMi4zLjAvLi4vLi4vLi4vLi4vYXJtZWItYnVpbGRyb290
LWxpbnV4LXVjbGliY2dudWVhYmkvYmluL2xkOiBmaW5hbCBsaW5rIGZhaWxlZDogYmFkIHZhbHVl
CmNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwptYWtlWzRdOiAqKiog
W3NvdXJjZS9DTWFrZUZpbGVzL1NQSVJWLVRvb2xzLXNoYXJlZC5kaXIvYnVpbGQubWFrZToxMjIz
OiBzb3VyY2UvbGliU1BJUlYtVG9vbHMtc2hhcmVkLnNvXSBCxYLEhWQgMQptYWtlWzNdOiAqKiog
W0NNYWtlRmlsZXMvTWFrZWZpbGUyOjEwOTE6IHNvdXJjZS9DTWFrZUZpbGVzL1NQSVJWLVRvb2xz
LXNoYXJlZC5kaXIvYWxsXSBCxYLEhWQgMgoKRW5hYmxpbmcgdGhlIHNoYXJlZCBsaWJzIGFuZCBy
ZWJ1aWxkaW5nIHRoZSB0b29sY2hhaW4gZml4ZXMgdGhpcy4gSW4gb3RoZXIgd29yZHMgdGhvc2Ug
dHdvIGJ1aWxkcyBmYWlsICpib3RoKiBiZWNhdXNlIG9mIG1pc3NpbmcgQysrIHN1cHBvcnQgYXMg
d2VsbCBhcyBhIHN0YXRpYy1vbmx5IHRvb2xjaGFpbi4gSXQncyBqdXN0IHRoYXQgdGhlIG1pc3Np
bmcgQysrCm1ha2VzIGl0IGZhaWwgZWFybHkuCgotLSAKZW5raQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
