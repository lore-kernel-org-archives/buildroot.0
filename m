Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3908AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2C234098A;
	Mon, 24 Jan 2022 17:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rL5HqeZxz-UN; Mon, 24 Jan 2022 17:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2822405F2;
	Mon, 24 Jan 2022 17:37:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 704921BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AF2684BC7
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUPPKdHn5SWU for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BF8184BA2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9828282972; Mon, 24 Jan 2022 17:29:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 17:28:16 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: adf50a486a70065c18e1b925021343daabf6b4e9
X-Git-Newrev: a8e5a9c8cdac32c85e42ed305482a7cf4296c52f
X-Patchwork-Hint: ignore
Message-Id: <20220124172947.9828282972@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/samba4: add
 optional dependency to icu & libglib2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8e5a9c8cdac32c85e42ed305482a7cf4296c52f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

icu is used in lib/util/charset/
https://git.samba.org/samba.git/?p=samba.git;a=blob;f=lib/util/charset/wscript_configure;hb=HEAD#l40

libglib2 is used in source3/
https://git.samba.org/samba.git/?p=samba.git;a=blob;f=source3/wscript;hb=HEAD#l1778

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1c4c68b8fbf471919fbbaf4e688a75c4de36a331)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index eb1f3b830e..de019e7afc 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -17,8 +17,10 @@ SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
 	host-perl host-perl-parse-yapp host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
+	$(if $(BR2_PACKAGE_ICU),icu) \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
+	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
 	$(TARGET_NLS_DEPENDENCIES)
 SAMBA4_CFLAGS = $(TARGET_CFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
