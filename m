Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DDCE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C8880DEA;
	Sun, 28 Dec 2025 22:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7S1YhFXvNMW; Sun, 28 Dec 2025 22:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 247F980E40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959610;
	bh=U9K/6qqAO77wf6bM9sjrRn+ZvXMyISTWbrarcTygazs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XKY+c9y+7Qq+tkw+zxt1dGc34YRoVqxQa1+Zh/Z+H/5CIg5INgF/FMAMZ/RfP5x0S
	 4b/NcvLl4wqyFGplgQgxdox2g0x5jNOw2WINsqVXV7Zx5St3q2ZbbUpvyZB598B/rB
	 mL6ilX566hsQkI2kIbzuLfp0DFQ/AuB/gdURV3gdmjI9qxk2bvTV4cOZ9e+QMM8OVp
	 ePGgvLjekB/emLcRHgi7//X1/2ynpI2+NpX0ZaXlvRSoFKzQj9Bra0opJIkYmh43hy
	 qchwl8mcvmnctYuI/L7XWMxBNg8VnG92IIeIX+Sm5A8p3GyipP/o5BnPWHIx9mkjBH
	 7tjYMuln+35Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 247F980E40;
	Sun, 28 Dec 2025 22:06:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC2C6D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE80D80DF1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMzzkj1-Oy-Q for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E4D480DC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E4D480DC7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 272628776E; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:01:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4adcc7cac31c71f44d50c3db39db8b19c2b41f0d
X-Git-Newrev: 30379483bbb3e935f6cb7f986e9366b0ec2e9b98
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.272628776E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crccheck: add md5 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=30379483bbb3e935f6cb7f986e9366b0ec2e9b98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crccheck/python-crccheck.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-crccheck/python-crccheck.hash b/package/python-crccheck/python-crccheck.hash
index 3fb58a7299..b8fb4e3312 100644
--- a/package/python-crccheck/python-crccheck.hash
+++ b/package/python-crccheck/python-crccheck.hash
@@ -1,4 +1,5 @@
-# From https://pypi.org/project/crccheck/#crccheck-1.3.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/crccheck/json
+md5  b70543709102d2edb9159a9b26366706  crccheck-1.3.1.tar.gz
 sha256  1544c0110bf0a697d875d4f29dc40d7079f9d4d402a9317383f55f90ca72563a  crccheck-1.3.1.tar.gz
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  1237ab8ea60caa782d77d9d2ac0cdccd765475e3848b0b91b5751d3f299e9d31  LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
