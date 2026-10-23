Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852A2606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ih6tkvyu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CBAD811AA;
	Fri, 23 Oct 2026 10:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NylzwG0oUZ_c; Fri, 23 Oct 2026 10:51:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 66C0B811E5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792752708;
	b=tbBXbGcRNPspDO5srQXYrLbI0qdRvXi6/ZWS+HJQJnERmOEf/2RZIGYH7uXii5rvRA/T
	 8lnpLLpdjWOMTnnY97mJZnSrPaAf8nCCgtP1lccVZi8BW5aNQrwQY7Cb1yJTW++vBRmur
	 6uN8pGbLLIKAzJDVmy1A+wmmnTx3Df7jwlw4t2p9OOP9qTeCZsOJmOneIpcB8RTMuw5+W
	 yUc4lCx8cgM3u5UaeYxN5/K3pWwR6NhL5M3vtLVmwO3UU/Uqj0U2Np/kijpauogM4m4ov
	 JdtSQu3ZHksLvEoUUaVS5lGuZVMImdfkvcEFfkmCDgKPliwYj8+GF9WPT0Tft/NvrWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792752708;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oOuvVCLTxLGyrAnvQoSmY+CRm9+RcoxeuuXew0jZFdY=;
	b=OaTxC3P8LpGvmtRr9IcATpNuVvLN3gqMpY02vgCj3jMqcHJecsaD/yBmrClLD5qJWuup
	 g3ja5MUVhVaWJ1Om7ui6bqWxeRiPY1PbvxBtx3ORZN29Eb0hKGuOy4M1IQtKC5qkQ0usW
	 mkmDsXUWBE2wAvgV1qMdb2DOWxXRRfQzt+vcdaQZs0ph/2dq2a4BjHHBb2JI0hFhbf9TM
	 7vixTGMWNNkGZlP30t4c8i0dwhzhLEyniH0QSNkaf1T0oiGD2Ih0bdVl6tRTXp8hKtJko
	 eX8/rt6EhpXuLAVSD0ToCFpPKebXgLXzQV8Dc+ompA7q4gwPwPv/jLgP4UxttHA7JxA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792752708;
	bh=oOuvVCLTxLGyrAnvQoSmY+CRm9+RcoxeuuXew0jZFdY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ih6tkvyuK8Dw1AsRrb+Q9HiQD9f0yZH1F5TmQ+ZTB41H8jXnzHgFAube2nCa14aG+
	 8IfbTCVDF1rZAYlByCeePlFU31AlozWyQsvjmmv3r5sbOiZhO/F/hNrsUHjLhMaOGm
	 s+fLNNHPZLkGCPSgZoDTj5s4QN3ed35PIpvjEHZ1EcNa43gwzsGGoJIwHDWHSpeGml
	 Q65DaHo3swM+uMFQPzUUyVU87UrYi8biSYEDs/g7TX6ixXzHUZEzIutjD7i25X+Qy1
	 gdNu5mRujNZ+/Jzstdo35Qs84cdC4VF94rL9dNwJkv2BC49N6SooKpEVOua0vujtMh
	 QNjWJV7WSIrGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C0B811E5;
	Fri, 23 Oct 2026 10:51:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC72B3AF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE46A40903
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smHtSRwV_DvC for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:51:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 95EE140904
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792752705;
 b=Kr3QyDQEPtdkr1SQTmmPdmz21GVe1/T6xADhwjdPhDmP1EUTEZOHDa/d7lmOFAwOvkYL
 19wpvOGX06D8Hw4KTUzZ8+aylxQoAYLLLkiXbNB6u5LMHATeT3dKa8eTLlD9KlM/EevIH
 peZ8+6cDt+okCm09zELpUN+F2HzWBbDQge4F6Rc1fmj8fsYyKy/msa0/msuakGmWRpctF
 D+3f27eO97FY2ILKlf8XwOsCvstLpW4I9k1U1yqImH9oNaRu1UEpuz7cakVUL2xgKCM79
 edpts8d8leQ3Zx0p+oIgXgshndsX4ysBYUnNR3l1Par8SA0JNmD4/PU6YtkRqw6PoJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792752705;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jlhrshpiixdLkdAA7ZKjJnREuW8OUqwEuxAwsQnjO1U=;
 b=PqoaJ8igKpO7vCItoP3Mxi5Cy177dCMLfRQXLBwn3qvN6hqvJ1umQ7IG7KPCDlrIuM4Z
 bry9XgLPI7UJ7wieWmRpU/XHwT76mx8Q3bQnc+uX6VjrRCI98Yt1r48FavauIq22yepWC
 HrMNN1dr2aFBm66pYMInuYOj8+OAzcHTShhbd33HL9kHKWJp6YYJ+lqe8ajpR2LEYpvHz
 QQyGFWsPga2CZBixr2BLHNHDLsej0sUwErJXBc+qejlJ1HoqxLbL280yF28uYNA/j0P+p
 gmRTlMJbAu5O5debml2mRHqG1Kb86UCNBCqriEXJU0fyeUCeXt+VF5HrpJbZRESx2QQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95EE140904
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:51:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F1979C651; Fri, 23 Oct 2026 10:50:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:51:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a370fbaa27bdb23c5ab27846b49168b2f5856751
X-Git-Newrev: 92b2747f46673d69710f4f330adcf836c0d66294
X-Patchwork-Hint: ignore
Message-Id: <20261023105021.1F1979C651@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/parted: security bump to version
 3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92b2747f46673d69710f4f330adcf836c0d66294
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

- CVE-2026-89085
- CVE-2026-89088

Other changes in 3.7 and 3.8 include ExFAT detection support, several
libparted fixes for corrupted/unhandled disklabels and a gcc 15 build
fix. See the NEWS file for details:
https://cgit.git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.8

Drop 0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch,
which is included in this release.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...4-PATCH-parted-fix-do_version-declaration.patch | 44 ----------------------
 package/parted/parted.hash                         |  2 +-
 package/parted/parted.mk                           |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
deleted file mode 100644
index 78709e07ad..0000000000
--- a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 16343bda6ce0d41edf43f8dac368db3bbb63d271 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 12:22:22 +0000
-Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
-
-With gcc 15-20241117 compile fails with the below error, update the
-do_version declaration to match the header in command.h
-
-../../parted/parted.c: In function '_init_commands':
-../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
- 2469 |         do_version,
-      |         ^~~~~~~~~~
-      |         |
-      |         int (*)(void)
-In file included from ../../parted/parted.c:28:
-../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
-   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
-      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Brian C. Lane <bcl@redhat.com>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- parted/parted.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parted/parted.c b/parted/parted.c
-index 3abb52f..fc2aeba 100644
---- a/parted/parted.c
-+++ b/parted/parted.c
-@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
- }
- 
- static int
--do_version ()
-+do_version (PedDevice** dev, PedDisk** diskp)
- {
-     printf ("\n%s\n%s",
-             prog_name,
--- 
-2.34.1
-
diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 6643ba9fbe..9218deb39b 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612  parted-3.6.tar.xz
+sha256  a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63  parted-3.8.tar.xz
 
 # Locally calculated
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 5b55a9f21e..314bd0d3c4 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.6
+PARTED_VERSION = 3.8
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
