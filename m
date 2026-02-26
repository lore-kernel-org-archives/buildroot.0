Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0805DFD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF222407C4;
	Thu, 26 Feb 2026 20:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZksp_bLVN9r; Thu, 26 Feb 2026 20:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEDCA407B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138650;
	bh=/cSQn0k8rxP+Bg5rV0MUW+84zQKWNBOwBk0I9D13/bE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bg7Edw279GwQI2SAEXl5wn8MFScXMIhRLd59OUMttk7XQYh2byMMSiCiNtBmE3GGY
	 ISFiK8h0T79xNp9gvYLQgt6qgMq68bR4jhN9kzGFwDZgV6joy6Z++X5C+A0mQrP1O7
	 ISfy9ND3OjYX1RGHmoHIJgtu6RLwzvC77tJmNAgl9rZu/75fz+IUICrShGbMFcgtIQ
	 ew7OMhNLICgbg+fWo85RegT5dv50zQScxqXXrSXsZA4nAvQ4kISM0Lg+zai/yHtdJL
	 gW/dtlxuOubtHjydqd2LbQORZXESYsboxwwQATapqRE+jZAz6mHPT7MjYhOChmk6WU
	 k8uYDN0x5uKjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEDCA407B0;
	Thu, 26 Feb 2026 20:44:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A8621F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F04BE40755
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSdTlbZnPlUh for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1008040757
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1008040757
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05A9787510; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:37:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 87499e35c446721cde2526a7322f7332904e0621
X-Git-Newrev: 28d9b4568fb90aff658371a14645ef23564de5fc
X-Patchwork-Hint: ignore
Message-Id: <20260226204357.05A9787510@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/netsnmp: add
 patch trailer
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28d9b4568fb90aff658371a14645ef23564de5fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit [1] introduced a patch to fix CVE-2022-44792 & CVE-2022-44793.
Since [2] the security patches neeed to reference the vulnerability with
the `CVE: ` trailer in the patch header.

[1] 44243b4c80 package/netsnmp: revert back to 5.9.3, backport security fix
[2] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch b/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
index 3a6321d7a7..00e6d2e21c 100644
--- a/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
+++ b/package/netsnmp/0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
@@ -4,7 +4,8 @@ Date: Fri, 25 Nov 2022 08:41:24 -0800
 Subject: [PATCH] snmp_agent: disallow SET with NULL varbind
 
 Upstream: https://github.com/net-snmp/net-snmp/commit/4589352dac3ae111c7621298cf231742209efd9b
-
+CVE: CVE-2022-44792 
+CVE: CVE-2022-44793
 [Thomas: this commit was merged as part of
 https://github.com/net-snmp/net-snmp/pull/490/commits, which fixes
 https://github.com/net-snmp/net-snmp/issues/474 (CVE-2022-44792) and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
