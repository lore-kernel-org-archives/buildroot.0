Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7425C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 17:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 033C660AED;
	Tue, 16 Jul 2024 17:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOpcbW6FfYXB; Tue, 16 Jul 2024 17:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C843160B07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C843160B07;
	Tue, 16 Jul 2024 17:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BFAA1BF307
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77F9460A9C
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKTYoiGLNzYm for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 17:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83DFA60A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DFA60A97
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83DFA60A97
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 17:50:47 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7fb93b2e2a3so2298639f.1
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 10:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721152246; x=1721757046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TvRyv5Wc9aq5ukrWTpDmB9zUdyVS0QTnN2+UuKaL1pU=;
 b=m86h3YO6tbD8aNiFQBflmxXK2WZndaYLWDvcdEsxKryPtUb8hVcSEcpXAoMtk9SEJL
 nOjdwI5UoIwdk5r8/XViVJSjmEj/VIeW7vMXSVzDj3D9vCAqPrfkcD9QCplA2tak4kfQ
 K/gQjUBXrVfBanZejIF+7uZFaGWAIBfWK5O/5CmidrADq2Moygrm6rjx0duJkgnEKOu6
 lDbRj0kXd/lGEKE1GVVOqvTeBAK/d0xMFuzFPsu11Rv6MVGmuggsfD2tzggOnQKbvZ49
 hkoEUaeKovc2EpH0QcsP+CccbFYcvbFm4J9RmZOIeKkXj/udlY3/Q2fBEhM+Q1jVw0GD
 JTQA==
X-Gm-Message-State: AOJu0YwoumHfpKTQ8M/JR7yP73HokntuszZY8K38pLLVt6Z3ECfaclh1
 vEcSiqrw9uTPufo69zKBogoYhXw9lOkOIJM4LSQ+V06iSHTypncs4gaXyRFk
X-Google-Smtp-Source: AGHT+IHvpE5VcZMlejNFyW9sHTB/E7q69Emxwp3pOGn0ZuYAm2FFoku7YdVt8p+AAfwpk3/oS9ETrg==
X-Received: by 2002:a05:6602:15d3:b0:806:f495:3b34 with SMTP id
 ca18e2360f4ac-816c2a1fbfamr20759139f.2.1721152246198; 
 Tue, 16 Jul 2024 10:50:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-154-90.hlrn.qwest.net.
 [97.118.154.90]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c210bbef1fsm39420173.31.2024.07.16.10.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 10:50:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 11:50:35 -0600
Message-Id: <20240716175037.1844929-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716175037.1844929-1-james.hilliard1@gmail.com>
References: <20240716175037.1844929-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721152246; x=1721757046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvRyv5Wc9aq5ukrWTpDmB9zUdyVS0QTnN2+UuKaL1pU=;
 b=mlPoGXY85SkVm9OFCUbLJxKlXComCAeJ2mKpPb1ZH+YrcNB7hZSlscryYIpYd6P/+x
 kub8vYkLYkhIWdzffZ5xCtYyDxM2zErV/CHpr8Liv62DUSMKwp7y5m8ypgeS9yJezydh
 8S+1yisrwJGTKf22UBwV31yCCANVfqCWxteIlzjqV1i5PSVgFudUZA+smyRpMcxnIftq
 7J7N33OnInz9fYke28ZLIzWu6ksz+ApV+u9PqF+kiaKnJQGaZFGktdgTMeByq00wkTEt
 6bPAEn2JMtINxjgogSsH2BAyOgjlkKW+Di+T6IxfeZZcYcxRwW6eW8L+oa2hMIKwZsR4
 OIdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mlPoGXY8
Subject: [Buildroot] [PATCH v3 3/5] package/python-uswid: new host package
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uswid/python-uswid.hash |  5 +++++
 package/python-uswid/python-uswid.mk   | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 package/python-uswid/python-uswid.hash
 create mode 100644 package/python-uswid/python-uswid.mk

diff --git a/package/python-uswid/python-uswid.hash b/package/python-uswid/python-uswid.hash
new file mode 100644
index 0000000000..b6bf09c713
--- /dev/null
+++ b/package/python-uswid/python-uswid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uswid/json
+md5  e43ff6d49ddcda0c95338d3271694b91  uswid-0.5.0.tar.gz
+sha256  bdcd7ee5afac1da60ee688c357aa12f5f8d74bc28012446b10e2b4a9cf52fc6d  uswid-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  98bc07f3fb70d05b01ff740e8191b9f29c080159f01588991fbd872c611236f9  LICENSE
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
new file mode 100644
index 0000000000..2092a06f52
--- /dev/null
+++ b/package/python-uswid/python-uswid.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-uswid
+#
+################################################################################
+
+PYTHON_USWID_VERSION = 0.5.0
+PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
+PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/dc/bf/05291df12037befeacda2083c798e98691043978e07ca4a00b4eb94aeb61
+PYTHON_USWID_SETUP_TYPE = setuptools
+PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
+PYTHON_USWID_LICENSE_FILES = LICENSE
+HOST_PYTHON_USWID_DEPENDENCIES = \
+	host-python-cbor2 \
+	host-python-lxml \
+	host-python-pefile
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
