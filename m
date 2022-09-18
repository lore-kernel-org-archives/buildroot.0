Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA42C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBDD24098F;
	Sun, 18 Sep 2022 10:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBDD24098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kI2VQQQqz6E; Sun, 18 Sep 2022 10:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E47BD408E1;
	Sun, 18 Sep 2022 10:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E47BD408E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D203A1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9A4B84412
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9A4B84412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugXS5idCXx6M for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:45:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04A6A843E7
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04A6A843E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4EE684FA6; Sun, 18 Sep 2022 10:45:29 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:45:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b2296dc0fb6a385cb12c07c91ef77a87665f2f3
X-Git-Newrev: dc69061e7d36776532d4684e40aa4deadb6a8db0
X-Patchwork-Hint: ignore
Message-Id: <20220918104529.E4EE684FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: Use powerpc64le instead of
 power8
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
Content-Type: multipart/mixed; boundary="===============8102989506749044055=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8102989506749044055==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dc69061e7d36776532d4684e40aa4deadb6a8db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With "arch/powerpc: Enable powerpc64le only on CPUs that support it"
we can use this symbol to indicate the CPU is supported by glibc.

This also aligns the conditions with the kernel headers dependencies.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index ba9f691d80..b63f99b0b4 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
-	default y if BR2_powerpc_power8
+	default y if BR2_powerpc64le
 	default y if BR2_riscv
 	default y if BR2_s390x
 	default y if BR2_sh

--===============8102989506749044055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8102989506749044055==--
