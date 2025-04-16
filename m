Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1774C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C30607C0;
	Wed, 16 Apr 2025 20:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vuh_9cCRl9Qb; Wed, 16 Apr 2025 20:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A74617A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A74617A6;
	Wed, 16 Apr 2025 20:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BC48159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5100683ABD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reB7gue-gDqZ for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 638C0847E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 638C0847E0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 638C0847E0
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:45:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4FBBA1C1044; Wed, 16 Apr 2025 22:45:36 +0200 (CEST)
Message-ID: <7329f68a-f9ed-4aa4-bf6c-cda091a68634@rnout.be>
Date: Wed, 16 Apr 2025 22:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Colin Evrard <colin.evrard@essensium.com>, buildroot@buildroot.org
Cc: Colin Evrard <colin.evrard@mind.be>,
 Frank Vanbever <frank.vanbever@mind.be>
References: <20250318083905.45217-1-colin.evrard@mind.be>
Content-Language: en-GB
In-Reply-To: <20250318083905.45217-1-colin.evrard@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744836336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cn6WNnMhHbycnJvUp5GOHbKfzi3KoqYSbWu9tqC1b/0=;
 b=RakHFX119yLfMncdod6U4UlaXRqYI3p56R6+uLZVYZlCNsSo/DTYHHCn3AihlxE0Qr6v/t
 i3lEzdaMK0qzNRMwhuvo36J+Grk1bwHQ/5JLEfKYIPoqON+yjFYbfe4YYPMQvKmZuLKlpP
 NHCwafrrnCq7hVAsyTDiS7ZoWvanwdmr+BxQ72E2K1IK5XDL4yjfE9q+cBNotVBaJunpNU
 a+CU8bwLZjlDUAEgRIu/gYaln2eglQlvuYTGnqS3+VmePdInoAAdnckF9xqLlwzMu1R58T
 YrWFpETZ7AoLqeWIjMBR1zK5ezC09RC+sHclaYp9nn//bVVZDIPcGs46ec7SAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/libmodsecurity: security bump to
 3.0.14
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

Ck9uIDE4LzAzLzIwMjUgMDk6MzksIENvbGluIEV2cmFyZCB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IFRoZSBwcm9qZWN0IGhhcyBiZWVuIHVwZGF0ZWQsIGluY2x1ZGluZwo+IHNlY3VyaXR5IGZpeGVz
IHRvIGlzc3VlcyBwcmVzZW50IGluIHZlcnNpb24gMy4wLjEzLgo+Cj4gLSBGaXhlczoKPiAgICBo
dHRwczovL2N2ZS5taXRyZS5vcmcvY2dpLWJpbi9jdmVuYW1lLmNnaT9uYW1lPUNWRS0yMDI1LTI3
MTEwCj4KPiAtIEZvciBhIGZ1bGwgY2hhbmdlbG9nLCB2aXNpdDoKPiAgICBodHRwczovL2dpdGh1
Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHkvYmxvYi92My4wLjE0L0NIQU5HRVMK
Pgo+IFNpZ25lZC1vZmYtYnk6IENvbGluIEV2cmFyZCA8Y29saW4uZXZyYXJkQG1pbmQuYmU+Cgog
wqBBcHBsaWVkIHRvIDIwMjUuMDIueCwgMjAyNC4xMS54IGFuZCAyMDI0LjAyLngsIHRoYW5rcy4K
CiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvbGlibW9kc2VjdXJpdHkv
bGlibW9kc2VjdXJpdHkuaGFzaCB8IDUgKystLS0KPiAgIHBhY2thZ2UvbGlibW9kc2VjdXJpdHkv
bGlibW9kc2VjdXJpdHkubWsgICB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibW9kc2Vj
dXJpdHkvbGlibW9kc2VjdXJpdHkuaGFzaCBiL3BhY2thZ2UvbGlibW9kc2VjdXJpdHkvbGlibW9k
c2VjdXJpdHkuaGFzaAo+IGluZGV4IDcwNGI1NTQxYWQuLjgyMTQ1OWY2YjkgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9saWJtb2RzZWN1cml0eS9saWJtb2RzZWN1cml0eS5oYXNoCj4gKysrIGIvcGFj
a2FnZS9saWJtb2RzZWN1cml0eS9saWJtb2RzZWN1cml0eS5oYXNoCj4gQEAgLTEsNSArMSw0IEBA
Cj4gLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJp
dHkvcmVsZWFzZXMvZG93bmxvYWQvdjMuMC4xMy9tb2RzZWN1cml0eS12My4wLjEzLnRhci5nei5z
aGEyNTYKPiAtc2hhMjU2ICA4NmI0ODgxMTY0YTE2MWI4MjJhNDlkZjM1MDFlODNiMjU0MzIzMjA2
OTA2MTM0YmRjMzRhNmYzMzM4ZjRkM2YyICBtb2RzZWN1cml0eS12My4wLjEzLnRhci5nego+IC0K
PiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9vd2FzcC1tb2RzZWN1cml0eS9Nb2RTZWN1cml0
eS9yZWxlYXNlcy9kb3dubG9hZC92My4wLjE0L21vZHNlY3VyaXR5LXYzLjAuMTQudGFyLmd6LnNo
YTI1Ngo+ICtzaGEyNTYgIGY3NTk5MDU3YjM1ZTY3YWI2MTc2NDI2NWRhZGRmOWFiMDNjMzVjZWUx
ZTU1NTI3NTQ3YWZiMDczY2U4ZjA0ZTggIG1vZHNlY3VyaXR5LXYzLjAuMTQudGFyLmd6Cj4gICAj
IExvY2FsbHkgY2FsY3VsYXRlZAo+ICAgc2hhMjU2ICBjNzFkMjM5ZGY5MTcyNmZjNTE5YzZlYjcy
ZDMxOGVjNjU4MjA2MjcyMzJiMmY3OTYyMTllODdkY2YzNWQwYWI0ICBMSUNFTlNFCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGlibW9kc2VjdXJpdHkvbGlibW9kc2VjdXJpdHkubWsgYi9wYWNrYWdl
L2xpYm1vZHNlY3VyaXR5L2xpYm1vZHNlY3VyaXR5Lm1rCj4gaW5kZXggZjZhNzRlMTNkNS4uYTkw
ZmExZDYxNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYm1vZHNlY3VyaXR5L2xpYm1vZHNlY3Vy
aXR5Lm1rCj4gKysrIGIvcGFja2FnZS9saWJtb2RzZWN1cml0eS9saWJtb2RzZWN1cml0eS5tawo+
IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+
IC1MSUJNT0RTRUNVUklUWV9WRVJTSU9OID0gMy4wLjEzCj4gK0xJQk1PRFNFQ1VSSVRZX1ZFUlNJ
T04gPSAzLjAuMTQKPiAgIExJQk1PRFNFQ1VSSVRZX1NPVVJDRSA9IG1vZHNlY3VyaXR5LXYkKExJ
Qk1PRFNFQ1VSSVRZX1ZFUlNJT04pLnRhci5nego+ICAgTElCTU9EU0VDVVJJVFlfU0lURSA9IGh0
dHBzOi8vZ2l0aHViLmNvbS9vd2FzcC1tb2RzZWN1cml0eS9Nb2RTZWN1cml0eS9yZWxlYXNlcy9k
b3dubG9hZC92JChMSUJNT0RTRUNVUklUWV9WRVJTSU9OKQo+ICAgTElCTU9EU0VDVVJJVFlfSU5T
VEFMTF9TVEFHSU5HID0gWUVTCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
