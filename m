Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1582C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DDF9408D4;
	Sat,  3 Feb 2024 18:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DDF9408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2RSVVvvMfdH; Sat,  3 Feb 2024 18:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C73D405E0;
	Sat,  3 Feb 2024 18:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C73D405E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22D2B1BF982
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1032740395
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPr981KmKGw9 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75C6640482
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75C6640482
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75C6640482
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:08:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C11A786737; Sat,  3 Feb 2024 10:08:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 11:05:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85d300f1021df905e60e704407b68dbed75ba430
X-Git-Newrev: 27fafa94a729b2c59d5eb0aec0bedbaf9dce5abb
X-Patchwork-Hint: ignore
Message-Id: <20240203100847.C11A786737@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit] package/depot-tools: drop
 DEPOT_TOOLS_CPE_ID_VENDOR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=27fafa94a729b2c59d5eb0aec0bedbaf9dce5abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:google:depot-tools added by commit
48730a1a9d882a7c56146bd2955e074aed790dcb has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:google:depot-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/depot-tools/depot-tools.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index 634258ffbb..a53afa14d6 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -9,7 +9,6 @@ DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
 DEPOT_TOOLS_LICENSE_FILES = LICENSE
-DEPOT_TOOLS_CPE_ID_VENDOR = google
 
 HOST_DEPOT_TOOLS_DEPENDENCIES = \
 	host-python3 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
