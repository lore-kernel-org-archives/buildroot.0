Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F4AC6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6578281ADE;
	Sat, 25 Mar 2023 21:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6578281ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-J0u2CAZLGC; Sat, 25 Mar 2023 21:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A559881C21;
	Sat, 25 Mar 2023 21:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A559881C21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7D071BF86C
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5956781D7C
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5956781D7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqgNqFCNZP-z for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C1C381DE3
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C1C381DE3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A29682AA8; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:47:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8962eb6749f62fbf1f5ef3ef65d385a13e029e98
X-Git-Newrev: 3c75542074140853a3017eaa34a96884e3ec12b3
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.8A29682AA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rrdtool: migrate to new autopoint
 flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c75542074140853a3017eaa34a96884e3ec12b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
[Arnout: also update comment]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/rrdtool/rrdtool.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 2731b7b39d..051aec1c19 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -10,9 +10,9 @@ RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIG
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 # autoreconf needed to avoid link failure due to missing -lintl,
-# gettextize needed as a consequence of autoreconf
+# autopoint needed as a consequence of autoreconf
 RRDTOOL_AUTORECONF = YES
-RRDTOOL_GETTEXTIZE = YES
+RRDTOOL_AUTOPOINT = YES
 RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_OPTS = \
 	--disable-examples \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
