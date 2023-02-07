Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E17C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 18:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E17F5817A4;
	Tue,  7 Feb 2023 18:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E17F5817A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lB-6olYRVkDK; Tue,  7 Feb 2023 18:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BE938186A;
	Tue,  7 Feb 2023 18:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE938186A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 581C71BF4DA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 18:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E9BF6101C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 18:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E9BF6101C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJmtT8bfR1Dc for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 18:04:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72873600C9
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72873600C9
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 18:04:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h16so14383292wrz.12
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 10:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VYUnAAdD+F0yBnCq05BG43uKdvXdsVR7MGW9vIGV7kM=;
 b=2dtU3J6VhMGLZfcvuca0leYEBMXAYGVRGsgPLiZDpdv4kkdj4jeAbW2WIE3AKI36gB
 O44S8ihMGEwpoOFvwNF1FdJc1HXeq7hIWBriqwUxvKUo3JF7ru9OoDR37ud4lONnaXvA
 epPTSyrl1PG25KVetkMHAoQKvYqwx+P5W4zz/sb5lUa7QS/K5KlTJjXDKx+SUKOsr+WA
 nmcd9Ll9GQs1IMjKVQRDkWZW7+rbVQp7dd8fR1kDXCrqJgL1uDxOKqtCZKLhLoTJREOS
 EhaMFhxTCXlry45FED0CTYm0uCW21dRMmZCv+f2BJJKNWHR9beKZkZqm7wnR0TJQnmZ1
 KeWA==
X-Gm-Message-State: AO0yUKXGvzWf7oMM+e1F04m10y4w1oZP9BuyrJYIEw6VoFl2WqrLkqJO
 O/QKw882yoU+0zBmlfZfIa39sjYrYu48zChD
X-Google-Smtp-Source: AK7set9W0yiP38rPIkZ/wfqcG/GCIlhQoibMcHdJWeWbc21ZJpqUNG2z0TJBQw1LANB+A0IHhRJgTw==
X-Received: by 2002:adf:ea45:0:b0:2bd:c1de:a33f with SMTP id
 j5-20020adfea45000000b002bdc1dea33fmr3723983wrn.19.1675793064671; 
 Tue, 07 Feb 2023 10:04:24 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 q8-20020adfea08000000b002c3ddcf4f3asm9163599wrm.0.2023.02.07.10.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:04:24 -0800 (PST)
Message-ID: <51fbd11a-26ef-78fa-3ced-61648adc5a9f@smile.fr>
Date: Tue, 7 Feb 2023 19:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20230207175116.3043006-1-angelo@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230207175116.3043006-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VYUnAAdD+F0yBnCq05BG43uKdvXdsVR7MGW9vIGV7kM=;
 b=GYw5dLU3zq10rRwgvCIqdgBxdSDMcEbEDUm1pXaKU2aSezPY4yfKdNcbEkJRPVPkRc
 U4l4tXTaxW4lB3OvQgi1j5l30FzQcLl0A0bU5sFvCp/rKbTqV9IrDS/n17Fv31yAuIfH
 xxHHwf90GeWf6IA/tncdqOmvbWlsScCyzBfeUEfJBQZUfFpPrizQzDju+hku/O4EFJ8W
 q/FdTU5kvPPcZALMdRO8NDwR/8EQdC/zI0TmwfK9LWhzkknSXZTg4dpJ9rPMIr/BNd7s
 FFkAaF3kYduRZu6RjXXZjALOrt/8Qi3MmcNZhxTids5XRXzq+76jSn4uUTBCwxZI7X7C
 s50g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=GYw5dLU3
Subject: Re: [Buildroot] [PATCH v4] package/gtkiostream: new package
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
Cc: Matt Flax <flatmax@flatmax.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5nZWxvLAoKTGUgMDcvMDIvMjAyMyDDoCAxODo1MSwgQW5nZWxvIENvbXBhZ251Y2Np
IGEgw6ljcml0wqA6Cj4gRnJvbTogTWF0dCBGbGF4IDxmbGF0bWF4QGZsYXRtYXguY29tPgo+IAo+
IFRoaXMgcGFja2FnZSBwcm92aWRlcyBtYW55IHVzZWZ1bCBzb2Z0d2FyZSBlbmdpbmVlcmluZyBh
bmQgc2lnbmFsCj4gcHJvY2Vzc2luZyBsaWJyYXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0
dCBGbGF4IDxmbGF0bWF4QGZsYXRtYXguY29tPgo+IFtBbmdlbG86Cj4gICogQnVtcGVkIHRvIDEu
OC4wCj4gICogQWRkZWQgbXlzZWxmIHRvIERFVkVMT1BFUlMKPiAgKiBBZGRlZCBkZXBlbmRlbmN5
IG9uIG9jdGF2ZSB3aGVuIGVuYWJsZSBpbnN0ZWFkIG9mIHVzZQo+ICAgIC0tZGlzYWJsZS1vY3Rh
dmUgY29uZmlndXJlIG9wdGlvbgo+ICAqIEZpeGVzIGZyb20gY2hlY2stcGFja2FnZV0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFuZ2Vsb0BhbWFydWxhc29sdXRpb25zLmNv
bT4KPiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysr
Kwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2th
Z2UvZ3RraW9zdHJlYW0vQ29uZmlnLmluICAgICAgICB8IDE1ICsrKysrKysrKysrKysrKwo+ICBw
YWNrYWdlL2d0a2lvc3RyZWFtL2d0a2lvc3RyZWFtLmhhc2ggfCAgMyArKysKPiAgcGFja2FnZS9n
dGtpb3N0cmVhbS9ndGtpb3N0cmVhbS5tayAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysK
PiAgNSBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2d0a2lvc3RyZWFtL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9ndGtpb3N0cmVhbS9ndGtpb3N0cmVhbS5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2d0a2lvc3RyZWFtL2d0a2lvc3RyZWFtLm1rCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVM
T1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggZDdjNGQwM2M0Yy4uNTM1NWQ2ZDVhYyAxMDA2NDQK
PiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xNjUsNiArMTY1LDcg
QEAgRjoJcGFja2FnZS9jdXBzLwo+ICBGOglwYWNrYWdlL2N1cHMtZmlsdGVycy8KPiAgRjoJcGFj
a2FnZS9mYWlsMmJhbi8KPiAgRjoJcGFja2FnZS9ncmVwLwo+ICtGOglwYWNrYWdlL2d0a2lvc3Ry
ZWFtLwo+ICBGOglwYWNrYWdlL2h0cGRhdGUvCj4gIEY6CXBhY2thZ2UvaTJjLXRvb2xzLwo+ICBG
OglwYWNrYWdlL2pxLwo+IEBAIC0xOTc4LDYgKzE5NzksOSBAQCBGOglib2FyZC90ZWNobm9sb2dp
Yy90czQ5MDAvCj4gIEY6CWNvbmZpZ3MvdHM0OTAwX2RlZmNvbmZpZwo+ICBGOglwYWNrYWdlL3Rz
NDkwMC1mcGdhLwo+ICAKPiArTjoJTWF0dCBGbGF4IDxmbGF0bWF4QGZsYXRtYXgub3JnPgo+ICtG
OglwYWNrYWdlL2d0a2lvc3RyZWFtLwo+ICsKPiAgTjoJTWF0dCBXZWJlciA8bWF0dGhldy53ZWJl
ckBjb2xsaW5zLmNvbT4KPiAgRjoJYm9hcmQvZnJlZXNjYWxlL3AqCj4gIEY6CWJvYXJkL2ZyZWVz
Y2FsZS90Kgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmln
LmluCj4gaW5kZXggMDZkMGEwNTg1NC4uNzBlNDQ2YmU0NyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTEzODksNiArMTM4OSw3
IEBAIG1lbnUgIkF1ZGlvL1NvdW5kIgo+ICAJc291cmNlICJwYWNrYWdlL2JjZzcyOS9Db25maWcu
aW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvY2Fwcy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2th
Z2UvZmRrLWFhYy9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvZ3RraW9zdHJlYW0vQ29u
ZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2xpYmFvL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAi
cGFja2FnZS9saWJhc3BsaWIvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2xpYmJyb2Fk
dm9pY2UvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2d0a2lvc3RyZWFtL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvZ3RraW9zdHJlYW0vQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5iYjk3OTYxNTg3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvZ3RraW9zdHJlYW0vQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxNSBAQAo+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfR1RLSU9TVFJFQU0KPiArCWJvb2wgImd0a2lvc3RyZWFtIgo+ICsJZGVw
ZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAgIyBlaWdlbgo+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX0VJR0VOCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfRkZUVwo+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX0ZGVFdfRE9VQkxFCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfRkZUV19TSU5HTEUKPiArCWhl
bHAKPiArCSAgVGhpcyBwYWNrYWdlIHByb3ZpZGVzIG1hbnkgdXNlZnVsIHNvZnR3YXJlIGVuZ2lu
ZWVyaW5nIGFuZAo+ICsJICBzaWduYWwgcHJvY2Vzc2luZyBpbmNsdWRlcyBhbmQgbGlua2FibGUg
bGlicmFyeS4KPiArCj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9mbGF0bWF4L2d0a2lvc3RyZWFt
Cj4gKwo+ICtjb21tZW50ICJndGtpb3N0cmVhbSBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKysiCj4g
KwlkZXBlbmRzIG9uICFCUjJfSU5TVEFMTF9MSUJTVERDUFAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9ndGtpb3N0cmVhbS9ndGtpb3N0cmVhbS5oYXNoIGIvcGFja2FnZS9ndGtpb3N0cmVhbS9ndGtp
b3N0cmVhbS5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45
MGM3NTRmNDhjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZ3RraW9zdHJlYW0vZ3Rr
aW9zdHJlYW0uaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIGxvY2FsbHkgY29tcHV0ZWQgaGFz
aAo+ICtzaGEyNTYgIDQ0ZThkOTIxZDQ2MjAwNWNkMzMwYTFjMjRlNWJkODA2MTE3NWI5MGFlNTNm
NTM3ZGJmNzNmNTliNzRmNmUwMWIgIGd0a2lvc3RyZWFtLXYxLjguMC50YXIuZ3oKPiArc2hhMjU2
ICAyMDRkOGVmZjkyZjk1YWFjNGRmNmM4MTIyYmMxNTA1ZjQ2OGYzYTkwMWU1YTRjYzA4OTQwZTBl
ZGUxOTM4OTk0ICBncGwudHh0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3RraW9zdHJlYW0vZ3Rr
aW9zdHJlYW0ubWsgYi9wYWNrYWdlL2d0a2lvc3RyZWFtL2d0a2lvc3RyZWFtLm1rCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4zOTg4YWU1ODg4Cj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UvZ3RraW9zdHJlYW0vZ3RraW9zdHJlYW0ubWsKPiBAQCAtMCww
ICsxLDIzIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBHVEtJT1NUUkVB
TQo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtHVEtJT1NUUkVBTV9WRVJT
SU9OID0gdjEuOC4wCj4gK0dUS0lPU1RSRUFNX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGZsYXRtYXgs
Z3RraW9zdHJlYW0sJChHVEtJT1NUUkVBTV9WRVJTSU9OKSkKPiArR1RLSU9TVFJFQU1fTElDRU5T
RSA9IEdQTC0yLjArCj4gK0dUS0lPU1RSRUFNX0xJQ0VOU0VfRklMRVMgPSBncGwudHh0Cj4gK0dU
S0lPU1RSRUFNX0RFUEVOREVOQ0lFUyA9IGVpZ2VuIGZmdHctZG91YmxlIGZmdHctc2luZ2xlIGhv
c3QtcGtnY29uZgo+ICsKCkl0IGFsd2F5cyB1c2VmdWwgdG8gdXNlIGRpc3RyaWJ1dGlvbiBwYWNr
YWdpbmcgdG8gZmluZCBhbnkgbWlzc2luZyBkZXBlbmRlbmNpZXMKKG1lbnRhdG9yeSBvciBvcHRp
b25hbCkgbGlrZSBndGsyIChoZW5jZSB0aGUgcGFja2FnZSBuYW1lIDopICkKCmh0dHBzOi8vZ2l0
aHViLmNvbS9mbGF0bWF4L2d0a2lvc3RyZWFtL2Jsb2IvbWFzdGVyL2RlYmlhbi9jb250cm9sI0wx
NAoKQ2FuIHlvdSBkb3VibGUgY2hlY2sgPwoKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9PQ1RBVkUp
LHkpCj4gK0dUS0lPU1RSRUFNX0RFUEVOREVOQ0lFUyArPSBvY3RhdmUKPiArR1RLSU9TVFJFQU1f
Q09ORl9PUFRTID0gLS1lbmFibGUtb2N0YXZlCgpUaGlzIHRyaWdnZXIgYSBjaGVja3BhY2thZ2Ug
d2FybmluZzoKCnBhY2thZ2UvZ3RraW9zdHJlYW0vZ3RraW9zdHJlYW0ubWs6MTU6IGNvbmRpdGlv
bmFsIG92ZXJyaWRlIG9mIHZhcmlhYmxlCkdUS0lPU1RSRUFNX0NPTkZfT1BUUwoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+ICtlbHNlCj4gK0dUS0lPU1RSRUFNX0NPTkZfT1BUUyA9IC0tZGlzYWJs
ZS1vY3RhdmUKPiArZW5kaWYKPiArCj4gKyMgY29uZmlndXJlIHNjcmlwdCBub3QgYXZhaWxhYmxl
Cj4gK0dUS0lPU1RSRUFNX0FVVE9SRUNPTkYgPSBZRVMKPiArCj4gKyQoZXZhbCAkKGF1dG90b29s
cy1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
