Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1A2C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83078400CB;
	Tue,  2 Jan 2024 22:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83078400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HBJBmT1HzFU3; Tue,  2 Jan 2024 22:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67C7F4014B;
	Tue,  2 Jan 2024 22:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67C7F4014B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAF031BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE91F4014B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE91F4014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUehrVCpUXkp for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:31:28 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 082A8400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 082A8400CB
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d4f5d902dso87327565e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 14:31:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704234685; x=1704839485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P1/kvABa0Lt7RaL95hRG0TY8kS+AwsLB4HDWspGZ8L0=;
 b=NpPvGxmj3sz0+GcyWaGt0qkGRgZVrkrOvoVCuD5J7VuXgsHuqP3DhBMVuoOfYcVLYI
 In+IN+SrP0hp8HfNQ9FQplCkH/rqSrTTJ/9RZwnINovdWrcrdr6q1nNhiP6U7URUzGbI
 37mA+e0c5D9GBXejfJMtyZu5/sU8fzENP+s1oU8uzAN0Rn/4CQOMea8xzoNBdu8NlZ7A
 UeP9dCcg9M1uobeGL7r0Z5mC/JXa8UuVnYvrfa/udkFcukYF6Bq77HMztvLEKDKw+8sX
 W62ZM4/7OePGRa0j35LZMz6I0OWb2wqV1iq8G9rnbqu0DraO4UgR6+4ZjFqKr9dxqvww
 0n+w==
X-Gm-Message-State: AOJu0Yw0tl0cMIAqM/3/qVKcZVF2W+6Ea7XAO1T9PucQ56lZoZxT4K5L
 epR9+WaBedkUyJYtAkcudkaFtJMs6BA=
X-Google-Smtp-Source: AGHT+IGB2f4da86P+ul8XLH4vPJP0BLCKTFuU7SGWmE0JzsiFCD/QguzxVCHxg5/wo6Fq4NnlZgqkg==
X-Received: by 2002:a05:600c:5124:b0:40d:5ae5:9b9d with SMTP id
 o36-20020a05600c512400b0040d5ae59b9dmr5826440wms.63.1704234685162; 
 Tue, 02 Jan 2024 14:31:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f7-20020a5d4dc7000000b00336ebf93416sm17362978wru.17.2024.01.02.14.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 14:31:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 23:31:22 +0100
Message-ID: <20240102223122.2463453-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704234685; x=1704839485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P1/kvABa0Lt7RaL95hRG0TY8kS+AwsLB4HDWspGZ8L0=;
 b=h7vtlvIFMbVLy8RoLRQYeHcu5hX8cuP8eAceo+gUER6+OSLAhzl8OqikVObEPQqsad
 RyuB1RJZZH69tKHIgFxifM9YZ7bw9LIywoInqaa6mdyp31QekVE/gHqn9kA5YtZ5hpzg
 9BnabrVKH0lzlQFcjtv5oasnpAnPX7S15l7RNJ9ngoQyy7KXrFMTNvm5qt+R6erO/kju
 PYYFL6OOuyBUHbabKBGLCbK0adbJGUGxf1NidzpFy57c4dXkuqgPyOw4W7t9omY605k5
 gN9Gmf/U8GvJQbFNACuVKoGgsqBNrhbHqspR+/FWeBjWkCuFJcY6kqHxvwhwzrINgGOs
 HPjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h7vtlvIF
Subject: [Buildroot] [PATCH 1/1] package/jszip: bump to version 3.10.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Stuk/jszip/blob/v3.10.1/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jszip/jszip.hash | 2 +-
 package/jszip/jszip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jszip/jszip.hash b/package/jszip/jszip.hash
index d0c56a44ab..e90e9cc68b 100644
--- a/package/jszip/jszip.hash
+++ b/package/jszip/jszip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  aa3033c6bb5357a0b0965c92fbdb6d6abe64676e70ffa7933b63c573ab79ee45  jszip-3.10.0.tar.gz
+sha256  e873e5d0d8549c78c0eafcab8fba40f4a1e27c5a9d48f4a6b2eb122470d0d88c  jszip-3.10.1.tar.gz
 sha256  566c953c6090b1218ca6217dd7359d45dde46581968586dc607d59a78af6a9c4  LICENSE.markdown
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
index 3504368675..b282610a0d 100644
--- a/package/jszip/jszip.mk
+++ b/package/jszip/jszip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSZIP_VERSION = 3.10.0
+JSZIP_VERSION = 3.10.1
 JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
 JSZIP_LICENSE = MIT or GPL-3.0
 JSZIP_LICENSE_FILES = LICENSE.markdown
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
