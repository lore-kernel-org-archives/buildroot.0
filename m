Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B54CF6C15
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 08:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A34A822B0;
	Thu,  8 Jan 2026 08:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmvwiQ3-i1xX; Thu,  8 Jan 2026 08:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F66822FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767859754;
	bh=rNbO4MaO8JmvMG996bg9pQlXD8k/1nbSZXIUAWQTgnM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=YtzJfL6kc50WU2SXhC/nY2ONbc+SqaRruxPl08OUZaUhlS4/6j0BFLkwZh7vmxgan
	 LEbgUeXOK3fkfFijIAeQ7dyhuVEk8r2l1Yo/GZsAbMztk8YeEurfATNK7Bph4aiqZx
	 ngE5jyO0z5jdprYRF3fOaTaXEG1UVaGB2HmcG5kB4Mac3+bTR3FoTSYCFOhKIPV8t4
	 gB4qfQkbaI8SFCn3pKagli4wRoo/BXFYBXHChR9hx9RXvp1zECb/d5uRiYwPVqBEOZ
	 7fkPjkF5SAIcqoWm7zHDgnDHW08+TDJM1I7sEdqGvi/KVQDC+EBrwzI+SsTR75fHFA
	 pG4X3k2Rs5ZiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F66822FB;
	Thu,  8 Jan 2026 08:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 802B5237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 08:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6804013D
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 08:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBdj-Vg0l1qT for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 08:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 120A140077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 120A140077
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 120A140077
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 08:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4A841814B9; Thu,  8 Jan 2026 09:09:08 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu,  8 Jan 2026 09:08:51 +0100
Message-ID: <20260108080903.149441-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1767859749; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=hLaRZtgcXADWk4NB7YK1EzpRCxTk+DkJ+VQkPI5ipCg=;
 b=TWaR+5zs75hl/XqKG6F+W4OihDcw7pmiRu6wdEe7jjsAqAbS4Z0lt6YzsVlLgZ0r9w/Rcp
 my7ct+IU+b5HdHV6GP9qPkXX0pZ0rYmW3WgJoiXuV15lmTuwv4yGxXapAHUjYU5KjslYdX
 eqLaufWulZ5LeGVFkhLQs8ZkhxUD6ek=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=TWaR+5zs
Subject: [Buildroot] [PATCH v2] package/spdlog: bump to version 1.17.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update LICENSE hash due to changed line endings, updated date (" - present")
and updated contributors ("spdlog contributors").

Changelog: https://github.com/gabime/spdlog/releases/tag/v1.17.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---
V2: updated license hash
---
 package/spdlog/spdlog.hash | 4 ++--
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 947acb0dfc..94c51f919e 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8741753e488a78dd0d0024c980e1fb5b5c85888447e309d9cb9d949bdb52aa3e  spdlog-1.16.0.tar.gz
-sha256  4ccecab18d1ff0b61174fe3d6c430541625d3ddb865b0d5887db296f883c76e7  LICENSE
+sha256  d8862955c6d74e5846b3f580b1605d2428b11d97a410d86e2fb13e857cd3a744  spdlog-1.17.0.tar.gz
+sha256  d678c20826e1392578508e1c78649a1e3c31bda05ef4388d967dbd654461b140  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 245feac801..b12666613c 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.16.0
+SPDLOG_VERSION = 1.17.0
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
