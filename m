Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5760C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 518F983B52;
	Wed,  4 Jun 2025 18:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-ixXsEUX0Tl; Wed,  4 Jun 2025 18:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D2283B27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D2283B27;
	Wed,  4 Jun 2025 18:17:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5403ADA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AC5160E0B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQsJ6OuHVEZV for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 889AD60E4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 889AD60E4F
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:17:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F4D87990; Wed,  4 Jun 2025 18:17:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 20:15:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdcc1299cc48b3aec917959f3a3cd4058790c2f3
X-Git-Newrev: f1b759d34a59460b6754223ea05f8ee948b92abe
X-Patchwork-Hint: ignore
Message-Id: <20250604181705.75F4D87990@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ninja: ignore CVE-2021-4336
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1b759d34a59460b6754223ea05f8ee948b92abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE is filed against a different project.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ninja/ninja.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index b7bc1a4f1c..805fef4541 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -10,6 +10,9 @@ NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
+# Filed against a different project called monitor-ninja
+NINJA_IGNORE_CVES += CVE-2021-4336
+
 define HOST_NINJA_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
