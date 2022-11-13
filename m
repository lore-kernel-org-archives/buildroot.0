Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2F8C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07D2C60BCB;
	Sun, 13 Nov 2022 16:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07D2C60BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVSMVKRwhozd; Sun, 13 Nov 2022 16:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A94560B0E;
	Sun, 13 Nov 2022 16:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A94560B0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B35B1BF40B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56DC460B0E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56DC460B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLmSIGE7FwKr for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:33:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38A9760AE2
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A9760AE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C6628370D; Sun, 13 Nov 2022 16:33:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:22:42 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: a7555c624da3fc8e524fb2c5d662920a5ee48e6d
X-Git-Newrev: d9509f97cc50d31ab562d174b8e6ce904f1e1705
X-Patchwork-Hint: ignore
Message-Id: <20221113163331.1C6628370D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/exim: fix typo in
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9509f97cc50d31ab562d174b8e6ce904f1e1705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 55ef42e090b39fdf129b7e5e218019e0156fe166)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index e0fcd83fb0..9c54eeec44 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -20,7 +20,7 @@ define exim-config-change # variable-name, variable-value
 		$(@D)/Local/Makefile
 endef
 
-# Comment-out a variable. Has no effect if it does not exits.
+# Comment-out a variable. Has no effect if it does not exist.
 define exim-config-unset # variable-name
 	$(SED) 's,^\([[:space:]]*$1[[:space:]]*=.*$$\),# \1,' \
 		$(@D)/Local/Makefile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
