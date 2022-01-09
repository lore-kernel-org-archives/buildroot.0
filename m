Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE98FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 921D0813EE;
	Sun,  9 Jan 2022 12:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2ntTVIOxj6m; Sun,  9 Jan 2022 12:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFCE8813B6;
	Sun,  9 Jan 2022 12:50:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D56161BF417
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D198160760
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NOesSt6jsU3 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D7EE60757
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7EF1582C0A; Sun,  9 Jan 2022 12:44:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 13:48:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c39e0abba945dcc52e2e9e70b92fc94f1c351c0b
X-Git-Newrev: f90d23112d2b9d52d2368a0a3f907ba37e2c60ce
X-Patchwork-Hint: ignore
Message-Id: <20220109124415.7EF1582C0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: set cgroups
 default-hierarchy to unified
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f90d23112d2b9d52d2368a0a3f907ba37e2c60ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the unified hierarchy, which is systemds default since v243.
The biggest holdover was docker which now supports the unified
layout.

Note that systemd will automatically fallback to hybrid if the
kernel is too old or the unified hierarchy fails for other reasons.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a2417ebe19..d7d5e5289b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -46,7 +46,7 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
-	-Ddefault-hierarchy=hybrid \
+	-Ddefault-hierarchy=unified \
 	-Didn=true \
 	-Dima=false \
 	-Dkexec-path=/usr/sbin/kexec \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
