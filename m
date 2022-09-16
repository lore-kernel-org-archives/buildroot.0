Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA24C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 08:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B456120B;
	Fri, 16 Sep 2022 08:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B456120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXM-Iu8kj6Sa; Fri, 16 Sep 2022 08:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B9F161203;
	Fri, 16 Sep 2022 08:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B9F161203
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4D01BF2BD
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63774842C0
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 08:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63774842C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUYT0Y0nSCa9 for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 08:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DBBB842B6
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 08:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DBBB842B6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A18983CB7; Fri, 16 Sep 2022 08:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 10:52:07 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 12fc00cac2e509e7799dd97c5cc260cec6af1d07
X-Git-Newrev: 6e3f8e35b83520ae0312c21e9baf9a8b8f0c840d
X-Patchwork-Hint: ignore
Message-Id: <20220916085225.1A18983CB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/syslinux: disable
 documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e3f8e35b83520ae0312c21e9baf9a8b8f0c840d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable documentation to avoid the following build failure if a non
working asciidoc or a2x is found on the system:

asciidoc -o html/syslinux.html /nvmedata/autobuild/instance-3/output-1/build/syslinux-6.03/txt/syslinux.txt
/nvmedata/autobuild/instance-3/output-1/per-package/syslinux/host/bin/python3: No module named asciidoc

Setting {ASCIIDOC,A2X_XML}_OK to a value different of 0 will disable
html, man, xhtml and text documentation

Fixes:
 - http://autobuild.buildroot.org/results/47f876ccb56831cc1bb9e6c2f7dbce423581a0dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 375f5dd1bd036fd8213bade31881b368d2650603)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/syslinux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 2df415fcfd..cc52c49aee 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -58,6 +58,8 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # be used.
 define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
+		ASCIIDOC_OK=-1 \
+		A2X_XML_OK=-1 \
 		CC="$(TARGET_CC)" \
 		LD="$(TARGET_LD)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
