Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A404606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dzVgcEeV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=LSl7ZyQS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B66160600;
	Sun, 25 Oct 2026 22:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-8SHG9LqdN4; Sun, 25 Oct 2026 22:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4E8FE6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966128;
	b=NPmRVCbkjcoxSERYMjzYDerzX2sWp9w0cdBTHQlEZz6qe50qLSqUNbQTzAgpsoloM5uI
	 fBNHJTp5PWEBqAYdCpNNNt1WEy2NMswGbzXe+FMxNCDFq8W6asNU88vjblzId9TYJruUb
	 U5zas+YMTqZ9fZTsGxzSVLOvvcATI5bhVTyj//WXM8ifZRPkuWySwrFyX17L9yuqtpxRJ
	 hxBjmSsCa+fzKb7D9fOkU4T3GZClmBcZnSgwM/7iiO42X+HUwnkOUcHELMdfc5RGMXQGh
	 N8QQLIxV6Dl3sXwvah6za5g492K/LIPiX9TMZqI0TPuJd4fCWjsQz7UBgEYV92P9RHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CU1rCDQ/5sg838EOeBkLuczVZdhgz+gc/jT/3+OQ1uE=;
	b=nBpqp5e5lJojv2roSRM8b6XUMw2TvNauwShbIbU0oYht3A4s4dlIn6/Zu74Dnqu5lt7M
	 w3i2O3fnltm2z8TqQFbykiFLk9n2T8ncr4QW68Gt2n9KFUmOnAwZ0+jK8x4w/YS8+7wmu
	 L4POXjJ86pUQ4dGDtkTLQ50FjpWtBJVLR8nWjETw3HbRCUETDVN719+2JrtFDA3FhJuoe
	 0U6iPvcSWar2Mu3d+SsGZic94ZK6CxmZEnzjT86eI+UU/hKV/xEnxq9xkm0w3rUU6vNMs
	 t4fXe4JA9Kax0TUP2ld75r9IQNAvXKSr92ewAlsc+MuDIa7UUDqH0OxIjKhdi4JcdvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966128;
	bh=CU1rCDQ/5sg838EOeBkLuczVZdhgz+gc/jT/3+OQ1uE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzVgcEeVxJZ9mWVav28pEW/fFtKD3kUBfQRYvNVPxkn39GZ2+7b4e4PjlsC9CtPaL
	 ek2hjap04R00tn8egcXcLx10L57txlQbLtK3CkZriZ8DKF5FswZFlfswwImSrxyAzi
	 eHcdSkBxCaraoplnOVIUQMZ2+G8Zei05lS4Y0HmC5cFLOhVUF4+QZagQxHCXsIa346
	 C7Khf1Het41CEmCfK/QVCjOouSx4L9kzMtWFzMUi9xI8aYBp4SalYWPbO0cn6VpmKB
	 W/vkQvQSyut3QwjSN0OdUODprstgDi+mJqsDRcuR97zkEAlCo7JAnhK+oGP0n21T3B
	 n8q8IZ61eZaFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E8FE6060B;
	Sun, 25 Oct 2026 22:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4E56356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB1A1403D3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NJuHhVOxUiO for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B1F5740323
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966126;
 b=l8ZF49v8wBJDF0HEoEv23C3DyCeVo5yfSnF2+adAuUCarKFNi4ZjQMctab0Je3b/htvp
 mu1yjETr4FWkNe0xLlFzaYPGJtYFNd8DwCQ5VkUd/a7miANfBby8uwSxtHU1jVewoYwCX
 cbAtGPqvvHX8TkkSmNMcbLThQsB+QmIXaZZe1cjSmsHjo9rJyH+sTr668wnDcQGaVHMy/
 bjceuU9gJEo/wMK4LRAiGi94eXWBZCjLIWpuiP0O1FvPKuK9Iss8LUrXz/MBdQ+yL9+Ym
 dV5PmTZbUrSPWEywhFcZWFuMqRAzYqIB/ytNrH3iS+Sj+5umU1mM5o9HpufFYvJiU+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966126;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=HA1xolypX8hplFiu4XF2yccaJxYkdhhLE3igSnU5D90=;
 b=Q+7U9EdLtLI8e4s5mwDbdInSXR9mornJiBJYrT9xY90DFA36oE1r8Ed3O76/GnBsa1mH
 fTqMGfMCdi7dQus9jrk2GFLo48l9CwGlBAImaHayDzFJe4e0KbsDqz3FaaXkGbXLvgChJ
 KXDDDNpGyf3BabFd0Qf/nXUaOt3HEAQYyjlH6mgumlxp1BxOQ1l2uv5pbBpoVq9ypzq8E
 GZnKdp1AHsdK/HkOh6+iq6lOQ9YpNQx3jtMAnO8S3q2CzBGSI3vlhwjAA9QRnRvOpI+ZM
 ia/luRF4hXHQGnNTCr9FVZjIBJqr46KbWYC3jNKFRcCdr6by21aAuKBPEtqhCGlUEBw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LSl7ZyQS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LSl7ZyQS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1F5740323
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966082;
 bh=HA1xolypX8hplFiu4XF2yccaJxYkdhhLE3igSnU5D90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LSl7ZyQSGrk1ZtqB2AS17HXIBOoGo62Cs7hYtTR71/V4Ii2CuT6WxzfJuNGP6GVFK
 y5gyAl5dsJ5zkxIfjO9B3UNEH3tkqrbXFchWupThiT05CqjZiJs8+P3z2K0PyhBlCq
 J2uxpw4RRgb/gu74OZx+07FcCDQrmPpp4t1ALL4iqFRqUe/KzuAdKSLgjER00JZM7i
 YT513cUojKXGnIUF/DhxXTRJCuYWYCPsioJ77T0TOFoae6V+TAc9fRWeosjJSu5Kn6
 27PVHlj29dPcEyCaJ4PhD8tpYL+U4rCCpmNmlfReu2T02GScWI3hWIdgH0dnZ0bNid
 ZkjrPNwrcwtwQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 MpmxNB8Qn1k5BXvd6WkEMN/9LoBtzqNWTNBAvnEYdApyXT52rKFWbydEFfMIMYwDt/ohyaw9PG2
 b+MNJGAREd9OZjhf9x6SSYrTI17sJW5HNsLHcdWKQR7WW846sssBQYUEXYWjvjZ7eCAymkp9wfl
 DHdSzBaKzt9b4wxkrykm2UFSo+fynBWtDHXfw6nOSBkjtdNl7yOil/JXu2TNh5lStXV5bV12v02
 d9569nBqGbBE0CCtswO2rzN0hq3LRanntpXZH7rjpw8XIbd3yANshi0OwU9lcKoP8ji55iAzTcK
 eX5wCyy2ACWgLFageHGn+aK8+ZK+FBC9A3irKXKpt0xqAFxLwRs5gj11P+S83Txtdwg0vYaKt5c
 cp7IsgGRrxQztZXuJaExryEaHLslU6JqBlGLHdBEhRAk0irgfMIlz8DDDgoq+vPzXmWg2n+LyvI
 9DQb153dGV1Gc3CcyzH/Sk6pVrsmb3aUoeEVP7sBUq6v07IyUzytS2W5G9CIsd42xWpY1mXC2xw
 cpkZuzArB2YbSxurgOxxyeRKBRv+NXimca2M1nbhWfsifHF2fzH/e/HJjH32Gn6LlcX8Knb4qk=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6C27A4C69C4;
 Sun, 25 Oct 2026 23:08:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-1aV0;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:06:57 +0100
Message-ID: <20261025220723.1332924-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 08/34] package/docker-engine: bump version to
 v29.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKVXBkYXRlIHRvIHRoZSBsYXRl
c3QgdmVyc2lvbiwgYWRqdXN0IGZvIHRoZSBwYWNrYWdpbmcgYW5kIHRhZ2dpbmcgY2hhbmdlcyBh
bmQKYWRkIG5mdGFibGVzIGFzIGEgbmV3IGRlcGVuZGVuY3kuCgpSZWxlYXNlIG5vdGVzOgoqIGh0
dHBzOi8vZG9jcy5kb2NrZXIuY29tL2VuZ2luZS9yZWxlYXNlLW5vdGVzLzI5LyMyOTEyCgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+CltCZXJuZDogcmViYXNl
ZF0KU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiBwYWNr
YWdlL2RvY2tlci1lbmdpbmUvQ29uZmlnLmluICAgICAgICAgIHwgMSArCiBwYWNrYWdlL2RvY2tl
ci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5oYXNoIHwgMiArLQogcGFja2FnZS9kb2NrZXItZW5naW5l
L2RvY2tlci1lbmdpbmUubWsgICB8IDkgKysrKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2RvY2tlci1l
bmdpbmUvQ29uZmlnLmluIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL0NvbmZpZy5pbgppbmRleCAz
N2Q3Zjc5MjhkLi40YTcyZjY0ZTllIDEwMDY0NAotLS0gYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUv
Q29uZmlnLmluCisrKyBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9Db25maWcuaW4KQEAgLTEyLDYg
KzEyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0RPQ0tFUl9FTkdJTkUKIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfSE9TVF9HTwogCXNlbGVjdCBCUjJfUEFDS0FHRV9JUFRBQkxFUyAjIHJ1bnRpbWUgZGVw
ZW5kZW5jeQogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJTRUNDT01QCisJc2VsZWN0IEJSMl9QQUNL
QUdFX05GVEFCTEVTCiAJaGVscAogCSAgRG9ja2VyIGlzIGEgcGxhdGZvcm0gdG8gYnVpbGQsIHNo
aXAsCiAJICBhbmQgcnVuIGFwcGxpY2F0aW9ucyBhcyBsaWdodHdlaWdodCBjb250YWluZXJzLgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUuaGFzaCBiL3Bh
Y2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKaW5kZXggMzJiZGI0NWVmNS4u
MzlhMTVlMGU2ZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdp
bmUuaGFzaAorKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5oYXNoCkBA
IC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgMGU0NTBjMDNjNTM2
YTEzMDRiYThmZDI2Y2E0YzRmZjk2ZmFjNjIxODJmZDA0MmZlYzkwZmZkZjRhMDk2OWQ0MCAgZG9j
a2VyLWVuZ2luZS0yOC41LjItZ28yLnRhci5negorc2hhMjU2ICBmMTE5NDlmM2Q4ZGNiY2JkNmQ1
ZGUwYjM0NWI1ZWM4ZGJkZDc0NTcyYzZjZTYxNGM3YjZlNzU1MTgyOWQ4MDM1ICBkb2NrZXItZW5n
aW5lLTI5LjEuMi1nbzIudGFyLmd6CiBzaGEyNTYgIDdjODc4NzMyOTFmMjg5NzEzYWM1ZGY0OGIx
ZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTggIExJQ0VOU0UKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1rIGIvcGFja2FnZS9kb2Nr
ZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKaW5kZXggNTUwMjI4NGRjMy4uMmRmZmJlZWNjYSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKKysrIGIv
cGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKQEAgLTQsMTQgKzQsMTQgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLURPQ0tFUl9FTkdJTkVfVkVSU0lPTiA9IDI4
LjUuMgotRE9DS0VSX0VOR0lORV9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LG1vYnksdiQoRE9D
S0VSX0VOR0lORV9WRVJTSU9OKSkKK0RPQ0tFUl9FTkdJTkVfVkVSU0lPTiA9IDI5LjEuMgorRE9D
S0VSX0VOR0lORV9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LG1vYnksZG9ja2VyLXYkKERPQ0tF
Ul9FTkdJTkVfVkVSU0lPTikpCiAKIERPQ0tFUl9FTkdJTkVfTElDRU5TRSA9IEFwYWNoZS0yLjAK
IERPQ0tFUl9FTkdJTkVfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKIAotRE9DS0VSX0VOR0lORV9E
RVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgbGlic2VjY29tcAotRE9DS0VSX0VOR0lORV9HT01P
RCA9IGdpdGh1Yi5jb20vZG9ja2VyL2RvY2tlcgorRE9DS0VSX0VOR0lORV9ERVBFTkRFTkNJRVMg
PSBob3N0LXBrZ2NvbmYgbGlic2VjY29tcCBuZnRhYmxlcworRE9DS0VSX0VOR0lORV9HT01PRCA9
IGdpdGh1Yi5jb20vbW9ieS9tb2J5L3YyCiAKIERPQ0tFUl9FTkdJTkVfQ1BFX0lEX1ZFTkRPUiA9
IG1vYnlwcm9qZWN0CiBET0NLRVJfRU5HSU5FX0NQRV9JRF9QUk9EVUNUID0gbW9ieQpAQCAtMjUs
NyArMjUsNiBAQCBET0NLRVJfRU5HSU5FX0xERkxBR1MgPSBcCiAKIERPQ0tFUl9FTkdJTkVfVEFH
UyA9IGNnbyBleGNsdWRlX2dyYXBoZHJpdmVyX3pmcwogRE9DS0VSX0VOR0lORV9CVUlMRF9UQVJH
RVRTID0gY21kL2RvY2tlcmQgY21kL2RvY2tlci1wcm94eQotRE9DS0VSX0VOR0lORV9CVUlMRF9P
UFRTICs9IC1tb2Q9dmVuZG9yIC1tb2RmaWxlPXZlbmRvci5tb2QKIAogaWZlcSAoJChCUjJfUEFD
S0FHRV9MSUJBUFBBUk1PUikseSkKIERPQ0tFUl9FTkdJTkVfREVQRU5ERU5DSUVTICs9IGxpYmFw
cGFybW9yCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
