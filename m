Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17526C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 05:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AA8740613;
	Sat,  1 Jan 2022 05:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ls0P671o6bIU; Sat,  1 Jan 2022 05:02:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 708124098B;
	Sat,  1 Jan 2022 05:02:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3704E1BF28D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 05:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D20940A51
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 05:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GL4I2wkF7AkX for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 05:02:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C61FB40A23
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 05:02:09 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id u8so22240624ilk.0
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 21:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PM7UtK6XRMhzbZYKtTFENq5xn1KlKKcTVXt//jFfDMg=;
 b=LvPkXaOBfxY7aWNHEXmCfIKQzPFPJ+TKqgvqDUlHs7JyqzTQdVJv26PHisy5sQOWpO
 3u+Y3l2uSdv8xRMV6gAy5uEDdMZIxpCR2CDGGDHYtRTs+cwmdnV1tS0pghOGe0DnQYVH
 RaNMZ04vkO0NbxTgpryWJTTo5FA7yecC9oyfmLcRCDGYNMe4IoH0BTBFFYI3TjMRf2Tp
 FmvFAF5mzdpPi2EIF0Z9T/UHua9/QgF/Kpo1mefDTXWOuWX6IwbiZ+0bjt+1lC57TLyj
 u+Iw5AbzWv/qrYUMYU4E9lcosENalBEPJ0ND8WrRVscKJiBPS2T6BDyUvlcTdF4+DEyL
 PtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PM7UtK6XRMhzbZYKtTFENq5xn1KlKKcTVXt//jFfDMg=;
 b=x2zGmf+z/tVIrAQsKU1Vm2+E5M46Dkh0tlVFlSC3lwF5OPfuvqfwHN8Og1SB2vlAgP
 BvM2nXx/REaqPxjToH3ePlbpJP3AAlIJ1z4vhXgOyG7l+uHjnS4OYdQa0sM/T/kI86sb
 w1GD6rOf41kvlssnFSSLt5p4p/vJ9YUiM3ImM9ZrI0gDJ7jR1w9Oz4BvPPSOEDJdN7oh
 rpoSIyirbl2qvKIKRe4HkYfYtUIW9nsLzPFENlTZc6l+u0nDvdivxu4gWq1DK2/xj7t5
 DxzGso8qNTAomyQ07Fv4mGREV7NGRjSbgOMNmoOaXTX6lvY0VVY0gX+/iyAETFctp+Z0
 nPDQ==
X-Gm-Message-State: AOAM530jdDnLfYlt1z1LjczT3mvDkAyY9RGspsiGMVWeQsi0brtjmj5S
 I3VB3KCpsbdtFk4RQDwXAtPgFJVVqyY=
X-Google-Smtp-Source: ABdhPJyVBph6OigEq4uKe/ZmFxDN12dJaIFwMg5MkI08lwrTJtOqAjeGbY7coyJWLyifWO0TpcH2vg==
X-Received: by 2002:a05:6e02:1908:: with SMTP id
 w8mr13909719ilu.148.1641013328666; 
 Fri, 31 Dec 2021 21:02:08 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id b24sm20481338ioc.18.2021.12.31.21.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 21:02:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 22:01:52 -0700
Message-Id: <20220101050152.1991600-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiosignal: bump to version
 1.2.0
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

License file renamed in:
https://github.com/aio-libs/aiosignal/commit/98b25a33d08821a2948d334b223e2874979f5bd4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiosignal/python-aiosignal.hash | 6 +++---
 package/python-aiosignal/python-aiosignal.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-aiosignal/python-aiosignal.hash b/package/python-aiosignal/python-aiosignal.hash
index 3fdd459502..f2a09749b8 100644
--- a/package/python-aiosignal/python-aiosignal.hash
+++ b/package/python-aiosignal/python-aiosignal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosignal/json
-md5  f3edf1b700b4fee6ea6ed375c3f6555c  aiosignal-1.1.2.tar.gz
-sha256  15605698a0401075a03d36cea979e3c0e6cf8467a9e3b9047040514dd9e6f43b  aiosignal-1.1.2.tar.gz
+md5  011700c3acc576a3a38deade6a4860cb  aiosignal-1.2.0.tar.gz
+sha256  78ed67db6c7b7ced4f98e495e572106d5c432a93e1ddd1bf475e1dc05f5b7df2  aiosignal-1.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
+sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
index ea11d97060..e0436e973e 100644
--- a/package/python-aiosignal/python-aiosignal.mk
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_AIOSIGNAL_VERSION = 1.1.2
+PYTHON_AIOSIGNAL_VERSION = 1.2.0
 PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
-PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ac/f7/c3df3b7eac6ea96175e0817b272b43b398d5ba589be09a50d1b758d5b852
+PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/27/6b/a89fbcfae70cf53f066ec22591938296889d3cc58fec1e1c393b10e8d71d
 PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
 PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
-PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE.txt
+PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
