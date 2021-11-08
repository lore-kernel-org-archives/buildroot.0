Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E66C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:07:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB8D60ED7
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BB8D60ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A4A180EA1;
	Mon,  8 Nov 2021 16:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-0x0qjHJCYf; Mon,  8 Nov 2021 16:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD88C80EA3;
	Mon,  8 Nov 2021 16:07:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78C6A1BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67F396081D
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y593S0No_PAo for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9B216061B
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0AFA78B6B9; Mon,  8 Nov 2021 16:03:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 16:05:37 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c6a0652f0a1327516db55f520535bc0db266bdbb
X-Git-Newrev: cbe28a841d3ab787c8535b4322b2a818796441fd
X-Patchwork-Hint: ignore
Message-Id: <20211108160318.0AFA78B6B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/dahdi-linux:
 needs CRC CCITT
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbe28a841d3ab787c8535b4322b2a818796441fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

dahdi-linux needs a linux with CRC CCITT since the addition of the
package in commit d959966b41bd88a36664c733a8a8d2b6809e4fc2 as stated in
the README:

- CONFIG_CRC_CCITT must be enabled ('y' or 'm'). On 2.6 kernels this can
  be selected These can be selected from the "Library Routines" submenu
  during kernel configuration via "make menuconfig".

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b22ec4bd95b7d9dd82990937e6488ca7136e6136)
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
