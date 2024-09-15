Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A096FC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656D480C52;
	Sun, 15 Sep 2024 22:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTEs2wvz91Cb; Sun, 15 Sep 2024 22:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590B4811DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590B4811DB;
	Sun, 15 Sep 2024 22:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4881BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0744480C52
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdHbbeUPrUNl for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F506811F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F506811F3
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F506811F3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:16:02 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-39f54ab8e69so15609385ab.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726438561; x=1727043361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgYVzPQkanKiJwt/wr8864p6xRl5EF1OaCNF4drUJQ8=;
 b=M4EihvCytwudwHb/6CyVWo3jTmIATXYJpqq53J1m7ZzDTNas8nPpn+99Fru4JbSf9/
 ruLj9ChTy0BTlT13FOi4A0QKjLp28YvCRNW+FIJYqvjHSm5UOwni9n8imPK+eWeCSwId
 GrSasxC1hwJImwDfl74C5Nrz+jQMmjqKSa9xgRCCHD8biFvCo0IZDwAO3g8BZLpTbhBO
 CQpf7ujTgpuaIqOd+VdIvCjl48BoL9Wy6uhm9iQNuXK1jLiab/gdpvNwd3568Dcu81rx
 MUyIIJJCh9Ap57iuBmn+mPhlsJGsUQIU8P6CCM+6mg0MsNXBld1r0iN2z2DyZGW1afwK
 kx+g==
X-Gm-Message-State: AOJu0YxC4fZeY5uWaHFloHHogSthHeQFolhQ1ygur3+D37Mg5HpdfERQ
 PKNztOW9Xa4U34Se6Ci1bldwGByC7blOVDIHeEM/Fr0837hBtNADupVlkQ==
X-Google-Smtp-Source: AGHT+IGcImSgcJpGqveuHgyHVHQ3JgF84JkrSkT0Bu1JtBaSOJ5GtcQ1A+QIYGB9FvWlxtmlmq928g==
X-Received: by 2002:a05:6e02:1d88:b0:395:e85e:f2fa with SMTP id
 e9e14a558f8ab-3a084611b38mr109840275ab.1.1726438560978; 
 Sun, 15 Sep 2024 15:16:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e72075sm12672195ab.64.2024.09.15.15.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 15:16:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:15:58 -0600
Message-Id: <20240915221558.1658526-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726438561; x=1727043361; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jgYVzPQkanKiJwt/wr8864p6xRl5EF1OaCNF4drUJQ8=;
 b=V0/YYnVP1KPKjFWT36vrepd76E05iYA8ta9JRIRtH6HHQX87VSPgiYYyXjjT1A8wtg
 2TBJSEwKCnLfbXgpCuHUXFQjt/RKimUlZInzSlKvRvECB9eBFtkEDwuCgKC/p8m+TFlT
 Z+KcjI0uWd4eip0UBcoQz0iG24VYshox6xrq34RSoIFTbrU/cxh/bLiI88C/wvAtFI0S
 6DRnm9OqpBYdRzI2Ppgb77lVYTgHDTyON7uvqyfqTneLkJ7d7hrjwhQPKOQFDjvbi7cn
 pRUk5lh+dFEnvNwXrucyoJo8IvJB/MCrV1iqAisU864ppb3gQlINkm9G3PRr1ASTZjX0
 agTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=V0/YYnVP
Subject: [Buildroot] [PATCH 1/1] package/python-mako: bump to version 1.3.5
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
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/sqlalchemy/mako/commit/d115670e5ad1c7a7405924f6db5c02af0f8e0c59

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 03651cf956..07caaf8f75 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  90da23903468efe9aa88dc88081579ff  Mako-1.3.0.tar.gz
-sha256  e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b  Mako-1.3.0.tar.gz
+md5  0cf9ef37c1f8ffd453ef2b2a3a5573b3  Mako-1.3.5.tar.gz
+sha256  48dbc20568c1d276a2698b36d968fa76161bf127194907ea6fc594fa81f943bc  Mako-1.3.5.tar.gz
 # Locally computed sha256 checksums
-sha256  0a326e448dd22f220dd30796677ddbdf3ddaa6427a9744fea9deaa51d9d74fd9  LICENSE
+sha256  15627b36b38d0729cdd686df9abf606503d99d624b2f5ec5cb254a75d5afa891  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 2eba772b26..258b2db014 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.0
+PYTHON_MAKO_VERSION = 1.3.5
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/a9/6e/6b41e654bbdcef90c6b9e7f280bf7cbd756dc2560ce76214f5cdbc4ddab5
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/67/03/fb5ba97ff65ce64f6d35b582aacffc26b693a98053fa831ab43a437cbddb
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
