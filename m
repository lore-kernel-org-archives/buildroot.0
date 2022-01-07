Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADF6C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 23:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D253A82FD7;
	Fri,  7 Jan 2022 23:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFwdZkvMA0oH; Fri,  7 Jan 2022 23:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3481382F31;
	Fri,  7 Jan 2022 23:10:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 399521C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35F0560A85
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4n22upHs63O for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 23:10:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B4D3607A1
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 23:10:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o3so13752972wrh.10
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 15:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QU3l9qXE6HnSns8YQI/tJAE9Pb9qEe8Aqmetsh3s1jw=;
 b=a0r6Rtscf5g2VSK5Uv4TdawPHeTYUYn5tWSbo3Cjag2X3jq74MJJX5+iIC3DFXMdQx
 Li8N5isQrvZhqiC+KI7sxzIUDeJ1uRK/u3OvD622ZKUUTHKiqbElAwM2QKdRSrZBfopn
 NQMyu8iGP+veaEASgOB50gXk+d5Vev07HI109/hEoZKLjMNxFVsvWs4B3ijHUNTjT5vb
 exoJd34dOVL+aBIf6ffyWjFT/e2H3qF7FGD6agAuSeMaS67CHD2UrXKbZNBFCFgkntCh
 Vi9FA4KK8D4tP2npaNO/BwCtciyXNl4qlCmZU7pIYkIgltSs6OdKQRSflfJg+bU7nXUf
 2x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QU3l9qXE6HnSns8YQI/tJAE9Pb9qEe8Aqmetsh3s1jw=;
 b=hNI9YmQ+8z9ryT0ndxhgy0itcPS0PGD+N7kdbsv0lfCQBOF1Sz1PTdRNepmXIJcGZU
 YblHcbtoGHzQj/uG3tpn+A6lrkNMxzKUIwJ7L/vt2TX9FuBT5MGoY+68m+0ve01zgAb9
 A+rycam7unmraAZ54nHz+VKT3HbkvkRP+eL05+6dFLX9cM4Zubn76Qa3VRzVHWDwTt/S
 /t++6/zM9wjNjGSb/UOPTYh6EXqGQjbFK0gLyhmEK4Mx4rkf+4FmQMeR5cLgBVTl/LZO
 4jDDjKhmAxQuOuQ45+FZ+jtPlpVkfE3jfxAEPgBEcuWbnREadf/nUtzd+wdNZaovBS/+
 ac3g==
X-Gm-Message-State: AOAM531GuNaRJLSc+zOj76uIcUgiFEXYEpy3s4XAhLgQlPx1F9YtXEq2
 dS8NTQaIlbBvbOaX3QyYy32VY4uOf9HshRc+
X-Google-Smtp-Source: ABdhPJyHiGcfrsuusI7kqsAXdWBP92rFhLOIDc8+IUHHGNSECFJW1/tEfuxWj+tCBrxe8aLasehMRw==
X-Received: by 2002:a05:6000:15c9:: with SMTP id
 y9mr11593294wry.32.1641597039601; 
 Fri, 07 Jan 2022 15:10:39 -0800 (PST)
Received: from arnoutx1.home ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id k33sm82945wms.21.2022.01.07.15.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 15:10:39 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 00:10:35 +0100
Message-Id: <20220107231037.1380602-2-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107231037.1380602-1-arnout@mind.be>
References: <20220107231037.1380602-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [WIP 2/4] package/python-beniget: new host-only package
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

It is a dependency of python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-beniget/python-beniget.hash |  5 +++++
 package/python-beniget/python-beniget.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-beniget/python-beniget.hash
 create mode 100644 package/python-beniget/python-beniget.mk

diff --git a/package/python-beniget/python-beniget.hash b/package/python-beniget/python-beniget.hash
new file mode 100644
index 0000000000..cd4fa7b873
--- /dev/null
+++ b/package/python-beniget/python-beniget.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/beniget/json
+md5  a2bbe7f17f10f9c127d8ef00692ddc55  beniget-0.4.1.tar.gz
+sha256  75554b3b8ad0553ce2f607627dad3d95c60c441189875b98e097528f8e23ac0c  beniget-0.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  64ad3e304e9d2d8731c26ac3e652335a6016e38be2f71fe30350be51c6d500b0  LICENSE
diff --git a/package/python-beniget/python-beniget.mk b/package/python-beniget/python-beniget.mk
new file mode 100644
index 0000000000..9970546b14
--- /dev/null
+++ b/package/python-beniget/python-beniget.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-beniget
+#
+################################################################################
+
+PYTHON_BENIGET_VERSION = 0.4.1
+PYTHON_BENIGET_SOURCE = beniget-$(PYTHON_BENIGET_VERSION).tar.gz
+PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/14/e7/50cbac38f77eca8efd39516be6651fdb9f3c4c0fab8cf2cf05f612578737
+PYTHON_BENIGET_SETUP_TYPE = setuptools
+PYTHON_BENIGET_LICENSE = BSD-3-Clause
+PYTHON_BENIGET_LICENSE_FILES = LICENSE
+HOST_PYTHON_BENIGET_DEPENDENCIES = host-python-gast
+
+$(eval $(host-python-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
