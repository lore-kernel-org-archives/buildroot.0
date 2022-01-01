Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BEAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 19:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA84360A78;
	Sat,  1 Jan 2022 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cMoic6O7arF; Sat,  1 Jan 2022 19:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A14760D78;
	Sat,  1 Jan 2022 19:30:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CBD21BF389
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE4DA40180
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okC5e4HCKG95 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 19:30:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B7C040132
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 19:30:25 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y11so30764839iod.6
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KeZN7aciUGQF7Mk4K03QwHwOl3+S8u0gYhfHIB/4EZM=;
 b=HVQtHh82cD10kSjLtgcuTIuaNaSzb6w6S3/LXWae1U97VmJCGiM+OAUyUSdeeSRKoD
 hd1MRAILwgqANa5v7WEYSIGbH1c87RNshJBRJq85E2XHFQJCF2+PIPQoq74L4RF2U5RC
 KKerMMK+FbifjGKRHeJcNYV2TxKJLAYgE8sj9icS1odL5vD7Y0OI9l3OdLAmAyRk6Pt2
 DiFo6qDjlBM1OYT4mqORb4Fo0EEIzjFys3pzFrIxTc0/XkOeCkIE48IHTw5rvhUjRKtd
 DA4XeXXzaHPJHzSGr5elMvx5OO9+wqt9XWkLpz+cd+IKgWj96dUoS2wdPXr2H4n6+yN9
 HceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KeZN7aciUGQF7Mk4K03QwHwOl3+S8u0gYhfHIB/4EZM=;
 b=S1RRj4Ayu2kQBH6WN7ZacKk/GZdgPK3X7idJ71ctUenTMEt/t19F4+59xdvO941YK4
 SEaazlCWvViW5+DpL/p0fV6Su/5CkALhz7Bvy7bra6UUi39It9YxDMoXv0l1DdL5+Nz7
 8D7tC1FB9KFL8ilWngQvu7xvzn+rCeH/QcDb0dEVtc//HAS4lVdnwGFVh1pIaDR5Bthc
 6q6SZi8yIa/ERtT2ErLCUDRjL5yCWfXrNZqEFiFMCZuSkYj++5MIAcIpqHT8vVgRCAuN
 BG/3DDON9Bw296dtP/Ww0RWVvlD83QCcbXEcALrAPLNLfeFjtREso7rYYzolwJcenJyY
 4P8Q==
X-Gm-Message-State: AOAM530UuY3ggKrQ4R9tOWecOcYKH0qkVO9xT+n1SkAhbh2NtjxaUXt9
 0D7RYwrCLLMWCsoopowTXpcCYZtplJY=
X-Google-Smtp-Source: ABdhPJylBvbs5YyJIwfKKatX6nUrI2fzbzlIowU7ut+pYgUMh7VXzy+dHAX/RBk2hs4bqE/Q8Omerw==
X-Received: by 2002:a05:6638:d49:: with SMTP id
 d9mr17754936jak.79.1641065425008; 
 Sat, 01 Jan 2022 11:30:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id n5sm18046974ilm.87.2022.01.01.11.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 11:30:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 12:30:16 -0700
Message-Id: <20220101193018.404937-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101193018.404937-1-james.hilliard1@gmail.com>
References: <20220101193018.404937-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/python-packaging: enable host build
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is required by python-setuptools-scm.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-packaging/python-packaging.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 6b54d2416d..e2fb9b120b 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -10,5 +10,8 @@ PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3a
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+HOST_PYTHON_PACKAGING_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PACKAGING_DEPENDENCIES = host-python-pyparsing
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
