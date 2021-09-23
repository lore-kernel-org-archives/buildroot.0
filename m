Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E1DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:06:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 312EF61242
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 312EF61242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E51AA40530;
	Thu, 23 Sep 2021 21:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRInFHhPKa3A; Thu, 23 Sep 2021 21:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E63AF4049B;
	Thu, 23 Sep 2021 21:06:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70B9F1BF9C2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F9454049B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-rCf7znM3OD for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10B1A400F2
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:01 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TVupmYQ7NiqGsTVuqmjV3X; Thu, 23 Sep 2021 23:06:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632431160; bh=kz1Z0uWXwEK8kPknUUSO93mwpjsT40HAhcNtInZD8ss=;
 h=From:To:Subject:Date:MIME-Version;
 b=RDd7I8JocNZkvf6jSTPkYGSNBpYWuKWnBY8dZRK5qWg51rk/D0/3DdbguZFK9j9F1
 vA6ot8MigrRgFWtUCmoZL0kUIQk/feoWmRk9G2lGLWBT/bUJaG/LgNr8l7nqDwkcas
 EbJdStjA6+yhEAL68uQezawEbG8AjwC3oIvNmS9Nk84ELSgvYoQHWnYtkQoyOGf76v
 HMyQxSbu1JiKPfuo4tw/iHPteA1E6/BI+oNoPcd1qE29cmFTq3VaSW1MFulZ62fFJm
 HqtDsJdO0G/XzKowXjncbJYeHjvc8tp0Mh9WeSfcSSZ/fP7zoaZWLqoveGruxWjLjN
 r08f0w6U8Cm5A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 23:05:58 +0200
Message-Id: <20210923210558.100459-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923210558.100459-1-giulio.benetti@benettiengineering.com>
References: <20210923210558.100459-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfK09vUBa75DoJ/UPoA6g4dCKYiR+RLUG8iJxb0CmAHuHA+70drbvmLedyxJ4YErxog45tWgPxtwzSn7KHRu/4YWusH32MqcJXq3eis1xxVdtAOGs+azi
 uzzZjEfgpV1jwkWIVlZBnBrEZe99rFEFQ1IBcH8NltOQxC2Gyd2eQ+Yjx1N8PXeyauaI/lRQOwO+RuXoKT47QUu/k50lwZZBYMV5mRpH+3DD6IBCy2rwRxmG
 1KoiPKYb5B97zWXwCmsEkokB8+PTJS+NW1IEoFJNkjfbFmBwTPQJ8MteXjPfDnMbRI5ZpxS4+1NpmbRkQk3hi47KhV3eatVYQv5RmMyceHkw8OcpkZER/zlp
 vEBQ6GIoVHqsBCib4zCoIpJNL8iv2Q==
Subject: [Buildroot] [PATCH 2/2] package/python-uvloop: bump version to
 0.16.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Bump version to 0.16.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 13bb3b7ee9..39951b50bb 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  c97447b8b386971be5e6f4328563be42  uvloop-0.15.0.tar.gz
-sha256  1a503d5b49da6e3dd5607d6e533a5315b1caedbf629901807c65a23a09cad065  uvloop-0.15.0.tar.gz
+md5  79f9a7f3cfe154daf0aade23555dc9d4  uvloop-0.16.0.tar.gz
+sha256  f74bc20c7b67d1c27c72601c78cf95be99d5c2cdd4514502b4f3eb0933ff1228  uvloop-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
 sha256  9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index a0dc554aae..b88475937c 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.15.0
+PYTHON_UVLOOP_VERSION = 0.16.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/df/fb/0e1b479ac5502f3d4531a2fc3f046312616f1ad020c686da353c2ff3bbc6
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/ab/d9/22bbffa8f8d7e075ccdb29e8134107adfb4710feb10039f9d357db8b589c
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
