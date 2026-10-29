Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4C606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ltBN6E+G
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97CB6407A2;
	Thu, 29 Oct 2026 20:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvmzvVO3fnWl; Thu, 29 Oct 2026 20:23:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9D0C840A5B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305402;
	b=KhWIg8fL44mMoeeDEcghzQFlIsAUtt42oiRQUiFcos0dknVC7OCQDwonOEyhDtu4TR7X
	 WtfVMVllQOx/3+kv97K7FIb6cHPfT3fuAY3cQeSn9h0HRSbbSaGuIpKf7pG4guQLCPuAe
	 WcD78Q7eGrgp3Vmy5FdBXeelF35YnAUaaXCwLyL8vW7654pP0YJ2AJDLopZlr3BoqGNgP
	 O6zlO16XRUHLv6V0l5N8rVKYa3G5WFKRx799nySdpbUXTSDUX9qZbcuyWplVahHpLjbZI
	 Xywr7j+0/12lfXlvzpRIdSv3XOi9jOX8GBls9uo4ExrI6Mspq+S+gbdR+0vsDgVL29w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b5OMlnxYGQ/X0IvkRzNw91ww6iLHOvGu/myM5ebXnVo=;
	b=OghsnbNfVgQs4WhSsNz+reDHDYXznwDXTlYnXtct6/TmjZ+5jzKDboK8x7FNyOlZ/1YR
	 sxxchXNN4CXLYT0gKJE/PlVJSOMaMRQWhMyPi4Ekmw1Z9vum6BwCc8mmsLxEl58GW+Ub/
	 I5ahkja0O9Pq2iBhAvQXUsKzAeK9DkizKn39sJXf+SMUIvNXI4IlpQ7lGEyMz3VuApdII
	 Uwu00DhNOBTB7vHCJqEpmicDtvEWtvW62G4NltakuSoNKdjR3HwFX9YaIE3fRcUGJ20VJ
	 86sgQgpZkH0kVUPhIbn8tNBopLNdmHeHAZ5MRfNjo/COUZXsVWSFfG1IikWeLirqkZg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305402;
	bh=b5OMlnxYGQ/X0IvkRzNw91ww6iLHOvGu/myM5ebXnVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ltBN6E+GTNfOl1sfW8heQh/1MBEg7ZvY1VIXWHA83TwaoHdjlzd0vzlv9qj1xE8aa
	 XvLE6pXG7nFdM64Hw6bZKSxfFtb5KjDFR4zvUnnfUrrkETMzzWSDs0YBIp/yi8OyoN
	 JE9D+Q+jRpMUbRB8uSbPWAjtagg016Xj3A22boNYK01aC3seBqAUvPxHceDnBwUOmk
	 kGSJQOMi1SKSkY5e0ZHvaT/58VQJBO0KXn3HtpxdubnGyyantRpYAD77CXhnadLneU
	 4ajLDbh/xiqg0Fy4tGOmIx9S1z/VTEIaBYP5N91zrDGOxAuZp9BiTA1vTgbd3o3RuX
	 4dWfRVa8jxyDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D0C840A5B;
	Thu, 29 Oct 2026 20:23:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C242E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B3F081021
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjNFID1DK_VS for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3926780DAB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=VdIePpk7S/xVL9m0kXA5oW1lhlEUxLqKEXZrZoXpFIcocPyRS57I9T+OQbmGQL1pOnrh
 FqejZV8hikCzGc+0PrrKKK425oEDbzCPWmjoIBGZA4qDef46sMsdDaYWGM/su8rRjYIyj
 CfmS/X/64w3Lld3Pf4eEK/bQexPvYpxcjsFHuzpw+1N5bl+kXmSxSUo8jeInH7NffcyrD
 fW0vX47DqZ4mm6YG0ZtcbEGN1KRNKynrp4sU6HnzKV3oq/lbYI2Djsljv2XYYkJss2Jte
 VfR3gsuDb6vzoaOjR34nF29w/rJGja76yvaM57diw9G4Q95hYbKKnMe3Q5gqRNkMFwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jjTkJgi3FBnBYd1cdZ9K8re5sWqB2HnQelwDwzAl5RE=;
 b=ryh+37yrc4r4KqnFOeIoJngn1aInZod7wJTxWGKTlBwDu8Bi3NzaxLr60M+erLJRkg1l
 4Je64WA+pO/s4w2+5ii5fdOZmQ+S1UXoyePJ+UanXirIi+TJ0G21486K3hrXI6rQelFP5
 5z2HPJYvn+ptuml/e4csHqL9i2THYLYB9I0IcdvjeVSm6vHZmrIjsrWxtNgmGNoFtx2RR
 aDIt0KQjJ6V//cQR0G6c9vCw751+sLKPJ1ZJ9F9HL8xBfI7ygHYOK11hcF4Za/toY5vPG
 26umy5+4wEcHhyFxwygh6M5dho7o7qeh9h/5l8LN7EG8AgysXaHm61BfvASAXSIMX7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3926780DAB
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A16A59D2EB; Thu, 29 Oct 2026 20:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc0ff4011c15928e49a891f920d15538076474a8
X-Git-Newrev: cf07cc26b0b4e3d858654dcd966dda3ae2bae580
X-Patchwork-Hint: ignore
Message-Id: <20261029202152.A16A59D2EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bento4: bump version to
 1.6.0-641-6-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf07cc26b0b4e3d858654dcd966dda3ae2bae580
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/xbmc/Bento4/releases

Removed -std=c++11 from cflags due to upstream commit which added
compatibility with c++20:
https://github.com/xbmc/Bento4/commit/9380a868a74252fa53c80174a3e942168e6c0d85

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bento4/bento4.hash | 2 +-
 package/bento4/bento4.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bento4/bento4.hash b/package/bento4/bento4.hash
index b933c74d2d..bbb10785d1 100644
--- a/package/bento4/bento4.hash
+++ b/package/bento4/bento4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1f8cfa4f7cb651b609e587f825607cb4b06fe5b08af876fd0154a434f9a5315  bento4-1.6.0-641-Omega.tar.gz
+sha256  cb5006cd30889238760556e6148f69be34fef4dc48e8d895a9822f805504a5c0  bento4-1.6.0-641-6-Piers.tar.gz
 sha256  7daae92c8628ada28def8d096fe2fde298b72ec3e2d64a3c408afce38edb361b  Documents/LICENSE.txt
diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
index 569e320a2f..bb91c9b65b 100644
--- a/package/bento4/bento4.mk
+++ b/package/bento4/bento4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BENTO4_VERSION = 1.6.0-641-Omega
+BENTO4_VERSION = 1.6.0-641-6-Piers
 BENTO4_SITE = $(call github,xbmc,Bento4,$(BENTO4_VERSION))
 BENTO4_INSTALL_STAGING = YES
 BENTO4_LICENSE = GPL-2.0+
@@ -20,6 +20,6 @@ endif
 
 BENTO4_CONF_OPTS += \
 	-DBUILD_APPS=OFF \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
