Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57DDCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3BC40B37;
	Sat, 21 Sep 2024 18:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuokpRshrYKJ; Sat, 21 Sep 2024 18:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD2642439
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFD2642439;
	Sat, 21 Sep 2024 18:49:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A94651BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62B11606B8
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80MtdhdupRU7 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6293606E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6293606E5
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B32F383D91; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:39:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c62de54852239da4e74fc1a3d23e60cdfd296751
X-Git-Newrev: 68316831e478417066ff7515774ef0aeda2bb6a3
X-Patchwork-Hint: ignore
Message-Id: <20240921184812.B32F383D91@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_compressor_base.py: fix 'extension' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=68316831e478417066ff7515774ef0aeda2bb6a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_compressor_base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_compressor_base.py b/support/testing/tests/package/test_compressor_base.py
index 6555584c10..e822c21139 100644
--- a/support/testing/tests/package/test_compressor_base.py
+++ b/support/testing/tests/package/test_compressor_base.py
@@ -24,7 +24,7 @@ class TestCompressorBase(infra.basetest.BRTest):
                        in unset, the default value is "compress_cmd" appended
                        with " -t".
     compressed_file_ext
-                     - the file extention of compressed files created by the
+                     - the file extension of compressed files created by the
                        compress command. (ex: ".gz")
                        if unset, the default value is a dot "." appended with
                        the value of "compress_cmd".
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
