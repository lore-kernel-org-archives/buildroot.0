Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0738DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 17:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CDB682433;
	Sat, 19 Feb 2022 17:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dc9yZmpD7oON; Sat, 19 Feb 2022 17:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9285F82419;
	Sat, 19 Feb 2022 17:03:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 971EF1BF588
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8277782419
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWlrFsaWvlZV for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 17:03:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A3B881BC6
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 17:03:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id c192so7096293wma.4
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 09:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=CVtIN/H5oNLgOEcbMJubhGZ6961zRNfHyw0at4dtiTpzoFy2jou5jbw8fE0hbqU+aS
 ZlsjE0UrF2elq4MNEED9cKiPF+gzRmjOmib1BHTkfYaY8f80xKiDr+nA85w1bXd8iec2
 fDIREUing/nK2L9ylu39vnhPqRV9pDw26fG7Rto59QXhL/zqbq01x74MiFWRy4uxc5m2
 tAn4VjHcXC0JU+oXvxFbysr1YOgRvWmi1Vj4GK8dBZcodTIYLCzdP6j1Pair4zpNI24Q
 JgYjGJ9VvSEfUMmhJFvn9QLvzGfCUyshEYkjiI0FCZa8VcueQFuS4+eYwIeFg5vDKWuq
 rxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=7lDpC47N8HW5+97VwBm9KURomWtsScCXVwXKCfeHmrpGEU43uTr9CF9xmV02RVyOpy
 Xr51u1nyVlKDVQu6dth8XziYHaVUhq/SrxaGZ0cpAd+Y2BcpaNwdlF4j7EFqWWAKCI4/
 CUaOiS+yDqozeTknIs66Ux8UqyMCWS1r/5z6VXpD4oKEplb2R+XQXTcvVXnire2XFw4B
 Bro56S5Vhvb5QIQssA9qrQKrwMVLPKbZ62Fq6MbDVj8sdksJBJ/62/RjkBvKmmGhb35Z
 RHH0vWsMpnJJtocY0yUo6jhjs5/zOhCT9iCgCLJFqXUu01t5v0kHVyhuU0R2WShqrriY
 6iJw==
X-Gm-Message-State: AOAM530fWJHv88a+Cv1hXpUmre2iE0kJpCPzd52GoXvNKgEmkzR7PFAK
 v1hKQ7/kQndhKAjquvriwBz5G50R3lsWBg==
X-Google-Smtp-Source: ABdhPJzKYHdeXwAtJakHfMcAmRofV9h0hCicFBwbPQWZ8lcMWQczcgsx2DCfbT9i2UAN4eWwfNRb6w==
X-Received: by 2002:a05:600c:1182:b0:37e:e2c0:e5ef with SMTP id
 i2-20020a05600c118200b0037ee2c0e5efmr6680299wmf.23.1645290184429; 
 Sat, 19 Feb 2022 09:03:04 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id a1sm28034291wri.36.2022.02.19.09.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 09:03:04 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 18:02:08 +0100
Message-Id: <20220219170210.11691-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220219170210.11691-1-guillaume.bressaix@gmail.com>
References: <20220219170210.11691-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] package/python-beniget: new host-only
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
Cc: "Guillaume W . Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Generated with scanpypi and converted to host.

It is a dependency of python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
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
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
