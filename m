Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5322C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FBC82094;
	Mon,  6 May 2024 19:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7L-8lE6bOAA3; Mon,  6 May 2024 19:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A859482095
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A859482095;
	Mon,  6 May 2024 19:28:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F14F61BF28B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE17F40B86
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfW-HV-q-1fG for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F39408CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3F39408CA
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:28:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DED12867B1; Mon,  6 May 2024 19:28:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 21:27:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffc4af650aeff6787569fa70957f8fe3c1c297b7
X-Git-Newrev: f82384652c0feed99dc07f08fae5ec1646d38dfc
X-Patchwork-Hint: ignore
Message-Id: <20240506192805.DED12867B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: fix NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f82384652c0feed99dc07f08fae5ec1646d38dfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NLS is an optional dependency since the addition of the package in
commit f78c5cb5cae93a9e63dad4361d78e1787759382f:

/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ../lib/.libs/libshadow.a(libshadow_la-alloc.o): in function `xcalloc':
alloc.c:(.text+0x7c): undefined reference to `libintl_gettext'

Fixes: f78c5cb5cae93a9e63dad4361d78e1787759382f
 - http://autobuild.buildroot.org/results/9f604d09745ffa1f4db3bdcfe0326c236effac0c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadow/shadow.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 491f271330..e4d8b67b8a 100644
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
