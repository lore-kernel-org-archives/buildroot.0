Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34924CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE54C415FD;
	Thu, 25 Sep 2025 20:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pzo_dza43jX; Thu, 25 Sep 2025 20:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C54D041655
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C54D041655;
	Thu, 25 Sep 2025 20:02:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45AFC177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 240C44129B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07yvChsB7nBE for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22AAF41289
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22AAF41289
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21016863FE; Thu, 25 Sep 2025 20:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 21:57:48 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 94d38f42ee0b60715f4f356b748c97030e4204fd
X-Git-Newrev: bc41ad9a6cb80ed4254849914cf90fdd13e9862f
X-Patchwork-Hint: ignore
Message-Id: <20250925200242.21016863FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/gnuplot: fix
 deprecated CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc41ad9a6cb80ed4254849914cf90fdd13e9862f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The CPE 'gnuplot_project:gnuplot' has been deprecated in favour of
'gnuplot:gnuplot'.

See the following:
  - https://nvd.nist.gov/products/cpe/detail/DB68C9F5-3330-4749-A6F5-61FF041037CC
  - https://nvd.nist.gov/vuln/detail/cve-2025-31178

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0bbefd60f7192c6b13c571ce144f8518de5ec538)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gnuplot/gnuplot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 2a1072a55c..efdc08deae 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -8,7 +8,7 @@ GNUPLOT_VERSION = 6.0.3
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-GNUPLOT_CPE_ID_VALID = YES
+GNUPLOT_CPE_ID_VENDOR = gnuplot
 
 GNUPLOT_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
