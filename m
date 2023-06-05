Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC18AC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED00822D1;
	Mon,  5 Jun 2023 07:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED00822D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DhP1VnQd7-s; Mon,  5 Jun 2023 07:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FBAE822C9;
	Mon,  5 Jun 2023 07:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FBAE822C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 468BF1BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1687C40472
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1687C40472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jTDpp_0aJCxR for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:41:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC98403AA
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FC98403AA
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:41:26 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-777b2af1c53so50990239f.2
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685950886; x=1688542886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yf6SKBX+QVYpdO2aBs5QoR5hqBE9Jwl3rPFSmcC0DZc=;
 b=SjJnBhz2yvkgmpGJVKnGBhE+bK2pQJ02Zq3UGNulpwoefWbINviKWQ85fOkKx6kKtC
 CZ5GPXAsHJXCOgLLIyRVgvOOX5jhiHaK+LWHOl+N33FiqPEgQmQG2bd0mMruxCK2RDfw
 fA3Ng7oSok0jR5utToZAPm0OCh/Q1VWjicv/8QbOw2eaYEusEPHBYQo38K/21GPBf3Jk
 yFBzys2lUP92r9wXO7N4JxRBf8eHQbZbNBaAcwhxzvcT6+aWrc1z875eoduJXmCvUyJg
 iyWoB3o9jU56BI3TuvX2Rp24Q7kjPOixqpQtVAwLxnk18gq3AAIuAFx1ENhr/8RrR/Mv
 roFA==
X-Gm-Message-State: AC+VfDyDNsO7lmr5/G/0YhIn/ZXU+MeDSmhtTLbsk7sEB2na9xRW8v2w
 fNGnkuLixd1elCrEzRCqxUbQEzm8Tl5hXg==
X-Google-Smtp-Source: ACHHUZ6/WVeUuFfNiCxjUFc5UiZaL0cQk05iwq7WmO4BRVH/3znpcjHBWDXnYmRrKuPHDZFYTlbYUw==
X-Received: by 2002:a05:6602:2584:b0:76c:785f:8f82 with SMTP id
 p4-20020a056602258400b0076c785f8f82mr14790173ioo.6.1685950885965; 
 Mon, 05 Jun 2023 00:41:25 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d9c8a000000b00704608527d1sm442441iop.37.2023.06.05.00.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:41:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:41:23 -0600
Message-Id: <20230605074123.1895333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685950886; x=1688542886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yf6SKBX+QVYpdO2aBs5QoR5hqBE9Jwl3rPFSmcC0DZc=;
 b=UgOHiJ7q6DxbCJwQ822zKlfqEaHoxmaNJkcRZ+uB5erGq9LPgbJT5z3paBsUBjOdxk
 9h0E+4JBadL4Hla+SS5HOHAJ/fYVtOUPj3OMzAxDjrQCzTUv9G/6vymaY56dockVJfD8
 NEprHNC65a7EWeCiumEYctF/v1PSnh/kI/4ERS4amtJ0mIG4eHauOKQqT16T2pp9rDh0
 V5ZPeWvqCuV8d29TCt7dCy06pNJXuHzMhUnQE6lYgHcLxLTG1/+pERijyZtXfGGWDN2l
 wkghojiB6GECU/u+73UP289fY3NUb60MJK4whISM4gKl7k8gEKv83SqnVI+3xeGBeDo7
 SSFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=UgOHiJ7q
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: bump to version
 2.15.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index f7396cb3d6..9714fd2ea0 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  447be4afb076c8325a7dc659aff5b931  Pygments-2.14.0.tar.gz
-sha256  b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297  Pygments-2.14.0.tar.gz
+md5  e40631bb812bbd15954027c23b23013a  Pygments-2.15.1.tar.gz
+sha256  8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c  Pygments-2.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 9c4f0be6c8..f151f0061b 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.14.0
+PYTHON_PYGMENTS_VERSION = 2.15.1
 PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/da/6a/c427c06913204e24de28de5300d3f0e809933f376e0b7df95194b2bb3f71
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/89/6b/2114e54b290824197006e41be3f9bbe1a26e9c39d1f5fa20a6d62945a0b3
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
