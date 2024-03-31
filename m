Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0083CCD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7051D8214E;
	Sun, 31 Mar 2024 00:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaqD_KJ31UPf; Sun, 31 Mar 2024 00:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D1D821B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D1D821B5;
	Sun, 31 Mar 2024 00:42:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23A0B1BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10CAA40655
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vURPPTSIWWq for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECE1A40643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECE1A40643
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECE1A40643
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:01 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7cc0e0dba0fso108299039f.3
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845720; x=1712450520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+LPAHWhrLQaKaP7YHCPv6geOS8iZt9ojpppCT07+Wdg=;
 b=mYDMx2JVl+TC+UsF+il+ez3SFldfNiFed19CozBuHmxPSJfOa52q7OHX6UWlW3JpH3
 IvNBbF3P9RHcnaHae8zKtjSdYWLRvb5Gv4IOntRZcfxenpUSmB2+STjEwy+z0rWvImzm
 d6fXmtg4+4ZIkK8S0MbEVS990gA5k8G8XRb9M4PrsN83D7va1E6os6FdGwaw1/S/xtUm
 mx3I86AQy1cAKwXZh1wk+ASlamqsRGle82+o2AQdu4u6ejv1Lq2Ye3G87+tTEMazM4w/
 I3EKklatPK7KS5Xtdah/qsUnw4WKvTauL0xmg4GlxKz8vyyfSTvUFf2MPXdmrFngr6Qk
 OXfA==
X-Gm-Message-State: AOJu0YyXpbWoXyxhIwVdOvpKhkSc4Lsy+ZCcEwvf8f49RM/GVbU6+U3/
 yQMsRBLFQyXGgGADEDulcmTMZ6mpsHk9E8XkAEsrzcZ9VZeDjAqyyBRkyqYfVDv9xA==
X-Google-Smtp-Source: AGHT+IECH5D17msWa50PpTIn1hk4JKvjryBVoeRc+FY5W12X5SvqoB80gEENzPuki+bvMD0IJ+Mwqw==
X-Received: by 2002:a05:6602:19d9:b0:7d0:3c9f:2a32 with SMTP id
 ba25-20020a05660219d900b007d03c9f2a32mr5852847iob.1.1711845719838; 
 Sat, 30 Mar 2024 17:41:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:41:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:23 -0600
Message-Id: <20240331004133.636618-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845720; x=1712450520; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+LPAHWhrLQaKaP7YHCPv6geOS8iZt9ojpppCT07+Wdg=;
 b=cAXrUOWoMwvrW5dmJwx6A78vZ6fV54mKeMp1s1yZHGWj1IcQ2++2vBFQl3k8qGk+3z
 zXVwcDPD7n0eiS4FJA5pxe7G5ZvxTHa3xWVu3fMwmxxyBuXkvakxbwEcvrIYqJlAVz9m
 KFFtsrigdXRzoQu7n+dDn6VJn8x0CesW9WnO03X8NXa6xk3dNwXLopQtrEFlLZKgoHY4
 JoWErdREp+A7oD9/zoZ72e2dLnWKgy+ER7j63fwbIRS1SNeexIVYIE09sDnQodw9T+MH
 RqfZH3n/obe/gTwkaQkycDbGW0QE88b1xl/uNkJNAwyO7D+xmobLomOW4L0kmqKlO+vJ
 Zs/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cAXrUOWo
Subject: [Buildroot] [PATCH v9 08/18] package/python-humanize: add
 setuptools-scm build dependency
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-python-setuptools-scm will be enforced once we migrate
setuptools to use a pep517 build frontend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-humanize/python-humanize.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 04cb0713fc..6155954b82 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -10,5 +10,6 @@ PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/51/19/3e1adf0e7a8
 PYTHON_HUMANIZE_SETUP_TYPE = setuptools
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
+PYTHON_HUMANIZE_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
