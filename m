Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A95C32796
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 15:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4D1340BA0;
	Wed, 24 Aug 2022 15:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D1340BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wn4CUVioOPXc; Wed, 24 Aug 2022 15:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9400A405AA;
	Wed, 24 Aug 2022 15:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9400A405AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71F851BF489
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 15:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58D1560BD3
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 15:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58D1560BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kd3OT4GusdM for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 15:35:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0BBC60BC3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0BBC60BC3
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 15:35:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7dbd:6c96:78c0:4dbe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CEEC92003DC;
 Wed, 24 Aug 2022 17:35:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 Aug 2022 17:35:16 +0200
Date: Wed, 24 Aug 2022 17:35:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220824153516.GC2775145@scaer>
References: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
 <20220823164040.GH2167049@scaer> <20220823212640.17ee94c6@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823212640.17ee94c6@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661355320;
 bh=Wr2IJwr+Ri1tn3Xz7uxyy2ibvnS1z+12MeAr0lBYQVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVHJX8EZiVW85K5chkWMhLGDSsCKXF7uNPsBPeXtG4qgV3pNfMwydwu1uKP3k4HZP
 kBtV4gs0qOSdg05HoiDkIqLf5v96OUKIu0I3wf3Nzs1qqf9kkCdtdW3N1TiAtSSx65
 i55y3Cb8/Ros4BCpTtwlIr0F9bONP1PfOLihot+tucCsPH2m5yYQ29hJucB3bn2m5Y
 IUrEqzAZRmkLAbTrrFD99PGW1oWpiQC+SdXRhzcX8E2D9v5v8Rm0NdvJQbAbI9X7NZ
 NOMNf+8MYSDe7YgkIQ61TWmYxFhrVHZtYqgVTfPA41gzfy/y42PrgHOBH0f0bndqzv
 x2SbkzWb8WtgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MVHJX8EZ
Subject: Re: [Buildroot] Docker container for 2022.02.x release
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
Cc: Thierry GUIBERT <thierry.guibert@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIyLTA4LTIzIDIxOjI2ICswMjAwLCBUaG9tYXMgUGV0YXp6b25p
IHNwYWtlIHRodXNseToKPiBPbiBUdWUsIDIzIEF1ZyAyMDIyIDE4OjQwOjQwICswMjAwCj4gIllh
bm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gCj4gPiA+IE9u
IHRoZSBodWIsIHRoZSBsYXRlc3QgY29udGFpbmVyIHB1Ymxpc2hlZCBpcyAyMDIxMTEyMC4xOTI1
IHdoaWNoIGRvZXMgbm90Cj4gPiA+IHNlZW1zIHRvIGNvbnRhaW4gcHl0aG9uLXB5dGVzdCwgc28g
bXkgZ2l0bGFiIHBpcGVsaW5lcyBhcmUgb3V0IG9mIG9yZGVyLgo+ID4gPiAKPiA+ID4gSGF2ZSB5
b3UgbW92ZWQgdG8gYW4gb3RoZXIgZG9ja2VyIHJlZ2lzdHJ5ID8gIAo+ID4gCj4gPiBZZXAuIEFu
ZCBzaW5jZSB0aGUgaW1hZ2VzIGFyZSBub3QgcmVhbGx5IG1lYW50IGZvciBkaXJlY3QgY29uc3Vt
cHRpb24sCj4gPiB3ZSBub3QgbG9uZ2VyIHB1c2ggdGhlbSB0byB0aGUgZG9ja2VyaHViLgo+ID4g
Cj4gPiBUaGVyZSBoYWQgYmVlbiBhbiBhdHRlbXB0IGF0IHByb3ZpZGluZyBnZW5lcmljIGltYWdl
cyBvZiB2YXJpb3VzCj4gPiBkaXN0cmlidXRpb25zLCB0YWh0IHdlIHdvanVsZCBoYXZlIGtpbmRh
IGFkdmVydGlzZWQsIGJ1dCB0aGUgZWZmb3J0Cj4gPiBoYXMgc3RhbGxlZC4uLgo+IAo+IEkgcmVh
bGx5IHRoaW5rIHdlIHNob3VsZCBjaGFuZ2UgdGhlIGJ1aWxkcm9vdC9iYXNlIGltYWdlIHRvIGJl
IGEKPiAiYmFzaWMiIGltYWdlIHdpdGggcmVhbGx5IHRoZSBtaW5pbWFsIHJlcXVpcmVtZW50cyBm
b3IgQnVpbGRyb290LCBhbmQKPiBwdWJsaXNoIHRoaXMgaW1hZ2Ugb24gRG9ja2VySHViLiBUaGVu
LCB3ZSBzaG91bGQgaGF2ZSBhIGJ1aWxkcm9vdC9jaQo+IGltYWdlIHRoYXQgaXMgaW4gdGhlIEdp
dGxhYiByZWdpc3RyeSwgYW5kIHVzZWQgYnkgb3VyIEdpdGxhYiBDSSBqb2JzLgoKQnV0IEkgdGhp
bmsgdGhlIGN1cnJlbnQgc2l0dWF0aW9uIGlzIGFscmVhZHkgZWFzeSBlbm91Z2guCgogMS4gcGVv
cGxlIHdobyB3YW50IHRvIHRyeSBCdWlsZHJvb3QgY2FuIGFscmVhZHkgdXNlIHRoZSBjdXJyZW50
IGltYWdlOgogICAgdGhleSBqdXN0IGhhdmUgdG8gcHVsbCBmcm9tIHRoZSBnaXRsYiByZWdpc3Ry
eSBpbnN0ZWFkIG9mIHRoZSBkb2NrZXIKICAgIGh1YjsgdGhlcmUgaXMgZXZlbiB0aGUgdXRpbHMv
ZG9ja2VyLXJ1biBoZWxwZXIgc2NyaXB0IHRoYXQgY2FuIGJlCiAgICB1c2VkIHRvIGVpdGhlciAg
ZW50ZXIgYW4gaW50ZXJhY3RpdmUgc2hlbGwsIG9yIHNwYXduIGFuIGFyYml0cmFyeQogICAgY29t
bWFuZDsKCiAyLiBwZW9wbGUgd2hvIHdhbnQgdG8gZ2VuZXJhdGUgdGhlaXIgb3duIGltYWdlIHdp
dGggbW9yZSB0aGFuIHRoZSBiYXNlCiAgICBtaW5pbXVtOiB0aGV5IGNhbiBwb2ludCB0aGVpciBE
b2NrZXJmaWxlIEZST00gdG8gb3VyIGltYWdlIGluIHRoZQogICAgZ2l0bGFiIHJlZ2lzdHJ5OwoK
IDMuIHBlb3BsZSB3aG8gd2FudCB0byB0ZXN0IGJ1aWxkIGZhaWx1cmVzOiBhZ2FpbiwgcHVsbGlu
ZyB0aGUgaW1hZ2UKICAgIGZyb20gdGhlIGdpdGxhYiByZWdpc3RyeSBpcyBlYXN5IGVub3VnaCwg
YW5kIHRoaXMgaXMgbm90IGV2ZW4KICAgIHJlcXVpcmVkIGFzIHRoZSBoZWxwZXIgc2NyaXB0IHdp
bGwgd3JhcCBhbGwgdGhhdC4KClRoZSBvbmx5IGNhdmVhdCBoZXJlLCBpcyB0aGF0IHdlIHNob3Vs
ZCBtYXliZSBiZXR0ZXIgYWR2ZXJ0aXNlIHRoYXQgdGhlCm9mZmljaWFsIGltYWdlIGlzIGluIHRo
ZSBnaXRsYWIgcmVnaXN0cnksIG5vdCB0aGUgZG9ja2VyaHViLgoKU28sIEkgdGhpayB0aGF0IG91
ciBpbWFnZSBzaG91bGQgc3RpbGwgYmUgYSBiYXNlIGltYWdlIHRoYXQgaXMgb25seQpzdWl0ZWQg
Zm9yIG91ciBDSSwgYW5kIGlmIHdlIG5lZWQgc29tZXRoaW5nIGVsc2UsIHRoZW4gd2Ugc2hvdWxk
IGJ1aWxkCm9uIHRvcCBvZiB0aGF0LgoKRmluYWxseSwgdGhlcmUgaXMgYSBmb3VydGggdXNhZ2Us
IHRoYXQgSSBrbm93IFRob21hcyBhbHJlYWR5IGNvbXBsYWluZWQKYWJvdXQsIGlzIHRoYXQgaXQg
aXMgbm90IHBvc3NpYmxlIHRvIGJlY29tZSByb290IGluIHRoZSBjdXJyZW50IGltYWdlCmJlY2F1
c2UgdGhlICdidWlsZHJvb3QnIHVzZXIgaXMgbm90IHN1ZG9lciAoYW5kIHRoZXJlIGlzIG5vIHJv
b3QKcGFzc3dvcmQpLCB0byBkbyBzb21lIHF1aWNrIHRlc3RpbmcuCgpIb3dldmVyLCBpdCBpcyB2
ZXJ5IHBvc3NpYmxlIHRvIGJlY29tZSByb290IGluIHRoYXQgaW1hZ2U7IGp1c3QgdGVsbApkb2Nr
ZXIgdG8gcnVuIGFzIHJvb3QgKGJ1dCB3ZSBjYW4ndCBkbyB0aGF0IHdpdGggdGhlIGhlbHBlciBz
Y3JpcHQsCmdyYW50ZWQpOgoKICAgIGRvY2tlciBydW4gLXUgMDowIGJsYWJsYS4uLi4KCllvdSBj
YW4gZXZlbiBkbyBzbyBpbiBhbiBleGlzdGluZyBjb250YWluZXIgKG5vdGljZSB0aGUgY29udGFp
bmVyIElEIGluCnRoZSBwcm9tcHQpOgoKICAgICMgaW4gb25lIHRlcm1pbmFsOgogICAgJCBpZCAt
YQogICAgdWlkPTEwMDAoeW1vcmluKSBnaWQ9MTAwMCh5bW9yaW4pIC4uLgogICAgJCAuL3V0aWxz
L2RvY2tlci1ydW4KICAgIGJyLXVzZXJAMTA1N2ZkYmJjYjU1Oi9zb21lL3BhdGgkIGlkIC1hCiAg
ICB1aWQ9MTAwMChici11c2VyKSBnaWQ9MTAwMChici11c2VyKSAuLi4KCiAgICAjIGluIGFub3Ro
ZXIgdGVybWluYWw6CiAgICAkIGRvY2tlciBleGVjIC10IC1pIC11IDA6MCAxMDU3ZmRiYmNiNTUg
L2Jpbi9zaAogICAgIyBpZCAtYQogICAgdWlkPTAocm9vdCkgZ2lkPTAocm9vdCkgLi4uCgpBbmQg
aWYgb25lIG5lZWRzIHNvbWV0aGluZyBhIGxpdGxsZSBsb25nZXItbGFzdGluZywgaGVyZSdzIGEg
dHJpdmlhbApEb2NrZXJmaWxlOwoKICAgICQgY2F0IGZvby9Eb2NrZXJmaWxlCiAgICBGUk9NIHJl
Z2lzdHJ5LmdpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvYmFzZToyMDIyMDIwNi4x
NzU2CiAgICBVU0VSIDA6MAogICAgJCBkb2NrZXIgYnVpbGQgLXQgYnItcm9vdCBmb28KICAgICQg
ZG9ja2VyIHJuIC0tcm0gLXRpIGJyLXJvb3QKICAgICMgaWQgLWEKICAgIHVpZD0wKHJvb3QpIGdp
ZD0wKHJvb3QpIC4uLgoKRXQgdm9pbMOgLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
