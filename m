Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7350C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 19:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D50B44021E;
	Sat, 11 Dec 2021 19:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Li2QkJz3M5l; Sat, 11 Dec 2021 19:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B82E640483;
	Sat, 11 Dec 2021 19:55:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88D451BF95C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8218440210
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePrwnu4QJNv4 for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90E0E400C8
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 75499827FD; Sat, 11 Dec 2021 19:50:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 20:48:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ed3edb4f12cc6016cdf9e09c5995da8f64e5c1c
X-Git-Newrev: 997965c3a315821c973a01a08396f54ebe6c863c
X-Patchwork-Hint: ignore
Message-Id: <20211211195027.75499827FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libftdi: rename patch with the
 proper naming convention
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

commit: https://git.buildroot.net/buildroot/commit/?id=997965c3a315821c973a01a08396f54ebe6c863c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make libftdi-dirclean libftdi-patch | grep 'Patching\|Applying'

Before:
>>> libftdi 0.20 Patching
Applying 0001_pkgconfig_libusb.patch using patch:
Applying 0002-libftdi.pc-requires-libusb-fix-static-build.patch using patch:

After:
>>> libftdi 0.20 Patching
Applying 0001-pkgconfig_libusb.patch using patch:
Applying 0002-libftdi.pc-requires-libusb-fix-static-build.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../libftdi/{0001_pkgconfig_libusb.patch => 0001-pkgconfig_libusb.patch}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libftdi/0001_pkgconfig_libusb.patch b/package/libftdi/0001-pkgconfig_libusb.patch
similarity index 100%
rename from package/libftdi/0001_pkgconfig_libusb.patch
rename to package/libftdi/0001-pkgconfig_libusb.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
