Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DE3C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2026081FEC;
	Sat, 29 Jul 2023 22:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2026081FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfiADMaYHGSl; Sat, 29 Jul 2023 22:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65EF981F3B;
	Sat, 29 Jul 2023 22:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65EF981F3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F74D1BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54CB1410D8
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54CB1410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDJHLzxWzWn0 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6804D410D1
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6804D410D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53E5683B74; Sat, 29 Jul 2023 22:10:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 00:10:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5799585e16f74496e19fe688502e8c1fed9d3b10
X-Git-Newrev: 2284dce40b0ed1cfaebbc9de4056292e3f2d1a3c
X-Patchwork-Hint: ignore
Message-Id: <20230729221034.53E5683B74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: enable on AArch64 big endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=2284dce40b0ed1cfaebbc9de4056292e3f2d1a3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add aarch64_be to musl supported archs. Upstream musl already supports
aarch64_be.

Signed-off-by: Jonathan Currier <dullfire@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index f3210c5119..34ffe8324a 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
+	default y if BR2_aarch64_be
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
