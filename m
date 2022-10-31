Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3754DFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B96144038E;
	Mon, 31 Oct 2022 10:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B96144038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfA6kqkN2naN; Mon, 31 Oct 2022 10:26:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7DFE401CA;
	Mon, 31 Oct 2022 10:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7DFE401CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32F0A1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0701481330
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0701481330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3tZvKlEKqgG for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:26:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F398C81323
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F398C81323
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE38287885; Mon, 31 Oct 2022 10:26:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 11:26:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a294be424a4f78e1a54e3df7a706181fa287793
X-Git-Newrev: 8369ff62db68ad911e8fac55881006c75af8b86e
X-Patchwork-Hint: ignore
Message-Id: <20221031102627.DE38287885@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libostree: select libarchive for
 s390x architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=8369ff62db68ad911e8fac55881006c75af8b86e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libarchive is needed when building for s390x.

Introduced in this patch:
c6a53ef6e8f9491633b0d494991f94c629791e1d s390x: use 'libarchive' to modify initrd in SE case

Fixes:

  http://autobuild.buildroot.net/results/14cc164ab3005be9b3efde57b4bd914414e3acf0/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libostree/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index 14ae4da4c8..696e8e1d6c 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBOSTREE
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_LIBARCHIVE if BR2_s390x
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGPGME
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
