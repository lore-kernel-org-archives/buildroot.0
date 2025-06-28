Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E0CC54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 21:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5643E608EA;
	Sat, 28 Jun 2025 21:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncrfPEaTfYAF; Sat, 28 Jun 2025 21:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA7F608C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFA7F608C4;
	Sat, 28 Jun 2025 21:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54354AF7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46042820AF
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFnQgzr4u46H for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 21:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72622820A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72622820A2
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:31:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CEEE848C5; Sat, 28 Jun 2025 21:31:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 23:10:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 585ee147dd125b617f036acbb3e9668c30dab47b
X-Git-Newrev: 3b14fd5112722fc28675955f1169af072b93377d
X-Patchwork-Hint: ignore
Message-Id: <20250628213101.6CEEE848C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waf: bump to v2.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b14fd5112722fc28675955f1169af072b93377d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the changelog: https://gitlab.com/ita1024/waf/-/blob/waf-2.1.6/ChangeLog

Tested with `./utils/test-pkg -p ntpsec` (ntpsec is waf package)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 8255ed4f60..061a093c55 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  523f645690747501b19e0d107a044de514ba80b4  waf-2.1.5
-sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf-2.1.5
+sha1  d11579fb088200adc5e6bf6c96e31fcb7afd94cb  waf-2.1.6
+sha256  4bc4587a11925e19739da021e021a5764d39759fada85563bc6d4ded17515b14  waf-2.1.6
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf
+sha256  4bc4587a11925e19739da021e021a5764d39759fada85563bc6d4ded17515b14  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 88b8d9096e..911dcc5fc6 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.1.5
+WAF_VERSION = 2.1.6
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
