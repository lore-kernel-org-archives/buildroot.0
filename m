Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C07C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 16:37:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB61A60041
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 16:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB61A60041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB0BF4021E;
	Tue, 10 Aug 2021 16:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0a5pzlYivBv; Tue, 10 Aug 2021 16:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3565C40222;
	Tue, 10 Aug 2021 16:37:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 077C81BF5DE
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 16:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9FF2606CB
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 16:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZzMsgC2-tUke for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 16:37:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02D34606A7
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 16:37:39 +0000 (UTC)
Received: from [192.168.47.129] ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id DUkymQGdEa4UMDUkymJIyO; Tue, 10 Aug 2021 18:37:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628613457; bh=QjGTzy/BZCjFwDtn9y7qhsRGi5rycsNFIJy7Y/Y+f6U=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=nwME5AVyBLNopgf0dT7uzfePfzjGAMB1lts8enpKXF3hEpvkiFOA7jIllou6PtGN+
 6JauKmP357qrRO7h6ih0AVYc3IE2h3Pn6FMy3D2igTrfVB/Cx1IgUIzdrwc378jFIh
 8ZFqnBXPqlcTLtvTo9b76C+qPUJcXE+0efDij6VR/Wpnj+HaOg+cZ95wqTVQbnmQ1z
 6V1MJyOAcSE5k65HG5/l4KPFAkNo/0oumumh7Z1QAvNUWEdsGQMs61DpMJ2KxMB6QP
 UsOyXNrbQ/WwE328tJPCq5qCwk8LF7iUATuF/2GqnSkDrxKmayikeZcJYKTJQTAvr8
 /KiMNhunC2eug==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210808222252.622b4470@windsurf>
 <36CCC7B4-E482-495D-B32C-484D882E5733@benettiengineering.com>
Message-ID: <31f52521-8036-ad78-94ea-399193699a06@benettiengineering.com>
Date: Tue, 10 Aug 2021 18:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <36CCC7B4-E482-495D-B32C-484D882E5733@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfEPgoqFG+daeCIFa46j4rZ898HtsJYhcNer0j40edqkY4lXc/gt4KugggIZ+LKlCNPSIJZV5e2pwIY+7NxLCIkealg1I4fnvrZBuOr8AzaGW0Ap0XkyU
 YQIipYubyckwS4qVEXjAzJVs/8A0HIp9NQ01QNFR/Iqal/UTMrNdueKjQQNwmRvqTgtorAjWfQdlGFjv4FGauBScH0u1dNtdIzTTNKbDCkLiHK0PPLFfRBfi
 82dAGErZo3uQ0nMylZMdc46XAm3Fs8U/cXjrHW+p5c5lELG/xMNx6Tr3eEIz/C1KprdPz7N8gS3i6Q5swpVcd+KcRruwabuaMWsQsHn/ldo=
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix build on ARM big
 endian
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzIGFuZCBGYWJyaWNlLAoKT24gOC84LzIxIDExOjU5IFBNLCBHaXVsaW8gQmVu
ZXR0aSB3cm90ZToKPiBIZWxsbyBUaG9tYXMsIEZhYnJpY2UsCj4gCj4+IElsIGdpb3JubyA4IGFn
byAyMDIxLCBhbGxlIG9yZSAyMjoyMywgVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9u
aUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKPj4KPj4g77u/T24gU2F0LCAgNyBBdWcgMjAyMSAy
MzozMjo1NCArMDIwMAo+PiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4+Cj4+PiBGaXggdGhlIGZvbGxvd25pZyBidWlsZCBmYWlsdXJlIG9uIEFS
TSBiaWcgZW5kaWFuIHJhaXNlZCBzaW5jZSBidW1wIHRvCj4+PiB2ZXJzaW9uIDMuNjggaW4gY29t
bWl0IDBhNzNiOWI5NjI0MjFjZTdhNzJjODhlNWY1YmJkODg0OWYyMWIwNDE6Cj4+Pgo+Pj4gTGlu
dXgyLjZfYWFyY2g2NF9hYXJjaDY0X2JlLWxpbnV4LWdudS1nY2NfZ2xpYmNfUFRIXzY0X0RCRy5P
QkovTGludXhfU0lOR0xFX1NITElCL3NoYTI1Ni1hcm12OC5vOiBJbiBmdW5jdGlvbiBgU0hBMjU2
X0NvbXByZXNzX05hdGl2ZSc6Cj4+PiBzaGEyNTYtYXJtdjguYzooLnRleHQuU0hBMjU2X0NvbXBy
ZXNzX05hdGl2ZSsweDApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGBTSEEyNTZfQ29tcHJlc3Nf
TmF0aXZlJwo+Pj4gTGludXgyLjZfYWFyY2g2NF9hYXJjaDY0X2JlLWxpbnV4LWdudS1nY2NfZ2xp
YmNfUFRIXzY0X0RCRy5PQkovTGludXhfU0lOR0xFX1NITElCL3NoYTUxMi5vOnNoYTUxMi5jOigu
dGV4dC5TSEEyNTZfQ29tcHJlc3NfTmF0aXZlKzB4MCk6IGZpcnN0IGRlZmluZWQgaGVyZQo+Pj4g
TGludXgyLjZfYWFyY2g2NF9hYXJjaDY0X2JlLWxpbnV4LWdudS1nY2NfZ2xpYmNfUFRIXzY0X0RC
Ry5PQkovTGludXhfU0lOR0xFX1NITElCL3NoYTI1Ni1hcm12OC5vOiBJbiBmdW5jdGlvbiBgU0hB
MjU2X1VwZGF0ZV9OYXRpdmUnOgo+Pj4gc2hhMjU2LWFybXY4LmM6KC50ZXh0LlNIQTI1Nl9VcGRh
dGVfTmF0aXZlKzB4MCk6IG11bHRpcGxlIGRlZmluaXRpb24gb2YgYFNIQTI1Nl9VcGRhdGVfTmF0
aXZlJwo+Pj4gTGludXgyLjZfYWFyY2g2NF9hYXJjaDY0X2JlLWxpbnV4LWdudS1nY2NfZ2xpYmNf
UFRIXzY0X0RCRy5PQkovTGludXhfU0lOR0xFX1NITElCL3NoYTUxMi5vOnNoYTUxMi5jOigudGV4
dC5TSEEyNTZfVXBkYXRlX05hdGl2ZSsweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKPj4+Cj4+PiBG
aXhlczoKPj4+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMjM3YWJh
MGMxNmEzNGZlYzFiMGZlNTBmZTA4Y2FjZTQzOGVkYTFiZgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Pj4gLS0tCj4+
PiAuLi4yLmMtZml4LVNIQTI1Ni1yZWRlZmluaXRpb24tb24tQVJNLWIucGF0Y2ggfCA0NyArKysr
KysrKysrKysrKysrKysrCj4+PiAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQo+Pj4g
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlibnNzLzAwMDEtbGliLWZyZWVibC1zaGE1MTIu
Yy1maXgtU0hBMjU2LXJlZGVmaW5pdGlvbi1vbi1BUk0tYi5wYXRjaAo+Pgo+PiBJIGhhdmUgYXBw
bGllZCB0byBtYXN0ZXIuIEdpdWxpbzogSSBzYXcgeW91ciBjb21tZW50cywgYW5kIHdlIHdpbGwK
Pj4gZGVmaW5pdGVseSBiZSBpbnRlcmVzdGVkIGluIGhlYXJpbmcgdXBzdHJlYW0ncyBmZWVkYmFj
ay4KPj4KPj4gSG93ZXZlciwgd2hhdCBoYXBwZW5zIHNlZW1zIHByZXR0eSBjbGVhcjogb24gQWFy
Y2g2NCAobGl0dGxlIGVuZGlhbiBvcgo+PiBiaWcgZW5kaWFuKSwgc2hhMjU2LWFybXY4LmMgZ2V0
cyBjb21waWxlZCwgYW5kIGl0IGRlZmluZXMgYSBmdW5jdGlvbgo+PiBjYWxsZWQgU0hBMjU2X0Nv
bXByZXNzX05hdGl2ZSgpLiBUaGlzIHNoYTI1Ni1hcm12OC5jIGNvZGUgaXMgaW5jbHVkZWQKPj4g
aW5zaWRlIGEgVVNFX0hXX1NIQTIgY29uZGl0aW9uYWwsIHNvIGl0IGlzIG9ubHkgY29tcGlsZWQg
aW4gaWYKPj4gVVNFX0hXX1NIQTIgaXMgZGVmaW5lZC4KPj4KPj4gc2hhNTEyLmMsIHdoaWNoIGlz
IGFyY2hpdGVjdHVyZS1pbmRlcGVuZGVudCBnZW5lcmljIGNvZGUsIGFsc28KPj4gaW1wbGVtZW50
cyBhIGZ1bmN0aW9uIGNhbGxlZCBTSEEyNTZfQ29tcHJlc3NfTmF0aXZlKCkuIEl0IG9ubHkgZGVm
aW5lcwo+PiBpdCB3aGVuICFVU0VfSFdfU0hBMiwgdG8gbm90IGNvbmZsaWN0IHdpdGggYXJjaGl0
ZWN0dXJlLW9wdGltaXplZAo+PiB2YXJpYW50cy4uLiBidXQgZHVlIHRvIHRoZSBidWcgaXQgYWxz
byBkZWZpbmVzIGl0IHdoZW4gIUxJVFRMRV9FTkRJQU4uCj4+IFRoaXMgZG9lc24ndCBtYWtlIHNl
bnNlIGJlY2F1c2UgdGhlcmUgaXMgbm90aGluZyB0aGF0IHByZXZlbnRzIHRoZQo+PiBzaGEyNTYt
YXJtdjguYyBjb2RlIGZyb20gYmVpbmcgY29tcGlsZWQgaW4gYmlnLWVuZGlhbiBBYXJjaDY0LCBh
bmQgdGhpcwo+PiBpc3N1ZSB3YXMgaW50cm9kdWNlZCB3aGVuIHNvbWVvbmUgb3B0aW1pemVkIHRo
ZSBzaGEyNTYgY29kZSBmb3IgeDg2LCBhcwo+PiBwb2ludGVkIGJ5IEZhYnJpY2UuCj4+Cj4+IFNv
IEkgYmVsaWV2ZSBGYWJyaWNlJ3Mgc29sdXRpb24gaXMgT0ssIGJ1dCBvZiBjb3Vyc2UsIHVwc3Ry
ZWFtIHdpbGwKPj4gY29uZmlybSAob3Igbm90KS4KPiAKPiBPaywgc28gbGV04oCZcyB3YWl0IGZv
ciBhbiB1cHN0cmVhbSBhbnN3ZXIsIGluIHRoZSBtZWFud2hpbGUgaXQgYnVpbGRzIGZpbmUgYW5k
IGV2ZW50dWFsbHkgaWYgc29tZW9uZSBnaXZlcyBpdCBhIHRyeSBvbiBBYXJjaDY0IEJFIGNhbiBm
aWxlIGEgYnVnIGZvciBpdCBvciBub3QuCgpVcHN0cmVhbSBhbnN3ZXJlZCBpdCBzZWVtcyBjb21w
YXRpYmxlIGZvciBib3RoIEJJRyBhbmQgTElUVExFIEVuZGlhbjoKaHR0cHM6Ly9idWd6aWxsYS5t
b3ppbGxhLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTcyNDYyOQpzbyBJJ3ZlIHBvaW50ZWQgRmFicmlj
ZSdzIHBhdGNoIHRoYXQgc2hvdWxkIGJlIGNvbW1pdHRlZCBzb29uLgoKQmVzdCByZWdhcmRzCkdp
dWxpbwoKPiBUaGFuayB5b3UKPiBCZXN0IHJlZ2FyZHMKPiBHaXVsaW8KPiAKPj4KPj4gVGhhbmtz
IQo+Pgo+PiBUaG9tYXMKPj4gLS0gCj4+IFRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgo+
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4+IGh0dHBzOi8vYm9vdGxp
bi5jb20KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVzeWJveC5uZXQKPj4gaHR0
cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1c3lib3gubmV0Cj4gaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgotLSAKR2l1bGlvIEJlbmV0dGkK
QmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5u
ZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
