Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDB1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 19:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77CAF429EC;
	Sat, 11 Dec 2021 19:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boazn3S1nO8U; Sat, 11 Dec 2021 19:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C74429F4;
	Sat, 11 Dec 2021 19:56:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 919691BF963
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 814AC855C8
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAjEXyvnVgfR for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87EF2855C6
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6BF8D82806; Sat, 11 Dec 2021 19:50:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 20:48:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59d716403c93aa8fd2b2693cf2e7da3e4626c97a
X-Git-Newrev: 3ed3edb4f12cc6016cdf9e09c5995da8f64e5c1c
X-Patchwork-Hint: ignore
Message-Id: <20211211195027.6BF8D82806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/at91bootstrap: rename patches with
 the proper naming convention
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ed3edb4f12cc6016cdf9e09c5995da8f64e5c1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make at91bootstrap-dirclean at91bootstrap-patch | grep 'Patching\|Applying'

Before:
>>> at91bootstrap 1.16 Patching
Applying at91bootstrap-1.16-eabi-fix.patch using patch:
Applying at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch using patch:
Applying at91bootstrap-1.16-u-boot-relocation-fix.patch using patch:

After:
>>> at91bootstrap 1.16 Patching
Applying 0001-eabi-fix.patch using patch:
Applying 0002-gcc-4.6.x-ldscript-fix.patch using patch:
Applying 0003-u-boot-relocation-fix.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../{at91bootstrap-1.16-eabi-fix.patch => 0001-eabi-fix.patch}            | 0
 ....16-gcc-4.6.x-ldscript-fix.patch => 0002-gcc-4.6.x-ldscript-fix.patch} | 0
 ...-1.16-u-boot-relocation-fix.patch => 0003-u-boot-relocation-fix.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch b/boot/at91bootstrap/0001-eabi-fix.patch
similarity index 100%
rename from boot/at91bootstrap/at91bootstrap-1.16-eabi-fix.patch
rename to boot/at91bootstrap/0001-eabi-fix.patch
diff --git a/boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch b/boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch
similarity index 100%
rename from boot/at91bootstrap/at91bootstrap-1.16-gcc-4.6.x-ldscript-fix.patch
rename to boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch
diff --git a/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch b/boot/at91bootstrap/0003-u-boot-relocation-fix.patch
similarity index 100%
rename from boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
rename to boot/at91bootstrap/0003-u-boot-relocation-fix.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
