Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C511C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 10:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E6F1400A6;
	Tue, 19 Mar 2024 10:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0oG8Cb5VDF6; Tue, 19 Mar 2024 10:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E96740B0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E96740B0F;
	Tue, 19 Mar 2024 10:30:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75C811BF2B6
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 10:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 624CD60613
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 10:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPQxPmV_HXLf for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 10:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2F5B605DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F5B605DA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2F5B605DA
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 10:30:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E3552000C;
 Tue, 19 Mar 2024 10:30:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmWjp-0037pU-1T;
 Tue, 19 Mar 2024 11:30:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
References: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
 <20240319070554.1323606-3-javad.rahimipetroudi@mind.be>
 <0f200aec-5ba4-4338-a8bd-f5b8a8429a32@mind.be>
 <CAP_ewpNv3=yRKwOfpBVHAy5mY2uDf-dxEErXrzVm=Ff7xNwCyg@mail.gmail.com>
Date: Tue, 19 Mar 2024 11:30:33 +0100
In-Reply-To: <CAP_ewpNv3=yRKwOfpBVHAy5mY2uDf-dxEErXrzVm=Ff7xNwCyg@mail.gmail.com>
 (Javad Rahimipetroudi's message of "Tue, 19 Mar 2024 11:28:08 +0100")
Message-ID: <87le6ecy46.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 3/3] configs/avenger96: bump ATF version
 to v2.8
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkphdmFkIiA9PSBKYXZhZCBSYWhpbWlwZXRyb3VkaSA8amF2YWQucmFoaW1pcGV0cm91
ZGlAZXNzZW5zaXVtLmNvbT4gd3JpdGVzOgoKID4gSGkgQXJub3V0LAogPiBPbiBUdWUsIE1hciAx
OSwgMjAyNCBhdCA5OjQ34oCvQU0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJl
PiB3cm90ZToKID4+IAogPj4gCiA+PiAKID4+IE9uIDE5LzAzLzIwMjQgMDg6MDUsIEphdmFkIFJh
aGltaXBldHJvdWRpIHdyb3RlOgogPj4gPiBUaGlzIHBhdGNoIHVwZ3JhZGVzIHRoZSBBVEYgdmVy
c2lvbiB0byB2Mi44LiBQbGVhc2Ugbm90ZSB0aGF0CiA+PiA+IGR1ZSB0byBEVFMgY2hhZ2VzIGZy
b20gY29tbWl0IDUxZTIyMzA1OGZlNzBiMzExNTQyMTc4ZjE4NjU1MTQ3NDVmYTc4NzQKID4+ID4g
KCJmZWF0KHN0bTMybXAxNS1mZHRzKTogYWRkIEF2ZW5nZXI5NiBib2FyZCB3aXRoIFNUTTMyTVAx
NTdBIERIQ09SIFNvTSIpCiA+PiA+IFRoZSBBVEYgYWRkaXRpb25hbCBidWlsZCB2YXJpYWJsZSBh
bHNvIG1vZGlmaWVkIHRvIHVzZSB0aGUgbmV3IERUUyBmaWxlLgogPj4gCiA+PiBJIG5vdGljZWQg
dGhhdCB0aGUgb2xkIERUUyBmaWxlIGZkdHMvc3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0cyBzdGls
bCBleGlzdHMsCiA+PiBidXQgSSBzdXBwb3NlIGl0IGRvZXNuJ3QgYWN0dWFsbHkgd29yayBhbnkg
bW9yZSB0aGVuPwogPj4gCiA+IFllcywgd2UgYXJlIHVzaW5nICJzdG0zMm1wMTU3YS1kaGNvci1h
dmVuZ2VyOTYuZHRzIi4gSWYKID4gInN0bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdHMiCiA+IGJlIHVz
ZWQsIHRoZSBib2FyZCB3aWxsIG5vdCBib2FyZCB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cgog
PiBOT1RJQ0U6ICBDUFU6IFNUTTMyTVAxNTdBQUMgUmV2LkIKID4gTk9USUNFOiAgTW9kZWw6IEFy
cm93IEVsZWN0cm9uaWNzIFNUTTMyTVAxNTdBIEF2ZW5nZXI5NiBib2FyZAogPiBFUlJPUjogICBu
dm1lbSBub2RlIGJvYXJkX2lkIG5vdCBmb3VuZAogPiBFUlJPUjogICBQcm9kdWN0X2JlbG93XzJ2
NT0xOgogPiBFUlJPUjogICAgSFNMVkVOIHVwZGF0ZSBpcyBkZXN0cnVjdGl2ZSwKID4gRVJST1I6
ICAgIG5vIHVwZGF0ZSBhcyBWREQgPiAyLjdWCiA+IFBBTklDIGF0IFBDIDogMHgyZmZlZTk1ZAoK
V2hpY2ggc2VlbXMgdG8gbWF0Y2g6Cgpjb21taXQgZGViOGQ3MWM5Mjg1ZWI2MGJjM2QyOGU4YWJj
ZjcyMDhmNzg5ODBhNwpBdXRob3I6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNv
bT4KRGF0ZTogICBTdW4gTm92IDUgMTk6Mzc6MTkgMjAyMyArMDEwMAoKICAgIGNvbmZpZ3MvYXZl
bmdlcjk2X2RlZmNvbmZpZzogZG93bmdyYWRlIHRvIFRGLUEgdjIuNQoKICAgIENvbW1pdCAyN2Jm
MDhlNGFkZGI3OCAoY29uZmlncy9hdmVuZ2VyOTZfZGVmY29uZmlnOiBidW1wIEFURiB2ZXJzaW9u
IHRvIDIuOQogICAgZm9yIGJpbnV0aWxzIDIuMzkrIHN1cHBvcnQpIGJ1bXBlZCBURi1BLCBidXQg
aXQgdW5mb3J0dW5hdGVseSBkb2VzIG5vdCBib290CiAgICBhbmQgaW5zdGVhZCBkaWVzIHdpdGgg
YSBwYW5pYzoKCiAgICBOT1RJQ0U6ICBDUFU6IFNUTTMyTVAxNTdBQUMgUmV2LkIKICAgIE5PVElD
RTogIE1vZGVsOiBBcnJvdyBFbGVjdHJvbmljcyBTVE0zMk1QMTU3QSBBdmVuZ2VyOTYgYm9hcmQK
ICAgIEVSUk9SOiAgIG52bWVtIG5vZGUgYm9hcmRfaWQgbm90IGZvdW5kCiAgICBJTkZPOiAgICBQ
TUlDIHZlcnNpb24gPSAweDEwCiAgICBFUlJPUjogICBQcm9kdWN0X2JlbG93XzJ2NT0xOgogICAg
RVJST1I6ICAgICAgICAgIEhTTFZFTiB1cGRhdGUgaXMgZGVzdHJ1Y3RpdmUsCiAgICBFUlJPUjog
ICAgICAgICAgbm8gdXBkYXRlIGFzIFZERCA+IDIuN1YKICAgIFBBTklDIGF0IFBDIDogMHgyZmZm
MDg2ZgoKICAgIEV4Y2VwdGlvbiBtb2RlPTB4MDAwMDAwMTYgYXQ6IDB4MmZmZjA4NmYKCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
