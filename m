Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76010606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=miSdFv6h
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4AC405CE;
	Sun,  1 Nov 2026 21:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWjHO9FFetVl; Sun,  1 Nov 2026 21:05:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 94A894054A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793567113;
	b=deS+WXI166lIISfdTat+uyEY/RRgueV7Wl4gXeKGz6BrzaQ3Eg6rcmr1hZH35jnSR9B+
	 5fZiib5oq0LefVqE/UvF9kEMO5sYpvUynZWPQ97Q7Y71nX+PwbBRUFQlvvCQQetS00kCI
	 2LntG0/4RXxQi7a17JkXlHu+VbMFQrMHQq1JL/buJM4xY+iJD0diwPku2IEQ1ag2uTAUV
	 ib5IpJgXTGc4S9CCqqTF0hGrf3Hzt41bDtEs1SeHptYzDqoEllxhmPh8gI54q40Po3QrA
	 HT4Td0aqHEQuzQ29aGJa81w7RhANQQFwD/2xrpJriyxquoIE4idch9xXgDZILw8IQ6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793567113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ezR/etM/r22TMt7ZOuC5hw+0zn3BfQgL9O2uwhZZPwM=;
	b=YJnFzgpb5aEoBYE2grSZC5Vi4+zm+WN+RPp8fD2+g01NYDOkXAhBYgcNW4WpWNEl0OD0
	 SCzB947PNVyIlNet0O3MhGFebJw1VJiJaKOUOEsyYVrzut6Vgwc6raU6UA7ZBHIt8XZgJ
	 PZ8X2OPaZXLS5w4lg/MlqfKaMuL0WJLEALyMq2ruCvOq6SMNEy1tXCNuylPF1GBCgxWw5
	 Q/Z7xPWgfThDHkrHnpqTSFnhWfN1ANxbucf4cQ9N223GJiPTyZzzYe1FKo3388mNttqtZ
	 lqtDQFnbxKUebhWZzYT1jvfX7W0FhGIrfspjqMY+gWc1m7CFJES7P2rc98K6b2C8SxA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793567113;
	bh=ezR/etM/r22TMt7ZOuC5hw+0zn3BfQgL9O2uwhZZPwM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=miSdFv6hOcnstK199afDu/T6Mnogs+bibAQDrhE5QwDqLiac+UxNo/Tie1jO7/oUs
	 50UlMka81H/kNQptx+knV7LuAZPxlBJmrztGhieLikyJXKgsUE2jYnreeuWn0f9XYh
	 8jWASH2CUW40bYbH2yk7sFhB4LMqvnYLIbUKTgBPnI+i1t2bIkzqy5+v4Gk2eTZSnY
	 6BJ2c131FgQIIlKRaWhdEq+TA9qB1fzPmZi62CCs+MTyUkL2OHIULaksCbNGnRcT+T
	 oj1KDeEAa7XabPHyN0F+wlx0Kxt6o7GZl7iIMmALQHo22HEifEK+CUPplcaFle3X6o
	 bGi27eaypCZIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A894054A;
	Sun,  1 Nov 2026 21:05:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 640B9323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A7F04053C
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKG0qxPMrUcb for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:05:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 957C04053A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793567107;
 b=gKMv/GO3kWf9OpibuTKXygxsBJvTikl4S0iG4EZ1i2UkF5YmOfREPsyGhxR2PitMn+Qn
 anSvlASn/le62rwUBiPGfI6ie/+xseNoyIyg0DFAHvl/gSlgmykcKzMDx9xd3nvGDs+rv
 lJgAUypBDOvkf9CLyzjNJX3myFFpfUWEODMyLBabck/Ncvt0A1HEXgCmRefdkaVgd01ST
 j0RHQZKLF1859o0IdpHCuDkR/vxfOYvYmXV2q48DgrD2SLTN4lK99N+AP2KkjSf2w1Tnl
 iVw4SWDMC142FsKHFGV3qdpyQghHeo4Hip+tn1IoAjzZol/iQYRRM3xLusp/F7Dm69g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793567107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zANklU2FK9g0fPNcb1ZdGQ8NYwQLvRrePzHRadRkH/w=;
 b=KUxGzgfIdDR2HVuLdHyjerKOj31TwaPaRGQ9E1l4pVpWeuruR65ccyhrkf5DEVuZxqck
 /kcgaoT8C+Ckf4eXNqYMwT6+PpwJClfjpzN4rsa3hQx1EFFbT1J02AheANYnz9Hze5wvV
 XyaUNv9zVviua9/8yGnpkYvYY6l2ozMlOG018tc2dw0keBb19vAqPL5iehEQMcVVKWV58
 9ExT5yEq1pL/sZCpfuCVUEnCRm/ej3FKDfgcpG2yKK0LW49BGALU+YcS+/bVllhAS7U7+
 +/uozri1s05H10lrNgrwln5Sx4lufB/WkTtOA2A2Y8qSGtIQkwgrOSSQhGZK1a8eT/A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 957C04053A
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:05:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F4ED9D57F; Sun,  1 Nov 2026 21:03:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:53:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf3006e63ed800dddd92bd5243059ceda4bf5b66
X-Git-Newrev: 7cdba015059d215158b2d9a37078f78a4bd19381
X-Patchwork-Hint: ignore
Message-Id: <20261101210338.3F4ED9D57F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sshguard: bump to version 2.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7cdba015059d215158b2d9a37078f78a4bd19381
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://bitbucket.org/sshguard/sshguard/src/v2.6.0/CHANGELOG.rst

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sshguard/sshguard.hash | 4 ++--
 package/sshguard/sshguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
index 81d79e3034..f6dbc31cfc 100644
--- a/package/sshguard/sshguard.hash
+++ b/package/sshguard/sshguard.hash
@@ -1,4 +1,4 @@
-# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.5.1/sshguard-2.5.1.sha256
-sha256  997a1e0ec2b2165b4757c42f8948162eb534183946af52efc406885d97cb89fc  sshguard-2.5.1.tar.gz
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.6.0/sshguard-2.6.0.sha256
+sha256  17cf44e29ce7853bd2df1425785947a097eda1d4f87ffb03a92d4c98bae4654d  sshguard-2.6.0.tar.gz
 # Locally calculated
 sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index 4aa152bbfc..a0dce8d880 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHGUARD_VERSION = 2.5.1
+SSHGUARD_VERSION = 2.6.0
 SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
 SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
 SSHGUARD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
