Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323CFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 11:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBBCB81777;
	Sat,  8 Jan 2022 11:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IaxTWzmnAizn; Sat,  8 Jan 2022 11:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DEFA81656;
	Sat,  8 Jan 2022 11:20:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 687E91BF34E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 566DA42890
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZ_2wR-WuGcs for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 11:20:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9201410BB
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 11:20:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l25so5357256wrb.13
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 03:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/peArajmxOo2WajKSuyp6QuU/gpGC7neVmuSvyWWKH0=;
 b=SVJSZ4TTDgBsoV5pyUpcRXi4eQGGmxxnm0YNkb+8tElG9aq2zGQiNzdNwe3l2O0xAF
 DU5VodLIIkAZ1aMc8JKmKnEqTMPy3uKh8mazgQCkA4euIPqUrmhyCwc4WfvMlkI0EeDC
 HGM+X24veuRDPxwHJ49RqSsC5L46fywWPC5fpCepMDZZXs8BTbP374Zvg8yYJKY8n8jN
 5a7TFrFKFS7GyTsEJi/uVmm5GHSrJnBxENQojvPomLBHtAyLyRDp5bRC/SBbbvgYNKY/
 l4TkYIvvt2eZ461vVeUoUVR/UQll4kS2eBQ6larrKXz0rDaAW+32OPfHo88ZpkZOXx4n
 6jHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/peArajmxOo2WajKSuyp6QuU/gpGC7neVmuSvyWWKH0=;
 b=t2nqkLGzcXoUM26y11yuglB15dROBdoQjnrdvOvnxQBcxsCSE0kxGpw4f7zjSLQA0o
 t7FlmhZ/Qx22NSJxow6248S0ge2vfEpWPBFWx8SdTwo8Do0773zlkS9/UPEBa9pYxgIq
 pAh31iszBggVFDnE8/6lpnbMny/yAwpXaEefp1tqEYopW+JtkLI1nbPeIcVrXZyppv+2
 ZO3SW/iK1vBN+gVsZaBsL0nLC+00HcOKSsCQ/Ey3i5D8BFyrCEcgj3IIfkp9PvMlgFC0
 cOq0KzhLKI1sdRMXppxUXDVf6VIA9pw/ciN2FscX852FIOIJWTvgYeuVOte9rajkxbnX
 1JcA==
X-Gm-Message-State: AOAM533fvs465qUEaikahv/Z7gn8wTUXQgLZVWrW9tOSD9L2jha89jsE
 HRSCnN/oVep6yr7r6iniXyEzpg==
X-Google-Smtp-Source: ABdhPJxrSu0QEkIf6r6TS/40oWFejyjH/Nf6ATuuuBEV1qE8MGeHiAf9KsPgQLXZeDZc2lixdVjA9Q==
X-Received: by 2002:a05:6000:1210:: with SMTP id
 e16mr8989414wrx.434.1641640802914; 
 Sat, 08 Jan 2022 03:20:02 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id s1sm1319597wmh.35.2022.01.08.03.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 03:20:02 -0800 (PST)
Message-ID: <c4ba627e-921f-396b-3ae4-685e7da39f5e@smile.fr>
Date: Sat, 8 Jan 2022 12:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20201126144722.502163-1-nolange79@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20201126144722.502163-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/systemd: invoke
 systemd-tmpfilesd on final image
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjYvMTEvMjAyMCDDoCAxNTo0NywgTm9yYmVydCBMYW5nZSBhIMOpY3JpdMKgOgo+IEVzcGVj
aWFsbHkgZm9yIHJlYWQtb25seSBmaWxlc3lzdGVtcyBpdCBpcyBoZWxwZnVsbCB0bwo+IHByZS1j
cmVhdGUgYWxsIGZvbGRlcnMgZm9yIG5vbi12b2xhdGlsZSBwYXRocy4KPiAKPiBUaGlzIG5lZWRz
IHRvIHJ1biB1bmRlciBmYWtlcm9vdCB0byBhbGxvdyBzZXR0aW5nCj4gdWlkcy9naWRzL3Blcm1z
IGZvciB0aGUgdGFyZ2V0IGZzLgo+IAo+IEFzIHN5c3RlbWQtdG1wZmlsZXNkIGFsc28gc3VwcG9y
dHMgc3BlY2lmaWVycywgYnV0IHNvIGZhcgo+IG9ubHkgcmVzb2x2ZXMgdGhvc2UgZnJvbSB0aGUg
aG9zdCwgaXQgaXMgbmVjZXNzYXJ5Cj4gdG8gc3BlY2lhbGx5IGhhbmRsZSBlbnRyaWVzIHRoYXQg
Y29udGFpbiBwcm9ibGVtYXRpYwo+IHNwZWNpZmllcnMuCj4gCj4gRW50cmllcyBjb250YWluaW5n
IHByb2JsZW1hdGljIHNwZWNpZmllcnMgYXJlIGVpdGhlciBza2lwcGVkLAo+IGJ1dCBpbiBzb21l
IGNhc2VzIGl0cyBwb3NzaWJsZSB0byBpbnN0ZWFkIG1hbnVhbGx5IHJlcGxhY2UKPiB0aGVtIHdp
dGggY29ycmVjdCByZXBsYWNlbWVudHMgZnJvbSB0aGUgdGFyZ2V0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+Cj4gLS0tCj4gdjEtPnYyCj4g
KiAgIGFkZCBhIHNjcmlwdCB0byBza2lwL2hhbmRsZSBzcGVjaWZpZXJzIHRoYXQgbWlnaHQKPiAg
ICAgb3RoZXJ3aXNlIHRha2UgaW5mb3JtYXRpb24gZnJvbSB0aGUgaG9zdAo+IAo+IHBhY2thZ2Uv
c3lzdGVtZDogdG1wZmlsZXN2Mgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTGFuZ2UgPG5v
bGFuZ2U3OUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uvc3lzdGVtZC9mYWtlcm9vdF90bXBm
aWxlcy5zaCB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS9zeXN0
ZW1kL3N5c3RlbWQubWsgICAgICAgICAgIHwgIDkgKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3N5c3RlbWQvZmFrZXJvb3RfdG1wZmlsZXMuc2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9zeXN0ZW1kL2Zha2Vyb290X3RtcGZpbGVzLnNoIGIvcGFja2FnZS9zeXN0ZW1kL2Zha2Vyb290
X3RtcGZpbGVzLnNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5m
NWU0ZmIyMzRjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9mYWtlcm9v
dF90bXBmaWxlcy5zaAo+IEBAIC0wLDAgKzEsNjYgQEAKPiArIyEvYmluL3NoCj4gKyMKPiArIyB1
bnRpbCBhIHNvbHV0aW9uIGxpa2UgWzFdIGlzIHVwc3RyZWFtZWQsCj4gKyMgaXRzIG5lY2Vzc2Fy
eSB0byBtYXNrIG91dCBzcGVjcyB3aGljaCB3aWxsIGluZmVyIHByb3BlcnRpZXMKPiArIyBmcm9t
IHRoZSBob3N0Lgo+ICsjCj4gKyMgVE1QRElSPSBURU1QPSBUTVA9ICBtYWtlcyBzdXJlICVUIGFu
ZCAlViBhcmUgc2V0IHRvIHRoZSBkZWZhdWx0Cj4gKyMKPiArIyBzaGVsbCBleHBhbnNpb24gaXMg
Y3JpdGljYWwgdG8gYmUgUE9TSVggY29tcGxpYW50LAo+ICsjIHRoaXMgc2NyaXB0IHdvbnQgd29y
ayB3aXRoIHpzaCBpbiBpdHMgZGVmYXVsdCBtb2RlIGZvciBleGFtcGxlLgo+ICsjCj4gKyMgVGhl
IHNjcmlwdCB0YWtlcyBldmVyYWwgbWVhc3VyZXMgdG8gaGFuZGxlIG1vcmUgY29tcGxleCBzdHVm
Zgo+ICsjIGxpa2UgcGFzc2luZyB0aGlzIGNvcnJlY3RseToKPiArIyBmKyAgIi92YXIvZXhhbXBs
ZSIgLSAtIC0gLSAlQlxuJW9cbiV3XG4lVyUlXG4KPiArIwo+ICsjIFsxXSAtIGh0dHBzOi8vZ2l0
aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzE2MTgzCgpJdCBzZWVtcyB0aGF0IHN5c3Rl
bWQgbm93IGluY2x1ZGUgd2hhdCB5b3UgbmVlZCBzaW5jZSB2ZXJzaW9uIDI0OSBjb250YWluaW5n
IHRoZQpjb21taXQgWzFdLgoKVGhlIGZha2Vyb290X3RtcGZpbGVzLnNoIHNjcmlwdCBzZWVtcyBu
b3QgbmVjZWVzYXJ5IGFueW1vcmUuCgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lz
dGVtZC9jb21taXQvZGU2MWEwNGIxODhmODFhODVjZGI1YzY0ZGRiNDk4N2RjZDlkMzBkMwoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+ICsKPiArWyAtbiAiJHtIT1NUX1NZU1RFTURfVE1QRklMRVMt
fSIgXSB8fAo+ICsgIEhPU1RfU1lTVEVNRF9UTVBGSUxFUz1zeXN0ZW1kLXRtcGZpbGVzCj4gKwo+
ICtbIC1uICIkezEtfSIgLWEgLWQgIiR7MS19Ii91c3IvbGliL3RtcGZpbGVzLmQgXSB8fAo+ICsg
IHsgZWNobyAxPiYyICIkMDogbmVlZCBST09URlMgYXJndW1lbnQiOyBleGl0IDE7IH0KPiArCj4g
KyMgcmVhZCBPUyBzcGVjaWZpYyB2YXJpYWJsZXMgZnJvbSBmaWxlLAo+ICsjIGJ1aWxkcm9vdCBh
bHJlYWR5IHdyb3RlIHRoaXMgaW4gdGFyZ2V0LWZpbmFsaXplLAo+ICsjIHVzZXJzIG1pZ2h0IHJl
cGxhY2UgaXQgYnkgdXNpbmcgYW4gb3ZlcmxheQo+ICtCVUlMRF9JRD07IElEPTsgVkVSU0lPTl9J
RD07IFZBUklBTlRfSUQ9Owo+ICtmb3IgZiBpbiAvZXRjL29zLXJlbGVhc2UgL3Vzci9saWIvb3Mt
cmVsZWFzZTsgZG8KPiArICAjIGRvbnQgYmxpbmRseSBzZXQgYWxsIHZhcmlhYmxlcywgb25seSBw
aWNrIHRoZSBvbmVzIHdlIG5lZWQKPiArICBbIC1yICIkMSIvJGYgXSAmJgo+ICsgICAgZXZhbCAi
JChzZWQgLW4gLWUgJy9eQlVJTERfSUQ9L3AnIC1lICcvXklEPS9wJyAtZSAnL15WRVJTSU9OX0lE
PS9wJyAtZSAnL15WQVJJQU5UX0lEPS9wJyAiJDEiLyRmKSIgJiYKPiArICAgICAgYnJlYWsKPiAr
ZG9uZQo+ICsKPiArJHtIT1NUX1NZU1RFTURfVE1QRklMRVN9IC0tbm8tcGFnZXIgLS1jYXQtY29u
ZmlnIC0tcm9vdD0iJDEiIHwKPiArICBzZWQgLWUgJy9eW1s6c3BhY2U6XV0qIy9kJyAtZSAncyxe
W1s6c3BhY2U6XV0qLCwnIC1lICcvXiQvZCcgfAo+ICsgICAgd2hpbGUgcmVhZCAtciBsaW5lOyBk
bwo+ICsgICAgICAjIGl0IGlzIGFsbG93ZWQgdG8gdXNlIHF1b3RlcyBhcm91bmQgYXJndW1lbnRz
LAo+ICsgICAgICAjIHNvIGxldCB0aGUgc2hlbGwgcGFjayB0aGUgYXJndW1lbnRzCj4gKyAgICAg
IGV2YWwgInNldCAtLSAkbGluZSIKPiArCj4gKyAgICAgICMgZG9udCBvdXRwdXQgd2FybmluZ3Mg
Zm9yIGRpcmVjdG9yaWVzIHdlIGRvbnQgcHJvY2Vzcwo+ICsgICAgICBbICIkezIjL2Rldn0iID0g
IiR7Mn0iIF0gJiYgWyAiJHsyIy9kZXZ9IiA9ICIkezJ9IiBdICYmCj4gKyAgICAgICAgWyAiJHsy
Iy9ydW59IiA9ICIkezJ9IiBdICYmIFsgIiR7MiMvc3lzfSIgPSAiJHsyfSIgXSAmJgo+ICsgICAg
ICAgIFsgIiR7MiMvdG1wfSIgPSAiJHsyfSIgXSAmJiBbICIkezIjL21udH0iID0gIiR7Mn0iIF0g
fHwKPiArICAgICAgICAgIGNvbnRpbnVlCj4gKwo+ICsgICAgICAjIGJsYW5rIG91dCBhbGwgc3Bl
Y3MgdGhhdCBhcmUgb2sgdG8gdXNlLAo+ICsgICAgICAjIHRlc3QgaWYgc29tZSByZW1haW4KPiAr
ICAgICAgaWYgZWNobyAiJDIgJHs3LX0iIHwgc2VkIC1lICdzLCVbJUNoTFN0VGdHdVVWXSwsZycg
fCBncmVwIC12IC1xICclJzsgdGhlbgo+ICsgICAgICAgICMgbm8gImJhZCIgc3BlY2lmaWVycywg
cGFzcyB0aGUgbGluZSB1bm1vZGlmaWVkCj4gKyAgICAgICAgZXZhbCAicHJpbnRmICclc1xuJyAn
JGxpbmUnIgo+ICsgICAgICBlbGlmIGVjaG8gIiQyICR7Ny19IiB8IHNlZCAtZSAncywlWyVDaExT
dFRnR3VVVkJvd1ddLCxnJyB8IGdyZXAgLXYgLXEgJyUnOyB0aGVuCj4gKyAgICAgICAgIyBzb21l
dGhpbmcgd2UgY2FuIGZpeAo+ICsgICAgICAgIGV2YWwgInByaW50ZiAnJXNcbicgJyRsaW5lJyIg
fAo+ICsgICAgICAgICAgc2VkIC1lICJzIyVCIyRCVUlMRF9JRCNnIiAtZSAicyMlbyMkSUQjZyIg
LWUgInMjJXcjJFZFUlNJT05fSUQjZyIgLWUgInMjJVcjJFZBUklBTlRfSUQjZyIKPiArICAgICAg
ZWxzZQo+ICsgICAgICAgICMgd2Fybgo+ICsgICAgICAgIGV2YWwgInByaW50ZiAnaWdub3JlZCBz
cGVjOiAlc1xuJyAnJGxpbmUnIDE+JjIiCj4gKyAgICAgIGZpCj4gKyAgICBkb25lIHwKPiArXAo+
ICtUTVBESVI9IFRFTVA9IFRNUD0gJHtIT1NUX1NZU1RFTURfVE1QRklMRVN9IC0tY3JlYXRlIC0t
Ym9vdCAtLXJvb3Q9IiQxIiBcCj4gKyAgLS1leGNsdWRlLXByZWZpeD0vZGV2IC0tZXhjbHVkZS1w
cmVmaXg9L3Byb2MgLS1leGNsdWRlLXByZWZpeD0vcnVuIC0tZXhjbHVkZS1wcmVmaXg9L3N5cyBc
Cj4gKyAgLS1leGNsdWRlLXByZWZpeD0vdG1wIC0tZXhjbHVkZS1wcmVmaXg9L21udCBcCj4gKyAg
LQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayBiL3BhY2thZ2Uvc3lz
dGVtZC9zeXN0ZW1kLm1rCj4gaW5kZXggYWU5OWMwMmFiZi4uNjI5ZjQwMjJkNyAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9z
eXN0ZW1kLm1rCj4gQEAgLTY1NCwxMCArNjU0LDE1IEBAIGVuZGVmCj4gIAo+ICBTWVNURU1EX1JP
T1RGU19QUkVfQ01EX0hPT0tTICs9IFNZU1RFTURfUk1fQ0FUQUxPR19VUERBVEVfU0VSVklDRQo+
ICAKPiArZGVmaW5lIFNZU1RFTURfQ1JFQVRFX1RNUEZJTEVTX0hPT0sKPiArCUhPU1RfU1lTVEVN
RF9UTVBGSUxFUz0kKEhPU1RfRElSKS9iaW4vc3lzdGVtZC10bXBmaWxlcyBcCj4gKwkJL2Jpbi9z
aCAkKFNZU1RFTURfUEtHRElSKS9mYWtlcm9vdF90bXBmaWxlcy5zaCAkKFRBUkdFVF9ESVIpCj4g
K2VuZGVmCj4gKwo+ICBkZWZpbmUgU1lTVEVNRF9QUkVTRVRfQUxMCj4gIAkkKEhPU1RfRElSKS9i
aW4vc3lzdGVtY3RsIC0tcm9vdD0kKFRBUkdFVF9ESVIpIHByZXNldC1hbGwKPiAgZW5kZWYKPiAt
U1lTVEVNRF9ST09URlNfUFJFX0NNRF9IT09LUyArPSBTWVNURU1EX1BSRVNFVF9BTEwKPiArU1lT
VEVNRF9ST09URlNfUFJFX0NNRF9IT09LUyArPSBTWVNURU1EX0NSRUFURV9UTVBGSUxFU19IT09L
IFNZU1RFTURfUFJFU0VUX0FMTAo+ICAKPiAgU1lTVEVNRF9DT05GX0VOViA9ICQoSE9TVF9VVEY4
X0xPQ0FMRV9FTlYpCj4gIFNZU1RFTURfTklOSkFfRU5WID0gJChIT1NUX1VURjhfTE9DQUxFX0VO
VikKPiBAQCAtNzE3LDcgKzcyMiw3IEBAIEhPU1RfU1lTVEVNRF9DT05GX09QVFMgPSBcCj4gIAkt
RHZjb25zb2xlPWZhbHNlIFwKPiAgCS1EcXVvdGFjaGVjaz1mYWxzZSBcCj4gIAktRHN5c3VzZXJz
PWZhbHNlIFwKPiAtCS1EdG1wZmlsZXM9ZmFsc2UgXAo+ICsJLUR0bXBmaWxlcz10cnVlIFwKPiAg
CS1EaW1wb3J0ZD1mYWxzZSBcCj4gIAktRGh3ZGI9ZmFsc2UgXAo+ICAJLURyZmtpbGw9ZmFsc2Ug
XAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
