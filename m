Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870BFECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B7A60B4F;
	Sun, 28 Aug 2022 09:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09B7A60B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kqf8lgoNC1U8; Sun, 28 Aug 2022 09:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36BE160ABA;
	Sun, 28 Aug 2022 09:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36BE160ABA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 541241BF5AE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D5DD409A0
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D5DD409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPj36WEllDgk for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:24:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8AED40999
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8AED40999
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:24:43 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.235.193])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8A43D19F733;
 Sun, 28 Aug 2022 11:24:37 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 11:24:30 +0200
Message-Id: <20220828092430.21572-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661678680;
 bh=nKsfVr9F50nZ/2vWMFimUvVhv9QBOsjdgq27aYQnZvA=;
 h=From:To:Cc:Subject:Date:From;
 b=tgMM05s7kQaj6dwcp7s/L4chf+JOmfmn3BM6CkqH5vKMuSAg+8YP9YHKPewrhLHk5
 efIpoujt1VRyTbs1WsIfvoGt3cwAjB3jeYcMRqklUOTpuESKiHK7tIuaSfkBfUwXaI
 Fwn9Ako8EQmj1trVYJOBkNEkg2vzcBETXHXhMbZNXQmG4EZmE/AFVVN25Wmyy84RNb
 +i652HdBn4t2aujS6KGVAS+oEedVaeOeXLMl2unGZGT9Ub7Rk7f6mcDYT9Fci3N3sg
 6/y5qhohNr5wFNbHCQNWbjKAeHuYcWNL9DVWqniPmKASr6h9Qa/PCWXX5Gh/kltP4l
 zlMitH61Z969A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tgMM05s7
Subject: [Buildroot] [next 1/1] docs/manual/patch-policy.txt: patch subjects
 shall not be numbered
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The script "utils/check-package" checks that patch email prefix are
not be numbered. See:
https://git.buildroot.org/buildroot/tree/utils/checkpackagelib/lib_patch.py?h=2022.08-rc1#n42

The error message recommends to generate patches to be included in
Buildroot with the command 'git format-patch -N'.

The patch policy section in the Buildroot manual does mention that.

This commit adds a note about that requirement.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/patch-policy.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index e704a0d3f3..063ef984d8 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -44,6 +44,11 @@ These patch files should be named +<number>-<description>.patch+.
 - The field +<number>+ in the patch file name refers to the 'apply order',
   and shall start at 1; It is preferred to pad the number with zeros up to 4
   digits, like 'git-format-patch' does. E.g.: +0001-foobar-the-buz.patch+
+- The patch email subject prefix shall not be numbered. Patches shall
+  be generated with the +git format-patch -N+ command, since this
+  numbering is automatically added for series. For example, the patch
+  subject line should look like +Subject: [PATCH] foobar the buz+ rather
+  than +Subject: [PATCH n/m] foobar the buz+.
 - Previously, it was mandatory for patches to be prefixed with the name of
   the package, like +<package>-<number>-<description>.patch+, but that is
   no longer the case. Existing packages will be fixed as time passes. 'Do
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
