Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD5FC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BB2240373;
	Tue,  6 Aug 2024 15:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nF8SWlVDM4H; Tue,  6 Aug 2024 15:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93A0A4052E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93A0A4052E;
	Tue,  6 Aug 2024 15:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E8EA1BF3BF
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28F09606B4
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AElhNU3t9fkD for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59105606B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59105606B3
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:04:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41416841DB; Tue,  6 Aug 2024 15:04:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 17:04:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3a7e673de82adbd324b23cc90ffb09923eb9956
X-Git-Newrev: 7c11f0b3a6eb11f32b82f8478f74d423f15ecf39
X-Patchwork-Hint: ignore
Message-Id: <20240806150428.41416841DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libressl: disable asm for
 mips64/mips64el
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c11f0b3a6eb11f32b82f8478f74d423f15ecf39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LibreSSL fails in the same way as powerpc, so disable
asm too for these architectures.

Fixes:
 - http://autobuild.buildroot.net/results/788/7883ffe9ed96f38f9ca359e99a18a548b6f35c24/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libressl/libressl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 5a78ec839a..7e92ea3a11 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -14,7 +14,7 @@ LIBRESSL_CONF_OPTS = -DLIBRESSL_TESTS=OFF -DOPENSSLDIR="/etc/ssl"
 
 # Otherwise fails to build with undefined reference to
 # `bn_mul_add_words'
-ifeq ($(BR2_powerpc),y)
+ifeq ($(BR2_powerpc)$(BR2_mips64)$(BR2_mips64el),y)
 LIBRESSL_CONF_OPTS += -DENABLE_ASM=OFF
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
