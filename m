Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39069C3ABB7
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 00:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA38D4037A;
	Mon, 16 Sep 2024 00:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0imLLLGNtOm; Mon, 16 Sep 2024 00:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B727F404EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B727F404EE;
	Mon, 16 Sep 2024 00:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB47B1BF215
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7DFF811D5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Du9MokpZiZRz for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 00:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5DE7811C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5DE7811C6
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5DE7811C6
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 00:07:53 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-39f52e60a19so22257165ab.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 17:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726445272; x=1727050072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e906lBY5Yf/VZrwqr2OSsktz4jzkEnNDx3mcAaduoPA=;
 b=YeyZ2Q8IHEOGqBLLyIn9GwxAXe8hFAvfW3qIBiqcNCpu+FZ3yX3ToeJeA/jKDV68NS
 lXSbhXvxhLV/b5W69i/BL0qr6EQMMxj2Npe6783NqDPg2XjiaQYQERI+pdRoLdtO1TH4
 1vVl6cG48BlFLtKsGwYHb/0qRyF2haVkn3jgFMD7Dm3ZfzKua2vRgyf0AijyJQkVfvKz
 rvfrTmiqjAPScgILzEi/ojNIO1qimyGTqK819L1yj/DMjPHtNgbv0anyxDAVUmNx7kNH
 Ku+WdHIFEIw17CsAA6whQwagkTNOyM3fqhPVz3n6cihAs/qvu1K3wqypP79ualehpuU1
 QWZg==
X-Gm-Message-State: AOJu0YyHxw3fkCrRc2Ci/Q/OtbyWcYlWOze3aFlmNd8YWzv4U2slQsLE
 +x4kSLqLpiSA5qy9OloV2xHXTcz5rHwOOo6vNqeQcQcFx3UsIPwKr2wZeA==
X-Google-Smtp-Source: AGHT+IF5pPQg2YscsLhBLVrBarHiKVvLg19h+clGEWAVscInVA61kGfqW1x8pxIMw+rzMKhiW4dT6g==
X-Received: by 2002:a05:6e02:13a7:b0:39f:5baa:e50e with SMTP id
 e9e14a558f8ab-3a0848c8ee4mr136483625ab.7.1726445272303; 
 Sun, 15 Sep 2024 17:07:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10f0bsm13157825ab.30.2024.09.15.17.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 17:07:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 18:07:50 -0600
Message-Id: <20240916000750.2139617-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726445272; x=1727050072; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e906lBY5Yf/VZrwqr2OSsktz4jzkEnNDx3mcAaduoPA=;
 b=LtsSYE6eQ2SmLMMTm1whE4bBkmANhSDoVwUh8pQWTVS+DS+ToGvTlYSzGbZWznQeim
 LEcNybBoCIQ8XbHe+I+nngCQxvaGwy06Ybiw3B+xs4iCKtJt1jWn/7FH/zK6t09ilHil
 TXwP491OYUwd+feG9hRvVwbTchznyvBDZmBZ3/gnlQslqf1QqfZchmQTS0PgJy2sAsJJ
 dpNKKJYFcw88skCzho01PmI/3yGYGUR9YZlR9NIB5N6rUkaHdO8hS+HahoigAPtZf5XT
 LzbaXvTnCYfX+rClH2wMLYAOemDfJZlfgq40YDzNOmIB/I9AovExXttVj7aaxXjPs1Jt
 lCFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LtsSYE6e
Subject: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: bump to version
 0.5.0
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
 package/python-ml-dtypes/python-ml-dtypes.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
index 53bfacb528..e11ae88abf 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.hash
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
-md5  438c04dc0d941ec1b3b71667225c74c8  ml_dtypes-0.3.2.tar.gz
-sha256  533059bc5f1764fac071ef54598db358c167c51a718f68f5bb55e3dee79d2967  ml_dtypes-0.3.2.tar.gz
+md5  0d4d585a69dc36ce685c487c99fcc59a  ml_dtypes-0.5.0.tar.gz
+sha256  3e7d3a380fe73a63c884f06136f8baa7a5249cc8e9fdec677997dd78549f8128  ml_dtypes-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 8097265078..060fe555c5 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ML_DTYPES_VERSION = 0.3.2
+PYTHON_ML_DTYPES_VERSION = 0.5.0
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/39/7d/8d85fcba868758b3a546e6914e727abd8f29ea6918079f816975c9eecd63
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/ab/79/717c5e22ad25d63ce3acdfe8ff8d64bdedec18914256c59b838218708b16
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
 PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
