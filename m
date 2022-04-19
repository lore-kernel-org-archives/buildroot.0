Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15F9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 16:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FAE83054;
	Tue, 19 Apr 2022 16:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlVLPCbocaBg; Tue, 19 Apr 2022 16:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 517FB82890;
	Tue, 19 Apr 2022 16:14:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6EE1BF873
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 16:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AFE6418B2
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 16:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-tZqcXPMJcg for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 16:14:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1781A418AD
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 16:14:26 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 c11-20020a9d684b000000b00603307cef05so8711394oto.3
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EhYD8rjuXCIvmMDZ8q98Iowx35R9VvpRkyJt/tszViU=;
 b=AsK2JPixEUF6KrGkdbIPmkEALi/wq7HHPjHZWu2jo6rKXPicQ0IQa8LD8cacvHilUV
 ppOhndYzH9NCKkfHQzOV6Wm/K5HaKFepuB0lvARjnKWg5EMhOcZJwkxrjeKbmK/XYXId
 p3Yj3XHkxTurJfpPbJmUKDFgjExD6mgHQtQY1MQn7TRP+UUhngTLcYY6jnOl0zhzHTpu
 s//L3ZW13mJNcVkY7PnplCpamTxwvjnrNWLWhXiNX7PnzND+YzwMKl4EyXL1ahKPJfOw
 xti/LLijCv/PHw+WOaSiHmQTWz7VkwfxuQK+HSPRMX64mZb1tpRQJwr13jkA65digOv3
 JXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EhYD8rjuXCIvmMDZ8q98Iowx35R9VvpRkyJt/tszViU=;
 b=79yDGSAMNIu0x7s9v52G0/TBAfr72QUSCdN08W2Q4qAC7bs4N6Jw2HBtMLB4iOCpUJ
 9q6Ghkw9Or+jiiTV9fyzdsBQ6K5tv0Iqaf2X0Em3l0VVoQhhvdFz1aujw0kky5YaR2Eu
 g5ceeWjeMIzW7v8REBQFH1fzpKrkjHNxPO4KkbLNapFkYZsQd7kTRv/p1IEIhCSTHS4e
 BJzr2aFiPwgxl8Tdosh3BO1V58N+fCrxSUbUMysJyH8wkRh2jlwxtgUGw9WXHtJP8rPY
 ZVGb1G44aqxLCxDbSgvCRkxPvBZmhk6hlc7/w4tW/9LSQd2ZOBtrS2IUZgAwWIRzeob1
 vMdw==
X-Gm-Message-State: AOAM531SKGZlkfG2Kz2ovTGfjn/Zqxbjy0iE31n9o8JrMAK0jMIXaT9x
 QxK4XA7Och2XqoL1qo61d6GwWeug825zknZZFLlqn3La/LA=
X-Google-Smtp-Source: ABdhPJxWFFJLBie28uwO+mfWw6+rVux3clJDn+4NJxG/XEv+2TjhOCsyA0h4xqnsg3tJT/iQk4d1+6oGZWGbefChViw=
X-Received: by 2002:a9d:6a84:0:b0:5cd:ad64:a50 with SMTP id
 l4-20020a9d6a84000000b005cdad640a50mr6171514otq.114.1650384866097; Tue, 19
 Apr 2022 09:14:26 -0700 (PDT)
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
 <CAPi7W81tjVJ66QKgGVWHqytr-rakz4b6dK2TKVR7dc=tPiaxQA@mail.gmail.com>
 <2a14aebd-8213-0966-b0d4-392ca9ce36e6@microchip.com>
In-Reply-To: <2a14aebd-8213-0966-b0d4-392ca9ce36e6@microchip.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Apr 2022 18:12:23 +0200
Message-ID: <CAPi7W82y2e=mbjNRUyiondGuTWxyD=NewNKSquxW-hUfL=A9qw@mail.gmail.com>
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

TGUgbWFyLiAxOSBhdnIuIDIwMjIgw6AgMTI6MTksIDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5j
b20+IGEgw6ljcml0IDoKPgo+IE9uIDQvMTkvMjIgMTI6MDggUE0sIEZhYnJpY2UgRm9udGFpbmUg
d3JvdGU6Cj4gPiBIZWxsbyBFdWdlbiwKPiA+Cj4gPiBMZSBtYXIuIDE5IGF2ci4gMjAyMiDDoCAw
NzoyMSwgPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gYSDDqWNyaXQgOgo+ID4+Cj4gPj4g
T24gNC8xNC8yMiA3OjQ0IFBNLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4+PiBMZSBqZXUu
IDE0IGF2ci4gMjAyMiDDoCAxMTo1OSwgRmFicmljZSBGb250YWluZQo+ID4+PiA8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+Pj4+Cj4gPj4+PiBIZWxsbyBFdWdlbiwK
PiA+Pj4+Cj4gPj4+PiBMZSBqZXUuIDE0IGF2ci4gMjAyMiDDoCAxMToxMCwgPEV1Z2VuLkhyaXN0
ZXZAbWljcm9jaGlwLmNvbT4gYSDDqWNyaXQgOgo+ID4+Pj4+Cj4gPj4+Pj4gT24gNC8xMy8yMiAx
MToyOSBBTSwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+ID4+Pj4+Pj4+Pj4+ICAgICAgPEV1Z2Vu
LkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgo+ID4+Pj4+Pgo+ID4+Pj4+PiAgICAgPiBP
biA0LzEyLzIyIDk6MTcgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gPj4+Pj4+ICAgICA+
PiBMZSBtYXIuIDEyIGF2ci4gMjAyMiDDoCAxNDozNCwgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4gPj4+Pj4+ICAgICA+Pj4KPiA+Pj4+Pj4gICAgID4+
Pj4+Pj4+IDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IHdyaXRlczoKPiA+Pj4+Pj4gICAg
ID4+Pgo+ID4+Pj4+PiAgICAgPj4+IEhpLAo+ID4+Pj4+PiAgICAgPj4+Cj4gPj4+Pj4+ICAgICA+
Pj4gPj4gWWVhaC4gRXVnZW4sIGlzIHRoZXJlIGFueSBzcGVjaWZpYyByZWFzb24gd2h5IHlvdSB1
c2UgdGhlIGRoY3AgcGFja2FnZQo+ID4+Pj4+PiAgICAgPj4+ID4+IG92ZXIgdGhlIG90aGVyIERI
Q1AgY2xpZW50cyB3ZSBwcm92aWRlPwo+ID4+Pj4+PiAgICAgPj4+Cj4gPj4+Pj4+ICAgICA+Pj4g
PiBIaXN0b3JpY2FsIHJlYXNvbnMsIGFuZCB0aGUgZmFjdCB0aGF0IHBlb3BsZSBoYXZlIHdvcmtp
bmcgY29uZmlndXJhdGlvbnMKPiA+Pj4+Pj4gICAgID4+PiA+IHVzaW5nIHRoaXMgcGFja2FnZS4u
LiBJIHdhcyB1bmF3YXJlIHRoYXQgaXQgd2FzIGR1ZSB0byBiZSByZW1vdmVkLgo+ID4+Pj4+PiAg
ICAgPj4+ID4gV2Ugd2lsbCB0cnkgdG8gc3dpdGNoIHRvIGEgZGlmZmVyZW50IHBhY2thZ2UgaW4g
dGhlIGZ1dHVyZS4gVGhhbmtzIGZvcgo+ID4+Pj4+PiAgICAgPj4+ID4gbGV0dGluZyBtZSBrbm93
Lgo+ID4+Pj4+PiAgICAgPj4+ID4gSG93ZXZlciwgaWYgdGhlIHBhY2thZ2UgaXMgc3RpbGwgaW4g
dGhpcyBidWlsZHJvb3QgcmVsZWFzZSwgaXQgaGFzIHRvCj4gPj4+Pj4+ICAgICA+Pj4gPiB3b3Jr
IHJpZ2h0ID8KPiA+Pj4+Pj4gICAgID4+Pgo+ID4+Pj4+PiAgICAgPj4+IFllcywgdGhhdCBpcyB0
aGUgaWRlYS4gSWYgaXQgaXMgZGVhZCB1cHN0cmVhbSBhbmQgaGFyZCB0byBmaXggdGhlbiB0aGF0
Cj4gPj4+Pj4+ICAgICA+Pj4gbmF0dXJhbGx5IG1ha2VzIGl0IGhhcmRlciB0byBkbywgYnV0IHRo
ZSBpbnRlbnRpb24gaXMgdG8gZml4IGl0Lgo+ID4+Pj4+PiAgICAgPj4KPiA+Pj4+Pj4gICAgID4+
IFRoZSBmb2xsb3dpbmcgcGF0Y2ggc2hvdWxkIGZpeCB0aGUgaXNzdWU6Cj4gPj4+Pj4+ICAgICA+
PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIw
MjIwNDEyMTgxNjA3LjE0NTE1ODAtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8KPiA+Pj4+
Pj4KPiA+Pj4+Pj4gICAgID4gSGksCj4gPj4+Pj4+Cj4gPj4+Pj4+ICAgICA+IHlvdXIgcGF0Y2gg
dG9nZXRoZXIgd2l0aCB0aGUgb3RoZXIgb25lICgKPiA+Pj4+Pj4gICAgID4gaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC9EVTBQMjUxTUIwNzc5N0NB
QUU4MEM5ODVEQzg5NzYzMzVFM0U3OUBEVTBQMjUxTUIwNzc5LkVVUlAyNTEuUFJPRC5PVVRMT09L
LkNPTS8KPiA+Pj4+Pj4gICAgID4gKSwKPiA+Pj4+Pj4KPiA+Pj4+Pj4gICAgID4gc29sdmUgdGhl
IGJ1aWxkIHByb2JsZW0gZm9yIHRoaXMgcGFja2FnZS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhleSBh
cmUgbm93IGJvdGggYWRkZWQgdG8gdGhlIDIwMjIuMDIueCBicmFuY2gsIHRoYW5rcy4KPiA+Pj4+
Pj4KPiA+Pj4+Pj4gLS0KPiA+Pj4+Pj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKPiA+Pj4+Pj4KPiA+
Pj4+Pgo+ID4+Pj4+IEhlbGxvIGFnYWluIEZhYnJpY2UsCj4gPj4+Pj4KPiA+Pj4+PiBBZnRlciBt
YW5hZ2luZyB0byBzdWNjZXNzZnVsbHkgYnVpbGQgYWxsIG91ciBkZWZjb25maWdzIG5vdywgd2hp
bGUKPiA+Pj4+PiB0ZXN0aW5nIG9uIGFub3RoZXIgYm9hcmQgKHNhbWE3ZzVlayksIEkgbm90aWNl
ZCB0aGlzIG1lc3NhZ2UgYXQgYm9vdCBsb2cgOgo+ID4+Pj4+Cj4gPj4+Pj4gU3RhcnRpbmcgREhD
UCBzZXJ2ZXI6IC91c3Ivc2Jpbi9kaGNwZDogZXJyb3Igd2hpbGUgbG9hZGluZyBzaGFyZWQKPiA+
Pj4+PiBsaWJyYXJpZXM6IGxpYmlycy5zby4xNjE6IGNhbm5vdCBvcGVuIHNoYXJlZCBvYmplY3Qg
ZmlsZTogTm8gc3VjaCBmaWxlCj4gPj4+Pj4gb3IgZGlyZWN0b3J5Cj4gPj4+Pj4KPiA+Pj4+PiBE
aWdnaW5nIHlpZWxkcyB0aGF0IGxpYmlycyBpcyBwYXJ0IG9mIGJpbmQgcGFja2FnZS4gRG8geW91
IGtub3cgd2h5IHRoaXMKPiA+Pj4+PiBoYXBwZW5zIGFuZCB3aGF0IGNvdWxkIGJlIHRoZSBjYXVz
ZT8gQ291bGQgbGF0ZXN0IHBhdGNoZXMgYWZmZWN0IHRoZSBkaGNwZCA/Cj4gPj4+Pgo+ID4+Pj4g
SW5kZWVkLCB0aGUgaW50ZXJuYWwgYmluZCBsaWJyYXJpZXMgKGluY2x1ZGluZyBsaWJpcnMuc28u
MTYxKSBhcmUKPiA+Pj4+IGNvcnJlY3RseSBpbnN0YWxsZWQgaW4gc3RhZ2luZyBkaXJlY3Rvcnkg
YnV0IG5vdCBpbiB0aGUgdGFyZ2V0Cj4gPj4+PiBkaXJlY3RvcnkgYmVjYXVzZSBkaGNwLm1rIGlz
IG92ZXJyaWRpbmcgREhDUF9JTlNUQUxMX1RBUkdFVF9DTURTLgo+ID4+Pj4gSSdsbCBzZW5kIGEg
cGF0Y2ggYnkgdGhlIGVuZCBvZiB0aGUgZGF5Lgo+ID4+Pgo+ID4+PiBUaGUgZm9sbG93aW5nIHBh
dGNoIHNob3VsZCBmaXggdGhlIGlzc3VlOgo+ID4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNDE0MTY0MTA5LjE3MjQ4NzMtMS1mb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8KPiA+Pj4KPiA+Pgo+ID4+IEhlbGxvIEZhYnJpY2UsCj4g
Pj4KPiA+PiBUaGUgbGliaXJzIHByb2JsZW0gaXMgZ29uZSBub3csIHRoYW5rcy4gSG93ZXZlciwg
SSBnZXQgYSBuZXcgZXJyb3I6Cj4gPj4KPiA+Pgo+ID4+IFN0YXJ0aW5nIERIQ1Agc2VydmVyOiAv
dXNyL3NiaW4vZGhjcGQ6IGVycm9yIHdoaWxlIGxvYWRpbmcgc2hhcmVkCj4gPj4gbGlicmFyaWVz
OiBsaWJpc2NjZmcuc28uMTYzOiBjYW5ub3Qgb3BlbiBzaGFyZWQgb2JqZWN0IGZpbGU6IE5vIHN1
Y2gKPiA+PiBmaWxlIG9yIGRpcmVjdG9yeQo+ID4+Cj4gPj4gTG9va3MgbGlrZSB0aGVyZSBhcmUg
c3RpbGwgcHJvYmxlbXMgb24gbXkgc2lkZQo+ID4KPiA+IGxpYmlzY2NmZy5zby4xNjMgaXMgaW5z
dGFsbGVkIG9uIHRhcmdldCByb290ZnMgKGluIC91c3IvbGliKS4gQ2FuIHlvdQo+ID4gY2hlY2sg
dGhhdCB0aGlzIGlzIGFsc28gdGhlIGNhc2Ugb24geW91ciBzaWRlPwo+Cj4gIyBscyAtbGEgL3Vz
ci9saWIvbGliaXNjKgo+IGxyd3hyd3hyd3ggICAgMSByb290ICAgICByb290ICAgICAgICAgICAg
MTggQXByIDE4ICAyMDIyCj4gL3Vzci9saWIvbGliaXNjLnNvIC0+IGxpYmlzYy5zby4xMTA3LjAu
Nwo+IGxyd3hyd3hyd3ggICAgMSByb290ICAgICByb290ICAgICAgICAgICAgMTggQXByIDE4ICAy
MDIyCj4gL3Vzci9saWIvbGliaXNjLnNvLjExMDcgLT4gbGliaXNjLnNvLjExMDcuMC43Cj4gLXJ3
eHIteHIteCAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgIDMxNzk2MCBBcHIgMTggIDIwMjIKPiAv
dXNyL2xpYi9saWJpc2Muc28uMTEwNy4wLjcKPiAjCj4KPgo+IEl0IGxvb2tzIGxpa2UgaXQncyBu
b3QuCgpJIHdhcyBhYmxlIHRvIGZpbmQgYW5kIGZpeCB0aGUgaXNzdWU6Cmh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA0MTkxNjExMzAuMzQz
MTQ5Mi0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tLwoKPgo+ID4KPiA+Pgo+ID4+IFRoYW5r
cywKPiA+PiBFdWdlbgo+ID4+Cj4gPj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gVGhhbmtzICEKPiA+Pj4+
PiBFdWdlbgo+ID4+Pj4KPiA+Pj4+IEJlc3QgUmVnYXJkcywKPiA+Pj4+Cj4gPj4+PiBGYWJyaWNl
Cj4gPj4+Cj4gPj4+IEJlc3QgUmVnYXJkcywKPiA+Pj4KPiA+Pj4gRmFicmljZQo+ID4+Pgo+ID4+
Cj4gPgo+ID4gQmVzdCBSZWdhcmRzLAo+ID4KPiA+IEZhYnJpY2UKPiA+Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
