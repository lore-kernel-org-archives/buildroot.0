Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAD2CCF9F0
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 11:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF7661C72;
	Sat,  1 Nov 2025 11:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nn2WEajB1Nia; Sat,  1 Nov 2025 11:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F57861C76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F57861C76;
	Sat,  1 Nov 2025 11:33:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E0E32A3
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 11:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F87284E5A
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 11:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmEJXMGh6efT for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 11:33:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2D7384E4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2D7384E4C
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2D7384E4C
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 11:33:03 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:d22d:75e:232:4e59] (unknown
 [IPv6:2a01:e0a:12:eba0:d22d:75e:232:4e59])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 0F2E3BFF9D;
 Sat,  1 Nov 2025 12:32:59 +0100 (CET)
Message-ID: <6cdfde92-251c-4515-9906-a1cf4d34a692@grenoble.cnrs.fr>
Date: Sat, 1 Nov 2025 12:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251101102346.109307-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20251101102346.109307-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1761996780;
 bh=uCyZ4kBG280KFXTAQemtnHuCmz6dtdo6Gxej0rpoKj0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mG4hAGEhQJDqoYfSzjNWRVYTvllr6l+Ifcd0ftjuIgYIULwQClUdoXFYkRzuuQFJ/
 kElSERW20Zx5SFRdjwYY2blbtBqXN+z1gp4g1XyhwlESkE/yK9KAzZPy2JceLX/IJK
 4xk9kadcdLpAnigKScpVjp5u+cQNIMPhvJF7qvsY7U8M1UAp2NQr1qMMEsFkt3AyYX
 iqVn/a/KlnkdC4yIW48AkWAlxDmS9ferwM/hFEppjdB/G9ZLstV419W2TZbcqo9Iiw
 0t2xZ5voDA0RHpQ50rFfBw9nUIMUoqvBi2fOYGfscAHrVJJKebwehOHEq5Ve+SWVzx
 vmRMkPFfHoo4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=mG4hAGEh
Subject: Re: [Buildroot] [PATCH 1/1] linux: enable
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL for CIP kernels and all archs
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpPbiAwMS8xMS8yMDI1IDExOjIzLCBCZXJuZCBLdWhscyB3cm90ZToKPiBGaXhlcyBi
dWlsZCBlcnJvcnMgd2l0aCBDSVAga2VybmVsczoKPiBzY3JpcHRzL2V4dHJhY3QtY2VydC5jOjIx
OjEwOiBmYXRhbCBlcnJvcjogb3BlbnNzbC9iaW8uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQo+ICAgIDIxIHwgI2luY2x1ZGUgPG9wZW5zc2wvYmlvLmg+Cj4gCj4gYW5kIHNpbWlsYXIgYnVp
bGQgZXJyb3JzIHdpdGggdmFuaWxsYSBrZXJuZWwgb24gb3RoZXIgYXJjaHMuCj4gCj4gSW5zdGVh
ZCBvZiBhZGRpbmcgbW9yZSBhbmQgbW9yZSBhcmNocyB3ZSBzZWxlY3QgaG9zdC1vcGVuc3NsIGZv
ciBhbGwKPiBhcmNocy4KPiAKPiBGaXhlczoKPiAtIGxpbnV4Ogo+IGFybTogaHR0cHM6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2RkNS9kZDU1ODFkZDI4NjFkNWNhODY3NDZhNWFh
ZGIzNGQxZGFkOWE1YzBhLwo+IGFybWViOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvMGY2LzBmNjI4MGU4NzIzMTBhMjdjMGNmMDRmOWE5Yjk4ZDg1ODk5MmZiZTcvCj4g
aTY4NjogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2FhNy9hYTc4Y2E3
MDYyZWE3MGU1MmUwY2EwZTQ4MGVmMmZlMjE4OTExMzM0Lwo+IGxvb25nYXJjaDY0OiBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNzEzLzcxMzNiZTg3NGFlOTBiM2UxNjQ5
NzY0YmU4ZTVlZTcwZDNmZDM1ZDEvCj4gbWlwczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzL2YzYy9mM2M5MDYwNzc3ZjhkZjAzZGNhNTU5NGRlODcwMDgzM2ZhZmNiNzEy
Lwo+IG1pcHNlbDogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2YzNi9m
MzZhZWNjZTNjOTE5NzllMTE1MTQyOWNmZTE1OGQzMzk4ZmU3MDYyLwo+IG1pcHM2NDogaHR0cHM6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzI5My8yOTMwODFjMGY4YWU0NWE5ZmE0
MmQyNzUyMDhlM2VmZTVjMzllMmI4Lwo+IG1pcHM2NGVsOiBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3QubmV0L3Jlc3VsdHMvM2M2LzNjNjM3YjdhODA2NjQwZTk0MDUzN2Y4NTZiYTcxNjNiODk0
MDc3ZjkvCj4gcG93ZXJwYzogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
LzIwZS8yMGVlMzg0NTNhMjNmZGIyM2Y4ZGI4YWYxYWI5Njg1YzA0NWYzOGI1Lwo+IHBvd2VycGM2
NDogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzA0NC8wNDQyMzdiOGNm
ODM4Mjg5MjM4OGJiMjI0ZWRmYjAxMjVlYzM4ZDQyLwo+IHMzOTB4OiBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMjI4LzIyOGI4M2M3MmQ4N2ZjNmYwMzU3ZjBiNzdkYjQy
MzBjNTZkZDQ1ZjkvCj4gc3BhcmM2NDogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9y
ZXN1bHRzLzhkMS84ZDExMmZjYmExYzkxNGIzZGI3MGQ0YTM5ZjIyM2JkYzhjZTk3ODhhLwo+IAo+
IC0gbGludXgtY2lwOgo+IGFhcmNoNjQ6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
cmVzdWx0cy9mOTEvZjkxMGMxZTBlODY0MDU1MTIwZTJkZWFmNGQ1NmIxMjdjYWJiODliZC8KPiBh
YXJjaDY0X2JlOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNmU2LzZl
NjUxYzU4NmY5YjJhMWM5YjM5Y2FmYWY1YmViYzhiNTAxZTgzNjkvCj4gYXJjZWI6IGh0dHBzOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9kZGIvZGRiNWQ5Njc4MjJjMTI3YzYxYTFi
MDMxMWQ2YTBhODFkY2ZhOWY1YS8KPiBhcmNsZTogKG5vdCBmb3VuZCBvbiBhdXRvYnVpbGRlcnMp
Cj4gYXJjYmU6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85ZmUvOWZl
N2I0YzY2YWMxMzk5MjZlOWEzNjg2YmM5NTFhZjcwM2U3OGIyOS8KPiBhcm06IGh0dHBzOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yODgvMjg4OGIwYjZmNTQ3M2U5YzdlYzdjNDQz
YjAyYjQyZTFmNWQ0YzgxNC8KPiBhcm1lYjogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzL2Q2Yy9kNmNiYmZkY2JlYmU5ODVkNzQzMjMyMDcwODI0Nzc5ZTc5MGFhNWE4Lwo+
IG1pY3JvYmxhemVlbDogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2Jm
My9iZjNiNGM2MWNkYWYzNTI3ZTllMzE1MDUwYmYyMTQ1NmJiYjI0YTQ4Lwo+IG1pcHM6IGh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9jNmIvYzZiOWM4MjM1MmJlMDFkZDRi
YWIyMDIxYTIyM2U3MmRmYWYxZjUyMi8KPiBvcjFrOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJv
b3QubmV0L3Jlc3VsdHMvMjMxLzIzMTQ0YTgxMDhjNTgzN2UzYTljZjI2YWQ2YWM3M2ZhMTZkYzc0
MGYvCj4gcmlzY3Y6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8zMWMv
MzFjM2FiZGIyM2JmZTE2ZTI0OGUwOTRlOWIwZmVhZmJiYjBkNmE5NC8KPiBzMzkweDogaHR0cHM6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2JkYS9iZGFhZjY3NjdmOGMyMzliYmYy
MmU0NjE5YjJkNjk0NGVmOTUxYjJlLwo+IHNwYXJjOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJv
b3QubmV0L3Jlc3VsdHMvNDI2LzQyNjE0Zjc3YmU5ZmExYjNhNTk2Y2RjYjQwY2ZiODFmNTQ5NmI0
MWIvCj4gc3BhcmM2NDogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzFm
Mi8xZjIyNmQwMjhkODVjMDg1ZDgyZjM4OTBlODA0YjM5YmNjZDJjMmRjLwo+IHg4Nl82NDogaHR0
cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzdiZS83YmU4NmMyNjFhNDJlMWEx
NmMzZDM4YTY0MGJlMjI2YjVmNTFiY2NiLwo+IAo+IGFuZCBtYXliZSBtb3JlLi4uCj4gCj4gU2ln
bmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0KPiAgbGludXgv
Q29uZmlnLmluIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saW51eC9Db25maWcuaW4gYi9saW51eC9D
b25maWcuaW4KPiBpbmRleCA3ZjE0MjZjOTkxLi5lZGUxMjc1NDExIDEwMDY0NAo+IC0tLSBhL2xp
bnV4L0NvbmZpZy5pbgo+ICsrKyBiL2xpbnV4L0NvbmZpZy5pbgo+IEBAIC0xNzksOSArMTc5LDgg
QEAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUcKPiAgCSMg
cmVxdWlyZXMgaG9zdC1vcGVuc3NsLCBzbyBzZWxlY3QgaXQgZm9yIHRoZSBsYXRlc3Qga2VybmVs
Cj4gIAkjIHZlcnNpb24uIFRoaXMgaXMgbWFpbmx5IG5lZWRlZCB0byBmaXggYXV0b2J1aWxkZXIg
dGVzdGluZy4KPiAgCXNlbGVjdCBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTCBp
ZiBcCj4gLQkgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9MQVRFU1RfVkVSU0lPTiAmJiBcCj4gLQkg
ICAgICAgKEJSMl9hYXJjaDY0IHx8IEJSMl9hYXJjaDY0X2JlIHx8IEJSMl9hcmNsZSB8fCBCUjJf
YXJjZWIgfHwgXAo+IC0JICAgICAgICBCUjJfb3IxayB8fCBCUjJfcmlzY3YgfHwgQlIyX3NwYXJj
IHx8IEJSMl94ODZfNjQpCj4gKwkgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9MQVRFU1RfVkVSU0lP
TiB8fCBcCj4gKwkgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9MQVRFU1RfQ0lQX1ZFUlNJT04KPiAg
CWhlbHAKPiAgCSAgVGhpcyBvcHRpb24gd2lsbCB1c2UgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlv
biBmb3IgdGhlCj4gIAkgIHNlbGVjdGVkIGFyY2hpdGVjdHVyZS4gSS5lLCBpdCBpcyBlcXVpdmFs
ZW50IHRvIHJ1bm5pbmcKCk1heWJlIHVwZGF0ZSB0aGUgY29tbWVudCB0aGF0IGNvbWVzIHJpZ2h0
IGJlZm9yZTog4oCcc2VsZWN0IGl0IGZvciB0aGUgbGF0ZXN0Cmtlcm5lbCB2ZXJzaW9uIGFuZCB0
aGUgbGF0ZXN0IENJUCB2ZXJzaW9uLuKAnQoKUmVnYXJkcywKCkVkZ2FyLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
