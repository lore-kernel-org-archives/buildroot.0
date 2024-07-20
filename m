Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1702C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 904B040549;
	Sat, 20 Jul 2024 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDIrtHEMXd-h; Sat, 20 Jul 2024 21:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AAA6405E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AAA6405E7;
	Sat, 20 Jul 2024 21:10:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 298DB1BF868
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D2680BDE
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsJSZuIiKgXe for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 659FC80BCC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 659FC80BCC
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53BF186EB6; Sat, 20 Jul 2024 21:10:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:10:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b409766234a3aabb33918b935b58704822345e9e
X-Git-Newrev: 124087c51c6bf751b0caa5cd6327f7ce3d89d0e1
X-Patchwork-Hint: ignore
Message-Id: <20240720211034.53BF186EB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edid-decode: switch to
 meson-package
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

commit: https://git.buildroot.net/buildroot/commit/?id=124087c51c6bf751b0caa5cd6327f7ce3d89d0e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to meson-package to fix the following build failure raised since
bump to 6f117a8 in commit 4f5790116b42768bd1bd982245e00483440a6311 and
https://git.linuxtv.org/edid-decode.git/commit/?id=cdf81907def8658a66041a76ef2542e9a888cbed:

make[1]: *** No targets specified and no makefile found.  Stop.

Fixes: 4f5790116b42768bd1bd982245e00483440a6311
 - http://autobuild.buildroot.org/results/c569b0484dcd33f6ea88a9b6f11df5b54401db96

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edid-decode/edid-decode.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index be0c4f1a0e..3e1d861f22 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -10,14 +10,4 @@ EDID_DECODE_SITE_METHOD = git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = LICENSE
 
-define EDID_DECODE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CXXFLAGS) -std=c++11" WARN_FLAGS=
-endef
-
-define EDID_DECODE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		DESTDIR="$(TARGET_DIR)" install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
