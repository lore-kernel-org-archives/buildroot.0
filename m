Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB7D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 269814102A;
	Thu, 11 Dec 2025 19:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FR09sROqAJal; Thu, 11 Dec 2025 19:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A78240FDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481278;
	bh=eTW120q2cLIv4OQTLlnp2j118qYikEOoIyzcvQYGkiw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W2Qmg+NCw54D+wrCoaPWbvh66kKomcqwV47GkzsDICuswXYIuch3s5xn5UzmJs/aZ
	 kdVkgBmHEZULexecoUgPrZRDDYFismMrqChfNvNm+PveuTQ/nmx71zuhpGDLdR5dL8
	 XNteKGfDBgUC9H7BxqPORsPSe4+nZqsWXVyLKbQGwlu3KX9pk9HyR4wMpy2gJx57sK
	 2milRr6LJ2Vh0anGN8LAw7VvLnsPWkDxN0nKJXNYbQemEwWVJhibkyhTv1njeDKr48
	 7jlnLN7QcWk/qxPgSfDrGNHuuubRb5pYxzl5j4DQYCT92VAEEZjyhtmlBbnTcYkm7q
	 zx/ZqUd3XSlMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A78240FDE;
	Thu, 11 Dec 2025 19:27:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CC3F2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F7F340073
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPpDCpSTqDRc for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDAB74008B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDAB74008B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED397838CC; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 14d874c73d817eabc150098eaf76cfeffc37b5c3
X-Git-Newrev: e79d30584b54954719e8d39c0cda353de9286bcc
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.ED397838CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ficl: update SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=e79d30584b54954719e8d39c0cda353de9286bcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Upstream moved the tarball to another folder:
https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
and also retired the package.

This patch just fixes the download problem.
CC'ing Francois to ask whether the package should be removed until a new
version 3.x is released.

Fixes:
https://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b90121838c665/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f2b5cdf5a3b84612de3e51b210fd31c5152b057f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ficl/ficl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index af900fa2cf..c0698a3433 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -6,7 +6,7 @@
 
 FICL_VERSION_MAJOR = 4.1
 FICL_VERSION = $(FICL_VERSION_MAJOR).0
-FICL_SITE = http://downloads.sourceforge.net/project/ficl/ficl-all/ficl$(FICL_VERSION_MAJOR)
+FICL_SITE = https://sourceforge.net/projects/ficl/files/OldFiles/Ficl4%20%28retired%29
 FICL_LICENSE = BSD-2-Clause
 FICL_LICENSE_FILES = ReadMe.txt
 FICL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
