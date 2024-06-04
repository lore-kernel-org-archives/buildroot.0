Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032BAC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 18:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9B73412F3;
	Tue,  4 Jun 2024 18:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upO_v9rBSYKr; Tue,  4 Jun 2024 18:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99DE4412FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99DE4412FD;
	Tue,  4 Jun 2024 18:22:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0451BF317
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 18:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3665340644
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 18:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPlXZdQDbCJS for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 18:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A168404D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A168404D1
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 18:22:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72B6D87AFC; Tue,  4 Jun 2024 18:22:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 20:17:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baaf7f738a76d363aed753888da0712c7c430976
X-Git-Newrev: 095bd205ae22c285bab272ad341948236dac5bcf
X-Patchwork-Hint: ignore
Message-Id: <20240604182213.72B6D87AFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: document python-aiohttp
 needed for pkg-stats
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4227395124120271613=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4227395124120271613==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=095bd205ae22c285bab272ad341948236dac5bcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.adoc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 262a5153f5..ab609c12be 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -96,3 +96,6 @@ corresponding tool on the host system:
 * Graph generation tools:
 ** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
 ** +python-matplotlib+ to use 'graph-build'
+
+* Package statistics tools ('pkg-stats'):
+** +python-aiohttp+

--===============4227395124120271613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4227395124120271613==--
