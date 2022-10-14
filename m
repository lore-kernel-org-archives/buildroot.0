Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3F3C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 11:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C666F83E05;
	Fri, 14 Oct 2022 11:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C666F83E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKRY7K0OxnAs; Fri, 14 Oct 2022 11:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC91F828A5;
	Fri, 14 Oct 2022 11:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC91F828A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D87F1BF327
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 11:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8598607B5
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 11:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8598607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlGzbYJLsl8v for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 11:18:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F366068F
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7F366068F
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 11:18:31 +0000 (UTC)
Received: from opfedar02.francetelecom.fr (unknown [xx.xx.xx.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar23.francetelecom.fr (ESMTP service) with ESMTPS id 4MpkQs5bMFzBt2N; 
 Fri, 14 Oct 2022 13:18:29 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 13:18:27 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 14 Oct 2022 13:18:25 +0200
Message-ID: <9796_1665746309_63494585_9796_388_2_2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX202.corporate.adroot.infra.ftgroup (10.115.26.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1665746309;
 bh=1QlicPJwMvLrNGJGZT0Btd0KNqUJ8Gm86cRBD5usMZE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=uNF0TgF6Rcq+s/H2Fjjggn0XfEbbiui/vHrsZLb/gD8WvHhqU4RazgQiF3mGz8/l1
 s++OyiVHHvtn/XXjzrJx0nmi393li8mKGKGeth5q3Qu5QRM+/MEhJtdCQ+N9O8buVM
 ZwBHexRKwktchINefOlim1qloJVX06Bob94t+fgUTRLWDtpf/Kcn8Jh6JKgQMG1Gzq
 E1BFYVch0LeYFNSO9TAe6hDB/gpP5+EG7MzWkuWx4yX+u319WjdmiTEJPzY3izL4fF
 ev0vf3B4DvUYJ4+d9FXmX8slhVZuM/wf4gmy827d6YXwccSRiOpHBqo6PV5E0B3bMB
 s4DMMbjwb2yJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=uNF0TgF6
Subject: [Buildroot] [PATCH 1/3] Makefile: really generate glibc locales in
 parallel
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To generate the glibc locale data, we call into a recursive Makefile,
so as to generate locales in parallel. This is done as part of a
target-fialize hook.

However, that hook is registered after all packages have been parsed,
and as such, it maye be registered after hooks defined in packages.

Furthermore, the expansion of target-finalize hooks is done in a recipe,
so it is not easy to understand whether this generates a "simple" rule
or not.

As a consequence, despite the use of $(MAKE), make may not notice that
the command is a recursive call, and will decide to close the jobserver
file-descriptors, yieldiong warnings like:
    make[2]: warning: jobserver unavailable: using -j1.  Add '+' to
    parent make rule.

This causes the lcoale data to not be generated in parallel, which is
initially all the fuss about using a sub-makefile...

So, do as suggested, and prepend the hook with a '+', so that it
isexplicit to make that it should not close its jobserver fds.

Fixes: 6fbdf5159607 (Makefile: Parallelize glibc locale generation)

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ec7c034ac1..ededfa491d 100644
--- a/Makefile
+++ b/Makefile
@@ -653,7 +653,7 @@ ifneq ($(GLIBC_GENERATE_LOCALES),)
 PACKAGES += host-localedef
 
 define GENERATE_GLIBC_LOCALES
-	$(MAKE) -f support/misc/gen-glibc-locales.mk \
+	+$(MAKE) -f support/misc/gen-glibc-locales.mk \
 		ENDIAN=$(call LOWERCASE,$(BR2_ENDIAN)) \
 		LOCALES="$(GLIBC_GENERATE_LOCALES)" \
 		Q=$(Q)
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
