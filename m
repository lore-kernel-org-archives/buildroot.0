Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C7EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 927BE60F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 927BE60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 667A840354;
	Tue,  3 Aug 2021 21:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9a1CCmxDAyc; Tue,  3 Aug 2021 21:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C49D940350;
	Tue,  3 Aug 2021 21:21:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5121BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AB56404CC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Wr3NB7xzX5L for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0A1F403E9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 32C158B43E; Tue,  3 Aug 2021 21:09:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 May 2021 22:59:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b304a458bd0bd823454b1d303e5ae4520ec679d2
X-Git-Newrev: 6ad1c7f12e57ab7c6f022470e0aacec442d14267
X-Patchwork-Hint: ignore
Message-Id: <20210803210936.32C158B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/live555: security bump
 to version 2021.05.03
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6ad1c7f12e57ab7c6f022470e0aacec442d14267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2021-28899: Vulnerability in the
AC3AudioFileServerMediaSubsession, ADTSAudioFileServerMediaSubsession,
and AMRAudioFileServerMediaSubsessionLive OnDemandServerMediaSubsession
subclasses in Networks LIVE555 Streaming Media before 2021.3.16.

http://live555.com/liveMedia/public/changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 5e65cacd7b..d4fa93d029 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
-md5  4645d2a0c865505c85b48af5317bcb4a  live.2020.08.19.tar.gz
+md5  3c1992b0e9b871bcad7491a3da541781  live.2021.05.03.tar.gz
 # Locally generated
-sha256  af3af7f2510b0b45f38892c232abca2cee2ab36a62503e7085b47ed2c3c2c537  live.2020.08.19.tar.gz
+sha256  ae73241f9cc4ab740d60737c0438d62a7635af3822de5d84acf275793de42029  live.2021.05.03.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 9a5c1c7c0d..effd4517cf 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2020.08.19
+LIVE555_VERSION = 2021.05.03
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 # There is a COPYING file with the GPL-3.0 license text, but none of
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
