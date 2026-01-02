Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11026D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB04D40C65;
	Wed,  7 Jan 2026 18:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1suD9kEyTwU; Wed,  7 Jan 2026 18:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED4E940FF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808891;
	bh=8c2SZTXat1EaM+jJRhQqjlJUu3zNphQWrlba95TrKP8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NempQd2zUcsouHG1uZxIs4+YjS96rdBkD0kPCmf85kgu1U94HWVrCiOswTCHhdDKc
	 MzWKyscxe89VdAj3aXCeQnbz+ySrN4yoi9YTjh2k10uHF3TFd+KTajhTejHdvacNQV
	 f9/UwaNiGoSNTCgkDDo9JdNKIbLe9vLUIiwMC1T7mlpT3ff9ifcHs8FK6oLBX06r0e
	 wEG44l/eKVDlCy+1hXGUgiJB8vKca9WZFF1h7fDTqtra8drH9UaX1pu5M0zGs4s4io
	 FpBQEwAk1SFKCGyiLf6hC+X5jBsrfgxGLiw2i7JTsdo2wweJbwpzdh7h4n8MR6/tho
	 tD7o1y8R2oA5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED4E940FF2;
	Wed,  7 Jan 2026 18:01:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25BE825B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E208840A3C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeFKJ5PLTpoU for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C5540A00
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42C5540A00
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FD9A87C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:22:21 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7b000714da3b197de1385325ab5831aa4e6cd796
X-Git-Newrev: aed6e63fb8e58e47bf001184f77f36d44ee96c5e
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.3FD9A87C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rtl8821cu: bump
 to version 2025-12-14
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

commit: https://git.buildroot.net/buildroot/commit/?id=aed6e63fb8e58e47bf001184f77f36d44ee96c5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

With this commit it builds with Linux 6.18

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7b22fcfefffcda4d839a8c10151c5dffdfef0e8d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index b9869303de..5ff86f439c 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e7fc5b598b81006fb07a5a3534aa4288cb387ed531c71f3734e55e6cae729b0  rtl8821cu-3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae.tar.gz
+sha256  c471f8a73efb5985b4e880e40de439ac8837241c74d3b7f8cc06a1bbfcc85075  rtl8821cu-7f63a9da2e8ed83403f6f920e9b1628a37b38ef4.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index e1ef396110..45d1da3750 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae
+RTL8821CU_VERSION = 7f63a9da2e8ed83403f6f920e9b1628a37b38ef4
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
