Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50CBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60A9C403E0;
	Thu, 27 Jan 2022 16:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPW9sPTbK8fs; Thu, 27 Jan 2022 16:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA4640360;
	Thu, 27 Jan 2022 16:54:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7EC1C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3891960A7B
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTO4MKOBGj_b for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:54:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A18C960BDB
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 72E46821F7; Thu, 27 Jan 2022 16:47:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:54:00 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 29e4ff33c36ca865d9940edc16b1fd82a6006ebe
X-Git-Newrev: b7e5a5a7918021697e9f309a14e4999e90059fb1
X-Patchwork-Hint: ignore
Message-Id: <20220127164713.72E46821F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libvirt: fix ssh2
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7e5a5a7918021697e9f309a14e4999e90059fb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix the following build failure raised since commit
fbf25acfbfd5a73b3560918bea081768abbe5723:

output/build/libvirt-7.7.0/meson.build:1:0: ERROR: Unknown options: "ssh2"

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c077b4a919d697c0b4f5c0c30d945418691e2e23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 9a4788c905..291d892bae 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -219,10 +219,10 @@ LIBVIRT_CONF_OPTS += -Dsasl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
-LIBVIRT_CONF_OPTS += -Dssh2=enabled
+LIBVIRT_CONF_OPTS += -Dlibssh2=enabled
 LIBVIRT_DEPENDENCIES += libssh2
 else
-LIBVIRT_CONF_OPTS += -Dssh2=disabled
+LIBVIRT_CONF_OPTS += -Dlibssh2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVIRT_LXC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
