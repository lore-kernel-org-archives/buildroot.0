Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242DAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 22:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C393784215;
	Mon, 30 May 2022 22:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WYXuQCk-nRT; Mon, 30 May 2022 22:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD55A840A8;
	Mon, 30 May 2022 22:18:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A43D1BF3CD
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 22:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1940B840A8
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 22:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDr3p-ZKbTke for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 22:18:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 057B2840A2
 for <buildroot@buildroot.org>; Mon, 30 May 2022 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MgjdRv8+Z9syQHH12GFu0diR8xJsfK93c56HUnT67kg=; b=Ux7NsbfjOgbxkUIn4fjO9tyC1M
 F1SJJVmYRBQVuOEtA26KR9uImMkzIJLShXJK8fwOIaNBAKT/RrrKoP2VPf5aOZSCIc1kAI7Igw4pv
 QWSmOBC3vW4gN/kDuqh65APd2lQqTtDdWc5NNDlPfaUAZtO4eaHCfO951/ayJuSdGfAQdcn/DGxo2
 k8tSRNHaanLx17idyXzTQZWseaExJKGz0xiMQKJ87zSeu4UbVjYQ5FJLQqusWRBKAk1/OTH/u80Oo
 EBOJWuWgHHfwTwLSHjU0tSWg5gg7GRf2rU35Zx9xQtL/rC9yKkhK1RLH5+2bCZSWJddqhc8VpTDjK
 lu9r0AAw==;
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nvniV-005zZ0-W9; Tue, 31 May 2022 00:18:28 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 21756362;
 Mon, 30 May 2022 22:18:17 +0000 (UTC)
Date: Tue, 31 May 2022 01:18:17 +0300
Message-ID: <20220531011817.GF740429@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Michael Nosthoff <buildroot@heine.tech>
In-Reply-To: <49-628cb280-3-6e046780@154311738>
References: <49-628cb280-3-6e046780@154311738>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.2
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
Content-Type: multipart/mixed; boundary="===============3944104248632693619=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3944104248632693619==
Content-Type: multipart/signed; boundary="fMlEPas1+cK6EQ1w"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--fMlEPas1+cK6EQ1w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gTWljaGFlbCwKCk9uIFR1ZSwgMjQgTWF5IDIwMjIgMTI6MjU6NTEgKzAyMDAgTWljaGFl
bCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6
CiAKPiBPbiBUaHVyc2RheSwgTWF5IDE5LCAyMDIyIDE5OjEyIENFU1QsIEFkcmlhbiBQZXJleiBk
ZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiAKPiA+IE9uIFRodSwgMTkgTWF5
IDIwMjIgMTg6MzE6MzAgKzAyMDAgRnJhbsOnb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdh
ZHoub3JnPiB3cm90ZToKPiA+ID4gTGUgbWVyLiAxOCBtYWkgMjAyMiDDoCAxNjoxOSwgQWRyaWFu
IFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IGEKPiA+ID4gw6ljcml0IDoKPiA+
ID4gCj4gPiA+ID4gQnVnZml4IHJlbGVhc2UsIG1vc3RseSB3aXRoIGJ1aWxkIGZpeGVzLCBhbmQg
YW4gaW1wb3J0YW50IGZpeCBmb3IKPiA+ID4gPiB3aGVuIHVzaW5nIHRocmVhZGVkIHJlbmRlcmlu
Zy4gUmVsZWFzZSBub3RlczoKPiA+ID4gPgo+ID4gPiA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3Jn
L3JlbGVhc2Uvd3Bld2Via2l0LTIuMzYuMi5odG1sCj4gPiA+ID4KPiA+ID4gPiBUaGlzIHJlbGVh
c2UgZmFpbHMgdG8gYnVpbGQgd2hlbiBYMTEgaGVhZGVycyBhcmUgbm90IHByZXNlbnQsIGJ1dCB0
aGVyZQo+ID4gPiA+IGlzIGFscmVhZHkgYSBmaXggYWNjZXB0ZWQgdXBzdHJlYW0gYW5kIHNsYXRl
ZCBmb3IgaW5jbHVzaW9uIGluIHRoZSBuZXh0Cj4gPiA+ID4gcmVsZWFzZSBpbiB0aGUgc2VyaWVz
LCBzbyBpbiB0aGUgbWVhbnRpbWUgaW1wb3J0ZWQgaXQgbG9jYWxseS4KPiA+ID4gPgo+ID4gPiA+
Cj4gPiA+IHdlYmtpdGd0ayAyLjM2LjEgKGZyb20gQlIgMjAyMi4wNS1yYzEpIGhhcyBhbHNvIHRo
aXMgaXNzdWUuCj4gPiA+IHBhdGNoIGZyb20gaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvd19i
dWcuY2dpP2lkPTIzOTAzOSBzb2x2ZXMgaXQuCj4gPiAKPiA+IEkgd2FzIGluIHRoZSBtaWRkbGUg
b2YgcHJlcGFyaW5nIHRoZSAyLjM2LjIgdXBkYXRlIGZvciB3ZWJraXRndGssIHdoaWNoCj4gPiB3
b3VsZCBpbmNsdWRlIHRoaXMgcGF0Y2ggYXMgd2VsbDsgYnV0IHRoZW4gSSBmb3VuZCBhIGRpZmZl
cmVudCBidWlsZAo+ID4gaXNzdWUuIFRoZW4gd2hpbGUgbG9va2luZyBpbnRvIGl0IEFwcGxlIHB1
Ymxpc2hlZCBhIG5ldyBsaXN0IG9mIHNlY3VyaXR5Cj4gPiBidWdzLCB3aGljaCBtZWFucyB3ZSBu
ZWVkIHRvIG1ha2UgYSBuZXcgKHdoaWNoIHdpbGwgYmUgMi4zNi4zKSBmb3IgYm90aAo+ID4gcG9y
dHMgaW5jbHVkaW5nIHRoZSBmaXhlcy4uLiBzbyBJIGhhdmUgbWVyZ2VkIHRoZSBidWlsZCBmaXgg
Zm9yIHRoZSBYMTEKPiA+IGhlYWRlcnMgaW4gdGhlIHJlbGVhc2UgYnJhbmNoIGFuZCB3ZSB3b24n
dCBldmVuIG5lZWQgdG8gaW1wb3J0IHRoZSBwYXRjaAo+ID4gaW4gQnVpbGRyb290Lgo+ID4gCj4g
PiBGV0lXOiBsZXQncyBub3QgbWVyZ2UgdGhlIDIuMzYuMiB1cGRhdGUgZm9yIHdwZXdlYmtpdCwg
YmVjYXVzZSBpbiBhIGZldwo+ID4gZGF5cyBJIHdpbGwgc2VuZCBhbnl3YXkgcGF0Y2hlcyB0byBn
byBkaXJlY3RseSB0byAyLjM2LjMKPiA+IAo+IAo+IEkganVzdCB0ZXN0ZWQgdGhlIDIwMjIuMDUt
cmMxICsgdGhpcyBwYXRjaCB3aXRoIG15IGNvbmZpZy4KPiAKPiBUaGUgcGF0Y2ggc29sdmVkIHRo
ZSBYMTEgaGVhZGVycyBidWlsZCBlcnJvciBidXQgSSdtIGdldHRpbmcgdHdvIG90aGVyIGVycm9y
cy4KPiAKPiAoVGhpcyBhcHBsaWVzIHRvIDIuMzYuMSBhcyB3ZWxsIGFzIDIuMzYuMiwgYm90aCBw
YXRjaGVkKQo+IAo+IFRoZSBmaXJzdCBvbmUgImRpc2FwcGVhcnMiIHdoZW4gSSBpc3N1ZSAibWFr
ZSB3cGV3ZWJraXQiIGEgc2Vjb25kIHRpbWUsIHNvIEkgZ3Vlc3MgdGhpcwo+IGlzIGEgY29uY3Vy
cmVuY3kgaXNzdWUgaW4gdGhlIGJ1aWxkIHNldHVwOgo+IAo+IFsgMzklXSBCdWlsdCB0YXJnZXQg
SmF2YVNjcmlwdENvcmVfQ29weVByaXZhdGVIZWFkZXJzCj4gU2Nhbm5pbmcgZGVwZW5kZW5jaWVz
IG9mIHRhcmdldCBqc2MKPiBtYWtlWzRdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnU291
cmNlL0phdmFTY3JpcHRDb3JlL0NNYWtlRmlsZXMvTG93TGV2ZWxJbnRlcnByZXRlckxpYi5kaXIv
bGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAubycsIG5lZWRlZCBieSAnYmluL2pzYycuICBT
dG9wLgo+IG1ha2VbNF06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4gWyAz
OSVdIEJ1aWxkaW5nIENYWCBvYmplY3QgU291cmNlL0phdmFTY3JpcHRDb3JlL3NoZWxsL0NNYWtl
RmlsZXMvanNjLmRpci9fXy9qc2MuY3BwLm8KPiBtYWtlWzNdOiAqKiogW0NNYWtlRmlsZXMvTWFr
ZWZpbGUyOjc5NDogU291cmNlL0phdmFTY3JpcHRDb3JlL3NoZWxsL0NNYWtlRmlsZXMvanNjLmRp
ci9hbGxdIEVycm9yIDIKPiBtYWtlWzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLgo+IFNjYW5uaW5nIGRlcGVuZGVuY2llcyBvZiB0YXJnZXQgTG93TGV2ZWxJbnRlcnByZXRl
ckxpYgo+IFsgMzklXSBCdWlsZGluZyBDWFggb2JqZWN0IFNvdXJjZS9KYXZhU2NyaXB0Q29yZS9D
TWFrZUZpbGVzL0xvd0xldmVsSW50ZXJwcmV0ZXJMaWIuZGlyL2xsaW50L0xvd0xldmVsSW50ZXJw
cmV0ZXIuY3BwLm8KPiBbIDM5JV0gQnVpbHQgdGFyZ2V0IExvd0xldmVsSW50ZXJwcmV0ZXJMaWIK
PiBbIDM5JV0gQnVpbHQgdGFyZ2V0IFdlYkluc3BlY3RvclVJCj4gbWFrZVsyXTogKioqIFtNYWtl
ZmlsZToxNzE6IGFsbF0gRXJyb3IgMgo+IAo+IGFuZCB0aGUgYnVpbGQgdWx0aW1hdGVseSB0aGVu
IGxhdGVyIGZhaWxzIHdpdGggdGhpcyBlcnJvcjoKPiAKPiBbIDQ4JV0gQnVpbGRpbmcgQ1hYIG9i
amVjdCBTb3VyY2UvV2ViQ29yZS9DTWFrZUZpbGVzL1dlYkNvcmUuZGlyL19fL19fL1dlYkNvcmUv
RGVyaXZlZFNvdXJjZXMvdW5pZmllZC1zb3VyY2VzL1VuaWZpZWRTb3VyY2UtY2JkZmUzMjMtNDIu
Y3BwLm8KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gcGxhdGZvcm0vZ3JhcGhpY3MvZmlsdGVycy9G
RVNwZWN1bGFyTGlnaHRpbmcuaDoyNSwKPiAgICAgICAgICAgICAgICAgIGZyb20gc3ZnL1NWR0ZF
U3BlY3VsYXJMaWdodGluZ0VsZW1lbnQuaDoyNSwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi4v
Li4vV2ViQ29yZS9EZXJpdmVkU291cmNlcy9KU1NWR0ZFU3BlY3VsYXJMaWdodGluZ0VsZW1lbnQu
aDoyNiwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi4vLi4vV2ViQ29yZS9EZXJpdmVkU291cmNl
cy9KU1NWR0ZFU3BlY3VsYXJMaWdodGluZ0VsZW1lbnQuY3BwOjIyLAo+ICAgICAgICAgICAgICAg
ICAgZnJvbSAuLi8uLi9XZWJDb3JlL0Rlcml2ZWRTb3VyY2VzL3VuaWZpZWQtc291cmNlcy9Vbmlm
aWVkU291cmNlLTNhNTJjZTc4LTExOS5jcHA6NToKPiBwbGF0Zm9ybS9ncmFwaGljcy9maWx0ZXJz
L0ZFTGlnaHRpbmcuaDo3Mjo0MTogZXJyb3I6IOKAmExpZ2h0aW5nRGF0YeKAmSBkb2VzIG5vdCBu
YW1lIGEgdHlwZQo+ICAgIDcyIHwgICAgIGlubGluZSB2b2lkIHBsYXRmb3JtQXBwbHlOZW9uKGNv
bnN0IExpZ2h0aW5nRGF0YSYsIGNvbnN0IExpZ2h0U291cmNlOjpQYWludGluZ0RhdGEmKTsKPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn4KPiBtYWtlWzRdOiAqKiogW1NvdXJjZS9XZWJDb3JlL0NNYWtlRmlsZXMvV2ViQ29yZS5kaXIv
YnVpbGQubWFrZTo1MTUyOiBTb3VyY2UvV2ViQ29yZS9DTWFrZUZpbGVzL1dlYkNvcmUuZGlyL19f
L19fL1dlYkNvcmUvRGVyaXZlZFNvdXJjZXMvdW5pZmllZC1zb3VyY2VzL1VuaWZpZWRTb3VyY2Ut
M2E1MmNlNzgtMTE5LmNwcC5vXSBFcnJvciAxCj4gCj4gSSB0cmllZCB0byBmaW5kIGl0IGluIHRo
ZSB3ZWJraXQgYnVndHJhY2tlciBidXQgd2FzIG5vdCBzdWNjZXNzZnVsLiAKCldlIGhhdmUgaGFk
IGEgZmV3IGJ1Z3MgcmVsYXRlZCB0byB0aGUgZmlsdGVycyBjb2RlIGluIHRoZSBwYXN0IHdoZW4K
dGFyZ2V0aW5nIDMyLWJpdCBBUk0sIHNwZWNpYWxseSB0aGUgTkVPTiBmYXN0LXBhdGhzIHdoaWNo
IGRvIG5vdCBnZXQKcmVndWxhcmx5IGJ1aWx0IGJ5IGJ1aWxkYm90cyBvbiBlYWNoIFdlYktpdCBj
b21taXQuCgo+IE15IFdQRSBkZWZjb25maWcgaXMgCj4gCj4gQlIyX1BBQ0tBR0VfV1BFV0VCS0lU
PXkKPiBCUjJfUEFDS0FHRV9XUEVXRUJLSVRfU0FOREJPWD15Cj4gCj4gd2l0aCB0aGUgYXJtIGdj
YyAxMC4zIHRvb2xjaGFpbi4KCkNhbiB5b3UgY29uZmlybSB0aGF0IHlvdSBhcmUgdGFyZ2V0aW5n
IHNvbWUgMzItYml0IEFSTSBwcm9jZXNzb3I/IElmCnllcywgZG9lcyBpdCBoYXZlIE5FT04gc3Vw
cG9ydD8gQWx0ZXJuYXRpdmVseSwgaWYgeW91IGNhbiBzaGFyZSBhCi5jb25maWcsIG9yIHVzZSDi
gJxtYWtlIHNhdmVkZWZjb25maWfigJ0gYW5kIHNoYXJlIHRoZSBvdXRwdXQsIHRoYXQgd2lsbApt
YWtlIGl0IG11Y2ggZWFzaWVyIGZvciBtZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIGFuZCBmaW5k
IGEgc3VpdGFibGUKZml4LgoKPiBkbyB5b3UgaGF2ZSBhbnkgaWRlYSBpZiB0aGlzIG1pZ2h0IGJl
IGZpeGVkIGluIHRoZSB1cGNvbWluZyAyLjM2LjM/CgpNb3N0IGxpa2VseSBub3QuIEl0IG1pZ2h0
IGJlIGZpeGVkIGJ5IGNoYW5jZSBkdWUgdG8gc2hpZnRpbmcgaW4gdGhlCnNvdXJjZXMgd2hpY2gg
Z2V0IGluY2x1ZGVkIGluIGVhY2ggdW5pZmllZC1zb3VyY2UgY29tcGlsYXRpb24gdW5pdCwKdGhv
IC0tIGJ1dCBvbmNlIEkgaGF2ZSBhIHdheSB0byByZXByb2R1Y2UsIEkgYW0gY29uZmlkZW50IGl0
IGNhbiBiZQpzb2x2ZWQuCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--fMlEPas1+cK6EQ1w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYpVCqQAKCRCRxVnb5MkS
O/wOAKCAUSH8y35EfuwjuG4m8n7dWHvMsACfcoEHLX46pgam+FIgUsmbUr4w1fg=
=m964
-----END PGP SIGNATURE-----

--fMlEPas1+cK6EQ1w--

--===============3944104248632693619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3944104248632693619==--
