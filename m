Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46189EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2AB86142C;
	Fri, 14 Jul 2023 10:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2AB86142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drW5pkJxuMGR; Fri, 14 Jul 2023 10:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1144A60B0D;
	Fri, 14 Jul 2023 10:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1144A60B0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 356591BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DF4C8419B
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DF4C8419B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b8vjIQr44F4f for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:30:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7116F84152
Received: from www484.your-server.de (www484.your-server.de [78.47.237.138])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7116F84152
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:30:00 +0000 (UTC)
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www484.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <k.graefe@gateware.de>)
 id 1qKG3h-0005NR-1a; Fri, 14 Jul 2023 12:29:57 +0200
Received: from [176.94.137.12] (helo=[192.168.11.27])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <k.graefe@gateware.de>)
 id 1qKG3g-000Qnh-KF; Fri, 14 Jul 2023 12:29:56 +0200
Message-ID: <09666051-9013-f88c-b7cb-b46abe5dbd43@gateware.de>
Date: Fri, 14 Jul 2023 12:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Danny Wood <danny@rotronics.co.uk>, Peter Korsgaard
 <peter@korsgaard.com>, "May, Torsten" <torsten.may@ebee.de>
References: <BE1P281MB166840C4621F6F53B7B1B3FEEC5FA@BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM>
 <87v8fjpoqi.fsf@48ers.dk>
 <d23d2495-f724-98b8-1f09-23a3914f3510@rotronics.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?Konrad_Gr=c3=a4fe?= <k.graefe@gateware.de>
In-Reply-To: <d23d2495-f724-98b8-1f09-23a3914f3510@rotronics.co.uk>
X-Authenticated-Sender: k.graefe@gateware.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26969/Fri Jul 14 09:28:15 2023)
Subject: Re: [Buildroot] OpenSSL v3.0
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Timo Herbrecher <t.herbrecher@gateware.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2443919046583428223=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2443919046583428223==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PlZt5b1a0CbcjYw5CWftfWAI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PlZt5b1a0CbcjYw5CWftfWAI
Content-Type: multipart/mixed; boundary="------------j20vhHp0XJ4006PdKtdk0Moz";
 protected-headers="v1"
From: =?UTF-8?Q?Konrad_Gr=c3=a4fe?= <k.graefe@gateware.de>
To: Danny Wood <danny@rotronics.co.uk>, Peter Korsgaard
 <peter@korsgaard.com>, "May, Torsten" <torsten.may@ebee.de>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Timo Herbrecher <t.herbrecher@gateware.de>
Message-ID: <09666051-9013-f88c-b7cb-b46abe5dbd43@gateware.de>
Subject: Re: [Buildroot] OpenSSL v3.0
References: <BE1P281MB166840C4621F6F53B7B1B3FEEC5FA@BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM>
 <87v8fjpoqi.fsf@48ers.dk>
 <d23d2495-f724-98b8-1f09-23a3914f3510@rotronics.co.uk>
In-Reply-To: <d23d2495-f724-98b8-1f09-23a3914f3510@rotronics.co.uk>

--------------j20vhHp0XJ4006PdKtdk0Moz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIvMDYvMjMgMTE6MjQsIERhbm55IFdvb2Qgd3JvdGU6DQogPiBPbiAxOS8wNi8yMDIz
IDE0OjI2LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6DQogPj4+Pj4+PiAiTWF5LCIgPT0gTWF5
LCBUb3JzdGVuIDx0b3JzdGVuLm1heUBlYmVlLmRlPiB3cml0ZXM6DQogPj4gICA+IEhpIFBl
dGVyLA0KID4+ICAgPiBhcyBTZXB0ZW1iZXIgaXMgYXBwcm9hY2hpbmcgcXVpY2tseSwgaXMg
dGhlcmUgYW55IHByb2dyZXNzIG9uIA0KdGhhdCB0b3BpYz8NCiA+Pg0KID4+IFVuZm9ydHVu
YXRlbHkgbm90LiBTbyBmYXIgbm8gcGF0Y2hlcyBmb3Igb3BlbnNzbCAzLnggaGF2ZSBiZWVu
DQogPj4gc3VibWl0dGVkLg0KID4+DQogPj4gSWYgeW91IGFyZSB1c2luZyBvcGVuc3NsIHRo
ZW4gbm93IHdvdWxkIGJlIGEgVkVSWSBnb29kIHRpbWUgdG8NCiA+PiBjb250cmlidXRlIGFu
IHVwZGF0ZSB0byB0aGUgMy54IHNlcmllcy4NCiA+Pg0KID4NCiA+IEhpLA0KID4NCiA+IEF0
dGFjaGVkIGlzIGEgcGF0Y2ggSSBoYXZlIG1hZGUgdG8gYnVpbGQgdjMuMC45IG9mIE9wZW5T
U0wgKExUUyB1bnRpbCANCjIwMjYpLg0KID4NCiA+IEV2ZXJ5dGhpbmcgaW4gbXkgYnVpbGQg
dHJlZSBjb21waWxlZCBmaW5lIHdpdGggdGhlIG5ldyB2ZXJzaW9uIGFwYXJ0IA0KZnJvbSBN
YXJpYURCIHdoaWNoIGFsc28gbmVlZGVkIHVwZGF0aW5nLCBhdHRhY2hlZCBpcyBhbiBhZGRp
dGlvbmFsIHBhdGNoIA0Kd2hpY2ggdXBkYXRlcyBNYXJpYURCIHRvIHYxMC4xMS40IChMVFMg
dW50aWwgMjAyNikNCiA+DQogPiBUaGVzZSBib3RoIGFwcGx5IG9uIHRvcCBvZiB0aGUgMjAy
My4wMi4yIGJ1aWxkcm9vdCB0YXIgYmFsbHMuDQogPg0KID4gSSBoYXZlIGJlZW4gcnVubmlu
ZyB0aGVzZSB1cGRhdGVkIHBhY2thZ2VzIGZvciBhIGNvdXBsZSBvZiBkYXlzIGFuZCANCmhh
dmVuJ3QgaGFkIGFueSBpc3N1ZXMgc28gZmFyLg0KID4NCiA+IEtpbmQgcmVnYXJkcywNCiA+
IERhbm55DQoNCkhpIERhbm55LA0KDQp0aGFua3MgZm9yIHBpY2tpbmcgdGhpcyB1cC4gSSB0
cmllZCB5b3VyIHBhdGNoIG9uIG91ciBvd24gc3lzdGVtIGFuZCBpdCANCnNlZW1zIHRvIHdv
cmsgaGVyZSBhcyB3ZWxsLiBJIGRvIGhhdmUgYSBmZXcgY29tbWVudHMgdGhvdWdoOg0KDQog
PiBkaWZmIC0tZ2l0IA0KYS9wYWNrYWdlL2xpYm9wZW5zc2wvMDAwMS1Eb250LXdhc3RlLXRp
bWUtYnVpbGRpbmctbWFucGFnZXMtaWYtd2UtcmUtbm90LWdvaW5nLnBhdGNoIA0KYi9wYWNr
YWdlL2xpYm9wZW5zc2wvMDAwMS1Eb250LXdhc3RlLXRpbWUtYnVpbGRpbmctbWFucGFnZXMt
aWYtd2UtcmUtbm90LWdvaW5nLnBhdGNoDQogPiBpbmRleCA2NTI3YmMyMy4uZWQ0NTkwZGQg
MTAwNjQ0DQogPiAtLS0gDQphL3BhY2thZ2UvbGlib3BlbnNzbC8wMDAxLURvbnQtd2FzdGUt
dGltZS1idWlsZGluZy1tYW5wYWdlcy1pZi13ZS1yZS1ub3QtZ29pbmcucGF0Y2gNCiA+ICsr
KyANCmIvcGFja2FnZS9saWJvcGVuc3NsLzAwMDEtRG9udC13YXN0ZS10aW1lLWJ1aWxkaW5n
LW1hbnBhZ2VzLWlmLXdlLXJlLW5vdC1nb2luZy5wYXRjaA0KDQpuaXQ6IFRoZSBwYXRjaCBz
aG91bGQgaGF2ZSBhIHJlYmFzZSBjb21tZW50IGFuZCB5b3VyIHNpZ24tb2ZmIGluIHRoZSAN
CnRyYWlsZXIgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLCBlLmcuDQogICAgICBbcmViYXNlZCBv
biAzLjAuOV0NCiAgICAgIFNpZ25lZC1vZmYtYnk6IERhbm55IFdvb2QgPGRhbm55QHJvdHJv
bmljcy5jby51az4NCg0KID4gQEAgLTE5LDE0ICsxOSwxNCBAQCBkaWZmIC0tZ2l0IGEvQ29u
ZmlndXJhdGlvbnMvdW5peC1NYWtlZmlsZS50bXBsIA0KYi9Db25maWd1cmF0aW9ucy91bml4
LU1ha2VmaWxlLnRtDQogPiAgaW5kZXggNDBjZjJjMy4uNzc3ZDljYSAxMDA2NDQNCiA+ICAt
LS0gYS9Db25maWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwNCiA+ICArKysgYi9Db25m
aWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwNCg0Kbml0OiBtaXNzaW5nIHRyYWlsZXIg
KHNlZSBhYm92ZSkNCg0KID4gZGlmZiAtLWdpdCANCmEvcGFja2FnZS9saWJvcGVuc3NsLzAw
MDItUmVwcm9kdWNpYmxlLWJ1aWxkLWRvLW5vdC1sZWFrLWNvbXBpbGVyLXBhdGgucGF0Y2gg
DQpiL3BhY2thZ2UvbGlib3BlbnNzbC8wMDAyLVJlcHJvZHVjaWJsZS1idWlsZC1kby1ub3Qt
bGVhay1jb21waWxlci1wYXRoLnBhdGNoDQogPiBpbmRleCA4MjBjMmFkZC4uZWEyNmEzMTAg
MTAwNjQ0DQogPiAtLS0gDQphL3BhY2thZ2UvbGlib3BlbnNzbC8wMDAyLVJlcHJvZHVjaWJs
ZS1idWlsZC1kby1ub3QtbGVhay1jb21waWxlci1wYXRoLnBhdGNoDQogPiArKysgDQpiL3Bh
Y2thZ2UvbGlib3BlbnNzbC8wMDAyLVJlcHJvZHVjaWJsZS1idWlsZC1kby1ub3QtbGVhay1j
b21waWxlci1wYXRoLnBhdGNoDQogPiBAQCAtMTUsMTUgKzE1LDE1IEBAIGRpZmYgLS1naXQg
YS9jcnlwdG8vYnVpbGQuaW5mbyBiL2NyeXB0by9idWlsZC5pbmZvDQoNCm5pdDogbWlzc2lu
ZyB0cmFpbGVyIChzZWUgYWJvdmUpDQoNCiA+IGRpZmYgLS1naXQgDQphL3BhY2thZ2UvbGli
b3BlbnNzbC8wMDAzLUludHJvZHVjZS10aGUtT1BFTlNTTF9OT19NQURWSVNFLXRvLWRpc2Fi
bGUtY2FsbC10by0ucGF0Y2ggDQpiL3BhY2thZ2UvbGlib3BlbnNzbC8wMDAzLUludHJvZHVj
ZS10aGUtT1BFTlNTTF9OT19NQURWSVNFLXRvLWRpc2FibGUtY2FsbC10by0ucGF0Y2gNCiA+
IGluZGV4IGVmNDBiMDM1Li40MjVhZGVhNSAxMDA2NDQNCiA+IC0tLSANCmEvcGFja2FnZS9s
aWJvcGVuc3NsLzAwMDMtSW50cm9kdWNlLXRoZS1PUEVOU1NMX05PX01BRFZJU0UtdG8tZGlz
YWJsZS1jYWxsLXRvLS5wYXRjaA0KID4gKysrIA0KYi9wYWNrYWdlL2xpYm9wZW5zc2wvMDAw
My1JbnRyb2R1Y2UtdGhlLU9QRU5TU0xfTk9fTUFEVklTRS10by1kaXNhYmxlLWNhbGwtdG8t
LnBhdGNoDQoNCm5pdDogbWlzc2luZyB0cmFpbGVyIChzZWUgYWJvdmUpDQoNCiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5oYXNoIA0KYi9wYWNrYWdl
L2xpYm9wZW5zc2wvbGlib3BlbnNzbC5oYXNoDQogPiBpbmRleCA3MDg5MjZkZS4uNjgxZTU0
MjkgMTAwNjQ0DQogPiAtLS0gYS9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5oYXNo
DQogPiArKysgYi9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5oYXNoDQogPiBAQCAt
MSw1ICsxLDUgQEANCiA+ICAjIEZyb20gaHR0cHM6Ly93d3cub3BlbnNzbC5vcmcvc291cmNl
L29wZW5zc2wtMS4xLjF1LnRhci5nei5zaGEyNTYNCiA+IC1zaGEyNTYgDQplMmY4ZDg0YjUy
M2VlY2QwNmM3YmU3NjI2ODMwMzcwMzAwZmJjYzE1Mzg2YmY1MTQyZDcyNzU4ZjY5NjNlYmM2
IA0Kb3BlbnNzbC0xLjEuMXUudGFyLmd6DQogPiArc2hhMjU2IA0KZWIxYWIwNDc4MTQ3NDM2
MGY3N2MzMThhYjg5ZDhjNWEwM2FiYzM4ZTYzZDY1YTYwM2NhYmJmMWIwMGExZGM5MCANCm9w
ZW5zc2wtMy4wLjkudGFyLmd6DQogPg0KID4gICMgTGljZW5zZSBmaWxlcw0KID4gIHNoYTI1
NiANCmMzMjkxM2IzMzI1MmU3MTE5MGFmMjA2NmYwODExNWM2OWJjOWZkZGFkZjNiZjI5Mjk2
ZTIwYzgzNTM4OTg0MWMgIExJQ0VOU0UNCiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm9w
ZW5zc2wvbGlib3BlbnNzbC5tayANCmIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wu
bWsNCg0KVGhlIGxpY2Vuc2UgaGFzIGJlZW4gY2hhbmdlZCB0byBBcGFjaGUtMi4wIGFuZCB0
aGUgTElDRU5TRSBmaWxlIGdvdCANCnJlbmFtZWQgdG8gTElDRU5TRS50eHQuIFlvdSBjYW4g
Y2hlY2sgdGhhdCBldmVyeXRoaW5nIGlzIGluIHBsYWNlIHdpdGggDQoibWFrZSBsZWdhbC1p
bmZvIi4NCg0KID4gaW5kZXggMTc4OTc5ZjQuLjc0NmM2OTE2IDEwMDY0NA0KID4gLS0tIGEv
cGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsNCiA+ICsrKyBiL3BhY2thZ2UvbGli
b3BlbnNzbC9saWJvcGVuc3NsLm1rDQogPiBAQCAtNCw3ICs0LDcgQEANCiA+ICAjDQogPiAN
CiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQogPg0KID4gLUxJQk9QRU5TU0xfVkVSU0lP
TiA9IDEuMS4xdQ0KID4gK0xJQk9QRU5TU0xfVkVSU0lPTiA9IDMuMC45DQogPiAgTElCT1BF
TlNTTF9TSVRFID0gaHR0cHM6Ly93d3cub3BlbnNzbC5vcmcvc291cmNlDQogPiAgTElCT1BF
TlNTTF9TT1VSQ0UgPSBvcGVuc3NsLSQoTElCT1BFTlNTTF9WRVJTSU9OKS50YXIuZ3oNCiA+
ICBMSUJPUEVOU1NMX0xJQ0VOU0UgPSBPcGVuU1NMIG9yIFNTTGVheQ0KID4gIExJQk9QRU5T
U0xfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UNCg0KVXBkYXRlIExJQk9QRU5TU0xfTElDRU5T
RSBhbmQgTElCT1BFTlNTTF9MSUNFTlNFX0ZJTEVTLg0KDQpSZWdhcmRzLA0KS29ucmFkIEdy
w6RmZQ0KDQpQUzogU29ycnkgZm9yIHJlcG9zdGluZy4gSSBkaWQgbm90IGtub3cgSSBuZWVk
IHRvIHN1YnNjcmliZSB0byB0aGUgbGlzdCANCmluIG9yZGVyIHRvIHBvc3QuDQo=

--------------j20vhHp0XJ4006PdKtdk0Moz--

--------------PlZt5b1a0CbcjYw5CWftfWAI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEUA99m0xJ9cFn0k9bgJOZiyvdweQFAmSxI6MFAwAAAAAACgkQgJOZiyvdweT6
wQ/+KGeW1Otfwdk4ZoaYK5WKAy4wWY9uPvfy7k6DS+K+B431YIDrFE4rtSsvP9cgIONvqjtd9ELG
Wfi/bksRr7TPPhsado0L98gMnDkGszWlkyN0Z6AsfTUO8JXgLTz+35Cpnd47L43UWIFZzseezxRs
yfVxCY4O3s0yQkxGyJMRKc0EyL8QwrCyvmPwhG2Ud4Mmz+Zg2tMYOJjGMBY674ZmrWYE5PNDI3AD
RuytZ78tTFzh99pvWJXqsipeyZPMuqguENAU06z+AAdbIx1jt/G8fEtM47CEZ9kQ9JGVwEvgWhPO
6YVI/RQMs9zBUv1zZhKwKa+1WU3vhJ80r+rkRarCyBFa1PWaVbN2D4XN9rdt9JC87mblbBxiSHA+
hS+8VzOwxfvXJZI04onEoQdsCg9bnZTMSbs2MjgDdYciDF5ldjGojcTUxJnhzO15TR0HPiP1bFzy
GwPVb4hInKIPhsNXM8RcxxtZiKnNrczaiMkrb04pRuHbPXCVjfDrAU41RNcVtHwaZGm5dFvn6Spg
8wNbMzczfXUhzXHkgYAouNktjP8Bzwv8NLz9rYGwtmIdino/tTAc2FFKt1qBx89KsxAf4GutW0Rq
GMsYf2zC8+kHqeAU4lu9Vuehhf/v71IRv//EJWXTabDX870BW11NweiGfuPhM2dh5r/63udaAulV
JaY=
=GR7K
-----END PGP SIGNATURE-----

--------------PlZt5b1a0CbcjYw5CWftfWAI--

--===============2443919046583428223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2443919046583428223==--
