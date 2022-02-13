Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B009AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 20:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FDDD80D8C;
	Sun, 13 Feb 2022 20:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5zob51XMwdJ; Sun, 13 Feb 2022 20:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670D380C21;
	Sun, 13 Feb 2022 20:23:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2F831BF83E
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFF36400F5
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-aICBiuMF0G for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 20:23:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5428F400AF
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:23:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso6051564wmq.4
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LkyQDi0BFohGdcjoPYeNxN4hfeRq0xjie2a5nL4abi0=;
 b=Nwaipvyxiwdmitbt7jpKo9RxgzYFqOb6jiJStWwQIOsf7q+E98VvUVfxM6Jf5ddWn+
 W/Jtu57V+QEoe1do7PkyXaqszp//pdmiq03aQhf9S+2XR+/+pdJP6AgF24P6hLNuzYrS
 C7wQBYroSH/VnHk1v4Z+Ur3qxg9ZF3suQZ3iA+iijGEZlGZ8rrX5wjxep4YdEycsa1Pa
 oRK1ms1AYrr6ZnyszXnJbXUAme480aTsY1iR8swiPpnM40qiTx/fRFzpP8cTeBTCn/H5
 RN0SDuDADVD4A7XCdgOFqDrqGEXNfuZ971LF2TPvMVOfacA0jUF4gAZbOwiTFLUpWOoj
 2LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LkyQDi0BFohGdcjoPYeNxN4hfeRq0xjie2a5nL4abi0=;
 b=i4BoB6cJV6ETsad+BvVLCEwOKHCjJGWAz6CBWsu77aeUz+xQB/XjUk6rvhR0Y6tZSc
 i/Xd7JWYML3t8STcPM9VkaLyClC4rYMfLU93nfnUEG4b3VbH0pjMOe4f6jBUKUkFQfSl
 66ZL/att758CiZ93PomS46O1aEJRzY/DPPF+l5wAfvKkXukBur6GDlnkmgIfKmXzu+NB
 GWcg0/NML37Y2Hgoag6xobVWJhwbQf5K2sYgozAgsV11lrDjiMA8PhrPSpzur6L/XEcx
 WwYVUsc7dO0g7NwaKqEoAZwu3kDDPbwlGFBKmE2axSBGtCvInpHm7BQgGFXP9tSS176w
 6wNg==
X-Gm-Message-State: AOAM533kmHrYXHldxx48xEu9au1MwfgYz63FnHdlo0ngI4RQfjBnrqc0
 WZGofScCX5NNvCtrkLW69FUcuXOswl8=
X-Google-Smtp-Source: ABdhPJx7I5SOtYoFpNJ3kRzDFmKBYvDDq/YAAvRZ7yuDKeBSgZeYeYChfGhYs1RBE/1ai2rBqdFxTQ==
X-Received: by 2002:a05:600c:4a17:: with SMTP id
 c23mr8485322wmp.27.1644783828225; 
 Sun, 13 Feb 2022 12:23:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id bg26sm10664598wmb.48.2022.02.13.12.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 12:23:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 21:24:07 +0100
Message-Id: <20220213202407.1205912-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to version
 10.3.34
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-46665, CVE-2021-46664, CVE-2021-46661, CVE-2021-46668,
CVE-2021-46663, CVE-2022-24052, CVE-2022-24051, CVE-2022-24050,
CVE-2022-24048, CVE-2021-46659, CVE-2021-35604, CVE-2021-46667,
CVE-2021-46662, CVE-2021-2372, CVE-2021-2389 and CVE-2021-46658

Update hash of README.md (changes not related to license:
https://github.com/MariaDB/server/commit/773a07b65517327add6348c045cee14bdf489fe0)

https://mariadb.com/kb/en/mariadb-10334-release-notes/
https://mariadb.com/kb/en/mariadb-10333-release-notes/
https://mariadb.com/kb/en/mariadb-10332-release-notes/
https://mariadb.com/kb/en/mariadb-10331-release-notes/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/mariadb.hash | 7 +++----
 package/mariadb/mariadb.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 4025be317f..4da26bdf94 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,7 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.3.30
-sha256  bd8735c65bdb7ebcd5d779fb9d3de3f2fcd319ad6482278d73dfe7301ad4ae1b  mariadb-10.3.30.tar.gz
-sha512  742c30b3ebc0b6d36b98d4e7a7fb511098142e72d8f42cbfa73a0bdea2059be17e790fbda4732329bbd99e4b50b13cf18e8122964a473e0b62170ab869eca8fc  mariadb-10.3.30.tar.gz
+# From https://dlm.mariadb.com/2117287/MariaDB/mariadb-10.3.34/source/sha512sums.txt
+sha512  46d4575ec1afb68510652a4bb31ca5ce83a2f5f61048a6e9c1487b0ba58f079465a8b72518d44043cd42c631b19ff50b5498584676ac6473705b138fe3300741  mariadb-10.3.34.tar.gz
 
 # Hash for license files
-sha256  a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
+sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
 sha256  240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index db967ca3ed..4eb9c71827 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.30
-MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
+MARIADB_VERSION = 10.3.34
+MARIADB_SITE = https://dlm.mariadb.com/2117285/MariaDB/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
 # https://jira.mariadb.org/browse/MDEV-12297
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
