Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A02C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:54:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28BF603E7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C28BF603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 947AC40480;
	Tue,  3 Aug 2021 21:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDkPngU9bPXk; Tue,  3 Aug 2021 21:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75190404B4;
	Tue,  3 Aug 2021 21:54:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66C641BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 156AE608BF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVztDT3DCavC for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E2AD6063A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B951488523; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 12:09:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bf32928bbb03adaa6844bac159a7855c1bffeb7f
X-Git-Newrev: 8eac45e6cf59491dde4a1deac888b0db89ccd5cf
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.B951488523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: enable nios2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8eac45e6cf59491dde4a1deac888b0db89ccd5cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It turn out that gdb/gdbserver support for nios2 is available since 7.7 release, since commit [1] [2].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=a1217d97c4b0449d052fad3d2df2ab58b48f918c
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=68f5f83833e21b8c8466fe852b403b81db227ce4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gdb/Config.in      | 1 -
 package/gdb/Config.in.host | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index b1aa5e47d9..262740fc4c 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_nios2
 	depends on !BR2_or1k
 	depends on !BR2_nds32
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9ac939ec1e..07e75b2c0e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
-	depends on !BR2_nios2
 	depends on !BR2_or1k
 	depends on !BR2_riscv
 	depends on !BR2_nds32
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
