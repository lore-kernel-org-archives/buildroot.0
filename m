Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A746AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 14:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E81C60806;
	Sat, 19 Mar 2022 14:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dKAbV357-bB; Sat, 19 Mar 2022 14:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EF36079E;
	Sat, 19 Mar 2022 14:30:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC931BF3A4
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 14:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19B574011A
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 14:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efPu_EYkDAeS for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 14:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F6EB400F2
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 14:30:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v22so1310751wra.2
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3oaz1z8LOYaZIrL4gQMRPWbgZlJ3B7tKVy5AmBvDFPg=;
 b=SQfXU/J28LeFov4eL8UL3Lh1/ptZ7nG7tHTRDzxC8mKv85wKOK+rn6EZb08bns4m3z
 wyQ6mA7gy5lWMQMX9TmkFSNCzZ2iMjgMPfqWHDzvZNMyCF3rJPRvHbUXzqKWbjNGvO+c
 z/y88BexuJvnMQCcWU3cVXrQXhFWxIucR71Oo2rSfUwVpCm9Y+caRN8OJl3tBQzEjBUv
 oq+aZVnG7ns0fImEbryf5rzA7rBoeq0Jcw6rBc2QiH3JS7qyZ5EXIKebGtxt9fR8dIpd
 NRUuTCq0ixHRKh9J1+nGBFBuXgXREUOZ+xY1dUwhZSdjcKrQZgvbUhWeKcECkuzCMJp2
 gP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3oaz1z8LOYaZIrL4gQMRPWbgZlJ3B7tKVy5AmBvDFPg=;
 b=QNFk33FP2ls0EkIdiwUk77Sk43d34cs71qYn0+7VKmvOg9Xx2JSEMcvq6PSdhgNi77
 +B6EXhBFPWAm6Cxc27wFSeLT7UWnw8BM6cnsxZDeqPSNYUf3JCxgKXfwtuc391nqBgas
 SLlxcZULQBggXWfvTFXbXSw6F8TPoDp5i26ubVWBbI0GKra4idJZAjVKwn2lJbAkxQ21
 VL1Np6i0aF6VSEQXgfYimtOmPjY2mgnNiBJ/JCGVAFMCa1KRyo1oy7s9rYH7iSGDwxnL
 Xv2DXuiLU5bTDNhDppTV5uGUFgmMw8wvysS5DODtEAD8xRZC1eXhHsLD/50Y8yC+1Q/2
 YUcw==
X-Gm-Message-State: AOAM530UrhqbHp/f+yB7cOa23/hWlnnuEdTtdPMg1xvvuzykSGhVGdRD
 AHYmiQvug6XBirGikc0w+6U=
X-Google-Smtp-Source: ABdhPJzjyMOnT5U1AYycgGD69q7uW6gWKfmJBvxh6KkwAtW2ADMN7KK3L1Uy/A/LgQcP1iqfAna8Gg==
X-Received: by 2002:adf:f3c8:0:b0:1ed:9cd9:5bf with SMTP id
 g8-20020adff3c8000000b001ed9cd905bfmr12155613wrp.380.1647700218529; 
 Sat, 19 Mar 2022 07:30:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b00380e3225af9sm10251225wms.0.2022.03.19.07.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Mar 2022 07:30:18 -0700 (PDT)
Message-ID: <5902b319-5984-c453-09d3-e0db284f8048@gmail.com>
Date: Sat, 19 Mar 2022 15:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220224154513.220976-1-romain.naour@gmail.com>
 <20220224154513.220976-2-romain.naour@gmail.com>
 <08edbbcf-8be3-4554-0d54-0dd349caa2ff@mind.be>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <08edbbcf-8be3-4554-0d54-0dd349caa2ff@mind.be>
Subject: Re: [Buildroot] [PATCHv2 2/2] package/rust: install rustc and
 rust-std built by Buildroot
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMTIvMDMvMjAyMiDDoCAyMTozNCwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAyNC8wMi8yMDIyIDE2OjQ1LCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IFRoZSB0ZXN0IFRlc3RSdXN0IGlzIGN1cnJlbnRseSBicm9rZW4gd2l0aCByaXBn
cmVwIHBhY2thZ2Ugd2l0aAo+PiB0aGUgZm9sbG93aW5nIGVycm9yOgo+Pgo+PiBlcnJvcltFMDUx
NF06IGZvdW5kIGNyYXRlIGBjb3JlYCBjb21waWxlZCBieSBhbiBpbmNvbXBhdGlibGUgdmVyc2lv
biBvZiBydXN0Ywo+PiDCoMKgIHwKPj4gwqDCoCA9IGhlbHA6IHBsZWFzZSByZWNvbXBpbGUgdGhh
dCBjcmF0ZSB1c2luZyB0aGlzIGNvbXBpbGVyIChydXN0YyAxLjU4LjEpCj4+IChjb25zaWRlciBy
dW5uaW5nIGBjYXJnbyBjbGVhbmAgZmlyc3QpCj4+IMKgwqAgPSBub3RlOiB0aGUgZm9sbG93aW5n
IGNyYXRlIHZlcnNpb25zIHdlcmUgZm91bmQ6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyYXRl
IGBjb3JlYCBjb21waWxlZCBieSBydXN0YyAxLjU4LjEgKGRiOWQxYjIwYiAyMDIyLTAxLTIwKToK
Pj4gVGVzdFJ1c3QvaG9zdC9saWIvcnVzdGxpYi94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvbGli
L2xpYmNvcmUtNmNmY2VjMjM2ZDU3NjYwMy5ybGliCj4+Cj4+Cj4+IGVycm9yW0UwNTE0XTogZm91
bmQgY3JhdGUgYHN0ZGAgY29tcGlsZWQgYnkgYW4gaW5jb21wYXRpYmxlIHZlcnNpb24gb2YgcnVz
dGMKPj4KPj4gVGhlIHByb2JsZW0gaXMgbm90IHJlYWxseSBhIGNyb3NzLWNvbXBpbGF0aW9uIGlz
c3VlICh3ZSBhcmUgYnVpbGRpbmcKPj4gZm9yIGFuIGFybXY3IHRhcmdldCBvbiB4ODZfNjQgaG9z
dCkgYnV0IGEgcHJvYmxlbSB3aXRoIHJ1c3Qtc3RkIGxpYnJhcmllcwo+PiAocmxpYikuCj4+Cj4+
IFdlIGNhbiBub3RpY2UgdGhhdCAicnVzdGMgMS41OC4xIChkYjlkMWIyMGIgMjAyMi0wMS0yMCki
IGlzIHRoZSBzYW1lCj4+IHZlcnNpb24gYXMgdGhlIHByZWJ1aWx0IHJ1c3RjIHVzZWQgdG8gYm9v
dHN0cmFwIHRoZSBidWlsZDoKPj4KPj4gVGVzdFJ1c3QvaG9zdC9iaW4vcnVzdGMgLS12ZXJzaW9u
Cj4+IHJ1c3RjIDEuNTguMQo+Pgo+PiBUZXN0UnVzdEJpbi9ob3N0L2Jpbi9ydXN0YyAtLXZlcnNp
b24KPj4gcnVzdGMgMS41OC4xIChkYjlkMWIyMGIgMjAyMi0wMS0yMCkKPj4KPj4gSW5kZWVkIHdl
IGFyZSB1c2luZyBob3N0LXJ1c3QtYmluIHRvIGJvb3RzdHJhcCB0aGUgaG9zdC1ydXN0IGNvbXBp
bGVyCj4+IHBhY2thZ2UgYnVpbHQgYnkgQnVpbGRyb290LiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRo
ZQo+PiBsaWJjb3JlLTZjZmNlYzIzNmQ1NzY2MDMucmxpYiBmaWxlIGNvbWUgZnJvbSBob3N0LXJ1
c3QtYmluIChydXN0LXN0ZCkKPj4gYW5kIGlzIG5vdCByZW1vdmVkIGJlZm9yZSBpbnN0YWxsaW5n
IGhvc3QtcnVzdCBidWlsdCBieSBCdWlsZHJvb3QuCj4+Cj4+IFdlIGFjdHVhbGx5IHNwZW50IGEg
bG90IG9mIHRpbWUgdG8gYnVpbGQgaG9zdC1ydXN0IHdpdGggcnVzdC1zdGQKPj4gYW5kIGZvcmdl
dCB0byBpbnN0YWxsIHRoaXMgaW1wb3J0YW50IGxpYnJhcnkgSE9TVF9ESVIuCj4+Cj4+IExvb2tp
bmcgYXQgdGhlIGhvc3QtcnVzdCBidWlsZCBkaXJlY3Rvcnkgd2UgY2FuIG5vdGljZSB0d28gaW5z
dGFsbGVyCj4+IHNjcmlwdCAiaW5zdGFsbC5zaCIgKHRoZSBzYW1lIHNjcmlwdHMgdXNlZCB0byBp
bnN0YWxsIGhvc3QtcnVzdC1iaW4pOgo+Pgo+PiBUZXN0UnVzdC9idWlsZC9ob3N0LXJ1c3QtMS41
OC4xL2J1aWxkL3RtcC90YXJiYWxsL3J1c3QveDg2XzY0LXVua25vd24tbGludXgtZ251L3J1c3Qt
MS41OC4xLXg4Nl82NC11bmtub3duLWxpbnV4LWdudS9pbnN0YWxsLnNoCj4+Cj4+IFRlc3RSdXN0
L2J1aWxkL2hvc3QtcnVzdC0xLjU4LjEvYnVpbGQvdG1wL3RhcmJhbGwvcnVzdC1zdGQvYXJtdjct
dW5rbm93bi1saW51eC1nbnVlYWJpaGYvcnVzdC1zdGQtMS41OC4xLWFybXY3LXVua25vd24tbGlu
dXgtZ251ZWFiaWhmL2luc3RhbGwuc2gKPj4KPj4KPj4gVGhlICJ0YXJiYWxsIiBkaXJlY3Rvcnkg
aXMgZ2VuZXJhdGVkIGJ5IHRoZSAicHl0aG9uIHgucHkgZGlzdCIgZHVyaW5nCj4+IHRoZSBpbnN0
YWxsIHN0ZXAsIHdlIGhhdmUgdG8ga2VlcCBpdC4KPj4KPj4gUmVwbGFjZSAicHl0aG9uIHgucHkg
aW5zdGFsbCIgYnkgdGhlc2VzIHR3byBpbnN0YWxsIHNjcmlwdHMuCj4+IEluc3RhbGxpbmcgcnVz
dC1zdGQgd2l0aCB0aGUgaW5zdGFsbC5zaCBzY3JpcHQgcmVwbGFjZSB0aGUgcnVzdC1zdGQKPj4g
bGlicmFyaWVzIGluc3RhbGxlZCBieSBob3N0LXJ1c3QtYmluLgo+IAo+IMKgRXhjZWxsZW50IGRl
c2NyaXB0aW9uLCB0aGFua3MuIEl0J3MgYWxtb3N0IFlhbm4tbGV2ZWwgOi0pCgpXaHkgImFsbW9z
dCI/IHlvdSBtZWFudCBZYW5uLWxldmVsIGJ1dCB3aXRob3V0IHR5cG9zIChraWRkaW5nKSA6KQoK
VGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQsIEl0J3MgaGlnaGx5IGFwcHJlY2lhdGVkLgoKPiAK
Pj4KPj4gRml4ZXM6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2pvYnMvMjExNjIwMjU0NAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+IENjOiBFcmljIExlIEJpaGFuIDxlcmljLmxlLmJpaGFu
LmRldkBmcmVlLmZyPgo+PiAtLS0KPj4gwqAgcGFja2FnZS9ydXN0L3J1c3QubWsgfCAyMyArKysr
KysrKysrKysrKysrKysrKysrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydXN0L3J1c3QubWsg
Yi9wYWNrYWdlL3J1c3QvcnVzdC5tawo+PiBpbmRleCA0NjQ4N2ZlNGI3Li40YTZiMDRkYzhjIDEw
MDY0NAo+PiAtLS0gYS9wYWNrYWdlL3J1c3QvcnVzdC5tawo+PiArKysgYi9wYWNrYWdlL3J1c3Qv
cnVzdC5tawo+PiBAQCAtNjcsOSArNjcsMzAgQEAgZGVmaW5lIEhPU1RfUlVTVF9CVUlMRF9DTURT
Cj4+IMKgwqDCoMKgwqAgY2QgJChARCk7ICQoSE9TVF9NQUtFX0VOVikKPj4gJChIT1NUX0RJUikv
YmluL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKSB4LnB5IGJ1aWxkCj4+IMKgIGVuZGVm
Cj4+IMKgICtIT1NUX1JVU1RfSU5TVEFMTF9DT01NT05fT1BUUyA9IFwKPj4gK8KgwqDCoCAtLXBy
ZWZpeD0kKEhPU1RfRElSKSBcCj4+ICvCoMKgwqAgLS1kaXNhYmxlLWxkY29uZmlnCj4+ICsKPj4g
K0hPU1RfUlVTVF9JTlNUQUxMX09QVFMgPSBcCj4gCj4gwqBUaGlzIHZhcmlhYmxlIGlzIHVzZWQg
b25seSBvbmNlLCB3aGljaCBtYWtlcyBpdCBub3QgdmVyeSB1c2VmdWwuIEkgaW5zdGVhZAo+IGFk
ZGVkIHRoZSAtLWNvbXBvbmVudHMgZGlyZWN0bHkgaW4gSE9TVF9SVVNUX0lOU1RBTExfUlVTVEMu
IEkgYWxzbyByZW5hbWVuZCB0aGUKPiBJTlNUQUxMX0NPTU1PTl9PUFRTIHRvIElOU1RBTExfT1BU
UyBzaW5jZSB0aGVyZSdzIG9ubHkgb25lIHZhcmlhYmxlIG5vdy4KPiAKPj4gK8KgwqDCoCAkKEhP
U1RfUlVTVF9JTlNUQUxMX0NPTU1PTl9PUFRTKSBcCj4+ICvCoMKgwqAgLS1jb21wb25lbnRzPXJ1
c3RjLGNhcmdvLHJ1c3Qtc3RkLSQoUlVTVENfSE9TVF9OQU1FKQo+PiArCj4+ICtkZWZpbmUgSE9T
VF9SVVNUX0lOU1RBTExfUlVTVEMKPj4gK8KgwqDCoCAoY2QKPj4gJChARCkvYnVpbGQvdG1wL3Rh
cmJhbGwvcnVzdC8kKFJVU1RDX0hPU1RfTkFNRSkvcnVzdC0kKFJVU1RfVkVSU0lPTiktJChSVVNU
Q19IT1NUX05BTUUpOwo+PiBcCj4gCj4gwqBUaGUgcGFyZW50aGVzaXMgYXJlIG5vdCBuZWNlc3Nh
cnkgLSBtYWtlIGFscmVhZHkgc3RhcnRzIGEgc3ViLXNoZWxsIGZvciBldmVyeQo+IGxpbmUsIHRo
ZXJlJ3Mgbm8gbmVlZCB0byBhZGQgYW5vdGhlciBzaGVsbCBsZXZlbC4gV2Ugc3RpbGwgaGF2ZSB0
aGVtIGluIGEgbG90IG9mCj4gLm1rIGZpbGVzLCBidXQgd2UgdHJ5IHRvIGF2b2lkIGFkZGluZyB0
aGVtLgoKT2sKCj4gCj4gCj4gwqBBcHBsaWVkIHRvIG1hc3RlciB3aXRoIHRob3NlIHR3byBjaGFu
Z2VzLCB0aGFua3MuCgpUaGFua3MhCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiDCoFJlZ2Fy
ZHMsCj4gwqBBcm5vdXQKPiAKPj4gK8KgwqDCoMKgwqDCoMKgIC4vaW5zdGFsbC5zaCAkKEhPU1Rf
UlVTVF9JTlNUQUxMX09QVFMpKQo+PiArZW5kZWYKPj4gKwo+PiAraWZlcSAoJChCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTKSx5KQo+PiArZGVmaW5lIEhPU1RfUlVT
VF9JTlNUQUxMX0xJQlNURF9UQVJHRVQKPj4gK8KgwqDCoCAoY2QKPj4gJChARCkvYnVpbGQvdG1w
L3RhcmJhbGwvcnVzdC1zdGQvJChSVVNUQ19UQVJHRVRfTkFNRSkvcnVzdC1zdGQtJChSVVNUX1ZF
UlNJT04pLSQoUlVTVENfVEFSR0VUX05BTUUpOwo+PiBcCj4+ICvCoMKgwqDCoMKgwqDCoCAuL2lu
c3RhbGwuc2ggJChIT1NUX1JVU1RfSU5TVEFMTF9DT01NT05fT1BUUykpCj4+ICtlbmRlZgo+PiAr
ZW5kaWYKPj4gKwo+PiDCoCBkZWZpbmUgSE9TVF9SVVNUX0lOU1RBTExfQ01EUwo+PiDCoMKgwqDC
oMKgIGNkICQoQEQpOyAkKEhPU1RfTUFLRV9FTlYpCj4+ICQoSE9TVF9ESVIpL2Jpbi9weXRob24k
KFBZVEhPTjNfVkVSU0lPTl9NQUpPUikgeC5weSBkaXN0Cj4+IC3CoMKgwqAgY2QgJChARCk7ICQo
SE9TVF9NQUtFX0VOVikgJChIT1NUX0RJUikvYmluL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01B
Sk9SKQo+PiB4LnB5IGluc3RhbGwKPj4gK8KgwqDCoCAkKEhPU1RfUlVTVF9JTlNUQUxMX1JVU1RD
KQo+PiArwqDCoMKgICQoSE9TVF9SVVNUX0lOU1RBTExfTElCU1REX1RBUkdFVCkKPj4gwqAgZW5k
ZWYKPj4gwqAgwqAgJChldmFsICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
