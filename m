Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8080C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A1B680FD7;
	Fri, 28 Feb 2025 17:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUO7QwLshraW; Fri, 28 Feb 2025 17:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE80E85987
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE80E85987;
	Fri, 28 Feb 2025 17:08:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 102D01DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D6D84247B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDv-YjTTVf4w for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B78BC424F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B78BC424F2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3F3D84767; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 12:43:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5bb4fdf4f18c414775a075a4f9ec49f7d316ff11
X-Git-Newrev: ec29817de50bc98e47291c28db986954e0c50f93
X-Patchwork-Hint: ignore
Message-Id: <20250228163024.B3F3D84767@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/web2py: remove
 redundant select BR2_PACKAGE_HOST_PYTHON3
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec29817de50bc98e47291c28db986954e0c50f93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BR2_PACKAGE_HOST_PYTHON3 is now selected by python3 itself, which is a
direct dependency. The select was only needed to be able to select
BR2_PACKAGE_HOST_PYTHON3_SSL.

Remove the redundant `select BR2_PACKAGE_HOST_PYTHON3`.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-web2py/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index e4308634a0..0c141d9fc5 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -17,7 +17,6 @@ if BR2_PACKAGE_PYTHON_WEB2PY
 config BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN
 	bool "install admin panel application"
 	default y
-	select BR2_PACKAGE_HOST_PYTHON3
 	# web2py will use pydal to generate the password (below), and that
 	# uses hashlib.pbkdf2_hmac(), which is only available when python
 	# is built with openssl since 3.12 (previously, there was a slow
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
