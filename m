Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D75DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 14:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 221426FC05;
	Thu,  6 Jan 2022 14:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eInjsK8jVm2K; Thu,  6 Jan 2022 14:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 360826FC01;
	Thu,  6 Jan 2022 14:08:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12C501BF406
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3CF782BBA
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-whG7_UQBay for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 14:08:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9B868272D
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 14:08:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h23so5060524wrc.1
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 06:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TMDS57HKmnVEUlPzJmD/QHe9ySwNyiZy+fErWi9L2tE=;
 b=ZyVaFHrRhJAnjNWz/mydZLobxTdF4S4pXCVV60098NLMWLHV5sEcg9smzM3uqQ22U4
 bochYJvF3CSO7k7BsvOw1uly0WCGMFmdfLILyWbpuS5Drw1S3PmVLnQMvcv7NfQMwxEm
 a7E3TIzuqFM/0ErrR+PqqGomr1MHZmo0/On6SSp8qc+wC5M/O/L7iJ9kKfTMb20oPU+4
 NugySvTxsdNhRG0X541ciyewFrXwGcA46p8SMh28D1LdrBmuoDI0hykXMHl71FagM42X
 5a5M0jisx+YtqFwRYmSdfRXeJRcFHC4+x7+W3E/3lCQnNbClAlZPH51mIrQDTJ0RLC4i
 reBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TMDS57HKmnVEUlPzJmD/QHe9ySwNyiZy+fErWi9L2tE=;
 b=gLNR7gx/iQN899aczY2TDG3s3x2El2ze+Q78OqVaqonLsXCRVxXvd5xC/uddRH1gpP
 OsqvfOkZ5J84Zw6Y1BPBIGhIBzhWbJkQPmJ477FXiszufCgnRjvU4Jm9LkX6qGpAtCr5
 Xpu4zJVrPA/5GoJjkdqFG4FajEezDowO/mAo2hQDtka0HJvSYFBeE2DDv12IYY3vw/BJ
 rZRCf8he2n4kADbJHPGCs/0CnEQOZXwbIzHk9ym9jQUjfavHoPc1ztsbmb8WFYKN0Ozo
 4DrEKeOfChvcyW5+mEYutliNxtVnReiq+KJEYtx+D6/ABMMAX6yRzQRXU2Xyene3TOe7
 AUiA==
X-Gm-Message-State: AOAM531R4sbPbuMDn8Yr9Rh1Lo2sJShzsiOr4QRondRSytzQPzLmicnZ
 N8U/374t9KMBmjhLmbiFevyGMqtIfy2L7w==
X-Google-Smtp-Source: ABdhPJylyjNDT5gRPXTvtQi6t7P6Wy5HmUUugjAOEEQI6eXRo6wgjx8Be+fEKcbHtvqJ3LjFvuXcHw==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr51914649wru.716.1641478089967; 
 Thu, 06 Jan 2022 06:08:09 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id o1sm5479535wmc.38.2022.01.06.06.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 06:08:09 -0800 (PST)
Message-ID: <3c9b632e-aae8-5766-c961-42627109d70a@smile.fr>
Date: Thu, 6 Jan 2022 15:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220104181107.3171973-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220104181107.3171973-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/liburing: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCkxlIDA0LzAxLzIwMjIgw6AgMTk6MTEsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiBUaGlzIGlzIHRoZSBpb191cmluZyBsaWJyYXJ5LCBsaWJ1cmluZy4gbGli
dXJpbmcgcHJvdmlkZXMgaGVscGVycyB0bwo+IHNldHVwIGFuZCB0ZWFyZG93biBpb191cmluZyBp
bnN0YW5jZXMsIGFuZCBhbHNvIGEgc2ltcGxpZmllZCBpbnRlcmZhY2UKPiBmb3IgYXBwbGljYXRp
b25zIHRoYXQgZG9uJ3QgbmVlZCAob3Igd2FudCkgdG8gZGVhbCB3aXRoIHRoZSBmdWxsIGtlcm5l
bAo+IHNpZGUgaW1wbGVtZW50YXRpb24uCj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLmRrL2NnaXQv
bGlidXJpbmcKCmxpYnVyaW5nIGlzIGFuIG9wdGlvbmFsIFFlbXUgZGVwZW5kZW5jeSwgaXQgYWxs
b3dzIHRvIHVzZSBpb191cmluZyBpbnN0ZWFkIG9mCnRoZSB0aHJlYWQgcG9vbC4KCkFyY2hsaW51
eCBwcm92aWRlIHNvbWUgaW5mb3MgYWJvdXQgb3RoZXIgcGFja2FnZXMgdXNpbmcgbGlidXJpbmc6
Cmh0dHBzOi8vYXJjaGxpbnV4Lm9yZy9wYWNrYWdlcy9leHRyYS94ODZfNjQvbGlidXJpbmcvCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPgo+IC0tLQo+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4g
IHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9saWJ1cmlu
Zy9Db25maWcuaW4gICAgIHwgMTMgKysrKysrKysrKysrCj4gIHBhY2thZ2UvbGlidXJpbmcvbGli
dXJpbmcuaGFzaCB8ICA4ICsrKysrKysrCj4gIHBhY2thZ2UvbGlidXJpbmcvbGlidXJpbmcubWsg
ICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFu
Z2VkLCA1OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnVy
aW5nL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJ1cmluZy9saWJ1
cmluZy5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnVyaW5nL2xpYnVyaW5n
Lm1rCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggNDQ0
ZTU4NzE0Yy4uNTAxN2RkZTU2ZSAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVW
RUxPUEVSUwo+IEBAIC05MDQsNiArOTA0LDcgQEAgRjoJcGFja2FnZS9saWJyc3luYy8KPiAgRjoJ
cGFja2FnZS9saWJzb3VwLwo+ICBGOglwYWNrYWdlL2xpYnNveHIvCj4gIEY6CXBhY2thZ2UvbGli
dXBucC8KPiArRjoJcGFja2FnZS9saWJ1cmluZy8KPiAgRjoJcGFja2FnZS9saWJ2NGwvCj4gIEY6
CXBhY2thZ2UvbGlieHNsdC8KPiAgRjoJcGFja2FnZS9tYmVkdGxzLwo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggZTA5ZTRhYWQzZi4u
MWYzZWM5YTMzNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2th
Z2UvQ29uZmlnLmluCj4gQEAgLTIwMDEsNiArMjAwMSw3IEBAIG1lbnUgIk90aGVyIgo+ICAJc291
cmNlICJwYWNrYWdlL2xpYnVjaS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbGlidW53
aW5kL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9saWJ1cmN1L0NvbmZpZy5pbiIKPiAr
CXNvdXJjZSAicGFja2FnZS9saWJ1cmluZy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2Uv
bGlidXYvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2xpZ2h0bmluZy9Db25maWcuaW4i
Cj4gIAlzb3VyY2UgInBhY2thZ2UvbGludXgtcGFtL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saWJ1cmluZy9Db25maWcuaW4gYi9wYWNrYWdlL2xpYnVyaW5nL0NvbmZpZy5pbgo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uODk4ZDk1Y2ZhNgo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xpYnVyaW5nL0NvbmZpZy5pbgo+IEBAIC0wLDAg
KzEsMTMgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xJQlVSSU5HCj4gKwlib29sICJsaWJ1cmlu
ZyIKPiArCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgQzExL3N0
ZGF0b21pYy5oCgpJcyBhbnkgbGludXgtaGVhZGVycyBkZXBlbmRlbmN5ICg1LjAgbWF5YmUpLgoK
PiArCWhlbHAKPiArCSAgVGhpcyBpcyB0aGUgaW9fdXJpbmcgbGlicmFyeSwgbGlidXJpbmcuIGxp
YnVyaW5nIHByb3ZpZGVzCj4gKwkgIGhlbHBlcnMgdG8gc2V0dXAgYW5kIHRlYXJkb3duIGlvX3Vy
aW5nIGluc3RhbmNlcywgYW5kIGFsc28gYQo+ICsJICBzaW1wbGlmaWVkIGludGVyZmFjZSBmb3Ig
YXBwbGljYXRpb25zIHRoYXQgZG9uJ3QgbmVlZCAob3IKPiArCSAgd2FudCkgdG8gZGVhbCB3aXRo
IHRoZSBmdWxsIGtlcm5lbCBzaWRlIGltcGxlbWVudGF0aW9uLgo+ICsKPiArCSAgaHR0cHM6Ly9n
aXQua2VybmVsLmRrL2NnaXQvbGlidXJpbmcKPiArCj4gK2NvbW1lbnQgImxpYnVyaW5nIG5lZWRz
IGEgdG9vbGNoYWluIHcvIGdjYyA+PSA0LjkiCj4gKwlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlO
X0dDQ19BVF9MRUFTVF80XzkKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ1cmluZy9saWJ1cmlu
Zy5oYXNoIGIvcGFja2FnZS9saWJ1cmluZy9saWJ1cmluZy5oYXNoCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41NmU5MGQ3MWNjCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvbGlidXJpbmcvbGlidXJpbmcuaGFzaAo+IEBAIC0wLDAgKzEsOCBAQAo+ICsj
IExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIGRmN2M4ZmQwNWZkMzlkYTYyMmIyODE0ZTA2
ZjgxNWYxMWYxYmViNDI5NDg3YTQzMzBlZWQ2NGJiN2YzNTNkYmYgIGxpYnVyaW5nLTIuMS50YXIu
YnoyCj4gKwo+ICsjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXMKPiArc2hhMjU2ICA1OTI5ODdlODUx
MDIyOGQ1NDY1NDBiODRhMjI0NDRiZGU5OGU0OGQwMzA3OGQzYjJlZWZjZDg4OWJlYzVjZThjICBD
T1BZSU5HCj4gK3NoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZi
NTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORy5HUEwKPiArc2hhMjU2ICBkMGIyMjVm
MTdlZjJkMDVkNWNkYTZiMjViMmRjMzM0ZWY2ZjVmMTI1MzdjMjBlZGY2ZTM5MTg1MmEwOTVlYzE5
ICBMSUNFTlNFCj4gK3NoYTI1NiAgOTdkNjJmZjVkN2NmMGIxY2VmMzRjMzNhODk4NzczNTI5MTEy
NzhjYTRhYzFjNmM0ZjI0YTgzNWJhYTVlYTEwYiAgUkVBRE1FCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlidXJpbmcvbGlidXJpbmcubWsgYi9wYWNrYWdlL2xpYnVyaW5nL2xpYnVyaW5nLm1rCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hOTc3ZTc0YjRmCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGlidXJpbmcvbGlidXJpbmcubWsKPiBAQCAtMCww
ICsxLDM2IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBsaWJ1cmluZwo+
ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtMSUJVUklOR19WRVJTSU9OID0g
Mi4xCj4gK0xJQlVSSU5HX1NPVVJDRSA9IGxpYnVyaW5nLSQoTElCVVJJTkdfVkVSU0lPTikudGFy
LmJ6Mgo+ICtMSUJVUklOR19TSVRFID0gaHR0cHM6Ly9naXQua2VybmVsLmRrL2NnaXQvbGlidXJp
bmcvc25hcHNob3QKPiArTElCVVJJTkdfTElDRU5TRSA9IChHUEwtMi4wIHdpdGggZXhjZXB0aW9u
cyBhbmQgTEdQTC0yLjErKSBvciBNSVQKPiArTElCVVJJTkdfTElDRU5TRV9GSUxFUyA9IENPUFlJ
TkcgQ09QWUlORy5HUEwgTElDRU5TRSBSRUFETUUKPiArTElCVVJJTkdfSU5TVEFMTF9TVEFHSU5H
ID0gWUVTCj4gKwo+ICtpZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiArTElCVVJJTkdfTUFL
RV9PUFRTICs9IEVOQUJMRV9TSEFSRUQ9MAo+ICtlbHNlCj4gK0xJQlVSSU5HX01BS0VfT1BUUyAr
PSBFTkFCTEVfU0hBUkVEPTEKPiArZW5kaWYKPiArCj4gK2RlZmluZSBMSUJVUklOR19DT05GSUdV
UkVfQ01EUwo+ICsJKGNkICQoQEQpOyAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgLi9jb25maWd1
cmUpCj4gK2VuZGVmCgpJbmRlZWQsIGNvbmZpZ3VyZSBpcyBhIHNoZWxsIHNjcmlwdC4gSXQncyBu
b3QgZ2VuZXJhdGVkIGJ5IGF1dG90b29scy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+ICsKPiAr
ZGVmaW5lIExJQlVSSU5HX0JVSUxEX0NNRFMKPiArCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0Up
ICQoTElCVVJJTkdfTUFLRV9PUFRTKSAtQyAkKEBEKS9zcmMKPiArZW5kZWYKPiArCj4gK2RlZmlu
ZSBMSUJVUklOR19JTlNUQUxMX1NUQUdJTkdfQ01EUwo+ICsJJChUQVJHRVRfTUFLRV9FTlYpICQo
TUFLRSkgLUMgJChARCkgREVTVERJUj0kKFNUQUdJTkdfRElSKSBpbnN0YWxsCj4gK2VuZGVmCj4g
Kwo+ICtkZWZpbmUgTElCVVJJTkdfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ICsJJChUQVJHRVRfTUFL
RV9FTlYpICQoTUFLRSkgLUMgJChARCkgREVTVERJUj0kKFRBUkdFVF9ESVIpIGluc3RhbGwKPiAr
ZW5kZWYKPiArCj4gKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
