Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB9BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 23:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC50860AFE;
	Fri,  7 Jan 2022 23:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8EEO7Im5cG5j; Fri,  7 Jan 2022 23:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 312B160B36;
	Fri,  7 Jan 2022 23:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08C1E1BF36E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E348882F06
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9_pSSSxSM_X for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 23:10:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 005BE82F76
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 23:10:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q8so13715737wra.12
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 15:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YmX3P6EujZHLb0BhdvFeNP0Xhe3vMbeUOyZIJUr10RY=;
 b=F/l8nyJn9f1mN+fQUP5OuGScWdGMImP7dfMxPoYAz67FNDw55HJ2XzcCp3XphCizXY
 U0jJ67gYj1QnLVYBXpXqQ7FzEVLSW8jR6IqjxtE5Tql26e7o1LR/nN/mowjg++Y1/oUA
 YbB8dde19kOZ4AS2WgxR80EesJO6k9B3w78zSZGJZvsyerAwRNhsLZV8s1H1Be8oWBXK
 7aB6ulmZB7+xr+9ZGoGVDNM814SJxl+J+U8Gvye77r5JvcfEacDUwRec2aT5BR086QL6
 n6RPYeEiJxriErxesrugsM44flTzaSnH9M6Vmni3Ioq8w6zrhldD5Xrcry7tv82xu7w3
 y1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmX3P6EujZHLb0BhdvFeNP0Xhe3vMbeUOyZIJUr10RY=;
 b=lzGeceu4EQSZWPdq0f8AqnYBnZLiEVDlbITxcy9UcBrvC2yBJvu5nQ+5zknboBqEMw
 NH65i0OQAtAYcoFWEJMQVw4nYBF0KgOaoGYCAfpxU96O7WdpQQpFObbf79v7B+KrbfEa
 teXzNEGz3OdLwOHtTOz28PvtI2Co46BkG3IA9Uok0ZGiNyQ55gN8ABdYIDnWssmfziaa
 dIwhdvbdi5oIsP2Ks9iUVI76E/xlfpsr1tdACqjdJx3I+f0clkgKKTez3MGJYkGjbRK4
 edKWeD0shE/C82HiRIEz36HWsUQ9AaUPYKeQHitynigkNU3+NRiAoExyib7CTmJ5WCL1
 CU9A==
X-Gm-Message-State: AOAM530l5Evj9zgUSWrkY8Zg3nxLYH7jjDKCc6YPFDDRW3kye+f6TdK8
 nPzSON/dIJbhKawSFLmit3QuKU350TrDqI1F
X-Google-Smtp-Source: ABdhPJw4mMN7KLBXkMMTJwhGyZRl1h/sp/cK448gNIt+crVflpvVc5/ggb/JYp5xkx6Eopb9HzPjew==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr35074035wrb.268.1641597040253; 
 Fri, 07 Jan 2022 15:10:40 -0800 (PST)
Received: from arnoutx1.home ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id k33sm82945wms.21.2022.01.07.15.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 15:10:40 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 00:10:36 +0100
Message-Id: <20220107231037.1380602-3-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107231037.1380602-1-arnout@mind.be>
References: <20220107231037.1380602-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [WIP 3/4] package/python-pythran: new host-only package
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
Cc: "Guillaume W . Bres" <guillaume.bressaix@gmail.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Generated with scanpypi and converted to host.

It is a dependency of python-scipy.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pythran/python-pythran.hash |  6 ++++++
 package/python-pythran/python-pythran.mk   | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 package/python-pythran/python-pythran.hash
 create mode 100644 package/python-pythran/python-pythran.mk

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
new file mode 100644
index 0000000000..a24bb4dc4c
--- /dev/null
+++ b/package/python-pythran/python-pythran.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pythran/json
+md5  e09e90484771937ab499380858bdb18d  pythran-0.11.0.tar.gz
+sha256  0b2cba712e09f7630879dff69f268460bfe34a6d6000451b47d598558a92a875  pythran-0.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
+sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
new file mode 100644
index 0000000000..8234513af3
--- /dev/null
+++ b/package/python-pythran/python-pythran.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-pythran
+#
+################################################################################
+
+PYTHON_PYTHRAN_VERSION = 0.11.0
+PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/88/9f/161f08131abf7f23920cee29b691de27f10fd97ac09fb2f3532b3a7f9b96
+PYTHON_PYTHRAN_SETUP_TYPE = setuptools
+PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
+PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
+HOST_PYTHON_PYTHRAN_DEPENDENCIES = \
+	host-python-beniget \
+	host-python-gast \
+	host-python-numpy \
+	host-python-ply
+
+$(eval $(host-python-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
