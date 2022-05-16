Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBB6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019E241861;
	Mon, 16 May 2022 13:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCQAYGIluO7L; Mon, 16 May 2022 13:16:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C067741847;
	Mon, 16 May 2022 13:16:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 602171BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D7EE82C9C
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64Ez8gTxBUYY for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83BDD82C8E
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u3so20507930wrg.3
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67Ez8TZPnvD0ZjKP6DuJllUHVp1oHjwx3WYJEfIn8cs=;
 b=YKgGmLeiv41QvqDiLsERujp8GnDUVfBEPaqzAN9esz6UDr3YYbXOpJlQo84sPW+YL9
 VpGzbHwkAQqDSXvQIdQjYljU9cAxk+jNgIKQJnYN6dqh+Mvv2ZmD/5ONcGmxnC8Bhvx/
 1gzmloI94ZGQOPKKiVwdzUSK0ifn1VXoLzNhaQAONzaVof6S1pY46YoOmKKMvOpricpT
 LpuWf+vK5yMwNciBI9hEyCtTg+xy7jzHzZexv03Ho17nZ6oem94EjkEfkiPW1V3jX6rF
 4xr88kJ53rXC1+se9tmFDYgqERidhD0T8/IxR8lqxhCiKl/8sT6ZA242bsoUI2E9GxwI
 sLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67Ez8TZPnvD0ZjKP6DuJllUHVp1oHjwx3WYJEfIn8cs=;
 b=6Oex4GT2vNCCg7GhuORDWu+F6jcnLdN3IHonKp1YlB8wcL2ZeCY3bYUZvgwnJWcUYg
 QDvCgcmrxYelWple6aQ3/fKNGCyY9hBq2lu8w2hXGK270U9zC8biQOFjinjPyngz4GzY
 sfVBEEnkmTrC2tPi3CyH3fNiAmll8ODe2s5uWyLHrITBanon3zejd5+kykzIhdk1VP2B
 xqyKBTRP2P3fIBQKrj4gaR2Ne0EXEsVKAxvMLmF+x9RFy6Q8A94Tut5GGFXQiGA5s/lH
 uiGk0aKiW9Jj9Dec7+GrD4P1vHPpOfYvcIcSeY83aEM9V9q9SJEYQ/xiuvJg5zFVsi1r
 +Rkw==
X-Gm-Message-State: AOAM532mawMSviQ/o9kCNPuBHLWwQqAfp/7SL7+l8UAzSHSBSQ3kZk+K
 6/4V622vF75d68BFDaOShp1oGx3fDug=
X-Google-Smtp-Source: ABdhPJyPAfgIpny8UMX3hTZaH2DiQNCE0TYySaQ+0jT/85bCzcInk2Pix4g2wzPTqcjDT0MPGkYI5w==
X-Received: by 2002:a05:6000:1ac7:b0:20c:6c81:c8e5 with SMTP id
 i7-20020a0560001ac700b0020c6c81c8e5mr14681372wry.580.1652706842603; 
 Mon, 16 May 2022 06:14:02 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:02 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:24 +0200
Message-Id: <20220516131334.1910858-11-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 10/20] package/erlang-p1-yconf: bump version to
 1.0.12
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
 package/erlang-p1-yconf/erlang-p1-yconf.hash | 2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.hash b/package/erlang-p1-yconf/erlang-p1-yconf.hash
index 97e71f85cd..990f08dce9 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.hash
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ab0f7462b8d03d18be1587fa9cfb227923055f765fca4459b4bb42ccef971329  erlang-p1-yconf-1.0.8.tar.gz
+sha256  e88f74c3950630e0ca7be41cbe2332d3ca600241f37779a862bdcc46f9031877  erlang-p1-yconf-1.0.12.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
index 3e3a10ae15..682ca08ff2 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.mk
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YCONF_VERSION = 1.0.8
+ERLANG_P1_YCONF_VERSION = 1.0.12
 ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
 ERLANG_P1_YCONF_LICENSE = Apache-2.0
 ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
