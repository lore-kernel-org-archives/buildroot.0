Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF7EC7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 13:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CFDD40236;
	Sun, 11 Jun 2023 13:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CFDD40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQi9BzSw2s_e; Sun, 11 Jun 2023 13:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05E60405F6;
	Sun, 11 Jun 2023 13:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05E60405F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3161BF86B
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73BEB4034B
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73BEB4034B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkuqP2p30e_1 for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 13:16:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB4634032A
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB4634032A
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:16:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30ae61354fbso2198805f8f.3
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 06:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686489399; x=1689081399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GqxZYkAjJDfKZ24Q7guwgxohfYhm5wuO0hLhqBa9n5M=;
 b=MykRA72PvEzElfAxQr569FA0Q8XyGrhbYbrwSZcva1174YEeMSkUvjETKMk9RxR/+L
 BLTZJp+ZrQXnSi1ghRW4vI9wGxH3plXgqJaO5QYW7WjqEok3SRCDGXbOmUkF4S1nXj9x
 Lx9Dz6fPH0ZzXc31sgv8XIzHh/j+GGWa95f7moyaJ6gek3XOPZojO1N/BxEallz8H4Dj
 vLxH3VPmliz+3t7Y3+/U+FS2IlD+x3pux5souzKeS7lkRGsU0OlVQ+PiW+gDw6tkKHCl
 NrCxMYAkTAMt7BTMzyYgqo9SyI8UzmV709qAXDG+gf2ZIoI7xSJW1/ww4Pb/nc3RwUij
 S2/w==
X-Gm-Message-State: AC+VfDxzFMRDeef71ZFy9eSWAcQWV/Cw43hJG+tx/GmAbQXE3L+mlaYb
 rsd0C+NzZxojvnRpMOZcq8y5lkPuJHA=
X-Google-Smtp-Source: ACHHUZ5WwD8kUEmwdaagdV3Ul9/2KueXqGL8cXMjsXNkLyjHaMqQBLKCqQNrl+xLG78XhrZxmVab5A==
X-Received: by 2002:a5d:6acd:0:b0:30f:b7b4:3e55 with SMTP id
 u13-20020a5d6acd000000b0030fb7b43e55mr2573954wrw.19.1686489399661; 
 Sun, 11 Jun 2023 06:16:39 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a5d4d4a000000b0030fc079b7f3sm747585wru.73.2023.06.11.06.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 06:16:39 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 15:16:30 +0200
Message-Id: <20230611131631.806432-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611131631.806432-1-romain.naour@gmail.com>
References: <20230611131631.806432-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686489399; x=1689081399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqxZYkAjJDfKZ24Q7guwgxohfYhm5wuO0hLhqBa9n5M=;
 b=EYRHBm/NCHWsho5FxwgewEta5F46HOn246f8v31wv920X4BwzudQWlJe71xfJTwzqz
 crLpBCZnZ8CS2NpyYkAARjUGQe6CQ6WpZjqs8fRVEnwD6Cp0Dv4WXGBZrRbzGwdMCh/b
 AQ+LTjgKK11p2flN/ZBy9xpbLyZLB/PjSy9b6gPUZBYUQcGxfSMMjiv4pBg4rmHaIF7I
 KMJS1C651aRGZFerfq7ZYImmgP8qWqMk18gr9Vy+wA6tPJkN8VNfnaV6ze8xZ/M1Tz3p
 L3ZHM76iRUECvjijGX6uuNoJ9mxwIAjPOysodbDIl2iK3iyfQ6wQPVmpmKKFJRXjY3Ng
 AkbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EYRHBm/N
Subject: [Buildroot] [PATCH 4/5] package/binutils: switch to 2.39.x as the
 default version
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that 2.40 has been released, let's use 2.39.x as the default
binutils version.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index fe1755683c..a1800e49e2 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_38_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_39_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index e34dd79f6f..0dd8526b26 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2020.09-release
 else
-BINUTILS_VERSION = 2.38
+BINUTILS_VERSION = 2.39
 endif
 endif # BINUTILS_VERSION
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
