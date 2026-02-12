Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F0FEF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F8261442;
	Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9CYooCSAXVp; Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81137607E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011401;
	bh=1vyDJ58yfviUwUkFq26nRsOodwiaRS7pst2g5IgyOS8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m59KQLLBx+eqierAg/+7p9sUaViHRXGHqYE3lG/YYnzSL+Mmz7Gwr0rE6mpzyx7KC
	 3lOiYIB+NFP1O2mZbE9m7F/QRbdjeGcN5uEtUv0+nv40HdMFOvPDJcQ5FZM4XNM35m
	 6tRl/MRu97XEaAvspBXuKhV8EzejA2gv1E5ZddBJqCajkyslExv3+KvyBDCJEaO6NG
	 ixYvES+5kAejRDqRGSGg0OnUQM9QP99Vs95Q9GC14wYRNtGU3NiygKWJiJTV1Adr6J
	 b73mEizOW8x5rvn7nJV6MJzdZygt9IiSKvDo14Fr4bHA2Wm6O/t+bwjZUafREyiNcX
	 SFBv+8vwB2d5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81137607E8;
	Fri, 13 Feb 2026 19:36:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10000EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFF1A41E38
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frI0xGg_igqx for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8405E41E3D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8405E41E3D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 788E881EB5; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:00:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b8c1921d6016f1b1c4ddc46f6e270b7ae5e59dd8
X-Git-Newrev: b5095f2be634c5464948ea2ca5d2c332b748c085
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.788E881EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libucl: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5095f2be634c5464948ea2ca5d2c332b748c085
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE `vstakhov:libucl` is a valid CPE for the package libucl.

See the latest CVE: CVE-2025-6499 [1] that reference the upstream
repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6499

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ef5293307478bd9487c890facbb8de85240d4156)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libucl/libucl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index bf5e368f2b..7b0e5b8e8c 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -12,6 +12,8 @@ LIBUCL_LICENSE = BSD-2-Clause
 LIBUCL_LICENSE_FILES = COPYING
 LIBUCL_DEPENDENCIES = host-pkgconf
 
+LIBUCL_CPE_ID_VENDOR = vstakhov
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBUCL_DEPENDENCIES += libcurl
 LIBUCL_CONF_OPTS += --enable-urls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
