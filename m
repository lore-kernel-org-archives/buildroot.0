Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9312CAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 16:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 893D860BCA;
	Sun, 21 Sep 2025 16:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rhsk5Z6bkEf3; Sun, 21 Sep 2025 16:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05F260B9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C05F260B9F;
	Sun, 21 Sep 2025 16:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4536ED3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 374D240140
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzmbnvZCIaLP for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 16:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E72140071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E72140071
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E72140071
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:02:10 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b5516ee0b0bso1749272a12.1
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 09:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758470529; x=1759075329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CH8e7YsuF4HeXAyqxVHlXYDh2i+WlLncJrNjf8In3+Q=;
 b=DfF/1PghUtKyPLRAoheNmVAJ/rSKbfADG3jU2rDmuUpzCXznvasFT0DSgkoWoVpD2F
 hxT81ukcVdLZqAUjl5dwR+end6Edk3dDnje4X3uudVV/8Ove5TOKVHVX5olqVwpDmjEo
 82Tu2+WxdQNs/PiJIMshKXDuRXESqk1rbn+6csEuNvp55UKH9jkRkzUZeTXtQbnmx0YR
 b61hj7mRHUO5Suu/qo2oDe29/78PQEAib1/nWN0QrBhe8LR17wAnvb62OvSGxgkuhRL5
 iAJbDxe3zAwnVanOH/E2jEd8FCh+E6jG72TbjbBAJK5SoCD1+nsHcR+88nO98yCwScyL
 vtnA==
X-Gm-Message-State: AOJu0Yz2BhRL4PB9e9nHFHJx8CLKOYihmn0eAQoB0OkT9n1Prao0BePt
 cWPs7anweMksxEjU5FD7Bd6Ka0XP6FlKJVSMpYbudCzbukYJyTNgai1YWGwFeg==
X-Gm-Gg: ASbGncsBH3197w0ZiobA/tRp7LyfJlKx+jOIgXzIFWx0DSSgX5cBcl3qvOZqAESzPtM
 RtYklQiZbPHMvp54tczt1XD+Q+Wu3qTm9An1ehOWqlSaQpYzMJAwMfC8HtAt1mhbesFFS0uSg76
 sTUoHcPK4nbFhpkYmmgSR9BuMpqpCKdlG5GMAm2lLNfiR73wol0i6uqGAFeBtsLQb0UwrYoScIR
 y9Us9cAoa+Z5cZNS2VeJ+lkB+G9x1NpcpNAPUTRkF8pnubBbQmcwLmw44qHtHn2NIao4ZWFeibK
 RMZHpgzR5PWfVrn//UtoVZ5kZ95LWMliFlqpb/t+k21Or6SKaxofBQq/D49HQpbsXRrcPHgAdDo
 Mjt4+DS7CT38gHA58gRk=
X-Google-Smtp-Source: AGHT+IFIgJ8pH61ptRCR9PUZFWq8PU6kUVzSfN8aVoIAc8D2BLulLQkQ3O/wBG2tWRU+zoRAteB0ww==
X-Received: by 2002:a17:903:2ace:b0:26c:bcb5:1573 with SMTP id
 d9443c01a7336-26cbcb51803mr82969425ad.53.1758470529317; 
 Sun, 21 Sep 2025 09:02:09 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802fe08bsm108440555ad.103.2025.09.21.09.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 09:02:08 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Mon, 22 Sep 2025 00:01:57 +0800
Message-ID: <20250921160158.8190-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758470529; x=1759075329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CH8e7YsuF4HeXAyqxVHlXYDh2i+WlLncJrNjf8In3+Q=;
 b=J0TDdS1TjDSloUGR8xKhD3FsJ7cBjKwj5uUX+L2agNkUdydMa2QdAQ5jfjuGWRLfxD
 B/gYKOQDgBpwz8t9vQIoRRllIPjncsJSfcg+qbyGnlY8oaqkyHnD/x28/h0Ex4HR9OT1
 W9xO/CkO2u2nO1sbch9B4FKyTeCKbscjUkrT5rYBEwLOXNrFiHOmBN4qZnAE1KBYoo4A
 C6hMT63ooVNHPMFVZ2tayGWgHszBsL+szn2fdPnWkv3OKtqPS9Y7eQ8VotGCBpuIENA/
 Kzic8uRntbU28DKi61ElLIq8iIga2m2XxQM5MLstShnqaF3Oew4jKGBcLqwZpVPlHQ0B
 LAGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J0TDdS1T
Subject: [Buildroot] [PATCH] board/loongarch64-efi: fix typo in grub config
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/loongarch64-efi/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/loongarch64-efi/grub.cfg b/board/loongarch64-efi/grub.cfg
index 2006f6d60d..c84a7f646b 100644
--- a/board/loongarch64-efi/grub.cfg
+++ b/board/loongarch64-efi/grub.cfg
@@ -1,4 +1,4 @@
-/set default="0"
+set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
