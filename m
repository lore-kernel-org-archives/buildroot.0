Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66397C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 06:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D3CC607FD;
	Mon, 27 May 2024 06:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_FtInwg5DBU; Mon, 27 May 2024 06:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECAC26081B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECAC26081B;
	Mon, 27 May 2024 06:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005881D1876
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFEA181E43
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eikpMqtvvdh7 for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 06:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B41C181D9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B41C181D9F
 for <buildroot@buildroot.org>; Mon, 27 May 2024 06:03:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9483487635; Mon, 27 May 2024 06:03:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 07:52:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2842ea60ff262acffc56eedf9fb017bdf85ce23b
X-Git-Newrev: 20dc0f23f4df90bacfe0b78092eac833f6499f2d
X-Patchwork-Hint: ignore
Message-Id: <20240527060332.9483487635@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/shadow: fix NLS
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=20dc0f23f4df90bacfe0b78092eac833f6499f2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

NLS is an optional dependency since the addition of the package in
commit f78c5cb5cae93a9e63dad4361d78e1787759382f:

/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ../lib/.libs/libshadow.a(libshadow_la-alloc.o): in function `xcalloc':
alloc.c:(.text+0x7c): undefined reference to `libintl_gettext'

Fixes: f78c5cb5cae93a9e63dad4361d78e1787759382f
 - http://autobuild.buildroot.org/results/9f604d09745ffa1f4db3bdcfe0326c236effac0c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f82384652c0feed99dc07f08fae5ec1646d38dfc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shadow/shadow.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 1e7ada6148..ce17ffc7a7 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -10,6 +10,8 @@ SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
 SHADOW_LICENSE_FILES = COPYING
 SHADOW_CPE_ID_VENDOR = debian
+SHADOW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+SHADOW_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 SHADOW_CONF_OPTS = \
 	--disable-man \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
