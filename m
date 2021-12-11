Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C55C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2F19400C8;
	Sat, 11 Dec 2021 19:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdXnGVwzy5dP; Sat, 11 Dec 2021 19:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA8BA40173;
	Sat, 11 Dec 2021 19:56:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 960701BF969
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8195F429F4
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oAd8rlk8NS1l for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FBC4429EC
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6419682804; Sat, 11 Dec 2021 19:50:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 20:48:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bca032e190f741dccccb2047a28275860c53541
X-Git-Newrev: 59d716403c93aa8fd2b2693cf2e7da3e4626c97a
X-Patchwork-Hint: ignore
Message-Id: <20211211195027.6419682804@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/at91dataflashboot: rename patches
 with the proper naming convention
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

commit: https://git.buildroot.net/buildroot/commit/?id=59d716403c93aa8fd2b2693cf2e7da3e4626c97a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make at91dataflashboot-dirclean at91dataflashboot-patch | grep 'Patching\|Applying'

Before:
>>> at91dataflashboot 1.05 Patching
Applying at91dataflashboot-1.05-do-not-install.patch using patch:
Applying at91dataflashboot-1.05-eabi-fixes.patch using patch:

After:
>>> at91dataflashboot 1.05 Patching
Applying 0001-do-not-install.patch using patch:
Applying 0002-eabi-fixes.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...1dataflashboot-1.05-do-not-install.patch => 0001-do-not-install.patch} | 0
 .../{at91dataflashboot-1.05-eabi-fixes.patch => 0002-eabi-fixes.patch}    | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch b/boot/at91dataflashboot/0001-do-not-install.patch
similarity index 100%
rename from boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch
rename to boot/at91dataflashboot/0001-do-not-install.patch
diff --git a/boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch b/boot/at91dataflashboot/0002-eabi-fixes.patch
similarity index 100%
rename from boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch
rename to boot/at91dataflashboot/0002-eabi-fixes.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
