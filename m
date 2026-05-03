Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D6BFF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 19:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C7F461276;
	Sun,  3 May 2026 19:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T039z7_W5d7u; Sun,  3 May 2026 19:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE39A60F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777834986;
	bh=9Z1o9khG5TivrlEHsoCWdbtP/bqJeQ82GCr40GWGhNY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OWO5Z67aAXJdCDTQIqPUjYefqdzoSm8fAW5UAhGT2/5uBYTcwcp6ojADnwPq44yZ4
	 F4Ur84oX3ZmwjJQ7IAK17S9TggFRDWlz8l2Cgo9UHrRbqCsd/rNKYxXRSIcH890NUZ
	 LFBOlsjnFwwLdx3KpMvQEhCNb8wEQfed2rAepwpxIqnFeSGWa0flJjO13W/W1MSZj5
	 +1m5Th+A7i1WD7II4D+g2n4fHe8dt2sJJSFQ6cJzM/5CZI1KM8feM7foFKmiBJZosp
	 pwwNY9Ek/wAMw6aLkO4MYIDxmte3ArbAjvZPO2Y3dn7FgQPbpSg7Aujq/VVjAckfuV
	 DD/KVaGBI/grw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE39A60F94;
	Sun,  3 May 2026 19:03:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81B80204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 736AF60F83
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KckZjUL-IOx for <buildroot@buildroot.org>;
 Sun,  3 May 2026 19:03:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 813E660F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813E660F6E
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 813E660F6E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:03:03 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-36505450d0dso1737475a91.1
 for <buildroot@buildroot.org>; Sun, 03 May 2026 12:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777834982; x=1778439782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2pJBhB/qlLUZXyczJE2KX4MPkoGKQzg3LXjZoRvafs=;
 b=WwY5BJoyRQpa2cUPbtboiW+OBZeyncKMPiOs/tCfUcYP2aTSNadUYgisjiNlW0vEeS
 IcBV8yNXnU+VgUKdV7FsRyvMFkHrid+6RmN73/YFmBbOPdAF6WF8fKBvvMC9dGUu0m8G
 o3EhTM3FWpQMZl/rMFLDm3gGN9hEPFTgopt88QqL36NMbhF3o5hl6YC3/LcK/w5gjJuy
 bYBLJ5CzGylLMvmfM4yt4/kRAOYiXp61fNaTEd9vBl8BhIxStbnQUI6UNHP5UUwl0pH7
 0fhEQRcOX+rttT5aRODRskgVk0MQipbqaGvNF0tULFxyry+O2arb1lkyjZNF7sc6iB5A
 0xWw==
X-Gm-Message-State: AOJu0Yz0NAseVIFyaPcDwnx6BiHKSSZzuyW1L3mc9lM1IiIquFYMTXbE
 TfbZo0cQ98qxuOhrZueOhqWV22e8GCSwscNRe54U8TjFcBcGD9aad07hR+Rm5xKO
X-Gm-Gg: AeBDieuMQ/D6nwaRhVhAqUnVrYVyoQy1r2UFGWl+MLYnRSLdCOKGtZI8IPQrlMtPSmN
 jtBe7G8BVkrtbjltAhs6XQmoF21ERjCJea1FB6m9UhQMwrR6/tjO+CeS9PExXLrx5hyF60oQLEc
 kIf+1c5s1N0ItGtjZdxdU4jBB5L7FclMXTESuvDbF3zO7N2fsg2razbAySq9YXtwBcZyMOTQ6w7
 3Si4CSihbc6xdDkQiKjKA1YLKq5RCFhKmBYC7ef96uHD+KWHTInE0FAxF4fFIM3gMSULKxdOLGf
 OB3hVRim2pfim8YPCjLht+ReKmF9OrA4ZzrxoWR58Fi0kbDc9A5nUC8S/Fjp8Q3DWEwTiJOaOfy
 v91D5mx7r9UxwfJx5DMLMsBQTV1gV5+QLHj2JckA4Snk12eua6f3ZikX0oonGGgKkq7GDgO3tyI
 4qFq0KSbpTXQ40T8UEZLZaV10x2tmqzy75lCVQEw00cHFqrLDUyjYPj+xqR8WzmO5bwvilhQ==
X-Received: by 2002:a17:90b:530f:b0:35d:9da0:4947 with SMTP id
 98e67ed59e1d1-3650cdda6b7mr7591614a91.11.1777834982173; 
 Sun, 03 May 2026 12:03:02 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:113b:37de:39d6:e1f8:f451:f39])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-364ec03c944sm8459352a91.15.2026.05.03.12.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2026 12:03:01 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon,  4 May 2026 00:32:49 +0530
Message-ID: <20260503190251.852569-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777834982; x=1778439782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k2pJBhB/qlLUZXyczJE2KX4MPkoGKQzg3LXjZoRvafs=;
 b=o/ZaOf1dUBHo5aLgz4XBDmtMV+CkWgVMNg3YIMuMkSBNbHEhs+tqeOXb1PFMrCSg4E
 cCOCo5O0cP/qiqjJKZjCLFCkP0WIuit3edw50U/pQwnwnIl+dJgE9VV3GEySH50Sy0Ol
 AWukKo2iZ4FUhg7OjwihOzj+RuZ47bJbIItbocQ3ESsgtAiFfoQCOWVytUxWJTtfgFpt
 WEWbz+Gyd5TGYT+1ivnPFKRlKGGJLU4A0gyWFqW1kLfL0J8RMIYxNz6XDIUJ42WByURZ
 pomgpee4+7ktcsyA33EBvvuBXkJSJoS/BdrhE2Qi8ipRVC0I/cHpaM6g1Gm9bgqvef7p
 MO1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=o/ZaOf1d
Subject: [Buildroot] [PATCH] package/dos2unix: update upstream URLs
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

The old upstream page is being deprecated. Update the homepage,
download site and hash file URL to the new upstream location.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/dos2unix/Config.in     | 2 +-
 package/dos2unix/dos2unix.hash | 2 +-
 package/dos2unix/dos2unix.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index cfb5ba4b79..928605ae37 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DOS2UNIX
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
-	  http://waterlan.home.xs4all.nl/dos2unix.html
+	  https://waterlander.net/dos2unix/
diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 720a457ce0..d70bc6c21b 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.5.tar.gz.asc
+# https://waterlander.net/dos2unix/files/dos2unix-7.5.5.tar.gz.asc
 sha256  75f692b8484c8c24579a2ffd87df16b9c9428ed95497e3393a21d1ba0697ac33  dos2unix-7.5.5.tar.gz
 sha256  e09d0709ac6a24d995565989267f2e097325778ed47738ee889a7124bc89a3ef  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 99454aa2a3..9ac53ce838 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOS2UNIX_VERSION = 7.5.5
-DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
+DOS2UNIX_SITE = https://waterlander.net/dos2unix/files
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
