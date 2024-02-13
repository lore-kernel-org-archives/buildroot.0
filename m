Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2C1C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB0882316;
	Tue, 13 Feb 2024 21:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okrWDwiq5qfT; Tue, 13 Feb 2024 21:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65097822EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65097822EC;
	Tue, 13 Feb 2024 21:16:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18EC21BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0C8F822B4
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8N1oS7bqWeoS for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F1B1822AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F1B1822AB
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F1B1822AB
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:51 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7bf2c826a5aso64858539f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858950; x=1708463750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAQovp2pP9uWY1RKgs/JXJhJZs6eU+yRrbQmJYY1xY4=;
 b=chZNDLKflFDNsD1UQbj4flwPpWywi9Ziv3yP9xCn9I4AQOBE311Ze3xMsOTzhoRDhw
 0kiMZYa4xvl27G4yiFidJ+hnVKF7uBwqH2iOwxn13vo/ujCbgxwXUeIIFJNk/n3nGZSO
 RvtmogUHA/VZwaU+izTNUqENgJ2/qHlg4WRSziK8OdmJWq46QEFBmTXHQS/0r3JDZCKo
 f2qkQUZ0c8M4R3bFFjGYrzgcXRIXP23/KGvN9zxjwfgVkAoivFtBHjT4apD3dnpQnkof
 SLTuCQCx5156ELt1+mji1RK+dV8GGJvTFVf7g4vmV/aOW7VrUjjsFJ/EZNQjNU2H+UaZ
 jRuQ==
X-Gm-Message-State: AOJu0Yyh6Lzbd0puYEVjmrMV8BQXlaZkfx5Gz79r0Lqu71ASb5EZEaqC
 ekKY5RDLjyVHKVWYW3Gw9WASGLvAEGVgER/ZmDuKv5ev/G19j6WcYuixymnJJiwvyQ==
X-Google-Smtp-Source: AGHT+IFmPd6J5chRpSbSRm4MsGTbf95O9sARYfZmmoEnsKsL8dWR/LUZ1SsIBcIE/N0+4ELCjGBdeg==
X-Received: by 2002:a05:6602:2bee:b0:7c4:7e9a:c8d2 with SMTP id
 d14-20020a0566022bee00b007c47e9ac8d2mr896066ioy.20.1707858950340; 
 Tue, 13 Feb 2024 13:15:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYEJbnCXCj8EajDiKbKuxBPpSCx9eqT4XI39KclGNJleB0nJegtO/LlNQxy8V3l2kTxALi2UOOWbEyi751g/dYCcyBjm807h5C6kSF9l6Z/IdQoLH1sYghBWGVUgn9diJDrBxjF0zQ0jdELxHV0dOb2un6pv72Y+9bZp0/uW1ygRRVRpNAmrls7e7HuOhezH0OimBfRVqUhGVJ+LKAPQjotk8kpH2BNNHxDmBuzuA+FyJU/uYoA11BOPoIbW8vKXoTASO106G6ef7GJ2mdyny6ion8Uhm90znP/Pi2h1/jPv50ZlU1P1iHG0eZ1HRFLqb/HVTvU1R30tkE9sIkb/fn3qnV7XUDJRjtbAubuoJmaKm7m/QGMj+sE3iQTS4Ow+vM9cae3yzBTZBrbHy0x2kRoIPMGA8QdTjCSa7QWr8tgwsMVW0ZcqQPP/lFZklz2LDWU0sbaox1r99vz5PRpxNPtDQ+bNGu1+jbIgdzmTRa+eC8UZYqLK7+2G6Mvwx8UmhVz1QjqDAyS7bkpCSCaXBvB2T7U9JXnTldIutemZG+U3vCZw38FuzDFgeSx/dA7RgesqQ6klj1gYRA7FPrau5BNhvk1dXoXDgmTpmSzREWPHi4JNK/7zjeOSItnQDUW+fYLAjCicGfJ1ZBwEkbw0hgy6wdXO0Opn6tyEuzkvzBZkO5oG7eYtBdf7TjTRiZEBq6c+m0BGd2s8Hn3aevA1HvkAQmLCNJwrWgCIfTxlz+mbLQdwGcMg==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:01 -0700
Message-Id: <20240213211512.3918044-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858950; x=1708463750; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAQovp2pP9uWY1RKgs/JXJhJZs6eU+yRrbQmJYY1xY4=;
 b=YSqSfmdyJRT5CWugPETgT7Ih0QF03NQuIWRkkH2ojT0wzdjf8TU5FP9WvM9lHdPgke
 WCbO1Kjz+aFqDUn7Z8naknPssCADPMHWvi9JE36kQSeu9RKSXfIvJR8RDDVSo2t+98jK
 0FOgVhfvZb98LjCY3J4nity5111p+cC609ZKrfrtQVjmfoZ2kkh6rF54+2WCqglpSznX
 /Ioy5z4pGCXmWFHeyLrL4zCrQUQI86omZ5FUF1dQBwtAvvZW92mv7bFdghoheK8QOhu6
 CTqoTkmj05gmM8Jw/lBgV1hHY+kZH0lLId4fhK6ojg5gKmjYntsXjsUvAjL7obHl/gVe
 dTXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YSqSfmdy
Subject: [Buildroot] [PATCH v8 15/26] package/python-frozenlist: migrate to
 in-tree pep517 build backend
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with a pep517 frontend we need to use the specified
build backend as opposed to the fallback setuptools build which
only works when not building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
hatchling and not setuptools.

The custom in tree backend depends on setuptools and expandvars,
additionally it depends on cython 3 unless disabled.

As we do not currently support cython 3 lets use the pure python
build instead.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-frozenlist/python-frozenlist.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 9333598808..92670b3cbd 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -7,8 +7,12 @@
 PYTHON_FROZENLIST_VERSION = 1.4.1
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
 PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/cf/3d/2102257e7acad73efc4a0c306ad3953f68c504c16982bbdfee3ad75d8085
-PYTHON_FROZENLIST_SETUP_TYPE = setuptools
+PYTHON_FROZENLIST_SETUP_TYPE = pep517
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
+PYTHON_FROZENLIST_DEPENDENCIES = \
+	host-python-expandvars \
+	host-python-setuptools
+PYTHON_FROZENLIST_BUILD_OPTS = -C=pure-python=true
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
