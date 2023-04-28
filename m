Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E41C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 19:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C049C404A5;
	Fri, 28 Apr 2023 19:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C049C404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAQ_MvTjbTpk; Fri, 28 Apr 2023 19:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DBFB404B9;
	Fri, 28 Apr 2023 19:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBFB404B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA0B61BF84C
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 19:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1307840BA
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 19:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1307840BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBBYHRN3Dpvs for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 19:03:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 067A6840B8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 067A6840B8
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 19:03:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.221.218]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MXGvM-1plPGq19l0-00YegP; Fri, 28 Apr 2023 21:03:10 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 21:02:00 +0200
Message-Id: <20230428190201.12489-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ig3/+OZ9K1DMLwLyjeFZDNvg2S1Mizx73mQWySVLawHEwSTgRNv
 kE0zV+MhN9YeoCuixi9fabMQxHZD6ABQfPy0lwHHcABKhsgDNCkPsgzmzSa5XNCz38dYKuC
 kH4a4aypsCBSIr7sEhjSzZqi2kT37otNAEb2PGbG4dr+LeplYDhiJUSunCaOzGKVkX9xdYS
 olY9Qk5qwwuQAz1pF8wZA==
UI-OutboundReport: notjunk:1;M01:P0:huuYEgqfZas=;h/iCILxkqsOugBERudmXjEu+BUh
 1rUZjepETpA4B86FjoNk9ZeyZidiIi0jJQcIsQSjZYj54CUhY9Z7JLgry8eoJg5UG7sicm/VL
 aBjECXFsARJKdV/aTrAIUnpt7VGDIgiYcOiwkGEi7FUNuLHq1nr1i0nbg2nSq7kvsNLL1rjXD
 DqPc0pyd62ZrDIRPu9lWchc5Ny3bEKED9T+/wF5gdBvfr4aTZvahUmjia3vXqtk2+WvQKOqEZ
 cC+Xn/bmD7JmU0XLZeix+/i+wNWkEV/MnV7Fc2rziY2IxL0g+sja92s2z49vI7k+D40cbUcqN
 BxEK/3mWOZI303uL8wi2rFXM0d0hzK+MN/+wbrVCM7ighFWOZsWdSDka5+UIUMOjnJZeIBU4q
 DJzu4doxmu54xJzilM0s+QS82qABur31vVMsEstJa3DRx65JXUE1TYDHCk8m2inlE3c9WwIVb
 t+D8ALTylGQJMJWHXkcu7cum3unmlrkvkqfmQLtLTBmxqYPWZ0sT/7FaUu/MhffrkAafKc/Ux
 DsTut9uJIyGt+jEznhD0bnb0wc9b6nzFHahGI1WQejEjBXzN7exE+I6eY5pyD2P2ADqfq08ZJ
 4Q1seNYY/vnTliqzoyKrUxs/o19hobZhYrWt3Tdh4P0g+WQZ1Vhg3OYNOnaqMTxTst8V6+29k
 EW/AEpg9OdFrDUjA6wy8nNDAvpzDdmaRwv9oKLea3mA465sMz6Zj7Zo9Yacwh00gvyuXfKdaq
 vwpHGfPKoIlz6WsnyHlC+zwTQk5bxs2u6OTxuFWgnvxDDDHknJkj7FrveWDn6s2k6rq565Jly
 wib3qZ0HIFdWHOVba/02Zs4BJg9zyg0nEzYDCkromAw0ctp1Jh5xGFeF7JAggJ9794v4PgCNv
 bsDaQNEQAkYIVSDGiddGZfN2cN8MVFFSHLSU8rbFcBRtppSTeT0BUFGJa4N3Bxt8IYUihkrP7
 4gDoyO3zxqh/giyh8qPWS8ZSemU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1682708590; i=dalang@gmx.at;
 bh=psR5//GtUJwUdbr9mJTMr2EWUpFkIHzZfdxkJwAI2bI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=adxjpSmaU+EfC5aE7B2eJDuhBJlt7uZvf1L+23LWqsc/2sHuRMhAXyV9sdZnKQsNb
 hbN8gKqkULyyqO31Piaf+ocuSjhpz78+OyhVlRc9X1OEwMdAm4OSH1iEZBUWqbEYLC
 aYjz459awQ6wIDm017w5X6YgJphOCS2KvF0wD8dfsVQ3wPvMOZJvdhdkoMFQNBTJGv
 8XnDnigTeVY8vlAhylgFLfim/GcCB6gKzRP6NCFKQIgEHENDOUymE3RKmuyMK4WZrO
 jIvnW7KBR9FjD4Am6UnuODkER0o0s5T6XfRaPJfP0ID1rG1uSUtZCftcjSUYbfYQKH
 7EPZZOC6rzHYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=adxjpSma
Subject: [Buildroot] [PATCH] package/libgtk3: fix cups backend
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When explicitly specifying printing backends libgtk3 requires file
to be one of them on linux.

Fixes:
- output/build/libgtk3-3.24.37/modules/printbackends/meson.build:39:4: ERROR: Problem encountered: 'file' print backed needs to be enabled

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/libgtk3/libgtk3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 18a8a9fa42..b41049b0ee 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -68,7 +68,7 @@ LIBGTK3_DEPENDENCIES += xlib_libXdamage
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-LIBGTK3_CONF_OPTS += -Dprint_backends=cups
+LIBGTK3_CONF_OPTS += -Dprint_backends=file,cups
 LIBGTK3_DEPENDENCIES += cups
 else
 LIBGTK3_CONF_OPTS += -Dprint_backends=auto
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
