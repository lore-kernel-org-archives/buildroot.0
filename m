Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90292ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 20:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C0A404BE;
	Sun, 23 Oct 2022 20:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C0A404BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ourKyeCuIf6m; Sun, 23 Oct 2022 20:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C857A4049C;
	Sun, 23 Oct 2022 20:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C857A4049C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA9EB1BF38D
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD69A4043A
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD69A4043A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXRUGWQq_U29 for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 20:54:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C2514042F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C2514042F
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 20:54:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so8806105wms.0
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 13:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3aE8FUbVUxFm6Mwg/nELjF1IqwwXlc+xeSsWBve6f5Y=;
 b=zl/6lALmOw06Kj80d90Re6h6aRlfjixqylpxxzqdeFr7me5xTTVF2se9p6ozqva0Bd
 mujzkqVzZ+aMp4Z7AO//nJ3SVjKmRlTvHDc9EHg8ARitfyR3YF52s5gQ9RbZh2W0ULmf
 r4CxE3VZSyRxvv8d/dS5Z86jBHkY8eGUxdEowseR1xkzpodi9OA9KIlNvswtcFmQEd+f
 UBAbggE7aB7qPWGdnitYUabVn3omNxWx4DSbN/xmrXBA8uo5uY+CJYdLTE2+mdqhkTwz
 O/B+wwNn2s8RmSed/2HGbVeH1+tyRJ+VSjx/DbLevw2KmSbav3aBIzO98UVPTnuJ1iwn
 Ecig==
X-Gm-Message-State: ACrzQf3Y183wcEZB2RS2UHnEhOYuQpnrOXn4RdUV972kOqiXP5hvSEnt
 tPw+CM2xc+bYYRKd1di4zRpJKXLnDOA=
X-Google-Smtp-Source: AMsMyM6nVGnAyhglnBPLv6EvwAKbpuuEryLJnq4K+unnXDRbgp/1F+aN9vQ1KmVFTC38/BW109+5nw==
X-Received: by 2002:a05:600c:418b:b0:3c6:c1e6:b01c with SMTP id
 p11-20020a05600c418b00b003c6c1e6b01cmr20593691wmh.118.1666558482935; 
 Sun, 23 Oct 2022 13:54:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 b13-20020a5d45cd000000b0023657e1b97esm6762182wrs.11.2022.10.23.13.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 13:54:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 22:54:40 +0200
Message-Id: <20221023205440.36753-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3aE8FUbVUxFm6Mwg/nELjF1IqwwXlc+xeSsWBve6f5Y=;
 b=eWsUVpStSIl4AqPShi5XBJLMWph3MCBtkVva+sBcTmhC3/+RnB1nkrpQrrXLkmaZoh
 grYqigRNLFkFRghXeu3qUgZkqp7oZpqLkTPzD1CoXya64N6o2ug4kfOhPYomsF+DXOxG
 FJzWXHDBQaaPPPhs5uIpfWSPlAN5JcsGezxOJizjeXs7FT3b7VsHEoBeT3Tea2pA4jEC
 76UNX1ApfNDlditnF7GnDygl0KFlaTMTvAlEIZ2tete5y1MfqWsTIigutYnN9K1W7h3h
 gpvHkMfJfTjyWbyw7hOoh85jCHXwuf4bgsJjXIWcZYoe/8zZb0HBukzTm8U1Iqecss0m
 GQ7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eWsUVpSt
Subject: [Buildroot] [PATCH 1/1] package/libminiupnpc: bump to version 2.2.4
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

2022/02/20:
  upnpc: use of @ to replace local lan address

2021/11/09:
  python module : Allow to specify the root description url

- Drop patch (already in version)
- Update hash of LICENSE file (license "refined" for github with
  https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13)

http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.2.4.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...akeLists-txt-fix-install-for-headers.patch | 43 -------------------
 package/libminiupnpc/libminiupnpc.hash        |  4 +-
 package/libminiupnpc/libminiupnpc.mk          |  2 +-
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch

diff --git a/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch b/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch
deleted file mode 100644
index 2e4c8a69e6..0000000000
--- a/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f82b0563a72e33800f5918ead68c41bcda1fd4c1 Mon Sep 17 00:00:00 2001
-From: heitbaum <rudi@heitbaum.com>
-Date: Fri, 1 Oct 2021 00:00:27 +1000
-Subject: [PATCH] miniupnpc/CMakeLists.txt: fix install for headers
-
-[Retrieved from:
-https://github.com/miniupnp/miniupnp/commit/f82b0563a72e33800f5918ead68c41bcda1fd4c1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- miniupnpc/CMakeLists.txt | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0553eeb3..6b0904c0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -221,16 +221,16 @@ endif ()
- 
- if (NOT UPNPC_NO_INSTALL)
-   install (FILES
--    miniupnpc.h
--    miniwget.h
--    upnpcommands.h
--    igd_desc_parse.h
--    upnpreplyparse.h
--    upnperrors.h
--    upnpdev.h
--    miniupnpctypes.h
--    portlistingparse.h
--    miniupnpc_declspec.h
-+    include/miniupnpc.h
-+    include/miniwget.h
-+    include/upnpcommands.h
-+    include/igd_desc_parse.h
-+    include/upnpreplyparse.h
-+    include/upnperrors.h
-+    include/upnpdev.h
-+    include/miniupnpctypes.h
-+    include/portlistingparse.h
-+    include/miniupnpc_declspec.h
-     DESTINATION include/miniupnpc
-   )
- 
diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 4714dd6f48..5dca8dd6cf 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dce41b4a4f08521c53a0ab163ad2007d18b5e1aa173ea5803bd47a1be3159c24  miniupnpc-2.2.3.tar.gz
-sha256  90bb92bf524970569296022fea562c85a4ec4d99a16f3aef2144d13d7087b631  LICENSE
+sha256  481a5e4aede64e9ef29895b218836c3608d973e77a35b4f228ab1f3629412c4b  miniupnpc-2.2.4.tar.gz
+sha256  a0f853256954f388ce4fab5faaef6a1f5bcd5e682c3c7c70b07b7130e932a021  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index f3661396ca..9dc5c719a9 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.3
+LIBMINIUPNPC_VERSION = 2.2.4
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
