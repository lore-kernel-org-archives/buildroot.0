Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16D4C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82CA780C5E;
	Thu,  7 Aug 2025 17:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4YbYSVc2sPA; Thu,  7 Aug 2025 17:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC3B980CBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC3B980CBF;
	Thu,  7 Aug 2025 17:01:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 135E9767
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 701B480C19
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gW5jvYomW1sp for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0F480BFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC0F480BFD
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA23F86984; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 523a2c49ab629beee9038fd49fc263bb228dea3e
X-Git-Newrev: 5de1dce0169bb16c9982a526dd554f2b774d0eff
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.BA23F86984@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/chartjs: fix
 license path
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

commit: https://git.buildroot.net/buildroot/commit/?id=5de1dce0169bb16c9982a526dd554f2b774d0eff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit a954d39a58 ("package/chartjs: bump to version 3.9.1") updated the
package version and the license file hash, but also changed the path to
the license file in the hash file. However, the path to the license file
hasn't changed, causing an error during "make legal-info". Revert the
path change.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 353745e095dada5e5585a000b8b27697f267445f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/chartjs/chartjs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
index 3f8da92715..0f97d0a4a2 100644
--- a/package/chartjs/chartjs.hash
+++ b/package/chartjs/chartjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
 sha256  111e0751796f087a51e94dfed910ccfb1278fd30e584a6e48514dba9ae7e72c6  chart.js-3.9.1.tgz
-sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  package/LICENSE.md
+sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
