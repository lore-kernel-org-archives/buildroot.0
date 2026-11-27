Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AB606A326
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F5ASsLdS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC3260B3F;
	Fri, 27 Nov 2026 13:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yngUxiy_z3MC; Fri, 27 Nov 2026 13:26:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 74EE960AC4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795785995;
	b=CnKs9ha0t4iM1H15PuBmjlcxewOH+FGrbXQrWWUL425p/xjo/6KlVCJncBDguaVu90or
	 J8zMJLnqrfHdVpOH4iuDl7t9/btqtIwoCDq9eVA4+Xu9p9hKqYchmAcc09Xtv2O8Q4hPZ
	 aTDjQk73pQAou/fkgdH7UzbMZ2dj5R/8iRpMJoWQEF/x6hYzNwUVWfQ15V9qO6cdgDCM+
	 FG6zLpQaCpPaXeQPaTJLLJcf4DRAz9yLUm+3cIrkZu4pEEZOpwBjqnJg5UEwsPXlnSgtP
	 jAxl/feWL6KUUztdvwAhN8hG1a4yWd64wU8Vdup/RS3YjtSe3G4MoKwhQUxTZKW7dig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795785995;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:Message-Id:MIME-Version:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=T/3l92z8XroH/jYKjV8lS/U27+pL+yS8I1HdTnyYZG8=;
	b=U40u3IcHgTnmqMzhhePfMrfWtlKm74ZAGVE/eMlKDKnFt65qq95EqMp6qYKXlHYAgyyn
	 e9HErHzu7LhYar73Dfxlga1sCdnwKLgG/WWlR4frdLjCCeNjI2vLGRkTlpzUfQdoxCCWF
	 RlT625nkqxMd2bmnswV0Q/ygnwFken0pzFn7tQbQT+KGO2y7n17iUkTCLGOAXa00t+hEn
	 KZe9ClsO0AGTPG1KzzyqMCdxevpd7GMhLny6YcEwAAkCy6ppPLNUvLOeCMf0zwz82k7DA
	 +kPirYE0XVRrWz6ssMzQuOQspXZZqs1sin42K9S4z1esB+EifcHREkNXw06ybRCBiMg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795785995;
	bh=T/3l92z8XroH/jYKjV8lS/U27+pL+yS8I1HdTnyYZG8=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=F5ASsLdS2w5AXhqS0bKlwwFf+NYAZ7eFwigrxtGYGsmC3lKNkpWHDvQ2TYB1z0SFU
	 DUKD0kCmg/WKbLRrKa3YUtpU4oA5q2fBwlNY06LX7tYD9riRGMCiG84f8AS/v7XORo
	 sohXu6Z5YiKs0IM9pwEcc22cXmbkde46dmzCsZjASgWlpETjArZRawQwjb7+lWdN8S
	 25VmvUv2bnvL7AtBJ958yRMG9TcMZ3mYwMdPWbU5PFU8SVQnT3NqviKX1UhkOllDPm
	 n0RF7mMYSSNPOL4lfuJUgr2AKXVLpM6cZaM3fnm6voT2NYkuwLtYgowKLJ/EfpYEuY
	 zpmCrkFdkz6vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74EE960AC4;
	Fri, 27 Nov 2026 13:26:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0543526D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF2F981225
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYtuvDwrvuw2 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 13:26:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F24A681205
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=theo.lebrun@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F24A681205
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:26:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D105D4E417C3;
 Fri, 27 Nov 2026 13:26:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A4A0F6049C;
 Fri, 27 Nov 2026 13:26:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D5B711E68A6A; Fri, 27 Nov 2026 14:26:25 +0100 (CET)
Date: Fri, 27 Nov 2026 14:26:22 +0100
Message-Id: <20261127-xdp-tools-tleb-v2-0-686bf38f45b8@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP6ECWsC/3WNwQ6CMBBEf4Xs2TWlAgFP/ofhQMsia5AlbSUYw
 r9b8OxhDi+ZebOCJ8fk4Zqs4GhmzzJG0KcEbN+MD0JuI4NWulClLnFpJwwig8cwkEGVZzazZUx
 nII4mRx0vh/Be/9i/zZNs2C17o2cfxH2Oxznde3/lc4oKs+JidW7ypqrMzYiEgcezlRfU27Z9A
 RYjotvAAAAA
X-Change-ID: 20260828-xdp-tools-tleb-054c4c8c4cfb
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 0/2] Add xdp-tools package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SmltbXkgRFcgWzBdIHNlbnQgaW4gRmVicnVhcnkgMjAyNiBhIHNlcmllcyBhZGRpbmcgYW4geGRw
LXRvb2xzIHBhY2thZ2UsCndoaWNoIHVzZWQgaG9zdC1nY2MgYXMgdGhlIGNvbXBpbGVyLiBUaGF0
IHdhcyBhIGJpZyBzdGVwIGZvcndhcmQsIGJ1dAptYXliZSB0b28gYmlnLiBTbyBJIGl0ZXJhdGVk
IHNlbmRpbmcgbXkgdjEgWzFdIGluIEF1Z3VzdCAyMDI2IHVzaW5nCmhvc3QtbGx2bSB0byBidWls
ZCBCUEYgcHJvZ3JhbXMuCgpIZXJlIGlzIHYyIG9mIHRoYXQgc2VyaWVzLiBUaGUgZ29hbCBpcyB0
byBtZXJnZSB0aGlzIGZpcnN0IHRoZW4gaXRlcmF0ZQp0byBhZGQgaG9zdC1nY2Mgc3VwcG9ydCBv
biB0b3AgKGZpcnN0IHVwc3RyZWFtLCB0aGVuIGhlcmUgaW4gQlIyKS4KCldpdGggdGhpcyBzZXJp
ZXMsIHdlIGdldCBhIHdvcmtpbmcgeGRwLXRvb2xzIHRlc3Qgc3VpdGUgb24gYSBNSVBTIEV5ZVEK
cGxhdGZvcm0uCgogLSBGaXJzdCBwYXRjaCBpcyBhYm91dCBhZGRpbmcgYSBjb25maWcgZW50cnkg
dG8gaG9zdC1sbHZtIGZvciB3aGVuIGl0CiAgIHNob3VsZCBidWlsZCB0aGUgQlBGIGJhY2tlbmQu
IEN1cnJlbnRseSwgQlIyX1BBQ0tBR0VfTExWTV9CUEY9eQogICBpbXBsaWVzIGhvc3QtbGx2bSBo
YXMgdGhlIEJQRiBiYWNrZW5kOyB0aGlzIGJlaGF2aW9yIGlzIG9kZC4KCiAgIEluc3RlYWQgd2Ug
YWRkIGFuIG9wdGlvbiB0aGF0IHBhY2thZ2VzIG5lZWRpbmcgYSBCUEYgY29tcGlsZXIgc2hvdWxk
CiAgIGVuYWJsZS4gTm90ZSB0aGF0IHdlIHN1cHBvcnQgYnVpbGRpbmcgaG9zdC1sbHZtIHdpdGgg
QlBGIGFzIHRoZSBzb2xlCiAgIHRhcmdldC4KCiAtIFNlY29uZGx5LCB3ZSBhZGQgdGhlIHhkcC10
b29scyBwYWNrYWdlLiBJdCBjb21lcyB3aXRoIHR3byBvcHRpb25zOgogICBvbmUgZm9yIHRoZSBw
YWNrYWdlIGFuZCBvbmUgZm9yIGJ1aWxkaW5nICYgaW5zdGFsbGluZyB0aGUgdGVzdHMuCgogICBX
ZSBoYXZlIDYvNyBwYXRjaGVzIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IHJlbGVhc2UgdjEuNi4zLiA2
IHBhdGNoZXMKICAgYXJlIGluIHRoZSB1cHN0cmVhbSBtYWluIGJyYW5jaC4gVGhlIGxhc3Qgb25l
IGlzIGNsb3NlciB0byBhCiAgIGNvbXBpbGVyIGJ1ZyB3b3JrYXJvdW5kIHNvIHdlIGRlY2lkZWQg
b24gbm90IGdldHRpbmcgaXQgaW4geGRwLXRvb2xzCiAgIHVwc3RyZWFtLgoKT25lIHF1ZXN0aW9u
OiBJIGhhZCBhIGxvbmcgbGlzdCBvZiAyNiBfTElOVVhfQ09ORklHX0ZJWFVQUyB3aGljaApzaW1w
bGlmaWVzIFFFTVUgKGFuZCBxdWljayBoYXJkd2FyZSkgdGVzdGluZzoKCiAgICBtYWtlIHFlbXVf
YWFyY2g2NF92aXJ0X2RlZmNvbmZpZwogICAgdXRpbHMvY29uZmlnIC1lIFRPT0xDSEFJTl9CVUlM
RFJPT1RfQ1hYIFwKICAgICAgICAgICAgICAgICAtZSBQQUNLQUdFX1hEUF9UT09MUyBcCiAgICAg
ICAgICAgICAgICAgLWUgUEFDS0FHRV9YRFBfVE9PTFNfSU5TVEFMTF9URVNUUwogICAgbWFrZSBv
bGRkZWZjb25maWcKICAgIG1ha2UgICMga2VybmVsIGhhcyBhbGwgdGhlIHJpZ2h0IG9wdGlvbnMh
CgpJJ3ZlIG5vdCBhZGRlZCB0aGVtIGJ1dCBwbGVhc2UgdGVsbCBtZSBpZiB0aGUgY29tbXVuaXR5
IGVuam95cyB0aG9zZS4KaHR0cHM6Ly9wYXN0ZS5zci5odC9+dGxlYi9hNDI0ZGJiMjI0OTUyY2Qw
OGQ1ZGI5NDk1ZDNkN2Q2YTMwNGM1MTQxCgpUaGFua3MhClRow6lvCgpbMF06IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9EQjlQUjA5TUI0OTg3NjNCNkZBNUE3MjIxM0NFQUYyQTZG
NjlBQUBEQjlQUjA5TUI0OTg3LmV1cnByZDA5LnByb2Qub3V0bG9vay5jb20vClsxXTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjYwODI4LXhkcC10b29scy10bGViLXYxLTAt
NDYzYzI1YjVhOTliQGJvb3RsaW4uY29tLwoKLS0tCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlIG9u
dG8gbGF0ZXN0IG1haW4gYnJhbmNoICg3MmJkZTU4ODE2KTsgZHJvcHBlZCB0d28gcGF0Y2hlcwog
IGFwcGxpZWQgdXBzdHJlYW0gKHRoYW5rcyBUaG9tYXMpOgogIC0gcGFja2FnZS9icGZ0b29sOiBk
aXNhYmxlIGZlYXR1cmUgYXV0by1kZXRlY3Rpb24gZm9yIGhvc3QgYnVpbGQKICAtIHBhY2thZ2Uv
YnBmdG9vbDogYWxsb3cgYnVpbGRpbmcgb24gTUlQUyBhcmNoaXRlY3R1cmUKLSBwYWNrYWdlL3hk
cC10b29scy8qKi5wYXRjaDoKICAtIDYgcGF0Y2hlcyBhcmUgbWVyZ2VkIHVwc3RyZWFtIChhZnRl
ciBzb21lIGRpc2N1c3Npb25zIGFuZCBjaGFuZ2VzCiAgICBzaW5jZSB2MSkuIE9uZSBpcyB0byBm
aXggY3Jvc3MtY29tcGlsZWQgQlBGIGJ1aWxkcyBhbmQgdGhlIHJlc3QgaXMKICAgIGZvciBydW5u
aW5nIHRoZSB0ZXN0LXN1aXRlIG9uIGJ1c3lib3ggcm9vdGZzLiBUaGV5IGFyZW4ndCBwYXJ0IG9m
IGEKICAgIHJlbGVhc2UgeWV0IHNvIHdlIGFwcGx5IHRoZW0gaGVyZS4KICAtIE9uZSBwYXRjaCBp
cyBhIHdvcmthcm91bmQgYXJvdW5kIGEgR0NDIE1JUFMgdG9vbGNoYWluIGJ1ZzsgaXQgaXMKICAg
IHN0aWxsIHByZXNlbnQgYnV0IG5vdyBoYXMgYSBjb21tZW50IGluIGl0cyBVcHN0cmVhbSB0cmFp
bGVyLgotIHBhY2thZ2UveGRwLXRvb2xzL0NvbmZpZy5pbjoKICAtIFNvcnQgInNlbGVjdCIgZW50
cmllcy4KICAtIEJSMl9QQUNLQUdFX1hEUF9UT09MU19JTlNUQUxMX1RFU1RTIHNlbGVjdHMKICAg
IEJSMl9QQUNLQUdFX0xJQkNBUF9ORyBmb3IgdGVzdF94c2tfbm9uX3ByaXZpbGVnZWQuCi0gcGFj
a2FnZS94ZHAtdG9vbHMveGRwLXRvb2xzLm1rOgogIC0gQWRkIG1pc3NpbmcgQ09ORklHX1BJTkc2
IGJ1c3lib3ggY29uZmlnIGZpeHVwIGZyb20geGRwLXRvb2xzLCB3aGVuCiAgICBpbnN0YWxsaW5n
IHRlc3RzLiBFbHNlIHNvbWUgdGVzdHMgZ2V0IHNraXBwZWQuCiAgLSBSZXNvbHZlIHRoZSBsaWNl
bnNlIGZhbWlsaWVzIHRvIHN0cmljdCBTUERYIGlkZW50aWZpZXJzLgogIC0gU29ydCBYRFBfVE9P
TFNfREVQRU5ERU5DSUVTIGNvbnRlbnQuCiAgLSBUdXJuIFhEUF9UT09MU19NQUtFX09QVFMgaW5s
aW5lICQoaWYpIGludG8gYSBtdWx0aWxpbmUgaWZlcS4KICAtIEFkZCBCUEZfU0tJUF9TVERfSU5D
TFVERT0xIHRvIFhEUF9UT09MU19DT05GX0VOViBiZWNhdXNlIG9mIGhvdyB0aGUKICAgIHBhdGNo
ZXMgZXZvbHZlZC4KLSBDQyBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4sIHRoZSB4ZHAtdG9vbHMg
bWFpbnRhaW5lci4KLSBEcm9wIENDIEphbWVzIEhpbGxpYXJkOyBoZSB3YXMgcHJlc2VudCBiZWNh
dXNlIG9mIHRoZSBicGZ0b29sIHBhdGNoZXMuCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5t
c2dpZC5saW5rLzIwMjYwODI4LXhkcC10b29scy10bGViLXYxLTAtNDYzYzI1YjVhOTliQGJvb3Rs
aW4uY29tCgpUbzogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKQ2M6IERhbmllbCBMYW5nIDxkYWxh
bmdAZ214LmF0PgpDYzogSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgpDYzog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogVmFsZW50aW4gS29yZW5i
bGl0IDx2YWxlbnRpbmtvcmVuYmxpdEBnbWFpbC5jb20+CkNjOiBCZW5vw650IE1vbmluIDxiZW5v
aXQubW9uaW5AYm9vdGxpbi5jb20+CkNjOiBHcmVnb3J5IENMRU1FTlQgPGdyZWdvcnkuY2xlbWVu
dEBib290bGluLmNvbT4KQ2M6IEppbW15IFdlc29sb3dza2kgPEppbW15Lldlc29sb3dza2lAbW9i
aWxleWUuY29tPgpDYzogVGF3ZmlrIEJheW91ayA8dGF3ZmlrLmJheW91a0Btb2JpbGV5ZS5jb20+
CkNjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgpDYzog
VmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+CkNj
OiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KCi0tLQpUaMOpbyBMZWJy
dW4gKDIpOgogICAgICBwYWNrYWdlL2xsdm06IGFkZCBvcHRpb24gdG8gYnVpbGQgdGhlIEJQRiBi
YWNrZW5kIGluIGhvc3QtbGx2bQogICAgICBwYWNrYWdlL3hkcC10b29sczogbmV3IHBhY2thZ2UK
CiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MyArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL0NvbmZpZy5pbi5ob3N0ICAgICAg
ICAgICB8ICAxMCArKwogcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rICAgICAgICAg
ICAgICAgICAgfCAgMTIgKy0KIC4uLi1hbGxvdy1idWlsZGluZy1CUEYtcHJvZ3JhbXMtZnJlZXN0
YW5kaW5nLnBhdGNoIHwgMTM5ICsrKysrKysrKysrKysrKysrKysrKwogLi4uLzAwMDItbGliLXRl
c3Rpbmctc3VwcG9ydC1idXN5Ym94LW1rdGVtcC5wYXRjaCAgfCAgNzEgKysrKysrKysrKysKIC4u
LnN0aW5nLWF2b2lkLXBzLXBwaWQtaW4ta2lsbF9wcm9jZXNzX2dyb3VwLnBhdGNoIHwgIDQ4ICsr
KysrKysKIC4uLi8wMDA0LXhkcC1kdW1wLXRlc3RzLWF2b2lkLXNvcnQtQy1mbGFnLnBhdGNoICAg
IHwgIDU0ICsrKysrKysrCiAuLi4wMDUtdGVzdHMtYXZvaWQtZnJhY3Rpb25hbC1waW5nLVctdGlt
ZW91dC5wYXRjaCB8IDEwMCArKysrKysrKysrKysrKysKIC4uLi8wMDA2LXhkcC1kdW1wLXRlc3Rz
LXN1cHBvcnQtYnVzeWJveC1waW5nLnBhdGNoIHwgIDc2ICsrKysrKysrKysrCiBwYWNrYWdlL3hk
cC10b29scy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICB8ICA1NiArKysrKysrKysK
IC4uLmQtQlBGLW9iamVjdHMtd2l0aC1hc3NlbWJsZXItcmF0aGVyLXRoYW4tLnBhdGNoIHwgIDU5
ICsrKysrKysrKwogcGFja2FnZS94ZHAtdG9vbHMvbm8tdGVzdHMvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgfCAgIDMgKwogcGFja2FnZS94ZHAtdG9vbHMveGRwLXRvb2xzLmhhc2ggICAgICAgICAg
ICAgICAgICAgfCAgIDggKysKIHBhY2thZ2UveGRwLXRvb2xzL3hkcC10b29scy5tayAgICAgICAg
ICAgICAgICAgICAgIHwgIDg0ICsrKysrKysrKysrKysKIDE2IGZpbGVzIGNoYW5nZWQsIDcyNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0tLQpiYXNlLWNvbW1pdDogNzJiZGU1ODgxNjg4
Y2NmZWRiMjE4MjJmYmYwNDMzOTNhNjA5MTg2MgpjaGFuZ2UtaWQ6IDIwMjYwODI4LXhkcC10b29s
cy10bGViLTA1NGM0YzhjNGNmYgoKQmVzdCByZWdhcmRzLAotLSAgClRow6lvIExlYnJ1biA8dGhl
by5sZWJydW5AYm9vdGxpbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
