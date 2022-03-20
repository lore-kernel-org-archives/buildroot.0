Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D87C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 16:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E6681656;
	Sun, 20 Mar 2022 16:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYN7B1gJQzL2; Sun, 20 Mar 2022 16:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B5181501;
	Sun, 20 Mar 2022 16:40:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2BF1BF3C0
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 16:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D6CE81501
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 16:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-h7wVVcLA2q for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 16:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AB87814AB
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 16:40:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t11so17895739wrm.5
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 09:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lR9yCdAkvswag+SwdfxwdLON4P2YFolCyo4MP0/VlU=;
 b=gQBRwBUvJjf2s+YHZ8k7Rq7WW3bjtnpW/0xjBLd528mJuC+M2Z1UJm8CPUGS6/ChKz
 oZuJ6/GJu7IQbaUfaTQdyIyDf4+VlhQ+SnIFhZfB/ak23fRiduELdvXNXGAYM/nMZBO+
 8FFXsSl5q/YUNXab9TcyoVxRe04UyIgv1SpKxO4UxqVihF9gJdHq+cWT2YjPzF+87Xy1
 IffTLPA4fs8zQKkGlPOS+5/5n+uXIcwYl7agLoK3Plg7oYP8cdUMcv2RIQezVp2POntV
 INt0P8IvQ3GLby1OnpgHMlP874sJ8dK49lE/jX384XsjoJM2+kL7TFF2ft2QrTnNTagM
 tj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lR9yCdAkvswag+SwdfxwdLON4P2YFolCyo4MP0/VlU=;
 b=F5CpZplP9TBQ6phGsfQif7wYhSwbrmz/4oljmCY1AD4qXHn07MnP2rDvHoJJCVse6+
 mkQCGkOQziWihyGzZkDjnmaf7QsXIgLadyC0BtNmEOetxk8WxMjsJj64P9uVntmOtOys
 yfJxJB1GLiLeWc2lMMoIjTUST5Q9E3yPnvUO7nZKteE84AnGsiMMaJqYL4MmF3mecRyA
 tvnVc12NVRaRSko2yeGTpH4qlwGTaBHOAHqcRropfhB0aWbeFRyHAVQVWAQnqD+rpTTg
 pOP2YCFyCw85Hg52WVpPKMnbEB1BY7Ox94cBNGaCTNe4L+yrDAnbtGN+KQdv0Ii9cby5
 fZ4g==
X-Gm-Message-State: AOAM532v6PA5gAWfH+F+V3X/4/eSm5GiU9R0gxnMLd1DcEcc0zRKxPUL
 WElGtre7U4SgUgeVHL13590w9lLzXPI=
X-Google-Smtp-Source: ABdhPJwiG8y28gQ7QmI7SV6EKvtfKO2VROV2zWLwBn+b0fDlnxF1x4m4D2qy4tFlpM8OeasvyDtJQw==
X-Received: by 2002:a5d:6711:0:b0:204:213:ae45 with SMTP id
 o17-20020a5d6711000000b002040213ae45mr5459193wru.157.1647794440978; 
 Sun, 20 Mar 2022 09:40:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm12012388wri.98.2022.03.20.09.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:40:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 17:39:30 +0100
Message-Id: <20220320163930.1566656-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: security bump to
 version 2.5.2
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-24128: Timescale TimescaleDB 1.x and 2.x before 2.5.2 may
allow privilege escalation during extension installation. The
installation process uses commands such as CREATE x IF NOT EXIST that
allow an unprivileged user to precreate objects. These objects will be
used by the installer (which executes as Superuser), leading to
privilege escalation. In order to be able to take advantage of this, an
unprivileged user would need to be able to create objects in a database
and then get a Superuser to install TimescaleDB into their database. (In
the fixed versions, the installation aborts when it finds that an object
already exists.)

"This release contains bug fixes since the 2.5.1 release.
This release is high priority for upgrade. We strongly recommend that
you upgrade as soon as possible."

https://github.com/timescale/timescaledb/releases/tag/2.5.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 5690ce65b3..556cdaf329 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  58a34a7a3a571339a019c0ae999b4ebb9f93e1e0cb828501e32bb073e0a25eac  timescaledb-2.5.1.tar.gz
+sha256  b1a20832189c22ce378f009f9a24ef1db61d7131f7f79bde74fdcde87bcf2d7c  timescaledb-2.5.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index b1e4342fe9..1d8b2a69a7 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.5.1
+TIMESCALEDB_VERSION = 2.5.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
