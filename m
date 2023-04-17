Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1141EC77B72
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 20:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9417D81FB8;
	Mon, 17 Apr 2023 20:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9417D81FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPOwhQzJt3UA; Mon, 17 Apr 2023 20:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD69281EF8;
	Mon, 17 Apr 2023 20:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD69281EF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77B461C4210
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 519EE81EF8
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 519EE81EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhLtUkPwGjG4 for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 20:37:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D61B8196E
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D61B8196E
 for <buildroot@busybox.net>; Mon, 17 Apr 2023 20:37:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso149772366b.3
 for <buildroot@busybox.net>; Mon, 17 Apr 2023 13:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681763849; x=1684355849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hru5AG6VwJ6Is7DzE/H5bCpER0gNwUqXiLtL9Suiolg=;
 b=NT6X3d5AysuAN94lmuGxKkfIEuK6qQEHNRqeYa11YhlZWYpBzh3C2/xMQC1I3mpcFH
 ujZoKlR3hHAOqFk5xB7PQ65F5Ckm8BpAsEImLl59q9owBRCeQHCmHJsldTTj8qQF+pqr
 G7KHxPq4jJP+sFzHxiL5fU5UWq5OnMkmAZGMOWI+ucC99GroDFpPTqpMA08EcqzBDRqT
 Z0syeGHdzcwijRWNTKfZ8rz+MCYNgQ81hSDtcGAbFFIad0UC0tNzDfadXCgQ0QvdPvU8
 gDZCiBKR5UJ2kwad8CIzLtRigW4yg9+i5mgpNL9f8HqG3BuYIEofaJqSuK4w6KpdsBW7
 hEWw==
X-Gm-Message-State: AAQBX9cZqw4fT3nNIwy0/KdVVxDM+maGZLY3Z/bGHVYSJCL/INq77h4D
 C1VQ6GyWdKk22eMMW1lkFpIhtV0Eldw=
X-Google-Smtp-Source: AKy350ZMLE/rfH6KHBBD2bdIQW/YYLuFB/f7sQFw+Se2f7X49Fwd+8dZikMEWV349vssgMAUp056Nw==
X-Received: by 2002:aa7:d995:0:b0:506:74d6:45aa with SMTP id
 u21-20020aa7d995000000b0050674d645aamr206951eds.24.1681763849156; 
 Mon, 17 Apr 2023 13:37:29 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a056402068200b005069175dcb7sm3670633edy.58.2023.04.17.13.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:37:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 17 Apr 2023 22:37:21 +0200
Message-Id: <20230417203722.49416-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681763849; x=1684355849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hru5AG6VwJ6Is7DzE/H5bCpER0gNwUqXiLtL9Suiolg=;
 b=YKQRMeOnCOnFhuIFjWtER8v0Jgfhv+rokjHmDV5bNdWqKoXFiHjCb7AB4dNvq+78QG
 qLTaqtCV/9EJshcvU+8PKQqtEWH77noQMEG2lGBTMTQQthMQEV0McnR3cu+8rEh19CrB
 yFEI764wvmkXvtzAjKsTA9s6abrril5lHKiKdrcTCPsUvFz7VGorQpWPycz6lSwx3NBp
 3LvbTKGaBUM8Q2YNkuQm7u3lin3qpa1uz2UFXp5f07V+X/dh+zKBmY+oo1omHkK7Xa76
 /aOwnYLG9s5c3I0YX+demKLttUxlpzWjnesHVaUbS7HNojez9JHdyB1itGKzSnB22Aan
 tu7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YKQRMeOn
Subject: [Buildroot] [PATCH] package/tcpdump: bump to version 4.99.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index e548e3262..58190356a 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.4.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3  tcpdump-4.99.3.tar.gz
+sha256  0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea  tcpdump-4.99.4.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 7a679ce4b..91643e7be 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.3
+TCPDUMP_VERSION = 4.99.4
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
