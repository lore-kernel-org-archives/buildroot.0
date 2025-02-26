Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2CCC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 21:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5648E40738;
	Wed, 26 Feb 2025 21:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1FaemWENg9L; Wed, 26 Feb 2025 21:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9010140919
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9010140919;
	Wed, 26 Feb 2025 21:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FBF794F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0407A4077A
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2Fxi261M0Qi for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 21:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0449D40738
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0449D40738
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 21:56:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF29787BF7; Wed, 26 Feb 2025 21:56:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 22:49:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27b3e6774fe447dc5eb12cc7f498ec8868eb65c9
X-Git-Newrev: 0586ee6cba7411b2d1f6635cdfe36ab8fac791d7
X-Patchwork-Hint: ignore
Message-Id: <20250226215646.DF29787BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-referencing: select
 package/python-typing-extensions
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

commit: https://git.buildroot.net/buildroot/commit/?id=0586ee6cba7411b2d1f6635cdfe36ab8fac791d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The referencing module requires either Python >= 3.13 or
typing-extensions, otherwise import fails. The dependency was added
with 0.36.0, and to Buildroot with commit 94cf596d76
"package/python-referencing: bump to version 0.36.1".

Initial change requiring Python >= 3.13:
https://github.com/python-jsonschema/referencing/commit/5ea5a1539378f80caa9d6969849ee61667cb7252
Fix to support earlier Python versions with typing-extensions:
https://github.com/python-jsonschema/referencing/commit/71cbd0008d02c5a320176dab2da046aa0d20a6e9

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-referencing/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-referencing/Config.in b/package/python-referencing/Config.in
index 273c42543e..3a8dc49b2a 100644
--- a/package/python-referencing/Config.in
+++ b/package/python-referencing/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_REFERENCING
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_RPDS_PY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime, with Python < 3.13
 	help
 	  JSON Referencing + Python.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
