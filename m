Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72E4C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E39461245
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E39461245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D51D407A3;
	Fri,  5 Nov 2021 15:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-QVpG-Pfd9H; Fri,  5 Nov 2021 15:07:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31FB407A9;
	Fri,  5 Nov 2021 15:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDC251BF5DA
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60AC96F939
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOaSPCpYJ3es for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 15:07:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B44F360643
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 15:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 094C98A645; Fri,  5 Nov 2021 15:03:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 16:03:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ae74b57aeb1134c1c0c1d00a162460ccfce7569
X-Git-Newrev: b22ec4bd95b7d9dd82990937e6488ca7136e6136
X-Patchwork-Hint: ignore
Message-Id: <20211105150324.094C98A645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: needs CRC CCITT
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

commit: https://git.buildroot.net/buildroot/commit/?id=b22ec4bd95b7d9dd82990937e6488ca7136e6136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dahdi-linux needs a linux with CRC CCITT since the addition of the
package in commit d959966b41bd88a36664c733a8a8d2b6809e4fc2 as stated in
the README:

- CONFIG_CRC_CCITT must be enabled ('y' or 'm'). On 2.6 kernels this can
  be selected These can be selected from the "Library Routines" submenu
  during kernel configuration via "make menuconfig".

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dahdi-linux/dahdi-linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index 4d2c7e7177..cb1d692e94 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -60,6 +60,10 @@ define DAHDI_LINUX_EXTRACT_FW
 endef
 DAHDI_LINUX_POST_EXTRACT_HOOKS += DAHDI_LINUX_EXTRACT_FW
 
+define DAHDI_LINUX_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC_CCITT)
+endef
+
 # Need to pass the same options as for building the modules, because
 # it wants to scan Linux' .config file to check whether some options
 # are set or not (like CONFIG_FW_LOADER).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
