Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111C9E6F091
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9028813AB;
	Fri,  1 Nov 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnC-UxokfHFv; Fri,  1 Nov 2024 21:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F3681393
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F3681393;
	Fri,  1 Nov 2024 21:36:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90B1427E1
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E336402AD
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04wGqtD-InW7 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D30402AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75D30402AF
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60A8C857B3; Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Nov 2024 22:31:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b968093045dec4256a90f5ca2c533e8e4a38347
X-Git-Newrev: b625b7af0f74deeb8206eb75c43f955fd72b3935
X-Patchwork-Hint: ignore
Message-Id: <20241101213631.60A8C857B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/python-magic-wormhole-mailbox-server: add missing python-setuptools
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b625b7af0f74deeb8206eb75c43f955fd72b3935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TestPythonPy3MagicWormhole runtime test is currently broken due to
missing python-setuptools dependency.

wormhole-mailbox server fail to start with:

    File "/usr/lib/python3.12/site-packages/wormhole_mailbox_server/server_tap.py", line 11, in <module>
    File "/usr/lib/python3.12/site-packages/wormhole_mailbox_server/database.py", line 5, in <module>
  ModuleNotFoundError: No module named 'pkg_resources'

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-magic-wormhole-mailbox-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index a0721e866f..a4f4c5ced5 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
