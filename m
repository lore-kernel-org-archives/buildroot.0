Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93232C7EE21
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 11:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4090D82206;
	Tue,  2 May 2023 11:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4090D82206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hg_vUWdOIDDC; Tue,  2 May 2023 11:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB2F821FD;
	Tue,  2 May 2023 11:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB2F821FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D84881BF40A
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 11:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF17081F28
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 11:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF17081F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJnZeFVZuQ3D for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 11:24:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08CE8821FD
 for <buildroot@buildroot.org>; Tue,  2 May 2023 11:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08CE8821FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E842785735; Tue,  2 May 2023 11:24:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 13:20:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1c15acd6bce3c528b3918f255dd75a07c4de9a2f
X-Git-Newrev: 754dc7b1b4a454b104f04eb6c29272ea3c69ea1f
X-Patchwork-Hint: ignore
Message-Id: <20230502112428.E842785735@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Config.in.legacy: add
 missing binutils 2.36.x entry
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

commit: https://git.buildroot.net/buildroot/commit/?id=754dc7b1b4a454b104f04eb6c29272ea3c69ea1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit [1] removed binutils 2.36.1 but forgot to add the legacy
entry.

[1] d08639e6b9e5b687c21c35041bb60a941fc7edb4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 272bfb4cabe70e4251650f9fa27124c189eb835e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index a31543d5fa..64419a2615 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -325,6 +325,12 @@ config BR2_PACKAGE_USBREDIR_SERVER
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_BINUTILS_VERSION_2_36_X
+	bool "binutils 2.36.x has been removed"
+	select BR2_LEGACY
+	help
+	  binutils 2.36 has been removed, use a newer version.
+
 config BR2_PACKAGE_RABBITMQ_SERVER
 	bool "rabbitmq-server removed"
 	select BR2_LEGACY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
