Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62024C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 08:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF98740158;
	Wed, 29 Dec 2021 08:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b45BUnpW4Mhd; Wed, 29 Dec 2021 08:42:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DAE240022;
	Wed, 29 Dec 2021 08:42:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED3BB1BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8263400C7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPSNQBxmZ3na for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 08:42:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D13B740022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 08:42:31 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id d14so16056461ila.1
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 00:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1TM2hGLksZnd5NL9abPmO6OjXLaEBGbZDj9PED6rf4=;
 b=Av0egmNEEX/UxcJXgr8RM00TVVtntwEcJdWsH42TA/QTTTWkApAJv6eOdA6FE2BoW+
 CPSTd935koJnahtxatBWjXy0Igu+qzIGe+WOYb0r5b0+Oo178nmT3ozn8dgv3loPEE+t
 OafiCTpCRbDrd551h61SaCT881H9CBk06M9pLiGQeI4y9y0BLblZ7xnMfJnlecIByo+r
 +Bbka3Glzo8MnOL/wGR+KSvdohNBWvCWEB1/IZx4qR/1B3ZMPi1MIkVinmiOxlGp88GO
 qaIpAZUANko8wKR5YE3sofqgr/K8cwSxGnAWWOOwWKZleg3oFzXsu67tTAgP8mg2O4IO
 2SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1TM2hGLksZnd5NL9abPmO6OjXLaEBGbZDj9PED6rf4=;
 b=lw+YRAB974TIqUev5VotqLLRFJgnBPR0uJm50TJgjkQ7SQYsXiFgFJM/FXdddf/zji
 f3Xvkm5TtpVgr5frbrPAEVnlItx+DpcstMqxohwN+KHg+rzzrqdbBvRnZm/YI2BlAQu8
 2ISl3cI86u8Fk/pVYuIOFqK9lIBKRzRlThouES6Fp9sTpG77ga064gx2rjr+7jH9PcVJ
 bA01a88M/N2aih31SZiCKLY1VPuRagYZTUjAHbCs0f2fX3rhSuVJ6n3Adqcdq8oPQDRO
 yK/J39TFneEVTbW35jlDCr/0ZWHUd0Lx1q9ZcadzdJkQvgduOIP/8mCFMSLNr0po1Fe/
 Y1Kw==
X-Gm-Message-State: AOAM531oJmaqTON932wEuXDick/6Q9KxEUZcKKEXTkqzG0voYR3pYcs7
 ZyE2aqfj+R9cx8iC9jOqB0H5SB27g1g=
X-Google-Smtp-Source: ABdhPJy/eIHewsfMki4hXqiRQs6a9Og0JtpWPev+2NR1XIx6VUxfMg/PGVOgqx2N+SFbBBAXdQ7WcA==
X-Received: by 2002:a05:6e02:1a2f:: with SMTP id
 g15mr9501436ile.268.1640767350761; 
 Wed, 29 Dec 2021 00:42:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id p15sm12166788ilo.83.2021.12.29.00.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:42:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 01:42:17 -0700
Message-Id: <20211229084223.521362-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/6] PEP517 host packages
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

This series adds host packages that will be used for PEP517 based
python-package infrastructure in a future series.

See:
https://www.python.org/dev/peps/pep-0517/

James Hilliard (6):
  package/python-tomli: new package
  package/python-pep517: new package
  package/python-pyparsing: enable host build
  package/python-packaging: enable host build
  package/python-pypa-build: new package
  package/python-installer: new package

 package/Config.in                             |  1 +
 .../python-installer/python-installer.hash    |  5 +++++
 package/python-installer/python-installer.mk  | 15 +++++++++++++++
 package/python-packaging/python-packaging.mk  |  3 +++
 package/python-pep517/python-pep517.hash      |  5 +++++
 package/python-pep517/python-pep517.mk        | 16 ++++++++++++++++
 .../python-pypa-build/python-pypa-build.hash  |  5 +++++
 .../python-pypa-build/python-pypa-build.mk    | 19 +++++++++++++++++++
 package/python-pyparsing/python-pyparsing.mk  |  2 ++
 package/python-tomli/Config.in                |  7 +++++++
 package/python-tomli/python-tomli.hash        |  5 +++++
 package/python-tomli/python-tomli.mk          | 16 ++++++++++++++++
 12 files changed, 99 insertions(+)
 create mode 100644 package/python-installer/python-installer.hash
 create mode 100644 package/python-installer/python-installer.mk
 create mode 100644 package/python-pep517/python-pep517.hash
 create mode 100644 package/python-pep517/python-pep517.mk
 create mode 100644 package/python-pypa-build/python-pypa-build.hash
 create mode 100644 package/python-pypa-build/python-pypa-build.mk
 create mode 100644 package/python-tomli/Config.in
 create mode 100644 package/python-tomli/python-tomli.hash
 create mode 100644 package/python-tomli/python-tomli.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
