Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F9C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B91741622;
	Fri, 16 Sep 2022 11:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B91741622
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fm6uYLsysIdu; Fri, 16 Sep 2022 11:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A4D141620;
	Fri, 16 Sep 2022 11:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4D141620
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 256F41C2745
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0162461228
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0162461228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFI_L1pv8nr3 for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 255B960C07
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 255B960C07
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1425983CC8; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:17:59 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 860d907ebc6c4082d8d7a109b31e97fc62750fd4
X-Git-Newrev: c120ba667ad0d34d82889c5beb9a8100694b0b00
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.1425983CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/kvm-unit-tests:
 do not use "select...if SYMBOL=y"
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

commit: https://git.buildroot.net/buildroot/commit/?id=c120ba667ad0d34d82889c5beb9a8100694b0b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

All other occurrencies in the tree simply do:
select SYMBOL1 if SYMBOL2
instead of
select SYMBOL1 if SYMBOL2=y

So do the same here for consistency.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b60c17e9bedec84dcc1ee1da9aef9c7ce0fce875)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvm-unit-tests/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 7658877ce9..02ea8dd58c 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# x86-64 we use the host gcc (see .mk file for details)
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
 	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
-	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
 	  suggests, it's purpose is to provide unit tests for KVM. The
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
