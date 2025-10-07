Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683DECCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D20760A64;
	Tue,  7 Oct 2025 19:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45JQ4LmtuKzt; Tue,  7 Oct 2025 19:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 371A160A5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 371A160A5D;
	Tue,  7 Oct 2025 19:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3562E226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 278374082D
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHsF4OhPpPqD for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED11140819
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED11140819
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:21:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5BAA86A25; Tue,  7 Oct 2025 19:21:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Oct 2025 21:17:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f620e144d82d70c822f26219cbec4d45daa2c00
X-Git-Newrev: 033fc7ca8f6417204f65f24644954dfa3ab71efc
X-Patchwork-Hint: ignore
Message-Id: <20251007192147.E5BAA86A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/4th: switch to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=033fc7ca8f6417204f65f24644954dfa3ab71efc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/4th/4th.mk    | 2 +-
 package/4th/Config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 276423b255..08b3dbdebc 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -6,7 +6,7 @@
 
 4TH_VERSION = 3.64.1
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
-4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
+4TH_SITE = https://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
 # The COPYING file only contains the text of the LGPL-3.0, but the
 # source code really contains parts under GPL-3.0+.
diff --git a/package/4th/Config.in b/package/4th/Config.in
index 4554664ab4..0463a4a087 100644
--- a/package/4th/Config.in
+++ b/package/4th/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_4TH
 	  C-embeddable bytecode, standalone executables, but also
 	  works fine as a scripting language
 
-	  http://thebeez.home.xs4all.nl/4tH/
+	  https://thebeez.home.xs4all.nl/4tH/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
