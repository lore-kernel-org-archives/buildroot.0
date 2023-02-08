Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E2C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 10:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C56640BF7;
	Wed,  8 Feb 2023 10:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C56640BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17vnLg937wM4; Wed,  8 Feb 2023 10:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A6DE40BD2;
	Wed,  8 Feb 2023 10:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A6DE40BD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF1C1BF38B
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA698610CE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA698610CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3Lz9cQLErPz for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 10:52:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF1E1610C4
Received: from neutron.kverse.co.uk (neutron.kverse.co.uk [88.97.48.192])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF1E1610C4
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 10:52:11 +0000 (UTC)
Received: from dvorak.ensemble.orchestrated-technology.com ([172.16.1.69])
 by tallis.ensemble.orchestrated-technology.com with esmtpsa (TLS1.3) tls
 TLS_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <james.kent@orchestrated-technology.com>)
 id 1pPi3d-0000S2-Ox; Wed, 08 Feb 2023 10:52:09 +0000
Message-ID: <8d4f6069-8fd9-e94d-177f-3f4153afb647@orchestrated-technology.com>
Date: Wed, 8 Feb 2023 10:52:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230207171020.20194-1-james.kent@orchestrated-technology.com>
 <20230207215052.GA2817@scaer>
From: James Kent <james.kent@orchestrated-technology.com>
In-Reply-To: <20230207215052.GA2817@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=orchestrated-technology.com; s=dkim20210630; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQCaKurZdLFHWjm0/U1AUB4pXPSrkCHf2gik+QD7E1I=; t=1675853531; x=1676717531; 
 b=WRud9rD1E/u7a60piibIw6/O/WZn10jB9/60Ypv+64q24OKG9ucTkqqp22reLh/up9rEjTP9aoe
 1TI55ON0Ibi3mhF/Hfgs6BpmuOwDZBSBevZGWZnjh2dJ0MKfwCpRk25EjAdHY2nHP31PX+TFTNctN
 Om0qcj5RjtMeDZUIVhIMj1nM0wDouXaQPGmwg9I743fSLjyrlS48feacepnWf6VW56f2874a+aEVW
 /B45it21srfnSIL3I4DUrmQbgjMbQTcwY/hmD5sZlS+WtXYL4TPDHcJ0tAAURAufxzZRuSkUu/YzE
 EYNzf3vsoYrTKzmgXC2niK8HoH2Xu8v7SsTw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orchestrated-technology.com
 header.i=@orchestrated-technology.com header.a=rsa-sha256
 header.s=dkim20210630 header.b=WRud9rD1
Subject: Re: [Buildroot] [PATCH] package/chrony: add default unprivileged
 user option
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCnRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLsKgIFllcyBJJ2xsIHJld29yayB0aGUgY2hh
bmdlIHdpdGggeW91ciBpbnB1dCBhbmQgCnN1Ym1pdCBhIHJldmlzZWQgcGF0Y2guCgpSZWdhcmRz
LApKYW1lcwoKT24gMDcvMDIvMjAyMyAyMTo1MCwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiBKYW1l
cywgQWxsLAo+Cj4gT24gMjAyMy0wMi0wNyAxNzoxMCArMDAwMCwgSmFtZXMgS2VudCBzcGFrZSB0
aHVzbHk6Cj4+IENvbmZpZ3VyYWJsZSBvcHRpb24gdG8gZGVmaW5lIGFuZCBlbmFibGUgYnkgZGVm
YXVsdCBhbiB1bnByaXZpbGVnZWQKPj4gdXNlciB3aGljaCB0aGUgQ2hyb255IGRhZW1vbiB3aWxs
IGFzc3VtZSBvbmNlIGluaXRpYWxpc2VkLiBXaGVyZSBsaWJjYXAKPj4gaXMgbm90IGVuYWJsZWQg
YSBjb21tZW50IGluZGljYXRlcyB0aGUgZGVwZW5kZW5jeSByZXF1aXJlbWVudCB0byBtYWtlCj4+
IHRoZSBvcHRpb24gYXZhaWxhYmxlLgo+Pgo+PiBUaGlzIG9wdGlvbiBzdXBwb3J0cyB0aGUgZ29v
ZCBzZWN1cml0eSBwcmFjdGljZSBvZiBkcm9wcGluZyBlbGV2YXRlZAo+PiBwcml2aWxlZ2VzIGZv
ciBkYWVtb24gcnVudGltZS4KPiBUaGFua3MsIHRoamlzIGlzPW5kZWVkIG1ha2VzIHNlbnNlLiBT
ZWUgYmVsb3cgZm9yIHNvbWUgY29tbWVudHMuLi4KPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBL
ZW50IDxqYW1lcy5rZW50QG9yY2hlc3RyYXRlZC10ZWNobm9sb2d5LmNvbT4KPj4gLS0tCj4+ICAg
cGFja2FnZS9jaHJvbnkvQ29uZmlnLmluIHwgMTAgKysrKysrKysrKwo+PiAgIHBhY2thZ2UvY2hy
b255L2Nocm9ueS5tayB8ICA4ICsrKysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Nocm9ueS9Db25maWcuaW4gYi9w
YWNrYWdlL2Nocm9ueS9Db25maWcuaW4KPj4gaW5kZXggMTU4ZGMyMDUzMC4uOGIwNTNlZDdlMiAx
MDA2NDQKPj4gLS0tIGEvcGFja2FnZS9jaHJvbnkvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2Uv
Y2hyb255L0NvbmZpZy5pbgo+PiBAQCAtMTQsMyArMTQsMTMgQEAgY29uZmlnIEJSMl9QQUNLQUdF
X0NIUk9OWV9ERUJVR19MT0dHSU5HCj4+ICAgCSAgRW5hYmxlIHN1cHBvcnQgZm9yIGRlYnVnIGxv
Z2dpbmcgb3V0cHV0IGZyb20gQ2hyb255IHdoZW4KPj4gICAJICBlbmFibGVkIGF0IHJ1bnRpbWUu
IElmIGRpc2FibGVkLCBjb2RlIGZvciBkZWJ1ZyBsb2dnaW5nIHdpbGwKPj4gICAJICBub3QgYmUg
Y29tcGlsZWQgaW4uCj4+ICsKPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9DSFJPTllfVVNFUgo+PiAr
CWJvb2wgImNocm9ueSBkZWZhdWx0IHVucHJpdmlsZWdlZCB1c2VyIgo+PiArCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfQ0hST05ZICYmIEJSMl9QQUNLQUdFX0xJQkNBUAo+IEZpcnN0LCB3ZSBub3cg
dHJ5IHRvIGVuY2xvc2UgcGFja2FnZSBzdWItb3B0aW9ucyBpbiBhbiBpZi1lbmRpZiBibG9jaywK
PiByYXRoZXIgdGhhbiBoYXZlIGVhY2ggb3B0aW9uIGRlcGVuZCBvbiB0aGUgcGFja2FnZS4gSS5l
LjoKPgo+ICAgICAgY29uZmlnIEJSMl9QQUNLQUdFX0NIUk9OWQo+ICAgICAgICAgIGJvb2wgImNo
cm9ueSIKPgo+ICAgICAgaWYgQlIyX1BBQ0tBR0VfQ0hST05ZCj4KPiAgICAgIGNvbmZpZyBCUjJf
UEFDS0FHRV9DSFJPTllfRk9PCj4gICAgICAgICAgYm9vbCAiZm9vIgo+Cj4gICAgICBjb25maWcg
QlIyX1BBQ0tBR0VfQ0hST05ZX0JBUgo+ICAgICAgICAgIGJvb2wgImJhciIKPgo+ICAgICAgZW5k
aWYKPgo+IFllcywgdGhlIGV4aXN0aW5nIG9wdGlvbiBkb2Vzbm90IGZvbGxvdyB0aGF0IGNvZGlu
ZyBzdHlsZSwgc28ganVzdCBmaXgKPiBpdCB1cCB3aGlsZSBhdCBpdC4KPgo+IFNlY29uZCwgY2hy
b255IGFuZCBsaWJjYXAgYm90aCBuZWVkIGFuIE1NVSwgc28ganV0IHNlbGVjdCBsaWJjYXAgd2hl
bgo+IEJSMl9QQUNLQUdFX0NIUk9OWV9VU0VSIGlzIGVuYWJsZWQuCj4KPj4gKwloZWxwCj4+ICsJ
ICBEZWZpbmUgYW5kIGVuYWJsZSBkZWZhdWx0IHVucHJpdmlsZWdlZCB1c2VyIGZvciB0aGUgQ2hy
b255Cj4+ICsJICBkYWVtb24gdG8gcnVuIGFzLgo+PiArCj4+ICtjb21tZW50ICJjaHJvbnkgZGVm
YXVsdCB1bnByaXZpbGVnZWQgdXNlciByZXF1aXJlcyBsaWJjYXAiCj4+ICsJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9DSFJPTlkgJiYgIUJSMl9QQUNLQUdFX0xJQkNBUAo+IEFuZCB0aHVzLCB0aGF0
IGNvbW1lbnQgaXMgbm8gbG9uZ2VyIG5lZWRlZC4KPgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9j
aHJvbnkvY2hyb255Lm1rIGIvcGFja2FnZS9jaHJvbnkvY2hyb255Lm1rCj4+IGluZGV4IDM3OWU5
NWE3NzguLjE2ZjhmMDgyYTMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvY2hyb255L2Nocm9ueS5t
awo+PiArKysgYi9wYWNrYWdlL2Nocm9ueS9jaHJvbnkubWsKPj4gQEAgLTIxLDYgKzIxLDE0IEBA
IENIUk9OWV9DT05GX09QVFMgPSBcCj4+ICAgCj4+ICAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJD
QVApLHkpCj4+ICAgQ0hST05ZX0RFUEVOREVOQ0lFUyArPSBsaWJjYXAKPj4gKwo+PiAraWZlcSAo
JChCUjJfUEFDS0FHRV9DSFJPTllfVVNFUikseSkKPj4gK0NIUk9OWV9DT05GX09QVFMgKz0gLS13
aXRoLXVzZXI9Y2hyb255Cj4+ICtkZWZpbmUgQ0hST05ZX1VTRVJTCj4+ICsJY2hyb255IC0xIGNo
cm9ueSAtMSAqIC9ydW4vY2hyb255IC0gLSBUaW1lIGRhZW1vbgo+PiArZW5kZWYKPj4gK2VuZGlm
Cj4gVGhpcyBwYXJ0IGlzIGNvcnJlY3QuCj4KPiBDYW4geW91IGZpeCBhbmQgcmVzcGluLCBwbGVh
c2U/Cj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPj4gICBlbHNlCj4+ICAgQ0hST05Z
X0NPTkZfT1BUUyArPSAtLXdpdGhvdXQtbGliY2FwCj4+ICAgZW5kaWYKPj4gLS0gCj4+IDIuMzUu
Mwo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
