Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DC4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 09:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C996C41086;
	Tue, 19 Apr 2022 09:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yum5W6BKHLu7; Tue, 19 Apr 2022 09:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8AFA41078;
	Tue, 19 Apr 2022 09:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7AD81BF299
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E397B41078
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHB53M7HRjkb for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 09:10:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05A29404B9
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:10:09 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 e15-20020a9d63cf000000b006054e65aaecso2925180otl.0
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MUdRSIpNv83xzyylgyGyr99yVSCCBdBCh5WXwC7lgg4=;
 b=hpDPgbf8p1YdP5KKbsq7J07T+XXJKcGIv/ZFf/TFSktdtWuIFZB2eT7dyEF7INSp+6
 Tcp7zA2gwJbRwZt6UKPVqNjNmyWE77xsIjamNMelauuM72+3jysX9w6Kdwq4Ad/SKIy5
 +WvrF2prIgZCBgFeZGZ38TcDEBTeezvkHVHSX+zrxLtf+qtOSdbZq6XFADH8kyeXSCGL
 KfoWrkJsjd2pDY8Oqr+ZuHpsyFjlRbsVyvd0upvmHKgc1H+hyYQgR2ZSszFLg66rMPlT
 A4hqXaR9Ax1l0wk/GQxCU2NNpCLPq7qL4waHTafw9oCKp3SwQFhs91AupIW/jnm+RvAR
 1RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MUdRSIpNv83xzyylgyGyr99yVSCCBdBCh5WXwC7lgg4=;
 b=gUojbVAzkDr1D5vaxGbNqVde8+VV+nLW+z6NtA/fn28/8n3DBFZ/B4RucVW8lTEubO
 V5psc8gS2jYw0Wrywg/OAWsFOKRoUAQKBpINmLa63SVR+018LV5VGUInNNbc07Uem9Bq
 ky4IGpTWWH39bvnjPiQAC4iC/Pu6d18pGULd6s77495krD17vlCHMlIASYruiyMRYr+o
 pSi8vWl7PLFO5rSJx2MVUOGOLpmwBbhMtLONgwHYJZWiecek6fjMu3De681Y0GBAMwEi
 i0aeB8dEV0+Y/sQbeTAlHZgs2zRxyCzIfMj4pVYYRPZj1O73nRxplOFYB+tCtDgoC7fW
 UrLg==
X-Gm-Message-State: AOAM531myFHqr4/vVdiKjoPPTFGg7Bk705Oy90+l/EYh27fNieDFHBKn
 Uh1UU6hTp4U4wzEs9X4Yc3p1h9PGtknUzYQpOfVxqAIGK9Y=
X-Google-Smtp-Source: ABdhPJwyn8Q/io/n/CFqgW8rzmB5b3Eis51fZmNI+1BLet8oQC8f6ymQcolzuunwibX/HvozNH4Jes3Z7muerrDogRY=
X-Received: by 2002:a9d:2084:0:b0:5cd:9dd9:ed87 with SMTP id
 x4-20020a9d2084000000b005cd9dd9ed87mr5453167ota.237.1650359409004; Tue, 19
 Apr 2022 02:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
 <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
 <87y20aeb04.fsf@dell.be.48ers.dk>
 <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
 <8d53da79-2a90-8649-6f46-22b33b7bdbe5@microchip.com>
 <87bkx5crop.fsf@dell.be.48ers.dk>
 <d864ae21-b68f-b30b-ce07-cd66b473e4f9@microchip.com>
 <CAPi7W82XAg4jMw6z5LR=rg-HoZGBbfDC13XbpXtr0hppW92QEw@mail.gmail.com>
 <CAPi7W83uC=WLeMufRy9OC2G2m61BtUu1v_KX-nuiUBRFTwd8sQ@mail.gmail.com>
 <f10430c3-6805-eadd-7161-82db2309c198@microchip.com>
In-Reply-To: <f10430c3-6805-eadd-7161-82db2309c198@microchip.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Apr 2022 11:08:06 +0200
Message-ID: <CAPi7W81tjVJ66QKgGVWHqytr-rakz4b6dK2TKVR7dc=tPiaxQA@mail.gmail.com>
To: Eugen.Hristev@microchip.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRXVnZW4sCgpMZSBtYXIuIDE5IGF2ci4gMjAyMiDDoCAwNzoyMSwgPEV1Z2VuLkhyaXN0
ZXZAbWljcm9jaGlwLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gNC8xNC8yMiA3OjQ0IFBNLCBGYWJy
aWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gTGUgamV1LiAxNCBhdnIuIDIwMjIgw6AgMTE6NTksIEZh
YnJpY2UgRm9udGFpbmUKPiA+IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gYSDDqWNyaXQg
Ogo+ID4+Cj4gPj4gSGVsbG8gRXVnZW4sCj4gPj4KPiA+PiBMZSBqZXUuIDE0IGF2ci4gMjAyMiDD
oCAxMToxMCwgPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gYSDDqWNyaXQgOgo+ID4+Pgo+
ID4+PiBPbiA0LzEzLzIyIDExOjI5IEFNLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4gPj4+Pj4+
Pj4+ICAgICA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tPiB3cml0ZXM6Cj4gPj4+Pgo+ID4+
Pj4gICAgPiBPbiA0LzEyLzIyIDk6MTcgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gPj4+
PiAgICA+PiBMZSBtYXIuIDEyIGF2ci4gMjAyMiDDoCAxNDozNCwgUGV0ZXIgS29yc2dhYXJkIDxw
ZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4gPj4+PiAgICA+Pj4KPiA+Pj4+ICAgID4+
Pj4+Pj4+IDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IHdyaXRlczoKPiA+Pj4+ICAgID4+
Pgo+ID4+Pj4gICAgPj4+IEhpLAo+ID4+Pj4gICAgPj4+Cj4gPj4+PiAgICA+Pj4gPj4gWWVhaC4g
RXVnZW4sIGlzIHRoZXJlIGFueSBzcGVjaWZpYyByZWFzb24gd2h5IHlvdSB1c2UgdGhlIGRoY3Ag
cGFja2FnZQo+ID4+Pj4gICAgPj4+ID4+IG92ZXIgdGhlIG90aGVyIERIQ1AgY2xpZW50cyB3ZSBw
cm92aWRlPwo+ID4+Pj4gICAgPj4+Cj4gPj4+PiAgICA+Pj4gPiBIaXN0b3JpY2FsIHJlYXNvbnMs
IGFuZCB0aGUgZmFjdCB0aGF0IHBlb3BsZSBoYXZlIHdvcmtpbmcgY29uZmlndXJhdGlvbnMKPiA+
Pj4+ICAgID4+PiA+IHVzaW5nIHRoaXMgcGFja2FnZS4uLiBJIHdhcyB1bmF3YXJlIHRoYXQgaXQg
d2FzIGR1ZSB0byBiZSByZW1vdmVkLgo+ID4+Pj4gICAgPj4+ID4gV2Ugd2lsbCB0cnkgdG8gc3dp
dGNoIHRvIGEgZGlmZmVyZW50IHBhY2thZ2UgaW4gdGhlIGZ1dHVyZS4gVGhhbmtzIGZvcgo+ID4+
Pj4gICAgPj4+ID4gbGV0dGluZyBtZSBrbm93Lgo+ID4+Pj4gICAgPj4+ID4gSG93ZXZlciwgaWYg
dGhlIHBhY2thZ2UgaXMgc3RpbGwgaW4gdGhpcyBidWlsZHJvb3QgcmVsZWFzZSwgaXQgaGFzIHRv
Cj4gPj4+PiAgICA+Pj4gPiB3b3JrIHJpZ2h0ID8KPiA+Pj4+ICAgID4+Pgo+ID4+Pj4gICAgPj4+
IFllcywgdGhhdCBpcyB0aGUgaWRlYS4gSWYgaXQgaXMgZGVhZCB1cHN0cmVhbSBhbmQgaGFyZCB0
byBmaXggdGhlbiB0aGF0Cj4gPj4+PiAgICA+Pj4gbmF0dXJhbGx5IG1ha2VzIGl0IGhhcmRlciB0
byBkbywgYnV0IHRoZSBpbnRlbnRpb24gaXMgdG8gZml4IGl0Lgo+ID4+Pj4gICAgPj4KPiA+Pj4+
ICAgID4+IFRoZSBmb2xsb3dpbmcgcGF0Y2ggc2hvdWxkIGZpeCB0aGUgaXNzdWU6Cj4gPj4+PiAg
ICA+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNo
LzIwMjIwNDEyMTgxNjA3LjE0NTE1ODAtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8KPiA+
Pj4+Cj4gPj4+PiAgICA+IEhpLAo+ID4+Pj4KPiA+Pj4+ICAgID4geW91ciBwYXRjaCB0b2dldGhl
ciB3aXRoIHRoZSBvdGhlciBvbmUgKAo+ID4+Pj4gICAgPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoL0RVMFAyNTFNQjA3Nzk3Q0FBRTgwQzk4NURD
ODk3NjMzNUUzRTc5QERVMFAyNTFNQjA3NzkuRVVSUDI1MS5QUk9ELk9VVExPT0suQ09NLwo+ID4+
Pj4gICAgPiApLAo+ID4+Pj4KPiA+Pj4+ICAgID4gc29sdmUgdGhlIGJ1aWxkIHByb2JsZW0gZm9y
IHRoaXMgcGFja2FnZS4KPiA+Pj4+Cj4gPj4+PiBUaGV5IGFyZSBub3cgYm90aCBhZGRlZCB0byB0
aGUgMjAyMi4wMi54IGJyYW5jaCwgdGhhbmtzLgo+ID4+Pj4KPiA+Pj4+IC0tCj4gPj4+PiBCeWUs
IFBldGVyIEtvcnNnYWFyZAo+ID4+Pj4KPiA+Pj4KPiA+Pj4gSGVsbG8gYWdhaW4gRmFicmljZSwK
PiA+Pj4KPiA+Pj4gQWZ0ZXIgbWFuYWdpbmcgdG8gc3VjY2Vzc2Z1bGx5IGJ1aWxkIGFsbCBvdXIg
ZGVmY29uZmlncyBub3csIHdoaWxlCj4gPj4+IHRlc3Rpbmcgb24gYW5vdGhlciBib2FyZCAoc2Ft
YTdnNWVrKSwgSSBub3RpY2VkIHRoaXMgbWVzc2FnZSBhdCBib290IGxvZyA6Cj4gPj4+Cj4gPj4+
IFN0YXJ0aW5nIERIQ1Agc2VydmVyOiAvdXNyL3NiaW4vZGhjcGQ6IGVycm9yIHdoaWxlIGxvYWRp
bmcgc2hhcmVkCj4gPj4+IGxpYnJhcmllczogbGliaXJzLnNvLjE2MTogY2Fubm90IG9wZW4gc2hh
cmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUKPiA+Pj4gb3IgZGlyZWN0b3J5Cj4gPj4+Cj4g
Pj4+IERpZ2dpbmcgeWllbGRzIHRoYXQgbGliaXJzIGlzIHBhcnQgb2YgYmluZCBwYWNrYWdlLiBE
byB5b3Uga25vdyB3aHkgdGhpcwo+ID4+PiBoYXBwZW5zIGFuZCB3aGF0IGNvdWxkIGJlIHRoZSBj
YXVzZT8gQ291bGQgbGF0ZXN0IHBhdGNoZXMgYWZmZWN0IHRoZSBkaGNwZCA/Cj4gPj4KPiA+PiBJ
bmRlZWQsIHRoZSBpbnRlcm5hbCBiaW5kIGxpYnJhcmllcyAoaW5jbHVkaW5nIGxpYmlycy5zby4x
NjEpIGFyZQo+ID4+IGNvcnJlY3RseSBpbnN0YWxsZWQgaW4gc3RhZ2luZyBkaXJlY3RvcnkgYnV0
IG5vdCBpbiB0aGUgdGFyZ2V0Cj4gPj4gZGlyZWN0b3J5IGJlY2F1c2UgZGhjcC5tayBpcyBvdmVy
cmlkaW5nIERIQ1BfSU5TVEFMTF9UQVJHRVRfQ01EUy4KPiA+PiBJJ2xsIHNlbmQgYSBwYXRjaCBi
eSB0aGUgZW5kIG9mIHRoZSBkYXkuCj4gPgo+ID4gVGhlIGZvbGxvd2luZyBwYXRjaCBzaG91bGQg
Zml4IHRoZSBpc3N1ZToKPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvcGF0Y2gvMjAyMjA0MTQxNjQxMDkuMTcyNDg3My0xLWZvbnRhaW5lLmZhYnJpY2VA
Z21haWwuY29tLwo+ID4KPgo+IEhlbGxvIEZhYnJpY2UsCj4KPiBUaGUgbGliaXJzIHByb2JsZW0g
aXMgZ29uZSBub3csIHRoYW5rcy4gSG93ZXZlciwgSSBnZXQgYSBuZXcgZXJyb3I6Cj4KPgo+IFN0
YXJ0aW5nIERIQ1Agc2VydmVyOiAvdXNyL3NiaW4vZGhjcGQ6IGVycm9yIHdoaWxlIGxvYWRpbmcg
c2hhcmVkCj4gbGlicmFyaWVzOiBsaWJpc2NjZmcuc28uMTYzOiBjYW5ub3Qgb3BlbiBzaGFyZWQg
b2JqZWN0IGZpbGU6IE5vIHN1Y2gKPiBmaWxlIG9yIGRpcmVjdG9yeQo+Cj4gTG9va3MgbGlrZSB0
aGVyZSBhcmUgc3RpbGwgcHJvYmxlbXMgb24gbXkgc2lkZQoKbGliaXNjY2ZnLnNvLjE2MyBpcyBp
bnN0YWxsZWQgb24gdGFyZ2V0IHJvb3RmcyAoaW4gL3Vzci9saWIpLiBDYW4geW91CmNoZWNrIHRo
YXQgdGhpcyBpcyBhbHNvIHRoZSBjYXNlIG9uIHlvdXIgc2lkZT8KCj4KPiBUaGFua3MsCj4gRXVn
ZW4KPgo+ID4+Cj4gPj4+Cj4gPj4+IFRoYW5rcyAhCj4gPj4+IEV1Z2VuCj4gPj4KPiA+PiBCZXN0
IFJlZ2FyZHMsCj4gPj4KPiA+PiBGYWJyaWNlCj4gPgo+ID4gQmVzdCBSZWdhcmRzLAo+ID4KPiA+
IEZhYnJpY2UKPiA+Cj4KCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
