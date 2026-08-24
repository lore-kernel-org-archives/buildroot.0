Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E941CC5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 17:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A9A980B4C;
	Mon, 24 Aug 2026 17:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSoEg90IQEIO; Mon, 24 Aug 2026 17:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787593745;
	bh=EHHRW3K3OBrY9OvzHTSMpqwGrHz1XnO50sTkGIQNPKU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hMAhdUS1EM7OsasTRk07c+nlZOCJLloX/nJTHQdLHQMTiNZaSQ0dDrJ8cUVCn/wy7
	 VZdeOEK62dl4lPWlvx636gHogLP4Tg2O1ou+XE/yYC5bRSF+p++VvFKyMYw31WTGuN
	 ieeGA6TzmWH35HmqM4/TiN159ufP5gqNBhXiQexwWKlhi0IyhRnAhHXbyYPL/mSbqo
	 sFb9gitnQKe6CLp013/cm/qIeRVsoj0IGiUDbRqjbidKsg1K7OOQeWEzXQz/OUqhvy
	 nSBzwh04Z/RiRgnpgB29ZnmZ5WRSTFimqlTlbk4BnA1KHXjdeePPeaRDyhPfWKDhuK
	 LcKSl9bdg8B4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B380780BB8;
	Mon, 24 Aug 2026 17:49:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99B0F2FD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B9C840357
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wl0aFxIPUaPE for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 17:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDA604030F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA7BC8F8F2; Mon, 24 Aug 2026 17:48:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 19:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fab3c4eb92877284f39ba59289affc8fcbccf1a7
X-Git-Newrev: 70f762ea6e45f5433268c4cbe0879de85e17f908
X-Patchwork-Hint: ignore
Message-Id: <20260824174807.BA7BC8F8F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: update 'releases' to reflect
 LTS changes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70f762ea6e45f5433268c4cbe0879de85e17f908
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With the release of 2025.02, LTS releases are now made every two years
with a 3-year support.

This reflect the table showed at https://lts.buildroot.org/#releases.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/release-engineering.adoc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/manual/release-engineering.adoc b/docs/manual/release-engineering.adoc
index 0cf38183f9..cbd310d682 100644
--- a/docs/manual/release-engineering.adoc
+++ b/docs/manual/release-engineering.adoc
@@ -5,19 +5,21 @@
 == Release Engineering
 === Releases
 
-The Buildroot project makes quarterly releases with monthly bugfix
-releases.  The first release of each year is a long term support
-release, LTS.
+The Buildroot project makes quarterly stable releases with monthly bugfix
+releases. Starting with 2025.02, the first release of every odd-numbered year
+is a long-term support (LTS) release supported for three years.
 
- - Quarterly releases: 2020.02, 2020.05, 2020.08, and 2020.11
- - Bugfix releases: 2020.02.1, 2020.02.2, ...
- - LTS releases: 2020.02, 2021.02, ...
+ - LTS releases: 2025.02, 2027.02, 2029.02 ...
+ - Non-LTS releases: 2025.05, 2025.08, 2025.11, 2026.02, ...
+ - Bugfix releases: 2025.02.1, 2025.02.2, ...
 
-Releases are supported until the first bugfix release of the next
-release, e.g., 2020.05.x is EOL when 2020.08.1 is released.
+LTS releases are supported for three years, with a one-year overlap with the
+next LTS release, e.g., 2025.02.x is EOL when 2028.02 is released.
 
-LTS releases are supported until the first bugfix release of the next
-LTS, e.g., 2020.02.x is supported until 2021.02.1 is released.
+Non-LTS releases are supported until the next release, e.g., 2025.05.x is EOL
+when 2025.08 is released.
+
+See the table at https://lts.buildroot.org/#releases[lts.buildroot.org].
 
 === Development
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
