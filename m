Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28EBC433FE
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 12:44:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08DFD6115A
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 12:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08DFD6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C41BD4054A;
	Wed, 22 Sep 2021 12:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNLDr-joaOt7; Wed, 22 Sep 2021 12:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0EDE403AA;
	Wed, 22 Sep 2021 12:43:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5680C1BF3EF
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 12:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45FC783F98
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 12:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNOP46MF4cOV for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 12:43:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F4EA83F6E
 for <buildroot@busybox.net>; Wed, 22 Sep 2021 12:43:56 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 5C31C4408C8;
 Wed, 22 Sep 2021 15:43:21 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1632314601;
 bh=RBNH+zzHK8MF3PEapsxJGH+qX//NZqLXBk/+T7OLt5M=;
 h=From:To:Cc:Subject:Date:From;
 b=kOV8OgdX9vsbj0b3TzPJN0j9fUDpw6QfNTw4DJpb5wg3zXTFNi0VxBD85d+9CeJCT
 e+yoZo1OLjGOY9VacWJmWhUrWK2BtMoxMHWx63Mel6DUebi84idgbMsXaxMTaCw2iL
 k9TM6qdapTqkfN8uB1eOc/QQNzFoON+rKm7nHYfLDv2o7TfxnsD+bOLkWJt7cn9CeX
 lknqE1QjloVqoebQwK+Rpf8p4R/FbJqfvBKER1dnzKjCq8lQJnX0LOvhgEM/e11eV3
 zEMZBi++K0j6cArUgx26vGyTolHoRjQUAgbshBPOf9G1MyStOYbxuRjGNdnqeVB4jG
 Qk1eDg2QvNa6w==
To: buildroot@busybox.net
Date: Wed, 22 Sep 2021 15:43:36 +0300
Message-Id: <1b69453d90cdcf874e4545dcd60b87e9599e16d0.1632314616.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Baruch Siach from openipmi
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@lists.buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 926c6a27d78c..95142fec58b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -294,7 +294,6 @@ F:	package/ebtables/
 F:	package/i2c-tools/
 F:	package/libcurl/
 F:	package/libpcap/
-F:	package/openipmi/
 F:	package/socat/
 F:	package/strace/
 F:	package/tcpdump/
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
