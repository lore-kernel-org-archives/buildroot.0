Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EDD606A326
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W1539jDp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDd2Jerp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DBE78111D;
	Thu, 26 Nov 2026 11:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wj2xM3DplVZM; Thu, 26 Nov 2026 11:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9551881115
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795692040;
	b=Ituyi2igbdOeszh6VsYhdx4lWKisMI63ICL5MX29hL4XEXVNVzMwEk2/voyX8630XYkk
	 rxpOZrK8zusKu7p/aSZO/hU37oLBzxhowSQPjD8uq1L/1YYl6T9Pc6dyPxp5t13Wq1vZp
	 AjaidvTmXoB9UVqES1d/rGz42vThObP/eNk5mzynxdcC8AFpkl6iEgfNrFMRbw0GOsoW5
	 f4ZvHPlfW8Ynk6MSY35MGrMW/AN1ttwrXSabPhxPOU9WFUKStKtLEQd6FU1QxyZJ9ePa+
	 4ypz2Gpqt1LBt+rTRC2aOSGD3ZX0j2lMDR0n7fJhfvUY9UJKmPXStJ9PX7CZfTbrdow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795692040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=V10VIqHegxHvLVtQbuurqhylmIRine3LJ5fEzoprtkE=;
	b=JPujMNOwdW9PEbtNlS6hMGlzXycFpWSviMEnc2PBOqNwmtQ2o0UFOyjKOUEoZI4IdtGt
	 jdg4rFFmJ8lj2N9/Zgc6+oe8A8Aevtb9PwHRT+X78Xmt5FVAUAxZbA6r8aEinS3kF2s50
	 EzMML2zmB/hbKlvLolaF8flHfCKC+zs8xMKD2hSjBs78XBvz+6OMLSIaAmvyf76Rl7AIu
	 Mo2wo+JkCXqnx0f+07owZKifUTVbgAkQBvgiTTeMt28ll3MSywbOGZ1SAawu3UPfl7UUC
	 /+57TTtShdgdTbmHbY6uIeGbKP53G1d8p7NB7+rVUmpV0TCVaridyBT5ePTVH4AkfhA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDd2Jerp;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795692040;
	bh=V10VIqHegxHvLVtQbuurqhylmIRine3LJ5fEzoprtkE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W1539jDp6Gthjg77tTRZBrZNQWZVPRJ+5gKE3Gforc1yeCCng7nFeR4Ji+HLoxSXg
	 /XJVY33/YLbEQMhC8XIGtXgxaef2YEIfjB9kAYdXhjtogA6OCtTLT43rpYk75YLpJC
	 nl9G6i4uVZAfq5n4TqBtv2qDD6lXFIQtxuxfH4HubtQIStQMXsFSAFnwKo821RnoOB
	 xrphzgu+QiELbxczb47U2/BNj3NSwI3we8ynkMe6ehcC5sMjWpDss0/yBI8tn18tEZ
	 edt5DgiEFl9qp1VQrkAH0tuut3dGEXQ3bBGna7P+bEjE41sn8laJ+6HMj9msu6LbMH
	 asoRfyTeOF3wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9551881115;
	Thu, 26 Nov 2026 11:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86E0E260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8413081115
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jE6yKnSLYGR for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 11:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D33281113
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1335; helo=mail-dy1-x1335.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=qDd2Jerp
Received: from mail-dy1-x1335.google.com (mail-dy1-x1335.google.com
 [IPv6:2607:f8b0:4864:20::1335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D33281113
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:20:37 +0000 (UTC)
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-38190551625so13425315eec.1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 03:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795692037; x=1796296837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pJSdu6K1dK15q78fstb88hfadK9BXKYpoi1yUIHHz6Y=;
 b=qDd2Jerp6vkNDp1Ppj1H5cg1WkCWtF0P22Mq3zRD1D+2wSYKua5GGRxDYc7/B2wyIB
 qS9hvNeIFgXxbhDZKAQBePRQlRHaujiZmsCT89gwua4qNViqXTBZKFXT1ac8bnLql2Om
 82ibGkorzm05KOFiZZntVBZojXaTw1ocei+kb/MYDgq8aTEAVb7vz176ytICpyMO+pv/
 IPv2pam+hCotF8Jel88oMlwvndBR0mWA55d9dEFLtpONgZo1w9EaI78egvEaR3Cmnyfz
 rAroPa3OekZkOMudDuShAHJySBxMAcF/NqdLYQ7KYbXMyxicaZSBD3Eo6UAOnRJmukVU
 +DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795692037; x=1796296837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pJSdu6K1dK15q78fstb88hfadK9BXKYpoi1yUIHHz6Y=;
 b=I26Yy0InX77JcsrE1CneiOd8fNsOQh0lL6CLO36t+OttBdIl0XvIEUYjylNSajKSMO
 ZXtSTikera54gm3Yob4KckYzf0r3adcwIllmw7YQvpoutanIA7v24N3kMGBQExXyaZm2
 mWK15oiEtdd+fNnwVy9yaRxO/HscUeSw9b/pMnSdKbBBL3dNSebkDbR5HCNaD0wV3bl6
 3WTFoZ8JiE/R0f0h2hOB6pSSuLQsasS2UoCkZXIAkSBE0xZ2miG5kjIS69u3lOXfAabw
 w2xEWfHvOHGHTjXolI8vV2qHQZ/ltBMNLyne/61aZeuRCWYvBpPPrm6c7lvEawloiuvx
 w3yw==
X-Gm-Message-State: APuU4Z8Sc053pA9LrsMnOhxEMLFYniZqK9jfoA8RXpd8LZ9n7bwS4X2D
 XPKiE9RmVS2JncU9ZvDA0WJSjLsLGHp6uKFLBDt6SfTmPGA8flQxydVsO0Rv2w==
X-Gm-Gg: AZFdTZedyR8Gjknn83RwZkFQ+/Cis5U024lIgnm3GifgLUZdbGWogVK+jlcnfRDtFAm
 8n9ttNoyfueKDJLSpt8g0rS4rX2KE2fQMx6Ro/YmmMPJGjJFAJu868g0nq4QE8nJYzY9CNwy+h/
 Pd7TvHz3qRRTmIooqXzPfIp8kkYypoHw2yY9Uy8bDAKAtya58+1NFY/p2ZpN5njMTrzgpQ8Jm92
 GUaaMYbZ6N/N0lmsOFBa7fYMJFzFblRqzZbU7ozXMscQbu8zlz7UgqwS3bzi6p2c94ZOQxs4C+l
 hCR5saiuH6p9ypIzLyfOljFX9MIXPOQ53G8GO4hfuv7a+3M8C7FaBy3yjM76+JxyLf5JLcNVsG9
 3BK2NcaiAxDvE6UhkzpfXUMoett7zHkV9SATt/MbHBd33janQueYwqmPXq/h6PCNuJQgnGCcD/T
 tc7YuNCls81YCmhbqnZMj4JgfRVeTcOvaUOdUVTwQJqzmPtp7Un9d4r0t5+2B/FsUIIubwxagqT
 qoB2xE1SAiXAZRmViOh5yDAlYr3toebmvV6hMgkieNjKvqw5dQNI7NZhQYmoVkCztWtsanKhdvg
 wbVjNQvcXG2kvYHqLAgaW7kb5kN2fcPE6qcb3n/in6Mi75op3HgBTnQvsHYhvjjABw8O/2dalQz
 R5qCcnymz3Q==
X-Received: by 2002:a05:693c:39cc:b0:386:48c1:6c5e with SMTP id
 5a478bee46e88-38648c1719dmr18706009eec.37.1795692036741; 
 Thu, 26 Nov 2026 03:20:36 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e4:2045:e80e:4a6e:5538:6cfb:9bf5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38566cd46c5sm77158466eec.11.2026.11.26.03.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 03:20:36 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 26 Nov 2026 16:49:59 +0530
Message-ID: <20261126112000.573729-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dos2unix: bump to version 7.5.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For change log, see:
https://waterlander.net/dos2unix/doc/NEWS.txt

2026-08-27: Version 7.5.7
 * Detect a missing UTF-16 low surrogate at the end of a file.
 * Fixed the processing of files containing only half a BOM.
 * unix2dos: Fixed conversion of a DOS line break immediately
   after a Mac line break.
 * mac2unix/unix2mac: Fixed counting line breaks in verbose
   mode of files with mixed line break types.
 * Code cleanup.

2026-05-28: Version 7.5.6
 * New homepage https://waterlander.net/dos2unix/
 * Updated translations of the manual.

Tested using:
 utils/test-pkg -p dos2unix
 (Result: 6 builds, 0 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/dos2unix/dos2unix.hash | 4 ++--
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index d70bc6c21b..9f104d899f 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlander.net/dos2unix/files/dos2unix-7.5.5.tar.gz.asc
-sha256  75f692b8484c8c24579a2ffd87df16b9c9428ed95497e3393a21d1ba0697ac33  dos2unix-7.5.5.tar.gz
+# https://waterlander.net/dos2unix/files/dos2unix-7.5.7.tar.gz.asc
+sha256  669ee27120ae71589f638fe3a167d6ea54f8633f5ab1b282551bd7a7c9510dfa  dos2unix-7.5.7.tar.gz
 sha256  e09d0709ac6a24d995565989267f2e097325778ed47738ee889a7124bc89a3ef  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 9ac53ce838..e305e2916d 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.5
+DOS2UNIX_VERSION = 7.5.7
 DOS2UNIX_SITE = https://waterlander.net/dos2unix/files
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
