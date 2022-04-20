Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6053CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 18:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB1F60E15;
	Wed, 20 Apr 2022 18:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PD3L-N0qbQct; Wed, 20 Apr 2022 18:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F39760C09;
	Wed, 20 Apr 2022 18:36:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13B1E1BF3B0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 022D160C09
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0VflIhzz0r9 for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 18:36:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C0EA60BF2
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 18:36:49 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id e1so1567171ile.2
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3iY2NgE/K8ukpAtWnHPQ+g80TC1/df6VwAy8hRwCW+0=;
 b=nfRJ8/fxrpBoJ2szNubz8Ko5ZVZ1h2v/7YObHzo8rt14ePmuvzBm77hViEoX2GCymB
 Ba2oPQD94kRl51Qij+wMwa4/p2/DvFac1FDV0EBT/wCBrijPIP8y2UT3DOxd+wBNf+ux
 6oxd/rir4O+qFsCozPprvzYpzWDsvL2AsE9L7SQJw6Ae6PJrgVtBYsDUIIJSs7YQWWfv
 VqNMsBdrHVdMaWMfbb2KEUW1e/c2bsM9ffw7dEekojHtjsGJLL9lY9S0bWorna8KhdfB
 fKkJ2xOLwZ0hai9b/7n2Hy9dOEkar1EDwuwbrEvv0JlfYqauDYLsFc2/yKZN26xC5oX+
 QPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3iY2NgE/K8ukpAtWnHPQ+g80TC1/df6VwAy8hRwCW+0=;
 b=lp+Kh4uPuYuWhlgFXP5YgMilzE+T5iWroYukUaCHFgtRmrncVTPu0Wu0jRRQpKmZBY
 rnlWkbGv4Yj5LrdctWd+B4YOmCxF0gha77F/diSRjENqBmNIDqT+EcFnjHuvkvQIw26v
 XD1knujeQHNZCU+wPnBc0GZw3KTP4CaF7RT5EMqJB+5uFUrYVZBAQ0RtCnVdD+xMbh1E
 jxCoK2queujazJ5Rhjx1thzodcJhhUpgdWbeK1Afq5r85vEP17o3avFre4trgUQI3GOD
 inyGaxLWCyDNlVw+GFxHd+C2nNAOh0VhzpTFZ9AKsJJrSUnapDFuDtVMZl+t2J9bFPXb
 9bsA==
X-Gm-Message-State: AOAM531ut1MaSLYxUwW9tntY1Nn/tQ3pjwR0Fsvcl0IB2SYvrOw+nImk
 wLvY9C7BzmMkowf2cgTkvphbn6P0jXSv5g==
X-Google-Smtp-Source: ABdhPJyE8bCJgRACvH+9VxkyH69zjzuVjYrA714JUDpNwODeFRQ8n5ibBBmY0DuoRUDuZMHqZl50JQ==
X-Received: by 2002:a92:da49:0:b0:2ca:9242:42bf with SMTP id
 p9-20020a92da49000000b002ca924242bfmr9520726ilq.265.1650479808446; 
 Wed, 20 Apr 2022 11:36:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 n12-20020a92dd0c000000b002cac22690b6sm10786745ilm.0.2022.04.20.11.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:36:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 12:36:46 -0600
Message-Id: <20220420183646.774923-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 54.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 90ccc1d057..3ad59b6abb 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  3917447c277db6931b8370f1d725db49  weasyprint-54.2.tar.gz
-sha256  d5e8aa82e3e2a2477a4543f0646d9fb14080c9ba34a0859751eb23757cc00466  weasyprint-54.2.tar.gz
+md5  262af43e54ad89ecd0e304bad799c47c  weasyprint-54.3.tar.gz
+sha256  e04da040630566c44caa202033f07f858765f536709045a809739f3d048e89d6  weasyprint-54.3.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 925de855bc..f36e5b51d1 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 54.2
+PYTHON_WEASYPRINT_VERSION = 54.3
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/f3/dc/d3d6f1d87a0a0b09637a1f5076790e229cc803c3584ed4edb76553844001
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/e3/ba/d3453a6024e56a789ec9099a770c08b9998f8a60bf9b6375d9e76d67101a
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
