Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5441BF483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24C7940C69;
	Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gviqV9O-PQvE; Mon, 23 Mar 2026 19:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 486F740BFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295272;
	bh=7efdGRmi9FpXQ8n/1ulVsI1qOcAzUN71d2aetCT58iI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MDKea/gNynFGWDOWFAZqaUyHmMIUp8Ogm7Pi6jnuDY/Ui/c959HkH1V7JQbT9oo3c
	 wgAEHaTSOqML5sprQX7vzMM27Q3/umxr/C9SwK8RCsh3kT8UFiLsAbfl4Dr/JrR+kJ
	 uoqyvtceLseaMu5a28YGNogis/zM72/XjMShIa+qYn3eVrQJqCd96CsjxJH6ppJrkU
	 fVouNXYdwU+Nox/krQidm0kxZyHgNIBYmOY71+o48bA6Vut7An0M2e7GBVaa5/nS/4
	 1SzY/Z+8tO6iTKQdTAwrxCw2bvyZPoVKH6F28iE//YatVMqZ8Mc/MfQLGWryE65MyS
	 hSzOEMg7Fi3DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486F740BFB;
	Mon, 23 Mar 2026 19:47:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DA5FF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E04C182202
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMPDF3SgEfXX for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF7D821C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBF7D821C6
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1677A84C53; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:56:24 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d31d4f2b69031f5d035bdf4edac81892b22baba9
X-Git-Newrev: 87d2b48decd0feeabce7e220b5b79fd61d5f2316
X-Patchwork-Hint: ignore
Message-Id: <20260323194729.1677A84C53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing:
 test_xfsprogs: use bootlin toolchain, update kernel
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87d2b48decd0feeabce7e220b5b79fd61d5f2316
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

This commit updates the test configuration to switch to a Bootlin
external toolchain. This is needed to get newer toolchain kernel
headers required by newer xfsprogs versions.

xfsprogs upstream commit [1] (included in v6.15) introduced a usage
of the "capacity" field of zoned block devices, introduced in Kernel
commit [2], first included in v5.9.

This commit also updates the runtime test Kernel version
to the LTS 6.18.18. This is because the default filesystem options
of mkfs.xfs were updated in upstream commit [3] to include new
features supported in the new Kernel 6.18.y LTS series. The commit [3]
is included in xfsprogs v6.18.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=48ccc2459039309cfbaf358febea53a86f07827c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=82394db7383d33641f3f565bd79792fb41b1741f
[3] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=54aad16b4b9b923442b4042afaba4438ca1aa868

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit c03712d8ec3fcffadb9486084c1e92e4736059b0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_xfsprogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_xfsprogs.py b/support/testing/tests/package/test_xfsprogs.py
index a3a4bd27d8..03191aa22b 100644
--- a/support/testing/tests/package/test_xfsprogs.py
+++ b/support/testing/tests/package/test_xfsprogs.py
@@ -12,10 +12,11 @@ class TestXfsProgs(infra.basetest.BRTest):
         f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.37"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
