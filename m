Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF252C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E0D061068;
	Tue,  7 Feb 2023 22:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E0D061068
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pqhVgRdA1fi; Tue,  7 Feb 2023 22:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5F9861065;
	Tue,  7 Feb 2023 22:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F9861065
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 521251BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 388734085D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 388734085D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ps3WJfk-UJUF for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:10:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0F2340897
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0F2340897
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:10:05 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.25.48])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C31B9780304;
 Tue,  7 Feb 2023 23:09:59 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 23:09:37 +0100
Message-Id: <20230207220941.58066-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675807802;
 bh=sAmzY8j3LSKaUC+tgU3GvZP+Z/SlQkxBvG6PJ8SoQm4=;
 h=From:To:Cc:Subject:Date:From;
 b=YMjYxImtDMjWwJKG53J6L5VJDmFHVXKPMSInXsrZ7XCITvYQpyS3KlAQTTeCc/1k8
 4aPD/dgos9C3Xrr7Fx4tjOxIS6HCb58n3qBCFi2/EMG5MxHeSYFvKTV2mepnwky5PR
 GZ4PMC4wH2QM7YRBlwbAl3BEiiHnrY7wXgrRoxsViPXvePw8yJqQwnokfpePjbvIg5
 Q9R51ZQ4oxZzsqz+nGTWJhiA+d9csZoGh5bMHzaVXBSlYI5rx619twO+J1Ljp94eyc
 z7NW7zF3skKSlIiE4Vkp2lqEU5ZzCleNDuZEF8RfN6OS4a0D6n4nXhPZ1y9fRfgFKy
 A24QaWmM6i9Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YMjYxImt
Subject: [Buildroot] [PATCH 1/5] DEVELOPERS: add Julien Olivain for
 package/openmpi
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package has been orphan since commit ee58353 (2018-12-22).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7c4d03c4c..156c5dac13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1689,6 +1689,7 @@ F:	package/gnupg2/
 F:	package/glslsandbox-player/
 F:	package/octave/
 F:	package/ola/
+F:	package/openmpi/
 F:	package/perftest/
 F:	package/ptm2human/
 F:	package/python-distro/
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
