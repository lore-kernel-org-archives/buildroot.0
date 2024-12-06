Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8A2E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28BA94034A;
	Fri,  6 Dec 2024 22:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYpHaDAQsYr5; Fri,  6 Dec 2024 22:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D808F40363
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D808F40363;
	Fri,  6 Dec 2024 22:55:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F5AEED7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D57D60600
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xll04_wEFpqD for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C87436060E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C87436060E
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B363986B35; Fri,  6 Dec 2024 22:55:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 23:20:10 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 2afda6a821e00fec15f0b4a7500f8b089eaa3ea7
X-Git-Newrev: b015ce70f5c9d962ebc04e1fbf63d9fc5f92bcc2
X-Patchwork-Hint: ignore
Message-Id: <20241206225524.B363986B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/python-psycopg2:
 add config dependencies from postgresql
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

commit: https://git.buildroot.net/buildroot/commit/?id=b015ce70f5c9d962ebc04e1fbf63d9fc5f92bcc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Also update site url to https://github.com/psycopg/psycopg2/

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit a0964a91579a4b1135a96588c7bfcae4663d8678)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-psycopg2/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 4aa86c7690..6b07b0c06c 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
@@ -21,10 +23,11 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 	  customized thanks to a flexible objects adaptation system.
 	  Psycopg 2 is both Unicode and Python 3 friendly.
 
-	  http://initd.org/psycopg/
+	  https://github.com/psycopg/psycopg2/
 
-comment "python-psycopg2 needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "python-psycopg2 needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "python-psycopg2 can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
