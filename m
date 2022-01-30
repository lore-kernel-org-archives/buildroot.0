Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA12C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 17:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F050260DFE;
	Sun, 30 Jan 2022 17:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnuaH5-h23RR; Sun, 30 Jan 2022 17:32:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA23160BDF;
	Sun, 30 Jan 2022 17:32:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 778551BF57B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6352D40977
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxOH5bCcVbXe for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 17:32:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD16F40979
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:32:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h21so21041487wrb.8
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 09:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yBxBKf+50gzz+iVc1ZqCpMPu6wVwgShtPSE2kWeYXrc=;
 b=b+CXEFulLGmEoiMXelSIzH7N/iJGKYsJvL68jItO01IDs0TZp4/0GsOSg4dy1JOLA/
 N2U5vIRjlmpjCEPdHJbsK+w7qdgwjSaIOC5bGL+3sN44qLYGfalwAqxLlxjPXLJKAwoZ
 qi4fC3Vw2CFijrs6wbs4bpkEqAu4akCeDPr5Uz6wYzBuqEHkmnw5rHbZNvpie/zOUR/n
 C0wD3D72z28N+LVatJjV+JLRYVjU5sElDvNLaDD+h8LRtx65sKU8lSZvp8AUVBeXEnwE
 jBNhZbI1JfZZfx0aTzHL/Omk+3bPvwWzppzVhaA3E9VMpkw8HI/SWPMeapmlSecPFhXf
 zu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yBxBKf+50gzz+iVc1ZqCpMPu6wVwgShtPSE2kWeYXrc=;
 b=L1yLQCU7d9YUfrd/HIH9oIQh5VKagrxxdPG8YK+Dw0BveVS+qrZuIAU/VpTjr8Pds0
 Q+ZJ/0mTSpt/vMwgOx4bAxaSIItOCOJaioePTPJqVdVCeLBgoyRQP1yNqGDuCKWc7v2T
 fH4BNsflBOAHSveiMARNQ6ODZ6lahaBqCvbgfbZqg9Y5mCv+M3Xgen8f63I00k4Dfm7J
 WhJflEhXeNeSg/v7G6eLbd5f9boKQsKfUad6itxyb3vuSEALYpmPrQiO58Eaiy6EFUxn
 oiuLa9zTLaJVFQcxWVfWJvtlqcjWpdzWudFMuV08fJKVKMqyHxdd/V/Bgm27MzVl3nME
 2JtQ==
X-Gm-Message-State: AOAM530VM29eSzAaWCG/LEJrjdIS0WqwLDyICyYvKG+YVL6THMISEYnq
 vezV5FCbaO3nfI/Nvo5XgZE=
X-Google-Smtp-Source: ABdhPJynl/p3kG1dX26gg81L7DrxqkJ6zI6iBM7H8d+A0a9vAYqVBTA2Hqhp+MG6oWe8P7tqKsHHjQ==
X-Received: by 2002:adf:e602:: with SMTP id p2mr14546061wrm.126.1643563965009; 
 Sun, 30 Jan 2022 09:32:45 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id j28sm3625019wms.14.2022.01.30.09.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 09:32:44 -0800 (PST)
Message-ID: <e71373c8-1f50-794d-bf95-1f018eab322f@gmail.com>
Date: Sun, 30 Jan 2022 18:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220129142352.1197168-1-romain.naour@gmail.com>
 <20220129142352.1197168-2-romain.naour@gmail.com>
 <20220130154605.5fad582e@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220130154605.5fad582e@windsurf>
Subject: Re: [Buildroot] [PATCH 2/3] package/poke: disable minimal-threading
 with thumb or thumb2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMzAvMDEvMjAyMiDDoCAxNTo0NiwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEhlbGxvLAo+IAo+IE9uIFNhdCwgMjkgSmFuIDIwMjIgMTU6MjM6NTEgKzAx
MDAKPiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+IAo+PiAr
IyBEaXNhYmxlIG1pbmltYWwtdGhyZWFkaW5nIHdoZW4gdGh1bWIgb3IgdGh1bWIyIGlzIGVuYWJs
ZWQKPj4gKyMgZHVlIHRvIHJ1bnRpbWUgaXNzdWUuCj4+ICsjIGh0dHBzOi8vbGlzdHMuZ251Lm9y
Zy9hcmNoaXZlL2h0bWwvcG9rZS1kZXZlbC8yMDIyLTAxL21zZzAwMTYyLmh0bWwKPj4gK2lmZXEg
KCQoQlIyX0FSTV9DUFVfSEFTX1RIVU1CKSQoQlIyX0FSTV9DUFVfSEFTX1RIVU1CMikseSkKPj4g
K1BPS0VfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1kaXNwYXRjaC1taW5pbWFsLXRocmVhZGluZwo+
PiArZWxzZQo+PiArUE9LRV9DT05GX09QVFMgKz0gLS1lbmFibGUtZGlzcGF0Y2gtbWluaW1hbC10
aHJlYWRpbmcKPj4gK2VuZGlmCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcGF0Y2gsIGJl
Y2F1c2UgbWluaW1hbC10aHJlYWRpbmcgaXMgYWxyZWFkeQo+IGRpc2FibGVkIGJ5IGRlZmF1bHQg
KGF0IGxlYXN0IGluIHBva2UgMS40LCBJIGhhdmVuJ3QgY2hlY2tlZCBpbiBwb2tlCj4gMi4wKS4g
aml0dGVyL2NvbmZpZ3VyZS5hYyBjb250YWluczoKPiAKPiAjIElzIHRoZSBtaW5pbWFsLXRocmVh
ZGluZyBkaXNwYXRjaCBlbmFibGVkPyAgQ2hlY2sgdGhlIGRlZmF1bHQgYW5kIHRoZQo+ICMgY29u
ZmlndXJlIGNvbW1hbmQtbGluZSBvcHRpb24uCj4gQUNfTVNHX0NIRUNLSU5HKFtpZiBtaW5pbWFs
LXRocmVhZGluZyBkaXNwYXRjaCBpcyBlbmFibGVkXSkKPiAjIEZJWE1FOiByZWVuYWJsZSB0aGlz
IHdoZW4gSSBtYWtlIGRlZmVjdCBoYW5kbGluZyByZWxpYWJsZS4KPiAjZGVmYXVsdD0kKHRlc3Qg
IngkSklUVEVSX0hBVkVfQUNUVUFMX0dDQyIgPSAieHllcyIgJiYgZWNobyB5ZXMgfHwgZWNobyBu
bykKPiBkZWZhdWx0PW5vCj4gQUNfQVJHX0VOQUJMRShbZGlzcGF0Y2gtbWluaW1hbC10aHJlYWRp
bmddLAo+ICAgICAgICAgICAgICAgQVNfSEVMUF9TVFJJTkcoWy0tZW5hYmxlLWRpc3BhdGNoLW1p
bmltYWwtdGhyZWFkaW5nXSwKPiAgICAgICAgICAgICAgIFtlbmFibGUgbWluaW1hbCB0aHJlYWRp
bmcgZGlzcGF0Y2g6IGRlZmF1bHQgeWVzIGlmIGFuZAo+IG9ubHkgaWYgR0NDIChub3QgYW4gaW1p
dGF0aW9uKSBpcyB1c2VkXSksCj4gICAgICAgICAgICAgICBqaXR0ZXJfZW5hYmxlX2Rpc3BhdGNo
X21pbmltYWxfdGhyZWFkaW5nPSIkZW5hYmxldmFsIiwKPiAgICAgICAgICAgICAgIGppdHRlcl9l
bmFibGVfZGlzcGF0Y2hfbWluaW1hbF90aHJlYWRpbmc9IiRkZWZhdWx0IikKPiBpZiB0ZXN0ICJ4
JGppdHRlcl9lbmFibGVfZGlzcGF0Y2hfbWluaW1hbF90aHJlYWRpbmciID0gInh5ZXMiOyB0aGVu
Cj4gICBqaXR0ZXJfYmVzdF9kaXNwYXRjaF9tb2RlbD0ibWluaW1hbC10aHJlYWRpbmciCj4gICBq
aXR0ZXJfZW5hYmxlZF9kaXNwYXRjaF9tb2RlbHM9IiRqaXR0ZXJfZW5hYmxlZF9kaXNwYXRjaF9t
b2RlbHMgbWluaW1hbC10aHJlYWRpbmciCj4gZmkKPiBBQ19NU0dfUkVTVUxUKFskaml0dGVyX2Vu
YWJsZV9kaXNwYXRjaF9taW5pbWFsX3RocmVhZGluZyRqaXR0ZXJfc3VicGFja2FnZV9kaXNjbGFp
bWVyXSkKPiAjIEZJWE1FOiByZW1vdmUgdGhpcyB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiBJIG1ha2Ug
ZGVmZWN0IGhhbmRsaW5nIHJlbGlhYmxlLgo+IGlmIHRlc3QgIngkaml0dGVyX2VuYWJsZV9kaXNw
YXRjaF9taW5pbWFsX3RocmVhZGluZyIgPSAieHllcyI7IHRoZW4KPiAgIEFDX01TR19XQVJOKFtt
aW5pbWFsLXRocmVhZGluZyBkaXNwYXRjaCBpcyBjdXJyZW50bHkgdW5yZWxpYWJsZSwgYW5kIHNo
b3VsZAo+ICAgbm90IGJlIHVzZWQgaW4gcHJvZHVjdGlvbiB1bnRpbCBkZWZlY3RpdmUgaW5zdHJ1
Y3Rpb24gcmVwbGFjZW1lbnQgaXMgZnVsbHkKPiAgIGltcGxlbWVudGVkXSkKPiBmaQo+IAo+IFNl
ZSB0aGUgImRlZmF1bHQ9bm8iID8KPiAKPiBBbHNvLCB3aGVuIGJ1aWxkaW5nIHdpdGggdGhlIGZv
bGxvd2luZyBkZWZjb25maWc6Cj4gCj4gQlIyX2FybT15Cj4gQlIyX2NvcnRleF9hOD15Cj4gQlIy
X0FSTV9FQUJJPXkKPiBCUjJfQVJNX0lOU1RSVUNUSU9OU19USFVNQjI9eQo+IEJSMl9UT09MQ0hB
SU5fRVhURVJOQUw9eQo+IEJSMl9JTklUX05PTkU9eQo+IEJSMl9TWVNURU1fQklOX1NIX05PTkU9
eQo+ICMgQlIyX1BBQ0tBR0VfQlVTWUJPWCBpcyBub3Qgc2V0Cj4gQlIyX1BBQ0tBR0VfUE9LRT15
Cj4gIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+IAo+IFRoZSBtaW5pbWFsIHRo
cmVhZGluZyBpcyBhbHJlYWR5IGRpc2FibGVkOgo+IAo+IGNoZWNraW5nIGlmIHN3aXRjaCBkaXNw
YXRjaGluZyBpcyBlbmFibGVkLi4uIHllcywgcHJvdmlzaW9uYWxseSAoc3ViLXBhY2thZ2UgbW9k
ZSkKPiBjaGVja2luZyBpZiBkaXJlY3QtdGhyZWFkaW5nIGRpc3BhdGNoIGlzIGVuYWJsZWQuLi4g
eWVzLCBwcm92aXNpb25hbGx5IChzdWItcGFja2FnZSBtb2RlKQo+IGNoZWNraW5nIGlmIG1pbmlt
YWwtdGhyZWFkaW5nIGRpc3BhdGNoIGlzIGVuYWJsZWQuLi4gbm8sIHByb3Zpc2lvbmFsbHkgKHN1
Yi1wYWNrYWdlIG1vZGUpCj4gY2hlY2tpbmcgaWYgbm8tdGhyZWFkaW5nIGRpc3BhdGNoIGlzIGVu
YWJsZWQuLi4gbm8sIHByb3Zpc2lvbmFsbHkgKHN1Yi1wYWNrYWdlIG1vZGUpCj4gY29uZmlndXJl
OiBzdWItcGFja2FnZSBtb2RlOiBkaXNhYmxpbmcgZXZlcnkgZGlzcGF0Y2ggZXhjZXB0Cj4gZGly
ZWN0LXRocmVhZGluZwo+IGNvbmZpZ3VyZTogICAodGhlIGZvbGxvd2luZyBkaXNwYXRjaGVzIGNv
dWxkIGhhdmUgYmVlbiBlbmFibGVkOgo+ICAgc3dpdGNoIGRpcmVjdC10aHJlYWRpbmcpCj4gY29u
ZmlndXJlOiBlbmFibGVkIGRpc3BhdGNoaW5nIG1vZGVscyBhcmU6Cj4gICBkaXJlY3QtdGhyZWFk
aW5nCj4gY29uZmlndXJlOiB0aGUgYmVzdCBlbmFibGVkIGRpc3BhdGNoaW5nIG1vZGVsIGlzOgo+
ICAgZGlyZWN0LXRocmVhZGluZwo+IAo+IFNvIHdoYXQgdGhpcyBwYXRjaCBpcyBkb2luZyBpcyBp
biBmYWN0IHNsaWdodGx5IHRoZSBvcHBvc2l0ZSBvZiB3aGF0IGhlCj4gc2F5czogaW5zdGVhZCBv
ZiBkaXNhYmxpbmcgbWluaW1hbCB0aHJlYWRpbmcgZm9yIHRodW1iIG9yIHRodW1iMiwgaXQKPiBl
bmFibGVzIGl0IGZvciBhbnkgb3RoZXIgcGxhdGZvcm0uCj4gCj4gQXJlIHlvdSBzdXJlIHRoaXMg
cGF0Y2ggd2FzIG5lZWRlZCBmb3IgcG9rZSAxLjQsIGFuZCBub3QgZm9yIHBva2UgMi4wID8KCkkg
b3Zlcmxvb2tlZCB0aGF0IHdhcyBkaXNhYmxlZCBieSBkZWZhdWx0IGluIHBva2UgMS40LgpJIG9u
bHkgY2hlY2tlZCBpZiB0aGlzIG9wdGlvbiB3YXMgcHJlc2VudCBpbiBwb2tlIDEuNC4KU28gdGhp
cyBwYXRjaCBtdXN0IGJlIG1lcmdlZCBpbiB0aGUgcG9rZSB2ZXJzaW9uIGJ1bXAuCgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IFRob21hcwo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
