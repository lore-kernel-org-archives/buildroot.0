Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BE8D6B6A7
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F3880BF5;
	Thu, 31 Oct 2024 12:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8N_UDYfkjp8v; Thu, 31 Oct 2024 12:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC8580BD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC8580BD8;
	Thu, 31 Oct 2024 12:46:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31486494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF9A4028B
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yaugNCIhXjc for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C90F40288
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C90F40288
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2746784EA9; Thu, 31 Oct 2024 12:46:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 13:46:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55b333029efa8b405a5687a47632617306eddedc
X-Git-Newrev: 12649662b9d7359fe7c98480c9d9ec6c5369b3d4
X-Patchwork-Hint: ignore
Message-Id: <20241031124646.2746784EA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: fix TARGET_NLS_LIBS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=12649662b9d7359fe7c98480c9d9ec6c5369b3d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When switching the build system to meson in buildroot commit
41ce1cc690b0837a1822079317bf317ddaeac17b the way TARGET_NLS_LIBS was
passed to the build system was not updated causing build errors.

Fixes:
http://autobuild.buildroot.net/results/96b/96b08078ea412b97a4719321ad0fdad4003e42c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libv4l/libv4l.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 072d7efcf3..e8bcc2bdfc 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -10,6 +10,7 @@ LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = -Ddoxygen-doc=disabled -Dqvidcap=disabled -Dv4l2-tracer=disabled
+LIBV4L_LDFLAGS = $(TARGET_LDFLAGS)
 
 # v4l-utils components have different licences, see v4l-utils.spec for details
 LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
@@ -21,7 +22,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBV4L_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
-LIBV4L_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
+LIBV4L_LDFLAGS += $(TARGET_NLS_LIBS)
 endif
 
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
