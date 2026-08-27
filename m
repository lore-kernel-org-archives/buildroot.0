Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062ABC61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFEDA80EC7;
	Thu, 27 Aug 2026 19:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFwEP4c-8TK3; Thu, 27 Aug 2026 19:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787858801;
	bh=iKnbpDXlckAy2b5I81gh3UyZ286GD4eMBub7/ioPgp0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i/9wwqwhq/NFUEDitP6nYJ70/nTIfR1W3GpQvi7L8lYspmLuYzCCvm6Mm0cYCMkIb
	 MvWqebJ2iejPbJWnhIFvmTeT8ITeLn6GCC/NXv//J+ArirsMWCPh5hnTJ4lqnhLsZC
	 uYn7KxYZ/N1TTDREOqj2TA2GyDbsSvfsXLj/cIxDGhedkaYWwHvZ6FCynZRcRTSH5j
	 fnj65pOxMQ+Rv+twjxXhlTta2FwNa/+0uov4zTD9c1cswzuIyC+siXRhleezAqmmTx
	 BnhXGaHhIMM0jaD79S87F75TmNpUIOZmyMZn/XNE0Pd5h4R2NRCVJTgPBmT+G2reEk
	 q2EPJAZ3Tc16g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E795F80EC9;
	Thu, 27 Aug 2026 19:26:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29369466
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F44C607A8
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YsU9j7FSHW1 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D0606079F
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:26:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCB8A9201E; Thu, 27 Aug 2026 19:25:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 19:55:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4949ce4c9f4718d66ea5a81cf33b2f1a5c0b0cc
X-Git-Newrev: 29add676660b62124c876dbb82f7fd73ad2ff47f
X-Patchwork-Hint: ignore
Message-Id: <20260827192541.CCB8A9201E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6declarative: move comment
 where it belongs
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29add676660b62124c876dbb82f7fd73ad2ff47f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The commit "Enable host test module to ensure that qmltestrunner is
built" in qt6declarative's Config.in feels lonely under
BR2_PACKAGE_QT6DECLARATIVE. It's because it's actually related to a
select done in the sub-option BR2_PACKAGE_QT6DECLARATIVE_QUICK, so
move it there.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt6/qt6declarative/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
index 0a977ed808..a57b203071 100644
--- a/package/qt6/qt6declarative/Config.in
+++ b/package/qt6/qt6declarative/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT6DECLARATIVE
 	bool "qt6declarative"
-	# Enable host test module to ensure that qmltestrunner is built
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -13,6 +12,7 @@ if BR2_PACKAGE_QT6DECLARATIVE
 
 config BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	bool "quick module"
+	# Enable host test module to ensure that qmltestrunner is built
 	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
 	select BR2_PACKAGE_QT6BASE_GUI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
