Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6887FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 12:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F6B4410C6;
	Tue, 22 Feb 2022 12:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LurdyjyFl7BP; Tue, 22 Feb 2022 12:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A47D5410BB;
	Tue, 22 Feb 2022 12:57:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAD3D1BF97F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A81248140F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 90F8mBdN3Ayt for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 12:57:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9A59813B5
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 12:57:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so921598wmj.1
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=TGlGzCo7jffKeDjUHmnjjiK6Kvlp59J8VXSyKB5OZ4RBDY29CebJX1F2LJyDmovSz0
 D8t0Lr2lMMS4LynZ5hRg+tnEyDMyasYXDbrb+aJnBLWeDckAZp0nwYSr+KwSwb3mdIeo
 1DYD/sXTDNHQLtcpzmNaPYrO/XNrKeKpcvtYOgqYTsO+4qGnHr+ngydJmBvZfXMeRmis
 vsGGaLnbfLVk6SKjhcAHJZNMK6ShjBlhyz7dw7burcCqqVg1zA1KYjLQYtWIAkKtzmz9
 Mh7QLLGp4rfBB5ItlBZnX50ByirE5aNRMa3m1de56MV+97pZtXZx6aCISr6sUekwQpcz
 M9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=jTZLXTzOuUs8YdrnAtTC30jRWLzE8ba0lIUwhTYV/Z2RhQPD0pKtc3JXgeVXsENA+M
 /CCaE87diPOhZ3NAAiUJ+w8FQS7F7bIDB3LyrObDmcoBM1ZRlpHWPaL+VdQxMSEtrQO1
 RPFFplhgLONqlYtbMVW1uxpCQZC234xkVBk8nwnLIsgjfB3OnEwVwIjRjNfkhClPx0xW
 6KRXxao+oU8+OrvihCDkuq/QUJYs7Al8yE9uJNYIzDYqepw3lftRzHoZ0B0fJx5SoxwU
 +c5y5lPQLu4WeSvyo/xp2R7dTvKjz3SmdA422TJSkkvcZ3+CJlkJzwTzS4/271miedph
 b8yg==
X-Gm-Message-State: AOAM532/+zCtxy0hhPfpLvKOOsX+FP6EBJ9GRzd9D0ImGesJEUvNOjl6
 0T/BuC63lB16WaD42qjaULhuLEB9EUE=
X-Google-Smtp-Source: ABdhPJz2cNXKNPeZFhqPaXRWeUrcoeMvtsvCA6ntakB146Fe0t7muZq0po+Q7vZaN1BaSmTUmwYQAQ==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id
 f1-20020a1c6a01000000b0037f1b186b17mr3222321wmc.146.1645534649771; 
 Tue, 22 Feb 2022 04:57:29 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id ay12sm36702281wrb.73.2022.02.22.04.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:57:29 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 22 Feb 2022 13:57:22 +0100
Message-Id: <20220222125724.11079-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220222125724.11079-1-guillaume.bressaix@gmail.com>
References: <20220222125724.11079-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/4] package/python-beniget: new host-only
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
