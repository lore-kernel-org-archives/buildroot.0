Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C333C87FCE
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 21:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E476040A98;
	Fri, 25 Jul 2025 21:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcaC4ioB2TQ3; Fri, 25 Jul 2025 21:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AE3F40936
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE3F40936;
	Fri, 25 Jul 2025 21:43:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9231B177
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 21:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77BCF408FA
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 21:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9j_QYvD2vOM1 for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 21:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F880408DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F880408DD
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 21:43:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19F288437A; Fri, 25 Jul 2025 21:43:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Jul 2025 23:43:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebb66480460fa152faa9ec27f639d53c27935e09
X-Git-Newrev: 353745e095dada5e5585a000b8b27697f267445f
X-Patchwork-Hint: ignore
Message-Id: <20250725214348.19F288437A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chartjs: fix license path
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

commit: https://git.buildroot.net/buildroot/commit/?id=353745e095dada5e5585a000b8b27697f267445f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a954d39a58 ("package/chartjs: bump to version 3.9.1") updated the
package version and the license file hash, but also changed the path to
the license file in the hash file. However, the path to the license file
hasn't changed, causing an error during "make legal-info". Revert the
path change.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
