Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA48C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 06:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C91C40BED;
	Sat,  5 Sep 2026 06:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GY27Eud6h3BW; Sat,  5 Sep 2026 06:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3BA3B40BF1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788589287;
	b=E511qGWue5H61jikcK7cdYK/s+0WGm1D2DYi12tCfGJX4jydYVS6t0HhbrWvXuVPa5Zg
	 SDnn+85TcvGIRsEw/J7h4dNzilskd0hRYjLltjIS7QZ5i3G0Yg1LQMfwwcT5pNxoz/NFg
	 e9zLmLQ+7vVsZ2J+Mck2vQUBvARXnMFAwrx34Gj8oMss76zR3otM/yDCR4dAq3xYsBKia
	 S6bfqKNenYmTnN7useHyUk2Ln+VZeMiQU1xlbaZVdOcGIdhhkt1lyg4LiuceWoNKy+AWP
	 2m8Mx0sD1Qm4JnojERuc0iBsSgGO7I/Aob5FdKaEbRrpvUD6QCVkmgsrpOvZ/dPeWhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788589287;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MPfR3x/Hr1iKeNw7NtyLIeuVUsJN1GgjS2WxM6xgyZ4=;
	b=HMrX8ftZsIYBWWbJwBkqbjzKJ5FjMsmPnYMjwJh8zh8TqV0nHMlohVRg9x8wqpnY2q7t
	 7VdpKA6zg4caKgiHAAliRLPnRb9QmSKeqijUUWFu08vGvoKkeO7OK+a5/mA6aDz6U/ZB1
	 M71V+JqOmV3X4rgl6XQ7ShMnif1OYGq371G4YGp7k0Wa6N+wLV9IDsFkA35EtRGY+LWvH
	 MqOPeEJmIKa5IUxcJyr5YYJ3YMu6fHzh96N+GARc8wRuPBzciby0vLxsxokZEojraKQL4
	 uMGb7RzRvKRjn+OkCTiScdmLFxIvM8aGogN7dJb5kvuav2QOzSlkxajHGqsoPBVIXzg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788589287;
	bh=MPfR3x/Hr1iKeNw7NtyLIeuVUsJN1GgjS2WxM6xgyZ4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VlbypJSfJsOa7KKcRzM8LJLm5tgP6SeTGsvMLcvu25t7cWHjD+q73sJlK54WkYM18
	 tHfbfRlY64GI/wj2VR7rEnXDUXqw+y0wBC7i8NlSV4tVvSf4SqWGwUPJ2sNUD7XcC2
	 K4vUz+U6/2aXtWcgHBb3zbBwJIh4CZLFxjZMS+aclNS7dz8IsYu/JBTTcGiw8pWdqe
	 /h4bIyaoHiAgkYMmGVm4twERv4RwHa/mRCVgxydLZkWZwQqbBbxydET6cOfzPqg3H3
	 BuIYlkBHPmY3l8JPW4nKAr28K9ava+kqsXCj8io0JlYLBc4U9hKBZwlv9T4/CqTopP
	 XvY6T20GB60+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BA3B40BF1;
	Sat,  5 Sep 2026 06:21:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1B69CF
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FEA680D62
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3FrX_EdPg1t for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 06:21:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C1A77810E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788589284;
 b=rkmf7oTiaKIFPB1dAswwgFVwvxrjCRlL728WWtBIkPgpOCaIrUn1qvFBUpgqtcJP63xj
 MseGm5iemrmjJGg6iCBSXgXFwb4jy8yQH9HFpUMaJ0Ex80/bRx6ulJE8sB9kA5o3ZOYoY
 +BZABtRBMTydfu8gXgYfFfKS3A+aMjpYrJVIl+oGWZlyNy18okYXIMjC5Ns0kXbu0iqhj
 2WKbNJfPUivjJMHuU74YTRHeBKs7CBOuTHfuCoQHGvi5U5fqGw6CrRhy1JuMB+ICY5q2F
 bBANg06S+ovAtFtylw19LE2svYVm1c8Qc7WvSf21Rzx8CKbVHhq188JMk4q0sqH1DLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788589284;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=uK03eYI8HDLQdKwVywCI0uCZGPYDkwyTu6nJLTVxsTM=;
 b=R0CGJy0cBgLNp7mX7qXLsjFNlsu6e0h5H2jceFl+A1dtwSLinnLFYcH5V5CxaNx8d36O
 jumuxnNNP9rCDks8AehIjoFSxN1k81Ds7t44f8JOdgJ9stqruUCrubn4Zz9IEWjjjIliX
 ub0IfZxI41JLjXGJjgtsqyQv8pPGdzU5hpdgjFk1PLozBgGMdDe8zQSoaWp1wkbjgzGmr
 JnoVr+RLsSVUqc3dH9mH4ov1BgZioS2C70OZYE1ZQJ31EsIA1V8BBdTND6fdKW1RGqbYL
 Iiea6DT/0OU4C0h37yviqO2weZR0oS4BH7JfFEq1eE3cLlo9vmAcsttuAvdFn8sA96Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BnhVZ9aM; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BnhVZ9aM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1A77810E7
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788589281;
 bh=uK03eYI8HDLQdKwVywCI0uCZGPYDkwyTu6nJLTVxsTM=;
 h=From:To:Cc:Subject:Date:From;
 b=BnhVZ9aMwZsAtIaGMkGxQ2cbyla96Ia7QVqEDgXs6OYRwNIOTL0DATB5VLRvV39VN
 J63CfERcNMIuj6VFDLM1AIS96BwRrISGgAdz6PqGxJw/qxnUXG9AnWTKDnJAHvJwHg
 zGY1Cgzlw0NtEgPmPVVDVjea5eYlp8Zzdyq2+b0o5nYKZkInDGNOYlH5sDm9TmdJ26
 nb0hzttbQ6UC4vhcabI/UTL0cY1BBsSTbROzatUQC9pUMLFHXCOr53x36ppeAEUbzb
 Isth+1IXZHL6daHJRWN9qaPpoPqesvh8towhuJjvNEtQOOp+9MxFfPH3dtCKS8b/Ct
 oLcvZTVuhCZcA==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EABE8A4C193B;
 Sat,  5 Sep 2026 08:21:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57392)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2jmC-000000001wM-2gUE;
 Sat, 05 Sep 2026 06:21:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat,  5 Sep 2026 08:21:20 +0200
Message-ID: <20260905062120.377049-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/libxml2: security bump version to
 2.15.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.4.news

Fixes the following security issues:

- xmlregexp: Prevent out-of-bounds read in NXT macro
- fix: add missing overflow checks in dict.c, uri.c, and valid.c
- xmlregexp: Calc string length after null checking
- xpointer: Check overflow in xmlXPtrEvalXPtrPart
- xmlIO: Check for int overflow before calling writecallback
- fix(xinclude): propagate parseFlags in xmlXIncludeProcess and
  xmlXIncludeProcessTree

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f81b17dfe4e6a1093d390aaa6e7f910687ced420

 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 849d70cbb5..d21fa53c08 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.sha256sum
-sha256  78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07  libxml2-2.15.3.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.4.sha256sum
+sha256  98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821  libxml2-2.15.4.tar.xz
 # License files, locally calculated
 sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index c1b5c4033c..3ca57f1d37 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.15
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
