Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5248CCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 11:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 983F9608C6;
	Mon,  3 Nov 2025 11:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGy2W3AhO1Se; Mon,  3 Nov 2025 11:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CA0A60A6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA0A60A6A;
	Mon,  3 Nov 2025 11:53:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E65621A6
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD1274047E
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPhD2z_X29tO for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 11:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 237D3403DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 237D3403DE
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 237D3403DE
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:53:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDF6E1814B9; Mon,  3 Nov 2025 12:53:17 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  3 Nov 2025 12:52:09 +0100
Message-ID: <20251103115220.2911208-4-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103115220.2911208-2-buildroot@heine.tech>
References: <20251103115220.2911208-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1762170798; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=hzsT/bph805YDvIr2uq7mhNIeM53ooPNyaHcBk00shw=;
 b=nW/rbbjXT6dJO9CS3kbfflrlN7TmpITY6j8RlK8VmQWNBQCJ5MQiyY7wUKiFKDJbJaJwuV
 cdw7u39wOEgOOMT61ia+H4WkQx/hVRpxhk1PKDvFg3HefFE1DWqVJ/rLHQvZ9KYCmIRWf2
 robwig6rENYFxnKRwd4aKdY+I6dRKrQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=nW/rbbjX
Subject: [Buildroot] [PATCH 2/2] package/fmt: bump to version 12.1.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:

https://github.com/fmtlib/fmt/releases/tag/12.1.0
https://github.com/fmtlib/fmt/releases/tag/12.0.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 29b2b13c66..76bdd3171b 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  203eb4e8aa0d746c62d8f903df58e0419e3751591bb53ff971096eaa0ebd4ec3  fmt-11.2.0.zip
+sha256  695fd197fa5aff8fc67b5f2bbc110490a875cdf7a41686ac8512fb480fa8ada7  fmt-12.1.0.zip
 sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index dfb6fd3942..7d11cfddc3 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 11.2.0
+FMT_VERSION = 12.1.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
