Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC7CC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 23:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC5B607A1;
	Fri,  7 Jan 2022 23:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VR9YqEkhRrvD; Fri,  7 Jan 2022 23:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3971560A85;
	Fri,  7 Jan 2022 23:10:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 321691BF36E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F55582FCB
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B48cYAW88Ayc for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 23:10:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0228582F06
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 23:10:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so1424953wmi.4
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 15:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3tS8OQ2RBA9QwZXuVLMg1nJHFOfB+fEreKZdy3syLA=;
 b=Gf+pIspLrGH5VALdcBnwKQGUpJFyM06YdnTvSai0CBY1l9NOaA28Kcw4rl+w1zbbpk
 tps4iampmQo/pEFUzirKx5zoOGtLQbSPTGe2j5Cbz5t3b7I3jddLmJoYIwfd1us8fd9m
 xul+5NYdaNMnTg+phTUcH5e1jYMQCnn71ACXGJgWi53L+MwRa7F/mclzKvpVWfvPPfJs
 yIAsCTErXKVoqvIhZaswr0YHiTXsZc+mbILg0HAZSl0f/H3rvJHLqpzFREB4iGvnew0f
 L/8QWdgd95OK+9AOB+1G5pu7O8CiUiVbtpmiai59wj748NH1FhNuor4D7cYiqjykpwbS
 /1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3tS8OQ2RBA9QwZXuVLMg1nJHFOfB+fEreKZdy3syLA=;
 b=5gT5qqWzM+iI3evs5Qbd6fUJ9a5qqv/9Ga93oH021KAFyESWIFsQ4YCJK8iT1ZS7+J
 Gn3q8u0wWw9X4+YgR45DhpRol4JiM+SzmJ8Vnmb6CYsj/cafqK+7CAfqi8WJ3C/CW4y+
 IOKc9AhdqG2lo6OieGI9Clt/rrgqmVyGcGjbtJeq8tRcMUSvbCOOT8HQKWr5kmq5rHg1
 TAKG6a8QO1PsqHJoAVsNRW8zJzAVzYZFlz3u7+aNMygTDN3/Y3aUuGfmRb/uyNSfcQlY
 dVnDoyB7G2Pj62QDNzvWh/I00Fy26yTUSuyRe8jHkK2Uym6yv+JCbJvYdCZ2P/6h+bTi
 +Cqw==
X-Gm-Message-State: AOAM533Y51oW45TiTbX/dydZv7G5uaR1F69LMkryZlhWoRJSyAbJ+E1X
 GPbAP3HkFtmQlksW97pgx3PPoEgs4TKFLWSV
X-Google-Smtp-Source: ABdhPJy6Nfu6mnN5FiAjmii8KRwNojyXddS4AbyOVYp1xmJu1Wi8OLdx9SC1madVTvsZrfWfRbqUNA==
X-Received: by 2002:a05:600c:2059:: with SMTP id
 p25mr12477295wmg.151.1641597039010; 
 Fri, 07 Jan 2022 15:10:39 -0800 (PST)
Received: from arnoutx1.home ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id k33sm82945wms.21.2022.01.07.15.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 15:10:38 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 00:10:34 +0100
Message-Id: <20220107231037.1380602-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [WIP 1/4] package/python-gast: new host-only package
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

It is a dependency of python-beniget and python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
