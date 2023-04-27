Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A81C77B61
	for <buildroot@archiver.kernel.org>; Thu, 27 Apr 2023 14:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD90041604;
	Thu, 27 Apr 2023 14:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD90041604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKuPhV6321HH; Thu, 27 Apr 2023 14:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E2A141685;
	Thu, 27 Apr 2023 14:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E2A141685
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAF2E1BF5A2
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 14:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3A0B60E42
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 14:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3A0B60E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhWnESzoHqce for <buildroot@lists.busybox.net>;
 Thu, 27 Apr 2023 14:41:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC0060ACC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EC0060ACC
 for <buildroot@buildroot.org>; Thu, 27 Apr 2023 14:41:16 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ps2nz-00EJ2g-0B; Thu, 27 Apr 2023 16:41:07 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 0caadd10;
 Thu, 27 Apr 2023 14:41:04 +0000 (UTC)
Date: Thu, 27 Apr 2023 17:41:00 +0300
Message-ID: <20230427174100.GB3095221@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230425173033.GB998279@igalia.com>
References: <20230227105838.358916-1-thomas.devoogdt@barco.com>
 <20230424151152.GB3960430@igalia.com> <20230425173033.GB998279@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EJXQOnkCaW4eCg57obQJQ7ffRiS+MeFO0VBuvlG6GW8=; b=GhYnckvRCLt4y/vYSGchgfxU90
 XO6nyTrfWMxdqeoeGxak0gptckOLKiGz/iJBPeSLilt5muA8jQyTANrNirX3YGTdMgpmbuLJVXofx
 dORSZSxoXSXlaOSF8CWV1oCT3rYgc6lGcb+0TK3Y6+VYe/xQSs4q8hnyu96x7Z9szTlxoQ8PzcOAJ
 bsK6w9Gy8OnM7CPnOXXRDQDChmkztyqE4TAc/YjL9qBHP7+2LtbX4DgFfEc4YaRcSHCh+rYSiw8dc
 tlv6s0F3JcAVqRYGzDXObfI1f/H5WBlAxz+hAmkQGBvumqw8Nb39UIYcbHgiUKtRUHlhagjH/Vrs8
 Cp20U9Hw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=GhYnckvR
Subject: Re: [Buildroot] [PATCH v5 1/5] package/at-spi2-core: bump to
 version 2.47.1
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
Cc: Daniel Lang <d.lang@abatec.at>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7074487206405793153=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7074487206405793153==
Content-Type: multipart/signed; boundary="81bMrsbFSl5tIzB3"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--81bMrsbFSl5tIzB3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLAoKT25lIG1vcmUgbm90ZSBhYm91dCB0aGlzLi4uCgpPbiBUdWUsIDI1IEFwciAy
MDIzIDE3OjMwOjMzICswMzAwIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEu
Y29tPiB3cm90ZToKCj4gT24gTW9uLCAyNCBBcHIgMjAyMyAxNToxMTo1MiArMDMwMCBBZHJpYW4g
UGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4gPiBIaSBhbGwsCj4g
PiAKPiA+IE9uIE1vbiwgMjcgRmViIDIwMjMgMTE6NTg6MzQgKzAxMDAgVGhvbWFzIERldm9vZ2R0
IDx0aG9tYXNAZGV2b29nZHQuY29tPiB3cm90ZToKPiA+ID4gRnJvbTogRGFuaWVsIExhbmcgPGQu
bGFuZ0BhYmF0ZWMuYXQ+Cj4gPiA+IAo+ID4gPiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05P
TUUvYXQtc3BpMi1jb3JlLy0vYmxvYi9BVF9TUEkyX0NPUkVfMl80N18xL05FV1MKCkluIHR5cGlj
YWwgR05PTUUgZmFzaGlvbiwgdGhlIHNlY29uZCB2ZXJzaW9uIG51bWJlciBiZWluZyBvZGQgbWVh
bnMgdGhhdCB0aGlzCndhcyBhIGRldmVsb3BtZW50IHJlbGVhc2UuIEV2ZW4gc2Vjb25kIG51bWJl
cnMgYXJlIHRoZSBzdGFibGUgb25lcywgc28gaXQKd291bGQgYmUgYmV0dGVyIHRvIGRvIHRoZSB2
ZXJzaW9uIGJ1bXAgdG8gMi40OC4wIGluc3RlYWQsIHdoaWNoIGhhcyBiZWVuCmF2YWlsYWJsZSBm
b3IgYSBtb250aDoKCiAgaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2F0LXNwaTItY29y
ZS8tL2Jsb2IvQVRfU1BJMl9DT1JFXzJfNDhfMC9ORVdTCgpDaGVlcnMsIGFuZCB0aGFua3MgYWdh
aW4gZm9yIHlvdXIgZWZmb3J0IG9uIHRoaXMgcGF0Y2ggc2V0ID0pCgo+ID4gPiAtIFgxMSBpcyBu
b3cgb3B0aW9uYWwuCj4gPiA+IC0gbGlieG1sMiBpcyBubyBsb25nZXIgb3B0aW9uYWwuCj4gPiA+
IC0gYXRrIGFuZCBhdC1zcGkyLWF0ayBoYXZlIGJlZW4gbWVyZ2VkIGludG8gYXQtc3BpMi1jb3Jl
Lgo+ID4gPiAtIGF0ayBpbnRyb3NwZWN0aW9uIG9wdGlvbiBhZGRlZC4KPiA+ID4gCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBMYW5nIDxkLmxhbmdAYWJhdGVjLmF0Pgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+Cj4gPiAK
PiA+IEkgdGVzdGVkIHRoaXMgcGF0Y2ggc2VyaWVzIGFuZCBpbmRlZWQgaXQgYWxzbyBzb2x2ZXMg
dGhlIFdlYktpdEdUSyBidWlsZAo+ID4gaXNzdWVzIGNhdXNlcyBieSBhdGstYnJpZGdlIGJlaW5n
IG1pc3NpbmcuIE92ZXJhbGwgSSBwcmVmZXIgdGhpcyBhcHByb2FjaAo+ID4gYmV0dGVyIHRoYW4g
cGF0Y2hpbmcgbGliZ3RrMydzIE1lc29uIGJ1aWxkIHN5c3RlbSBhcyBzdWdnZXN0ZWQgaW4gYW5v
dGhlcgo+ID4gcGF0Y2guCj4gPiAKPiA+IFRoZXJlIGlzIG9uZSBodXJkbGUsIHRob3VnaDogSSBo
YXZlIHRvIG1ha2Ugb25lIHBhdGNoIGZvciBhdC1zcGkyLWNvcmUKPiA+IGJlY2F1c2UgSSBoYXZl
IGRidXMtYnJva2VyIGluc3RhbGxlZCBpbiBvbmUgb2YgbXkgY29tcHV0ZXJzIGFuZCB0cnlpbmcg
dG8KPiA+IGJ1aWxkIHRoZXJlIHJlc3VsdCBpbiB0aGUgYnVpbGQgY29uZmlndXJhdGlvbiB0aGlu
a2luZyB0aGF0IGl0IG5lZWRzIHRvCj4gPiB1c2UgbGlic3lzdGVtZCB3aGVuIHRoZSBCdWlsZHJv
b3QgY29uZmlndXJhdGlvbiBoYXMgaXQgZGlzYWJsZWQuIEkgbWFkZQo+ID4gdGhpcyBwYXRjaCB3
aGljaCBzb2x2ZWQgdGhlIGlzc3VlIGZvciBtZSwgYWx0aG91Z2ggSSBhbSBub3QgMTAwJSBzdXJl
IGl0Cj4gPiBpcyB0aGUgYmVzdCB3YXkgdG8gZ286Cj4gPiAKPiA+ICAgaHR0cHM6Ly9naXRsYWIu
Z25vbWUub3JnL0dOT01FL2F0LXNwaTItY29yZS8tL21lcmdlX3JlcXVlc3RzLzEzNAo+ID4gCj4g
PiBXZSBtYXkgd2FudCB0byBpbmNsdWRlIHRoaXMgcGF0Y2ggKG9yIGEgc2ltaWxhciBvbmUpIHdo
aWxlIHVwc3RyZWFtIGRvZXMKPiA+IG5vdCBoYXZlIGEgc29sdXRpb24gZm9yIHRoaXMgaXNzdWUu
Cj4gCj4gTXkgcGF0Y2ggZm9yIGF0LXNwaTItY29yZSB3YXMgbWVyZ2VkLCBpZiB5b3Ugd291bGQg
cmVzdWJtaXQgdGhlIHZlcnNpb24KPiBidW1wIHdpdGggaXQgaW5jbHVkZWQsIEkgd2lsbCBoYXBw
aWx5IGFkZCBteSBUZXN0ZWQtQnkgLyBSZXZpZXdlZC1CeSB0bwo+IHRoZSB3aG9sZSBzZXJpZXMg
Oy0pCj4gIAo+ID4gPiAtLS0KPiA+ID4gdjM6Cj4gPiA+ICAtIHJlYmFzZWQgb24gaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzM2MjU0
Cj4gPiA+ICAtIG5lZWRlZCB0byBmaXggdGhlIHdlYmtpdGd0ayAyLjM4LjUgY29tcGlsYXRpb24K
PiA+ID4gICAgKGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
cGF0Y2gvMjAyMzAyMjAwOTA5MjMuMjE1NTYzNS0yLXRob21hcy5kZXZvb2dkdEBiYXJjby5jb20v
KQo+ID4gPiB2NTogcmViYXNlZCArIGdyb3VwZWQgcGF0Y2hlcwo+ID4gPiAtLS0KPiA+ID4gIHBh
Y2thZ2UvYXQtc3BpMi1jb3JlL0NvbmZpZy5pbiAgICAgICAgIHwgIDggKystLS0tLS0KPiA+ID4g
IHBhY2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5oYXNoIHwgIDQgKystLQo+ID4gPiAg
cGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLm1rICAgfCAyMCArKysrKysrKysrKysr
KysrKy0tLQo+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2F0LXNwaTItY29yZS9D
b25maWcuaW4gYi9wYWNrYWdlL2F0LXNwaTItY29yZS9Db25maWcuaW4KPiA+ID4gaW5kZXggZjU2
YzViOTNjNC4uMWY2YzQyMTc3NyAxMDA2NDQKPiA+ID4gLS0tIGEvcGFja2FnZS9hdC1zcGkyLWNv
cmUvQ29uZmlnLmluCj4gPiA+ICsrKyBiL3BhY2thZ2UvYXQtc3BpMi1jb3JlL0NvbmZpZy5pbgo+
ID4gPiBAQCAtMSwxMiArMSwxMiBAQAo+ID4gPiAgY29uZmlnIEJSMl9QQUNLQUdFX0FUX1NQSTJf
Q09SRQo+ID4gPiAgCWJvb2wgImF0LXNwaTItY29yZSIKPiA+ID4gLQlkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX1hPUkc3ICMgeGxpYi1saWJ4dHN0Cj4gPiA+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENI
QUlOX0hBU19USFJFQURTICMgZGJ1cywgZ2xpYjIKPiA+ID4gIAlkZXBlbmRzIG9uIEJSMl9VU0Vf
TU1VICMgZ2xpYjIKPiA+ID4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBnbGliMgo+ID4g
PiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9EQlVTCj4gPiA+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
QkdMSUIyCj4gPiA+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWFRTVAo+ID4gPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9MSUJYTUwyCj4gPiA+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJf
TElCWFRTVCBpZiBCUjJfUEFDS0FHRV9YT1JHNyAjIG9wdGlvbmFsbHkgZm9yIFgxMQo+ID4gPiAg
CWhlbHAKPiA+ID4gIAkgIFRoZSBBdC1TcGkyIENvcmUgcGFja2FnZSBpcyBhIHBhcnQgb2YgdGhl
IEdOT01FCj4gPiA+ICAJICBBY2Nlc3NpYmlsaXR5IFByb2plY3QuIEl0IHByb3ZpZGVzIGEgU2Vy
dmljZSBQcm92aWRlcgo+ID4gPiBAQCAtMTksNyArMTksMyBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
QVRfU1BJMl9DT1JFCj4gPiA+ICBjb21tZW50ICJhdC1zcGkyLWNvcmUgbmVlZHMgYSB0b29sY2hh
aW4gdy8gd2NoYXIsIHRocmVhZHMiCj4gPiA+ICAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ID4g
PiAgCWRlcGVuZHMgb24gIUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVB
RFMKPiA+ID4gLQo+ID4gPiAtY29tbWVudCAiYXQtc3BpMi1jb3JlIGRlcGVuZHMgb24gWC5vcmci
Cj4gPiA+IC0JZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ID4gPiAtCWRlcGVuZHMgb24gIUJSMl9Q
QUNLQUdFX1hPUkc3Cj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2F0LXNwaTItY29yZS9hdC1z
cGkyLWNvcmUuaGFzaCBiL3BhY2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5oYXNoCj4g
PiA+IGluZGV4IDc2NGU0YzM2NjEuLjQ1MzFiZjM5NmMgMTAwNjQ0Cj4gPiA+IC0tLSBhL3BhY2th
Z2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5oYXNoCj4gPiA+ICsrKyBiL3BhY2thZ2UvYXQt
c3BpMi1jb3JlL2F0LXNwaTItY29yZS5oYXNoCj4gPiA+IEBAIC0xLDUgKzEsNSBAQAo+ID4gPiAt
IyBGcm9tIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvYXQtc3BpMi1jb3JlLzIu
MzYvYXQtc3BpMi1jb3JlLTIuMzYuMC5zaGEyNTZzdW0KPiA+ID4gLXNoYTI1NiAgODhkYTU3ZGUw
YTdlM2M2MGJjMzQxYTk3NGE4MGZkYmEwOTE2MTJkYjM1NDdjNDEwZDZkZWFiMDM5Y2E1YzA1YSAg
YXQtc3BpMi1jb3JlLTIuMzYuMC50YXIueHoKPiA+ID4gKyMgRnJvbSBodHRwczovL2Rvd25sb2Fk
Lmdub21lLm9yZy9zb3VyY2VzL2F0LXNwaTItY29yZS8yLjQ3L2F0LXNwaTItY29yZS0yLjQ3LjEu
c2hhMjU2c3VtCj4gPiA+ICtzaGEyNTYgIGM2YmE3YzE2MDQzNGVkZWJmMDlkMjkzNjkzMzU2OWM5
MzZmNmVjOTcyMzAxNzY2ZjJiZGFjNWE0ZDQxODE1M2MgIGF0LXNwaTItY29yZS0yLjQ3LjEudGFy
Lnh6Cj4gPiA+ICAKPiA+ID4gICMgbG9jYWxseSBjYWxjdWxhdGVkCj4gPiA+ICBzaGEyNTYgIGRj
NjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMy
ZmU1NTEgIENPUFlJTkcKPiA+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXQtc3BpMi1jb3JlL2F0
LXNwaTItY29yZS5tayBiL3BhY2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5tawo+ID4g
PiBpbmRleCBmMGIwMTljMGVkLi5lOThlNzc5ODg0IDEwMDY0NAo+ID4gPiAtLS0gYS9wYWNrYWdl
L2F0LXNwaTItY29yZS9hdC1zcGkyLWNvcmUubWsKPiA+ID4gKysrIGIvcGFja2FnZS9hdC1zcGky
LWNvcmUvYXQtc3BpMi1jb3JlLm1rCj4gPiA+IEBAIC00LDE3ICs0LDMxIEBACj4gPiA+ICAjCj4g
PiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gPiAgCj4gPiA+IC1BVF9TUEkyX0NPUkVf
VkVSU0lPTl9NQUpPUiA9IDIuMzYKPiA+ID4gLUFUX1NQSTJfQ09SRV9WRVJTSU9OID0gJChBVF9T
UEkyX0NPUkVfVkVSU0lPTl9NQUpPUikuMAo+ID4gPiArQVRfU1BJMl9DT1JFX1ZFUlNJT05fTUFK
T1IgPSAyLjQ3Cj4gPiA+ICtBVF9TUEkyX0NPUkVfVkVSU0lPTiA9ICQoQVRfU1BJMl9DT1JFX1ZF
UlNJT05fTUFKT1IpLjEKPiA+ID4gIEFUX1NQSTJfQ09SRV9TT1VSQ0UgPSBhdC1zcGkyLWNvcmUt
JChBVF9TUEkyX0NPUkVfVkVSU0lPTikudGFyLnh6Cj4gPiA+ICBBVF9TUEkyX0NPUkVfU0lURSA9
IGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvYXQtc3BpMi1jb3JlLyQoQVRfU1BJ
Ml9DT1JFX1ZFUlNJT05fTUFKT1IpCj4gPiA+ICBBVF9TUEkyX0NPUkVfTElDRU5TRSA9IExHUEwt
Mi4xKwo+ID4gPiAgQVRfU1BJMl9DT1JFX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gPiA+ICBB
VF9TUEkyX0NPUkVfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gPiA+IC1BVF9TUEkyX0NPUkVfREVQ
RU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGRidXMgbGliZ2xpYjIgeGxpYl9saWJYdHN0IFwKPiA+
ID4gK0FUX1NQSTJfQ09SRV9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgZGJ1cyBsaWJnbGli
MiBsaWJ4bWwyIFwKPiA+ID4gIAkkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQo+ID4gPiAgQVRf
U1BJMl9DT1JFX0NPTkZfT1BUUyA9IC1EZGJ1c19kYWVtb249L3Vzci9iaW4vZGJ1cy1kYWVtb24K
PiA+ID4gIAo+ID4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9YT1JHNykseSkKPiA+ID4gK0FUX1NQ
STJfQ09SRV9DT05GX09QVFMgKz0gLUR4MTE9ZW5hYmxlZAo+ID4gPiArQVRfU1BJMl9DT1JFX0RF
UEVOREVOQ0lFUyArPSB4bGliX2xpYlh0c3QKPiA+ID4gK2Vsc2UKPiA+ID4gK0FUX1NQSTJfQ09S
RV9DT05GX09QVFMgKz0gLUR4MTE9ZGlzYWJsZWQKPiA+ID4gK2VuZGlmCj4gPiA+ICsKPiA+ID4g
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfR09CSkVDVF9JTlRST1NQRUNUSU9OKSx5KQo+ID4gPiArQVRf
U1BJMl9DT1JFX0NPTkZfT1BUUyArPSAtRGludHJvc3BlY3Rpb249ZW5hYmxlZAo+ID4gPiArQVRf
U1BJMl9DT1JFX0RFUEVOREVOQ0lFUyArPSBnb2JqZWN0LWludHJvc3BlY3Rpb24KPiA+ID4gK2Vs
c2UKPiA+ID4gK0FUX1NQSTJfQ09SRV9DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0aW9uPWRpc2Fi
bGVkCj4gPiA+ICtlbmRpZgo+ID4gPiArCj4gPiA+ICBBVF9TUEkyX0NPUkVfTERGTEFHUyA9ICQo
VEFSR0VUX0xERkxBR1MpICQoVEFSR0VUX05MU19MSUJTKQo+ID4gPiAgCj4gPiA+ICAkKGV2YWwg
JChtZXNvbi1wYWNrYWdlKSkKPiA+ID4gLS0gCj4gPiA+IDIuMzkuMgo+ID4gPiAKPiA+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+ID4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+ID4g
Cj4gPiAKPiA+IENoZWVycywKPiA+IOKAlEFkcmnDoW4KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gQ2hlZXJzLAo+IOKAlEFkcmnDoW4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKQ2hlZXJzLArigJRBZHJp
w6FuCg==

--81bMrsbFSl5tIzB3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZEqJfAAKCRCRxVnb5MkS
O038AJ9BdK/NPHCHxb8yCUpygqStggLCigCfQf+QXFF8XBPIdNaFUyGfvgys4/I=
=dlsg
-----END PGP SIGNATURE-----

--81bMrsbFSl5tIzB3--

--===============7074487206405793153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7074487206405793153==--
