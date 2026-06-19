Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750DDCD98F6
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 23:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D5C085EF3;
	Fri, 19 Jun 2026 23:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44arWz_BuKrc; Fri, 19 Jun 2026 23:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AA5B85EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781910098;
	bh=lmudjtd+SNMxSFk6VXDv9aCSbETTZ/3EAQl05SEGkQs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LU0vP3WfNpAg8fidBpTV3YorxRw6gAXcV1IbHlWb9uymDwl+g8iIfh3MZFs9/g6rh
	 aRHLwU03OH4xWnhTRWvZb7iXfb1GLjzb4F/NIsEWq10FdFsxQfIDoTK8Ana1LhwDzP
	 PddWO4xRenHgBDibroc/xk+gDJSi1FsqpRDItvZ5XO0wiuv5hzXlmOM+uMctfqcuBu
	 KCYV7TnFSW1gvUySka68nqBGNiQPt7peWS51nfR7orJUccD2QHVC3BIiMW2w/uc6dq
	 BlbM/afq5ZKPAUXMdT1LyII5yJW+VPkpNSNKGlVd/RmHRTYK2lO/vKwMyXFs3H4ZZx
	 VkUYLV3de2emg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA5B85EF4;
	Fri, 19 Jun 2026 23:01:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C92DD06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EB2942AF1
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHeHFe7fbJvN for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 23:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99ABE4004B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99ABE4004B
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D259F8192F; Fri, 19 Jun 2026 23:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 00:53:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61056c34b4cda499e884aa31eb99862ed5fc2eb9
X-Git-Newrev: d06e45b67bb573f6ed5bf45ea0bef4acd01f2fb0
X-Patchwork-Hint: ignore
Message-Id: <20260619230111.D259F8192F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rrdtool: bump version to 1.10.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d06e45b67bb573f6ed5bf45ea0bef4acd01f2fb0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/oetiker/rrdtool-1.x/blob/v1.10.3/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/rrdtool/rrdtool.hash | 4 ++--
 package/rrdtool/rrdtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index ce1186cb18..85e894a642 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,5 +1,5 @@
-# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.2
-sha256  9787114551ee9b5db7c72722736388dcc54bf00ded51b5dd47feed11fb179fe4  rrdtool-1.10.2.tar.gz
+# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.3
+sha256  843b7caa2a80a815d44ac5c65daa42920cb64586fe804e36d0bc0783554e0635  rrdtool-1.10.3.tar.gz
 # Locally calculated
 sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 73832cb635..f911d54623 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.10.2
+RRDTOOL_VERSION = 1.10.3
 RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
