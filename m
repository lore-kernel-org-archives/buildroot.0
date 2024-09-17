Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9B3CAC5A3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 665916070F;
	Tue, 17 Sep 2024 21:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psoN6PXWJ9kT; Tue, 17 Sep 2024 21:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18989614F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18989614F0;
	Tue, 17 Sep 2024 21:09:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE5FD1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6130F81E19
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1_QyczdgRiZ for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D43781E1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D43781E1B
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89DE681DB5; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 23:05:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a404097dd007d01d22098dd13a7bf5025cffd9cb
X-Git-Newrev: 93ff1abc9ac423eb71840b6c5b4dc68a56d283bf
X-Patchwork-Hint: ignore
Message-Id: <20240917210908.89DE681DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/asterisk: fix
 compile issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=93ff1abc9ac423eb71840b6c5b4dc68a56d283bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix a compile issue when libyuv and libjpeg is enabled.
Detection of following function fails:
checking for pjsip_dlg_create_uas_and_inc_lock in -lpjsip... no

In config.log you see that libjpeg is missing.

Fixes:
 http://autobuild.buildroot.net/results/7bed9fc68fc9331ad12942c3eab9742ee8a7a4c4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 07b7d8708d0c8302ad5407acf81df974050f0f5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 33d2e78bcf..c37aa5ec9d 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -113,9 +113,15 @@ ASTERISK_CONF_ENV = \
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-ASTERISK_CONF_ENV += LIBS="-latomic"
+ASTERISK_LIBS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_LIBYUV)$(BR2_PACKAGE_JPEG),yy)
+ASTERISK_LIBS += -ljpeg
+endif
+
+ASTERISK_CONF_ENV += LIBS="$(ASTERISK_LIBS)"
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ASTERISK_CONF_OPTS += --with-execinfo
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
