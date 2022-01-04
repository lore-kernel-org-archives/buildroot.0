Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E98C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A048C60B91;
	Tue,  4 Jan 2022 17:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiQNlvuyfX5r; Tue,  4 Jan 2022 17:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E750260B43;
	Tue,  4 Jan 2022 17:49:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2A551BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE47881846
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBC8RWswKZxs for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6424817FD
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:49:08 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id gj24so32006035pjb.0
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KeVHzOousanJp58N7Vmljr7JcJAFiRAQrFRt5LJkjKU=;
 b=UZMpnkyHdJRN1VeqmH78hYjK6ILg47TKRNZVpnhsJ2xsWWHhO8ZI+Tc2jyxc/UrzdK
 oPdhZis2Qdw144b2ID3Eoi+ui3+dBQWTWFK7bvpiA+V49AZA0b4HT0j8sbgelimdzN94
 XcbzS2bxofjdKdM86zqtvOM+x7F8/JjY8Z8qHdmGuEnZ8k0SE5QSncBnNGsutDXAMFfq
 znhb6dplKvGxrD/mot/nJhXZvDvv1uf/GwSjO/VRi8lsaxy5JE4slztZEtbpsjGHPuza
 bpGjdxmK4lpPiH/5QS8lIc3oYIINwPyxmkKX8ZdXkF17qc7dGye22dSqeFEIHwRY6KxV
 EM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KeVHzOousanJp58N7Vmljr7JcJAFiRAQrFRt5LJkjKU=;
 b=2Z/MURftmAjRwu2QGwZ8lmJCU+g64VwdbyaDsauEeiDmTMaqn3ZqiecInqhMd9iQSM
 yBhofxJlGEhv5A91lkmmkKmO/BarmzFEw+pzPg2gqLa84577ZRZJKKwkafwBF9znC/c2
 sfsVUdNpuM/6Dmu+ltx4ucLmO/zt0Ssu1tefSKUs/3jSMTp2F0chRn2CX5wOW/sRW7l3
 JfVw6ihN8v0/x6C/Uv3QAYx3/xBhPi2uJxFL2kOfp1DrPKnqR+/1kfsm76Kj8lCrYMkc
 /3CYAOTVmIzkdawyTLrZBbA6YAdJSYf4XbG7q2MX9y03PfisggD2mPhnV1czyxLMRBT8
 Fp1Q==
X-Gm-Message-State: AOAM533QO3ps54CWByYGDNif63YVfzdj7du1HBSp4bCFcJd63SZScygN
 1aWhizaLEbUygERAAGYd+8xD7cXK3Xo=
X-Google-Smtp-Source: ABdhPJw3FtgY2mu9YqJtCCeGJnqcEX6Ovz1cW8m9lGv/XYjDpfEsRW2nE4/Nq0Ry9sJd2IlUrWDutQ==
X-Received: by 2002:a17:90a:f682:: with SMTP id
 cl2mr61606562pjb.124.1641318547929; 
 Tue, 04 Jan 2022 09:49:07 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id j206sm8984615pfd.94.2022.01.04.09.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 09:49:07 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 09:48:57 -0800
Message-Id: <20220104174858.2665848-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/1] Fix per-package builds with qt5
 submodule packages
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Based off of Louis-Paul's earlier work[1] and And Yann Morin's feedback to a
different patch set[2], this simple fix adds a new pre-configure hook
method to pkg-generic.mk which searches for .pc,.cmake, and .pri files for any
line that has a PER_PACKAGE_DIR path and replaces it with the appropriate
PER_PACKAGE_DIR path for the package being compiled.

$(HOST_DIR) is used instead of $(STAGING_DIR) as that covers both host and
staging directories in one step.

IE: If building qt5svg:
buildroot/output/per-package/qt5base -> buildroot/output/per-package/qt5svg

Feedback is welcome!

Adam

1) https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/
2) https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/

Adam Duskett (1):
  package/pkg-generic.mk: fix absolute paths in per-package config files

 package/pkg-generic.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
changes v1 -> v2
  - Drop patches 2 and 3 and combine them into a single macro in pkg-generic.mk
  - Move the PRE_CONFIGURE_HOOK to inner-generic-package so it actually runs
  - Rename FIXUP_PC_FILES_ABSOLUTE_PATHS to FIXUP_CONFIG_FILES_ABSOLUTE_PATHS
  - Use $(HOST_DIR) instead of $(STAGING_DIR) to cover both stagin and host
    directories in a single step.


2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
