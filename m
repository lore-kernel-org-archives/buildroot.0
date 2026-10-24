Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA5606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C5kGkdqy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F71640655;
	Sat, 24 Oct 2026 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPzJ-1uP4rW4; Sat, 24 Oct 2026 21:15:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A22F40689
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876538;
	b=aUUnS9QZKRdgjJO3CpqzgZofR+iQbKIcAtflgPFJA39+lO0zy4BmbJYfgW/Rr8lmdKm+
	 D4M8zkNnFSUd11dPBFX6x6Gs3nxtBIrMf/mdA0RZr5K9HZOl/TEPhLIRvPloDQY0gk/t/
	 xDURcyFBzWYFaAPILpGUfVNAQtbQRksXmrVJMOfM6TP4pEzrkju8Lquj0ekQLhYtXza27
	 +sckywxt0RjqCbK2vUdDzKLVaKQLQgu/SrU9PWWrp/72wdL30A2JQxHtBdRLv9sdPn2xG
	 eZihRPvA9duEGNBOSce+i3m/wfEZTYvt+vfoVFWiLz9XUzzqtzOoL43vSV5kHHcj4dQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876538;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZlfjIqhQcpHndxm2shdYtNwgweFKiccozrAixtxxOw0=;
	b=LKHSIeZos40K9WoUBrIhYrMde0e5yMz0T3BX5txd1fP4YUyZ9xiSGa4BLv/MvNAmthba
	 YQD8ehp0m8I+W5p5FfkXkfjkzVDz/oMkbkBfb17YEAYjlKvnLDAHriiCpXGu1NZJS553B
	 aaSfGanY3d6Xw3WkMZX1IE3vQVEQ4oZqS+CypEGOw7lfoSdX79Yn7W68988tO4xBhV/XT
	 7A7tmDZd2XhpNITMJTlr+GIQGVXAOqoYp0pBlKexdkOLFJmhvKP1ZhhM4apzaCsrej8X/
	 LE/is5sLIyVmR77U8wzZEWfr/MKRS4zmKVq4ewiKCodZT4/Vz/zDhDSXkON9SY7Dn5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876538;
	bh=ZlfjIqhQcpHndxm2shdYtNwgweFKiccozrAixtxxOw0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C5kGkdqyW8gN0xCp9P7GsE+suAxX/2JfvH45i19swCVBttmGzZJPOwBwxNYMK87ki
	 IwJRv8lJFXbufQOO6Sb2AB9LfaIGy4s+7Cf0aTPXBKWZ5JyYR/oge0+J6/VKC2AiB1
	 ABBaQddi5XYgZxKcy/bw4FptD2YDVXKcQwFPPgpj+VlPr2vk/Jz0a2tEFru2EjIUX0
	 0RJ/bXqevUP07DQeVLzFGWiI7LP74h8d79G1A8OTNJWDQqsOZtHtogsRlmqZbF9NYr
	 O7hN/4xAh/Ty51tByqfOQj8ndbgWGcpSnNKGas2129SkcGuZEQJzEFYDIL8v9A++FD
	 0x6ublbUMLJ6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A22F40689;
	Sat, 24 Oct 2026 21:15:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C78D32F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C462E40689
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZ2vqZxphoKG for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:15:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 22C4C40655
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876534;
 b=oNgUbpPk9GPTABqyWAAxwVfLe/cnTGNQUOQBeXKu3QFZtTwMt4KL2QdMGt2q6Q9vnI0c
 3vxc+2RJ5qOCh8T7EyjyLGzfoqrxin1TYCjwvSerfwbm3DBOwsZrnBLCVDWhVZHqBaERq
 zEpzlRH/FY5SWgu0Ds4Ktmvyrfe52I9RedDJ325vgqDhWIeYjKuh4APDNcxrD+de+zoH9
 jGQhD93xMBLoVsx0GHQliGw7hKuHDV2MbVCV6Q2uZiRzgbVdiCdFxXSLRjkHmHyUgcbeE
 /PYBhbqFEz1ynmZWotshs9TPLNjZGjUVA+AhmXI+fCw5O3F75te9nQHOcQt1DIWkO2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876534;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oBtpJsQfzJnRQmUZWZmdnIXIj53BMvlFwQk0lr4+yO8=;
 b=mfjkMxSgcjiCxKOUiBQVk38ZSTs85NfT78TBOGSQwI4+9tWzajNg2zYAaWxXTAB5i1d0
 EODsY65Juvz+7GLSo6y+Paj5ceD9ZEqHji7lK8yfMwh0bIV6KqQux4liq/zlgL0RSpytf
 Y4ydK5pwIxFN9gsLvUfyc0EvEiIy5guwn0pCySZpNBNOO4SSjCVng1tjDMvH5oYZj6ejw
 uC9kMZKC3pQxiciEgMHNmQ5ZnUUhnm/vDaW7qdkxOWv8b6VgntVmNpFzGvNupQaDWEsq8
 Dhv5/v7YHVF4EIHfCgj7rMM9mLrULv6iK7VkEPwjRjOpJJL2RtwkNRCQyz4yygsnpkg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22C4C40655
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:15:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC2769CD79; Sat, 24 Oct 2026 21:14:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:10:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dbceeb7e67a99cbe2200aec3147bbc1f3bc4582
X-Git-Newrev: 5bba532f22db45b7b3807e139ff78cb52349ae52
X-Patchwork-Hint: ignore
Message-Id: <20261024211408.EC2769CD79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20261019
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
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5bba532f22db45b7b3807e139ff78cb52349ae52
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updated the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 4c9ac0f141..52397aaf09 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  f80dcb757a623deda62200c08e0e1a88c76fb6b54964f31b35fa74da1c90ccc5  linux-firmware-20260916.tar.xz
+sha256  a10d1ab5baf2c74ba92e8c7cf313e691696c26bddfa6df00db795e48d70cd4ca  linux-firmware-20261019.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENSES/LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSES/LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSES/LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSES/LICENSE.sdma_firmware
-sha256  9350832c1e9afc35df50fa8b9793b31d60d78ef963152eec903fc0dbc6b4a559  WHENCE
+sha256  0dd59e46f1e5d33d112236b17cb6de9d8f46fbf8fd09685cb474eb70a55f4da1  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  LICENSES/NOTICE.qcom
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENSES/LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSES/LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 50c84082ea..86c6402cb1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260916
+LINUX_FIRMWARE_VERSION = 20261019
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
