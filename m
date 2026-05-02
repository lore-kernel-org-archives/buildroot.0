Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4F2CD3427
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 18:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3BCF411F7;
	Sat,  2 May 2026 18:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwIYWTLayWN5; Sat,  2 May 2026 18:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0F03411F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777745176;
	bh=FjUiQdO8VMwL5DLcCut5na/Uxql7d4GZ7tkXiXv9od4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BZs9Sd0whoI7WsBU1p6k/ScP+MHET5+n1IrZBVe1ew1h3b5zg0dNL5H7vKzfH3rLR
	 FZIzD8bZP97mcpyYrpqZeH57sOb2SgPVtTI5eRBzyVdIKzAqY+LehlnibzDMD6SmKI
	 cJzCRWwlhikaRJmfhSEczAfy8TKoOu2vMBypl6uK5NPqi0eqCrcJcFqzV6ga3b0qgk
	 6Oo8uzzc3iAcPVtnLX28yP1y0l3yzZY6lqxHpCHrsFIQXm6o4S9sTmdS4nH1MYuR+R
	 2J+3sDmtWyAoveX9/jw+o5tGmRRo3HS88O3VzECDz2QofNwRity6aqd5mS+ckziWY+
	 lRrxpQdaocIhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F03411F6;
	Sat,  2 May 2026 18:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2AE127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 18:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CC7D6105B
 for <buildroot@buildroot.org>; Sat,  2 May 2026 18:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3qfKCnX_wBd for <buildroot@buildroot.org>;
 Sat,  2 May 2026 18:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 684C061042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 684C061042
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 684C061042
 for <buildroot@buildroot.org>; Sat,  2 May 2026 18:06:14 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-35691a231a7so1901088a91.3
 for <buildroot@buildroot.org>; Sat, 02 May 2026 11:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777745173; x=1778349973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xRviNaiR8xnhnEfgUC8ZY0RS+eG9JbneDWlVxpzAhwo=;
 b=k19u7fi0/PtVry6V3CaHEJvOuDIn+3gT6dP0dRLgLq6G46sasrAl5ry7p+MfLEuZUz
 y/9VxbPRZcZzjHF+ACrD44Y/vwyveLGJHQu5QB9hyj1LzA3L806oBX6A4NtLsWR3CSCM
 f+078WFcEtTh2Oe0L5Q0W55u5TVIsSwW5ANmNy5PiR1CEmCw9LxvcvH0Y1Q3toZXGUDp
 bMjOQki8/fF9WMlC/RTYo/fJ83r+pfiBomgACzJ6ETC4Dl6q/JjvaEW3kefTKk0UE1uR
 7RjPlUzjOeZTArHDAy1DK9NKHmj7nOj01xZUedkE7p8DBKK9NXUDAF49mocI0oM9dcBF
 2Kfg==
X-Gm-Message-State: AOJu0YyMlzEw+5a8dgmiSls78oB886tWp/unsx4X3TNSXPGKulhQcouk
 Dw3MDDSv5WswRq2Hx82Bc2lAwXjqqksQUKV2T8NV9zDZHTy3bf31ee/7To1R/p/4
X-Gm-Gg: AeBDietUR0RQtR/mTEMgJeApaLBdtj3/d/EDok0vVSIbwD1c2yBn7URJyFBwqNZZjdS
 3r04CUsKaUiqxAABcASI0PTZIXNAGvXilO//R+pmEBpUa3qNQwqLbx2NEzID147cvB21HmJtFT5
 W9FDyKW1wd6PlahMbN+/C9HeRj6OlvoI87J8tU9fhDM6KKM/LF9j+b1BB19ok80giVgdCdikz7a
 j0BWuFXSNjjPu40PvprzV00nVfV2wOfYO0r7MTdhpEEKctrhQ65j9cPYAJLALQ23HmclI/bqMLd
 J/FHaCSp6fMSBPuR4KaRnhrHDTqL7iZcfR6XxEm0lDA8e+Yq4Pxxa6yQf0w1tvYgGWSxq+icm8e
 3PdLY8Z9v9/10Yscw8N2WtzljLpW7O/23+MrMLEGcbxQuvamR88Au4+3/+SAntK+EMtPUUE2bpc
 LXJtSvdJ42eGOqFNuodY/uRL60Nk4O0axH+hSzT+m42MhhShifn2QMzw==
X-Received: by 2002:a17:903:946:b0:2ad:d0ff:2ed4 with SMTP id
 d9443c01a7336-2b9f252f4b6mr40429105ad.6.1777745173087; 
 Sat, 02 May 2026 11:06:13 -0700 (PDT)
Received: from fedora ([47.31.93.144]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b9cae4b0d5sm58643935ad.68.2026.05.02.11.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2026 11:06:12 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat,  2 May 2026 23:35:54 +0530
Message-ID: <20260502180555.2769589-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777745173; x=1778349973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xRviNaiR8xnhnEfgUC8ZY0RS+eG9JbneDWlVxpzAhwo=;
 b=RAPkK3dwtiQoFcYJomunAaSE14nCkDYBiq7dIqTB7qem78oKesbp2K7KECaHyYojNK
 huA7jf+9liTIRUuFcgljr92ehhYGC/IlYHxb9x0NIhcAXSZu0D8adqkdkapwdAVpKFWs
 sEGxcUfqJ3v4yn0XcotTY162auCMSybOT/OFxiCAqmRYBH8cHbhl//85450HdX4Gs4Xc
 3fJ8M5JHUbloIgadoTQR1nuwtUqQE878B3alFrSxE+/0r/mWuN81WgwPxLnpnNiDksuc
 Kt7xZ8uH1B4nIPo0IzpZKH2d+kuHn0UgHxgcbOXRt/kr83ubfcBKkbTSG4hj3aV6fpGU
 36vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RAPkK3dw
Subject: [Buildroot] [PATCH] package/unrar: bump to version 7.2.6
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

- Performance improvements for solid RAR archives
- Enhanced TAR extraction speed
- New archive naming and date handling features
- Various bug fixes and improvements

https://www.rarlab.com/rar_add.htm

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index c9a5f521a4..65dcab4464 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a008b5f949bca9bb4ffa1bebbfc8b3c14b89df10a10354809b845232d5f582e5  unrarsrc-6.2.12.tar.gz
+sha256  d1afa67ef4121ebc5986815699e05db0ce8648499e5dca854f282a4c3f72c003  unrarsrc-7.2.6.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 0a61bcfcba..c829a2ebbb 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 6.2.12
+UNRAR_VERSION = 7.2.6
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
