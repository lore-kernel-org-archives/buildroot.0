Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA35CD5BC9
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 17:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C8840A2F;
	Mon, 25 May 2026 17:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFvpXR_EzRXO; Mon, 25 May 2026 17:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7E7A40A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779729099;
	bh=eGqd6cXlJXEvhEkNmRx810CjMbP3b5e48zYTRjgahpU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Uh4nZTqCqxzCCz/J7q7a2QA/zLRIz0N+2fLZlZk3rpwJz2NpLnPFcHee/HWBUGFgA
	 W/XaOk9/16aEcuejsaekMEkq3kzqv0pIeCgeEWywV0GmDjK4SmBwuW+o/W+dJ3rrST
	 zBS1gK+gA8Y+b9Ze+NDssUp4jTIc3W64tbx/MlNFJv+VVk6JEtnRDgc8zVnkRIHrwO
	 EYdMmy1fEkCmZi4zbbvmDiiNOR2D/G4tOZCcsz7wc13vQlHZu67AI1fuepJxI/ZKm+
	 OGM5y69f87k1qQGjANUEs0V/zLaK4dfSCwCRDT5FF8juAthzN2VZ00C+nUxrHCPHzl
	 4XA0yZ5GVKqig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7E7A40A1E;
	Mon, 25 May 2026 17:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBA24297
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B80F640094
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seNjNrtOelZx for <buildroot@buildroot.org>;
 Mon, 25 May 2026 17:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A528E40082
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A528E40082
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F366D8618D; Mon, 25 May 2026 17:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 May 2026 19:07:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7fef3704c704e6337b4f8f6ff467c6c70991443
X-Git-Newrev: 5d4a6f8ae675fbc97eb36511395060d7528a846c
X-Patchwork-Hint: ignore
Message-Id: <20260525171125.F366D8618D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/timescaledb: bump
 version to 2.27.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d4a6f8ae675fbc97eb36511395060d7528a846c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/timescale/timescaledb/blob/2.27.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 888b6c2cfa..fe733f323b 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  06a5d38c52bebb364104541002ccfb9ea739f93183c339895f0d1ed90b005e17  timescaledb-2.24.0.tar.gz
+sha256  f0a940720bb5b0b635dae4d8aeceb13e83b196b8aab8717876af0f45efa47ab6  timescaledb-2.27.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 3ad8bb41fa..bc38eb9279 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.24.0
+TIMESCALEDB_VERSION = 2.27.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
