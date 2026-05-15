Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C00CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E4AA6160C;
	Fri, 15 May 2026 13:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYndyXO4UiIW; Fri, 15 May 2026 13:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2817461614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851830;
	bh=/OGZ45S5/N7wKkXCEVoAbRYEaDXBFGF+imXl3wUFJhU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lfGm5zdBex+jE+EfeQOEs4wHZEKJHIE3eHegbyLDJP+pW08c6w9456jePRZK6BarA
	 7a0lHDQy5Uy7F6MD6RAEuHfvQCb1FuiFJ+Xj+iYD+PGfrAgg/UuMt7w/FUmFXqZaXq
	 c13Gp4k1NCpqOjnBue/HQoBgIw2E+s9zDgq0jBT6B4yOzeR/Jyj71GYTrQIKlLpPeb
	 zqaP5jks4KYYD9TDgoWTsnMuStoO0XE86ACTxLuU5UI1BGfECXnIODTnhUG8P7kc7F
	 T9OZnBhYZZpBvnZAsi++pcZ2ttloNMMQx/Bkt79gMDpQ7Q/aiZM/emXYWwfQSq9IIh
	 6Y1VqUDO5EXlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2817461614;
	Fri, 15 May 2026 13:30:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1051736F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C617441AE2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnfxO03562aN for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE16D41B18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE16D41B18
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E0CD86354; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:59:31 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 44336bb9a790bc150bd4d22832c017c80e777dc8
X-Git-Newrev: 9da6e86831e6066690ae25c5a9e1a3a0275be6ca
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.4E0CD86354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libpjsip: enable
 parallel builds
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9da6e86831e6066690ae25c5a9e1a3a0275be6ca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Parallel builds were disabled in 2016 by buildroot commit
781ce19d746efb6a5408b4d50b30626784eff324.

In 2020 upstream added two commits which fix parallel builds
https://github.com/pjsip/pjproject/commit/ddf48e2045fa155ef5242d9d7dcec27f8c5ed873
https://github.com/pjsip/pjproject/commit/78683646c8bc670ec730a42494e075f671a08e28
to version 2.11 which was added to buildroot with commit
2c7ad667ec4a25226848baba809e492ca0ff06da.

Tested with -j100.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 3ddeb7a9d3938fd216ea8d218dd58b26b89e3bf6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpjsip/libpjsip.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 8cea8e3abc..38adeff626 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -13,7 +13,6 @@ LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_CPE_ID_VENDOR = teluu
 LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
-LIBPJSIP_MAKE = $(MAKE1)
 
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
