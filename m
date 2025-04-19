Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C241C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08607066E;
	Mon, 19 May 2025 10:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1W1W5M2oMh_4; Mon, 19 May 2025 10:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EF2D70542
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF2D70542;
	Mon, 19 May 2025 10:51:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BE5BE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11CB540D64
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fC37exAtb1y0 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C372640DF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C372640DF4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C020B84BBD; Mon, 19 May 2025 10:39:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 14:56:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2bea32478d80b0aa5a8a3094734a93e94aebf94a
X-Git-Newrev: 24a41c8fb5a63cb1e2dd512368e023af73beabf8
X-Patchwork-Hint: ignore
Message-Id: <20250519103951.C020B84BBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libopenmpt: install to
 staging to fix pkg-config
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
Content-Type: multipart/mixed; boundary="===============8526643378669885431=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8526643378669885431==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=24a41c8fb5a63cb1e2dd512368e023af73beabf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Without this, packages using libopenmpt are not able to find
the dependency.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
[Julien: reword commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenmpt/libopenmpt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index 74ffbdbbd4..57c45c6ea1 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -11,6 +11,7 @@ LIBOPENMPT_LICENSE = BSD-3-Clause
 LIBOPENMPT_LICENSE_FILES = LICENSE
 LIBOPENMPT_CPE_ID_VENDOR = openmpt
 LIBOPENMPT_DEPENDENCIES = host-pkgconf
+LIBOPENMPT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBOPENMPT_OPENMPT123),y)
 LIBOPENMPT_CONF_OPTS += --enable-openmpt123

--===============8526643378669885431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8526643378669885431==--
