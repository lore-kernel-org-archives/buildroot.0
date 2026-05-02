Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19991CD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 11:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 560F483CA1;
	Sat,  2 May 2026 11:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGsitQMIi2RN; Sat,  2 May 2026 11:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AC9B837A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777720273;
	bh=oqA0cSs1hMKp0NSDrlMPQC5mc7ambkAzr7G+RhtYors=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GF44NkdK6KPnl7cjPJgVO7lnY9PUl6Wj1zVFnkToGoyfL9CBpw/niczLrW8waBbmu
	 iJBoumb7ugU0LfKdqDbRoBi581lijUGYiId4J94FA2NtUKsGBLxE+PBjAiE/VQHVTA
	 MzGCZfSqKxmg6vekUTtpy6Vzt2JPi4fxjFsCq32j4z3nQ1ZDwevQzS9dUQCtRau7k8
	 47X49E4+mRS736FD0jOrHjYU6F1KsUUkh2kjbQxcYCHlc/+2EXcdjDg4yzWBq2dsHu
	 IjCu3TD6N6CvMNoa0EHcSxtZkmjGNlF8YzCPydkkrJvX7D62Wzqp3R10lc1vjUi889
	 l8v76gtAK69Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC9B837A4;
	Sat,  2 May 2026 11:11:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F078C24E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D672C60FD9
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lt1puxR_0HEK for <buildroot@buildroot.org>;
 Sat,  2 May 2026 11:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AD4660FD6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AD4660FD6
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2CA77FD61; Sat,  2 May 2026 11:11:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 13:10:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d459d257c3a3895c3539d349c8e834f938ec909a
X-Git-Newrev: 0d5ce9ed84e7dd050624252045caa813c0f05e82
X-Patchwork-Hint: ignore
Message-Id: <20260502111109.A2CA77FD61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proftpd: security bump version to
 1.3.9a
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d5ce9ed84e7dd050624252045caa813c0f05e82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/proftpd/proftpd/blob/v1.3.9a/NEWS

Fixes CVE-2026-42167.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: use tag in NEWS URL in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proftpd/proftpd.hash | 2 +-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 482534fb1c..9ec632884c 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4a5f13b666226813b4da0ade34535d325e204ab16cf8008c7353b1b5a972f74b  proftpd-1.3.9.tar.gz
+sha256  bc3c7c47033ecff29f010efc18315d5906eb942d2e673ebce0138a96f11af0b4  proftpd-1.3.9a.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index a30c46ee27..ba026f5dd1 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.9
+PROFTPD_VERSION = 1.3.9a
 PROFTPD_SITE = https://github.com/proftpd/proftpd/archive/v$(PROFTPD_VERSION)
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
