Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF48C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 11:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2527061306;
	Fri, 14 Oct 2022 11:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2527061306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEZrxXUu9LFr; Fri, 14 Oct 2022 11:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC1C607B5;
	Fri, 14 Oct 2022 11:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC1C607B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73F641BF327
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 11:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED6D83E05
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 11:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED6D83E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yl0SJ3Y-v_nP for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 11:18:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDC4828AA
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DDC4828AA
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 11:18:34 +0000 (UTC)
Received: from opfednr01.francetelecom.fr (unknown [xx.xx.xx.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr21.francetelecom.fr (ESMTP service) with ESMTPS id 4MpkQv5z5vz5w8r
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 13:18:31 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 13:18:29 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 14 Oct 2022 13:18:26 +0200
Message-ID: <1138_1665746311_63494587_1138_437_1_82ab2cc49c43374ceb22a1fdd6bc5e4c72d29df2.1665746266.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
References: <2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX104.corporate.adroot.infra.ftgroup (10.115.26.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1665746311;
 bh=S42x4H4UF/Yt8mluZSLSUKeoSNbLlJndiuHyizVMNw4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=UKwDv2hxyJFPXJoCheaNU5T85cMQ524g2eXOL/LGa1e77wgmOnzVsk59PtEZ7VAtW
 nd3un0MJuy5rZxyeoYb9GRrFnR4MP1xBDq2x2/Nt6Q/J7c3nnzM3yfTnI3Dd3bu+/7
 FV/GhiO8zrtWFDFagm0lRPA7Z4XY+ev12dKt54epmZlUK+Nh1wFk8w5wV2uC3vrffv
 EqLgF592IKXlC5o7HzfzqmmIDVqhDkyJmtHaWifBADa1D+dojZnhnW+I87brLCBL55
 BtUx6FJ6Y+yyGzYoEmyL/oDxwOCKiXqelFrWP54Y3scFQecqoEHFz1CiWQsfVrvrmF
 bvd0qQgfTzfkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=UKwDv2hx
Subject: [Buildroot] [PATCH 2/3] support/scripts: don't require gawk to
 generate glibc gconv modules
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a subset of the glibc gconv modules installed, we eed to generate a
trimmed-down list of available modules. We currently use gawk for that.

However, we are not using any GNU extension in that awk script, and it
happens to work as expected when using mawk (which has no GNU
extension).

Commit 11c1076db9a5 (toolchain: add option to copy the gconv libraries)
did not explain why it used gawk explicitly, and given the age for that
commit, we doubt we'd be able to have the involved participants recall
anything from that period...

Besides, gawk is not a requirement for Buildroot.

Switch over to using plain awk.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 support/scripts/expunge-gconv-modules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/expunge-gconv-modules b/support/scripts/expunge-gconv-modules
index 03012c1ce3..bc60fc0ce4 100755
--- a/support/scripts/expunge-gconv-modules
+++ b/support/scripts/expunge-gconv-modules
@@ -19,7 +19,7 @@
 # we handle each with slightly different code, since the second never has
 # associated aliases.
 
-gawk -v files="${1}" '
+awk -v files="${2}" '
 $1 == "alias" {
     aliases[$3] = aliases[$3] " " $2;
 }
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
