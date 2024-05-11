Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB63C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D40C640497;
	Sat, 11 May 2024 20:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXi-XhwPP8I0; Sat, 11 May 2024 20:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B6C240B62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B6C240B62;
	Sat, 11 May 2024 20:50:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4763F1BF867
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3054B4219D
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYutoDvw45UK for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA4142177
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FA4142177
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:50:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2742986FF7; Sat, 11 May 2024 20:50:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:49:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76e473154ddf838f93829bd22485cca412c03d87
X-Git-Newrev: 1c7f6a44579a4defc5126528bc4f93c99d14d104
X-Patchwork-Hint: ignore
Message-Id: <20240511205019.2742986FF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_14 blind option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c7f6a44579a4defc5126528bc4f93c99d14d104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to add gcc 14 support in follow-up commits, introduce
BR2_TOOLCHAIN_GCC_AT_LEAST_13 symbol.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 944e573f82..655f1a53dc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -795,10 +795,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "14"	if BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	default "12"	if BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	default "11"	if BR2_TOOLCHAIN_GCC_AT_LEAST_11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
