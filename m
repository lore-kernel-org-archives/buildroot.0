Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3480BE9539A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD1C81CE3;
	Wed,  4 Feb 2026 13:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaaeWLrnAAqF; Wed,  4 Feb 2026 13:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED61181E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770210523;
	bh=DLVCaBIEp6LV+wsbu5NDbYM8IJmfcErb0YYfE8VkOp0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kuiYxYav7s9L6OqIkEMUf7rk3CEPFgIZAlKAtHZIV05iN0CvJYr5w3IFWSLs8xYna
	 aTmZN00jJzbpVv9R19imqcrNVDroLYO3/JSCtCBjCwVGn5heti9ahuvf4mv+vJMgf3
	 NVYcEWGq+I7eTTTZNA2/kIGXqH6xdrA3XZKCxnve/D2waLi5ey5/y9WctcUnLy9Efi
	 Wew89j08mMMnnuCsKWHRfxtv+RbQln17Xv3aGc/KNIYGYSnf5+hGSCT6OdVs+i47g/
	 7oA7C/ghfjeqF1qto6t5ooTQ6w9tbr5Oyjg2mheElC48QVhO3GGnUOLKEwj7pfRxka
	 ecWILFw8pEi6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED61181E9B;
	Wed,  4 Feb 2026 13:08:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E65917A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E0A740363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiIUzEu1ovYV for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3474E400FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3474E400FB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:08:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20D3C868E2; Wed,  4 Feb 2026 13:08:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 14:05:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0fd48dc2651a8c60ca82bef760670b3a62ab621
X-Git-Newrev: e0b129e36e6d6b45de473bb59795001fddfcc0cc
X-Patchwork-Hint: ignore
Message-Id: <20260204130839.20D3C868E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libite: add dependency on MMU,
 requires fork()
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e0b129e36e6d6b45de473bb59795001fddfcc0cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Unfortunately, parts of the library is not very no-MMU friendly atm.
The below check fails due to runbg.c requiring fork().

$ ./utils/test-pkg -c libite.config -p libite
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: FAILED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK

The dependency was introduced in libite v2.6.0, so this patch should
be backported to v2025.02.x.

Fixes:

 https://autobuild.buildroot.net/results/6c6fd2ae410a82c44da54ee13a09a38a7ab220c1/

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libite/Config.in b/package/libite/Config.in
index 80d29791db..516d1bff98 100644
--- a/package/libite/Config.in
+++ b/package/libite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBITE
 	bool "libite"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Libite is a lightweight library of frog DNA. It can be used
 	  to fill the gaps in any dinosaur project. It holds useful
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
