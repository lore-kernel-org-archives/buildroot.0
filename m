Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05292E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE10C80E0C;
	Fri,  6 Dec 2024 22:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYrO-tC5QT7J; Fri,  6 Dec 2024 22:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D747380E12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D747380E12;
	Fri,  6 Dec 2024 22:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB232ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B28A80EB5
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWa1mMxC9ROT for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD75880E0C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD75880E0C
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96D9B86AE0; Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 23:19:52 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8bf55f1da7094cd39de93d9a44d16219bb3d13c0
X-Git-Newrev: 83c1c81d1caac5c84b37d88afecbfadad0f0c778
X-Patchwork-Hint: ignore
Message-Id: <20241206225402.96D9B86AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-psycopg2:
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

commit: https://git.buildroot.net/buildroot/commit/?id=83c1c81d1caac5c84b37d88afecbfadad0f0c778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
