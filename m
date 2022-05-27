Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B947C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE69E41221;
	Fri, 27 May 2022 09:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7xWLR3ishcB; Fri, 27 May 2022 09:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE8541222;
	Fri, 27 May 2022 09:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 839891C1189
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F95F428B7
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-9lEzngby1p for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D427A428B1
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E31E08662D; Fri, 27 May 2022 09:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 11:33:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 41604888e129690474d39176ca8e87ec3e6168bb
X-Git-Newrev: 60db98d7975b1a77dda86ab66e110849d0bccb1b
X-Patchwork-Hint: ignore
Message-Id: <20220527092724.E31E08662D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python3: drop
 libressl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=60db98d7975b1a77dda86ab66e110849d0bccb1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Libressl is no longer supported as of python 3.10.

See: https://peps.python.org/pep-0644/#libressl

Fixes:
 - http://autobuild.buildroot.net/results/a16/a160cfdc9dfc036c4dc41af1c796f8838d91c573

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bbf93570426c64499ec9221c5dca1d1cc29db4fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
