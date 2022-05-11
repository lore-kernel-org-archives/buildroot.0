Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1698C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 17:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7951583E7C;
	Wed, 11 May 2022 17:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXTLd1CrIZTI; Wed, 11 May 2022 17:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451FB83E79;
	Wed, 11 May 2022 17:25:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE7C11BF402
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD73783E79
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIKATDQclMOB for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 17:25:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BDC683E78
 for <buildroot@buildroot.org>; Wed, 11 May 2022 17:25:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id j6so5395389ejc.13
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y3hK50yGfDKxwas0fka/PeEaDqCPwauPhCz6hHCels4=;
 b=cSTe+kaQkHAKlqbihtoOtaXDYf0FEVbJ4RT00BQBYkfAGveEPxwOtIsbdok6v0Ytt5
 oGNQ/gxiI/VHZW9F/f7wx7XSMNyd78Zi9mfxmCNSvyhu8FUrySp2Fr9Widqo42Q90QrG
 Y2RUag0RuzWLaiveSGaUkOyluU77lBM0aHab0s0ivnYA9uIWZycjOxL6+mi2T82vl37K
 1nVNhXMXq0Kk8hVMQ8sPnp27gzyYRTIBhiK6e4mHrid5VvfEmf+iaIQUBmSnhC6Z11oa
 4PjnwrhUn5VTXwh/c8Ph8dZ05vmpV0XU864FdZygIqRCOZ+QF68lcXUgviNivQ/dsXOZ
 K1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y3hK50yGfDKxwas0fka/PeEaDqCPwauPhCz6hHCels4=;
 b=y9Dupvq1LbNLagZ3Hv7rkQLmYmaCZsSOwc1FRNbInoDyWZFlPu6isoIRc4UCeVZy45
 ulOTE1RgYY1PKWE2EDfiGQaY1n8iaeCWKvxsYVSOgPGs/mRH8n5HxKy6AT3Ki7jPXJBK
 w/Ocsoi89EFyBEXaSdboo0hX38t/UCDhbaFdEEMoGZd+le/njSzfrL/5gUmtBJ8s2tXR
 vsIseqVUpQ3XzWATOGPsYFvcOLM+4DUWqiPk/Q1640xJo8LMuFVdQQaDhz70Ew+gxlzF
 T7IrHlJBLcKofj3kDQp+Dl42TPgcRnqKVbMAv2x1FqjjdNBCDD1JHcZuw9fJSkyGLMRW
 80ew==
X-Gm-Message-State: AOAM5314gCFk6rDXbzYGcXwA8HyUf3T1sEsE5umSN3s/4LPuxY8+gKON
 r465Y1dkubMuxK6DVVqAYzsjXA==
X-Google-Smtp-Source: ABdhPJzoXo4AN6jnTgl4pK6iMpLqvgt3QLw/HmBHpLtO0bSqScdEeAo9AeoM+/knmEjY+dKLJSEguA==
X-Received: by 2002:a17:906:3042:b0:6cd:20ed:7c5c with SMTP id
 d2-20020a170906304200b006cd20ed7c5cmr25360298ejd.241.1652289929671; 
 Wed, 11 May 2022 10:25:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05640250cc00b0042617ba63d5sm1495120edb.95.2022.05.11.10.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:25:29 -0700 (PDT)
Message-ID: <82cf5720-62f9-c150-2e5f-33c91adc649e@mind.be>
Date: Wed, 11 May 2022 19:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220510003116.336797-1-james.hilliard1@gmail.com>
 <20220510003116.336797-2-james.hilliard1@gmail.com>
 <123fec62-0841-8dff-9da6-61f2cc9614d3@mind.be>
 <CADvTj4pdG9Uk6UaWHkgAVjex3Ef7L2yvH8rN4MMoFeKn_dPjrg@mail.gmail.com>
 <28117893-5851-4b56-b4d3-5ec5ec36ac54@threespeedlogic.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <28117893-5851-4b56-b4d3-5ec5ec36ac54@threespeedlogic.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-orjson: bump to
 version 3.6.8
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMS8wNS8yMDIyIDE5OjE3LCBHcmFlbWUgU21lY2hlciB3cm90ZToKPiBIaSBKYW1lcyBh
bmQgQXJub3V0LAo+IAo+IE9uIDIwMjItMDUtMTAgMTM6MDMsIEphbWVzIEhpbGxpYXJkIHdyb3Rl
Ogo+PiBPbiBUdWUsIE1heSAxMCwgMjAyMiBhdCAxOjAxIFBNIEFybm91dCBWYW5kZWNhcHBlbGxl
IDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4+Pgo+Pj4KPj4+Cj4+PiBPbiAxMC8wNS8yMDIyIDAy
OjMxLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4+PiBDb252ZXJ0IHBhY2thZ2UgdG8gdXNlIHB5
dGhvbiBpbmZyYXN0cnVjdHVyZSBpbnN0ZWFkIG9mIGNhcmdvCj4+Pj4gaW5mcmFzdHJ1Y3R1cmUu
Cj4+Pgo+Pj4gwqDCoCBBRkFJVSwgbWF0dXJpbiB3YXMgYWxyZWFkeSBhdmFpbGFibGUgaW4gMy42
LjcsIHNvIHRoZSBjb252ZXJzaW9uIHNob3VsZCBiZQo+Pj4gc2VwYXJhdGUgZnJvbSB0aGUgYnVt
cC4KPj4KPj4gSSBtb3N0bHkgZGlkIGl0IGF0IHRoZSBzYW1lIHRpbWUgdG8gYXZvaWQgYW55IHBv
dGVudGlhbCBjb25mbGljdHMvY29uZnVzaW9uCj4+IHdpdGggbWlycm9yZWQgYXNzZXRzLgo+Pgo+
Pj4KPj4+IMKgwqAgVGhhdCBzYWlkLCBJIHRoaW5rIEdyYWVtZSBpbnRlbnRpb25hbGx5IGRpZCBu
b3QgdXNlIG1hdHVyaW4gYmVjYXVzZSBpdCAKPj4+IGRvZXNuJ3QKPj4+IHJlYWxseSBvZmZlciBt
dWNoIGJlbmVmaXQgb3ZlciBjYWxsaW5nIGNhcmdvIGRpcmVjdGx5LiBEbyB5b3UgaGF2ZSBhIHJl
YXNvbiB0bwo+Pj4gcHJlZmVyIHVzaW5nIG1hdHVyaW4/Cj4+Cj4+IEl0IHNob3VsZCBiZSBtb3Jl
IGNvcnJlY3QsIEkgbWVhbiBjYWxsaW5nIGNhcmdvIGRpcmVjdGx5IGRvZXNuJ3QgcmVhbGx5IHBy
b3Blcmx5Cj4+IGluc3RhbGwgc2F5IHB1cmUgcHl0aG9uIGZpbGVzIGFuZCBpcyBtb3JlIGxpa2Vs
eSB0byBicmVhayBpbiB3ZWlyZCB3YXlzLgo+IAo+IFRoZSBweXRob24tbWF0dXJpbiBwYWNrYWdl
IHdhc24ndCBhdmFpbGFibGUgd2hlbiBJIGluaXRpYWxseSBwYWNrYWdlZCBvcmpzb24gCj4gKDMu
Ni43KS4KPiAKPiBJIHN1c3BlY3QgaWYgdGhpcyBwYXRjaCB3b3JrcywgdGhlbiBzaGlmdGluZyBw
eXRob24tb3Jqc29uIHRvIHB5dGhvbi1tYXR1cmluIAo+IHdpbGwgYmUgbGVzcyBicml0dGxlIChv
ciwgYnJpdHRsZSBpbiB3YXlzIHRoYXQgYXJlIGxlc3MgaXNvbGF0ZWQpIHRoYW4gdGhlIAo+IGN1
cnJlbnQgbWF0dXJpbiBieXBhc3MuCj4gCj4gSWYgdGhlIGV4dHJhIGluZm9ybWF0aW9uIHdvdWxk
IGJlIGhlbHBmdWwsIEkgY2FuIGdpdmUgdGhpcyBweXRob24tbWF0dXJpbiAKPiBhcHByb2FjaCBh
IHRyeSBhbmQgc2VlIGlmIGl0IHdvcmtzIGluIG15IGFwcGxpY2F0aW9uLgoKICBZZXMgcGxlYXNl
ISBJZiBpdCdzIGdvb2QsIHRoZW4gcGxlYXNlIGFkZCB5b3VyIFRlc3RlZC1ieSB0byB0aGUgZmly
c3QgcGF0Y2ggaW4gCnRoaXMgc2VyaWVzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBiZXN0
LAo+IEdyYWVtZQo+IAo+Pgo+Pj4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxp
YXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgwqAgcGFja2Fn
ZS9weXRob24tb3Jqc29uL3B5dGhvbi1vcmpzb24uaGFzaCB8wqAgNSArKystLQo+Pj4+IMKgwqAg
cGFja2FnZS9weXRob24tb3Jqc29uL3B5dGhvbi1vcmpzb24ubWvCoMKgIHwgMjQgKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCj4+Pj4gwqDCoCAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDE0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LW9yanNvbi9weXRob24tb3Jqc29uLmhhc2ggCj4+Pj4gYi9wYWNrYWdlL3B5dGhvbi1vcmpzb24v
cHl0aG9uLW9yanNvbi5oYXNoCj4+Pj4gaW5kZXggNWVmMjcyNmQ4Mi4uMDZjYzVjYWU3OSAxMDA2
NDQKPj4+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1vcmpzb24vcHl0aG9uLW9yanNvbi5oYXNoCj4+
Pj4gKysrIGIvcGFja2FnZS9weXRob24tb3Jqc29uL3B5dGhvbi1vcmpzb24uaGFzaAo+Pj4+IEBA
IC0xLDQgKzEsNSBAQAo+Pj4+IC0jIExvY2FsbHkgY2FsY3VsYXRlZAo+Pj4+IC1zaGEyNTbCoCA0
NzEzYjEyMGFkODZiMWIyNzNmNTk1MmNiZjk1NzhjMTNkMGY0NTMwNjRiZDI2ZDgyM2UwNGExMGM4
NDgyNGU2ICAKPj4+PiBweXRob24tb3Jqc29uLTMuNi43LnRhci5nego+Pj4+ICsjIExvY2FsbHkg
Y2FsY3VsYXRlZCBhZnRlciB2ZW5kb3JpbmcKPj4+PiArc2hhMjU2wqAgNDBiOTU1NzZiODE5MTZk
MTY3ZjdhNDQ4Mjk0MDFhY2IzYjZjYmJmZTk4NDBiNWVkODhjOTUzNWE4NjUwN2Q3YiAgCj4+Pj4g
b3Jqc29uLTMuNi44LnRhci5nego+Pj4+ICsjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNr
c3Vtcwo+Pj4+IMKgwqAgc2hhMjU2wqAgYTYwZWVhODE3NTE0NTMxNjY4ZDdlMDA3NjU3MzE0NDlm
ZTE0ZDA1OWQzMjQ5ZTBiYzkzYjM2ZGU0NWY3NTlmMiAgCj4+Pj4gTElDRU5TRS1BUEFDSEUKPj4+
PiDCoMKgIHNoYTI1NsKgIDIzZjE4ZTAzZGM0OWRmOTE2MjJmZTJhNzYxNzY0OTc0MDRlNDZjZWQ4
YTcxNWQ5ZDJiNjdhNzQ0NjU3MWNjYTMgIAo+Pj4+IExJQ0VOU0UtTUlUCj4+Pj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLW9yanNvbi9weXRob24tb3Jqc29uLm1rIAo+Pj4+IGIvcGFja2Fn
ZS9weXRob24tb3Jqc29uL3B5dGhvbi1vcmpzb24ubWsKPj4+PiBpbmRleCA1ZGU0YjJjNWZhLi5j
Y2JhZjM3YzZkIDEwMDY0NAo+Pj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLW9yanNvbi9weXRob24t
b3Jqc29uLm1rCj4+Pj4gKysrIGIvcGFja2FnZS9weXRob24tb3Jqc29uL3B5dGhvbi1vcmpzb24u
bWsKPj4+PiBAQCAtNCwxOSArNCwxOSBAQAo+Pj4+IMKgwqAgIwo+Pj4+ICAgIAo+Pj4+ICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIAo+Pj4+Cj4+Pj4KPj4+PiAtUFlUSE9OX09SSlNPTl9WRVJTSU9O
ID0gMy42LjcKPj4+PiAtUFlUSE9OX09SSlNPTl9TSVRFID0gJChjYWxsIGdpdGh1Yixpamwsb3Jq
c29uLCQoUFlUSE9OX09SSlNPTl9WRVJTSU9OKSkKPj4+PiArUFlUSE9OX09SSlNPTl9WRVJTSU9O
ID0gMy42LjgKPj4+PiArUFlUSE9OX09SSlNPTl9TT1VSQ0UgPSBvcmpzb24tJChQWVRIT05fT1JK
U09OX1ZFUlNJT04pLnRhci5nego+Pj4+ICtQWVRIT05fT1JKU09OX1NJVEUgPSAKPj4+PiBodHRw
czovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMTQvOGUvN2U3NDVkODY3NDY2YmRh
ZmIxMmFiN2IwMTc5ZDQwZjIzZjU1NjM5ZjdjZDE0YmQzNzVhY2ZhNzRhY2EyIAo+Pj4+Cj4+Pgo+
Pj4gwqDCoCBLaW5kIG9mIGFuIGFzaWRlLCBzaW5jZSB0aGlzIGFwcGxpZXMgdG8gbWFueSBvdGhl
ciBwYWNrYWdlczogaXMgdGhlcmUgYSAKPj4+IHJlYXNvbgo+Pj4gd2UgcHJlZmVyIHRvIGdldCBQ
eXRob24gcGFja2FnZXMgZnJvbSBweXBpIHJhdGhlciB0aGFuIHRoZSB1cHN0cmVhbSBzb3VyY2Ug
Cj4+PiBpdHNlbGY/Cj4+Cj4+IFRoZXNlIGFyZSBzZGlzdCdzKHJlbGVhc2UgdGFyYmFsbCBlcXVp
dmFsZW50cyBmb3IgcHl0aG9uIHBhY2thZ2VzKQo+PiB3aGlsZSB1cHN0cmVhbQo+PiBzb3VyY2Ug
aXMgbm90Lgo+Pgo+Pj4KPj4+PiArUFlUSE9OX09SSlNPTl9TRVRVUF9UWVBFID0gcGVwNTE3Cj4+
Pj4gwqDCoCBQWVRIT05fT1JKU09OX0xJQ0VOU0UgPSBBcGFjaGUtMi4wIG9yIE1JVAo+Pj4+IMKg
wqAgUFlUSE9OX09SSlNPTl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS1BUEFDSEUgTElDRU5TRS1N
SVQKPj4+PiAtUFlUSE9OX09SSlNPTl9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1jZmZpCj4+
Pj4gLVBZVEhPTl9PUkpTT05fQ0FSR09fRU5WID0gXAo+Pj4+ICtQWVRIT05fT1JKU09OX0RFUEVO
REVOQ0lFUyA9IGhvc3QtcHl0aG9uLWNmZmkgaG9zdC1weXRob24tbWF0dXJpbgo+Pj4+ICtQWVRI
T05fT1JKU09OX0VOViA9IFwKPj4+PiArwqDCoMKgwqAgJChQS0dfQ0FSR09fRU5WKSBcCj4+Pj4g
ICAgICAgIAo+Pj4+IFBZTzNfQ1JPU1NfTElCX0RJUj0iJChTVEFHSU5HX0RJUikvdXNyL2xpYi9w
eXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikiCj4+Pj4gKyMgV2UgbmVlZCB0byB2ZW5kb3Ig
dGhlIENhcmdvIGNyYXRlcyBhdCBkb3dubG9hZCB0aW1lCj4+Pj4gK1BZVEhPTl9PUkpTT05fRE9X
TkxPQURfUE9TVF9QUk9DRVNTID0gY2FyZ28KPj4+PiArUFlUSE9OX09SSlNPTl9ET1dOTE9BRF9E
RVBFTkRFTkNJRVMgPSBob3N0LXJ1c3RjCj4+Pj4gK1BZVEhPTl9PUkpTT05fRExfRU5WID0gJChQ
S0dfQ0FSR09fRU5WKQo+Pj4KPj4+IMKgwqAgSXMgdGhpcyBnb2luZyB0byBiZSBuZWVkZWQgZm9y
IGFsbCBtYXR1cmluIHBhY2thZ2VzPyBJZiB5ZXMsIGl0IHdpbGwgbWFrZQo+Pj4gc2Vuc2UgdG8g
bW92ZSB0aGlzIGludG8gYSBtYXR1cmluIHNldHVwIHR5cGUgKGJ1dCBwcmVmZXJhYmx5IG9ubHkg
YWZ0ZXIgd2UgaGF2ZQo+Pj4gYXQgbGVhc3QgMyBwYWNrYWdlcyB0aGF0IHVzZSBpdCkuCj4+Cj4+
IFllcywgSSdtIHBsYW5uaW5nIG9uIGFkZGluZyB0aGF0IGFsb25nIHdpdGggYSBzZXR1cHRvb2xz
LXJ1c3Qgc2V0dXAgdHlwZSwgSSBoYXZlCj4+IHNvbWUgdXBzdHJlYW0gd29yayB0aGF0IHNob3Vs
ZCBtYWtpbmcgdGhpbmdzIGNsZWFyZXIgYXMgd2VsbCBsaWtlIHRoaXM6Cj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9QeU8zL21hdHVyaW4vcHVsbC85MDkKPj4KPj4gSSdtIGdvaW5nIHRvIHJld29yayB0
aGlzIHRvIGhhbmRsZSBtYXR1cmluIGFzIHdlbGwoYm90aCBhcmUgcHlvMyBidWlsZCB0b29scyk6
Cj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyMjA1MDEwNzQ0MDEuMTEzNTIyOS0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vIAo+Pgo+
Pgo+Pj4KPj4+IMKgwqAgUmVnYXJkcywKPj4+IMKgwqAgQXJub3V0Cj4+Pgo+Pj4+Cj4+Pj4gLSMg
b3Jqc29uIHVzZXMgIm1hdHVyaW4iIHRvIGdlbmVyYXRlIGRpc3RyaWJ1dGlvbiBwYWNrYWdlcyAt
IHJhdGhlciB0aGFuIHRlYWNoCj4+Pj4gLSMgYnVpbGRyb290IGhvdyB0byB1bmRlcnN0YW5kIHRo
aXMsIHdlIHJlYWNoIGluIGFuZCBpbnN0YWxsIGRpcmVjdGx5Lgo+Pj4+IC1kZWZpbmUgUFlUSE9O
X09SSlNPTl9JTlNUQUxMX1RBUkdFVF9DTURTCj4+Pj4gLcKgwqDCoMKgICQoSU5TVEFMTCkgLW0g
MDc1NSAtRCAKPj4+PiAkKEBEKS90YXJnZXQvJChSVVNUQ19UQVJHRVRfTkFNRSkvcmVsZWFzZS9s
aWJvcmpzb24uc28gXAo+Pj4+IC0gICAgICAgICAgICAgCj4+Pj4gJChUQVJHRVRfRElSKS91c3Iv
bGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS9zaXRlLXBhY2thZ2VzL29yanNvbi5z
bwo+Pj4+IC1lbmRlZgo+Pj4+IC0KPj4+PiAtJChldmFsICQoY2FyZ28tcGFja2FnZSkpCj4+Pj4g
KyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
