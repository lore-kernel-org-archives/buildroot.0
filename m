Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3964C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB3840558;
	Tue,  4 Jan 2022 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeXSYGlSnPlG; Tue,  4 Jan 2022 18:26:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 856F4404D4;
	Tue,  4 Jan 2022 18:26:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3791BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78E1381D4F
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KA3bl1s8LgBt for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:26:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598A181BF5
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:26:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j18so77892260wrd.2
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WBy8i1Ptx1QvE7IAO5it0MUXq1HfGCtrWKUdEjJaoM=;
 b=YnkKg6j1fp1UqtNKuM+HKZyD2bzUlOEJSDJuFuSVd8V0Ul+zwdDQXJZ/CQvIXeKBfG
 6RvYV07ZBx28C4PqgvuwTLG/BXeEqwHVwK/f4eZkU0s/SD5t3prodaRFKP4+TMAKdkSi
 N6sUp6GV/sYJs/aZcy3oJmTwTzh/8XDUzJyaPk7KNnmYU/0UkH911PM73YRrgfZBK879
 RPwvZODhkKp8WGpB7v8IIBR8a3Pah2R2AwfpkFBHAyT020d0fdQuKmxXR3USR1rsDtz3
 HfwcjuW7LToiCyINMSqKCWKu5Z5i6WzjXO1O4swosnM6LBCXAPngrxowY8OzaCv8b/Cr
 48tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WBy8i1Ptx1QvE7IAO5it0MUXq1HfGCtrWKUdEjJaoM=;
 b=upf8lG9cGKTmX2d+FS3kGcaAlZEQMTVmHXtW1iicPBlURuvKO9LWy2eqBtKk3VPNFv
 r3cDN3JA69S+o7RE2WGKIhqB8U720K0lIzR2yONWQqqVua6L6Z5vo2Siqy2soTQRoAkD
 z/ALA5jwoF4wfd89AHRZl12gJdjyiJ8Lwtw1oie8PcVLo1n1Mi3UrrMup4bzwnW8xAhH
 9yemqG9xy1OC46imONIIByfqOwxYIaZvJVqjXNsPQycKu2vakTm5+BWuCu0AdfnhXVPS
 v5LgT0NJt9tyjnbBQlR+pJarUTRznYO7PgO+fPtTdCbUm/VnwC1vSkPJxArjFtQZCrkf
 cAVw==
X-Gm-Message-State: AOAM531vIxFM0Tpp97OWrWCd3RqrWJjK+ipZjn6eZ7ffnaEFyirVjbbH
 VAGtNDe+iPUy4ojjgSPZinyxhrvpSBE=
X-Google-Smtp-Source: ABdhPJya3idsmA8ZUFUN0knssyFm8FtGFuZQ3kMUlnCem5K/LHwXq6ntT6xGLo12c7+4/BHvDTQjiA==
X-Received: by 2002:a5d:5004:: with SMTP id e4mr10397100wrt.107.1641320763568; 
 Tue, 04 Jan 2022 10:26:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l16sm43825408wrx.117.2022.01.04.10.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:26:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 19:25:08 +0100
Message-Id: <20220104182508.3375382-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.1.5
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

Mutt 2.1.5 was released on December 30, 2021. This is a bug-fix release,
fixing two SMTP authentication issues, a crash bug on NetBSD, and a
couple other issues.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-1-5-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index dceae57b65..d439b23aa3 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3361b682ea23df88961fa9835196698aefd2ebf0aba494599b29d1c4b1b4db79  mutt-2.1.4.tar.gz
+sha256  92a309e47e363a97d62425bcb71adceae5ab5c4c413dbcac37fa98ed70c12be0  mutt-2.1.5.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 44d7864eb6..7e9046fe8a 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.1.4
+MUTT_VERSION = 2.1.5
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
