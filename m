Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C630C83F01
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 15:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A77A8127C;
	Sun, 27 Aug 2023 15:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A77A8127C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xogBO41V7430; Sun, 27 Aug 2023 15:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C84281EA2;
	Sun, 27 Aug 2023 15:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C84281EA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB7E51BF5F5
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 15:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A35E940A02
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 15:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A35E940A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tL2TiezIvpyM for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 15:00:32 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F43F40A01
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 15:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F43F40A01
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BFB7C13F8B8;
 Sun, 27 Aug 2023 17:00:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 16:59:55 +0200
Message-ID: <20230827145956.3204254-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827145956.3204254-1-ju.o@free.fr>
References: <20230827145956.3204254-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693148430;
 bh=4PQOTtCTqHMrb1h1iMvADujXSUebBehhsaeVNZ9xU7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iPKyWW0K9AMuO4DzhjqnDs8yp+c+sTAWC9Y21zrrdSkwRljqHQqR9RYejuUV9an0H
 MeeYXIUcMhRCQ1kWYzqiHuDuqdn2lz/cvRUKdo4dmKT/CKsfapOF+5+qfASJmQfTVS
 JGokUbIX4iX6Fq9pFArHWn9Y8SIl5l9QztKYXV9VZ9+WwYIkOtJAFmREbhTOJ941JU
 1I1LEEWY9qFSvxnqQ49fLXS6oxrpn4QUPc9zUWcBpfl5di8G4RB3RFH6zBJnAVkNsr
 FepbHL1U4D6XCjvUSOBZVSS1pTwLXVJ6B6MksWh5R0Go9YHKJe9k2Eu9D+AzWzvwux
 t47hQsEGPyELw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iPKyWW0K
Subject: [Buildroot] [PATCH next 2/3] package/edk2-platforms: bump in sync
 with edk2-stable202308
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
Cc: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCB0aGUgZWRrMi1wbGF0Zm9ybXMgY29tbWl0IHRvIHRoZSBvbmUgY29ycmVzcG9uZGluZyB0
byB2ZXJzaW9uCmVkazItc3RhYmxlMjAyMzA4IG9mIGVkazIsIGJhc2VkIG9uIHRoZSB0aW1lc3Rh
bXBzLgoKQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KQ2M6IFZpbmNlbnQgU3RlaGzD
qSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4g
PGp1Lm9AZnJlZS5mcj4KLS0tCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1z
Lmhhc2ggfCAyICstCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLm1rICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2gg
Yi9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2gKaW5kZXggYWU4OGI2
NzJhNi4uNGM3NGM3ZGZiNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsy
LXBsYXRmb3Jtcy5oYXNoCisrKyBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9y
bXMuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDMx
MjU3MTYwYWM1MWE0YTVmNjNkYjkyZDI2NDgyZDZhMDA1Mjg2ZWQwNDBkYWZlODlkMDFmMGVlOTA2
YjExMWUgIGVkazItcGxhdGZvcm1zLWI3MWYyYmRhOWU0ZmMxODMwNjhlZWY1ZDFkOTBhNjMxMTgx
YTI1MDYudGFyLmd6CitzaGEyNTYgIGMyNDBhOGVjNzgxNmJjNTk2M2Q4ODFjODRlYjE4ZDg4MGU5
MjY5YzExN2NmYzQ2YTMxMDZiMGM1ZTZlODBjNjYgIGVkazItcGxhdGZvcm1zLWU1MDlhYzVhNzI5
ZWJlMmEzYmM5MDVhZWQxZGYyMzIyNmFjYTRkYzkudGFyLmd6CiBzaGEyNTYgIDUwY2UyMGM5Y2Zk
YjBlMTllZTM0ZmUwYTUxZmMwYWZlOTYxZjc0MzY5N2IwNjgzNTlhYjJmODYyYjQ5NGRmODAgIExp
Y2Vuc2UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZv
cm1zLm1rIGIvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5tawppbmRleCA5
ZThmZjk0MTU2Li43YmQ4NmZmMTU5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2VkazItcGxhdGZvcm1z
L2VkazItcGxhdGZvcm1zLm1rCisrKyBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0
Zm9ybXMubWsKQEAgLTUsNyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIEtl
ZXAgaW4gc3luYyB3aXRoIGxhdGVzdCBjb21taXQgYXMgb2YgdGhlIHJlbGVhc2UgZGF0ZSBmb3Ig
Ym9vdC9lZGsyCi1FREsyX1BMQVRGT1JNU19WRVJTSU9OID0gYjcxZjJiZGE5ZTRmYzE4MzA2OGVl
ZjVkMWQ5MGE2MzExODFhMjUwNgorRURLMl9QTEFURk9STVNfVkVSU0lPTiA9IGU1MDlhYzVhNzI5
ZWJlMmEzYmM5MDVhZWQxZGYyMzIyNmFjYTRkYzkKIEVESzJfUExBVEZPUk1TX1NJVEUgPSAkKGNh
bGwgZ2l0aHViLHRpYW5vY29yZSxlZGsyLXBsYXRmb3JtcywkKEVESzJfUExBVEZPUk1TX1ZFUlNJ
T04pKQogRURLMl9QTEFURk9STVNfTElDRU5TRSA9IEJTRC0yLUNsYXVzZS1QYXRlbnQKIEVESzJf
UExBVEZPUk1TX0xJQ0VOU0VfRklMRVMgPSBMaWNlbnNlLnR4dAotLSAKMi40MS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
