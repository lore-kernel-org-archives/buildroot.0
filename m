Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BA4CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23B8260B22;
	Sat, 12 Oct 2024 15:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kg9dA8vbTdEb; Sat, 12 Oct 2024 15:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0404B61567
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0404B61567;
	Sat, 12 Oct 2024 15:08:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1FF11BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EB8A405A9
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoXl5QLqjsMJ for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D45C405BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D45C405BD
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7365C85CB0; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:37 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 177b4e0a5f9f0787685c8ae9422836ca005dbf06
X-Git-Newrev: 7aba5f6ded2b572096810257a9438cf3edb00933
X-Patchwork-Hint: ignore
Message-Id: <20241012150800.7365C85CB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/socat: fix
 'incompatible' typo in comment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7aba5f6ded2b572096810257a9438cf3edb00933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4c5d82ea058edd74a5423f621543f9cffb162179)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/socat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 1e2880c028..7f634c28f0 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -36,7 +36,7 @@ endif
 # automake, so we can't use the normal autoreconf logic.
 
 SOCAT_DEPENDENCIES = host-autoconf
-# incompatibile license (GPL-3.0+)
+# incompatible license (GPL-3.0+)
 SOCAT_CONF_OPTS = --disable-readline
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL):$(BR2_STATIC_LIBS),y:)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
