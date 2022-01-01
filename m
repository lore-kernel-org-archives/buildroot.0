Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522A5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 19:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA97660D4D;
	Sat,  1 Jan 2022 19:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQA2rLb7OBjm; Sat,  1 Jan 2022 19:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3934860B3F;
	Sat,  1 Jan 2022 19:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB131BF2F1
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0A7A81310
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRvvVdHmLw7g for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 19:59:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D84D18130D
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 19:59:14 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id p65so36179114iof.3
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 11:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h1INFJF5SDS2DgVI082fktnZyx6beXp+QHXn8AwYRKE=;
 b=Tuij6qG4LWwx2aTjfevHp9gIg1YBmDjNuciwgevZBZJHtbNceA7/rbYoxjA8rc/BZ4
 VYxMlnjXqhQ8ZOjPce7ZloBnsXnJ+ewmPtmDvkB43CVZxOD8loaNpAQK/Fdv4vTsieSq
 2KY/+tm8E9r6aROLGdwpOU/bCdNztWmhwyoNni3YVRu57EVJwUgyj3OzQrf94t4NImKF
 AEEsv69fH+zVljpeunCcWlMBZK8JMlHE058gvaI0p5bhsb49AlYnvwhMZa0X1WYhdm8M
 tNR/VC/ZPhXr202Bxir2i4OskkR1HZl/0Un6jsLTwzT4/2XXiji4CqwtpKOjrzqLGIwn
 maHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h1INFJF5SDS2DgVI082fktnZyx6beXp+QHXn8AwYRKE=;
 b=NHGMsZa0PMe7fumgnxRwD41dS/SxqRcAZCzXRnRonMOsxsvkwOiBcMW+YPLQPdf/3r
 nYjqmrnBVQSKPXd7DuyCkhIG0OB02xlj2Amm2WauJCWH+qBkJ7s7bMHAY9yEP/jXGPSG
 LiI+nCIeLO0rOLPajBlrXsXsQeQRRiPGdMISdSUI8umIHHYeH7iqKeI72FCgENaoF3L4
 BgjZ7vXGcSY7VW9EQCs6T19sLQMsyHFFuwGPhtjpNYrW4T4JrdFsBXBqt9qAo/7FKPFk
 apTfKQR5to6awX6BTnxsWEobFNT6Z5kRN1kyVaydvMV15yUnpAnWYME7IHNnF7gVr6mc
 uoxw==
X-Gm-Message-State: AOAM531nAnyIKVWLdH2EVRd3yeiljRWvwdWLda/jP6SP0h7Pepl2tIgo
 g1LKB9cfHNIcZrGcHWUABalbZr/VO8w=
X-Google-Smtp-Source: ABdhPJyXksTo6eFhcxrEo8T8d3/ngSD1jUCcoL/OXsVOdqteGArw0e2Y3CgSfGw/OedpUqprHZRt4g==
X-Received: by 2002:a6b:6a13:: with SMTP id x19mr17825602iog.178.1641067153837; 
 Sat, 01 Jan 2022 11:59:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id y15sm22289040iow.44.2022.01.01.11.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 11:59:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 12:59:10 -0700
Message-Id: <20220101195910.406035-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aioredis: bump to version
 2.0.1
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
 package/python-aioredis/python-aioredis.hash | 4 ++--
 package/python-aioredis/python-aioredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
index ca3f64d1e5..29e6361014 100644
--- a/package/python-aioredis/python-aioredis.hash
+++ b/package/python-aioredis/python-aioredis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioredis/json
-md5  343a451df2381b9ea368e12b9075caa5  aioredis-2.0.0.tar.gz
-sha256  3a2de4b614e6a5f8e104238924294dc4e811aefbe17ddf52c04a93cbf06e67db  aioredis-2.0.0.tar.gz
+md5  8f3547af83ef4b863b18c19f23166a9d  aioredis-2.0.1.tar.gz
+sha256  eaa51aaf993f2d71f54b70527c440437ba65340588afeb786cd87c55c89cd98e  aioredis-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  183b21f240e41af611c951d01d4f36793d470a82d5fd79efc21f25ae4cf68543  LICENSE
diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
index 21a8a349c5..798dbd0c3c 100644
--- a/package/python-aioredis/python-aioredis.mk
+++ b/package/python-aioredis/python-aioredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOREDIS_VERSION = 2.0.0
+PYTHON_AIOREDIS_VERSION = 2.0.1
 PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
-PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/92/60/a3cb5fadc254cc6e709ba14a02531870b02386b8c7bb147bf80a2be93f76
+PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2e/cf/9eb144a0b05809ffc5d29045c4b51039000ea275bc1268d0351c9e7dfc06
 PYTHON_AIOREDIS_SETUP_TYPE = setuptools
 PYTHON_AIOREDIS_LICENSE = MIT
 PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
