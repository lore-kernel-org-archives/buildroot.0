Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD562D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86E464156D;
	Wed,  7 Jan 2026 18:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4rakZdf2M-y; Wed,  7 Jan 2026 18:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA64F41555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808977;
	bh=qRs0xV0VbdxOfoWPTFstCSws0CkNW49QdA1Cfjx4FC4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KwiL/rWttYDz9OeubdVZ2eePXyT6rDrpay/LXcgI4wqTl/bXLdGKfHs/eoDmu2ggW
	 YxTY57mqf31jESeHI6C9xTRQe+P0WDvXpLoKByVf2D3MvOggzdX9kohRdrqIJ2xYIg
	 6lupNwDqT/iIjejOwy20AX8T3LPHJpHk4A4zo9A1P5Hp2u2YyqvyWj2gW1Ju5qwLK1
	 BmjcshLarc3DUwMjTGCZOMGlYav24ddsndEF2wqod2JpiyJVXA0rh4aambeM+nnhQ1
	 iXteUkUeDulbLfRNiWJNii4pA2z/Xfe/kTIN/vs4BIpae/yTNzfCJBky48MpKWbDd1
	 i2TcVOplG4CiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA64F41555;
	Wed,  7 Jan 2026 18:02:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A74EA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4470F81393
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSsza0ql1jvB for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5A88116E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C5A88116E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ADE1801EB; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:59:11 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 67ab9c832a45461cb03771f33646fbf026d819ad
X-Git-Newrev: 04071794aa2ffc6811e0fd9820ad07373cb99996
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.6ADE1801EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-fs: add
 md5 hash
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=04071794aa2ffc6811e0fd9820ad07373cb99996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4ba2439ccf0dd69360be6e45862d7b0378d9f539)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-fs/python-fs.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-fs/python-fs.hash b/package/python-fs/python-fs.hash
index 5ebb49128d..a7c416af0d 100644
--- a/package/python-fs/python-fs.hash
+++ b/package/python-fs/python-fs.hash
@@ -1,5 +1,5 @@
-# From https://pypi.org/project/fs/#fs-2.4.16.tar.gz
+# md5, sha256 from https://pypi.org/pypi/fs/json
+md5  2c9dae3d52950407fe265c3576396c33  fs-2.4.16.tar.gz
 sha256  ae97c7d51213f4b70b6a958292530289090de3a7e15841e108fbe144f069d313  fs-2.4.16.tar.gz
-
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  bcc1fbae1da071a15d17fd7609519af1160a3d72c65622047b61e19ba63e780d  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
