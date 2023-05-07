Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F764C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 13:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B5A940BCB;
	Sun,  7 May 2023 13:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B5A940BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCQJddk2x6ud; Sun,  7 May 2023 13:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 748EF409F8;
	Sun,  7 May 2023 13:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 748EF409F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86E321BF2F9
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5641040922
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5641040922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8T4Sr-7qyZk for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 13:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9BC54087E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9BC54087E
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:32:37 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d4so10250735e9.1
 for <buildroot@buildroot.org>; Sun, 07 May 2023 06:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683466356; x=1686058356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KsyFXAg2+dVV1NaQm0Oe+aQmmuHtk0S1qyDCYCSAOzA=;
 b=QRF5AzKsDevUs6TgxVzYq3bePwoyYn+j5a9eazUE2xGRY1FQAIXgmvG8W/vWbB0fsT
 wPKm+gbZI8rGhLBRL5v4ALr8r/L5cc9TBTyQLnC+MBKgm2usBuiAkPsrK5SEsvvI1QNP
 m+faSJKzDZIg1WMpBKOntPBamPw/dW0vA5cZm8EW45q4F6uKchicZy9T3cKyQuIRIhDo
 XaDepATwM0OlJD0ExeRDvPzLJzQ0HnSqaGAOjwoay73lygChfH4WBg/a25JVpSfMJ9bs
 VmaXCKsB3b/4+zhCgT042kNWgjaAA6IQNMI+OKK2qJq4n2habiF0dgtWtVWiL+utgMvi
 U5tg==
X-Gm-Message-State: AC+VfDzO+UDlrYkLjb1F+t3Jvig745cWsLqZNpAR00uyb/7+LFEatAFE
 TJnqaAz7dwBkWyvTQwI9Xa2xQu+iRPo=
X-Google-Smtp-Source: ACHHUZ48vvNpYYM2zYImpmZNRtzPOBVX0Fc2jUAxFpMZN08ykgQR6kl4v3G3zGnB8JfLR5m0zzMrGg==
X-Received: by 2002:a05:600c:ad8:b0:3f0:a06a:7593 with SMTP id
 c24-20020a05600c0ad800b003f0a06a7593mr5239649wmr.11.1683466355970; 
 Sun, 07 May 2023 06:32:35 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d67d0000000b002fae7408544sm8259313wrw.108.2023.05.07.06.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 06:32:35 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 15:32:35 +0200
Message-Id: <20230507133235.584153-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683466356; x=1686058356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=KsyFXAg2+dVV1NaQm0Oe+aQmmuHtk0S1qyDCYCSAOzA=;
 b=ZhkeWOkvGOWFMc7nQEtlRrWhIwIGkaSfeC5rJyvDttFF1H+7FE6pKjY6jel5PbsyXL
 rC6QUi3/J9fiJchiuepI+5hE/3qX/MQNldeW6GC1tFhRzw2PXX1vcIt2z/ASP/LylZDv
 mA24TRXsZKsZGRjfHTI1hZuHqZAskUymI2nEkiF8if76dByQo3IJHVHc77ugtaNOBMpR
 PKIL+jjwPn0fPTg48L7LR2+z9TAjEHxGvyLMT6AlR4CJlq4qLC0YbqO8k/oJDaBme2Gd
 1NbPKO7W2KzBQT20xLhuNAvSwV+v5MYrIJ9xfmT6yNLW64mYg8JEopuO8ZZOwb6BOYwZ
 IQuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZhkeWOkv
Subject: [Buildroot] [PATCH 2022.02.x] package/postgresql: fix licensing hash
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 7d8b699c292d (package/postgresql: security bump to version 14.7)
forgot to update the hash for the liense file COPYRIGHT, which had an
update in copyright years.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 83b27a5fc0..acce26e8ae 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
 # From https://ftp.postgresql.org/pub/source/v14.7/postgresql-14.7.tar.bz2.sha256
 sha256  cef60f0098fa8101c1546f4254e45b722af5431337945b37af207007630db331  postgresql-14.7.tar.bz2
 # License file, Locally calculated
-sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
+sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
