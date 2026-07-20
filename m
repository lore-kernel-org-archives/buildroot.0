Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67575C44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 20:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC1B60740;
	Mon, 20 Jul 2026 20:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oy23jrVdzu9n; Mon, 20 Jul 2026 20:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 626056072F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784578619;
	bh=EM9FSuBHuQw5cI86m3rGodVnI0SIh4WqlhzPRLs9f9Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CHr3+k90oRUreEKBkIyt5un8z2LbeE7PWAxc1NCD4DPNRRn76wiOS8mdEN6uXYhnb
	 7Bs7733NRAJI4V8OjfYo+/TTZTRZ5V1LHycO8OCUe8X9J+TXlgq/AAdG5s6CKGtdNK
	 cSe9dLgJ1WhASYXez47/PmvqzsvCie/Gc2q8v6EYDIWM7EVMYF5bELWsIVdQrzdm3G
	 CPzHtMGMBfp28IeFUZuJ7AciAV6/72IX7E8b+VaelddQHdbLyOMKPKTr4oPxdb87pD
	 CTdaL/hDsVLZqoHzbgMR4/FNizVgd5IwSy8GYprPtA3NQUs2bWhGs+RXcvMT+Ormr/
	 zRwPGJcNDOh4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 626056072F;
	Mon, 20 Jul 2026 20:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06768786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC12F80CB0
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5s8ldZu-QvWp for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 011F180CA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 011F180CA2
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3750F8907D; Mon, 20 Jul 2026 20:16:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 22:13:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbd7cb094f50b359563ef0948c1760cfa7a76f0d
X-Git-Newrev: 0c2b14a8b5537b23ad5beda705427d4943ba72e3
X-Patchwork-Hint: ignore
Message-Id: <20260720201616.3750F8907D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-broker: clarify license
 information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c2b14a8b5537b23ad5beda705427d4943ba72e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

All these bundled subprojects explicitly give "Apache-2.0 OR
LGPL-2.1-or-later" in their README.md files.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dbus-broker/dbus-broker.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 7e029879f9..869eec462b 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -10,7 +10,7 @@ DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS
 
 DBUS_BROKER_LICENSE = \
 	Apache-2.0, \
-	Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
+	Apache-2.0 or LGPL-2.1+ (bundled subprojects c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
 # For the third-party code, the licensing legal-info is inconsistent between
 # the AUTHORS and README, so keep both
 DBUS_BROKER_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
