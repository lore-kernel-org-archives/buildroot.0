Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C1CC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 23:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA1E811AB;
	Thu,  7 Aug 2025 23:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWipAeqt5J-W; Thu,  7 Aug 2025 23:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24FB1811AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24FB1811AD;
	Thu,  7 Aug 2025 23:08:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1113910A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 23:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E21676081B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 23:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aIGlu5G4Ged for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 23:08:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF351607C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF351607C0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF351607C0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 23:08:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 845305FF95;
 Fri,  8 Aug 2025 01:08:07 +0200 (CEST)
Received: from ip099.116-187-66.sogetel.net ([66.187.116.99:36622])
 via ip099.116-187-66.sogetel.net ([66.187.116.99]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Aug 2025 01:08:07 +0200
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 01:08:07 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250807094204.3505777-1-dario.binacchi@amarulasolutions.com>
References: <20250807094204.3505777-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <29f81e05e04ed5ba0a721a0d002d55c4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754608089;
 bh=kCxsfTEtoC9vPFO+EAKqC+qid3PX3mnbbjZqfPBXcII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ibypm9rz1YN38l3XrKHCuViGQ/a/Ri+121n/T7mgGQ6znRuBgXChvJRBfh5UsJ0wJ
 k1n9uvCtisb0shxRi9q4CLxcUHdUyp65TFWhxQxIJynktoVp4VCsVhSGJxYk7BB3At
 jZbvylETt2HqrATL7DzKY5l1RBphQE9w9Qq2TsAjTsGtmv0+31xkJT6YI3LMClWQoX
 CoElUcHxxYndB2ZTvpiNsGNBbOf3An6Ha3Gb9IwbPhhNhgFZm3vHKWfSAPnM4/eojw
 rwKUDAFwh1re5opTVWJjnQqhJfALdklN6qQ9EaceOQr8PaYNP3iq6inVyKxPARbheF
 ru539N+NeQQ6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ibypm9rz
Subject: Re: [Buildroot] [PATCH 1/1] package/ufs-utils: fix hash file
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

SGkgRGFyaW8sCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSBoYXZlIGZldyBjb21tZW50cy4KCk9u
IDA3LzA4LzIwMjUgMTE6NDIsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEkgdGhpbmsgdGhlIGlz
c3VlIGlzIGNhdXNlZCBieSBQUiBbMV0gYmVpbmcgbWVyZ2VkIHdpdGhvdXQgYSByZWJhc2UsCj4g
d2hpY2ggbWF5IGhhdmUgdHJpZ2dlcmVkIGFuIGF1dG9tYXRpYyByZS1nZW5lcmF0aW9uIG9mIHRo
ZSB0YXIuZ3oKPiBhcmNoaXZlLgoKVGhpcyB3b3JkaW5nIHN1Z2dlc3RzIHlvdSBhcmUgbm90IHN1
cmUuCgpMb29raW5nIGF0OgpodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC91ZnMtdXRpbHMv
dWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6CndpdGggaGFzaDoKc2hhMjU2ICA5NmNkNTc4NzIyODMw
YmM3ZDhhNDE4ZDUyOGEzMDY3YzBiODBhZDQzN2Y2NmMzMzMzZWJjMjM4ZmU1MjQzNmEyIAogIHVm
cy11dGlscy03LjE0LjEyLnRhci5negoKYW5kOgpodHRwczovL2dpdGh1Yi5jb20vU2FuRGlzay1P
cGVuLVNvdXJjZS91ZnMtdXRpbHMvYXJjaGl2ZS92Ny4xNC4xMi91ZnMtdXRpbHMtNy4xNC4xMi50
YXIuZ3oKd2l0aCBoYXNoOgpzaGEyNTYgIDk2ZDE1Y2U0YjA5OTAwNDlkODEyZDI0YWZjMmE2MjI0
MGMxYTRhYTUzNGVhNmFlYmI1YWViZDM0ZGNjYjJkYWMgCiAgdWZzLXV0aWxzLTcuMTQuMTIudGFy
Lmd6CgpSdW5uaW5nICJkaWZmb3Njb3BlIiBvbiB0aG9zZSB0d28gYXJjaGl2ZXMgc2VlbXMgdG8g
cG9pbnQKdG93YXJkIHRoZSB1cHN0cmVhbSBjb21taXQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9TYW5E
aXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy9jb21taXQvOTg5ZGNkMjk3MjIzZDY4OTZjNTg5MjUz
MmQxNDk4NDMyNmZhMDkzZAoKVGhlIGZpbGUgZGF0ZXMgYXJlIGFsc28gZGlmZmVyZW50IGluc2lk
ZSB0aGUgdGFyIGZpbGUuCgpDb3VsZCB5b3UgcmV3b3JkIHRoZSBjb21taXQgbG9nIHRvIGluY2x1
ZGUgdGhvc2UgZGV0YWlscywgcGxlYXNlPwoKPiBUZXN0cyBzaG93IHRoYXQgdGhlIHRhcmJhbGwg
c3RvcmVkIGluIEJ1aWxkcm9vdCBtaXJyb3JzIGhhcyBhCj4gU0hBMSBtYXRjaGluZyB0aGUgb25l
IGluIHRoZSBoYXNoIGZpbGUsIHdoaWxlIHRoZSBvbmUgZG93bmxvYWRlZCBmcm9tCgogICBeXl5e
IGFjdHVhbGx5IGl0IGlzIFNIQTI1NiAoYWxzbyBiZWxvdykuCgo+IHRoZSBTYW5EaXNrIHJlcG9z
aXRvcnkgaGFzIGEgZGlmZmVyZW50IFNIQTE6Cj4gCj4gd2dldCAtbmQgLXQgMyAtLWNvbm5lY3Qt
dGltZW91dD0xMCAtTyAKPiAnL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1dC9i
dWlsZC8udWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6LjY4SjFXSi9vdXRwdXQnIAo+ICdodHRwczov
L2dpdGh1Yi5jb20vU2FuRGlzay1PcGVuLVNvdXJjZS91ZnMtdXRpbHMvYXJjaGl2ZS92Ny4xNC4x
Mi91ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3onCj4gLS0yMDI1LTA4LTA3IDExOjA3OjMyLS0gIAo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9TYW5EaXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy9hcmNoaXZl
L3Y3LjE0LjEyL3Vmcy11dGlscy03LjE0LjEyLnRhci5nego+IFJlc29sdmluZyBnaXRodWIuY29t
IChnaXRodWIuY29tKS4uLiAxNDAuODIuMTIxLjQKPiBDb25uZWN0aW5nIHRvIGdpdGh1Yi5jb20g
KGdpdGh1Yi5jb20pfDE0MC44Mi4xMjEuNHw6NDQzLi4uIGNvbm5lY3RlZC4KPiBIVFRQIHJlcXVl
c3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMzAyIEZvdW5kCj4gTG9jYXRpb246IAo+IGh0
dHBzOi8vY29kZWxvYWQuZ2l0aHViLmNvbS9TYW5EaXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy90
YXIuZ3ovcmVmcy90YWdzL3Y3LjE0LjEyIAo+IFtmb2xsb3dpbmddCj4gLS0yMDI1LTA4LTA3IDEx
OjA3OjMyLS0gIAo+IGh0dHBzOi8vY29kZWxvYWQuZ2l0aHViLmNvbS9TYW5EaXNrLU9wZW4tU291
cmNlL3Vmcy11dGlscy90YXIuZ3ovcmVmcy90YWdzL3Y3LjE0LjEyCj4gUmVzb2x2aW5nIGNvZGVs
b2FkLmdpdGh1Yi5jb20gKGNvZGVsb2FkLmdpdGh1Yi5jb20pLi4uIDE0MC44Mi4xMjEuMTAKPiBD
b25uZWN0aW5nIHRvIGNvZGVsb2FkLmdpdGh1Yi5jb20gCj4gKGNvZGVsb2FkLmdpdGh1Yi5jb20p
fDE0MC44Mi4xMjEuMTB8OjQ0My4uLiBjb25uZWN0ZWQuCj4gSFRUUCByZXF1ZXN0IHNlbnQsIGF3
YWl0aW5nIHJlc3BvbnNlLi4uIDIwMCBPSwo+IExlbmd0aDogdW5zcGVjaWZpZWQgW2FwcGxpY2F0
aW9uL3gtZ3ppcF0KPiBTYXZpbmcgdG86IAo+IOKAmC9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5nei42OEoxV0ovb3V0cHV0
4oCZCj4gCj4gL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1dC9iICAgICBbIDw9
PiAgICAgICAgICAgICAgICAgICAgICAgCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXSAgNzcuNzZLICAKPiAtLS4tS0IvcyAgICBpbiAw
LjA2cwo+IAo+IDIwMjUtMDgtMDcgMTE6MDc6MzIgKDEuMzIgTUIvcykgLSAKPiDigJgvaG9tZS9k
YXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy51ZnMtdXRpbHMtNy4xNC4xMi50
YXIuZ3ouNjhKMVdKL291dHB1dOKAmSAKPiBzYXZlZCBbNzk2MjNdCj4gCj4gRVJST1I6IHdoaWxl
IGNoZWNraW5nIGhhc2hlcyBmcm9tIHBhY2thZ2UvdWZzLXV0aWxzL3Vmcy11dGlscy5oYXNoCj4g
RVJST1I6IHVmcy11dGlscy03LjE0LjEyLnRhci5neiBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6Cj4g
RVJST1I6IGV4cGVjdGVkOiAKPiA5NmNkNTc4NzIyODMwYmM3ZDhhNDE4ZDUyOGEzMDY3YzBiODBh
ZDQzN2Y2NmMzMzMzZWJjMjM4ZmU1MjQzNmEyCj4gRVJST1I6IGdvdCAgICAgOiAKPiA5NmQxNWNl
NGIwOTkwMDQ5ZDgxMmQyNGFmYzJhNjIyNDBjMWE0YWE1MzRlYTZhZWJiNWFlYmQzNGRjY2IyZGFj
Cj4gRVJST1I6IEluY29tcGxldGUgZG93bmxvYWQsIG9yIG1hbi1pbi10aGUtbWlkZGxlIChNSVRN
KSBhdHRhY2sKPiB3Z2V0IC1uZCAtdCAzIC0tY29ubmVjdC10aW1lb3V0PTEwIC1PIAo+ICcvaG9t
ZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy51ZnMtdXRpbHMtNy4xNC4x
Mi50YXIuZ3ouSFlwcUttL291dHB1dCcgCj4gJ2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0
L3Vmcy11dGlscy91ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3onCj4gLS0yMDI1LTA4LTA3IDExOjA3
OjMyLS0gIAo+IGh0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L3Vmcy11dGlscy91ZnMtdXRp
bHMtNy4xNC4xMi50YXIuZ3oKPiBSZXNvbHZpbmcgc291cmNlcy5idWlsZHJvb3QubmV0IChzb3Vy
Y2VzLmJ1aWxkcm9vdC5uZXQpLi4uIAo+IDI2MDY6NDcwMDoyMDo6NjgxYToyNSwgMjYwNjo0NzAw
OjIwOjphYzQzOjQ4MzgsIDI2MDY6NDcwMDoyMDo6NjgxYToxMjUsIAo+IC4uLgo+IENvbm5lY3Rp
bmcgdG8gc291cmNlcy5idWlsZHJvb3QubmV0IAo+IChzb3VyY2VzLmJ1aWxkcm9vdC5uZXQpfDI2
MDY6NDcwMDoyMDo6NjgxYToyNXw6NDQzLi4uIGNvbm5lY3RlZC4KPiBIVFRQIHJlcXVlc3Qgc2Vu
dCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9LCj4gTGVuZ3RoOiA3OTYxOSAoNzhLKSBbYXBw
bGljYXRpb24veC1ndGFyLWNvbXByZXNzZWRdCj4gU2F2aW5nIHRvOiAKPiDigJgvaG9tZS9kYXJp
by9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy51ZnMtdXRpbHMtNy4xNC4xMi50YXIu
Z3ouSFlwcUttL291dHB1dOKAmQo+IAo+IC9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9vdC9v
dXRwdXQvYiAKPiAxMDAlWz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Pl0gCj4gIDc3Ljc1SyAg
LS0uLUtCL3MgICAgaW4gMC4wMnMKPiAKPiAyMDI1LTA4LTA3IDExOjA3OjMzICg0Ljk2IE1CL3Mp
IC0gCj4g4oCYL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1dC9idWlsZC8udWZz
LXV0aWxzLTcuMTQuMTIudGFyLmd6LkhZcHFLbS9vdXRwdXTigJkgCj4gc2F2ZWQgWzc5NjE5Lzc5
NjE5XQo+IAo+IHVmcy11dGlscy03LjE0LjEyLnRhci5nejogT0sgKHNoYTI1NjogCj4gOTZjZDU3
ODcyMjgzMGJjN2Q4YTQxOGQ1MjhhMzA2N2MwYjgwYWQ0MzdmNjZjMzMzM2ViYzIzOGZlNTI0MzZh
MikKPiAKPiBGaXhlczoKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMv
YjY5L2I2OTQ3MmQyZWFmMjdkZmNjOTdjMzAwYjk2ODY4Y2FiNTIwNjhjZTkKPiBodHRwczovL2F1
dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNDI5LzQyOWEyODY2OWQ5OGM2ZjQyNGYzM2Ey
MTFlYjBlYmI0OGM2ZjQ1NTMKPiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3Vs
dHMvMDFiLzAxYjkwYmQ3ZDc4YTM0YWU3MzIxOTFiNzUwZWZjNjlmMTk1Yzc4ZWMKPiBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYTA5L2EwOTdlNDgzMTRiZTJmNTIyMjM4
ODgwZTlhYjQ1MjljZWJlZmY0N2IKPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL1NhbkRpc2st
T3Blbi1Tb3VyY2UvdWZzLXV0aWxzL3B1bGwvNzAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpDb3VsZCB5b3UgcmFp
c2UgYSB0aWNrZXQgdG8gaGlnaGxpZ2h0IHRoaXMgaXNzdWUgdG8gaW4gdGhlCnVwc3RyZWFtIHBs
ZWFzZT8gd2Ugc2hvdWxkIG1ha2Ugc3VyZSB1cHN0cmVhbSBtYWludGFpbmVycyBhcmUgYXdhcmUK
b2YgdGhpcyBzaXR1YXRpb24uCgpUaGVuIGNvdWxkIHlvdSBhZGQgYSByZWZlcmVuY2Ugb2YgdGhp
cyB0aWNrZXQgaW4gdGhlIGNvbW1pdCBsb2c/CgpXZSBjYW5ub3QgcmVhbGx5IGFmZm9yZCBoYXZp
bmcgc2V2ZXJhbCBkaWZmZXJlbnQgY29waWVzIG9mIHRoZSBzYW1lCmFyY2hpdmUgbmFtZSB3aXRo
IGRpZmZlcmVudCBjb250ZW50cy4gV2Ugd2lsbCBwcm9iYWJseSBoYXZlIHRvIHJlbW92ZQp0aGUg
Im9sZCIgdmVyc2lvbiBmcm9tIHRoZSBCdWlsZHJvb3QgY2FjaGUuCgpDb3VsZCB5b3Ugc2VuZCBh
biB1cGRhdGVkIHZlcnNpb24gb2YgdGhpcyBwYXRjaCwgcGxlYXNlPwoKQmVzdCByZWdhcmRzLAoK
SnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
