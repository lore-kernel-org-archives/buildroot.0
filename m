Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D69CE7A9D
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E2B0400E4;
	Thu,  5 Sep 2024 20:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5kw0Mdjc1_K; Thu,  5 Sep 2024 20:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1337E40391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1337E40391;
	Thu,  5 Sep 2024 20:45:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 353D51BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 282BA406FE
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0eYHQHcdLUI for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A1E406FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33A1E406FA
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:45:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9411686E51; Thu,  5 Sep 2024 20:45:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 22:45:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f18790aedc9da2d42d94c28f7293b4251cddb5cb
X-Git-Newrev: 87bdffd543a1e52ea2cfe6b67618e310bcd96a52
X-Patchwork-Hint: ignore
Message-Id: <20240905204540.9411686E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: fix execinfo compile error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=87bdffd543a1e52ea2cfe6b67618e310bcd96a52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

../testsuite/reftests/gtk-reftest.c:28:10: fatal error: execinfo.h: No such file or directory

We don't need the test suite, so disable it.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk4/libgtk4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 8cb7fd0384..48bfc80c00 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -26,6 +26,7 @@ LIBGTK4_DEPENDENCIES = \
 
 LIBGTK4_CONF_OPTS = \
 	-Dbuild-tests=false \
+	-Dbuild-testsuite=false \
 	-Dmedia-ffmpeg=disabled \
 	-Dprint-cpdb=disabled \
 	-Dvulkan=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
