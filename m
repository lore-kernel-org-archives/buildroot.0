Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61190C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2518D83B7A;
	Wed,  4 Jun 2025 18:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQ-0_Q3Aq64G; Wed,  4 Jun 2025 18:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A9CF83B57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A9CF83B57;
	Wed,  4 Jun 2025 18:28:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A110822B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87DA540BD8
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KfbnnFxdDrL for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0CA2407BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0CA2407BD
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC63F876F5; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:25:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3ecb3fd2485986871872654c7f3bfdd55b2bfb99
X-Git-Newrev: 1c9fedcecebd2286315a30793e1f1322e96342e3
X-Patchwork-Hint: ignore
Message-Id: <20250604182757.BC63F876F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dovecot: document
 why the ignore CVE entry is not stale
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c9fedcecebd2286315a30793e1f1322e96342e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The new pkg-stats feature of stale ignore CVE entry detection reports
CVE-2022-30550 as stale, but it's not correct: the NVD database is
incorrect, and this has been reported in
https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/.

Let's annotate this information in dovecot.mk so that we don't wonder
why it's reported stale.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3e03873ff1ddb2edb629c215615a84338689272c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
