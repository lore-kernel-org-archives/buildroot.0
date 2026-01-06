Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FFFD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8375E415AD;
	Wed,  7 Jan 2026 18:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDh2oRn9vvM3; Wed,  7 Jan 2026 18:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84EAE415B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808991;
	bh=HCcNpk6Hjjerh0s2ssVHZQW6wghzq565Xy+TnmczRAw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pw7ncOrh1OGIHke5ZHSvT+BVjl1aC8iqw2labQspJkJkzZJmA/kE/dFBcvxxv+Ny4
	 icUDHUdtshEwBYr1hGqBpdAvA4HV6tW4sQUYTWI7oniDLZ6jOXvK7b2JKDjg8TCH4X
	 XRM7WhuY1Ohb5GMh6QWgEB5+TYkpitWNVedzaKkst+a0rnLl5Mjyv1g88/N0Z8MdL6
	 ifxN1u8c9T9OU7UcLPqKmTk3Hnb0G6R14WzuoYMO70C4DIO/0xZ13g/5t9W5Q2oG6j
	 9GGb0TVbPTzTnZQmp8m4jnNOQ+N/8kuTq2nxriKhzd4N2dPN7OvUePBI/JfwB9Kc1g
	 4Zqd4V7j+meFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84EAE415B5;
	Wed,  7 Jan 2026 18:03:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 099ACA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F068E40B84
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjugEtk4vM5Z for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DED1940A5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DED1940A5E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE14B811C5; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:00:40 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 30d817a6f9b0c3c7151f81fa34af7f0f3735ca8a
X-Git-Newrev: 1e8db1db49ba6f0c251f0ebcd6ca53707f89fdb1
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.DE14B811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-pyfatfs:
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e8db1db49ba6f0c251f0ebcd6ca53707f89fdb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 92f633b6a76c456e3270054024e328c2c4f4df34)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyfatfs/python-pyfatfs.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-pyfatfs/python-pyfatfs.hash b/package/python-pyfatfs/python-pyfatfs.hash
index 05e940779e..58f02ed7a0 100644
--- a/package/python-pyfatfs/python-pyfatfs.hash
+++ b/package/python-pyfatfs/python-pyfatfs.hash
@@ -1,4 +1,5 @@
-# From https://pypi.org/project/pyfatfs/#pyfatfs-1.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyfatfs/json
+md5  df7f61cdec5567ec16956cbae14514e0  pyfatfs-1.1.0.tar.gz
 sha256  9725ccd0a4da1c09c27358abbf10f08c043ac84210af576803e087f51a2b30e0  pyfatfs-1.1.0.tar.gz
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  df8f053d3cbf23fe7002e6a34b06580653a74d40dc2e54f3b717a963ea9b70cb  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
