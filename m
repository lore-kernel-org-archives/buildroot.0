Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE959C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 12:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EAC760D58;
	Tue,  2 Jan 2024 12:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EAC760D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAQR9MChcqfM; Tue,  2 Jan 2024 12:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B523060BB7;
	Tue,  2 Jan 2024 12:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B523060BB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 309DA1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 12:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05D878143C
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 12:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D878143C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGMNLCWovz72 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 12:46:02 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E9B581437
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 12:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E9B581437
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F92C1814BA; Tue,  2 Jan 2024 13:45:57 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 13:45:41 +0100
Message-Id: <20240102124543.69572-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1704199558; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=2CbxrqJ9yHXSpjDHLRf1JNVwUc3IEmh2esuEt07P+I8=;
 b=j6XM/PviZPi+7Z9VdjYOzZNLUcgHIepe+jph0d9jOgkBF8wJqyUIUINz/pKlUYKyMoPo4P
 Ql1XRls5tqoIL2qmOHGKjCW81lAwu9VzC92wfVqHOkym0ju1iufrJclzFI/dbe78YFiMQU
 X+rDIBN12ABrSZsBo+M43eDhDrB8f30=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=j6XM/Pvi
Subject: [Buildroot] [PATCH] package/fmt: bump to version 1.2.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- LICENSE file dropped the .rst suffix

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/fmt/fmt.hash | 4 ++--
 package/fmt/fmt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 5f0e06ef30..f9928820ce 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b84e58a310c9b50196cda48d5678d5fa0849bca19e5fdba6b684f0ee93ed9d1b  fmt-10.1.1.zip
-sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE.rst
+sha256  8a942861a94f8461a280f823041cde8f620a6d8b0e0aacc98c15bb5a9dd92399  fmt-10.2.0.zip
+sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 8f8ba4837f..2512657727 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-FMT_VERSION = 10.1.1
+FMT_VERSION = 10.2.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-FMT_LICENSE_FILES = LICENSE.rst
+FMT_LICENSE_FILES = LICENSE
 FMT_CPE_ID_VENDOR = fmt
 FMT_INSTALL_STAGING = YES
 
-- 
2.39.3 (Apple Git-145)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
