Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701AEC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E84260BBA;
	Wed, 16 Apr 2025 21:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPL6ozvFQvGp; Wed, 16 Apr 2025 21:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C09FF607AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C09FF607AD;
	Wed, 16 Apr 2025 21:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1868159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C76A74013C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92Oghv-8K7rT for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7878D400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7878D400D0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7878D400D0
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:37:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C1031C0083; Wed, 16 Apr 2025 23:37:23 +0200 (CEST)
Message-ID: <c4369a35-a070-4d57-ab71-e3e0ee4afec3@rnout.be>
Date: Wed, 16 Apr 2025 23:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
References: <20250406162641.521533-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20250406162641.521533-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kZvaZnvO2FD7EGxOc5POpMIOpjUA7xRAi4KobK35zYs=;
 b=LDntf/cxUH2d4rCi/eLbfV8cbqvC5GODEGo4AMR18HT1t3FbcRmzWDj5u2BXDun5nOhS5z
 PU9jZb+u4CdLSsPZ83ZtXi5paRtgpoMu9Uza7fgq8reNaVyQa+IaCALk1C0Vmxn84hrFZ+
 fdNOabXgq2QrtbUq+dRLced43ryYqbPcof7QG22lHUCHLElwyAC2GYbnqJFaJyNA8byVWS
 p9zlWWVpLYXGAv1hr3D6w0oJ699H2rm4uTgavSM5XhXZKxUJK6A3zs6k+AyTFl2tg7qv0D
 +mxcmXfsSAl2Fx0s0C26XBp8aKHld464/t4c0nTU/hIKlVX/j3NV41OYuCmeQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/4] configs/ls1028ardb: linux needs
 host-openssl
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

Ck9uIDA2LzA0LzIwMjUgMTg6MjYsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+IFNpbmNlIEJ1aWxk
cm9vdCBjb21taXQgWzFdIHVwZGF0aW5nIHRoZSBkZWZjb25maWcgdG8gdXNlIEtlcm5lbCA2LjYu
eAo+IHNlcmllcywgdGhlIGJ1aWxkIGNhbiBmYWlsIHdpdGggZXJyb3I6Cj4KPiAgICAgIGNlcnRz
L2V4dHJhY3QtY2VydC5jOjIxOjEwOiBmYXRhbCBlcnJvcjogb3BlbnNzbC9iaW8uaDogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQo+Cj4gVGhlIGlzc3VlIGlzIGdlbmVyYWxseSBtYXNrZWQgYnkg
dGhlIGJ1aWxkIG9yZGVyLCBhcwo+IGFybS10cnVzdGVkLWZpcm13YXJlIHNlbGVjdHMgQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9GSVA9eQo+IHdoaWNoIHJlcXVpcmVzIGhvc3Qtb3Bl
bnNzbC4KPgo+IFRoZSBpc3N1ZSBjYW4gYmUgcmVwcm9kdWNlZCBpbiB0aGUgQnVpbGRyb290IERv
Y2tlciByZWZlcmVuY2UgaW1hZ2UsCj4gdXNpbmcgdGhlIGNvbW1hbmRzOgo+Cj4gICAgICB1dGls
cy9kb2NrZXItcnVuCj4gICAgICBtYWtlIGxzMTAyOGFyZGJfZGVmY29uZmlnCj4gICAgICBtYWtl
IGxpbnV4Cj4KPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGUgaXNzdWUgYnkgZXhwbGljaXRseSBhZGRp
bmcKPiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15IHRvIHRoZSBkZWZjb25m
aWcuCj4KPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
Y29tbWl0LzdjYmMyNDBhYzJjM2E1ZDdjYmJlYzk4MjZmYjk5ODU0YmRkMTU2YTcKPgo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgogwqBBcHBsaWVkIHNlcmll
cyB0byAyMDI1LjAyLnggYW5kIDIwMjQuMTEueCAob25seSBmaXJzdCB0d28pLCB0aGFua3MuCgog
wqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4gTm90ZTogSSBmb3VuZCB0aG9zZSBpc3N1ZXMg
d2hpbGUgcmV2aWV3aW5nIGFuZCB0ZXN0aW5nIHBhdGNoZXMgaW46Cj4gaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9NDUwNDQyCj4gU28g
SSByZWNvbW1lbmQgdG8gYXBwbHkgdGhpcyBzZXJpZXMgZmlyc3QuCj4gLS0tCj4gICBjb25maWdz
L2xzMTAyOGFyZGJfZGVmY29uZmlnIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPgo+IGRpZmYgLS1naXQgYS9jb25maWdzL2xzMTAyOGFyZGJfZGVmY29uZmlnIGIvY29u
Zmlncy9sczEwMjhhcmRiX2RlZmNvbmZpZwo+IGluZGV4IDBkMTg0M2JmNWYuLjdiMjRhNDFjZDkg
MTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9sczEwMjhhcmRiX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZp
Z3MvbHMxMDI4YXJkYl9kZWZjb25maWcKPiBAQCAtMTgsNiArMTgsNyBAQCBCUjJfTElOVVhfS0VS
TkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iJChMSU5VWF9ESVIpL2FyY2gvYXJtNjQvY29uZmln
cy9sc2RrLmNvbgo+ICAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gICBCUjJfTElO
VVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iZnJlZXNjYWxlL2ZzbC1sczEwMjhhLXJkYiIKPiAg
IEJSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9eQo+ICtCUjJfTElOVVhfS0VSTkVMX05F
RURTX0hPU1RfT1BFTlNTTD15Cj4gICBCUjJfUEFDS0FHRV9RT1JJUV9DQURFTkNFX0RQX0ZJUk1X
QVJFPXkKPiAgIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQo+ICAgQlIyX1RBUkdFVF9ST09URlNf
RVhUMl80PXkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
