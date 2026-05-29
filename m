Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0F6CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C14BB85924;
	Tue,  9 Jun 2026 13:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amBUhwNYfpAM; Tue,  9 Jun 2026 13:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE26985933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010193;
	bh=9/14HRQ9uOOWEOAmnT2pwpJfoTXFbt3uNRseMmjgf7I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ted6alwaIFLVUcmyeolsRW/b3rPoYAAqZdE5vaYo43G4Y20gwOa9b5SXhSwfXnIkb
	 SuGUU7LpiW6WcJs99uU0LRF2yrDqAmTPnn8N5dotgnvjArTaHoPL81rd0BgG220ykI
	 bSwz2ulv24svKC3GSA27g+ZN6vtv7/vbcmXUqhMf+1i+btu7x7eJmZHgN2mYam8yXZ
	 rk8G91sFPAZGvcH8jXfaBd5jLRAHSmw4Sl5W+Jlf1fZS/ni1BXwjHf0ZyRd08qoda5
	 ODROHVbm3NmVypUsisPe//2P6zchZDlLKTJLkU21x9FfR2nTgEoLlnWO00EYwhe0K5
	 ozxvD3l4+MORw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE26985933;
	Tue,  9 Jun 2026 13:03:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0478E196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0060544E77
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRD43rmPgTzx for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45134452D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45134452D8
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 804EF87E7E; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 190bb8890e2098b1362609f387a3db42eaf784db
X-Git-Newrev: 418bbf025d6054036055c0d0da7696335e603865
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.804EF87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libudev: new virtual package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/418bbf025d6054036055c0d0da7696335e603865
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/Config.in          | 1 +
 package/libudev/Config.in  | 6 ++++++
 package/libudev/libudev.mk | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b7c799d9db..1c0f6d8a29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -530,6 +530,7 @@ endmenu
 	source "package/libiec61850/Config.in"
 	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
+	source "package/libudev/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/linux-serial-test/Config.in"
diff --git a/package/libudev/Config.in b/package/libudev/Config.in
new file mode 100644
index 0000000000..2dbafe4991
--- /dev/null
+++ b/package/libudev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBUDEV
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	string
+	depends on BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libudev/libudev.mk b/package/libudev/libudev.mk
new file mode 100644
index 0000000000..af1b3ddb51
--- /dev/null
+++ b/package/libudev/libudev.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libudev
+#
+################################################################################
+
+$(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
