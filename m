Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0BFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 20:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 333DE8242D;
	Wed, 30 Mar 2022 20:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW3vu-v0SCNn; Wed, 30 Mar 2022 20:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5005B818A1;
	Wed, 30 Mar 2022 20:08:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7101BF42D
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 20:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 390EE4058F
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 20:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jD7F0PSrw2cZ for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 20:08:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E85C4049E
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 20:08:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D7AB585FE1; Wed, 30 Mar 2022 19:59:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 21:43:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 43fd3fd836d142a7c5d16c8b25366d59bdb6d8fc
X-Git-Newrev: c2f706a26074f701c0205b4e92263cce32990cce
X-Patchwork-Hint: ignore
Message-Id: <20220330195929.D7AB585FE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkcs11-helper:
 fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2f706a26074f701c0205b4e92263cce32990cce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure without threads and openvpn raised since
commit 0199dc161769e5f28e9aebc634230ece08ff5008:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'

Fixes:
 - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d76b7564f1bb61762181ecd1fc69c72a925ed25c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...kcs11h-core.c-fix-build-without-slotevent.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
new file mode 100644
index 0000000000..5b2829c5ca
--- /dev/null
+++ b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
@@ -0,0 +1,37 @@
+From 754911f553414a77d5b52001f5ef6e3a1314c4d5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 20 Mar 2022 08:50:15 +0100
+Subject: [PATCH] lib/pkcs11h-core.c: fix build without slotevent
+
+Fix the following build failure with --disable-slotevent:
+
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OpenSC/pkcs11-helper/pull/50]
+---
+ lib/pkcs11h-core.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/pkcs11h-core.c b/lib/pkcs11h-core.c
+index d7bb4cd..0bf11e8 100644
+--- a/lib/pkcs11h-core.c
++++ b/lib/pkcs11h-core.c
+@@ -726,9 +726,11 @@ pkcs11h_setProperty (
+ 
+ 	switch (property) {
+ 		case PKCS11H_PROPERTY_SLOT_EVENT_HOOK:
++#if defined(ENABLE_PKCS11H_SLOTEVENT)
+ 			if ((rv = _pkcs11h_slotevent_init ()) != CKR_OK) {
+ 				goto cleanup;
+ 			}
++#endif
+ 		break;
+ 	}
+ cleanup:
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
