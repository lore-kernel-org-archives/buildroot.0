Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A276CF043E
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 04:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F3680C7A;
	Wed,  9 Oct 2024 04:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dN6F_NOe11Zp; Wed,  9 Oct 2024 04:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB4480D69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB4480D69;
	Wed,  9 Oct 2024 04:30:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3031BF573
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 04:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B34840569
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 04:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYRZ41EZ3LsL for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 04:30:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E73B4055F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E73B4055F
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E73B4055F
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 04:30:18 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-7db637d1e4eso4710847a12.2
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 21:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728448217; x=1729053017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ALSDH/BfdHPeEQylT9vSHjNs82SFnx0AwzC6WjTjDI=;
 b=Xf5nWZviv/ceXjWzc64Gnj/2JqOR+HTHvG3rKmtpRqB9SL7nE/J0kKRyTde1lM+ji/
 Ugc/Vf4DuYoEdjqOFthMEZtkbe2FDpc5njg3aLLGnFOZstRK00A/q9ry6AH6tpJxJUIn
 5AOFMqN32/2AXjKZeoSSA1ePtgYx1IzjXYO0rG2NWeGMltwlIN0h9mASqAIuj9PfMw1G
 50x1g/dlk4fvTq6lQ9Mj1scdD4vNcN0yHc6z3CN4NfTdobUI9fRRvubMq3QUdvSug9gW
 Qq6UHMLysK3sXbLTE6UdQfm5WmfMpH4HBhjFzO5UCXT10usP8tw2+PXtWe5RQ4cNuDRl
 nPcA==
X-Gm-Message-State: AOJu0Yy5pq1Y3Sa1yeuKkUsMkLmK4MkTyB0vDb/73LlDZNXTsYqNiwNP
 MlpLlAv6mcHbvtBrwJXOHUjET+aGAK5tOcIM4rLsIjbbR5X6SqmOLjCa2snv
X-Google-Smtp-Source: AGHT+IH1M5QCwOJhDzNqMi6c3Ed4L6i07YTjwgqjBS6iOB6uoMJm3+XZMVhAilpFsKGdO9q8vr5oSA==
X-Received: by 2002:a05:6a21:3a46:b0:1cf:49a6:9933 with SMTP id
 adf61e73a8af0-1d8a3c1f354mr1666634637.20.1728448217148; 
 Tue, 08 Oct 2024 21:30:17 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7e9f681fe06sm7608215a12.20.2024.10.08.21.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 21:30:16 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 6A71E41E4F40; Wed, 09 Oct 2024 11:30:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Wed,  9 Oct 2024 11:30:02 +0700
Message-ID: <20241009043001.925924-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460; i=bagasdotme@gmail.com;
 h=from:subject; bh=yWIPLEI1eKCjn+tpMDQ0IQLdGKs6YS9bLxSvwj9nmNE=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhnQ2tpMiDdfP3ajq+v140/z0HzF+PjHG3duuvhSxnfkr7
 vILl0lXOkpZGMS4GGTFFFmi18ruMubde8ksJqEIZg4rE8gQBi5OAZjIofeMDP9Ov2CayitWZTgn
 2eKzP6fn0jcu9adO8vI8713aMYFz3m+GX8zbGP0fR80/JqHXaVnJNOf0mXePGX7F3mH+Xl7x+d3
 BW9wA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728448217; x=1729053017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ALSDH/BfdHPeEQylT9vSHjNs82SFnx0AwzC6WjTjDI=;
 b=lLXEQR2SCtWXTfvYRKtz2IWdV1dNbR/tDvV7JAFw5zSb1DZ76ocFepTQqXQbRRSMKh
 Ox8+KdJO/hrOHkJ73evtbuo8wX2RHLcvwAC3hNVWH+iwGdZ0SQS4etYnway9AUbutPE6
 uom6gMQGd0T96RWsTrYV9DOFITeEH4g7TZobvXWL67FdBYSW9Ic79K/A69dKSSonqZpo
 M0gs74FmA8ki3ssPjwkCz8f3gpYnETLicvi3Ns5DanH6PxhJzkKxhwRu5Dawgb6vk6Zl
 lzQyan12MvQdQCfdEz58aA+xCN3H4wlJWy7US9fZy/Y0p/0bNWrLU3vFsh56KJ6hd0Mc
 HJ2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lLXEQR2S
Subject: [Buildroot] [PATCH] package/git: bump to version 2.47.0
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the package version to v2.47.0.

Release announcement and notes:
https://lore.kernel.org/git/xmqqa5fg9bsz.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 6b34d14543..c290ebe6bd 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  7f123462a28b7ca3ebe2607485f7168554c2b10dfc155c7ec46300666ac27f95  git-2.46.0.tar.xz
+sha256  1ce114da88704271b43e027c51e04d9399f8c88e9ef7542dae7aebae7d87bc4e  git-2.47.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index d0b27d7e5c..f56807a00f 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.46.0
+GIT_VERSION = 2.47.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 451470b7a5f2bf26954673a87e74b580735f2d6e
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
