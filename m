Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4ACC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0FC1610A4;
	Wed, 23 Nov 2022 21:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0FC1610A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNNzxDkEXUVG; Wed, 23 Nov 2022 21:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18082610B0;
	Wed, 23 Nov 2022 21:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18082610B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F03491BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBCF960BC2
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBCF960BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdLsc0XhU4Ne for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:51:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC15610B0
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC15610B0
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:51:32 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xxeUojj8vhGf4xxeUotJ07; Wed, 23 Nov 2022 22:51:30 +0100
Message-ID: <c7a20207-b2d4-3487-e3e3-0dbb9c9aee7d@benettiengineering.com>
Date: Wed, 23 Nov 2022 22:51:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Michael Despault <mike@wewearmanyhats.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CAP_a2zr1FbRNYf12d+42tPZ3xQrthddMc7pajaMC7ZA94aP5qQ@mail.gmail.com>
 <20221123151413.655df990@windsurf>
 <CAP_a2zr1LQtsGPG+Qoy41LT-VreK7=Jon4OsjNO2jgSoEDA1DQ@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAP_a2zr1LQtsGPG+Qoy41LT-VreK7=Jon4OsjNO2jgSoEDA1DQ@mail.gmail.com>
X-CMAE-Envelope: MS4xfCN3wdK5WicaU1Xpw2K0GzmfKIhtNxSp6OYLQ8JHo2EtK3dpoF2ypY8KeY6uoUMC9yEPPhUIicoEZcUMAPWkZ10XzCc4PrH7uemrNvtZVnLwLY2C1ZZ2
 fPKi43XSNbgMEDX7FDU3vcMz83eEveSDvZwZQ+ynkqKLC+rMnZwptkL8dQMFVICXUaVGv4qQWfH3M55HYhQoz4naHZPcW5wktRWEwR8ZbwpY5zD0QBywHLaQ
 /ugpPAkt9t/4+HHrrDSq5WMdI5+RMkX4/mSjHlE0MLO6ZrYEtZ31GQkGzFG6PWTw
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669240290; bh=DKhmHWqIsTB261kdOz5Im9fimLVVb1Sf8PEBZqMye0k=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=npYWzBDQ2DVhepA/CRkG/fWZT+R1iUkzhjv3QM4oKJkDlDS7ht5Nci+wJvare1Bn7
 IgsBpZ8sNzwtUk1nnrVf6yL7OKrUMRq6dLmtLybrwzsL2GmlBZ66cI6gyxNWhCZ2dG
 EFXt9ApiRddd1ncCmiRMhvoJzelEfZQS/j+pDAIiZYi1RBl/yCoZKdCKfA2wzntdBM
 VhDhLa9PLCs6nzv6MJZVTNYA84PIQuqNU346Tm4R6ZfqVEh4Fgbim0BtVEsmvCcR0N
 29b9dKmdHOwsf9wLFdT0ooL4Z/SCtusPaZc1SJwwtIVRteAT06xFTi/dAvhKWs9cei
 SRt4JLXgwPGdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=npYWzBDQ
Subject: Re: [Buildroot] defconfig with wayland support?
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

SGkgTWljaGFlbCBhbmQgVGhvbWFzLAoKSSBnaXZlIG15IDIgY2VudHMsCgpZb3UgaGF2ZSAyIHBv
c3NpYmxlIGFwcHJvYWNoZXM6CjEpIHVzZSBwYW5mcm9zdCBieSBlbmFibGluZyBtZXNhM2QgcGFj
a2FnZQoyKSB1c2UgbWFsaS1kcml2ZXIgKyByb2NrY2hpcC1tYWxpKHByb3ByaWV0YXJ5IFJvY2tj
aGlwIGJsb2JzKQoKSW4gYm90aCBjYXNlcyBpdCBzaG91bGQgd29yayB3aXRoIFdheWxhbmQgM2Qg
QWNjZWxlcmF0ZWQuIEkgZG9uJ3QgaGF2ZSBhClJLMzM5OSBib2FyZCBoZXJlIHRvIHRlc3QgaXQg
dW5mb3J0dW5hdGVseS4KCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBF
bmdpbmVlcmluZyBzYXMKCk9uIDIzLzExLzIyIDIyOjQyLCBNaWNoYWVsIERlc3BhdWx0IHdyb3Rl
Ogo+IEhpIFRob21hcywKPiAKPiBNeSBnb2FsIGlzIHRvIGdldCBXYXlsYW5kIHJ1bm5pbmcgb24g
dGhlIHJrMzM5OSBTb0MsIHdoaWNoIGlzIGFuIEFBcmNoNjQgCj4gYXJjaGl0ZWN0dXJlLsKgIFRo
ZSBHUFUgaXMgYSBNYWxpLVQ4NjAuwqAgSXQgc2VlbXMgdGhpcyBpcyBpbmRlZWQgCj4gcG9zc2li
bGUsIGJhc2VkIG9uIHRoaXMgYXJ0aWNsZTogCj4gaHR0cHM6Ly93d3cuY29sbGFib3JhLmNvbS9u
ZXdzLWFuZC1ibG9nL2Jsb2cvMjAxOS8wOC8wNi9yb2NrcGktcGFuZnJvc3Qtd2F5bGFuZC8gPGh0
dHBzOi8vd3d3LmNvbGxhYm9yYS5jb20vbmV3cy1hbmQtYmxvZy9ibG9nLzIwMTkvMDgvMDYvcm9j
a3BpLXBhbmZyb3N0LXdheWxhbmQvPgo+IAo+IFNvIEknZCBiZSB1c2luZyBQYW5mcm9zdCBJIHN1
cHBvc2UuCj4gCj4gKk1pa2UgRGVzcGF1bHQqCj4gL0NFTy8KPiBodHRwczovL3dld2Vhcm1hbnlo
YXRzLmNvbS8gPGh0dHBzOi8vd2V3ZWFybWFueWhhdHMuY29tLz4KPiAKPiAKPiBPbiBXZWQsIDIz
IE5vdiAyMDIyIGF0IDA2OjE0LCBUaG9tYXMgUGV0YXp6b25pIAo+IDx0aG9tYXMucGV0YXp6b25p
QGJvb3RsaW4uY29tIDxtYWlsdG86dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4+IHdyb3Rl
Ogo+IAo+ICAgICBIZWxsbyBNaWNoYWVsLAo+IAo+ICAgICBPbiBUdWUsIDIyIE5vdiAyMDIyIDE2
OjQ2OjU0IC0wODAwCj4gICAgIE1pY2hhZWwgRGVzcGF1bHQgPG1pa2VAd2V3ZWFybWFueWhhdHMu
Y29tCj4gICAgIDxtYWlsdG86bWlrZUB3ZXdlYXJtYW55aGF0cy5jb20+PiB3cm90ZToKPiAKPiAg
ICAgID4gSSdtIHN0cnVnZ2xpbmcgdG8gZ2V0IGEgYnVpbGRyb290IGdlbmVyYXRlZCBzeXN0ZW0g
dXAgYW5kIHJ1bm5pbmcKPiAgICAgdGhhdCBoYXMKPiAgICAgID4gd29ya2luZyB3YXlsYW5kIHN1
cHBvcnQuwqAgTXkgcHJpbWFyeSBnb2FsIGlzIHNpbXBseSB0byBiZSBhYmxlIHRvCj4gICAgIGdl
dCBhbgo+ICAgICAgPiBlbWJlZGRlZCBzeXN0ZW0gdGhhdCBjYW4gcnVuIGFuZCBkaXNwbGF5IHdh
eWxhbmQgYXBwbGljYXRpb25zLAo+ICAgICB1c2luZyB0aGUKPiAgICAgID4gYnVpbGRyb290IHN5
c3RlbS7CoCBJJ3ZlIGZvdW5kIGV4YW1wbGVzIG9mIG90aGVyIGNvbmZpZ3MgdGhhdAo+ICAgICBj
bGFpbSB0byBoYXZlCj4gICAgICA+IFgxMSBzdXBwb3J0LCBidXQgbm90aGluZyBvbiB3YXlsYW5k
LsKgIFBva2luZyBhcm91bmQgaW4gIm1ha2UKPiAgICAgbWVudWNvbmZpZyIKPiAgICAgID4gSSd2
ZSBkb25lIHdoYXQgSSBjYW4gdG8gZW5hYmxlIGFueSB3YXlsYW5kL3dlc3RvbiByZWxhdGVkCj4g
ICAgIG9wdGlvbnMsIGJ1dAo+ICAgICAgPiBjdXJyZW50bHkgSSdtIGhpdHRpbmcgdGhpcyBidWls
ZCBlcnJvcjoKPiAgICAgID4KPiAgICAgID4gUnVuLXRpbWUgZGVwZW5kZW5jeSBsaWJkcm0gZm91
bmQ6IE5PICh0cmllZCBwa2djb25maWcgYW5kIGNtYWtlKQo+ICAgICAgPiBvdXRwdXQvYnVpbGQv
d2xyb290cy0wLjE0LjEvbWVzb24uYnVpbGQ6OTk6MDogRVJST1I6IERlcGVuZGVuY3kKPiAgICAg
ImxpYmRybSIKPiAgICAgID4gbm90IGZvdW5kLCB0cmllZCBwa2djb25maWcgYW5kIGNtYWtlCj4g
ICAgICA+Cj4gICAgICA+IFRoaXMgaGFwcGVucyB3aGVuIEkgdHJ5IGFuZCBidWlsZCBtZXNvbi7C
oCBIYXMgYW55b25lIGhhZCBzdWNjZXNzCj4gICAgIGdldHRpbmcgYW4KPiAgICAgID4gZW1iZWRk
ZWQgc3lzdGVtICh2aWEgYnVpbGRyb290KSBnb2luZyB3aXRoIHdheWxhbmQgd29ya2luZyBvdXQg
b2YKPiAgICAgdGhlIGJveD8KPiAgICAgID4gSG9waW5nIHNvbWVvbmUgd291bGQgYmUgYWJsZSB0
byBzaGFyZSB0aGVpciBkZWZjb25maWcgZmlsZSB3aXRoIHRoZQo+ICAgICAgPiBhcHByb3ByaWF0
ZSBvcHRpb25zLCBvciBhdCBsZWFzdCBzaGFyZSB0aGUgZXNzZW50aWFsIGNvbXBvbmVudHMKPiAg
ICAgdG8gZW5hYmxlCj4gICAgICA+IGluIG1ha2UgbWVudWNvbmZpZy7CoCBCYXJlYm9uZXMgaXMg
ZmluZSBhbmQgbm90IGNvbmNlcm5lZCBzbyBtdWNoCj4gICAgIGFib3V0Cj4gICAgICA+IGFyY2hp
dGVjdHVyZSByaWdodCBub3csIGJ1dCBjdXJyZW50bHkgdGVzdGluZyBvbiBYODZfNjQgd2l0aCB0
aGUKPiAgICAgaW50ZW50IHRvCj4gICAgICA+IHRhcmdldCBhYXJjaDY0IGV2ZW50dWFsbHkuCj4g
Cj4gICAgIFRoZXJlIGlzIG9uZSBjcml0aWNhbCBwaWVjZSBvZiBpbmZvcm1hdGlvbiB0aGF0IHlv
dSBmb3Jnb3QgdG8gcHJvdmlkZToKPiAgICAgd2hhdCBpcyB5b3VyIEhXIHBsYXRmb3JtLiBJbmRl
ZWQsIGRlcGVuZGluZyBvbiB3aGljaCBHUFUgaXQgaGFzLCB0aGUKPiAgICAgQnVpbGRyb290IGNv
bmZpZ3VyYXRpb24gd2lsbCBoYXZlIHRvIGJlIGRpZmZlcmVudCB0byBwcm92aWRlIHRoZSByaWdo
dAo+ICAgICBPcGVuR0wgaW1wbGVtZW50YXRpb24uIEl0J3Mgbm90IHBvc3NpYmxlIHRvIHByb3Zp
ZGUgYSAiV2F5bGFuZAo+ICAgICBjb25maWd1cmF0aW9uIiB0aGF0IHdvcmtzIGV2ZXJ5d2hlcmUu
Cj4gCj4gICAgIEJlc3QgcmVnYXJkcywKPiAKPiAgICAgVGhvbWFzCj4gICAgIC0tIAo+ICAgICBU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gICAgIEVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gICAgIGh0dHBzOi8v
Ym9vdGxpbi5jb20gPGh0dHBzOi8vYm9vdGxpbi5jb20+Cj4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
