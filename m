Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35189C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B089040547;
	Sat,  2 Sep 2023 15:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B089040547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YC7pZGeKEXGt; Sat,  2 Sep 2023 15:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 056704053F;
	Sat,  2 Sep 2023 15:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 056704053F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B07361BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93A6560B1F
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93A6560B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDik_DMh4KJn for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:58:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBCBD60AE4
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCBD60AE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A67BA868E1; Sat,  2 Sep 2023 15:58:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:58:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 925b09f7edf97b2f57b9269c1fd73e2e6f5a9f13
X-Git-Newrev: d8e9505922cf76ff498e6cd31dd7e543f9b0dc4b
X-Patchwork-Hint: ignore
Message-Id: <20230902155840.A67BA868E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: add recommended
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
