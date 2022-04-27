Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CB7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A486541803;
	Wed, 27 Apr 2022 19:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhH_yW9uvRSP; Wed, 27 Apr 2022 19:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C2DE418C4;
	Wed, 27 Apr 2022 19:42:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04DDF1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C8DA80C58
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-VvaA5335o7 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED0A98143D
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 42D8F84607; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:03:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d0aa4d07580c26a5de744d6eb1715663537be2e
X-Git-Newrev: bbf93570426c64499ec9221c5dca1d1cc29db4fc
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.42D8F84607@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: drop libressl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbf93570426c64499ec9221c5dca1d1cc29db4fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libressl is no longer supported as of python 3.10.

See: https://peps.python.org/pep-0644/#libressl

Fixes:
 - http://autobuild.buildroot.net/results/a16/a160cfdc9dfc036c4dc41af1c796f8838d91c573

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python3/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 61470c2944..761c38c850 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -89,7 +89,8 @@ config BR2_PACKAGE_PYTHON3_READLINE
 config BR2_PACKAGE_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
 	help
 	  _ssl module for Python3 (required for https in urllib etc).
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
