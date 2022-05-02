Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C665C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 13:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004D282F6F;
	Mon,  2 May 2022 13:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WjhJEh3Hn8S; Mon,  2 May 2022 13:53:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F4CD82C7D;
	Mon,  2 May 2022 13:53:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 942461BF3CB
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 13:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81FF3405BD
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 13:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vt_DMPg3we5a for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 13:53:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4E99400D0
 for <buildroot@buildroot.org>; Mon,  2 May 2022 13:53:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id p18so16687868edr.7
 for <buildroot@buildroot.org>; Mon, 02 May 2022 06:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=oG/zlmQh6G5iigEONjlVTKq6e4S9oBkTtyW/1Z4NH9U=;
 b=Ae4anNZVDLDfMk16Lhyl73/+zaCBkYkzTFPUjniPJO6GHv35kzzrDKVG0FpFrnxGuR
 LrIr/UeBLXcy3y0bzHkpnet3WvptHSrAq5RO28XCOmZIp0m8ivO/8ujbkNeO/Ul3F7jw
 sIz6SPq4cqa8jQTm/qD4NeIotiEkEI1Os7U2E+o1gcSsxRXGJih+635eqUTNn91qhh03
 fQO6qKljDOOatOPE11LerT3DDSs24KJLtpm7TvqzgfXO7LCiPRJevP6olq4ZYENMnsCd
 KoUU4sYdICq848Z0BZ05HIfHDwj8gq2ACPDIZySjpoG0jrwb0G4/wo1lu8aieta6Pksc
 Q2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oG/zlmQh6G5iigEONjlVTKq6e4S9oBkTtyW/1Z4NH9U=;
 b=pKFRdddZq2Yu9aXXcLtWWFdMr/srCoGMcqMplG635BF5Drzv3OH8VA7xlMDXbl8m5N
 60nMtMWtMT09wXT2PABszlxMwBYv6huJzZZuFEuzCDYNVfSELQQf8eO+t7AlkUDrOM7A
 Spe4XzfxVV8aNtP1Wku8jzr4QUjXM/QZL64i62MHTpIU0n5J6Z51FC9stnxZACa6hLEw
 AB1e37T4FK5Tw+ZCijKesAK93sSm2UpJ4p37/W+mCdD0JTLp8l6nUnoc9NgtVB1DtxLY
 AqIkgbDyHIkRZwoMtbHbYlWlcAlk5AhPpYHAAiRZ9OswOM4TGEex0Yb7YVzx4HRKQNI2
 53Uw==
X-Gm-Message-State: AOAM530pj2q7tSIm42fg/e3wPYgbL1TEaCqJE256oniCu3kILeI6nfPa
 yB9JRo7ZKMelZAbwnaQv/gf5g/PTV+A=
X-Google-Smtp-Source: ABdhPJydWUAUE2ZJNR7T8eSCvUGVc4FU0PtdATceI0w4kXUVyBY0/AdLNhxocXqUSPZlch+DYT/49Q==
X-Received: by 2002:a05:6402:1d4c:b0:427:d1f5:3a41 with SMTP id
 dz12-20020a0564021d4c00b00427d1f53a41mr2648974edb.218.1651499629580; 
 Mon, 02 May 2022 06:53:49 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 o4-20020a056402038400b0042617ba63c9sm6756318edv.83.2022.05.02.06.53.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 May 2022 06:53:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 15:53:40 +0200
Message-Id: <20220502135340.27665-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/python-aenum: fix pyc compilation error
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

_py2.py uses syntax not compatible with Python3. Remove _py2.py
to avoid the following compilation error:

error:   File "/usr/lib/python3.10/site-packages/aenum/_py2.py", line 5
    raise exc, None, tb
             ^
SyntaxError: invalid syntax

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-aenum/python-aenum.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 9a30211bb6..6d90a59c84 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -11,4 +11,12 @@ PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
 
+# _py2.py uses syntax not compatible with Python3.
+# Remove _py2.py to avoid compilation error.
+define PYTHON_AENUM_REMOVE_PY2_PY
+rm $(@D)/aenum/_py2.py
+endef
+
+PYTHON_AENUM_POST_EXTRACT_HOOKS = PYTHON_AENUM_REMOVE_PY2_PY
+
 $(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
