Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51B2C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B081560D6F;
	Wed, 16 Apr 2025 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abTOA5GleelL; Wed, 16 Apr 2025 21:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9AAB61410
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9AAB61410;
	Wed, 16 Apr 2025 21:01:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DCF16159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE0C761410
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7TCzLNg1VcV for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BA4260A7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA4260A7B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BA4260A7B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:00:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 953CF1C1032; Wed, 16 Apr 2025 23:00:57 +0200 (CEST)
Message-ID: <3bc0f7e2-1363-4c04-876d-7e63670ccc39@rnout.be>
Date: Wed, 16 Apr 2025 23:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250327182911.944142-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250327182911.944142-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837257; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JzZ4tKWzh1i/PVnNDl4fGrhZBeokH93mgUjCHfvqtBg=;
 b=MZHtGiqUVTNz4g9zGmxXa0WWW3Mn4nFPegsW6z4idWd6UxwMKCr0Oo+3VcC/WgKJCt593v
 Fi37rtU9Ac24Ws0DNbnAWCOekni6X43NUPXGfw82ZnWg4O0rnMLqUVota3/rIsKpoO5Hcw
 r1TUyXozS6kfSlJJWSTnVRXrTtT0BPVFUAoOLhITn02MuTrXX0ergQwxYWJHRLZaSyYtsx
 zbhz4rA58D0mEwGAVu0GQAIsCTcENqamIG5BIf2d0K0Viw87cTLepWw16YbRyyCv+lFIN2
 YVZa1UYLmkMVA7Tk9UayNkBm/WRNDnWPPcDFUZ4M8dtjXnYMFHLyIJdI/XeZVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/kodi-pvr-waipu: bump version to
 21.10.1-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI3LzAzLzIwMjUgMTk6MjksIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCwg
dGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9rb2RpLXB2
ci13YWlwdS9rb2RpLXB2ci13YWlwdS5oYXNoIHwgMiArLQo+ICAgcGFja2FnZS9rb2RpLXB2ci13
YWlwdS9rb2RpLXB2ci13YWlwdS5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9rb2Rp
LXB2ci13YWlwdS9rb2RpLXB2ci13YWlwdS5oYXNoIGIvcGFja2FnZS9rb2RpLXB2ci13YWlwdS9r
b2RpLXB2ci13YWlwdS5oYXNoCj4gaW5kZXggMWUyNWQ0ZDljYS4uYTAzNDliNGQ3NyAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2tvZGktcHZyLXdhaXB1L2tvZGktcHZyLXdhaXB1Lmhhc2gKPiArKysg
Yi9wYWNrYWdlL2tvZGktcHZyLXdhaXB1L2tvZGktcHZyLXdhaXB1Lmhhc2gKPiBAQCAtMSwzICsx
LDMgQEAKPiAgICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDFkOWNiOTI3YzFjNTQ3Zjgy
YzY2NzMwZDUyZDE0MjVhZWQwOGExM2MyMzcxMDRlYTM3N2M5ODcxYzI2YzcwOTcgIGtvZGktcHZy
LXdhaXB1LTIxLjEwLjAtT21lZ2EudGFyLmd6Cj4gK3NoYTI1NiAgZmI4ZjI1ZjI4MDIzOTA3MzMy
ZDNlYmY1NTRjMDI2YzZlMzZlM2U3OGY2ODhmNDYyNDM5YzE1MmRlNjc2NzM0YyAga29kaS1wdnIt
d2FpcHUtMjEuMTAuMS1PbWVnYS50YXIuZ3oKPiAgIHNoYTI1NiAgNDIwMmQ0ZmIzMjlmNThjODNi
YTkyMWI1NmQ3MDcxZTM3ZjdkZjNmMTViMzgyMGEzYTA0ZWY4ZWVlNDlmNTRkMiAgcHZyLndhaXB1
L0xJQ0VOU0UudHh0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva29kaS1wdnItd2FpcHUva29kaS1w
dnItd2FpcHUubWsgYi9wYWNrYWdlL2tvZGktcHZyLXdhaXB1L2tvZGktcHZyLXdhaXB1Lm1rCj4g
aW5kZXggN2I1NTUyNDM4ZC4uNTQwODBmMjEzZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2tvZGkt
cHZyLXdhaXB1L2tvZGktcHZyLXdhaXB1Lm1rCj4gKysrIGIvcGFja2FnZS9rb2RpLXB2ci13YWlw
dS9rb2RpLXB2ci13YWlwdS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1LT0RJX1BWUl9XQUlQVV9WRVJTSU9OID0gMjEuMTAuMC1P
bWVnYQo+ICtLT0RJX1BWUl9XQUlQVV9WRVJTSU9OID0gMjEuMTAuMS1PbWVnYQo+ICAgS09ESV9Q
VlJfV0FJUFVfU0lURSA9ICQoY2FsbCBnaXRodWIsZmx1YnNoaSxwdnIud2FpcHUsJChLT0RJX1BW
Ul9XQUlQVV9WRVJTSU9OKSkKPiAgIEtPRElfUFZSX1dBSVBVX0xJQ0VOU0UgPSBHUEwtMi4wKwo+
ICAgS09ESV9QVlJfV0FJUFVfTElDRU5TRV9GSUxFUyA9IHB2ci53YWlwdS9MSUNFTlNFLnR4dApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
