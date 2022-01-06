Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08656C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 17:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E011400D1;
	Thu,  6 Jan 2022 17:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqFyobljGzPq; Thu,  6 Jan 2022 17:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F2C8401A2;
	Thu,  6 Jan 2022 17:09:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 412681BF2F9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 17:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 271364019D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 17:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwgOB_Q1HG_Z for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 17:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2598400D1
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 17:09:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k18so6050498wrg.11
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 09:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=99QGBtpgPzHNvp/KR8Olo4P72mzZ0cxYZfavmrElw9g=;
 b=R6Wmwf83vzSgm48XYE3NQZbVnxHoYXOT9+miZ15iB4OhCgfY31+8MAaUH/KlB9Y5V7
 q+6k/v6B+dYwehqjfrefacsQ3Vee08sBaDAAMB5cCmRPDgNY07pfkTPebwC1IpLhFXNr
 I1xNY3x/a7NkVagD9UhN0GDRdyJ0ms/ou0KFlk56FzHbt0MptHgG6ytHGocqvCaOENGH
 0WB/ao8TS8LOXftydh17RfzmIwd2L+YlrrHT/WCiEMtjdCUqKUrAK7RNKR0/m4kdr8wD
 VHkJhWisjKcX8XT40p94tGyzki3szRrk7NjgnHw3eFxUrggy4FdoN1Ug8d7zcbT45jua
 j5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=99QGBtpgPzHNvp/KR8Olo4P72mzZ0cxYZfavmrElw9g=;
 b=F4pbqYPEqFJfDcCtLWSr6ZIZ4dGyR+TiVzN1MVP31tGOCElVvPpE+7BdEjTzF80Xa+
 r2+6vBAmo6uyutsCgjHd425JaAmyRoDdxiMTyRqEqcCvJPCSACueODxZkF/v+pLGhbsu
 vYfBgC7CIjz/7MI9OBWpgV7syTm7ndrQBEFZyWn3fHJnO6pUieEggH85NIm1BrDLeZWa
 tlBdZYHtfak9L0DhVlItD5Ntgyj12JYQzlMWMNvXVQUUoP1XiOp/BFv2V/9GRNxPK9w2
 2UeQJM3CA56Uiz7nEeEfQthw4em1t4BKZEGo6Fo5tEEcpNxjI+YGPPGRAAuLxRsl1CiX
 np8g==
X-Gm-Message-State: AOAM53148bY/UiNvoo/jdiXv3m6Q3mjMYc7EasKV3sMCVn7PCjm9hqTl
 s9n3joYPdlRbwBNb2F6tt6SLhw==
X-Google-Smtp-Source: ABdhPJy734G93giRJZnvN8sNuO+uaVnkXwPtXaJBMxMMJdtf5s56eIJ1Loz8eXruYCMe2bOjGVC8xw==
X-Received: by 2002:adf:e410:: with SMTP id g16mr4354902wrm.17.1641488988685; 
 Thu, 06 Jan 2022 09:09:48 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id g1sm2370860wri.103.2022.01.06.09.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 09:09:48 -0800 (PST)
Message-ID: <4d73992c-3189-1989-525c-4506495c90ac@mind.be>
Date: Thu, 6 Jan 2022 18:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jesse Millwood <jesse_dev@fastmail.com>, buildroot@buildroot.org
References: <37282adb-8559-4124-874d-c1729bd3ce01@www.fastmail.com>
 <09340549-99c9-b79c-17db-3967b1ab6335@mind.be>
 <fff7dc06ab8c676e28709d3782e57e90ae121095.camel@fastmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <fff7dc06ab8c676e28709d3782e57e90ae121095.camel@fastmail.com>
Subject: Re: [Buildroot] Overriding Kconfig Values from external br2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wMS8yMDIyIDE2OjM3LCBKZXNzZSBNaWxsd29vZCB3cm90ZToKPiBPbiBUaHUsIDIw
MjItMDEtMDYgYXQgMTA6NDUgKzAxMDAsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAwNS8wMS8yMDIyIDIwOjAzLCBKZXNzZSBNaWxsd29vZCB3cm90ZToKPj4+IEhlbGxv
LAo+Pj4KPj4+IEkgaGF2ZSBhbiBleHRlcm5hbCBDL0MrKyB0b29sY2hhaW4gdGhhdCBJJ3ZlIHB1
dCB0b2dldGhlciB0aGF0IHVzZXMKPj4+IE1VU0wuIEkndmUKPj4+IGFsc28gYnVpbHQgYW4gZXh0
ZXJuYWwgUnVzdCB0b29sY2hhaW4gdGhhdCB1c2VzIG15IE1VU0wgdG9vbGNoYWluLgo+Pj4KPj4+
IE15IGlzc3VlIGlzIHRoYXQgdGhlcmUgaXMgYSBSdXN0IEtjb25maWcgdmFyaWFibGUgdGhhdCBz
cGVjaWZpZXMgaWYKPj4+IGEgc3BlY2lmaWMKPj4+IGFyY2hpdGVjdHVyZSBzdXBwb3J0cyBSdXN0
Lgo+Pj4KPj4+IFRoZSBLY29uZmlnIHZhcmlhYmxlIGluIHF1ZXN0aW9uIGlzCj4+PiBCUjJfUEFD
S0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4+PiBpbiBwYWNrYWdlL3J1c3Rj
L0NvbmZpZy5pbi5ob3N0Lgo+Pgo+PiBbc25pcF0KPj4KPj4+IFlvdSBtYXkgbm90aWNlIHRoYXQg
SSBjaGFuZ2VkIHRoZSBsaWJjIGRlcGVuZHMgbGluZSB0byBiZSBvcidkIHdpdGgKPj4+IEJSMl9U
T09MQ0hBSU5fVVNFU19NVVNMLiBJdCBzZWVtcyB0aGF0IHRoaXMgZG9lcyBub3QgZ2V0IGNvbnNp
ZGVyZWQKPj4+IHdoZW4gSQo+Pj4gY2hvb3NlIG15IGV4dGVybmFsIG11c2wgdG9vbGNoYWluIG9w
dGlvbi4gSW4gdGhlIG1lbnVjb25maWcgd2hlbiBJCj4+PiBzZWFyY2ggZm9yCj4+PiB0aGUgQlIy
X1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyB2YXJpYWJsZSB3aXRoIHRo
ZQo+Pj4gIi8iIGtleSBpdAo+Pj4gbG9va3MgbGlrZSBpdCBpcyBvbmx5IGdldHRpbmcgaXQgZnJv
bSB0aGUgb3JpZ2luYWwgZmlsZS4gRG9lcwo+Pj4gYnVpbGRyb290IGhhdmUgYQo+Pj4gbWVjaGFu
aXNtIGZvciBvdmVyd3JpdGluZyB0aGlzIGtpbmQgb2Ygc2V0dGluZyBhbmQgaWYgbm90LCBkb2Vz
Cj4+PiBhbnlvbmUgaGF2ZSBhbgo+Pj4gaWRlYSBvZiBob3cgSSB3b3VsZCBhY2NvbXBsaXNoIHdo
YXQgSSBhbSB0cnlpbmcgdG8gZG8gKG1ha2UKPj4+IGJ1aWxkcm9vdCBob25vciBteQo+Pj4gZXh0
ZXJuYWwgcnVzdCB0b29sY2hhaW4pPwo+Pgo+PiAgwqAgTm8sIHRoZXJlJ3Mgbm8gd2F5IHRvIG92
ZXJyaWRlIHRoZSBkZXBlbmRlbmNpZXMgb2YgYW4gZXhpc3RpbmcKPj4gQ29uZmlnLmluCj4+IHN5
bWJvbCBpbiBhbiBleHRlcm5hbC4KPj4KPj4gIMKgIEhvd2V2ZXIsIHRoaXMgd2FzIGNvcnJlY3Rl
ZCBpbiB1cHN0cmVhbSBCdWlsZHJvb3QgaW4gY29tbWl0Cj4+IGQ2OWQ0MGMwMjlkYzdkODE5OWI3
NDVlYWVlNzU5ZDkyYjY2YzVkMTcuIFNvIHlvdSBjYW4gdHJ5IHRvIGJhY2twb3J0Cj4+IHRoYXQg
Y29tbWl0Cj4+IGluc3RlYWQsIG9yIGp1c3QgdXBkYXRlIEJ1aWxkcm9vdCB0byBzb21ldGhpbmcg
bW9yZSByZWNlbnQuCj4gCj4gQXJub3V0LCB0aGFua3MgZm9yIHRoZSBwb2ludGVyIHRvIHRoZSBj
b21taXQuIFRoYXQgaXMgYSBsb2dpY2FsIHdheSB0bwo+IHN1cHBvcnQgb3RoZXIgcGxhdGZvcm1z
LiBIb3dldmVyLCBJIGhhdmUgYSBwb3dlcnBjIG11c2wgcnVzdCB0b29sY2hhaW4KPiB0aGF0IEkn
dmUgYnVpbHQgZXh0ZXJuYWxseS4KPiAKPiBXaXRoIHRoZSBjaGFuZ2VzIGluIHRoYXQgY29tbWl0
IGNhbiBJIHNldAo+IEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMg
dG8gInkiIGluIG15IGV4dGVybmFsIG5vdwoKICBBaCwgbm8sIHlvdSdyZSByaWdodCwgcG93ZXJw
Yy11bmtub3duLWxpbnV4LW11c2wgaXMgYSBUaWVyIDMgcGxhdGZvcm0gYW5kIHRoYXQgCnBhdGNo
IG9ubHkgYWRkcyBUaWVyIDEgYW5kIDIuIFdlIGNvdWxkIGFkZCBhIFRpZXIgMyBvcHRpb24gYXMg
d2VsbCAoYW5kIGRpc2FibGUgCnRoZSBydXN0LWJpbiBvcHRpb24gaW4gdGhhdCBjYXNlKS4KCiAg
Tm90ZSBob3dldmVyIHRoYXQgdGhlIHN0ZGxpYiBzdGF0dXMgZm9yIHRoaXMgdGFyZ2V0IGlzIG1h
cmtlZCBhcyAiPyIgb24gWzFdLCAKc28gSSdtIG5vdCBzdXJlIGl0J3MgZXZlciBnb2luZyB0byB3
b3JrLi4uCgoKPiB0aGF0IHRoZXJlIGlzIG5vIGRlcGVuZHMgZXhwcmVzc2lvbnMgYW5kIGl0IGlz
IGFsbCBkZWZhdWx0IGxvZ2ljPyBPcgo+IHdvdWxkIEkgaGF2ZSB0byBzdGlsbCBhZGQgYW5vdGhl
ciBleHByZXNzaW9uIHRoYXQgbWF5YmUgZGVmYXVsdHMgdG8gInkiCj4gaWYgYSBuZXcgdmFyaWFi
bGUgaXMgdHJ1ZSBsaWtlCj4gIkJSMl9FWFRFUk5BTF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JU
UyIgdGhhdCBpcyBkZWZpbmVkIGluIG15Cj4gZXh0ZXJuYWw/CgogIE5vLCB0aGF0J3Mgbm90IGdv
aW5nIHRvIHdvcmsuCgogIEkgdGhpbmsgeW91IGNhbiBtYWtlIGEgaGFjazogYWRkICJzZWxlY3Qg
CkJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMiIHRvIHlvdXIgCkJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfTVlfTVVTTCBkZWZpbml0aW9uLiBJIHRoaW5rIHRoYXQgd29y
a3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPiBUaGFua3MsCj4gSmVzc2UKPiAKPj4KPj4g
IMKgIFJlZ2FyZHMsCj4+ICDCoCBBcm5vdXQKPj4KPj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBKZXNz
ZQo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cj4+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
