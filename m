Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C30CE835C
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 16:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F258C80C28;
	Mon, 30 Sep 2024 16:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKIjAxM7yIGY; Mon, 30 Sep 2024 16:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A5A80D3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A5A80D3E;
	Mon, 30 Sep 2024 16:01:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFE801BF2A1
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 16:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCA6180D3E
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 16:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mg6Xj7_Y12UH for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 16:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13CD980C28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13CD980C28
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13CD980C28
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 16:01:04 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so199620539f.1
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 09:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727712063; x=1728316863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRL4C37cx+JTvII+M/EZ2HD2h9/SY3o/Ar7KwCjKATw=;
 b=gDNZ0oDHmsM0eYEwSB+4e/WvDvLRDkUoC7zNmhryLmp8zFr3VaW5YVhaDtE2BdrGrK
 UNITBYlzR0lNMF8lBezSzuAkytEYraYFwzK2GE76TRrnf4lpTuP5fpdickdFp5BQKbJz
 9Lhd946upsVYfpl2hE3Td5GKeeaiWVxA13HSq51Lkr9wmgc4ga2kRoFtBeG00HM/F5FM
 a/UMnpPwziz3Nb5fzQO4cRbCEgtLd+OBXCdDzTY5v0ZKXFokxcfO76wAm3JXBnEcEIvC
 CI+TpmpIY35/pzczgJIpoQX4QD8sbbC+euI6BRJUxKxkTRvHZfvz3LfRkvwt8GB4SLe/
 4ZVQ==
X-Gm-Message-State: AOJu0YzCVl8ZHZ4CAw1sCAfZaur17aUs4tADkORnr+kw4E16O4V2mVjF
 mW3X4CY+3OZgfZ/FCG4zH0scNWk5Z4d5Lc/eNUmOQ9NIJbNQDcQkMTpoUg==
X-Google-Smtp-Source: AGHT+IFfhDB1wBdjqOyo8BlYWIgPLowKKlsSP7zJBDPz3ySCcD8PdVWE2CluDkdKXD1I/KRKlE3dqg==
X-Received: by 2002:a05:6e02:18ca:b0:3a0:986e:e112 with SMTP id
 e9e14a558f8ab-3a3452d0434mr102321785ab.23.1727712063285; 
 Mon, 30 Sep 2024 09:01:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344d81f22sm25102775ab.19.2024.09.30.09.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 09:01:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 10:00:59 -0600
Message-Id: <20240930160059.204725-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727712063; x=1728316863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zRL4C37cx+JTvII+M/EZ2HD2h9/SY3o/Ar7KwCjKATw=;
 b=hZGb7tHMOHnCKGI+82O3SR7rDNvbCDa/rXsjUq1d+RY5xY/qMt00s5i7xdDzSHXoLA
 3aFzj9LC6CuTk7bo/kePX5znS/gSgN4ZNPVBH90gRxz6kXa1OgvPci8QgzZJQwyZvE+q
 ElnoyCI3bXoZcDVxLKv1UEIEsLjGUq7Koc41AEDYd8SHezU0aHxTY+Rd8NufEv7Kmy1x
 PkUc5iIi/uujMtcbviHDBl+ch3DPERBCp69FsWD6/76/21jY4F1OKMHHvN4hzT85LwP9
 G3mdvthH3UIpNyjQbZrmy+dUyn3M/aJZAxDhYei+R0JjxU3mt4XrLiO7/jSE/UcDE51u
 db3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hZGb7tHM
Subject: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2024.9.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index 1aa959f8b0..e924d12481 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c61ef286962c3bb9c5edb580b89dbf8293083fa09a8f0f59379fe8ec2d04cada  cloudflared-2024.6.1-go2.tar.gz
+sha256  f96b703ea848bc538322eb957749b0b2395e0cf83213cf310cbde0a3f598eac4  cloudflared-2024.9.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index a243686441..68849e9b82 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2024.6.1
+CLOUDFLARED_VERSION = 2024.9.1
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
