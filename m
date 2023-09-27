Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A47E82CC9
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 652A2414EB;
	Wed, 27 Sep 2023 19:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 652A2414EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3KlPDusJ0bvs; Wed, 27 Sep 2023 19:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 925B5419C2;
	Wed, 27 Sep 2023 19:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 925B5419C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4CE1BF335
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4B5F414EB
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B5F414EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uw9WFolh7e1a for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:42:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC82A419D8
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC82A419D8
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D9D5BA4C06F9
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 21:42:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42056)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qlaQK-0005A3-20
 for buildroot@buildroot.org; Wed, 27 Sep 2023 21:42:16 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:42:16 +0200
Message-Id: <20230927194216.1597862-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695843736;
 bh=Q0Co5tdYIcQgUJ6jZKrXGIJobUvbkSbZfjPw7PPjygs=;
 h=From:To:Subject:Date:From;
 b=MuAaB+S8NrZhOjvXCVCpgX5VsPReRcgHaxCQ3+8QsmC3Kg9wtFRfLuWIwQKN5XyEg
 LWBAGZwAGMVL4CqKJgOFV07rGqmmgB+qEwefXVEuli8MAAsLV3sOvPdnO3v5Cs28AG
 h8xbr259BhRzdSlmpfsnuQ4Ld6gu8M/MMMsHqz99neEsWQ3X1+m5U4+O4oP7uRSB4T
 pTdbGPn5IGTaPGvo5+2MGMsQX4OnJtxF9pCYNKnShFL/swv56UQiF5JQgn4S+RVBHL
 cLGuYpQwmg9r5rEksYYVWEfyv/barHlzH3luuJQcDy/eRYB8S6lRzEKNAYaGQ7xjrT
 FexFCJSwCuJYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=MuAaB+S8
Subject: [Buildroot] [PATCH 1/1] package/onevpl: disable tools
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/059/059a8581fb809488ad6fa3183874395ebf3f0926/

This package is not part of any older buildroot release, no backport
necessary.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/onevpl/onevpl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
index 2033f755c0..601e121a55 100644
--- a/package/onevpl/onevpl.mk
+++ b/package/onevpl/onevpl.mk
@@ -12,6 +12,7 @@ ONEVPL_INSTALL_STAGING = YES
 ONEVPL_DEPENDENCIES = host-pkgconf
 
 ONEVPL_CONF_OPTS = \
+	-DBUILD_TOOLS=OFF \
 	-DINSTALL_EXAMPLE_CODE=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
