Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF2DC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AB936FA2E;
	Mon, 19 May 2025 10:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecjMx61kebmi; Mon, 19 May 2025 10:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B3A66FC5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B3A66FC5E;
	Mon, 19 May 2025 10:49:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29E38D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA37E41929
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9Bdv0vmk-xe for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 677234193C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 677234193C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65A66873D5; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1799aa7eb40bb14481abae4413eeb52d91405b8e
X-Git-Newrev: 3e03873ff1ddb2edb629c215615a84338689272c
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.65A66873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dovecot: document why
 the ignore CVE entry is not stale
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e03873ff1ddb2edb629c215615a84338689272c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The new pkg-stats feature of stale ignore CVE entry detection reports
CVE-2022-30550 as stale, but it's not correct: the NVD database is
incorrect, and this has been reported in
https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/.

Let's annotate this information in dovecot.mk so that we don't wonder
why it's reported stale.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dovecot/dovecot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index e116bd3b78..a48cd7536d 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -22,6 +22,10 @@ DOVECOT_DEPENDENCIES = \
 DOVECOT_IGNORE_CVES += CVE-2016-4983
 
 # 0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
+
+# Note: this ignore CVE entry is reported as stale by pkg-stats, but
+# the NVD database is incorrect:
+# https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/
 DOVECOT_IGNORE_CVES += CVE-2022-30550
 
 DOVECOT_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
