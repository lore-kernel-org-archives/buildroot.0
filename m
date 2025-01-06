Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA4E77197
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 00:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D27C80844;
	Mon,  6 Jan 2025 00:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-JwFuLF1Z1B; Mon,  6 Jan 2025 00:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2007A80585
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2007A80585;
	Mon,  6 Jan 2025 00:42:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id E1B60DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 00:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id BBCD940151
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 00:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id wnuX8-GeKBuD for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 00:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.173;
 helo=out203-205-221-173.mail.qq.com; envelope-from=donnel.lu@foxmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 867644013D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 867644013D
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com
 [203.205.221.173])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 867644013D
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 00:42:45 +0000 (UTC)
Received: from donnel-virtual-machine.localdomain ([223.104.84.44])
 by newxmesmtplogicsvrszgpua5-1.qq.com (NewEsmtp) with SMTP
 id AA08665A; Mon, 06 Jan 2025 08:42:32 +0800
X-QQ-mid: xmsmtpt1736124152tyx51ke6d
Message-ID: <tencent_9DBF881A0039B98D83D619FB287E59E9AA08@qq.com>
X-QQ-XMAILINFO: NXjl/MXsth6WJbKsFLv3yihxOILc+rghNgzm8sROGIBfTP1fdMpLDy/V5k9SB2
 wmeTlz02v2jAEwyBXyjXAbe3EpsjpFgoFrp7jtXzDNDcNGDypoNacsOWxdn0TP/SjpDeQGF05GFE
 lqJg385nMdw4w446eIAwj8Gikfi2iPpZEtKsn/ZzMgJWEUEzCMd4MfyOne+iHQxnDwlTrSoSRZnf
 jgI7Go593b8CKfuJWUjcVnsII5zXARdHtlmoo0y++RHbvccICZElagTCUgw/gH4QynxNqoD85xbA
 FZnhLlKp1Q985R1YZDMRvJyTqIQR5mUgj6z02FTH0pbjIkw3tOY5LM5SuvNFzqOt6PgGv88xUpLb
 kz3uMqJtJYpTWZZ9pDIVInCXAVW968cdne5sO8rPvdGaeMUpHVsHbKizWc9qMNgWQz7pv4PFCd2F
 l3VRA52JlLR7C8pV8pBuZr8v+RRaHYgUQLK7gRC4qWS3RzeDXgt0tgl8/TXjW2CZGb1zKUyp/wD5
 92wto9PEL0FQ2OPax1jVgRyW8b9WXGs7ZvPReJqokyAxyxBui7zHkEjMHM/RYqaIQozAeIgs/sot
 kuz7K6LvHjn2YHkUYpCgyb0gFhYbhn/lqRmUqHve/96JhsoBfq05xVDwS4fR9DV5AQBZZgKChK2G
 Ml/cU2TJOvynZ2A21qq8G+ZO9STSqXcaUCPN0VK2SG/sd7lzT+AvrqjgM39re/9ws1p/Kzj3kKek
 SyteqZdrjC1DdzpXOdNNgPVQ67v9vY9UqJViOxXTGRoY3NltIO5a1nLIB7gClSAmFktKlwSx/+Z4
 epzYiZN+O1PrJd3nyuFGzLVrSoDw3Kj66q3fftRa1Zr2q4Eac53bVG+Ji4yjdDmuke7JzftrX+3T
 ER5H1dCw5I10qfkM20B/E6wpE1M9ywSyL6xQnhSxwJP/XAa18UEHLoG56GV5Y39Iw4RYr1KK/alP
 R163/DZW1B5kC4hESi+m6oegfjO6w7
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: donnel <donnel.lu@foxmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jan 2025 08:42:30 +0800
X-OQ-MSGID: <20250106004230.2752-1-donnel.lu@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1736124154;
 bh=jersf57orUmQ+C5m5CqEmrIDq9GdrWG/YFYmpmnpkNI=;
 h=From:To:Cc:Subject:Date;
 b=dADTrlw5s9gJHnBl9xhMH8wfiVG2FXCUO40aciDJkZ2gzKSqnDKYLS4l7in5A6a5s
 iFrO5uBqGAUSn35oYdn7IXUeQPFbtxZlm9Uub6rVq3/LxrLkjLk3iELg+eVKhN4IZW
 8berEaQesm+3ic816MLK2O/HtHy/F2PvJtkEwLGs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=dADTrlw5
Subject: [Buildroot] [PATCH 1/1] package/zlog: bump to version 1.2.18
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
Cc: donnel <donnel.lu@foxmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This update brings zlog to the latest upstream release, 1.2.18, which includes several bug fixes and improvements. All existing patches have been reviewed for relevance to this new version. Patches that are no longer applicable have been removed, and necessary changes have been made to ensure compatibility with the updated library.

Signed-off-by: donnel <donnel.lu@foxmail.com>
---
 package/zlog/zlog.hash | 2 +-
 package/zlog/zlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index 19881183e9..f000b08f37 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7fe412130abbb75a0779df89ae407db5d8f594435cc4ff6b068d924e13fd5c68  zlog-1.2.17.tar.gz
+sha256  3977dc8ea0069139816ec4025b320d9a7fc2035398775ea91429e83cb0d1ce4e  zlog-1.2.18.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index e5bbf6ff3b..0d56471559 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.17
+ZLOG_VERSION = 1.2.18
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = Apache-2.0
 ZLOG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
