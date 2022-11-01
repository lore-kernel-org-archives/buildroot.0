Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEC7C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 07:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138B540912;
	Tue,  1 Nov 2022 07:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 138B540912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id poNoHBbLsxLP; Tue,  1 Nov 2022 07:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 190E14090D;
	Tue,  1 Nov 2022 07:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 190E14090D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43E631BF2BE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C0FD81351
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0FD81351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwJTr5b8DtjH for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 07:42:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7835D81353
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7835D81353
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 07:42:09 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 238E6440876;
 Tue,  1 Nov 2022 09:39:47 +0200 (IST)
To: buildroot@busybox.net
Date: Tue,  1 Nov 2022 09:41:55 +0200
Message-Id: <fe30717bf4f0096985334e3e23fd1f1573eb53f9.1667288516.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1667288387;
 bh=P3e4TlnWh4qzF/271bjT5J9lb/YrbOp2HwG6Q5sJwuc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qvma6SL8bsqA2I+JG5sGiWf/Pjl/fGECDXsDuG3NbLEjv0Cp0GzML0oFRfjAXp64E
 WwC/22fMzTK1MwbpBxKe+SzABAHZq9rfsl9jj2EsEMB2IW9zm8W0wkAVON+4frTcun
 q+6qovMB4aYAgAGFCK+RauNoKYgFKffU2cAN9x4g8EB0G+s3TtVNqUVRivVZqxEoUJ
 5BwORVzr1u9SzQT7jo6A23zVXtp4ZDunH1QF+vqx3Kik4osJ63hg4EPsHbDP/oQXlf
 udbuM9tgV72mcQ3dy9EmIMaviK6TflBZfJjK2wiiLs63z+KYVZLPFIIaXmHU903Jjq
 YfuANmJ5eGsnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=qvma6SL8
Subject: [Buildroot] [PATCH 2/3] package/socat: disable openssl for static
 build
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

socal configure script does not take the zlib dependency into account
when linking with libssl. This break static link. There is not easy way
to add zlib dependency, so just disable openssl for static builds.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/socat/socat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index c1bf4d260f61..bfccd020312d 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -39,7 +39,7 @@ SOCAT_DEPENDENCIES = host-autoconf
 # incompatibile license (GPL-3.0+)
 SOCAT_CONF_OPTS = --disable-readline
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_STATIC_LIBS),y:)
 SOCAT_DEPENDENCIES += openssl
 else
 SOCAT_CONF_OPTS += --disable-openssl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
