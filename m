Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B270C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:50:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A08F76103B
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A08F76103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 718CD818C9;
	Sun, 17 Oct 2021 07:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ohi6pzibECev; Sun, 17 Oct 2021 07:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D82898186E;
	Sun, 17 Oct 2021 07:50:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80CF61BF976
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EBE0401AE
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pojs5ZzS1mex for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 07:49:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BE6640172
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 07:49:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C415B95C98; Sun, 17 Oct 2021 07:46:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 09:43:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72f9aefe68f32d4aeb53a39fe38cfa7ac0677bd1
X-Git-Newrev: 5eedd33368eedc22bbc542e870af677d0b3da834
X-Patchwork-Hint: ignore
Message-Id: <20211017074649.C415B95C98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: add
 missing comment about kernel dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eedd33368eedc22bbc542e870af677d0b3da834
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a comment when kernel is not enabled (missing since the addition of
the package in commit de591c5c3a93a40d049a32bd79c30cc66daf5fb2)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wireguard-linux-compat/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
index 5a323a35e5..4e8e95bdc3 100644
--- a/package/wireguard-linux-compat/Config.in
+++ b/package/wireguard-linux-compat/Config.in
@@ -21,6 +21,9 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 
 	  https://www.wireguard.com
 
+comment "wireguard-linux-compat needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
 	depends on BR2_LINUX_KERNEL
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
