Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2DBC52D71
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 05:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C24540B38;
	Fri,  2 Aug 2024 05:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zde7_ldJIKGn; Fri,  2 Aug 2024 05:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B009140B5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B009140B5F;
	Fri,  2 Aug 2024 05:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4D81BF3BA
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 05:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3712240B5F
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 05:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDlfUH9x7Lgr for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 05:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A6ED40B38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A6ED40B38
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A6ED40B38
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 05:08:43 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5d5b1e33fa8so4257288eaf.3
 for <buildroot@buildroot.org>; Thu, 01 Aug 2024 22:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722575322; x=1723180122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZmwB2apm4tu1d7Q5AGvrFhhf0222y2UQXbL4GNpIe6k=;
 b=Hht6nTR37HsG+KB8+fQEZ1uAxPK+8GS/gP5XiaVhyqwHFJ2qaRa39OnO9z8IXIr6By
 6ArsTa4+QQGXwvOhVKJDQen1U9Du27hX6lXPkrucINRwWRfzKQi0OUf6iviwlMNstPWG
 5J0nQ4gDDVM6rlb4Veho/avnxl043NcN+sOVpCBtEI98Y1KcJGSUUK/4yiwSNUiwJBlw
 cVe+PQF697emAuCdldZmcxO0wcceh93D7WCWVbau0lDR9BRToN71DTTu9/F7OhVOfeV6
 SxNqxFy7WTHCOZag7PYsF83N4RKsQIYDoWxcwHS2I94KODqkLBtG+gKMfmg8Ght4CZJv
 ET/w==
X-Gm-Message-State: AOJu0YxfWwff4LoXpxtj0siwmH3E5ZHVQC7oMpnjsLv0yKsCUFyZfNtV
 1RExUU7Ki/eUnXAy00RXQ3kZoLA7SmuokXErBCYFMUBwL1S6pENXugSLV4gP
X-Google-Smtp-Source: AGHT+IGgm/zc0n42W9FYuB/WZ/pGIaTPdQiV5OVMNFwkjcSlKpyrgIXzdgsaM+RxyVnhFrGoeFpznQ==
X-Received: by 2002:a05:6870:7190:b0:260:f1a8:a64b with SMTP id
 586e51a60fabf-26891d4bc8fmr2660158fac.24.1722575322561; 
 Thu, 01 Aug 2024 22:08:42 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ecfd2b3sm650335b3a.172.2024.08.01.22.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 22:08:42 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 9D237419520B; Fri, 02 Aug 2024 12:08:38 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Fri,  2 Aug 2024 12:08:31 +0700
Message-ID: <20240802050830.1020682-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=bagasdotme@gmail.com;
 h=from:subject; bh=g6QmUeFdAlLDKrSViFx9f++1gLmhpBfZMjOsXjYG1OQ=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhrQ1mefyD/x1t1G4OL1K2K7G4H9e76qoR7WsmkxLHR0/H
 WZOXX2vo5SFQYyLQVZMkSV6rewuY969l8xiEopg5rAygQxh4OIUgImY5jD8T/pa+XPyrtoPr67m
 2bJmFHr+3/Np0Zbo1K7GEwzHJwWq9DIyTL63WGS+q9mPVXemtOS8/Gx+ZtOPvXLrDfTDd095LBm
 ZwAcA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722575322; x=1723180122; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmwB2apm4tu1d7Q5AGvrFhhf0222y2UQXbL4GNpIe6k=;
 b=AjB8TvaCeWjGsooNseg9MfcURaR7DI1vVDNXQy8nsai/rUEGK5MCxluTmNtUZ5IuKc
 XvTu3CVUGJuuBQE+Dxm1lWAOils8wQ5WUVFVkg6gbmHPPVOD3otJdrJ2IGue6w041/cw
 iiZZsJwrKqvX1voPEVr7sVIhDcDPIfhMxvAG+g49rpJb22/3y3oYlVFgvHHbxM/8jPsL
 pZm73H1BaWniT/YoxMEfnRkakihbzYFTgQfoq7MDcZclfFLNt/21yl5jP/HwSbK5i2Ry
 u+DFwpeDSz3CqiAV1KL47rcWUWgKd3BWe6QryBZvIJxLQoGQCI6ov0QLMzlFuuUntCl1
 flUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AjB8TvaC
Subject: [Buildroot] [PATCH] package/git: bump to version 2.46.0
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

Bump the package version to 2.46.0.

Release notes:
https://lore.kernel.org/git/xmqqzfq0i0qa.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index f72fd60ec2..6b34d14543 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  51bfe87eb1c02fed1484051875365eeab229831d30d0cec5d89a14f9e40e9adb  git-2.45.2.tar.xz
+sha256  7f123462a28b7ca3ebe2607485f7168554c2b10dfc155c7ec46300666ac27f95  git-2.46.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index d84b2e487c..d0b27d7e5c 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.45.2
+GIT_VERSION = 2.46.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 2652faca32bf0d1ab5af825b6c75118dbba0312f
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
