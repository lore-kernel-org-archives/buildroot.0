Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB4DC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B07F42986;
	Thu,  6 Jan 2022 22:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ig85yef9wWO9; Thu,  6 Jan 2022 22:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB98F42980;
	Thu,  6 Jan 2022 22:40:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADD4F1BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C0A242980
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kkMHfmy_6-6 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 936EB4297F
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:40:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o3so7563861wrh.10
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQ88dZGlmBtBwPdOTSOcRfwZtS3dd5YTrM1nfqYfPLM=;
 b=R1gRsUuWnpSSuYI9cJahJ5FUj0aYyO7d2+TGOSlLkMfqraemarywa6B2LF4Vr0YhIE
 ff/CNmJ73np06KvBnwMLZYvOmh0eM6ew9Wgd704UwvmhZmrQkmm+1hVo31W2IIufIw5w
 ZLgJ0RVlM80QfQrnrvFyk17hBCrIL3lqn5+eJ3WpoyHSEqneOIrBbTRbwk6xHe2Nkd0s
 8WG6wVQNrKWRWfZlpl0lcDABBmhRq+6joV+AJMYrt9CPbVhBQqQu/ljFdjbKV53ccghG
 6vpWEwI6x0ifZsi3n4+OFAXuUOoEYTEMgzI25pyXHClqPzsaoghG0YRATqnuUn8/I6rv
 A7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQ88dZGlmBtBwPdOTSOcRfwZtS3dd5YTrM1nfqYfPLM=;
 b=ZUHKgnJlzwPhQP14lmpOC0HmFtEvJPNJlNmNwi797kXZAMxhEucUyll+N9JRU9qqiP
 7fV5Ku1FpKDRBupydWkvijt3gSTBcg8X5OFiyFlg7j3y19EYm9P4H/zjKaal2WhGmcX1
 T7ePLFbG5YaysIksIQH1+V2rhVD8nCA4KHECrqvXYiLguX49Ew3kgw3VUIdkwg9oPjh7
 20ejO2QzNMZlwLvPrZujQRxwNe2Lw14FIUqaurjAb5f01x9jVFn16/oSvIksOCiqY+m5
 k/6eKmNSAPtnbFDKPyiOMq2p/yqGnMx0dqo8eeiXGBBbQGXcKm2Xz1loQviYAslchgpc
 HAiw==
X-Gm-Message-State: AOAM533jYtY2tIy6RHR+jvD8Wc7vngPwQlugGzBBuH9Sq/gesGB6Vem2
 WafVKOAT+oY5qf2wnz6erlbBxa+I0Gc=
X-Google-Smtp-Source: ABdhPJyY5HQ1hLxqSbEn9+uVcBox7+OdNz+BfDm4Ft1JpGzM4gOXw142my8N3UXwtV6IsJthzVS54g==
X-Received: by 2002:adf:fc02:: with SMTP id i2mr7625071wrr.330.1641508814268; 
 Thu, 06 Jan 2022 14:40:14 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id d10sm3649780wri.57.2022.01.06.14.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:40:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 23:39:05 +0100
Message-Id: <20220106223905.1069334-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liburiparser: security bump to
 version 0.9.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fixed: [CVE-2021-46141]
  Fix a bug affecting both uriNormalizeSyntax* and uriMakeOwner*
  functions where the text range in .hostText would not be duped using
  malloc but remain unchanged (and hence "not owned") for URIs with
  an IPv4 or IPv6 address hostname; depending on how an application
  uses uriparser, this could lead the application into a use-after-free
  situation.
  As the second half, fix uriFreeUriMembers* functions that would not
  free .hostText memory for URIs with an IPv4 or IPv6 address host;
  also, calling uriFreeUriMembers* multiple times on a URI of this
  very nature would result in trying to free pointers to stack
  (rather than heap) memory.
- Fixed: [CVE-2021-46142]
  Fix functions uriNormalizeSyntax* for out-of-memory situations
  (i.e. malloc returning NULL) for URIs containing empty segments
  (any of user info, host text, query, or fragment) where previously
  pointers to stack (rather than heap) memory were freed.

https://github.com/uriparser/uriparser/blob/uriparser-0.9.6/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburiparser/liburiparser.hash | 2 +-
 package/liburiparser/liburiparser.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 60acca2215..8b40807541 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dd8061eba7f2e66c151722e6db0b27c972baa6215cf16f135dbe0f0a4bc6606c  uriparser-0.9.5.tar.bz2
+sha256  a288a06668528c19e85e38c508335938e1de6fdd4b8f2072401b4533fcebf644  uriparser-0.9.6.tar.xz
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index c7bc604ece..c9903bd74f 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.9.5
-LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
+LIBURIPARSER_VERSION = 0.9.6
+LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
 LIBURIPARSER_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
