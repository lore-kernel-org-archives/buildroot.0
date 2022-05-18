Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D8CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 21:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 048EA405D7;
	Wed, 18 May 2022 21:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wh53ekAm-JrP; Wed, 18 May 2022 21:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1B3C41052;
	Wed, 18 May 2022 21:30:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA71F1BF380
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B56EC41CD9
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 21:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjPaMfHGndu8 for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 21:30:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD76841CD7
 for <buildroot@buildroot.org>; Wed, 18 May 2022 21:30:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r23so4471733wrr.2
 for <buildroot@buildroot.org>; Wed, 18 May 2022 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSHPvY3Ubsm4eZVKRD/E9rEM4TFD8lMbaBzhO0AJc8I=;
 b=NTf4qEesxI04RFFHVo9tmxfDGCHjEBABoFiclKKXbXtihiMp/qeNMpWpIeUVIpZ2j6
 TaKCHDBSZ5INFoKbXJVYLhXgTyVFTptH0zfs9VzMSRQERo58Izto86UaZ6qXc2tMSgwU
 qrUFl5BNHZnAduM+UxGspsj7lu3U8xtelwBCQp1BEXHqP9mURyB214t8gcteYFupfRkH
 2lj87CgJ6Wa4y3uegC8nvNR66t0HljEmj7afIf2UulGbJc6yEpd6MZWFevvilhJGkdz+
 E8TbuDx32MkCdk8HBp/vveTOuXTDGpZXpijj+h2RCbdZfOb9JXau+MREg3XNNzMDiKOc
 xy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSHPvY3Ubsm4eZVKRD/E9rEM4TFD8lMbaBzhO0AJc8I=;
 b=tOMAzjv0+5VdWsr9XuogZgovYAhZr/IGDVbteaTSePvtutvLumiqjBjCwUShJ/fbXc
 orrjNpozWoz797rh0L5WrtbqkfIku0khu9H0vek95Xmzi/f8EzYa37XR/BhS/dqXSzMS
 TP0Irs/jukh6Vk+U3cVXstPx8wxTXthjKyfDtLYg+IAQFcDR6/itZKmehRqdugwTMGwn
 tK0QFTB6JLQw+/YliYgXCobeenZbDZErTzNzJ+bJO6iZK3FuLam7tC9MmIZladE7u1gC
 iGxnIs89OnRuYFtaRuNkmLRLABQGbW1KDAapzHd/kseDzA1HSeR52ZtXGmHax12eBgL5
 fXEg==
X-Gm-Message-State: AOAM532IvWMQ9yAUVxj3wiKlVYcQJFOnJL6XrY5xitJm4cS6e3ShhvV4
 nI8H7+ivFHWhAIuWB+pyWS59JUkd5Cs=
X-Google-Smtp-Source: ABdhPJy+ZGxSUL5VM6QzlFx3EcekTEO9HOzXBPGcDzMI5oZNSyQbhNOlNlr3qxPDZJYG5ia86fSp7g==
X-Received: by 2002:adf:d1cd:0:b0:20c:51c6:5d9f with SMTP id
 b13-20020adfd1cd000000b0020c51c65d9fmr1340467wrd.244.1652909398606; 
 Wed, 18 May 2022 14:29:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adfc744000000b0020d12992541sm3101584wrh.103.2022.05.18.14.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 14:29:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 23:27:40 +0200
Message-Id: <20220518212740.464658-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4980
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

Fix CVE-2022-1619: Heap-based Buffer Overflow in function
cmdline_erase_chars in GitHub repository vim/vim prior to 8.2.4899. This
vulnerabilities are capable of crashing software, modify memory, and
possible remote execution

Fix CVE-2022-1620: NULL Pointer Dereference in function
vim_regexec_string at regexp.c:2729 in GitHub repository vim/vim prior
to 8.2.4901. NULL Pointer Dereference in function vim_regexec_string at
regexp.c:2729 allows attackers to cause a denial of service (application
crash) via a crafted input.

Fix CVE-2022-1621: Heap buffer overflow in vim_strncpy find_word in
GitHub repository vim/vim prior to 8.2.4919. This vulnerability is
capable of crashing software, Bypass Protection Mechanism, Modify
Memory, and possible remote execution

Fix CVE-2022-1629: Buffer Over-read in function find_next_quote in
GitHub repository vim/vim prior to 8.2.4925. This vulnerabilities are
capable of crashing software, Modify Memory, and possible remote
execution

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 1cd0de9991..9d61d6fc87 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f2755fca3b2f47052166dd601a38411b9adbeca0d43885194db8ada4d1a171a3  vim-8.2.4843.tar.gz
+sha256  5606a3c62dba038f4c4f2eddb305ffccbae58a7bfd569bdb8100f524564c8a32  vim-8.2.4980.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index be96a08d09..9e70360b90 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4843
+VIM_VERSION = 8.2.4980
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
