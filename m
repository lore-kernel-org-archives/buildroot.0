Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0478FCCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 17:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8F960857;
	Sun,  9 Nov 2025 17:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUpQqwnX47gW; Sun,  9 Nov 2025 17:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A6466084F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A6466084F;
	Sun,  9 Nov 2025 17:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DEF7FA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B61B4025A
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKlwbRWjM--M for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 17:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 524C340187
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 524C340187
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40774840FF; Sun,  9 Nov 2025 17:38:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 18:36:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34a03bdba426a22c7efbbf33b68e836a88ab1740
X-Git-Newrev: 6b53649bfadbdc42cfa659965056105af987e6e3
X-Patchwork-Hint: ignore
Message-Id: <20251109173851.40774840FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: add merged-bin details to
 customize rootfs
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b53649bfadbdc42cfa659965056105af987e6e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As was done in dc7c6487cff0 (Makefile: check rootfs overlays with
BR2_ROOTFS_MERGED_USR enabled) to document how overlays should be
set up for the merged-usr case, and following 428ac6fcc4c2 (system:
add support for merged /usr/sbin (aka merged-bin), extend the
documentation to explain how rootfs overlays should be set up for
the merged-bin case.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/customize-rootfs.adoc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index d334093748..5d8bcba778 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -28,6 +28,11 @@ When +BR2_ROOTFS_MERGED_USR+ is enabled, then the overlay must not
   such a situation, should the overlay have any programs or libraries,
   they should be placed in '/usr/bin', '/usr/sbin' and '/usr/lib'.
 +
+Additionally, when +BR2_ROOTFS_MERGED_BIN+ is enabled, then the overlay
+  must not contain the '/usr/sbin' directory, as Buildroot will create
+  it as a symbolic link to '/usr/bin'. In such a situation, should the
+  overlay have any program, they should be placed in '/usr/bin'.
++
 As shown in xref:customize-dir-structure[], the recommended path for
   this overlay is +board/<company>/<boardname>/rootfs-overlay+.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
