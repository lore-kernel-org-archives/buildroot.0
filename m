Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A33DCAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC29615AE;
	Thu, 25 Sep 2025 20:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 777av5bWTDIS; Thu, 25 Sep 2025 20:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5246159C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5246159C;
	Thu, 25 Sep 2025 20:30:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E26112D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78A258349A
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrIbg4L7W03V for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9EA782FEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9EA782FEA
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBA6C83B7E; Thu, 25 Sep 2025 20:30:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:29:41 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: afda443c99854d0bcc6fbb20d49b8bee0650e964
X-Git-Newrev: 79e39a7cedf6dc73c4e2a8ccb3305d821a5ab743
X-Patchwork-Hint: ignore
Message-Id: <20250925203021.CBA6C83B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x]
 boot/boot-wrapper-aarch64: add hash file
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79e39a7cedf6dc73c4e2a8ccb3305d821a5ab743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Since boot-wrapper-aarch64 introduction in commit [1]
"boot-wrapper-aarch64: new package", the package never received a hash
file. This commit adds it, including the source archive and license
hashes.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/7689b72e00fd4d8c017880004e83a1c79144ab7b

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4b14018a38d1f37f6200a2d8ee088a381622835b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
new file mode 100644
index 0000000000..427653d55a
--- /dev/null
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  faa2843eaa3bc219da5ba9f69c02b45081a7634038faef5cba216d5e927ca2be  boot-wrapper-aarch64-ac6742520ded1da30d500f74e8affe86e27cabd5-git4.tar.gz
+
+# Hash for license files:
+sha256  bdaa479b497358151fc1166dc75a613e68321320b945e92ea07a4b6dc9a63271  LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
