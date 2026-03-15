Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F40D58B0F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 06:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86DE6412E2;
	Sun, 15 Mar 2026 06:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL5L9HEMgFVG; Sun, 15 Mar 2026 06:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1BCD412AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773557050;
	bh=ML2tgoDQBnr9pfcIaxihleesSBfV+9+Po4azHOET2oE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GPnue+zgmisX6jOTKFY5Fvp4g//usMYsVb24mZEi6DgPp0Ods1DloaA9B4ex+v71o
	 3SMwtOXPkGLzpFSqUaJwK0XRG0YJDlxcRYMghjgYKwBloTurIkPhgdvmiieUeZVhvo
	 X9TN2FlCFb9bVLD9sADLO9MzlLAV+nMB96hfV9w7JXu0T0pQCE7XKRg/6ztyuzs+z0
	 qpSuC0cJjxIQ0dWqZ16QjzIPtNdswDncy+qJdVfqMOC2v8QVu0L2POamaV2jiHvmN4
	 Gy+PBELWvRtcZe/Q+UzCFjNafGJ5TiK3ELHSExZ866lvDBCZpD0WJvAjJqR6FedY5K
	 W9fyZbCtK8L6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1BCD412AE;
	Sun, 15 Mar 2026 06:44:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD8C71B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 06:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A349960FC0
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 06:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOb_Bq4iqkow for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 06:44:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CFCD608F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CFCD608F0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CFCD608F0
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 06:44:07 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-35b85613f3fso971837a91.1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773557046; x=1774161846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OF3+OaEFhiPGY8kJ26XnjEVmak69ENN2fi/NFIvWA7Q=;
 b=FZA0ZKa3Cfb6umJwH3CUtYKtlm2UQOYipjFYEZdEhYyHUJxEqIXMxyI1q5ndGSuP46
 qMJDNPjlSsSgZyCoRB0KS2S9tNieDNyQVIcC3UesMhp0kTMiH/xpmzOr5AT4BdiILDXs
 g6m1YSfzGNUnrdpzyuyuGxdZbaCmGxl+TbAixC+Aowxgwq3djIOa4fd0lEm46PK1q0X2
 6egXwfwMABDD9PfuEIQ6Eucr8Eq5GOKT9NCek47MNYBQLWpa5/qiJSUnSTH57HBaPfWI
 UOIcnYutzt4dRjikr9T0moVkzoQ0Rp30LbRDZlyr5j6Vkqdydfwc/Jf6P5c5517/R5wi
 F+tQ==
X-Gm-Message-State: AOJu0YwrnM4SfYyg6yfZjHLTWiNsXqYi/H3ngSyKaAPZCFeZ5lqyW9BR
 V61b/1vVgiqsh2pPRnaG6T0PFD4b3EvsGHeukurZJbbuVqqP+CNbRPpzOPqNKg==
X-Gm-Gg: ATEYQzwDQbk5xa0LOV78JC2h5yclUzmc/ExJAgiX4TKlpP7AUtf6uk1ioqV+S6Jz0nc
 69Rj+E2KPlESJWSkJjoHqZRJkyOgySCepu+p+LYUflegDXKb/MvP0C97mlU9FY3Syas47oTwIpt
 /m9ZetkdvEiTFm5xHsHMN4tlP+nN89WdTbKF+MYTHYU6lsN4ueK11Kemj4PlLNckd5UFb1kqlKd
 0Ar65qxcAoXNhT+luZQfmzgNNc+p4mNTHGQ0JcU1Gn1I1oVcnyD9fB7Wg2YhHnmbizhYXhK5c0e
 4Azkj/razOSPV9wnmg2OebQF5paPKu9kRAnFhQrjkCReaG0F/erH0D76RXOg1kuCb8U9lyXf0Te
 llW18BHTHnNBn8sbZ9BE5WMFlHAYj951NczgEXf/QxiUPdUSqkIiWWvIe4GCSaW2q4TMMxaJjwT
 NQN+aSmNJWYT3xiPfNOssqvjq+k0lQfdYa9+g=
X-Received: by 2002:a17:90b:2689:b0:34c:99d6:175d with SMTP id
 98e67ed59e1d1-35a21e30c0emr8059915a91.2.1773557046177; 
 Sat, 14 Mar 2026 23:44:06 -0700 (PDT)
Received: from fedora ([2409:4064:e94:4c4c:eaf4:8a92:f628:ad1d])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35a17be605asm11619598a91.17.2026.03.14.23.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 23:44:05 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 15 Mar 2026 12:13:48 +0530
Message-ID: <20260315064349.10601-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773557046; x=1774161846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OF3+OaEFhiPGY8kJ26XnjEVmak69ENN2fi/NFIvWA7Q=;
 b=QOcW/EF/06BIlVro7t6GQ6iqo+9WZ8bEmGZtoL2mQEjQBvyOFiJNBSDo3F/LHKLJLx
 grybWWZsN89phUDBXhgsUZEofflzxUk4QGGEq6N+aKLnDl3ckyfGtE3lkdrfj1awbern
 NhiexFJAb1ssUmpNsdSPIAVXLr0x36x8P8FHiPnN5SCsmkTyyI+mJNlSSQw8Rr/82Ium
 UP9IB3b5nL5s/5BwBUrXhV2xJR1gTXSdwel0huFugsXGbj9zOXU/FZtkVUmQHTZpRFNW
 ZYUQwQOlf87t++CouZFRynGmtXDQvjyOYuDi3EvBToeK4XpkvvDlgx14hD0RAOSkA0G+
 6Iag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QOcW/EF/
Subject: [Buildroot] [PATCH] ulogd: Bumped version to 4.0.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/ulogd/ulogd.hash | 4 ++--
 package/ulogd/ulogd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ulogd/ulogd.hash b/package/ulogd/ulogd.hash
index 8d729aeb8a..7a0a1f3f6a 100644
--- a/package/ulogd/ulogd.hash
+++ b/package/ulogd/ulogd.hash
@@ -1,5 +1,5 @@
-# From https://www.netfilter.org/projects/ulogd/files/ulogd-2.0.8.tar.bz2.sha256sum
-sha256  4ead6c3970c3f57fa1e89fe2d7cc483ba6fe2bd1b08701521e0b3afd667df291  ulogd-2.0.8.tar.bz2
+# From https://www.netfilter.org/projects/ulogd/files/ulogd-2.0.9.tar.xz.sha256sum
+sha256  523a651fe0a9f25b0cd87d5d35fc37d9382e7eecfcf61e48d5505ff3cf80eda5  ulogd-2.0.9.tar.xz
 
 # Locally calculated
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 8ef8ec5701..be460a6947 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ULOGD_VERSION = 2.0.8
-ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
+ULOGD_VERSION = 2.0.9
+ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.xz
 ULOGD_SITE = https://www.netfilter.org/projects/ulogd/files
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
