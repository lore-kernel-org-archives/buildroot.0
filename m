Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA03C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87DE240A2F;
	Wed,  9 Jul 2025 19:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiJZ30EMx1TJ; Wed,  9 Jul 2025 19:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92DC4095A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92DC4095A;
	Wed,  9 Jul 2025 19:07:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E92212E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E962960AFB
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAEEI9zZNUr4 for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4634260B06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4634260B06
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36AF58630A; Wed,  9 Jul 2025 19:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Jul 2025 21:04:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d170a1c94599385513566812673c05b4e844d7a
X-Git-Newrev: e0dcb7ba02ca1f1eea721b9b136cc987d113c403
X-Patchwork-Hint: ignore
Message-Id: <20250709190702.36AF58630A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-abrmd: install D-Bus policy
 to /usr/share, not /etc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e0dcb7ba02ca1f1eea721b9b136cc987d113c403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Default policies should go to /usr/share, /etc should be used to
override them locally if needed.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 2bb0ebbbb5..a4e7645374 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -14,7 +14,8 @@ TPM2_ABRMD_DEPENDENCIES = libglib2 tpm2-tss host-pkgconf
 TPM2_ABRMD_CONF_OPTS = \
 	--disable-defaultflags \
 	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
-	--with-udevrulesdir=$(if $(BR2_PACKAGE_HAS_UDEV),/usr/lib/udev/rules.d,no)
+	--with-udevrulesdir=$(if $(BR2_PACKAGE_HAS_UDEV),/usr/lib/udev/rules.d,no) \
+	--with-dbuspolicydir=/usr/share/dbus-1/system.d
 
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_ABRMD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
