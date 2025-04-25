Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA709C369D7
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A2CF83D6A;
	Fri, 25 Apr 2025 16:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBxtuLWhUKNN; Fri, 25 Apr 2025 16:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DC7083D6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC7083D6E;
	Fri, 25 Apr 2025 16:13:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E836127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8078E41DBA
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAtvdEACs1xe for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E06408DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9E06408DF
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C74A086357; Fri, 25 Apr 2025 16:13:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:12:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bca9d741d8dce703c678872b0d61052e23b53a2
X-Git-Newrev: b20c8aa1f1feb614f2bc321a236183c42e50596d
X-Patchwork-Hint: ignore
Message-Id: <20250425161308.C74A086357@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptopp: add upstream URL in help
 text
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

commit: https://git.buildroot.net/buildroot/commit/?id=b20c8aa1f1feb614f2bc321a236183c42e50596d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream URL was missing in the help text, so add it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cryptopp/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
index 1648a73f9d..95f930c8f9 100644
--- a/package/cryptopp/Config.in
+++ b/package/cryptopp/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_CRYPTOPP
 	help
 	  A free C++ class library of cryptographic schemes
 
+	  https://cryptopp.com
+
 comment "cryptopp needs a toolchain w/ C++, dynamic library, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
