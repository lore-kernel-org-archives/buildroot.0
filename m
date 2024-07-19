Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C32C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 06:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA03607FC;
	Fri, 19 Jul 2024 06:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skRyCCQU1KV3; Fri, 19 Jul 2024 06:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA0A360894
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA0A360894;
	Fri, 19 Jul 2024 06:32:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A46EB1BF362
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D00C81F5B
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oM0uo7CL8aEL for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 06:32:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9128881F53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9128881F53
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9128881F53
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 06:32:40 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-8111f946f04so60644339f.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 23:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721370759; x=1721975559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTAAZTBSX3XkGzO0+2p8laqGnHpw7pcBTjz3yWtwL7g=;
 b=hcgM/ERUySsnUXnvj3c3xGDbGO5Fi8HN2F0MhL8rr9XNiPUoInTI0VjNj7fj0dMhf+
 q4+wurHFNXTW+w0TgJ0OZasWPaQi8cemgydvHvsLd7X0Tms7G1EjzlYBa+0d5cyJnT4F
 kLUB1SLnQt7EBVOkVNIJUEdxw1ceM/5l7rryAfiHuQe9VowKFrliT+vnEUanVsXn+EMt
 CmOhjE05xmYrjpG7+JDqFv7gmzWNotJBRHxtudcwfIW+i5yuYLWu0B/jusEACGGjWAXw
 +dZgMPVBR7Snf7GHOzSmu+/9k5Pi4NSHAx+Tr3WbyNr0oEPcMlzpb3VAB6wpIT3DxfHA
 Bhnw==
X-Gm-Message-State: AOJu0Yw1NC0DKwPQSBlOlNImrpn+2IjqS14C0ncmOwaG5YyAie2uTmSI
 mJhvSM0aw32LOTxWx+I8lB8O1OVLquT9Z5opeg8a1yT4Vi+v4RcshkwkAA==
X-Google-Smtp-Source: AGHT+IEdjxc+ePhCMctmp1KQV8+eAX0o4RmjSsWKDqI1hSXVH2WD3nTkpZIZfjyWiPAQgY/Sn35ceQ==
X-Received: by 2002:a05:6602:15d2:b0:806:31ee:13b with SMTP id
 ca18e2360f4ac-8170ff4a414mr1121897539f.4.1721370759122; 
 Thu, 18 Jul 2024 23:32:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-819ac79ab26sm29587239f.22.2024.07.18.23.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 23:32:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 00:32:30 -0600
Message-Id: <20240719063235.3823015-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721370759; x=1721975559; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TTAAZTBSX3XkGzO0+2p8laqGnHpw7pcBTjz3yWtwL7g=;
 b=T39t3lKFoTg3Ds/vjDVP6jKSzxhPzYk4xv009fkjivv9CS2FlDM2OrKVvA2i0PNPGP
 xbgXVo0WCM1sJjlCA51u/vdvnx0CT+lTgShD0xLrxQQ+FgC6W/+LQO+qcklBWe1D2Fva
 GwHPJ7YZ8RdNuYpA+g+pRx0fEdMgiqpH+hxp5LYripOyBYRXrUSj+4awR2BZ/mpnyyBA
 sPww31J2P7fLbHv4DAV9T10KlEkYH8o2pTkOun6+ZQEjmLKFe4Oe7ruugYjBR69S3SvH
 yXRUtelAtMJ0pE0RYdURwDcg6BUwXMUm8OEYS/n/92YhDaxbaq2yaFn6XeKxL/dQICxG
 SVSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T39t3lKF
Subject: [Buildroot] [PATCH v4 1/6] package/python-pefile: new host package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pefile/python-pefile.hash |  5 +++++
 package/python-pefile/python-pefile.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-pefile/python-pefile.hash
 create mode 100644 package/python-pefile/python-pefile.mk

diff --git a/package/python-pefile/python-pefile.hash b/package/python-pefile/python-pefile.hash
new file mode 100644
index 0000000000..af2288487d
--- /dev/null
+++ b/package/python-pefile/python-pefile.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pefile/json
+md5  fa0eba7c91f4e696771ddbfacdca25e4  pefile-2023.2.7.tar.gz
+sha256  82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc  pefile-2023.2.7.tar.gz
+# Locally computed sha256 checksums
+sha256  bfd4b5e4f8a99c961fd6f94d708e38396cc146bfe8fbc5d2a86e63aa29fb4208  LICENSE
diff --git a/package/python-pefile/python-pefile.mk b/package/python-pefile/python-pefile.mk
new file mode 100644
index 0000000000..c65f1deb60
--- /dev/null
+++ b/package/python-pefile/python-pefile.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pefile
+#
+################################################################################
+
+PYTHON_PEFILE_VERSION = 2023.2.7
+PYTHON_PEFILE_SOURCE = pefile-$(PYTHON_PEFILE_VERSION).tar.gz
+PYTHON_PEFILE_SITE = https://files.pythonhosted.org/packages/78/c5/3b3c62223f72e2360737fd2a57c30e5b2adecd85e70276879609a7403334
+PYTHON_PEFILE_SETUP_TYPE = setuptools
+PYTHON_PEFILE_LICENSE = MIT
+PYTHON_PEFILE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
