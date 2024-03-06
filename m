Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA4CC54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 10:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4671541828;
	Wed,  6 Mar 2024 10:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Sp66Tjx-42X; Wed,  6 Mar 2024 10:13:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B737441812
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B737441812;
	Wed,  6 Mar 2024 10:13:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5CC1BF299
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 10:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14AF582114
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 10:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSA6n-wAYUEi for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 10:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FDE9820EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FDE9820EE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FDE9820EE
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 10:13:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A95840002;
 Wed,  6 Mar 2024 10:13:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhoHC-001EN4-2R;
 Wed, 06 Mar 2024 11:13:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240305135724.1146746-1-fontaine.fabrice@gmail.com>
 <87msrbyfzi.fsf@48ers.dk>
 <CAPi7W82jVPEsNxiUTWs03mDwJYBAsRxkGg0WGgO_2ENfBEcvPw@mail.gmail.com>
Date: Wed, 06 Mar 2024 11:13:30 +0100
In-Reply-To: <CAPi7W82jVPEsNxiUTWs03mDwJYBAsRxkGg0WGgO_2ENfBEcvPw@mail.gmail.com>
 (Fabrice Fontaine's message of "Wed, 6 Mar 2024 10:34:41 +0100")
Message-ID: <87il1zy8fp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/policycoreutils: fix build with BR2_TIME_BITS_64
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBMZSBtZXIuIDYgbWFycyAyMDI0IMOgIDA4OjMwLCBQZXRlciBL
b3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoKID4+IAogPj4gPj4+Pj4g
IkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29t
PiB3cml0ZXM6CiA+PiAKID4+ID4gRG8gbm90IHJlbW92ZSBfRklMRV9PRkZTRVRfQklUUz02NCBm
cm9tIENGTEFHUyBhbmQgQ1BQRkxBR1MgdG8gYXZvaWQgdGhlCiA+PiA+IGZvbGxvd2luZyBidWls
ZCBmYWlsdXJlIHdpdGggQlIyX1RJTUVfQklUU182NCByYWlzZWQgc2luY2UgY29tbWl0CiA+PiA+
IDNjNDI3YzY0NzI2NTYwZWExNzQzMjgyYTNmZGI3OGY1YjI4NjkyZWI6CiA+PiAKID4+ID4gSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2ZhYnJpY2UvYnVpbGRyb290L291dHB1dC9ob3N0L21p
cHMtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2ZlYXR1cmVzLmg6Mzk0
LAogPj4gPiAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvZmFicmljZS9idWlsZHJvb3Qvb3V0
cHV0L2hvc3QvbWlwcy1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvZXJy
bm8uaDoyNSwKID4+ID4gICAgICAgICAgICAgICAgICBmcm9tIHBwLmM6MjA6CiA+PiA+IC9ob21l
L2ZhYnJpY2UvYnVpbGRyb290L291dHB1dC9ob3N0L21pcHMtYnVpbGRyb290LWxpbnV4LWdudS9z
eXNyb290L3Vzci9pbmNsdWRlL2ZlYXR1cmVzLXRpbWU2NC5oOjI2OjU6IGVycm9yOiAjZXJyb3Ig
Il9USU1FX0JJVFM9NjQgaXMgYWxsb3dlZCBvbmx5IHdpdGggX0ZJTEVfT0ZGU0VUX0JJVFM9NjQi
CiA+PiA+ICAgIDI2IHwgIyAgIGVycm9yICJfVElNRV9CSVRTPTY0IGlzIGFsbG93ZWQgb25seSB3
aXRoIF9GSUxFX09GRlNFVF9CSVRTPTY0IgogPj4gPiAgICAgICB8ICAgICBefn5+fgogPj4gCiA+
PiA+IEluZGVlZCwgdGhpcyBMRlMgd29ya2Fyb3VuZCB3YXMgdGhlcmUgc2luY2UgdGhlIGFkZGl0
aW9uIG9mIHRoZSBwYWNrYWdlCiA+PiA+IGluIGNvbW1pdCBjYjMyOGY3N2Y4ZjA3YmZkODlkNmI2
OTM4NWM5NDFhN2IyODE3MzJiICBhbmQgaXMgb25seSBuZWVkZWQKID4+ID4gdG8gZml4IGEgYnVp
bGQgZmFpbHVyZSB3aXRoIHRoZSBvbGQgY29kZXNvdXJjZXJ5LWFybSB0b29sY2hhaW4gZnJvbSAy
MDE0CiA+PiA+IHdoaWNoIHVzZXMgZ2xpYmMgPCAyLjIzLiBhcyBnbGliYyAyLjIzIHdhcyByZWxl
YXNlZCBpbiBGZWJydWFyeSAyMDE2OgogPj4gPiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dsaWJj
L3dpa2kvUmVsZWFzZS8yLjIzLCBkcm9wIHRoaXMgd29ya2Fyb3VuZCBhcwogPj4gPiBhbHJlYWR5
IGRvbmUgZm9yIGxpYnNlbGludXggaW4gY29tbWl0CiA+PiA+IGMxZmE5YmMyZjdhNGU1NDgxZWRm
NGZjZTVjMDNkZDQ1ODYyZmU3MmMuIEEgZm9sbG93LXVwIHBhdGNoIHdpbGwgYWxzbwogPj4gPiBk
cm9wIGNvZGVzb3VyY2VyeS1hcm0gdG9vbGNoYWluLgogPj4gCiA+PiA+IEZpeGVzOiAzYzQyN2M2
NDcyNjU2MGVhMTc0MzI4MmEzZmRiNzhmNWIyODY5MmViCiA+PiA+ICAtIE5vIGF1dG9idWlsZGVy
IGZhaWx1cmVzICh5ZXQpCiA+PiAKID4+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CiA+PiA+IC0tLQogPj4gPiBDaGFuZ2VzIHYx
IC0+IHYyOgogPj4gPiAgLSBBbHNvIGZpeCBob3N0IHBhY2thZ2UKID4+IAogPj4gPiAgcGFja2Fn
ZS9wb2xpY3ljb3JldXRpbHMvcG9saWN5Y29yZXV0aWxzLm1rIHwgMTcgKystLS0tLS0tLS0tLS0t
LS0KID4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQogPj4gCiA+PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BvbGljeWNvcmV1dGlscy9wb2xpY3lj
b3JldXRpbHMubWsgYi9wYWNrYWdlL3BvbGljeWNvcmV1dGlscy9wb2xpY3ljb3JldXRpbHMubWsK
ID4+ID4gaW5kZXggNTY4ODkyNDJlMy4uM2FkN2U5YTViMyAxMDA2NDQKID4+ID4gLS0tIGEvcGFj
a2FnZS9wb2xpY3ljb3JldXRpbHMvcG9saWN5Y29yZXV0aWxzLm1rCiA+PiA+ICsrKyBiL3BhY2th
Z2UvcG9saWN5Y29yZXV0aWxzL3BvbGljeWNvcmV1dGlscy5tawogPj4gPiBAQCAtMTEsNyArMTEs
NyBAQCBQT0xJQ1lDT1JFVVRJTFNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKID4+ID4gIFBPTElD
WUNPUkVVVElMU19DUEVfSURfVkVORE9SID0gc2VsaW51eHByb2plY3QKID4+IAogPj4gPiAgUE9M
SUNZQ09SRVVUSUxTX0RFUEVOREVOQ0lFUyA9IGxpYnNlbWFuYWdlIGxpYmNhcC1uZyAkKFRBUkdF
VF9OTFNfREVQRU5ERU5DSUVTKQogPj4gPiAtUE9MSUNZQ09SRVVUSUxTX01BS0VfT1BUUyA9IExE
TElCUz0kKFRBUkdFVF9OTFNfTElCUykKID4+ID4gK1BPTElDWUNPUkVVVElMU19NQUtFX09QVFMg
PSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgTERMSUJTPSQoVEFSR0VUX05MU19MSUJTKQogPj4g
CiA+PiA+ICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX1BBTSkseSkKID4+ID4gIFBPTElDWUNP
UkVVVElMU19ERVBFTkRFTkNJRVMgKz0gbGludXgtcGFtCiA+PiA+IEBAIC0yOCwxNCArMjgsNiBA
QCBpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX1BBTSkkKEJSMl9QQUNLQUdFX0FVRElUKSx5eSkK
ID4+ID4gIFBPTElDWUNPUkVVVElMU19NQUtFX09QVFMgKz0gTFNQUF9QUklWPXkKID4+ID4gIGVu
ZGlmCiA+PiAKID4+ID4gLSMgVW5kZWZpbmluZyBfRklMRV9PRkZTRVRfQklUUyBoZXJlIGJlY2F1
c2Ugb2YgYSAiYnVnIiB3aXRoIGdsaWJjIGZ0cy5oCiA+PiA+IC0jIGxhcmdlIGZpbGUgc3VwcG9y
dC4KID4+ID4gLSMgU2VlIGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/
aWQ9NTc0OTkyIGZvciBtb3JlIGluZm9ybWF0aW9uCiA+PiA+IC1QT0xJQ1lDT1JFVVRJTFNfTUFL
RV9PUFRTICs9IFwKID4+ID4gLSAgICAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAogPj4gPiAt
ICAgIENGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAtVV9GSUxFX09GRlNFVF9CSVRTIiBcCiA+PiA+
IC0gICAgQ1BQRkxBR1M9IiQoVEFSR0VUX0NQUEZMQUdTKSAtVV9GSUxFX09GRlNFVF9CSVRTIgog
Pj4gPiAtCiA+PiA+ICBQT0xJQ1lDT1JFVVRJTFNfTUFLRV9ESVJTID0gXAogPj4gPiAgICAgIGhs
bCBsb2FkX3BvbGljeSBuZXdyb2xlIHJ1bl9pbml0IFwKID4+ID4gICAgICBzZWNvbiBzZW1vZHVs
ZSBzZXN0YXR1cyBzZXRmaWxlcyBcCiA+PiA+IEBAIC01OSwxNCArNTEsOSBAQCBlbmRlZgogPj4g
CiA+PiA+ICBIT1NUX1BPTElDWUNPUkVVVElMU19ERVBFTkRFTkNJRVMgPSBob3N0LWxpYnNlbWFu
YWdlCiA+PiAKID4+ID4gLSMgVW5kZWZpbmluZyBfRklMRV9PRkZTRVRfQklUUyBoZXJlIGJlY2F1
c2Ugb2YgYSAiYnVnIiB3aXRoIGdsaWJjIGZ0cy5oCiA+PiA+IC0jIGxhcmdlIGZpbGUgc3VwcG9y
dC4KID4+ID4gLSMgU2VlIGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/
aWQ9NTc0OTkyIGZvciBtb3JlIGluZm9ybWF0aW9uCiA+PiA+IC0jIFdlIGFsc28gbmVlZCB0byBw
YXNzIFBSRUZJWCBiZWNhdXNlIGl0IGRlZmF1bHRzIHRvICQoREVTVERJUikvdXNyCiA+PiA+ICsj
IFdlIG5lZWQgdG8gcGFzcyBQUkVGSVggYmVjYXVzZSBpdCBkZWZhdWx0cyB0byAkKERFU1RESVIp
L3VzcgogPj4gCiA+PiBIbW0sIHRoaXMgZG9lc24ndCBhcHBseSBiZWNhdXNlIHdlIGRvbid0IGhh
dmUgdGhhdCAnV2UgYWxzbyBuZWVkIHRvIHBhc3MKID4+IFBSRUZJWCBiZWNhdXNlIGl0IGRlZmF1
bHRzIHRvICQoREVTVERJUikvdXNyJyBsaW5lIC0gV2hlcmUgZG9lcyB0aGF0CiA+PiBjb21lIGZy
b20/CgogPiBTdHJhbmdlLCB0aGlzIGxpbmUgaXMgaW4gbWFzdGVyOgogPiBodHRwczovL2dpdC5i
dWlsZHJvb3QubmV0L2J1aWxkcm9vdC90cmVlL3BhY2thZ2UvcG9saWN5Y29yZXV0aWxzL3BvbGlj
eWNvcmV1dGlscy5tayNuNjUKClNvcnJ5LCBJIG1pc3JlYWQgdGhlIGRpZmYsIHRoZSBpc3N1ZSBp
cyBpbiB0aGUgY29udGV4dCBsaW5lIGJlbG93OgoKIFBPTElDWUNPUkVVVElMU19NQUtFX0RJUlMg
PSBcCi0gICAgICAgbG9hZF9wb2xpY3kgbmV3cm9sZSBydW5faW5pdCBcCisgICAgICAgaGxsIGxv
YWRfcG9saWN5IG5ld3JvbGUgcnVuX2luaXQgXAogICAgICAgIHNlY29uIHNlbW9kdWxlIHNlc3Rh
dHVzIHNldGZpbGVzIFwKCkNvbW1pdHRlZCB3aXRoIHRoYXQgZml4ZWQsIHRoYW5rcy4KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
