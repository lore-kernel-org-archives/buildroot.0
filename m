Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEE0C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 19:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE0041BE0;
	Sun, 28 May 2023 19:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AE0041BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkjbp4dwtZ34; Sun, 28 May 2023 19:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D71541B52;
	Sun, 28 May 2023 19:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D71541B52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 565361BF95E
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CBBB83077
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CBBB83077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLpb6qbnuaaE for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 19:01:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDE783026
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BDE783026
 for <buildroot@buildroot.org>; Sun, 28 May 2023 19:01:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f603d4bc5bso26993625e9.3
 for <buildroot@buildroot.org>; Sun, 28 May 2023 12:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685300476; x=1687892476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+xnnup1zfH6P+6zdImwbhgm9NkS4qLbXrtDbXfqS6s=;
 b=SQf00ZIjJ12ne/yRE8UK7ZUHaZrIYUX6VxMgIQnKFILqp+/+B6iafnjvxkAvDJCJCL
 fKFsda/RuXO73xKQyE1mFdlMf4kGaPA8Wb96qb7CWgfkBfEkdnEHrbd2a+SzME+spxVW
 0h7safbdaepQW4MmY8JI8WNRLm5Lhm44zD1btEGLQfVNw47KYyfF4ylWu9QKe+T2Ny6k
 IVK+3DsklKNmKK8bnpGZ9skRsfr32g5DOQtrf5TNYnQXql1g3Eu7rdobaiCiBJdyuats
 uRUnletNQpm7jg4/liRkGAGWCB40o9MosTV2uRXYE9D2dTtN2uVHOBCzkwzrMPqEYZKq
 VJNw==
X-Gm-Message-State: AC+VfDxbtvrSbWVOYMtD43V5uGwvceUC7WFcIFO4Gb2pdukj3OlEkjQ+
 PnbK7UydfN55wjAkc64cQLWhsCa3pC8=
X-Google-Smtp-Source: ACHHUZ58gT2Zj2Bfs3SzIiYN1jeKnmDamVxzsKjX0Id7rrTb49nZByMYL7KlTlCuqI2ov7qpDo/mtw==
X-Received: by 2002:a1c:6a10:0:b0:3f6:3e9:e8fc with SMTP id
 f16-20020a1c6a10000000b003f603e9e8fcmr7504445wmc.10.1685300476242; 
 Sun, 28 May 2023 12:01:16 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adff606000000b0030632833e74sm11440967wrp.11.2023.05.28.12.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 12:01:15 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 21:01:08 +0200
Message-Id: <20230528190111.2430580-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230528190111.2430580-1-romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685300476; x=1687892476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8+xnnup1zfH6P+6zdImwbhgm9NkS4qLbXrtDbXfqS6s=;
 b=oNOe6giFnhDmceKgckuRSmUHGUGzUfPt97oL7UbFcSKtqQzMAvlde9fPa1cSMbFobN
 cYSWi8ULecalolzypjSasSYdtBydqWyzuHP1xlG1jNlS1LstHTg2iouOKnEv76YjArVB
 bzojwVyOfEKPkPJScK7Pq1NUqpG/Oe0NB0/edcSf2zidCQNxFL+mB9mCc4xNA64TouQs
 wOLG7zJP+8Um0jhIUtxvLbO3OnNSIAI8KhXw0he4NNKJuAwH/M8hRK9QlGHVj7iII39s
 1DNQ36RrIdPIATjy6uzlQrlXaIgPdUKSgKTdiHae7ziCxkmg+o8ce/2my6Wkx54Mi18h
 n0hQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oNOe6giF
Subject: [Buildroot] [PATCH 2/5] package/python-pure-eval: new package
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-pure-eval/Config.in             |  6 ++++++
 package/python-pure-eval/python-pure-eval.hash |  5 +++++
 package/python-pure-eval/python-pure-eval.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-pure-eval/Config.in
 create mode 100644 package/python-pure-eval/python-pure-eval.hash
 create mode 100644 package/python-pure-eval/python-pure-eval.mk

diff --git a/package/Config.in b/package/Config.in
index 82aa348455..3da005b5e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1190,6 +1190,7 @@ menu "External python modules"
 	source "package/python-psycopg2/Config.in"
 	source "package/python-ptyprocess/Config.in"
 	source "package/python-pudb/Config.in"
+	source "package/python-pure-eval/Config.in"
 	source "package/python-py/Config.in"
 	source "package/python-pyaes/Config.in"
 	source "package/python-pyalsa/Config.in"
diff --git a/package/python-pure-eval/Config.in b/package/python-pure-eval/Config.in
new file mode 100644
index 0000000000..f6ccd6056d
--- /dev/null
+++ b/package/python-pure-eval/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PURE_EVAL
+	bool "python-pure-eval"
+	help
+	  Safely evaluate AST nodes without side effects.
+
+	  http://github.com/alexmojaki/pure_eval
diff --git a/package/python-pure-eval/python-pure-eval.hash b/package/python-pure-eval/python-pure-eval.hash
new file mode 100644
index 0000000000..5bf5dcb749
--- /dev/null
+++ b/package/python-pure-eval/python-pure-eval.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pure_eval/json
+md5  212fd27ca2c58d9effddec69748d738a  pure_eval-0.2.2.tar.gz
+sha256  2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3  pure_eval-0.2.2.tar.gz
+# Locally computed sha256 checksums
+sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-pure-eval/python-pure-eval.mk b/package/python-pure-eval/python-pure-eval.mk
new file mode 100644
index 0000000000..f139ea270f
--- /dev/null
+++ b/package/python-pure-eval/python-pure-eval.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pure-eval
+#
+################################################################################
+
+PYTHON_PURE_EVAL_VERSION = 0.2.2
+PYTHON_PURE_EVAL_SOURCE = pure_eval-$(PYTHON_PURE_EVAL_VERSION).tar.gz
+PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/97/5a/0bc937c25d3ce4e0a74335222aee05455d6afa2888032185f8ab50cdf6fd
+PYTHON_PURE_EVAL_SETUP_TYPE = setuptools
+PYTHON_PURE_EVAL_LICENSE = MIT
+PYTHON_PURE_EVAL_LICENSE_FILES = LICENSE.txt
+
+PYTHON_PURE_EVAL_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
