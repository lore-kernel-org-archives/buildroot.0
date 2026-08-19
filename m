Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AC3C5DF85
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 09:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B17680D89;
	Wed, 19 Aug 2026 09:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMGkrLSsEKVP; Wed, 19 Aug 2026 09:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787131797;
	bh=HXq/GTTZCJMqYI+P9eeWZIagB70IqcZrkQ5uLoDBn+Q=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Emmyf3J2S2nT9h6fk2bRo7KoTPMJBM6yfy6tBgy3ccwRD0JuAE8gO2pQHvZS6em+0
	 h62GZcCKVtLK85S9GzgobSO08Dy1w6ENCCIrtZVV7JGeLFRILr2a6MWJomvrm1fOap
	 rG4hQE/OW4BAASoC02oGLbiBSWd9/IKbsIVQbHYa6UQFJbXNZyrBQKMYF4of6lwiZp
	 mV4/o+p4UybMMIia+XKlHxDOCXd4f/+IcMboFfrUMgItc1FlCub8P4FuB0i1XVBB5V
	 bV1MUdCCnGfoe4rwy9AR2nL43TnxyPqircDoAbNsgZt/hD9vD5zkzjnD/5uohU3txy
	 lrtr1Me8qh4mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A4480D87;
	Wed, 19 Aug 2026 09:29:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 603271460
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46A5C40042
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSdGpvjpr3pk for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 09:29:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5294E40077
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 09:29:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 192794E412D0;
 Wed, 19 Aug 2026 09:29:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CBD085FF42;
 Wed, 19 Aug 2026 09:29:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E9F811C715B7; 
 Wed, 19 Aug 2026 11:29:45 +0200 (CEST)
Date: Wed, 19 Aug 2026 11:25:33 +0200
MIME-Version: 1.0
Message-Id: <20260819-bump-python-scp-v1-1-562177e2911a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz1jCGRD0KhUDMS4YqSGKoSpC3
 J3Qjm/4/wCTpGLwKA5I8lHTJWRQWQBPfRgFdcgGV7m6aqhFv70jxn2dloDGEYlc2xD73tcMuYp
 JXvr9HZ/d37b5WXi9N3CeFw/nHG9zAAAA
X-Change-ID: 20260819-bump-python-scp-112981cbab6c
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/python-scp: bump version to 0.16.1
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOiBodHRwczovL2dpdGh1Yi5jb20vamJhcmRpbi9zY3AucHkvY29tbWl0LzhmMmE3
NzhjYzZkMjk4OGIzOWMwNTIzZjYzM2QyNzQ4NGU3MmYwZTYKClNpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9weXRo
b24tc2NwL3B5dGhvbi1zY3AuaGFzaCB8IDQgKystLQogcGFja2FnZS9weXRob24tc2NwL3B5dGhv
bi1zY3AubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2NwL3B5dGhvbi1zY3Au
aGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLmhhc2gKaW5kZXggZTc5YzRlZjRh
MzdiLi5hODI0ODdhZGJkNzEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24t
c2NwLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tc2NwL3B5dGhvbi1zY3AuaGFzaApAQCAtMSw1
ICsxLDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvc2NwL2pz
b24KLW1kNSAgYTcyZWRkMmNkYzBmZTZlMTRkOTA5MjA2NWYwNGJmZTAgIHNjcC0wLjE2LjAudGFy
Lmd6Ci1zaGEyNTYgIDE3NjNhNGI4YWM0MjRlYTBjMzA0ZjU4Yjk1YTRhNGE1MWQ1MDNhODM0ZWQ3
N2I0ZTg5ZjFhMzJiMzBjYmU2NjIgIHNjcC0wLjE2LjAudGFyLmd6CittZDUgIDg1N2NlMjE0OTQ4
NWVjNTkxZDhjMTA3NmQ4ZTc0NTE2ICBzY3AtMC4xNi4xLnRhci5negorc2hhMjU2ICAzZjJiMjYw
YmY5YmQ0YzJiNjg1N2Y2OTdhMWQ3ZThlZGMyNmZhNTY5MjgyYjc3MDI3ZTg0OWRmZTFlNDg1ODBh
ICBzY3AtMC4xNi4xLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMK
IHNoYTI1NiAgMjQ1NWNmMGZjNzhlMTM3NzJiZjEwZWY1ZjIwOWU3ZWI4NjI1NzA2ZDY3MWIyZjQy
MGNjOGFkZDM3ZDU0OGMxYyAgTElDRU5TRS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LXNjcC9weXRob24tc2NwLm1rIGIvcGFja2FnZS9weXRob24tc2NwL3B5dGhvbi1zY3AubWsKaW5k
ZXggYTRiZTIzZmI1MTUwLi5hMjIyNGU2NTRlOGIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9u
LXNjcC9weXRob24tc2NwLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLm1r
CkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX1ND
UF9WRVJTSU9OID0gMC4xNi4wCitQWVRIT05fU0NQX1ZFUlNJT04gPSAwLjE2LjEKIFBZVEhPTl9T
Q1BfU09VUkNFID0gc2NwLSQoUFlUSE9OX1NDUF9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9TQ1Bf
U0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy83Zi9lMS8zNDYz
NGE4OWYxMDBmY2Y0ZjAxNGFjYTY1NjIxZTcwMWM1YjkwNTNjZWM2MmI2Mzg2ODY2ZTNmMDE1ZDUK
K1BZVEhPTl9TQ1BfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdl
cy9mOC8zNS9mY2VmNDVkNTJkNzZhNmRjNzA3NzhjMTFlZWE3MTlmZjBhYjU1MDU5NGJjNTFlNTVl
NjZkMjhiNWY0MjQKIFBZVEhPTl9TQ1BfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKIFBZVEhPTl9T
Q1BfTElDRU5TRSA9IExHUEwtMi4xKwogUFlUSE9OX1NDUF9MSUNFTlNFX0ZJTEVTID0gTElDRU5T
RS50eHQKCi0tLQpiYXNlLWNvbW1pdDogMWEzODliNTUwODE2OTk5NDEzMzFjMzZiZGMzMjcwYjRm
NjNlYmEzMgpjaGFuZ2UtaWQ6IDIwMjYwODE5LWJ1bXAtcHl0aG9uLXNjcC0xMTI5ODFjYmFiNmMK
CkJlc3QgcmVnYXJkcywKLS0gIApBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3Rs
aW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
