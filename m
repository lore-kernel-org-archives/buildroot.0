Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B25C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B801581370;
	Fri, 21 Aug 2026 15:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYx4Jo-V_Eu6; Fri, 21 Aug 2026 15:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324893;
	bh=STxuxUxBt4hvQJWBET7F9D4Ku8POG/Qs3Z7tI9QayMk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VvlofAKz+rITvRoH8kmEg2WJMU44lWaktqjlbS/peVTMDNsuUizBLo7+VYrwa32rF
	 Mhx66Poznhc6hB4eCiWfD9O9I5awkct9Xd+s11zbAHomq104lbM97D1dSCG0yfLvOs
	 DNwfwQHyanX7Qn4VlcE8V2kVWUGdlQCbHigpxT/mqFrZzOOvqIcBkzmymz9WRax22H
	 ztJ88n2Zir8XIb27xp1aXSTCl3rRy9w/wmb8QVlxX+1E+j83Oa+0kSoDa6eaexqON+
	 jPuPLQTWrrPe13IqZRuVGxIStrxNqWcNEm7CGtbd/k5hTfgWCW9/lHEW9weSp42LKH
	 OOJiZYYaYhjZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B38F81250;
	Fri, 21 Aug 2026 15:08:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14C033847
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02A91403F1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eL4ycf-Y8IM for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FB764041A
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3F0E8E0EC; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7948f1794fc1fb4fd90002e66fe59e74f0f2d4f0
X-Git-Newrev: 2dfa94ec02e8547489017e52f46b97e423248f20
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.F3F0E8E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mbedtls: fix CPE
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2dfa94ec02e8547489017e52f46b97e423248f20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

A new (and hopefully definitive) CPE is to be used for mbedtls:

cpe:2.3:a:trustedfirmware:mbed_tls:

CVEs for projects under the TrustedFirmware umbrella are now seemingly
handled under the CPE vendor "trustedfirmware"[1].

NVD correctly reports[2] the new CPE deprecates the "old" one Buildroot
was using.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/49486/comment/2fd93ed7_df27998e/ before last comment from Sandrine
[2] https://nvd.nist.gov/products/cpe/detail/453A781D-74D5-4FB5-9BB6-8C1F7F281A7A
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d2ceab1c154aeab278f50f4f1451afdacda630f4)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mbedtls/mbedtls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index e8bb0a71b9..9def876808 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -15,7 +15,7 @@ MBEDTLS_CONF_OPTS = \
 MBEDTLS_INSTALL_STAGING = YES
 MBEDTLS_LICENSE = Apache-2.0 or GPL-2.0+
 MBEDTLS_LICENSE_FILES = LICENSE
-MBEDTLS_CPE_ID_VENDOR = arm
+MBEDTLS_CPE_ID_VENDOR = trustedfirmware
 MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 
 # This is mandatory for hiawatha
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
