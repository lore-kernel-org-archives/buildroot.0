Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A247FCD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7FF81178;
	Sat, 31 Aug 2024 17:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhNL0EI9YeOz; Sat, 31 Aug 2024 17:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68F1681347
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68F1681347;
	Sat, 31 Aug 2024 17:12:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9C81BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28FB3400B9
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0OA3nnj9fyl for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B15A40021
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B15A40021
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 217F5867D3; Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 18:44:40 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 917c414e680393740e5342e662f562d29814efc5
X-Git-Newrev: 001e416759368b35c91b21f2099e800da3c7713a
X-Patchwork-Hint: ignore
Message-Id: <20240831171228.217F5867D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x]
 package/python-can/Config.in: sort selects
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

commit: https://git.buildroot.net/buildroot/commit/?id=001e416759368b35c91b21f2099e800da3c7713a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Sort python builtin modules before external python libs.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d582054e131bb6e13d27b2bdfc76a1a30067775)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-can/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index a00c9263cf..61955a2b00 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  This module provides controller area network support for
 	  Python.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
