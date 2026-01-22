Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58F5D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 502084098D;
	Thu, 22 Jan 2026 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7y0VMndi8-v; Thu, 22 Jan 2026 19:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D66C4098E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110615;
	bh=a/Da3HrgssPiex0Sn/XF25ZBLUkiF/6NFd6FQqLzTd0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mUy08ZzFKFpb02UINmNrYkTZCGiEB6H0BHSxadDSeGu/vs4NQhULnp+HsnpwzIn55
	 p7Ok7dlJM0TXAm5ar0e3rJKrjmoh4LUTsJRxRU5ngbp6cLDY49SbAIagbL83GevYX0
	 Ygn6p0yVCnXzQ2aRljfFuog0pzGMlr09KPErUhwr3RaE163QaL5DNAYZ0GG41MtBC6
	 rtHFJRAY5mPBHSsEchXfEISZG0OzZK0qdnKNyqGRRSaNpXlRWmqkr1HfvOOjG5S2Ct
	 s9IyddiRdN7REaOY/lmu85aEuwNVPGBL1O92+gOBpiK2AMEzTrJ5yAi/O/ZB5EbDux
	 CLOZEpB1UGENA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D66C4098E;
	Thu, 22 Jan 2026 19:36:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D35EB4DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7296822E7
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7uY3VR8I3LW for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F97822E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5F97822E6
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:36:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD7F287570; Thu, 22 Jan 2026 19:36:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:36:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12a66851b167a7544ec1a9b9d6e9ba9735b7441d
X-Git-Newrev: 2e58aba80e61d56ea61e7ef8b0a4dabfaa782220
X-Patchwork-Hint: ignore
Message-Id: <20260122193652.CD7F287570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: bump to version 1.40.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e58aba80e61d56ea61e7ef8b0a4dabfaa782220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since version 1.39.1, see:
https://github.com/janet-lang/janet/releases/tag/v1.40.0
https://github.com/janet-lang/janet/releases/tag/v1.40.1

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add links to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 15516a4cdc..02dc550dbe 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a43489328b88846e5cddbdad9274f25ee9854e337e52490a74bb7955de03c650  janet-1.39.1.tar.gz
+sha256  e7fdcb7ccc83a3be6181f7d7d71f0ea027a000e0eefe9bba3b8373c05eb5764a  janet-1.40.1.tar.gz
 
 # Locally calculated
 sha256  805858acec1df54018879efc78ee3ff7bab5e69908c58e46bbc2d94520f29023  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index cf4113fb17..dd2283e5a9 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.39.1
+JANET_VERSION = 1.40.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
