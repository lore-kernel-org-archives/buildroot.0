Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531EAC61CE7
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E4B83D87;
	Wed,  4 Jun 2025 18:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLrUdrQCQJcI; Wed,  4 Jun 2025 18:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CD8483DCC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CD8483DCC;
	Wed,  4 Jun 2025 18:28:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 678FC1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA74340249
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8BNgS4jG9ix for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BDFB40095
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BDFB40095
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A2B8876E0; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:27:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6baa077c19fe263009104e45153b617bb3fbe0ff
X-Git-Newrev: 1ee5a6c4006f9ba1eef1e2f5d11c697d352ca60d
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.1A2B8876E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sox: add ignore
 CVE entry for CVE-2019-1010004
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ee5a6c4006f9ba1eef1e2f5d11c697d352ca60d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This CVE is a duplicate of CVE-2017-18189, according to
https://security-tracker.debian.org/tracker/CVE-2019-1010004, and
https://security-tracker.debian.org/tracker/CVE-2019-1010004 also
points to the commit that also fixed CVE-2017-18189.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 913ca297dc6bbf2a082680aaf467e730ae075c06)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sox/sox.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 8922f98d5c..d8a0d7d1df 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -41,7 +41,8 @@ SOX_IGNORE_CVES += CVE-2017-15372
 SOX_IGNORE_CVES += CVE-2017-15642
 
 # sox-14.4.2-13-g09d7388c
-SOX_IGNORE_CVES += CVE-2017-18189
+# CVE-2019-1010004 is a duplicate of CVE-2017-18189
+SOX_IGNORE_CVES += CVE-2017-18189 CVE-2019-1010004
 
 # sox-14.4.2-38-gf7091126
 SOX_IGNORE_CVES += CVE-2019-8354
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
