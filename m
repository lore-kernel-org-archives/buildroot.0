Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2718CD37AE
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E7B40327;
	Tue,  3 Sep 2024 20:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBRyBbX3Vm7N; Tue,  3 Sep 2024 20:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A65764042E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A65764042E;
	Tue,  3 Sep 2024 20:41:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D15231BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF56B60687
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYlKB9l297m5 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F285560679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F285560679
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:40:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED0117F8B4; Tue,  3 Sep 2024 20:40:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:40:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a1a638f14cb3d61867e8ba7536361fc47df5289a
X-Git-Newrev: fdd9b3e24b910bdc5fb37daa01c9b0e0f3c5b54d
X-Patchwork-Hint: ignore
Message-Id: <20240903204049.ED0117F8B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/scripts/gen-bootlin-toolchains: tarballs are now xz-compressed
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdd9b3e24b910bdc5fb37daa01c9b0e0f3c5b54d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As of the 2024.05 toolchain release, the toolchain tarballs are now
xz-compressed instead of bz2-compressed. Since this script is only
meant to update to the latest toolchains, we don't really bother
supporting the older toolchains that are bz2-compressed, and we simply
assume the tarballs are xz-compressed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/gen-bootlin-toolchains | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 4344221213..ef034058e1 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -293,7 +293,7 @@ class Toolchain:
     @property
     def tarball_url(self):
         return os.path.join(BASE_URL, self.arch, "tarballs",
-                            self.fname_prefix + ".tar.bz2")
+                            self.fname_prefix + ".tar.xz")
 
     @property
     def hash_url(self):
@@ -416,7 +416,7 @@ class Toolchain:
     def gen_mk(self, f):
         f.write("ifeq ($(%s),y)\n" % self.option_name)
         f.write("TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = %s\n" % self.version)
-        f.write("TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = %s--%s--%s-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2\n" %
+        f.write("TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = %s--%s--%s-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz\n" %
                 (self.arch, self.libc, self.variant))
         f.write("TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = %s\n" %
                 os.path.join(BASE_URL, self.arch, "tarballs"))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
