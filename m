Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8982CC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC178210A;
	Mon,  1 May 2023 07:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC178210A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBSAl3uhLMSk; Mon,  1 May 2023 07:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C68B82116;
	Mon,  1 May 2023 07:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C68B82116
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5129B1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29446417A5
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29446417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ktRB--w9WoC for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:36:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4460041675
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4460041675
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3282184701; Mon,  1 May 2023 07:36:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 09:28:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1e0e7276ca246385d7f31d2db8331f52ce34228
X-Git-Newrev: 272bfb4cabe70e4251650f9fa27124c189eb835e
X-Patchwork-Hint: ignore
Message-Id: <20230501073635.3282184701@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: add missing binutils
 2.36.x entry
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

commit: https://git.buildroot.net/buildroot/commit/?id=272bfb4cabe70e4251650f9fa27124c189eb835e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] removed binutils 2.36.1 but forgot to add the legacy
entry.

[1] d08639e6b9e5b687c21c35041bb60a941fc7edb4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 366b9d6949..bce780e26e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -334,6 +334,12 @@ config BR2_PACKAGE_USBREDIR_SERVER
 
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
