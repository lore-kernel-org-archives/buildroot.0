Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA27C4167B
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 18:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 547B8820DB;
	Sun, 12 Nov 2023 18:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 547B8820DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nyRHz8lJrYm; Sun, 12 Nov 2023 18:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8753820D2;
	Sun, 12 Nov 2023 18:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8753820D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5EB1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 18:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7412820D2
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 18:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7412820D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5SaPp8eTDxH for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 18:01:06 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23E44820CF
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 18:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E44820CF
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 2Elarmb71tD7I2Elar1TKg; Sun, 12 Nov 2023 19:01:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 19:01:01 +0100
Message-Id: <20231112180101.1451451-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231112180101.1451451-1-giulio.benetti@benettiengineering.com>
References: <20231112180101.1451451-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP5WRadMN4W+i/fqau5GcSHdx0qUJmLFrq7WBeTgqGam5qGzt1xWsHllSNKp1cjN0aF2dIYXqvkTouDuNMw4o9vLTymm24B55dNPK7wCShqJKI6YUawk
 9rNwBPBf1Lb940Bz3l9ykMTz2/DRHQiQv7f6UHjebQg+uz4c8vGfo44TkxhVZa6QSrKZ2AWAdiqKxLQoTYqhH072Qizjp6HvOu0FzZoGCNZ/yIonmod7k5Of
 u+mOODphIBAKqftRuM0+twoShaAcdxi0YJvqDHlxy2okfWAkN0DfNDJMSt9rdxeNuOysK3EGZOfCK8CHd2tRxg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699812062; bh=65aM1Mpysq+igqco5gnCPo64/NLHaQeUtgJN1yeKpE4=;
 h=From:To:Subject:Date:MIME-Version;
 b=LC8H78ybKSBdNoLvZwZCJmr58fx0wQNKk5Wkavazht1+9Ox9ngesM7m9gbIsrdyxg
 BPpKL8zsJU3wrgQUh4F8cxTkxzDAPk5LBaouJ0uVA1K1nNKYU6OGDkktDYmIRZgQYD
 fhICB0emLJdgA/hPJt+TXNVR7aTDj4m3monkcClJK3vGZcnPwh2o6i/3fUZheZUy7S
 PdJtVFmnI15ToPyGGYX1JjVlitox0aLcKYd7lxHIxXpyPJV+N3vlC95MeWlI+u+sj8
 BtXUDMWoc8s5HnnaLwX7MLpMDU2fhro6NQc/TR+mmJxHsn40U5tLdLczcZ8u/Jv+Lf
 vwiQtk99Y6atA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LC8H78yb
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to mongoose and
 swupdate
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 69350fbb95..c0c3eefba6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1241,6 +1241,7 @@ F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
 F:	package/mali-driver/
 F:	package/minicom/
+F:	package/mongoose/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
 F:	package/python-libconf/
@@ -1259,6 +1260,7 @@ F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
 F:	package/swugenerator/
+F:	package/swupdate/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/wilc-driver/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
