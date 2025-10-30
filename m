Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5387ECCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2996683ED3;
	Thu, 30 Oct 2025 08:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uox5Qg08LLf; Thu, 30 Oct 2025 08:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7508883E74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7508883E74;
	Thu, 30 Oct 2025 08:14:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11778707
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBCE241020
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xCXosS-m76W for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2612D4101E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2612D4101E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15E1A87A07; Thu, 30 Oct 2025 08:14:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:12:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 873d59e6fd9865e168cbbea18fbd74d07c274946
X-Git-Newrev: feb327790cbb6f3950a5fe0504e0ac7c24d6aae0
X-Patchwork-Hint: ignore
Message-Id: <20251030081453.15E1A87A07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/netsnmp: revert
 drop stale ignore CVE entries
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

commit: https://git.buildroot.net/buildroot/commit/?id=feb327790cbb6f3950a5fe0504e0ac7c24d6aae0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

In commit [1] the package netsnmp was bumped on master to version 5.9.4.
This version included fixes for CVE that were already patched in
buildroot and thus was not picked on the LTS branch.

As a consequence, the commit [2] was made on master which removed the
stale 'IGNORE_CVES' for the patches no longer presents. This commit was
wrongly picked on the LTS branch.

This reverts commit [3] which was included in 2025.02.x to set the
'IGNORE_CVES' back to the state of version 5.9.3.

[1] 1799cfebfd package/netsnmp: bump to version 5.9.4
[2] 4a3eab8341 package/netsnmp: drop stale ignore CVE entries
[3] 3ef8c1d0db package/netsnmp: drop stale ignore CVE entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/netsnmp/netsnmp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 7cd31ff209..6575ff1afa 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -11,6 +11,10 @@ NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
+# 0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
+NETSNMP_IGNORE_CVES = \
+	CVE-2022-44792 \
+	CVE-2022-44793
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
