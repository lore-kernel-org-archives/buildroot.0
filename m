Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7256AC47DD9
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 09:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC0D74182B;
	Fri, 22 Mar 2024 09:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gb5MpKuh4zgv; Fri, 22 Mar 2024 09:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A314044C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83A314044C;
	Fri, 22 Mar 2024 09:00:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04F5C1BF344
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 09:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E24D641734
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 09:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqwGfl5P4asA for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 09:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39647416B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39647416B2
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39647416B2
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 09:00:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B789FCE16C5;
 Fri, 22 Mar 2024 09:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B6BC43394;
 Fri, 22 Mar 2024 09:00:11 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 22 Mar 2024 11:00:10 +0200
Message-Id: <D005ME2OYT34.NPTNEUOG5JFC@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Stefan Berger"
 <stefanb@linux.ibm.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0
References: <20240321182126.24115-1-jarkko@kernel.org>
 <20240321182126.24115-3-jarkko@kernel.org>
 <be88778f-53fc-493b-829a-2434ea0782ef@linux.ibm.com>
 <a043db624b2d3c57bf6f43c949b63e1b0d1dfbe9.camel@kernel.org>
 <72edf77b90bc03df925a5b3116c981e90a868e7e.camel@kernel.org>
In-Reply-To: <72edf77b90bc03df925a5b3116c981e90a868e7e.camel@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711098012;
 bh=WtziGSLUVxiQgro+r53UWINTmsN2shWHZ1UkUIHR8z8=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=F81lP/Ts0cZuwVgVToJyeWqSnRZFD87h/GbVll/kIyLnvUgXmK83olRHltOjE8x60
 otDCVOtZgblC031NyKaGImnqUP1FXmRGiJeIaxKfd6fW45azEvP3H20dkBEq5lIg37
 SlIqPd5Ej/00n7VmMl38vpamtHLqC02jKmt+rQ6DtSGdmfMLRKyd/NkHrN8b2pxx0n
 9pGL06AyZ7o7MPtWMtKF021Q4ilkei7P8jnNqr+v27Wjvlm6Az6I/tObFxACcQ0CGc
 Yv9LgKGdtuJaeB+nG9eX6K4nx2HDTN13/NNNaiqBRp/ytXIa4Kbx1JCrsFGHrKFTAu
 bgE1WrlRpMMAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=F81lP/Ts
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpIE1hciAyMiwgMjAyNCBhdCAxMDozNSBBTSBFRVQsIEphcmtrbyBTYWtraW5lbiB3cm90
ZToKPiBPbiBGcmksIDIwMjQtMDMtMjIgYXQgMTA6MjIgKzAyMDAsIEphcmtrbyBTYWtraW5lbiB3
cm90ZToKPiA+IE9uIFRodSwgMjAyNC0wMy0yMSBhdCAxNjozMCAtMDQwMCwgU3RlZmFuIEJlcmdl
ciB3cm90ZToKPiA+ID4gCj4gPiA+IAo+ID4gPiBPbiAzLzIxLzI0IDE0OjIxLCBKYXJra28gU2Fr
a2luZW4gd3JvdGU6Cj4gPiA+ID4gQWRkIHN3dHBtIGFuZCBpdHMgZGVwZW5kZW5jeSBsaWJ0cG1z
IHRvIGhvc3QgcGFja2FnZXMuIFRoZXNlIGFyZQo+ID4gPiA+IHVzZWZ1bAo+ID4gPiA+IGZvciBl
bXVsYXRpbmcgVFBNIGluIFFFTVUgZW52aXJvbm1lbnQuCj4gPiA+ID4gCj4gPiA+ID4gTGluazog
aHR0cHM6Ly9naXRsYWIuY29tL2phcmtrb2pzL2xpbnV4LXRwbWRkLXRlc3QKPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYXJra28gU2Fra2luZW4gPGphcmtrb0BrZXJuZWwub3JnPgo+ID4gPiA+IC0t
LQo+ID4gPiAKPiA+ID4gPiArLS0tCj4gPiA+ID4gKyBjb25maWd1cmUuYWMgfCAxNiArKysrKysr
Ky0tLS0tLS0tCj4gPiA+ID4gKyAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+ID4gPiA+ICsKPiA+ID4gPiArZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBi
L2NvbmZpZ3VyZS5hYwo+ID4gPiA+ICtpbmRleCA0OWNhZjk2Li40YWNjNzYzIDEwMDY0NAo+ID4g
PiA+ICstLS0gYS9jb25maWd1cmUuYWMKPiA+ID4gPiArKysrIGIvY29uZmlndXJlLmFjCj4gPiA+
ID4gK0BAIC0zOTQsMjAgKzM5NCwyMCBAQCBBU19JRihbdGVzdCAieCRlbmFibGVfZGVmYXVsdF9w
Y3JfYmFua3MiCj4gPiA+ID4gIT0KPiA+ID4gPiAieCJdLFsKPiA+ID4gPiArIHBjcl9iYW5rX2No
ZWNrcwo+ID4gPiA+ICsgQUNfU1VCU1QoW0RFRkFVTFRfUENSX0JBTktTXSkKPiA+ID4gPiArCj4g
PiA+ID4gKy1BQ19QQVRIX1BST0coW0VYUEVDVF0sIGV4cGVjdCkKPiA+ID4gPiArLWlmIHRlc3Qg
IngkRVhQRUNUIiA9ICJ4IjsgdGhlbgo+ID4gPiA+ICstCUFDX01TR19FUlJPUihbZXhwZWN0IGlz
IHJlcXVpcmVkOiBleHBlY3QgcGFja2FnZV0pCj4gPiA+ID4gKy1maQo+ID4gPiA+ICsrIyBBQ19Q
QVRIX1BST0coW0VYUEVDVF0sIGV4cGVjdCkKPiA+ID4gPiArKyMgaWYgdGVzdCAieCRFWFBFQ1Qi
ID0gIngiOyB0aGVuCj4gPiA+ID4gKysjwqAJQUNfTVNHX0VSUk9SKFtleHBlY3QgaXMgcmVxdWly
ZWQ6IGV4cGVjdCBwYWNrYWdlXSkKPiA+ID4gPiArKyMgZmkKPiA+ID4gPiArCj4gPiA+ID4gKyBB
Q19QQVRIX1BST0coW0dBV0tdLCBnYXdrKQo+ID4gPiA+ICsgaWYgdGVzdCAieCRHQVdLIiA9ICJ4
IjsgdGhlbgo+ID4gPiA+ICvCoAlBQ19NU0dfRVJST1IoW2dhd2sgaXMgcmVxdWlyZWQ6IGdhd2sg
cGFja2FnZV0pCj4gPiA+ID4gKyBmaQo+ID4gPiA+ICsKPiA+ID4gPiArLUFDX1BBVEhfUFJPRyhb
U09DQVRdLCBzb2NhdCkKPiA+ID4gPiArLWlmIHRlc3QgIngkU09DQVQiID0gIngiOyB0aGVuCj4g
PiA+ID4gKy0JQUNfTVNHX0VSUk9SKFtzb2NhdCBpcyByZXF1aXJlZDogc29jYXQgcGFja2FnZV0p
Cj4gPiA+ID4gKy1maQo+ID4gPiA+ICsrIyBBQ19QQVRIX1BST0coW1NPQ0FUXSwgc29jYXQpCj4g
PiA+ID4gKysjIGlmIHRlc3QgIngkU09DQVQiID0gIngiOyB0aGVuCj4gPiA+ID4gKysjwqAJQUNf
TVNHX0VSUk9SKFtzb2NhdCBpcyByZXF1aXJlZDogc29jYXQgcGFja2FnZV0pCj4gPiA+ID4gKysj
IGZpCj4gPiA+IAo+ID4gPiAKPiA+ID4gY2F0IGFuZCBleHBlY3QgYXJlIHVzZWQgZm9yIHJ1bm5p
bmcgdGhlIHRlc3QgY2FzZXMuIFdoZW4gbm90Cj4gPiA+IHJ1bm5pbmcgCj4gPiA+IHRoZSB0ZXN0
cyB0aGVuIGFuIGFsdGVybmF0aXZlIHRvIGNvbW1lbnRpbmcgdGhlIGFib3ZlIG91dCBtYXkgYmUg
dG8KPiA+ID4gZG8gCj4gPiA+IHRoZSBmb2xsb3dpbmcgYmVmb3JlIHJ1bm5pbmcgYXV0b2dlbi5z
aDoKPiA+ID4gCj4gPiA+IHRtcGRpcj0kKG1rdGVtcCAtZCkgfHwgZXhpdCAxCj4gPiA+IGNwIC91
c3IvYmluL3RydWUgIiR7dG1wZGlyfS9zb2NhdCIKPiA+ID4gY3AgL3Vzci9iaW4vdHJ1ZSAiJHt0
bXBkaXJ9L2V4cGVjdCIKPiA+ID4gCj4gPiA+IFBBVEg9JFBBVEg6JHt0bXBkaXJ9Cj4gPiA+IC4v
YXV0b2dlbiAtLXByZWZpeD0uLi4KPiA+ID4gcm0gLXJmICIke3RtcGRpcn0iCj4gPiA+IAo+ID4g
PiDCoMKgwqDCoCBTdGVmYW4KPiA+IAo+ID4gLi4uIHdoaWNoIHdvdWxkIGJlIG1vcmUgdGVkaW91
cyB0aGFuIHNpbXBseSBjb21tZW50aW5nIHRoZW0gb3V0Cj4gPiBiZWNhdXNlIHRoZW4geW91IHdv
dWxkIGhhdmUgdG8gdHdlYWsgdGhlIGJ1aWxkIGl0c2VsZiB3aXRoIG1hbnVhbAo+ID4gc3RlcHMg
aW5zdGVhZCBvZiB1c2luZyBhdXRvdG9vbHMgYnVpbGQgY29tbWFuZC4KPiA+IAo+ID4gVXAgdW50
aWwgdGhpcyBpcyBmaXhlZCBpbiB0aGUgdXBzdHJlYW0gcHJvamVjdCwgd2UgYXJlIGJldHRlciBv
ZmYKPiA+IHNpbXBseSBjb21tZW50aW5nIHRoZW0gb3V0LCBhcyB0aGV5IGFyZSB0ZXN0IGRlcGVu
ZGVuY3ksIG5vdCBhIGJ1aWxkCj4gPiBkZXBlbmRlbmN5IGZvciBidWlsZGluZyBlLmcuIGluaXRy
YW1mcyBpbWFnZSBvciBzb21lIG90aGVyIHR5cGUgb2YKPiA+IE9TIGltYWdlLgo+Cj4gQW5kIHRo
ZXJlJ3MgYSBsb3Qgb2Ygc2hlbmFuaWdhbnMgcmVsYXRlZCB0byB0aGUgY3Jvc3MtY29tcGlsYXRp
b24KPiBlbnZpcm9ubWVudCwgd2hpY2ggcmVuZGVyIG91dCB0aGUgc3VnZ2VzdGlvbiBhbnl3YXkg
aW4gdGhhdCBmb3JtLgo+Cj4gSXQncyBhIGJ1ZyBiZWNhdXNlIG5laXRoZXIgc29jYXQgbm9yIGV4
cGVjdCBhcmUgYWN0dWEgYnVpbGQKPiBkZXBlbmRlbmNpZXMsIGFuZCB0aGUgcGF0Y2ggd29ya3Mg
YXJvdW5kIHRoZSBidWcuCgpJIHB1dCBvdXQgYW4gaXNzdWU6CgpodHRwczovL2dpdGh1Yi5jb20v
c3RlZmFuYmVyZ2VyL3N3dHBtL2lzc3Vlcy84NDMKCkl0J3Mgbm90IGEgaHVnZSBwcm9ibGVtIGZv
ciBCdWlsZFJvb3QgYXMgdGhlIGJ1aWxkIHZlcnNpb24gaXMgYWx3YXlzCmZpeGVkLiBXZSBjYW4g
dXBkYXRlIHRoZSB2ZXJzaW9uIGluIEJ1aWxkUm9vdCBhbmQgcmVtb3ZlIHRoZSBwYXRjaAp3aGVu
IHRoZSB0aW1lIGNvbWVzLgoKVGhpcyBpcyBhIGJpZ2dlciBpc3N1ZSB0aGFuIHN3dHBtIGluIGF1
dG90b29scyBwcm9qZWN0cy4gTW9zdCBvZiB0aGVtCmhhdmUgdGVzdCBzdWl0ZXMgdGhhdCBhcmUg
bm90IGNvbXBhdGlibGUgd2l0aCBjcm9zcy1jb21waWxhdGlvbiBidXQKaW5zdGVhZCBhc3N1bWUg
aW1wbGljaXRseSB0aGF0IHRoZSBtYWNoaW5lIHdoaWNoIGJ1aWxkcyBpcyBhbHNvIHRoZQpvbmUg
dGhhdCBydW5zIHRoZSB0ZXN0cywgd2hpY2ggZG9lcyBub3QgaG9sZCB3aGVuIGJ1aWxkaW5nIGZ1
bGwgT1MKaW1hZ2VzLgoKQlIsIEphcmtrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
