Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55563CFC283
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 15:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E609C61395;
	Fri, 21 Nov 2025 15:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEAWNH4v-RQx; Fri, 21 Nov 2025 15:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23A8660B3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23A8660B3A;
	Fri, 21 Nov 2025 15:12:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 355F1117
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 15:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F0BE60DC7
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 15:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkD1d1ksGNxT for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 15:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F59460B3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F59460B3A
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 15:12:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FCF585D43; Fri, 21 Nov 2025 15:12:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Nov 2025 12:34:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 08fa58f1dabf8e2ad0ff688a09240890c085a7b5
X-Git-Newrev: cad4f06931d0d409ecca23295389ffddaf9ba3b7
X-Patchwork-Hint: ignore
Message-Id: <20251121151208.5FCF585D43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: remove
 support for binutils 2.42
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cad4f06931d0d409ecca23295389ffddaf9ba3b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that binutils 2.45 has been introduced and binutils 2.44 made the
default version, drop the oldest supported version, binutils 2.42,
keeping only the 3 last versions supported: 2.43, 2.44 and 2.45.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |   9 +
 package/binutils/2.42/0001-sh-conf.patch           |  50 --
 .../2.42/0002-poison-system-directories.patch      | 309 ---------
 ...s-assertion-fail-in-nios2_elf32_install_i.patch | 125 ----
 ...-std-gnu23-compatibility-wrt-static_asser.patch |  90 ---
 ...Warnings-when-building-gprofng-with-Clang.patch | 770 ---------------------
 ...-std-gnu23-compatibility-wrt-unprototyped.patch | 619 -----------------
 .../0007-gprofng-fix-build-with-std-gnu23.patch    | 199 ------
 package/binutils/Config.in.host                    |   4 -
 package/binutils/binutils.hash                     |   1 -
 10 files changed, 9 insertions(+), 2167 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
