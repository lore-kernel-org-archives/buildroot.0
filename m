Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B153CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70E784082;
	Thu, 30 Oct 2025 08:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mb2stf20w0PP; Thu, 30 Oct 2025 08:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 576A784067
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 576A784067;
	Thu, 30 Oct 2025 08:11:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C74F160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0E9161354
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8--oeKD41HhP for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444E961390
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 444E961390
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42A70842C6; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:56:21 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 141c6f25569bb315c2bd7582dd3eed8aebe0a6d2
X-Git-Newrev: 80dc690ccace30006556fdb41a17a2ae691ae51c
X-Patchwork-Hint: ignore
Message-Id: <20251030081040.42A70842C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openvmtools:
 ignore CVE-2021-31693
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

commit: https://git.buildroot.net/buildroot/commit/?id=80dc690ccace30006556fdb41a17a2ae691ae51c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2cf55b4e4917363f13b541e8ab873b7bbc4b03dd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openvmtools/openvmtools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 0f5c86fe6d..58876c877a 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -13,6 +13,10 @@ OPENVMTOOLS_LICENSE_FILES = COPYING
 OPENVMTOOLS_CPE_ID_VENDOR = vmware
 OPENVMTOOLS_CPE_ID_PRODUCT = tools
 
+# This CVE affects a Wordpress plugin. VMware information,
+# previously connected to this CVE ID because of a typo, is at CVE-2022-31693
+OPENVMTOOLS_IGNORE_CVES += CVE-2021-31693
+
 # 0013-Properly-check-authorization-on-incoming-guestOps-re.patch
 OPENVMTOOLS_IGNORE_CVES += CVE-2022-31676
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
