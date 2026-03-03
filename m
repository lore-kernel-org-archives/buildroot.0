Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFC0EDEBF0
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE3B240657;
	Tue,  3 Mar 2026 21:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-xZfY3ClvmZ; Tue,  3 Mar 2026 21:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E722D40668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772572062;
	bh=bz7uJQSVgG/dPVJPN6BRZVgXQYHz4j9PtaFmBA/NFlQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MbmXZrlMLHfOdEwEKwBXVdxyp//i2gw+C13Y0+LsQpcbW0TCv6Prnb2Bka+m0oz7x
	 GWcvk35AQDOXO60yccuo5QdUHXE46FqZZofh6NUu/pK3X3c7bVCRji/SUcSjL/eK64
	 FXWd49gIQm6g7vWLACQxZnYw2q8mMNikticbv+WK8hbHNV8X11PK1s1x5ERciPVVlp
	 U4RRvJ1n5hx0sduWW/fANS+j7R21cu+oswZ6PiD/la9PHA0J/DaYhxDTmjmgLdStw9
	 456bvT0CUfxvhkwu1oRolVfGHwsMfpC5u6Vt8nmBJo9/oxIu6zfQ/hd6XjNL71mKuE
	 Vo89I60jkDrkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E722D40668;
	Tue,  3 Mar 2026 21:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF17025B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D513B8117A
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuAc25hRBa-2 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 21:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BE06811AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BE06811AB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 21:07:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 330F2860A2; Tue,  3 Mar 2026 21:07:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 22:05:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38486b310dbea25067408afa2e53fa9db0757a9b
X-Git-Newrev: 64083817deddf7bda0cc4cb47adf08c82a13d51f
X-Patchwork-Hint: ignore
Message-Id: <20260303210739.330F2860A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx/arm-trusted-firmware.hash:
 add license file hashes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64083817deddf7bda0cc4cb47adf08c82a13d51f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that custom arm-trusted-firmware versions can specify license files, add
license file hashes for the Xilinx custom arm-trusted-firmware version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 429f610a56..88e212d76d 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256  ea59fbfb702857a24f96ee8e9cf04f997942db1de98f8406b7daf9dcc8f4e9ea  xlnx_rebase_v2.12_2025.2.tar.gz
+
+# Locally calculated
+sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
