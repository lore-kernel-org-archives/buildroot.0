Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91228C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5358E40395;
	Mon,  4 Mar 2024 15:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWT4mGqHtFif; Mon,  4 Mar 2024 15:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19A8C411A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19A8C411A2;
	Mon,  4 Mar 2024 15:54:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2831BF2AF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B256820F6
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g6mMimVC_p6N for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECA5281FFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECA5281FFA
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECA5281FFA
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:54:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33e383546c1so578323f8f.2
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709567669; x=1710172469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WZ8VNql74ro56EpzdYb52Bd7EkWBrfXKH/IlnP4wjjk=;
 b=GHTJuY+OKrpBZpYoxJ9h/v3xuTfcGDhMZxWf4O65DcZkGxfrGDj2tQ9s3qVoFfYVjM
 YG6Q8IRaCuKrocyfuM39SmSU67b2jExpqVj7dg/Svi3HxTkJwgO13Se0ADp7ocKtWhji
 ynMstO0FxwQ3KXbHp60YcgWaMaOkkPp31aoc8vfArb7Bij9S5EuiMDJWJ11vNGiWcxT7
 gnJ77EOdKGYm8WNf0EMdWHBspDcRXHIq0Z98wjIDNrKDLsxGHNrJT1uFWslGDRTA7l48
 xQpuQpJT83xQBdpHlj0JvVqJKvT/UT4I4pch4R/SYBqJeOXh+T/rs+2RhN1tCcEiIdgC
 xtrw==
X-Gm-Message-State: AOJu0YysJPRF9LdZE+1Cgn++w96LsmlydDEAbxV2NeqkVZ7MRsaKG9OD
 kuWzofEfoL5fGOukCU0r/YoujnfOM1AjtZvaXDjm4nPqslyz0ITEBEE7waTC
X-Google-Smtp-Source: AGHT+IExXHGbP/tpy9DV2582sDtYY6cqKkv1HGwl/5Aehf1zZisHgW0V0+F5plab6vGsm6Rqu/YQ3A==
X-Received: by 2002:a5d:591c:0:b0:33d:3f27:6626 with SMTP id
 v28-20020a5d591c000000b0033d3f276626mr6263155wrd.22.1709567669485; 
 Mon, 04 Mar 2024 07:54:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u20-20020adfcb14000000b0033b7ce8b496sm12474721wrh.108.2024.03.04.07.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:54:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:54:26 +0100
Message-ID: <20240304155426.3510178-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709567669; x=1710172469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WZ8VNql74ro56EpzdYb52Bd7EkWBrfXKH/IlnP4wjjk=;
 b=HN3K/ffeCatIfr/0YY6fthBumbstimF7VY4glslnWByavdoT+DLQLovw70aiGXjeF6
 Y3yJvdATtczdAw+DzbzSrwwN+fJ8CmwMT4SMEAJZyJeahIQRmMALSpqQjqda/Rf32rts
 Ehwweq3QUqMN2QQBmAAPp4SDoGC5SJ/Z0H9/FQ1pk/bvgA5EJ4qkvyDTNQ51BSC0ASPX
 h9Etvp7tjWf0ZcQZRpYkd+Jk6Iv7RkjFDxNB4VwkWU0Tm/I/4vtv4z3NsIt1zXdpjLPs
 o2Ib2eC5GKFX9vN0yscvwaKJplz1wee8c+2onMBPDitb9nHj8tJ457gixhJpUcPZAVAm
 PvWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HN3K/ffe
Subject: [Buildroot] [PATCH 1/1] package/tllist: fix build with gcc 4.8
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit 996b786cfc03c3cf2ac631045650545c901e3075:

In file included from ../test.c:7:0:
../test.c: In function 'main':
../tllist.h:213:17: error: 'for' loop initial declarations are only allowed in C99 mode
                 for (int _i = 0; _i < __insize; _i++) {                 \
                 ^

Fixes: 996b786cfc03c3cf2ac631045650545c901e3075
 - http://autobuild.buildroot.org/results/e82fdf4f9ef199e1baa169d38a75872bddd4e6dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tllist/tllist.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tllist/tllist.mk b/package/tllist/tllist.mk
index 88a28d2427..69a34a65ab 100644
--- a/package/tllist/tllist.mk
+++ b/package/tllist/tllist.mk
@@ -12,5 +12,6 @@ TLLIST_LICENSE_FILES = LICENSE
 # header only
 TLLIST_INSTALL_TARGET = NO
 TLLIST_INSTALL_STAGING = YES
+TLLIST_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
