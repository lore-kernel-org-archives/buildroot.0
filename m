Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4AFEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3900D421C1;
	Fri, 28 Jul 2023 20:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3900D421C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FC-01pRjDWDy; Fri, 28 Jul 2023 20:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAEE0418BA;
	Fri, 28 Jul 2023 20:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAEE0418BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 635BE1BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7083341511
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7083341511
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwnLXX8uPACF for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F139413A3
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F139413A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1533583940; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:04:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d4b54bb62d210327c7b5dfe5040590fb2657ae6
X-Git-Newrev: 8d9557fd1a41967d355da4e14378fb7c81a58515
X-Patchwork-Hint: ignore
Message-Id: <20230728200820.1533583940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_13 blind option
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d9557fd1a41967d355da4e14378fb7c81a58515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to add gcc 13 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_13 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2479128cab..a142d27231 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -752,10 +752,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	default "12"	if BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	default "11"	if BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	default "10"	if BR2_TOOLCHAIN_GCC_AT_LEAST_10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
