Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2F5EC873D
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 056AF83F39;
	Thu,  7 Sep 2023 15:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 056AF83F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9K7LgqCscCw; Thu,  7 Sep 2023 15:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3779C83AD1;
	Thu,  7 Sep 2023 15:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3779C83AD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FB991BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CC4641DB8
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC4641DB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWP6weKrwFhr for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2758041DA8
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2758041DA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2050686A1F; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:58:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 925b09f7edf97b2f57b9269c1fd73e2e6f5a9f13
X-Git-Newrev: d8e9505922cf76ff498e6cd31dd7e543f9b0dc4b
X-Patchwork-Hint: ignore
Message-Id: <20230907145135.2050686A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add recommended
 host-python-distlib dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8e9505922cf76ff498e6cd31dd7e543f9b0dc4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The docs here:
https://wiki.qemu.org/ChangeLog/8.1#Build_Dependencies

Indicates:
It is recommended to install distlib as well, but the build process
tries to cope with its absence and it shouldn't be necessary.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 84166958bb..4d2135a3c6 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -26,6 +26,7 @@ QEMU_DEPENDENCIES = \
 	host-meson \
 	host-pkgconf \
 	host-python3 \
+	host-python-distlib \
 	libglib2 \
 	zlib
 
@@ -339,6 +340,7 @@ HOST_QEMU_DEPENDENCIES = \
 	host-pixman \
 	host-pkgconf \
 	host-python3 \
+	host-python-distlib \
 	host-slirp \
 	host-zlib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
