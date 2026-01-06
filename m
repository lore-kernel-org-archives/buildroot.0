Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBECBD0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3BC682751;
	Wed,  7 Jan 2026 18:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw3Y0FYTaTU4; Wed,  7 Jan 2026 18:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5675683376
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808973;
	bh=yQJsVCHsaFCDmzvcKwzqkkupLOdXhO8uDL68H0GmjAM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QCuooGIW0BuFEtjcAvtJNKlCrFnmmcNWxSJWu9mkj+kPlwjrrOWKA2JoL6iQAkRwk
	 KDFoE9aaAOMoukn7C/c4Z3VpnLl7z4qyUh8PJAl6oyVUbBYvps9tcCYwmT7srOr8fe
	 1umpGVtFES0XXbeF9fUqtMZYC2okOq3Se0vQOjgupw7899ED2tDB9wK5mQu0wA59By
	 WcVj2SVNulRNS4p3x9fQbn87dmXseosugDgLN9MlmQkR9qsykMMyZNCB7lM146MuAu
	 nHtvBYOStnbn+qHjnwBZNIWKRyHJByorijomAGfFs48o1SjTuWTs9U+69zfu73KGjW
	 1g78j8bNNfR1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5675683376;
	Wed,  7 Jan 2026 18:02:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F95FA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F31C681351
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B58eDHqHifzK for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC8680C97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AC8680C97
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49D7681340; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:58:29 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 410fc5866602f73d97f95dd504472f521dd4c829
X-Git-Newrev: 21c7f13b6bd1f41c28e6d0193371871687a2a940
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.49D7681340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-crccheck:
 add md5 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=21c7f13b6bd1f41c28e6d0193371871687a2a940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 30379483bbb3e935f6cb7f986e9366b0ec2e9b98)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
