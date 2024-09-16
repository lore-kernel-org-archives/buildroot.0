Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C953C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 05:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0DD060617;
	Mon, 16 Sep 2024 05:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMrJaLe5_YkE; Mon, 16 Sep 2024 05:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3CB8608AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3CB8608AC;
	Mon, 16 Sep 2024 05:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 135D91BF59A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 05:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01A24403E5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 05:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTs_PCGJPCbE for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 05:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3BE7403AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3BE7403AF
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3BE7403AF
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 05:02:39 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f75de9a503so41213301fa.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726462957; x=1727067757;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S70GnA4nk/RD6WHSS665ruDyTr7t9YRlIq0bJlEcZss=;
 b=jKl6P7ud0PhfXctRu/YxD8Jk4x/i3KmGtL5BVWKTVEfS+jYjznXrybaH8nkTiKSzWc
 WCczQ5VR3SEKFmmxT2u83Gbn2MhW3V30rAE2uODrztlvIX/770LzjYXox7k1uqMoDNzp
 aFRjSA7SKijNV3CvbCuukY0v8fgx3J6vxssZhTZzZe8CaifBegW6cuJQ/5bpU8xnPVAO
 5GImOadkscnbWDhjqFVY1dhPvOW1F0/MYPkJD3B5ovCJWUXV4A70xIaByh2cPaUc8mOZ
 pPJ+cb1y/7p+g4EECyK+X4SrqIfZW7CdhrKcYppmwOn56Ye8cogkQN7uS2Bh/IuXMECp
 kaHQ==
X-Gm-Message-State: AOJu0Yw8Rkh03pQYxX65N6cG8hGkbUeEdFDV/akn98arfaC4aM03OhDt
 GYCkWNaEs+gt+AzfI7+qBEGDIiEri9k0nbiF4o+J6N/jiTX+WQb6jASlzQ==
X-Google-Smtp-Source: AGHT+IEE9CXvYNmyv/T34N/Gf7BrVS4FicMflOrTk0fWgRyJfswI95rB3MySaCH8SlRfSM85+n84FA==
X-Received: by 2002:a05:6512:230a:b0:530:e1f1:8dc9 with SMTP id
 2adb3069b0e04-53678fed1b2mr5939053e87.46.1726462956136; 
 Sun, 15 Sep 2024 22:02:36 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870b8ccbsm762996e87.279.2024.09.15.22.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 22:02:34 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 07:02:31 +0200
Message-ID: <20240916050231.85966-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726462957; x=1727067757; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S70GnA4nk/RD6WHSS665ruDyTr7t9YRlIq0bJlEcZss=;
 b=QW7sBpYZtVB/D+bVUCI1q8O5Ibuka8ez/wVDKFwRmBqClBMth7mlW8BQbgU6+0UH40
 OwgajTptzaR5f49bqg6tZWwoFedwp92RtExRyNgqcxg/9KZPfK/1AHnpPnNnUscqrcu5
 OkUThUdnxid0IPECKxxi66mPcAQcAG68bKkeHDMr4sW3eUM7OoWBSqJvVS9tWdTw/IM2
 29sulOYhc8LDdw0O0fgmR7gkZjrC04mXeEOmq/osHo6MCz2AMMqJgj56zMLFF9s2nW7l
 beZI7XwntMVj1LiGuTV1ljFh3xwR6V3j9xdCoQHySHxGdRVndDMHvMqFVlYvuuIlL2fX
 V8ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QW7sBpYZ
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.6.2
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From https://github.com/troglobit/sysklogd/releases/tag/v2.6.2:

 - syslog.conf: misplaced continuation character in example
 - Add facility aliases for RFC5424 compliance: LOG_CRON2 and LOG_AUDIT,
   including facilitynames[] = cron2, audit.  Used by the native logger
   tool (and any clients linking to libsyslog)
 - Fix data corruption using the listen directive, introduced in 2.6.0
 - Fix IPv6 addresses in listen directive, introduced in 2.6.0
 - Fix logging to remote IPv6 address, add support for parsing
   [fdd5::6979:c0ff:ee87:8f92]:123 style addresses
 - Fix initial delay for unresolvable remote target.  When a DNS name
   cannot be resolved, e.g., critically at boot, syslogd blocked with
   default resolver timeout (5 * 2 sec)

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 0a5790a1a5..8b1cd63a73 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  e35d5c5f55019976302ac9818890bd6b6858db257506f0e9afaa718a8dee9cc3  sysklogd-2.6.1.tar.gz
+sha256  40a3bb593d7507e49a4379f48ae8a9bc4b68dcc583efcdbf3b9056128442c92a  sysklogd-2.6.2.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 86bd4ef168..eeb3a3748d 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.6.1
+SYSKLOGD_VERSION = 2.6.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
