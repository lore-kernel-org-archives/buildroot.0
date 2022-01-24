Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85F2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F0B4050F;
	Mon, 24 Jan 2022 10:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhOKXEvyB8IT; Mon, 24 Jan 2022 10:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A12AB403C8;
	Mon, 24 Jan 2022 10:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7039B1BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B2B1403B9
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OiwAfKNlNzdl for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:46:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1943C401FE
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:46:41 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z199so4415757iof.10
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WqM8GkE33TDY0F/xKTSUmFL9NGkAkDRY/0niUchQ68g=;
 b=Oxd8dreG/RQ3h2qo4GXhL4MavImnNf/AXFtUoF2/1HTBlooRn8NNiQilws4pV4Iqw1
 HJngBm448L6G3UdVbYKjlIK9wJpiYXrMrkGjsTUO1nFfBCMiHzBV5qKhi+zfAIfKxYdj
 LwPMx0KxsrT1VjZjhhmJOHd3pym7ATenj6JcDOBfwMhON/3v1jLtzdBRmf62lzAjzNah
 Qnh6MEBNYcQn6483GunBQ83EUjmGaguSjEt1QPJTt+sX1ytmrRDdgSdCCbdK73WUgWlR
 ZIb/6OMQ/BVsRfb1qptpqw0+FCmNW1KxjoRDTc6i8SG4uVKODJSkCsjXylCtJGe0JB9R
 t2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WqM8GkE33TDY0F/xKTSUmFL9NGkAkDRY/0niUchQ68g=;
 b=wRy7P88ByFdoTdqCNV0Db6K6eguQrEdkAynEXMsnu00ScZ1X8w5IH+bZaCOI4XTHuZ
 s780K9L095u/VmVGRRF18tfRvoPUrP6VDJU0nMCZb85TT1xgcerOXXNgCnFMIe5d1/yf
 wCUoLd3g0wMn0lPOGSMrXv10/0yS8jlLxtgIXaooDNRAhRlr/PsXn9+XlzMUJ2pbtXTX
 tguzASH9gft86LeqndzGInu6sRxZNNNErvC95mX4GJrLtDUvtoXvUyKzQ+pOkP3rMFSl
 ladQPzz4tkAk4R1yYNliB/Fb78bMa9vOstaOvcJrS3+JG/QFzBLI1kjhzzAiFIyAfZee
 Rq2A==
X-Gm-Message-State: AOAM533QcaK275J42vpkMFBi87YxrxzmMX+zIDY52ZfQQL0q7C7PS8FQ
 ZyuQ/yPTnh8R3NwvG4Dp9x1FhopqnDQ=
X-Google-Smtp-Source: ABdhPJy9lHZcPXYJrWeRF91gnomCvupoImE/cOj8Xq8yW7i4rBQAkrgXDadUMs+R1/VovaHhHWkSkw==
X-Received: by 2002:a05:6602:2d49:: with SMTP id
 d9mr7568987iow.64.1643021201105; 
 Mon, 24 Jan 2022 02:46:41 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id j6sm7150270ils.33.2022.01.24.02.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:46:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:46:39 -0700
Message-Id: <20220124104639.532519-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 3.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 08a7be9d56..27c42c8b59 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  08ea8e2ce09e522424e872409c221138  idna-3.2.tar.gz
-sha256  467fbad99067910785144ce333826c71fb0e63a425657295239737f7ecd125f3  idna-3.2.tar.gz
+md5  5856306eac5f25db8249e37a4c6ee3e7  idna-3.3.tar.gz
+sha256  9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d  idna-3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a2d6e4d940bd24dbe7b9645cde19a9792cc51db7ae0d5acd301ac860caa3e836  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index a2c842f1e7..2a1ec8314b 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.2
+PYTHON_IDNA_VERSION = 3.3
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/cb/38/4c4d00ddfa48abe616d7e572e02a04273603db446975ab46bbcd36552005
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/62/08/e3fc7c8161090f742f504f40b1bccbfc544d4a4e09eb774bf40aafce5436
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
