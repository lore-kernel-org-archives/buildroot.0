Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F90CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CE2F82404;
	Tue, 16 Sep 2025 20:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5fLWK4A3yRq; Tue, 16 Sep 2025 20:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C257822FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C257822FC;
	Tue, 16 Sep 2025 20:04:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FDDC12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A69B61105
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RA578ZvJH2eS for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C451561114
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C451561114
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B45B7849AE; Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:00:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afff65c340594e9cdf73774db8cfb5b4220c5ed2
X-Git-Newrev: 4b14018a38d1f37f6200a2d8ee088a381622835b
X-Patchwork-Hint: ignore
Message-Id: <20250916200429.B45B7849AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/boot-wrapper-aarch64: add hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b14018a38d1f37f6200a2d8ee088a381622835b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since boot-wrapper-aarch64 introduction in commit [1]
"boot-wrapper-aarch64: new package", the package never received a hash
file. This commit adds it, including the source archive and license
hashes.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/7689b72e00fd4d8c017880004e83a1c79144ab7b

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
