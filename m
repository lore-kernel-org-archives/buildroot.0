Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3766DE7717B
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F371040B25;
	Fri,  6 Dec 2024 09:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmlKopa86jvN; Fri,  6 Dec 2024 09:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D14F44092B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D14F44092B;
	Fri,  6 Dec 2024 09:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FF95ED3
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 063A3407D8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKxEE53hFlxO for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 124E9407D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 124E9407D7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8261686A35; Fri,  6 Dec 2024 09:28:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 10:18:21 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 06b1879533777d7488381599ad80bdb7c952b8dd
X-Git-Newrev: 47811443fdb8d21e5adf7886a42ec07e24754312
X-Patchwork-Hint: ignore
Message-Id: <20241206092844.8261686A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bmap-tools:
 select host-python3 if building host package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47811443fdb8d21e5adf7886a42ec07e24754312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Host bmap-tools runs using host-python3, but did not select it,
leading to the confusing situation that BR2_PACKAGE_HOST_PYTHON3=n
even though it was built and working.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dbb019db73d8d78466c04b1847f501317a7aa214)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bmap-tools/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
index a20829030d..b6bfa733a6 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmap-tools/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_BMAP_TOOLS
 	bool "host bmap-tools"
+	select BR2_PACKAGE_HOST_PYTHON3 # runtime
 	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
 	help
 	  Tool to flash image files to block devices using the block map
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
