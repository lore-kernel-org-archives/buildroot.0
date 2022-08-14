Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB07C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 20:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F3EB60BA1;
	Sun, 14 Aug 2022 20:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F3EB60BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3VISNkElJSl; Sun, 14 Aug 2022 20:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A36B60B67;
	Sun, 14 Aug 2022 20:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A36B60B67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 689E01BF3BD
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 431E2410A5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 431E2410A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5D7EQe7BGWd6 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 20:43:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1BD410A0
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 20:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1BD410A0
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3BE218759A; Sun, 14 Aug 2022 20:28:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 22:42:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d7be66f70cccbaf61e5cb6b2414b9d9ce162f48
X-Git-Newrev: 375f5dd1bd036fd8213bade31881b368d2650603
X-Patchwork-Hint: ignore
Message-Id: <20220814202842.3BE218759A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslinux: disable documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=375f5dd1bd036fd8213bade31881b368d2650603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
