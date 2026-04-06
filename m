Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48466F46C5E
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 17:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF1D409C9;
	Mon,  6 Apr 2026 17:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFtFhhdXtIrl; Mon,  6 Apr 2026 17:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18CEB409E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775495357;
	bh=Fa+oBQqrNiRn69SRU0Ck04yaY9W/JYQbYUKOop2tGZs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a0OeIJed89RWPA/86SQEuDF0JtSOIm49RKlSm8zwRq3mYVsJfixajlQL5OpCGA/Ws
	 4yxEaMdxsecYhl4K4bIcr2WWayXGhd3dAtj70qNZkbt6Pq81IHEau4jQqF01WJdrdD
	 aDK4Oxti4bX6b/CseNoqBYTyASGvVrCyS6AnMoezgul7/OBdx3lLOHV5MoQfUlobFH
	 cFjvn3jHclNIc8ddB/ht/Ltsydc2BAMsUuXFatGhlFnhiTeHIsgAYD3NkHC9Y+5MP3
	 ZkCUZLli4zMt16oS33tE1X7iqFeOi0gIsVtOpm6XOHGReHGUSbS9aq+pQ9c1gJOkpl
	 gdOM8sYhU+dfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18CEB409E7;
	Mon,  6 Apr 2026 17:09:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0025D219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 17:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9E9D80FA0
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 17:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0CenXYT410f for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 17:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30CD980F3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30CD980F3F
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 17:09:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1EE9804E8; Mon,  6 Apr 2026 17:09:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 18:49:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8e9c53d8c477ec44b5d442065c08020e2ca00c3
X-Git-Newrev: adf99a634b35763f77f3d2beda77319661de156e
X-Patchwork-Hint: ignore
Message-Id: <20260406170914.A1EE9804E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pocketpy: bump to version 2.1.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/adf99a634b35763f77f3d2beda77319661de156e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The LICENSE sha256 changed because of a date update (2025 -> 2026),
not due to any substantive license modification.

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pocketpy/pocketpy.hash | 4 ++--
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 9f0fb868f4..d6ba6e5da2 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  b0e4ee0ffcc6111f67a405c6418f5539caa0ab0368adb2027af23fbf17de88a6  pocketpy-2.1.6.tar.gz
-sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
+sha256  2b840e0c87c36ae00100fe892301565d7d905e07e1ce1f69cb4b9fcd65bc82ef  pocketpy-2.1.8.tar.gz
+sha256  5ad14c41f26ed1b8c9a0039ae566bc7ce00277aec1634220eae5db2bb8fc54ef  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 06aa0faca0..23789dd620 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.6
+POCKETPY_VERSION = 2.1.8
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
