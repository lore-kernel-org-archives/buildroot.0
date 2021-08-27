Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72E5C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8BD60ED5
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F8BD60ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B84240291;
	Fri, 27 Aug 2021 22:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxi07fesHkX8; Fri, 27 Aug 2021 22:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8447540877;
	Fri, 27 Aug 2021 22:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE9BA1BF3D4
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8A0D427D9
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVjvJIAp3h3M for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 22:08:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50A59427EB
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 22:08:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 49D9C8EB98; Fri, 27 Aug 2021 22:07:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 00:06:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3830b8441db0b9d9765b1c27e6b6008b88e83707
X-Git-Newrev: 033561487604cfcf7282ee6c57bef79c8bd3013d
X-Patchwork-Hint: ignore
Message-Id: <20210827220708.49D9C8EB98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: add ubihealthd missing comment
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=033561487604cfcf7282ee6c57bef79c8bd3013d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 42a3fee35e67d8d946f52a82bfa88ee6fd9f04b6 forgot to add comment on
headers 3.17+

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index d0ca3ba663..c45dd1e2b7 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -148,6 +148,9 @@ config BR2_PACKAGE_MTD_UBIHEALTHD
 	default y
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 
+comment "ubihealthd needs a toolchain w/ headers >= 3.17"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
