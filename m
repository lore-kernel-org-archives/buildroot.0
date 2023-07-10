Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1359FC001DF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0A91404DD;
	Mon, 10 Jul 2023 20:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0A91404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOzK_zeC_nvM; Mon, 10 Jul 2023 20:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E94ED4049D;
	Mon, 10 Jul 2023 20:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E94ED4049D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB15C1BF399
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A3E940335
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A3E940335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfnDFUberBn4 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:08:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53D734177A
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53D734177A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FFF886CEA; Mon, 10 Jul 2023 20:08:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 22:02:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 168e5848addda21067d3b8791e9b781847daa30f
X-Git-Newrev: f8e000b1866fdc2dbb2c57fbfe66f62a80167f18
X-Patchwork-Hint: ignore
Message-Id: <20230710200807.3FFF886CEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: enable support for
 arm/armeb
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
Content-Type: multipart/mixed; boundary="===============5380887807823413328=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5380887807823413328==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f8e000b1866fdc2dbb2c57fbfe66f62a80167f18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The local copy bpftool uses now compiles fine on both arm and armeb.
Add these archs to BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS.

Signed-off-by: Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bpftool/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index 461be9e5b4..d131ec566e 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	bool
 	# see libbpf/src/bpf.c
 	default y if BR2_arc
+	default y if BR2_arm || BR2_armeb
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_sparc || BR2_sparc64

--===============5380887807823413328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5380887807823413328==--
