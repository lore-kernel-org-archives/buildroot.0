Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9607DC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 09:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B50081F65;
	Tue,  6 Feb 2024 09:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-3DUepL0S3L; Tue,  6 Feb 2024 09:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07AEE820D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07AEE820D8;
	Tue,  6 Feb 2024 09:22:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B89B1BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C45741BF7
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C45741BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAVXKy7gvOkD for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 09:22:05 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A71441A88
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 09:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A71441A88
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51160b0ecd9so203935e87.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 01:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707211322; x=1707816122;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/KWkLgIdyOH/O6bkrVzHmCgf+oenkLFeVIfcwHy9a0=;
 b=xILQ4IieM1GHIoKiG3T313+mmcSGN3JEALTV0nzckrfm9R5bx2VWEu4z4+lCMktOlv
 AHplH/z3ObNnQ1dfkzK/vwZwrzTWgRYcUebaYK1AuqAFjT8RC4eF1bTusugeWst8n7LU
 wzm2jg+cWSzVNwLeU/TMrci0FlYaYEIB4ulrezzBrMGOAIth8kIfevDWLtpTrJJ6rYSL
 ulyXhqcmhyve5VrsmgjJPdSwvfVuKUvOHHop9sV+kwjveaZQxVcykpKCXU3Y9Z5oA61M
 rRCL6W+1EVil0lWzDsj75dgIkvxsHi+fr8c0PM+eYxzf0dA4+CMv8ZNCoK56sUdtkf0c
 vcMA==
X-Gm-Message-State: AOJu0Yx8amHDNUaPnuH7+FU3ATx4kuP5OSdvsE82OslZVMCi+qbyWU57
 +ihKki4avuKoPCHv0dpN894R8Z9DRKeVP/oVzCFxCXboInCyDHd05ra1OkgyDgVppGh1O50omA5
 6Rdc=
X-Google-Smtp-Source: AGHT+IEmLdIDwQjLEoSkmC87QBKx3FBnesQKpVyTi0AXhiTy0i/sfu8zEPxAiCYeCN6/pZdIXulaiw==
X-Received: by 2002:a19:7012:0:b0:510:1a32:6298 with SMTP id
 h18-20020a197012000000b005101a326298mr1472709lfc.56.1707211321742; 
 Tue, 06 Feb 2024 01:22:01 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVStRgwwRa6ufD8p9w1x/m4g31bEdwFpo1o/hmn9ETmgMaK+5nVBqfFJm2488hcqvWhmzAI7M/w5hMMKy8RhbnGTguFiRyRscnIr0ynMvSDGAiNxcNTM8P6uDz54dhvh/yShfMD87shCu8lzWvVizvcHo6rjraZ
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a5d4044000000b0033b3cd4ad89sm1575907wrp.59.2024.02.06.01.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:22:01 -0800 (PST)
Message-ID: <49b59119-b7f6-4d60-b35f-5e353f82c829@smile.fr>
Date: Tue, 6 Feb 2024 10:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240107114345.2795252-1-fontaine.fabrice@gmail.com>
 <275220a4-24b2-4f21-b8bb-fae239a56d37@mind.be>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <275220a4-24b2-4f21-b8bb-fae239a56d37@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707211322; x=1707816122;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q/KWkLgIdyOH/O6bkrVzHmCgf+oenkLFeVIfcwHy9a0=;
 b=lbqcSO0aZ6KfvGca5q4tSTbv/XVtN0zAxWgyJFKUm/+iQanQFeNQfh8xOHCP6XT+kt
 P746edQo7+NLzzkLNutF6GHPVtCpbW1Gpdg7I2qJCveqX/M8vPZ+U8g2RHLurJ6BkxY5
 M6hVK+FgxcJDupmXA9eWWrCZzT2/yUUewFx3+FIV+DmKs1NtFFCVqag3PkBc8e5S99qV
 MCzflLbxpDzhFbuhUDgsK9ul0dNqSuILVHmmGmZLvSafj/4y5q4a53io8XAEKqQ490GC
 juA7YWxGqTwmJzbUtKYNTZHR68h9nl+0LZtziBKeFiTqsxdNVNdTE9mKvagWClAq5FYF
 v0Aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lbqcSO0a
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to
 version 4.1.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwgQWxsLAoKTGUgMDUvMDIvMjAyNCDDoCAxNDoyNiwgQXJub3V0IFZhbmRl
Y2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IAo+IAo+IE9uIDA3LzAxLzIwMjQg
MTI6NDMsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4+IFRoaXMgYnVtcCB3aWxsIGZpeCB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkIHNpbmNlIGJ1bXAgdG8KPj4gdmVyc2lvbiA0
LjEuMiBpbiBjb21taXQgY2UyYmY3Yjk2YjlkYmE1N2JiMzFhY2E1ODMyODM3MzZhZjI3YWZjYzoK
Pj4KPj4gKioqIEVycm9yIGNvbXBpbGluZwo+PiAnL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9p
bnN0YW5jZS0wL291dHB1dC0xL3RhcmdldC91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdl
cy9iaXRzdHJpbmcvcGx1Z2luX3Rlc3QucHknLi4uCj4+IFNvcnJ5OiBJbmRlbnRhdGlvbkVycm9y
OiBleHBlY3RlZCBhbiBpbmRlbnRlZCBibG9jayBhZnRlciBmdW5jdGlvbiBkZWZpbml0aW9uCj4+
IG9uIGxpbmUgNiAocGx1Z2luX3Rlc3QucHksIGxpbmUgOCkKPj4KPj4gaHR0cHM6Ly9naXRodWIu
Y29tL3Njb3R0LWdyaWZmaXRocy9iaXRzdHJpbmcvYmxvYi9iaXRzdHJpbmctNC4xLjQvcmVsZWFz
ZV9ub3Rlcy50eHQKPj4KPj4gRml4ZXM6Cj4+IMKgIC0KPj4gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvZTZmYWM0Y2FjMTZkZTk0ODYyZTNiNDY5N2RkODhlODU2YmM5YTM5
OAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4KPiAKPiDCoEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpJIHdhcyBsb29r
aW5nIGF0IHRoaXMgaXNzdWUgYmVmb3JlIG5vdGljaW5nIHRoaXMgdmVyc2lvbiBidW1wIGJ1dCBu
b3cgdGhlCnJ1bnRpbWUgdGVzdCBmYWlsIHdpdGg6CgojIHB5dGhvbiBzYW1wbGVfcHl0aG9uX2Jp
dHN0cmluZy5weQpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiL3Jv
b3Qvc2FtcGxlX3B5dGhvbl9iaXRzdHJpbmcucHkiLCBsaW5lIDEsIGluIDxtb2R1bGU+CiAgICBp
bXBvcnQgYml0c3RyaW5nCiAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2Vz
L2JpdHN0cmluZy9fX2luaXRfXy5weSIsIGxpbmUgNjQsIGluCjxtb2R1bGU+CiAgRmlsZSAiL3Vz
ci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL2JpdHN0cmluZy9iaXRzLnB5IiwgbGluZSAx
NSwgaW4gPG1vZHVsZT4KTW9kdWxlTm90Rm91bmRFcnJvcjogTm8gbW9kdWxlIG5hbWVkICdiaXRh
cnJheScKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiDCoFJlZ2FyZHMsCj4gwqBBcm5vdXQK
PiAKPj4gLS0tCj4+IMKgIHBhY2thZ2UvcHl0aG9uLWJpdHN0cmluZy9weXRob24tYml0c3RyaW5n
Lmhhc2ggfCA0ICsrLS0KPj4gwqAgcGFja2FnZS9weXRob24tYml0c3RyaW5nL3B5dGhvbi1iaXRz
dHJpbmcubWvCoMKgIHwgNCArKy0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYml0
c3RyaW5nL3B5dGhvbi1iaXRzdHJpbmcuaGFzaAo+PiBiL3BhY2thZ2UvcHl0aG9uLWJpdHN0cmlu
Zy9weXRob24tYml0c3RyaW5nLmhhc2gKPj4gaW5kZXggYzJmZjlhNjlkNS4uMTg4OTk4M2Y0NyAx
MDA2NDQKPj4gLS0tIGEvcGFja2FnZS9weXRob24tYml0c3RyaW5nL3B5dGhvbi1iaXRzdHJpbmcu
aGFzaAo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1iaXRzdHJpbmcvcHl0aG9uLWJpdHN0cmluZy5o
YXNoCj4+IEBAIC0xLDUgKzEsNSBAQAo+PiDCoCAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9w
eXBpLm9yZy9weXBpL2JpdHN0cmluZy9qc29uCj4+IC1tZDXCoCAxNzUwYzM1ZThlNDVmNTk3NzI1
MDM3ZDM1ZWVkOWJhMcKgIGJpdHN0cmluZy00LjEuMi50YXIuZ3oKPj4gLXNoYTI1NsKgIGMyMjI4
M2Q2MGZkM2UxYThmMzg2Y2NkNGYxOTE1ZDdmZTEzNDgxZDYzNDlkYjM5NzExNDIxZTI0ZDRhOWNj
Y2bCoAo+PiBiaXRzdHJpbmctNC4xLjIudGFyLmd6Cj4+ICttZDXCoCAzOTA5NDE1ZDg5NTg2ZWRh
YmQ1NzdiNjJiMGQwYzFiZcKgIGJpdHN0cmluZy00LjEuNC50YXIuZ3oKPj4gK3NoYTI1NsKgIDk0
ZjNmMWM0NTM4M2ViZThmZDRhMzU5NDI0ZmZlYjc1YzJmMjkwNzYwYWU4ZmNhYzQyMWI0NGY4OWFj
ODUyMTPCoAo+PiBiaXRzdHJpbmctNC4xLjQudGFyLmd6Cj4+IMKgICMgTG9jYWxseSBjb21wdXRl
ZCBzaGEyNTYgY2hlY2tzdW1zCj4+IMKgIHNoYTI1NsKgIDM3MDVlZWQ1YTkyM2YzNWQ5YmZhY2Ex
ZjEwZTkxMzZjYzg0ZDZlNTc2NTcwYWVjNjYxYmRhNjk5OTFmMTI5ZWHCoAo+PiBMSUNFTlNFCj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1iaXRzdHJpbmcvcHl0aG9uLWJpdHN0cmluZy5t
awo+PiBiL3BhY2thZ2UvcHl0aG9uLWJpdHN0cmluZy9weXRob24tYml0c3RyaW5nLm1rCj4+IGlu
ZGV4IDlhNWQ4ZGZlODQuLjk4MzQ5MTMwM2QgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9u
LWJpdHN0cmluZy9weXRob24tYml0c3RyaW5nLm1rCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWJp
dHN0cmluZy9weXRob24tYml0c3RyaW5nLm1rCj4+IEBAIC00LDkgKzQsOSBAQAo+PiDCoCAjCj4+
IMKgCj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+IMKgIC1QWVRIT05fQklUU1RSSU5HX1ZF
UlNJT04gPSA0LjEuMgo+PiArUFlUSE9OX0JJVFNUUklOR19WRVJTSU9OID0gNC4xLjQKPj4gwqAg
UFlUSE9OX0JJVFNUUklOR19TT1VSQ0UgPSBiaXRzdHJpbmctJChQWVRIT05fQklUU1RSSU5HX1ZF
UlNJT04pLnRhci5nego+PiAtUFlUSE9OX0JJVFNUUklOR19TSVRFID0KPj4gaHR0cHM6Ly9maWxl
cy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzIzL2ZjL2I1YWNlNGY1MWZlYTViY2M3ZjhjY2E4
ODU5NzQ4ZWE1ZWI5NDE2ODBiODJhNWIzNjg3Yzk4MGQ5NTg5Ygo+PiArUFlUSE9OX0JJVFNUUklO
R19TSVRFID0KPj4gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzdmLzA3
LzBmZDUwMmEyOTEyN2I5NjhiYWRhM2QxODI0YThhZjk5NzU0NmQyYjlmZjczZjAwZTgwMGIzZDk4
ODhjYgo+PiDCoCBQWVRIT05fQklUU1RSSU5HX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4+IMKg
IFBZVEhPTl9CSVRTVFJJTkdfTElDRU5TRSA9IE1JVAo+PiDCoCBQWVRIT05fQklUU1RSSU5HX0xJ
Q0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
