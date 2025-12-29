Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A644BE9272B
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7712E60AFC;
	Mon, 29 Dec 2025 14:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OxwJMVqUEBo; Mon, 29 Dec 2025 14:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B4E560B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017278;
	bh=7R65d5XDzvUmTA1LtNpOlwWHUvvaGQ2uQ4bi5H0v+VM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mkr9ojkcFNdB5y72LhXrFv2RiKBpGyMborkoSjkcxx7qlQE7OTYJYrmcgS25gyF3N
	 72Edt5lMlM/Oxd3ireiI6xRXFlD2Bf1wfUC30b/XjOKo1io3TQqZ6gsQzOl95HQrEW
	 VwbC0+wIcQYFs5P4p8tnCizKrtPIHpQN4sM9pyAg+eOtx09C3iCYkrZBtG8zc43tiz
	 2uLgFkRg0v/WoUDUUOIwQEmVB8ucefMv2f343RySSvbdzcN0n8A4TrRZfGKo3AutF1
	 kd7Tw7bwjCCOUI6Or6eCFIMISMB8Ioo8eQWgtCSNPBk588rgEngP1PqmXzoc02k5d8
	 EOSBJRvpvzFKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4E560B24;
	Mon, 29 Dec 2025 14:07:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3C091E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 967CC404FC
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hu6apWixygHR for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC176405A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC176405A5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB59687B4C; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d372b654a45882f641ff65a4acf7126e66c35487
X-Git-Newrev: f276648692b898aed8b32d4887a8372209b3cd2c
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.DB59687B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: fix patch reference in
 IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f276648692b898aed8b32d4887a8372209b3cd2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the
`0001-Disable-tests.patch` patch reference
was removed in favour of a build argument that disable the tests.

This update the reference in IGNORE_CVES accordingly.

[1] ba2fb599cd package/pixman: bump to version 0.44.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pixman/pixman.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 87d973230f..63d9ccd10b 100644
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
