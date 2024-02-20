Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C825C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 20:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3287481D24;
	Tue, 20 Feb 2024 20:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8RxzAhqsizF; Tue, 20 Feb 2024 20:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EECBB81D68
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EECBB81D68;
	Tue, 20 Feb 2024 20:04:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5851BF42E
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0946C416FF
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgaMTJ4eVjjd for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 20:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E89A416C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E89A416C6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E89A416C6
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 20:04:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41KK4Eld074191;
 Tue, 20 Feb 2024 14:04:14 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41KK4EvQ125513
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Feb 2024 14:04:14 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Feb 2024 14:04:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Feb 2024 14:04:14 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41KK4E1M117423;
 Tue, 20 Feb 2024 14:04:14 -0600
Date: Tue, 20 Feb 2024 14:04:14 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240220200414.2bsvqvaeltqhsulc@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <90dd167b-bceb-4e42-86c3-255caf825f41@smile.fr>
 <CAOf5uwka5w7DEAOox1pAfZ=mkpostmNATBJ_Ny1xuyYesXUwoQ@mail.gmail.com>
 <bf687add-2677-45fe-8eb1-cf04bd95bf57@smile.fr>
 <20240220004100.3yzqapeplx6olarz@dasso>
 <0b6dbe1f-2591-4290-b620-880d63eee7d0@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b6dbe1f-2591-4290-b620-880d63eee7d0@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708459454;
 bh=XmgtLUSJSbcQEFkX0TGU04IC3ipZlIsCemhjUvf9qKk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PmbKI99VniWb7+U3um3FBBVU05zP3kU4nwEamb8YiPIBP9WeoKuruA8C7uO00vOc7
 T87T7lhxiIl0HtLhpE2wcawXEGtlZ+WQQCYaS6PZy9bWVF5EryxOYrqwzXHLBf2Au5
 U7a2QrZQLKYkPQkaaj5hTejXJlMOg0XPpML0z/0Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PmbKI99V
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMTE6MDM6NTRBTSArMDEwMCwgUm9t
YWluIE5hb3VyIHdyb3RlOgo+IEhlbGxvIEFuZHJlYXMsCj4gCj4gTGUgMjAvMDIvMjAyNCDDoCAw
MTo0MSwgQW5kcmVhcyBEYW5uZW5iZXJnIGEgw6ljcml0wqA6Cj4gPiBPbiBNb24sIEZlYiAxOSwg
MjAyNCBhdCAxMjoyNDo1MlBNICswMTAwLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gPj4gSGVsbG8g
TWljaGFlbCwKPiA+Pgo+ID4+IExlIDE5LzAyLzIwMjQgw6AgMTI6MDIsIE1pY2hhZWwgTmF6emFy
ZW5vIFRyaW1hcmNoaSBhIMOpY3JpdMKgOgo+ID4+PiBIaSBSb21haW4KPiA+Pj4KPiA+Pj4gT24g
TW9uLCBGZWIgMTksIDIwMjQgYXQgMTA6MzDigK9BTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gSGVsbG8gRGFyaW8sCj4gPj4+Pgo+ID4+
Pj4gTGUgMTcvMDIvMjAyNCDDoCAxNzowMiwgRGFyaW8gQmluYWNjaGkgYSDDqWNyaXQgOgo+ID4+
Pj4+IFRoZSBTSy1BTTYyQi1QMSBpcyB0aGUgbmV3ZXN0IHZlcnNpb24gb2YgU0stQU02MiB3aGlj
aCBpbmNsdWRlcwo+ID4+Pj4+IGhpZ2gtc2VjdXJpdHkgZmllbGQtc2VjdXJhYmxlIChIUy1GUykg
c2lsaWNvbiB0byBvcHRpb25hbGx5IGN1c3RvbWl6ZSBrZXlzCj4gPj4+Pj4gYW5kIGVuY3J5cHRp
b24gZm9yIHNlY3VyaXR5IGFwcGxpY2F0aW9ucy4KPiA+Pj4+PiBUaGlzIHJlcXVpcmVzIGVuYWJs
aW5nIHRoZSBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZTIG9wdGlvbiwK
PiA+Pj4+PiB3aGljaCwgaG93ZXZlciwgd2FzIGJ1Z2d5LiBUaGlzIHNlcmllcyBmaXhlcyB0aGUg
ZXJyb3JzIGFuZCBidW1wcyB0aGUgTGludXgKPiA+Pj4+PiBrZXJuZWwgYW5kIFUtQm9vdCByZXF1
aXJlZCBmb3Igc3VjaCBhIG5ldyBkZXZpY2UuCj4gPj4+Pj4KPiA+Pj4+PiBUaGlzIHNlcmllcywg
d2hpY2ggaW4gbXkgaHVtYmxlIG9waW5pb24sIHNob3VsZCBoYXZlIGJlZW4gaW1tZWRpYXRlbHkK
PiA+Pj4+PiBjb25zaWRlcmVkIHRvIGNvcnJlY3QgdGhlIGNvbXBpbGF0aW9uIGVycm9ycyBpbiBj
YXNlIG9mIEhTLUZTIGRldmNpZXMsIGhhcwo+ID4+Pj4+IHNlZW4gYW4gaW5jcmVhc2UgaW4gcGF0
Y2hlcyBpbiB2ZXJzaW9uIDQgdG8gcmVtb3ZlIHRoZSB0aS1rMy1pbWFnZS1nZW4KPiA+Pj4+PiBw
YWNrYWdlIHRoYW5rcyB0byBCaW5tYW4uIEFkZGl0aW9uYWxseSwgaXQgc2hhcmVzIHNvbWUgbW9k
aWZpY2F0aW9ucyBhbmQKPiA+Pj4+PiB2aWV3cyBvbiBob3cgdG8gaW1wbGVtZW50IGNlcnRhaW4g
Y2hhbmdlcyB3aXRoIHRoZSBzZXJpZXMKPiA+Pj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zOTQ4NDAuCj4gPj4+Pj4gVGhlcmVm
b3JlLCBJIHRoaW5rIGl0IGlzIG5lY2Vzc2FyeSBub3QgdG8gcnVuIHRoZW0gaW4gcGFyYWxsZWwg
YnV0IHRvIGRlY2lkZQo+ID4+Pj4+IHdoZXRoZXIgdG8gbWVyZ2Ugb25lIGJlZm9yZSB0aGUgb3Ro
ZXIgb3IgdG8gY29uc2lkZXIgYSBzaW5nbGUgc2VyaWVzIHdoZXJlCj4gPj4+Pj4gdGhlIHBhdGNo
ZXMgY2FuIGJlIGNvaGVyZW50IHdpdGggZWFjaCBvdGhlci4gSSBhbSBhdmFpbGFibGUgZm9yIGJv
dGggc29sdXRpb25zLgo+ID4+Pj4+IExldCBtZSBrbm93Lgo+ID4+Pj4KPiA+Pj4+IFRoYW5rcyBm
b3IgdGhpcyBuZXcgdmVyc2lvbi4gSSBiZWxlaXZlIGJvdGggc2VyaWVzIHNob3VsZCBiZSBtZXJn
ZWQgaW50byBvbmUKPiA+Pj4+IHNpbmNlIHdlIHdhbnQgdG8gZm9sbG93IHUtYm9vdCBzd2l0Y2gg
dG8gYmlubWFuLCBhZGQgbW9yZSBUSSBLMyBTb0Mgc3VwcG9ydCBhbmQKPiA+Pj4+IGtlZXBpbmcg
ZXhpc2luZyBhbTYyeCBhbnMgYW02NHggd29ya2luZyBpbiBHUCBvciBIUy9IUy1GUy4KPiA+Pj4+
Cj4gPj4+Cj4gPj4+IEJlY2F1c2UgdGhlIERhcmlvIHBhdGNoc2V0IHdhcyBzZW50IGJlZm9yZSAo
ZW5kIG9mIE5vdmVtYmVyKSwgaXQncwo+ID4+PiByZWFzb25hYmxlIHRvIHJldmlldyBhbmQgYWRq
dXN0IHRoYXQgb25lCj4gPj4+IGFuZCBhcHBseSB5b3VyIGNoYW5nZXMgZm9yIHRpX2o3MjFlX3Nr
IG9uIHRvcCBvZiBpdC4gSXQgdGhpbmsgdGhhdCBpcwo+ID4+PiBhIHN0YW5kYXJkIHdheSB0byBt
YWtlIHBlb3BsZSBoYXBweSBhYm91dAo+ID4+PiB0aGVpciB3b3JrIGFuZCBjb250cmlidXRpb24u
Cj4gPj4KPiA+PiBBY3R1YWxseSwgdGhlIHR3byBzZXJpZXMgYXJlIGFib3V0IHRoZSBzYW1lIHRv
cGljOiBUSSBLMyBTb0Mgc3VwcG9ydCAoR1AsIEhTLAo+ID4+IEhTLUZTKSBub3Qgb25seSBBTTYy
eC1TSyBIUy1GUyBkZXZpY2VzCj4gPj4KPiA+PiBCdXQgZHVlIHRvIHRoZSBjb21wbGV4aXR5IG9m
IHRoZSBCU1AsIHRoZSBib290IGZsb3cgKDQgd2F5IHRvIGJvb3QhKSBhbmQgdGhlCj4gPj4gc3dp
dGNoIGZyb20gY3VzdG9tIHRvb2wgdG8gYmlubWFuLi4uIHRoaXMgc2VyaWVzIGlzIHJlYWxseSBk
aWZmaWN1bHQgdG8gcmV2aWV3Cj4gPj4gd2l0aG91dCBoYXZpbmcgYSBnb29kIHVuZGVyc3RhbmRp
bmcgb2YgVEkgSzMgYXJjaGl0ZWN0dXJlIHBlY3VsaWFyaXR5IGFuZCBoYXZpbmcKPiA+PiBvbmUg
b2YgZWFjaCBUSSBldmFsdWF0aW9uIGJvYXJkcyDwn5mCCj4gPiAKPiA+IEFsdGhvdWdoIEkgaGVs
cGVkIGNvbmNlaXZlIHNvbWUgb2YgdGhpcyBhbmQgdGhlIGFzc29jaWF0ZWQgdG9vbGluZyBlYXJs
eQo+ID4gb24sIHNvbWUgb2YgdGhlIHdoYXQgbWF5IGxvb2sgc3RyYW5nZSBhcmNoaXRlY3R1cmFs
IGRlY2lzaW9ucyB3ZXJlIGRyaXZlbgo+ID4gYnkgZGlmZmVyZW50IHVzZSBjYXNlcyBhbmQgcmVx
dWlyZW1lbnRzIGZvciB0aGUgZGlmZmVyZW50IGRldmljZXMKPiA+IChlc3BlY2lhbGx5IGFyb3Vu
ZCBhdXRvbW90aXZlIGZhc3QvZWFybHkgYm9vdCwgYnV0IGFsc28gc2VjdXJpdHkpIGluCj4gPiBj
b21iaW5hdGlvbiB3aXRoIGxpbWl0ZWQgb24tY2hpcCBTUkFNLi4uIFNvIHRoaXMgd2hlcmUgd2Ug
YXJlIGF0IG5vdy4gQQo+ID4gZnV0dXJlIEFNNnggZGV2aWNlIHZhcmlhbnQgd2lsbCBoYXZlIHll
dCBhbm90aGVyIGJvb3QgZmxvdywgYnV0IEkgY2FuCj4gPiBhbHJlYWR5IHNheSBpdCB3aWxsIGJl
IHZlcnkgbXVjaCBzaW1wbGlmaWVkIG92ZXIgd2hhdCB3ZSBoYXZlIHRvZGF5IDopCj4gCj4gQWJv
dXQgZXhpc3RpbmcgYm9vdCBmbG93LCBJIGZvdW5kIHR3byByZWNlbnQgY29tbWl0IGluIHUtYm9v
dCB0aGF0IHN0YXRlIHRoYXQKPiB0aGUgIlNwbGl0IGJpbmFyeSIgKHRoYXQgcmVxdWlyZXMgc3lz
ZncuaXRiKSBpcyBhbHJlYWR5IGEgbGVnYWN5IGJvb3QgZmxvdzoKCkl0J3MgY2FsbGVkICJsZWdh
Y3kgYm9vdCBmbG93IiBiZWNhdXNlIGl0IHdhcyB0aGUgYm9vdCBmbG93IHVzZWQgb24gdGhlCmZp
cnN0IEszIGRldmljZXMgdGhhdCB3ZXJlIHJlbGVhc2VkIChBTTY1eCwgSjcyMUUpLiBUaGlzIGJv
b3QgZmxvdyB3YXMKbm90IHVzZWQgb24gZm9sbG93LW9uIGRldmljZXMuIFRoZSBjaGFyYWN0ZXJp
c3RpY3Mgb2YgdGhpcyBib290IGZsb3cgaXMKdGhhdCB0aGUgaW5pdGlhbCBGVyBpbWFnZSB0aGF0
IGdldHMgbG9hZGVkICh0aWJvb3QzLmJpbikgZG9lc24ndCBjb250YWluCmFueSBkZXZpY2UgZmly
bXdhcmVzLCBidXQgb25seSBhIGJvb3Rsb2FkZXIgKHN1Y2ggYXMgVS1Cb290IFNQTCkuIFRoZW4K
dGhpcyBib290IGxvYWRlciB3aWxsIGxvYWQgdGhlIFN5c3RlbSBGaXJtd2FyZSBmaXJtd2FyZSAr
IGNvbmZpZyBkYXRhCmJsb2IgKHN5c2Z3Lml0YikgaW50byB0aGUgZGVkaWNhdGVkIGNvcmUgKGNh
bGxlZCAiRE1TQyIgPSBEZXZpY2UgTWFuYWdlcgphbmQgU2VjdXJpdHkgQ29udHJvbGxlcikuIEFu
ZCB0aGVuIGFkZGlpdG9uYWwgYm9vdCBzdGFnZXMgd2lsbCBiZQpsb2FkZWQuIFRoZXNlIGRldmlj
ZXMgcmVxdWlyZSB0aGlzIGJvb3QgZmxvdywgYW5kIHdpdGggdGhpcyBpdCBpcwpyZXF1aXJlZCB0
byBiZSBzdXBwb3J0ZWQgYnkgVS1Cb290IChhbmQgYW55IExpbnV4IGRpc3RyaWJ1dGlvbiBvciBi
dWlsZApzeXN0ZW1zIHRoYXQgYnVpbGQgb24gdGhhdCkuCgpUSSBpcyBzdGlsbCBtYWtpbmcvc2Vs
bGluZyB0aG9zZSAibGVnYWN5IGJvb3QgZmxvdyIgZGV2aWNlcywgYW5kIHdpbGwKY29udGludWUg
dG8gZG8gc28gZm9yIGEgdmVyeSBsb25nIHRpbWUuIE9uZSBwcm9taW1lbnQgY29tbXVuaXR5Cmlu
Y2FybmF0aW9uIHRoYXQgeW91IGFyZSBwcm9iYWJseSBhd2FyZSBvZiBpcyB0aGUgQmVhZ2xlQm9u
ZSBBSS02NC4KCj4gYXJtOiBkdHM6IGszLWJpbm1hbjogQWRkIHN1cHBvcnQgZm9yIEZJVCB0ZW1w
bGF0ZXMKPiAKPiAgICAgQWRkIHRlbXBsYXRlcyBmb3IgRklUIGltYWdlcyB1c2VkIGV4dGVuc2l2
ZWx5IGFjcm9zcyBLMyBib2FyZHMgd2l0aCBtb3N0Cj4gICAgIG9mIHRoZSBjb2RlIGNvbW1vbi4g
VGhpcyBpbmNsdWRlcyB0aGUgRklUIHBvcnRpb25zIG9mOgo+ICAgICAJLSB0aXNwbC5iaW4KPiAg
ICAgCS0gdS1ib290LmltZwo+ICAgICAJLSBzeXNmdy5pdGIgKGluIGNhc2Ugb2YgbGVnYWN5IGJv
b3QgZmxvdykKPiAKPiBodHRwczovL2dpdGxhYi5jb20vdS1ib290L3UtYm9vdC8tL2NvbW1pdC9i
MTUzYmFkMGYxNDE2OGQ1ZmNjMDJiYTZiZjFhMmNkOThkYWJhOWI1Cj4gCj4gICAgIGFybTogZHRz
OiBrMy0qLWJpbm1hbjogTW92ZSB0byB1c2luZyB0ZW1wbGF0ZWQgRklUcwo+IAo+ICAgICBSZWR1
Y2UgcmVkdW5kYW5jeSBpbiBjb2RlIGJ5IHVzaW5nIHRlbXBsYXRlcyB0byBnZW5lcmF0ZSB0aGUg
QTcyIGJvb3QKPiAgICAgYmluYXJpZXMgKHRpc3BsLmJpbiBhbmQgdS1ib290LmltZykgYXMgd2Vs
bCBhcyBSNSBib290IGJpbmFyeSBzeXNmdy5pdGIKPiAgICAgKGZvciBsZWdhY3kgYm9vdCBmb2xs
b3dpbmcgZGV2aWNlcyBKNzIxRSBhbmQgQU02NXgpLgo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS91
LWJvb3QvdS1ib290Ly0vY29tbWl0LzQ1MDliOWZmMGI4Y2IyNjkwN2Y5ZTljMzU3MWI0MzU2NWM4
NTkyNzUKPiAKPiBXaGljaCBvbmUgc2hvdWxkIGJlIHJlY29tbWVuZGVkIG9yIGF2b2lkZWQgZm9y
IGEgbmV3IGRlc2lnbj8KClRob3NlIGNvbW1pdHMgYXJlIGp1c3QgYSBzaW1wbGlmaWNhdGlvbiB0
byByZWR1Y2UgZHVwbGljYXRpb24uIEFzIHBlcgplYXJsaWVyIGNvbW1lbnQgdGhlICJsZWdhY3kg
Ym9vdCBmbG93IiBpcyBzb21ldGhpbmcgd2UgY29udGludWUgbmVlZGluZwp0byBzdXBwb3J0LiBJ
dCBpc24ndCBzdXBwb3NlZCB0byBpbXBseSB0aGF0IHRob3NlIGRldmljZXMgYXJlIGFib3V0IHRv
CmRpc2FwcGVhci4KCk5vdCBzdXJlIGlmIHRoaXMgYW5zd2VyZWQgeW91ciBxdWVzdGlvbjsgcGxl
YXNlIGxldCBtZSBrbm93LgoKLS0KQW5kcmVhcyBEYW5uZW5iZXJnClRleGFzIEluc3RydW1lbnRz
IEluYwoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+ID4gCj4gPj4gVGhlIHNl
cmllcyAoYmFzZWQgb24gRGFyaW8ncyB3b3JrKSBhYm91dCB0aV9qNzIxZV9zayBzdWdnZXN0ZWQg
dG8gcmVtb3ZlIFRJCj4gPj4gY3VzdG9tIHRvb2xzIHJlcGxhY2VkIGJ5IGJpbm1hbiBhbG9uZyB3
aXRoIG90aGVyIGltcHJvdmVtZW50cy4KPiA+Pgo+ID4+IEknbGwgd2F5IGZvciB2NSBhbmQgcmVi
YXNlIHRoZSB0aV9qNzIxZV9zayBvbiB0b3Agb2YgaXQuCj4gPiAKPiA+IFRoYW5rIHlvdSBSb21h
aW4gZm9yIHlvdXIgYnV5LWluLiBMZXQncyBmb2N1cyBvbiBnZXR0aW5nIERhcmlvJ3Mgc2VyaWVz
Cj4gPiBpbiBnb29kIHNoYXBlIGFuZCB0aGVuIG1vdmUgb250byB5b3Vycy4gSSdkIGFsc28gbGlr
ZSB0byByZS1pbnRyb2R1Y2UKPiA+IGdyYXBoaWNzIChJIGhhZCB0aGF0IHdvcmtpbmcgYmVmb3Jl
KSBidXQgSSBuZWVkIHRvIHdhaXQgZm9yIGFsbCB0aGUKPiA+ICJiYXNlbGluZSIgc3R1ZmYgdG8g
c2V0dGxlIGZpcnN0Lgo+ID4gCj4gPiAKPiA+IC0tCj4gPiBBbmRyZWFzIERhbm5lbmJlcmcKPiA+
IFRleGFzIEluc3RydW1lbnRzIEluYwo+ID4gCj4gPiAKPiA+IAo+ID4+Cj4gPj4gQmVzdCByZWdh
cmRzLAo+ID4+IFJvbWFpbgo+ID4+Cj4gPj4KPiA+Pj4KPiA+Pj4gTWljaGFlbAo+ID4+Pgo+ID4+
Pj4gTXkgbWFpbiBjb25jZXJuIGlzIHRvIGF2b2lkIGFkZGluZyBhIG5ldyBwYWNrYWdlIGZvciBh
IHRvb2wgdGhhdCBpcyBhbHJlYWR5Cj4gPj4+PiBkZXByZWNhdGVkIHRpLWszLWltYWdlLWdlbiAo
bm90IHN1cmUgaWYgdGktazMtY29yZS1zZWNkZXYgaXMgcmVhbGx5IGRlcHJlY2F0ZWQpIFsxXS4K
PiA+Pj4+Cj4gPj4+PiBBbHNvIHRoZSB0b3BpYyBpcyBub3Qgb25seSAiQU02MngtU0sgSFMtRlMg
ZGV2aWNlcyIgYnV0ICJUSSBLMyBIUy1GUyBkZXZpY2VzIi4KPiA+Pj4+Cj4gPj4+PiBbMV0gaHR0
cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNC1GZWJydWFyeS82
ODU4MjAuaHRtbAo+ID4+Pj4KPiA+Pj4+IEJlc3QgcmVnYXJkcywKPiA+Pj4+IFJvbWFpbgo+ID4+
Pj4KPiA+Pj4+Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
