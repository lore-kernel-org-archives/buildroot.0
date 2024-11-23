Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04798D75E5D
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 18:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A45A084191;
	Sat, 23 Nov 2024 18:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8BJz3GNHpCs; Sat, 23 Nov 2024 18:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0B61841A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B61841A6;
	Sat, 23 Nov 2024 18:35:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 314BFE11
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F46842EAE
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyf9ugxUQHfy for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 18:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F41542EC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F41542EC7
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 18:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECFA18655E; Sat, 23 Nov 2024 18:35:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 19:34:37 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7805e72284cf6df517efa62a5a419458ce78a7c6
X-Git-Newrev: 35d3dd33dadb5d91c4c4f260def4078f75df6e3b
X-Patchwork-Hint: ignore
Message-Id: <20241123183534.ECFA18655E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gamin: fetch from
 sources.buildroot.net
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

commit: https://git.buildroot.net/buildroot/commit/?id=35d3dd33dadb5d91c4c4f260def4078f75df6e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes https://autobuild.buildroot.org/results/ef2/ef2b87da32c81fa635f795a99f352a18f535ec25/

Upstream is no longer accessible, so use s.b.n instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gamin/gamin.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 4621b1646f..70bbde5f66 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 GAMIN_VERSION = 0.1.10
-GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
+# upstream (http://www.gnome.org/~veillard/gamin/sources) dead
+GAMIN_SITE = http://sources.buildroot.net/gamin
 GAMIN_AUTORECONF = YES
 GAMIN_INSTALL_STAGING = YES
 GAMIN_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
