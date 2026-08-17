Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6357EC5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 14:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B20980BCA;
	Mon, 17 Aug 2026 14:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXapQCnFXfSY; Mon, 17 Aug 2026 14:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E81A80BCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786977723;
	bh=pKJjAMaqQy0LMNvI55xdZsr0jxdOuCPQo8rwld0tamo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lPOrv60eB0YLtNp8rVsTyMjeAANNVOMkjmbRGF/Nv7cTJEhaIxfyZ4eMWtLJsYVNP
	 jqhdIDSty+U1ciOSePm4q6EWgucIQ0cosph9xWvM1CKiibf+QFf3lnkcGkjCzfGJzR
	 66resKXzkgK/SMB0ga9nT1PVimE5/f1e/m0ONvX2KXhz2oyNuApiqFC0cxPo1mGgQS
	 eujhM6cnbHBSCp0tTeiy1grbzEzCok/pZ16LN28YldRtgrPLv6lEfbOJcMXQyUxd7N
	 VrRZNCN1kFIimlmj6/tagGTZAEqr8yfKJwLG5PjaZbjoWX4oI5Gsv7MGLZQgcI02at
	 /DHbDVYYFKmyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E81A80BCD;
	Mon, 17 Aug 2026 14:42:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB5832EF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8E3F80BCD
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xt7LATEx_Zx1 for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 14:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C921780BCA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C921780BCA
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:42:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 386437FB01; Mon, 17 Aug 2026 14:41:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 16:29:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3b0f85b30c23b8bfa5261a1aeb840137cfbca79
X-Git-Newrev: 2bf6549d185aa3c106ed3f86a3314558d77d6745
X-Patchwork-Hint: ignore
Message-Id: <20260817144109.386437FB01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: security bump to version
 7.23
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2bf6549d185aa3c106ed3f86a3314558d77d6745
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/cesanta/mongoose/releases/tag/7.23

Fixes CVE-2026-73261, CVE-2026-73260, CVE-2026-63626, CVE-2026-73252,
CVE-2026-73251.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 1a60b0c89c..80cf033774 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
+sha256  93208f164038b05d156935b8b725063e1afb3984a362dbcf3a9ea37b6f1f2255  mongoose-7.23.tar.gz
 sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 207d31cdfa..abb36aeb2c 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.22
+MONGOOSE_VERSION = 7.23
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
