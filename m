Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B91C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 573B441D09;
	Thu, 19 May 2022 14:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aqZY-R70Dlt; Thu, 19 May 2022 14:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130DC4175D;
	Thu, 19 May 2022 14:11:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FAC01BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5859260F6F
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZlNz-_6ItbU for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73B6C60EAC
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w4so7316417wrg.12
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwvG7rNX0n8q8gwLTmVjjbizc8hMIPfwMOGQZaSseQQ=;
 b=exGJt6OXOZh57TeFjN/G3PQ0IA1Q0wpN2Dcl1i3QjoNWS7ag621gl0MT8/1cG0S6L7
 LUlIVwhH8DpDKjB1sQ5r9rBbMZD0MDF3iTR34R1lS6P4FYPGd/GOhnsleGmXM0LCwr63
 iij56Mkp7dcpGZQ5W/5Jx+Mo7uNijWUKP6P0VhEjrmEu4CgzSVLVoGNrnfFghP3z7TOQ
 M3gKdBsU9N3Nef+RmUrlfUywRyV769ZUCmgy2KHoXH+eaqrjo4TxxvGrak9Umtk6bNtd
 1JcQUEIMP0gw1FUFPtKmVF/hhqn0NMsOQAXjJwM/CDip/FQ+axJw/MCJD+D4bb0UQadx
 MFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwvG7rNX0n8q8gwLTmVjjbizc8hMIPfwMOGQZaSseQQ=;
 b=WFHmZnA/5Md5moNIcLJcPrP9gQ6GqYrG8CUghSgecw4kLIkiU6YT7+nroXadgd1kEQ
 V/otSvw1yh9Tssz9XPYxivKc3V4AdjMIzbDTL/3SKSIzYZbQHwEZarDAKW21soknuE6I
 BK0CpeJSzntKas4oLQRkDcTkxaSQu0ZIz2iF1paxscRChtI62PIwSZ3YRVNPb5Be6r0+
 Tf8AhTlI5CiMj3EZleTECoLYuqq+nqfJrWtqRobDZySgQJbRO8UjxMwgipkFad5n3Wm+
 2DItM7yQcwzrb/3iVKp/AypNv/yQK8E6w05ursvutNqWFNxtqd1c3SaY8024kaGx7Ow+
 rkcg==
X-Gm-Message-State: AOAM532U4H1cRMX04rGa6ltQ1AVtb6jqEcYHlwHdwbPsLWyehjoDNVEz
 ijK/daMJvSTOVH8zJEl7X2m6gvMndLM=
X-Google-Smtp-Source: ABdhPJwoxQ+NKMzfYEE+tsxJDZilVZZElgwfGY5HRQKKWFZxOWUErKrFtPuV/xFqpP0kkubhPhaK3A==
X-Received: by 2002:a05:6000:1e1a:b0:20c:565d:ca1c with SMTP id
 bj26-20020a0560001e1a00b0020c565dca1cmr4080442wrb.643.1652969325300; 
 Thu, 19 May 2022 07:08:45 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:45 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:05 +0200
Message-Id: <20220519140810.1953601-16-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 15/20] package/erlang-jose: bump version to
 1.11.1
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-jose/erlang-jose.hash | 4 ++--
 package/erlang-jose/erlang-jose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-jose/erlang-jose.hash b/package/erlang-jose/erlang-jose.hash
index 71a1543d92..75e6f0a041 100644
--- a/package/erlang-jose/erlang-jose.hash
+++ b/package/erlang-jose/erlang-jose.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d55a9d3a1697833fed555a21f1aeb2727af88193995cb6ffa945d4b6749d0e8d erlang-jose-1.9.0.tar.gz
-sha256 6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be LICENSE.md
+sha256  87cdcb9df6f943c97772e5d90bed87555a72c8957ce2cb901df259050e18e7bb  erlang-jose-1.11.1.tar.gz
+sha256  6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be  LICENSE.md
diff --git a/package/erlang-jose/erlang-jose.mk b/package/erlang-jose/erlang-jose.mk
index 43ed22a9f7..b31a60aa3e 100644
--- a/package/erlang-jose/erlang-jose.mk
+++ b/package/erlang-jose/erlang-jose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JOSE_VERSION = 1.9.0
+ERLANG_JOSE_VERSION = 1.11.1
 ERLANG_JOSE_SITE = $(call github,potatosalad,erlang-jose,$(ERLANG_JOSE_VERSION))
 ERLANG_JOSE_LICENSE = MIT
 ERLANG_JOSE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
