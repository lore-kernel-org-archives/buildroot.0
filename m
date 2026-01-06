Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCBAD0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790BD416C3;
	Wed,  7 Jan 2026 18:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEYSOB1Pl-1P; Wed,  7 Jan 2026 18:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CF71416C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809012;
	bh=Oz5urNa8d3nJxuzK8d0MCm7xHjnmDDOImxqpfwL7sZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YUxD2j2Co/gwlsU0mepKtXAk2wjmusJfb1GiWDtvfY3gssBC5dSblJlSUdOF5q4S9
	 R1WvIsCvtU0X9DW+dCYahuwKeWG+AgFocdEvNq4aiRsX34o19PJzLbBba2cUIb9dmR
	 EgOXJxFXD3yGjVR3zgR1NIsDf0wNl8qugEm4933NUiYLJlRvxuPh0lLGXiBqQVr09g
	 IzZ2BM8U/Fqc7F5cjAmgZkwaPSk4uzb9pZqj/oCAYQ9DGW98E1oVYWFBG9PzoLwdbJ
	 S7duip22LDFNVj4neNK+W8rNRO+bmsvyNGttrepivRmG7Z5ZPvlJX7XDdFEi8trzyW
	 W+bUf9yfFz17Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CF71416C4;
	Wed,  7 Jan 2026 18:03:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4969ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1477880EA5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbKMqXtcFqRE for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1A2081105
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1A2081105
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B086B80333; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:09:30 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 3315c0d2c659b15fc87d70c788e4f38c319a184e
X-Git-Newrev: 070d7302f213317d95eea5b9821aac0dd37852c3
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.B086B80333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/pixman: fix patch
 reference in IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=070d7302f213317d95eea5b9821aac0dd37852c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the
`0001-Disable-tests.patch` patch reference
was removed in favour of a build argument that disable the tests.

This update the reference in IGNORE_CVES accordingly.

[1] ba2fb599cd package/pixman: bump to version 0.44.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f276648692b898aed8b32d4887a8372209b3cd2c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pixman/pixman.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 5d29fd7b35..0a6ecaa7dd 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -26,11 +26,10 @@ PIXMAN_CONF_OPTS = \
 	-Dlibpng=disabled \
 	-Dtests=disabled
 
-# Affects only tests, and we don't build tests (see
-# 0001-Disable-tests.patch). See
-# https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
-# "not sure why NVD keeps assigning CVEs like this. This is just a
-# test executable".
+# Affects only tests, and we don't build tests.
+# See https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
+# "not sure why NVD keeps assigning CVEs like this. This is just a test
+# executable".
 PIXMAN_IGNORE_CVES += CVE-2023-37769
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
