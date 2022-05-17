Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AD0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 07:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136AE60D62;
	Tue, 17 May 2022 07:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwrwJZP79UHi; Tue, 17 May 2022 07:42:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11E1C60BAC;
	Tue, 17 May 2022 07:42:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4E41BF2F6
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8948583E09
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 07:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDMqxT9DHabH for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 07:42:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FA2183DFF
 for <buildroot@buildroot.org>; Tue, 17 May 2022 07:42:41 +0000 (UTC)
Received: from [77.244.183.192] (port=64648 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nqrqp-0006FO-NQ; Tue, 17 May 2022 09:42:39 +0200
Message-ID: <367a3562-5f82-3ed1-b2b6-63d4316102d7@lucaceresoli.net>
Date: Tue, 17 May 2022 09:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: it-IT
To: Neal Frager <nealf@xilinx.com>, Peter Korsgaard <peter@korsgaard.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
 <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
 <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
 <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758C4D738BDB949E2A2C0DBD7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758610ADD04816CE25C00D9D7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB7758610ADD04816CE25C00D9D7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwgUGV0ZXIsCgpPbiAxMy8wNS8yMiAxMjo0OCwgTmVhbCBGcmFnZXIgd3JvdGU6Cj4g
SGkgTHVjYSwKPiAKPj4gSGkgUGV0ZXIsIEx1Y2EsCj4+Cj4+Cj4+Cj4+PiBMZSAxMiBtYWkgMjAy
MiDDoCAyMTozMywgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3Jp
dCA6Cj4+Pgo+Pj4g77u/Q0FVVElPTjogVGhpcyBtZXNzYWdlIGhhcyBvcmlnaW5hdGVkIGZyb20g
YW4gRXh0ZXJuYWwgU291cmNlLiBQbGVhc2UgdXNlIHByb3BlciBqdWRnbWVudCBhbmQgY2F1dGlv
biB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5n
IHRvIHRoaXMgZW1haWwuCj4+Pgo+Pj4KPj4+Pj4+Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2VyIDxu
ZWFsZkB4aWxpbnguY29tPiB3cml0ZXM6Cj4+Pgo+Pj4gSGksCj4+Pgo+Pj4+Pj4gSSBoYWQgdG8g
YWxzbyBwYXNzIHRoZSAtbSogZmxhZ3MgaW4gRVhUUkFfQ09NUElMRVJfRkxBR1MgdG8gZ2V0IGl0
IAo+Pj4+Pj4gdG8gbGluaywgcHJlc3VtYWJseSB0aGUgcGV0YWxpbnV4IHRvb2xjaGFpbiBoYXMg
aW5jb21wYXRpYmxlIAo+Pj4+Pj4gZGVmYXVsdHMuIEx1Y2EsIGFueSBzcGVjaWZpYyByZWFzb25z
IHRvIG5vdCBwYXNzIENGTEFHUyB0aGVyZT8KPj4+Pj4KPj4+Pj4gSSdtIGFmcmFpZCBJIGhhdmUg
bm8gcmVhbCBhbnN3ZXIuIDooIFdoZW4gSSBpbml0aWFsbHkgd3JvdGUgdGhlIAo+Pj4+PiBzY3Jp
cHQgSSBkaWQgaXQgdG8gaGF2ZSB0aGUgc2FtZSBsb2dpYyBhcyBwZXRhbGludXguIExhdGVyIEkg
ZGlkbid0IAo+Pj4+PiB3YXRjaCBmb3IgaXRzIGNoYW5nZXMuIEkgd291bGQgbG92ZSB0byBiZSBo
ZWxwZnVsIGJ1dCBJIGhhdmUgbm8gCj4+Pj4+IGFjY2VzcyB0byBhIHp5bnFtcCBib2FyZCBub3cu
Cj4+Pgo+Pj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIGZvciB5b3UgdG8ganVzdCBpbXBsZW1lbnQg
dGhlIGNoYW5nZXMgdGhhdCAKPj4+PiBQZXRlciBoYXMgcHJvcG9zZWQ/ICBQZXRlciBhcHBlYXJz
IHRvIGhhdmUgYWxyZWFkeSBpZGVudGlmaWVkIGEgc29sdXRpb24uCj4+Pgo+Pj4+IEJvdGggUGV0
ZXIgYW5kIEkgaGF2ZSB6Y3UxMDYgYm9hcmRzLCBzbyB3ZSBjYW4gYm90aCB0ZXN0IGFuZCB2ZXJp
ZnkgCj4+Pj4gdGhlIHVwZGF0ZSB3b3Jrcy4KPj4+Cj4+PiBTb3JyeSwgdGhhdCBpcyBub3QgdHJ1
ZS4gSSBoYXZlbid0IGZvdW5kIHRoZSBtYWdpYyBpbmNhcm5hdGlvbiB0byBnZXQgCj4+PiBhIHdv
cmtpbmcgcG11ZncgYnVpbGQgd2l0aCB0aGUgdG9vbGNoYWluIGJ1aWx0IGJ5IGNyb3NzdG9vbC1u
Zy4gTXkgCj4+PiBkaWZmIHdhcyBqdXN0IHRvIHNob3cgd2hhdCBJIGhhZCB0byBjaGFuZ2UgdG8g
YWRqdXN0IAo+Pj4genlucW1wLXBtdWZ3LWJ1aWxkZXIgdG8gdXNlIGEgcGV0YWxpbnV4IHRvb2xj
aGFpbi4KPj4+Cj4+Cj4+IElzIHRoZXJlIGEgcmVhc29uIHdoeSB3ZSBjYW5ub3QgY2hhbmdlIHRo
ZSB6eW5xbXAtcG11ZnctYnVpbGRlciB0byBkb3dubG9hZCB0aGUgc2FtZSB0b29sY2hhaW4gdGhh
dCBwZXRhbGludXggdXNlcyBhcyB0aGUgY3Jvc3N0b29sLW5nIHRvb2xjaGFpbj8KPiAKPj4gQ2Fu
IHlvdSBwb2ludCB0byB3aGVyZSB0aGUgcGV0YWxpbnV4IHRvb2xjaGFpbiBjb21lcyBmcm9tPwo+
IAo+PiBJZiBwZXRhbGludXggdXNlcyBhIHB1YmxpY2x5IGF2YWlsYWJsZSBwcmVidWlsdCB0b29s
Y2hhaW4sIHBvc3NpYmx5IHdpdGggc291cmNlcyBhdmFpbGFibGUsIHRoZW4gdGhpcyBjb3VsZCBi
ZSBjb25zaWRlcmVkLgo+IAo+PiBIb3dldmVyIEkgc3VzcGVjdCBpdCBkb2VzIHVzZSBhIHRvb2xj
aGFpbiB0aGF0IGlzIHNoaXBwZWQgYnkgVml0aXMuIElmIGl0IGlzIHRoZSBjYXNlLCB0aGVuIGl0
J3Mgbm90IGFuIG9wdGlvbiBoZXJlLgo+IAo+PiBUaGUgZXN0IG9wdGlvbiB3b3VsZCBiZSB0byBm
aXggdGhlIGN0LW5nIHRvb2xjaGFpbiBvZiBjb3Vyc2UsIGJ1dCBJJ20gCj4+IGFmcmFpZCBJIGNh
bm5vdCBiZSB2ZXJ5IGhlbHBmdWwgb24gdGhpcywgZXNwZWNpYWxseSB3aXRob3V0IGFuIAo+PiBo
YXJkd2FyZSB0byB0ZXN0LiA6KAo+IAo+PiBWaXRpcyBhbmQgUGV0YUxpbnV4IDIwMjIuMSB1c2Ug
R0NDIGNvbXBpbGVyIDExLjIuMCB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2ggc2V0Ogo+PiBodHRw
czovL2dpdGh1Yi5jb20vWGlsaW54L21ldGEteGlsaW54L3RyZWUveGxueC1yZWwtdjIwMjIuMS9t
ZXRhLW1pY3JvCj4+IGJsYXplL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMQo+IAo+PiBGZWVs
IGZyZWUgdG8gcGljayB5b3VyIG1pcnJvciBzaXRlIGZvciB0aGUgR0NDIDExLjIuMCBkb3dubG9h
ZC4KPiAKPj4gQW5vdGhlciBhbHRlcm5hdGl2ZSBpcyB0byBqdXN0IGRvd25sb2FkIHRoZSBwcmUt
YnVpbHQgY29tcGlsZXIgZGlyZWN0bHkgZnJvbSB0aGUgWGlsaW54IHdlYnNpdGU6Cj4+IGh0dHBz
Oi8vd3d3LnhpbGlueC5jb20vcHJvZHVjdHMvZGVzaWduLXRvb2xzL2d1ZXN0LXJlc291cmNlcy5o
dG1sI2dudTIwMjIKPj4gaHR0cHM6Ly93d3cueGlsaW54LmNvbS9iaW4vcHVibGljL29wZW5Eb3du
bG9hZD9maWxlbmFtZT1nY2MteGxueC0xMV8yXzAtcmVsZWFzZS56aXAKPiAKPj4gVGhlbiB5b3Ug
YXJlIHN1cmUgdG8gaGF2ZSB0aGUgZXhhY3Qgc2FtZSBjb21waWxlciBQZXRhTGludXggYW5kIFZp
dGlzIGFyZSB1c2luZywgYW5kIHlvdSBkbyBub3QgbmVlZCB0byB3b3JyeSBhYm91dCBidWlsZGlu
ZyB0aGUgdG9vbGNoYWluLgo+IAo+IFNtYWxsIGNvcnJlY3Rpb24uICBZb3Ugc3RpbGwgbmVlZCB0
byBidWlsZCB0aGUgY29tcGlsZXIgYWZ0ZXIgZG93bmxvYWRpbmcgaXQgZnJvbSB0aGUgWGlsaW54
IHJlbGVhc2Ugc2l0ZS4KPiAKPiBXaGF0IGRvIHlvdSB0aGluaz8gIENvdWxkIHdlIHN3aXRjaCB0
byB0aGUgc2FtZSBHQ0MgMTEuMi4wIGNvbXBpbGVyIHRoYXQgUGV0YUxpbnV4IHVzZXM/CgpQZXJo
YXBzIGl0IGNvdWxkIGJlIGRvbmUsIGhvd2V2ZXIgSSdkIGxpa2UgdG8gc3RheSBvbiBhIHN0YW5k
YXJkIG9wZW4Kc291cmNlIHRvb2wgc3VjaCBhcyBjdC1uZy4KCkkgdGhpbmsgdGhlc2Ugc2hvdWxk
IGJlIGRvbmUsIGluIHRoaXMgb3JkZXI6CgoxLiB0cnkgY3QtbmcgMS4yNSwganVzdCByZWxlYXNl
ZAoyLiB5b3UgcG9pbnRlZCB0byB0aGUgbWV0YS14aWxpbnggdHJlZSB3aGljaCBoYXMgNTArIHBh
dGNoZXM7CiAgIHVzZSB0aGVtIGluIG91ciBjdC1uZyBidWlsZCBhbmQgc2VlIGlmIHRoZXkgZml4
IHRoZSBwcm9ibGVtCiAgIC0+IGlmIHRoZXkgZG8sIGlzb2xhdGUgdG8gb25lKHMpIHRoYXQgZG8g
aXQKMy4gbW9yZSBvcHRpb25zPwo5LiBzd2l0Y2ggdG8gYnVpbGRpbmcgdGhlIFhpbGlueCB0b29s
Y2hhaW4KCi0tIApMdWNhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
