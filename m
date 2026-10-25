Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C30606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YnASFwIW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ihy1merM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C46060B58;
	Sun, 25 Oct 2026 11:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTh7JP77f8kj; Sun, 25 Oct 2026 11:01:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3AC6960B55
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792926115;
	b=X0ffaFvP5Aug9SO6e1imhL9ME80yCj34UC2C5219U+V14hqpWY7UZ//tCWw3DaYFudgz
	 9SvTVdJG0LOj6eNYSTEbImi7DU21gAUMa4UTEyo3I5PfPq6RPvddsJzSVWUoScA+D0z20
	 VR6oLuQ5+tLUYD7r9rb0lsfhyWMYPQElmIpYXK0E6fWm+Hx8xHl/q6UwE+KRWL3ioHrp5
	 DbIPZ77X1RUM4Aeh+JPLHHS7n9JXK9fkENqFPqB2p10VnQKjqYCsqcvCzB4myZXwe1H1S
	 8N8HA+dJoWxyLM6BdCf0WUgT5b+qFSas2uMVxD33DDE+Pyj3wuWYI7B8s0hILB6ivfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792926115;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9PYqJUrN4IY97SMA0RD96koNPGx76j2P1bZ7o7A75/U=;
	b=dPj1arqMqNPO+fPaX+dwsTwMGo6XLJGK3QwHVLLzV00jG47OyzzHOb2IIXAI/7okLzjw
	 ywNUsIQ5UtMR7X4BXXQyaoC5Qnj2a3rCdKFmEnZPCi+Ukox/xChjnOTiE1EUdS6bQd+yU
	 L4hlvzTF54zIYaNLErRdTvoFRXpbRAl7RhK2fiXv6WoZuGw+QplqV2OaNiPg6DVgksMdn
	 Zwh7ojgUNuktKd5d0mW91Izg7pAGQCclzA42riDLak+nG1V1zmEfDb7PTZfRE3880s8ZH
	 wY512w0iy7DL++HlddH9mKXk7yoxwqn4udVhmRCXnd6XjFF/+IgzfJ3lwFkFuA6zVZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ihy1merM;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792926115;
	bh=9PYqJUrN4IY97SMA0RD96koNPGx76j2P1bZ7o7A75/U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YnASFwIW4TwfidDRNhn0b3/CQLUsAtfex5IkB2KJsBQfO+BFzyvHT6sxL9tKPdrGU
	 NgdsbjpszLnQXKwSIvcE90m1gHjYsVKK8qjLVGeilphBHL7iMccg1e1azwaCmo1I1r
	 WGXrW5ltBC00SmKXl31OcVqkFupTpKpjtDV4Zt2BoQsQWqNtV8gwO4sXb4xAidzv6c
	 ywY4mxhM9gBffTJc9bRws2RAwFj3sLBfGDFWH6tRLLXqjw0KTNRJlGUfnsqjoogkBs
	 oH2M7ZO/sYBtcnh8hrog4ZmlPbaYUaomnEu4n0P7M3IxNp8ScyszDotZ9XCApg9o2T
	 03yqsYRtbWGtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC6960B55;
	Sun, 25 Oct 2026 11:01:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC5B22C7
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDF0B60B55
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9_Om0quvPE6 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:01:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 948B460B52
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792926113;
 b=mLovL3IMFo5NAh2S4aI23tkYzXq3ESvr0aqhNX39SVPVo7RLEy87bsapKP8fEVJ6P/RG
 elKQKCSykiOx+brnEA7mqhCf+wxt5bqNkf3V22pxBiDaNhmkTn28mlvgV6F1dsOXbKnu0
 ABj/6V7X2Wiq2BL2heW71J967ar9edziljgNIcMkQCkOcRBszWMZeajJ2isU2Jfr8mqKa
 US/jMMQewqu6fqNOcLA6+KFNZKrFNc0ZsJ7lR2x3EzhO5HmQlS68aN7F3YCMypIfJROw2
 KxNzVW3o47mPQvuPvHF7fCK1kZ0nGlO9VjyMx+4FKGrjHknJ3c571omze9EVcha/iuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792926113;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=enz/0zdYape3n7whFBedx8OTPDwmrM5x6SrDtIJFRH0=;
 b=Q5p+aww35j1i1w/0PVT7sfC9o3pQl99zVCwhyWGXRyiJMtAkgV3mDxwozZLORhCsqAwK
 NaZoOkIvrgyFL+jHSlkqtmeqZbFhktcW/02PgfsWdltmxfu4UOrRep4m68IsX8TV1d37Q
 QwUOi5eD5MvCiLYbE8RPK1kQWtlsifz1BEUcdB0wG6Zc67qBHxQlKZVkb/zDw0U8A18nl
 yeTsOoLNwJlBjxHNWT+FkWnz2nR3jTqRelsKeKmvJTI8tYh3FyXfOk+r/kS+4Vd6HCCbQ
 9UcLhu1tOc9tyNkU2Wod0fgzI+qyZTgWumAaq6fFime1qg15Dx7vmZz8e0r9Qnap/ug==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ihy1merM; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ihy1merM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 948B460B52
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792926110;
 bh=enz/0zdYape3n7whFBedx8OTPDwmrM5x6SrDtIJFRH0=;
 h=From:To:Cc:Subject:Date:From;
 b=ihy1merMhi13hM/T6sQYg6JCtsVUdWbXAAXMs6sh2+dzRl+sA/i8tGvH0hdNW8SXQ
 lEtHPP/Yve4se9DnV/UgOUhDo6uWYjUZWAyaid/UcsDL2xPuONtMK7hK3MzcBjvT8P
 yV/WcCHThZbz3ILmMJrnzTSx+329dLomxhNofShVMUXBuqvU6x03WAd/TLkIWL46tu
 d6X7/Numh1iCDn2QYqWkxyY6BhwBas3m0cviF4mGLUQHm/UxM5oWDeXARW2pjyOSHV
 yJd6H+2+VX+tID3DOdXo+R9WZLdbxuCCxx+R77l2IeeN4UJr5eeyEep7c4vgZ52ZY8
 jMNalQt2eBsYg==
X-KAS-Sym: v3:f51bdf72230551df:h91RXDM6rDSzIbp1tdbpuE24/5StJkjAdS7bHgR0xgFB6
 2vnUhb4epjBr5MIC4z8K4+J9S18xQF1OzQnuN+9AiJNaEJFlZvbLNeohyMt8KAwgHsb2qGDKPQg
 VehfxDfRrbtLZRsGZ13OdF9b6GAHg1Hb+gO0LF/cPeyEoO/Ib7+QXUP7v4Y1c0hfde6R0t/RLA4
 xFk4x0O5tKSkG1rUNcciMXpQQpak5ZrLtcYR8vSc0PRpT3rfVtmtS7YXbKsUjJYPdcscUcqABhf
 EdLmxQwVdBhhIFCFPFPphiZJQZQG36SscEdoM54w8q4w5xTP/+rN3HeZuLB0oC7Fc/jB9UXQ==:
 aAGuuskibPF/y+GxhERM6zQfQTVi82V/7Tf9UQi3RXx2hNv6mgscIz2KBS9Aw5wu5+qzbynoGGd
 v4pi8nm31fdaxk+A/VJV3MeUH79u5q6p8gZoNIE1c1ifbuIIeSAw/eOLlYByhTEKZSGPOkjgipu
 cgiVqjjejs+uujLxoJeXLGP8w/nAUjzoFq//dgnXhCied+J8AcuuvvG6Q9ZNuYVEzqy6EjitBEa
 BgNEol+/H2Y7pP2jTnShFdyQm2gvspkRDU3QNGDIteMx99JL2opMprAatagg6GYlJkMftppJKzl
 f7n1fMvW77LrwP6VoDnznr9yTrCNCqEC09mUGReLZc3pSOLTe7Ljn+3hR5IJF1ijAK8twiZKY7N
 us1oaGqlcEksGePYvdai3r56jVuAkwfrImwn2ASuy1ufqdvAAwTawZ2is28RbbsIoAm2e3G5spN
 jF06T/i9yjYiyomOXRKn1OEJbIYPjxNAq+h0yzxwz7B5wxraVMCf4UpKlGuYEvXPJ3ovthDhJk4
 my8q+b7yjQrpLxf+o3eQWkb6zVfpPmW1Cd3LHHQMb8aJ1ZptaPBSSAVBltVDtwQBsZWTQXMTpCX
 WYIed+/0lgu3WN7bZ3dIz2L5o48UpTTNJcJPvXNx6yo=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5A77A4C6A9D;
 Sun, 25 Oct 2026 12:01:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56096)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKvz3-000000002WV-3aqm;
 Sun, 25 Oct 2026 11:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David du Colombier <0intro@gmail.com>
Date: Sun, 25 Oct 2026 12:01:49 +0100
Message-ID: <20261025110149.4023756-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/x264: bump version to git 0480cb05fa
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/dadfce52a97b012823c32e77516181082f8cd8a7

 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index dc2d3d7b5b..31657d5ab3 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  adb3f2f780607420134def42d0fac58be9c6de718a451f3f0ec56236a783f937  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-git4.tar.gz
+sha256  dbfac9615e62cc85a638643ae0ba8cdfecff645755fcded389b53507eebb23ec  x264-0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee-git4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index e96d993017..bb5622cdfe 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = baee400fa9ced6f5481a728138fed6e867b0ff7f
+X264_VERSION = 0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee
 X264_SITE = https://code.videolan.org/videolan/x264.git
 X264_SITE_METHOD = git
 X264_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
