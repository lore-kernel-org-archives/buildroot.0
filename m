Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BC8606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eAkseRIh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 212C581281;
	Fri,  6 Nov 2026 16:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfLJDxJUxNPh; Fri,  6 Nov 2026 16:08:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 44B0C81231
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981293;
	b=bZQBWAWNJ5p2s/omgGTdTfMqLiJZxFEwfGYCXWgePbI6c2E4KaRqcczeb3WxANoqE6qY
	 nBofhwl9Swl4FNbzHkFZAWOn38Y5z6afoRCxrPlZhSBeUKMDcHHL+AnyPOcmsGeK1q2a5
	 oKXCT7lkikE9/HGIO2yeJKYTIUyTkubn9qzdRNELPRCfoFAYidl6tCuyASXaOE8lIJ44a
	 0mg9Pnwssb/wAvojXoipupZaR8A3FS/AMsig9TT6RkFMxAAEpakZmeVuuGHF22ZTpIMbI
	 nq2EfQ006T/MU5h+81QnqAs+sGYGJz1gpoHe/qW0Xjw1hXFUbAuMkO5cpKxxLIlcg9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8RmI0FhNey/SaE+ro4VcBrKg0PoSznGF0VR/L01e3hk=;
	b=LfalKN0I05i2eVkuRd8ZyTGiHG1Rj5Xd7Rs6rNdlICSTWpk6A8fCUA3XTzAcHaIEHHqj
	 qwmwUMjWitNfFrlrrB4I9d6+XSiaAFQjgwKaqkD8jNvCwmO1NjgLh4Q5PpNKerPIJ2pIv
	 WBKcwa+3a1JNyVCUdvv2TuTWBTCHVBVjyMjXZ+lbHPfkj56QqOFHpBkJ81luqMKDx0SA/
	 cn4kAKkQpuUxom4VBjqDnaatBp2j7Sb1Y6XD/4wZEUbqTywhbwv4vklrYefb7ouHUIjsX
	 gm1bsLsd8Fl6NvCupFWv/bUMKZ6/laiU3aq7u0EFPOqXMWLCEEiqzTWjE4kscStbsWw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981293;
	bh=8RmI0FhNey/SaE+ro4VcBrKg0PoSznGF0VR/L01e3hk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eAkseRIhGOs7gmNE4ejVzGz6JruAzedQArAyd/SXU2dthhE10vRh3kLL2KX2zMmFZ
	 WkV4uMBG+7M/DJKZ9WPjhP830eYMzunLX0QyYCqta26dRitEY3kqeivz2Rnpc2xjcp
	 uNUc8MCVHD2ULWDRVSTDg3SdU4vVbfoSYTsJFDAIQtfG933ZOqzq6VoJfO3Y1pX635
	 6xIEG5iz9oMSABdL6d66NgJdt3fZS/H9T4rXvJvrFsq+dSE/b7kMkzZKOhOeJQLEn7
	 73Ta6dqg0jCd2V9uU2aY9GtdI3V0+qlI3HBdy+3TgiaPZLhlZOqSMJyvWN1pLls9l0
	 TEjEalJ4KelNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44B0C81231;
	Fri,  6 Nov 2026 16:08:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 454C62E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36E1B40911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gU4dSLek7v5R for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6F97B4090B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F97B4090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A41199E09B; Fri,  6 Nov 2026 16:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 11:27:18 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ef539c6523406c1a1f11e53dd7b2a65068473c80
X-Git-Newrev: 784fd9c091a928154d18fb97b1159f50fa176bee
X-Patchwork-Hint: ignore
Message-Id: <20261106160639.A41199E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 support/scripts/gen-bootlin-toolchains: fix ARMv7 EABIhf toolchains
 condition
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/784fd9c091a928154d18fb97b1159f50fa176bee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The ARMv7 EABIhf toolchains can currently be selected with ARMv8 cores
selected, even when EABI is used due to how the condition is
constructed. This obviously fails as those toolchains are EABIhf,
causing the following build issue:

Incorrect ABI setting: EABI selected, but toolchain is incompatible

This is for example what happens with:

BR2_arm=y
BR2_cortex_a32=y
BR2_ARM_EABI=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE=y

In order to address this, we adjust the script generating the Bootlin
toolchain package so that EABIhf is required for both ARMv7 and
ARMv8.

Please note that we already require BR2_arm for those toolchains, so
we are *only* talking about ARMv8 cores being used in 32-bit mode.

This will be needed to fix:

  https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 43a8c35a383e53cc81ef4b56d346a5501178d7f8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/gen-bootlin-toolchains | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 4579949d18..ee64a86902 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -53,12 +53,12 @@ arches = {
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_arm', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_arm', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armebv7-eabihf': {
-        'conditions': ['BR2_armeb', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_armeb', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_armeb', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'armeb',
     },
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
