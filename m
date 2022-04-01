Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741B0C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 18:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D118408B2;
	Fri,  1 Apr 2022 18:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOQcFd_5gfKL; Fri,  1 Apr 2022 18:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D2E640895;
	Fri,  1 Apr 2022 18:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B50BF1C1189
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 18:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A34404152A
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 18:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0a6M9qOJQDrl for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 18:05:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68D974152D
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648836321;
 bh=XDCrML1u83yptCl2Z1A2J/MbnwIpk7OtNzy/unaZbog=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=WOKa3etsXfc16mSPZNPnRMas8vzYJ1LRz4lC+l2ep89qP5MoqQYC7v6CqpodqNFkE
 F/TdJb5B9TJ25AbZoYXshOBnWlekTOg9dfiB2RoMP3sWgvC5UbiCKC99DyrI2ZpF73
 /J10D7hXPocmUnoRYnMDMzv/0SRZ2YRtjqRDFgj8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.24]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1nWmKL44Ef-00YUL9; Fri, 01
 Apr 2022 20:05:21 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 20:05:17 +0200
Message-Id: <20220401180520.15772-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:nV0j3sVrq+ev9Msu6kO5MLyp+wfQDCthV0IjH+ijDMzsZ2hU64s
 HUkM957Y4/YrRXOeru88kh9cS8ih6NjBErPdKvAzrcaOiDj7zpVTaY2ZUl2BXitwVlHFdqE
 LocKUPU/SIu4N+7Ksncc2E0JivipxvCimJ/jmNwC+wonj/coNgr0LQfzHqoX7aa2bsgID3P
 goZXdshRKPbrTC64099vA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iLf1XSnMKWU=:VpY/ER7hqe3KRRN4Ow8hYe
 upy3P2S6HHJhtN0BZJnjbUWgx7seByongA6hal/Jy7EbQ022C9JH1cUuTdKB2a+82FvxaJSTi
 6UPOB9KuB7/SUpw3kns5s997oTl9TjkTLu/WA1LN9g0gQF6tOVf56zvIdnQst787xwhiiU6/e
 ETIubkRCdea6lwn4cCe0LNh1YjvlvoB45pJ52bcZAqPigL8W7qKuRrYkkxL0KGG7/YbXsVWJM
 FlKkONxHvTxkwRXVc6iprOt0IGp7bStnknsY+EM/omrgkf9d1cB4b9HnUByTBsmjhrAyzFnrK
 Ob0EdLTHnL+Ec/OV22bMalETOpXojffTfr7mDqe9o4EFlR57H2UflqiM/j2YfKn6gD9Jhroeg
 uHrKaI4aCo6QLQgEoVYnbCZqGXc4u//iA+zpvHTlEbpDi+pC12T2Dfr6Y/HxNOQ8YoV812dFm
 +astcD2pOvQjzAJc7+Q85BFVQzzTqxfnZ+wYcjivG9twVTdsyF39/eGA0/OfIjjY4vZzH/W9f
 6pflnCe0iksBo6O3BpOK/H8u/RsI3exJBLkaxuh41fxxGuXhgafx9hIUc2xMxR72H1MyErFC2
 r05kA/HMYJqwanbM0YjhY9os0JqB8/+0e3SEMzGFcvXskAXKaIs8Om6DuOJg51i3ljiuCleSp
 gpHRDvfYCv/Cp/QxMq1SQMBD9//+YpuUdj7TJqwxt3DaRH6BOC9Pd0+4pPi+kINlSHeJonUwV
 6b8CtGdB5/d/oEX2uIevEwpJ6HvuMQWNcK8WqgN16qklmttST2arH7I+lR4F/7WbDStVK3k3d
 3RB8ucBVjQfadO1b4eejFpSJW0q8iU8p4RbMuZq1PKEsUKD/C4tVhHuV2/r8bHXv7foFF8SR6
 cZ6+IzKz4c/1z7TMbiADA7Z/p867FvCefUqHf2o6oZGezD+EcuLWBOI+vBTgvHLjdcJgksNib
 bQRYbIqWDKriDSZw8/v3uHdKfLsC5xmWA/7boVqwbhuImlA2oG8ug68/nwPLFHyfTRB8UQmza
 Ocy9J9J6N6TF8UtBasrYeWHjnvIauYavePPMS0+DwablbigDPHvPVgbR53Vl+w2W4Y74qfYnw
 WcNs9YKR3Wi9Qg=
Subject: [Buildroot] [PATCH v1 1/4] package/apr: change download url from
 http to https
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- change download url from http to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apr/apr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index c45829aacc..7ff2c007b4 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -6,7 +6,7 @@
 
 APR_VERSION = 1.7.0
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
-APR_SITE = http://archive.apache.org/dist/apr
+APR_SITE = https://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
 APR_LICENSE_FILES = LICENSE
 APR_CPE_ID_VENDOR = apache
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
