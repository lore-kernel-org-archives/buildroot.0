Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CEFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 12:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCDD8410AF;
	Tue, 22 Feb 2022 12:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xbNfh9_E8DXN; Tue, 22 Feb 2022 12:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368DA410A9;
	Tue, 22 Feb 2022 12:57:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13F751BF97F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF6C813E6
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oX_k-4wmUV6V for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 12:57:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39C39813B5
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 12:57:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n29-20020a05600c3b9d00b00380e379bae2so347327wms.3
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 04:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=bYyH47VKa0PruEHk1CuLzd90mOVOWUYjsmRl9M3Xhap2lulXPBR7bpDQl3E+9G8jC5
 U00NW55ahyKdQlEm3gVUQHgN6ekgn4N2hZlsDaJ+lIARzyebdTWy/jcOyJcIE+3yfYlr
 qYHq1DLPZ9KvG+nOnz/aumxT2lbuhvlLDMP+Y74IWMjHEedg3t6Kr89ZRjnPVWn7mwdE
 aZk9Xqf/5iSiPjmu1dIYIIkLlDueobnYYkeuZa2AmTuAFxCuuYcPowHNosHfJZpRCnFB
 gDEgXr+iJQZof0AXcaRJDTcjd5KndYjs0tbvG+hGE8NdUyNcbPQZiljDhT+TAJ8e0dx2
 ii5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDc54Qo2umevl8QGadivmSMqjH6X93Tbb+7sGFRNZj4=;
 b=n7EoT5F7YjbQYKtrVmKTL+O9O9BYkyDlih4xFTvbTvnpqd1dx5bJa1rDWtGpC/jo+4
 OApaIaXqO7Fpx1gr3ptFb20qXTCxsaJaIca829GmoClKWpzhjDYFg5fEi//Txu9pJJvx
 s61cevWS0h3O3Z0GNHMXjY1J1bqK8k8T4E/fh0RdMc9/dQPTaCaSnAh3fRwTzxxU23bq
 s9SnzALtOOIf2+O0PFXYaRY5hY2o/Qde03ZGJbQYY4KdOUJqpAFudhGrxaIutZckM3ca
 cgrrvQCRRy2tFBJIIdyp2UNZY0Ri36NyeQc5ryFyNe0vnYem0hTGbfcT5D97c5KIwnYL
 tZ5g==
X-Gm-Message-State: AOAM532NTHLWLBWyyJ1P/wu62PmF+zxheNuLH9ejYcNnRhoIDZ3q9maG
 O1cxxupb/oUzeETrCa/1fZ8VHrXXyqw=
X-Google-Smtp-Source: ABdhPJyrgAIS4zhnLbWIQKWwwwXiwrpVBXsYphz4tbEU1McdPg9zH1QMwG5SzcVp+Vr2BiMmBlXJhw==
X-Received: by 2002:a1c:6a16:0:b0:37b:f4b0:65d8 with SMTP id
 f22-20020a1c6a16000000b0037bf4b065d8mr3270639wmc.80.1645534648357; 
 Tue, 22 Feb 2022 04:57:28 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id ay12sm36702281wrb.73.2022.02.22.04.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:57:28 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 22 Feb 2022 13:57:21 +0100
Message-Id: <20220222125724.11079-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/4] package/python-gast: new host-only
 package
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
Cc: gwen@trabucayre.com, "Guillaume W . Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Generated with scanpypi and converted to host.

It is a dependency of python-beniget and python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-gast/python-gast.hash |  5 +++++
 package/python-gast/python-gast.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-gast/python-gast.hash
 create mode 100644 package/python-gast/python-gast.mk

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
new file mode 100644
index 0000000000..f16d001a6a
--- /dev/null
+++ b/package/python-gast/python-gast.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gast/json
+md5  fdff900805e03e9dd76d377eb4cbaed7  gast-0.5.3.tar.gz
+sha256  cfbea25820e653af9c7d1807f659ce0a0a9c64f2439421a7bba4f0983f532dea  gast-0.5.3.tar.gz
+# Locally computed sha256 checksums
+sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
new file mode 100644
index 0000000000..e02e87fb23
--- /dev/null
+++ b/package/python-gast/python-gast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gast
+#
+################################################################################
+
+PYTHON_GAST_VERSION = 0.5.3
+PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/48/a3/0bd844c54ae8141642088b7ae09dd38fec2ec7faa9b7d25bb6a23c1f266f
+PYTHON_GAST_SETUP_TYPE = setuptools
+PYTHON_GAST_LICENSE = BSD-3-Clause
+PYTHON_GAST_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
