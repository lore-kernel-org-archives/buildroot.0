Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB824C25B78
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 07:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7564F400E4;
	Tue, 21 May 2024 07:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5klm1EAocYXv; Tue, 21 May 2024 07:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D6FC405BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D6FC405BC;
	Tue, 21 May 2024 07:01:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93C841C5016
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 07:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E993400E4
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 07:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Yy33ph0jvjM for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 07:01:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D2D3405BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D2D3405BC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D2D3405BC
 for <buildroot@buildroot.org>; Tue, 21 May 2024 07:01:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D590A40008
 for <buildroot@buildroot.org>; Tue, 21 May 2024 07:01:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s9JUq-008wpj-19
 for buildroot@buildroot.org; Tue, 21 May 2024 09:01:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240521064045.2126436-1-peter@korsgaard.com>
Date: Tue, 21 May 2024 09:01:16 +0200
In-Reply-To: <20240521064045.2126436-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 21 May 2024 08:40:44 +0200")
Message-ID: <87r0dvodhf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] configs/beagleboneai_defconfig: bump
 Linux to 5.10.217 to fix gcc 13.x build
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

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IFRoZSA1LjEwLjc5IGtlcm5lbCBmYWlscyB0byBidWlsZCB3aXRoIEdDQyAxMy54
OgoKVXBzLCBmb3Jnb3QgYToKCkZpeGVzOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9qb2JzLzY4NjU1OTY5NDYKCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxj
b21tYW5kLWxpbmU+OgogPiBkcml2ZXJzL2F0YS9saWJhaGNpLmM6IEluIGZ1bmN0aW9uIOKAmGFo
Y2lfbGVkX3N0b3Jl4oCZOgogPiAuLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjMx
NTo0NTogZXJyb3I6IGNhbGwgdG8KID4g4oCYX19jb21waWxldGltZV9hc3NlcnRfMzIx4oCZIGRl
Y2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBCVUlMRF9CVUdfT04KID4gZmFpbGVkOiBzaXpl
b2YoX3MpID4gc2l6ZW9mKGxvbmcpCiA+ICAgMzE1IHwgICAgICAgICBfY29tcGlsZXRpbWVfYXNz
ZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQog
PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgog
PiAuLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjI5NjoyNTogbm90ZTogaW4gZGVm
aW5pdGlvbiBvZiBtYWNybyDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQogPiAgIDI5NiB8ICAg
ICAgICAgICAgICAgICAgICAgICAgIHByZWZpeCAjIyBzdWZmaXgoKTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4K
ID4gLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozMTU6OTogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvIOKAmF9jb21waWxldGltZV9hc3NlcnTigJkKID4gICAzMTUgfCAgICAg
ICAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNz
ZXJ0XywgX19DT1VOVEVSX18pCiA+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
CiA+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOTozNzogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIOKAmGNvbXBpbGV0aW1lX2Fzc2VydOKAmQogPiAgICAzOSB8ICNkZWZpbmUgQlVJ
TERfQlVHX09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCghKGNvbmQpLCBtc2cp
CiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+CiA+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDo1MDo5OiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJTERfQlVHX09OX01TR+KAmQogPiAgICA1MCB8ICAgICAg
ICAgQlVJTERfQlVHX09OX01TRyhjb25kaXRpb24sICJCVUlMRF9CVUdfT04gZmFpbGVkOiAiICNj
b25kaXRpb24pCiA+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+CiA+IC4vaW5jbHVk
ZS9saW51eC9ub3NwZWMuaDo1ODo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJ
TERfQlVHX09O4oCZCiA+ICAgIDU4IHwgICAgICAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKF9zKSA+
IHNpemVvZihsb25nKSk7ICAgICAgICAgICAgICAgICAgICAgICAgXAogPiAgICAgICB8ICAgICAg
ICAgXn5+fn5+fn5+fn5+CiA+IGRyaXZlcnMvYXRhL2xpYmFoY2kuYzoxMTM3OjIzOiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYYXJyYXlfaW5kZXhfbm9zcGVj4oCZCiA+ICAxMTM3IHwg
ICAgICAgICAgICAgICAgIHBtcCA9IGFycmF5X2luZGV4X25vc3BlYyhwbXAsIEVNX01BWF9TTE9U
Uyk7CiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgoK
ID4gVGhpcyBpcyBmaXhlZCB1cHN0cmVhbSBieSBjb21taXQgZjA3Nzg4MDc5ZjUxNWNhIChhdGE6
IGFoY2k6IGZpeCBlbnVtCiA+IGNvbnN0YW50cyBmb3IgZ2NjLTEzKSwgd2hpY2ggaGFzIGJlZW4g
YmFja3BvcnRlZCB0byA1LjEwLnggYXMgb2YgNS4xMC4xODQsCiA+IHNvIGJ1bXAgdG8gdjUuMTAu
MjE3IHRvIGZpeCB0aGUgYnVpbGQuCgogPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+CiA+IC0tLQogPiAgY29uZmlncy9iZWFnbGVib25lYWlfZGVm
Y29uZmlnIHwgMiArLQogPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgogPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9iZWFnbGVib25lYWlfZGVmY29uZmlnIGIv
Y29uZmlncy9iZWFnbGVib25lYWlfZGVmY29uZmlnCiA+IGluZGV4IDU4NmE3NTMxN2UuLjEzNzNi
YTY2MmUgMTAwNjQ0CiA+IC0tLSBhL2NvbmZpZ3MvYmVhZ2xlYm9uZWFpX2RlZmNvbmZpZwogPiAr
KysgYi9jb25maWdzL2JlYWdsZWJvbmVhaV9kZWZjb25maWcKID4gQEAgLTgsNyArOCw3IEBAIEJS
Ml9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIK
ID4gIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvYmVhZ2xlYm9uZWFpL2dl
bmltYWdlLmNmZyIKID4gIEJSMl9MSU5VWF9LRVJORUw9eQogPiAgQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTj15CiA+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSI1LjEwLjc5IgogPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4x
MC4yMTciCiA+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ib21hcDJwbHVzIgogPiAgQlIy
X0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CiA+ICBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9E
VFNfTkFNRT0iYW01NzI5LWJlYWdsZWJvbmVhaSIKID4gLS0gCgogPiAyLjM5LjIKCgotLSAKQnll
LCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
