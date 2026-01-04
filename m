Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3ECC2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FFD9405E6;
	Sun,  4 Jan 2026 13:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHeiGkqGXTMb; Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A54BF4059B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767531997;
	bh=82YtCzTqfcYQV8fod8XFN1ECiTRdy8OBxP4e3hJ6TKI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TWCuN6l/mpLPKF4UHzDZ/7pBlV3izy/SU/CWnOEe5uNybKTI2inlFTbsvfoZZZLk+
	 6Ghdp3zCUCxG1i0kMH2UoDFBgx5yJO5oIdI3mrc2CLak6J04jkE8gh3V0bifbaEDVN
	 FdgMtMQtmtK3cm+3izFQYUeI9uZgouFajsvM5LFghihdAeIbK3VcH3uORZuR02jxEd
	 RDNu95ziGYM637csPvgcJ7jM0y6ygNdJAGu+XDs6QjbZivrt0tCJiQtC4xZ5UVMoDr
	 7XvhMfLnJaOvWHQHJYdM9z/QgJJzLlXX0yKUhlZnwvdp0ibr3+/Fo0NzPnixwDxVlB
	 6gdKg+01oNFmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A54BF4059B;
	Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB34D2DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDAB74031B
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcH5jb2dLzwA for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3092D4025C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3092D4025C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A58888245; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cead19ec2fcba0bbd56f9849ca2161537d3c9b0
X-Git-Newrev: 3b84ec3ee24d0000be339b66b1f1f93735d8757f
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.2A58888245@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4-contrib: fix Config.in
 comments
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b84ec3ee24d0000be339b66b1f1f93735d8757f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comments saying that dnn_objdetect and dnn_superres need a glibc
or musl toolchain should be shown when a uClibc toolchain is selected,
not when a toolchain NOT using uClibc is selected (as this is exactly
what's needed).

Fixes: a2e01b23fc441a4be4416e68d91e331e00db3bbd ("package/opencv-contrib: propagate opencv4 dependencies")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencv4-contrib/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index d992c6d1ac..ad61c3fbe8 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -84,7 +84,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 
 comment "dnn_objdetect needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
@@ -97,7 +97,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 
 comment "dnn_superres needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 	bool "dnns_easily_fooled"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
