Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0D5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 16:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41E994040B;
	Sat, 19 Feb 2022 16:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2Wf23f7WL5Z; Sat, 19 Feb 2022 16:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8712E403C5;
	Sat, 19 Feb 2022 16:54:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2A221BF588
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9066E813CA
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHH7IKE3YHW5 for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 16:53:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 762F981360
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 16:53:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u1so19640276wrg.11
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 08:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=A9OFWSgvPl8rtwFEKxVAm6eK0SxCgaNQFwLopP+nETvDdAvj6IZ5EB7/b4g1K0nQF7
 ahy+vKaZr7bZc5uABPxOSgpj+GXcgZ1VGeEVALzlfzS7Dj6vUu1Crq0IlA+Ygx2H+bBA
 SCf/4REEFwqlwR8KaWz/bRJ6NP8xloicxjyKQfsHhsrf2kQVtlSQgafQSYxW58f4gwB0
 Gz7X9MevRTbr3KNMygARs0a9OGPmN/A2IbRv2k5HvlhxjSHGVBpHY7PfGeS1bhmBaBUJ
 xNbGFHrjwXoC8mOMDsUgtlvUP8Rs3jsq8vdiDpDPcaCsi7DUYGwTAm7xkl/MKQ+CVEp0
 fpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=yDQcOuZTHyrFa8YesqtuWcAPZ70am4EnuQL1id5dnQhn5TFLu6kPBBRUME+eAJF71x
 Di8pscBdm20EfZWFM+cDCb5vWAb9P+rUTSpynLArPSsgMTbZj/sYQN/oZOvkdA0mbd42
 t08hrDcZKi+8A+BSrBFgC/YA28ro21/q3F8ookaTIvzQA0Je95FFuWFxd1ecy2Y7K/si
 uXmMqLVkZdy/J2mMhzc+FdbR/vuf058XcF69luqEWcTDONKaKBffD+Z3h+zfnsmQwMZG
 PDbX5466p2VlTcY2+tI+2ZAo6t5bzbC7XTh2AWf1LPBFVbqNI3iIgOmdPu88tq5wf/cM
 j4Sw==
X-Gm-Message-State: AOAM5322V1Zx61DdiA4tNfoPiV4g6F8/O0RftAJz9qHoQdkYnz7CUkiu
 0JwRjXP2bK7AZSLvbi4xjG3poKpIjg4Ipg==
X-Google-Smtp-Source: ABdhPJzDJZizhyxikm1PY4Gd1r/X3lKY7LkKSmZfrQCpgj2kxg0YuNXCR1RYDgwaQG/vcKWvNhKXBg==
X-Received: by 2002:adf:df86:0:b0:1e3:126f:440c with SMTP id
 z6-20020adfdf86000000b001e3126f440cmr9885681wrl.140.1645289636924; 
 Sat, 19 Feb 2022 08:53:56 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id f18sm3206549wmg.21.2022.02.19.08.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 08:53:56 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 17:53:09 +0100
Message-Id: <20220219165311.9775-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220219165311.9775-1-guillaume.bressaix@gmail.com>
References: <20220219165311.9775-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/python-beniget: new host-only package
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
Cc: jeanmichel.friedt@femto-st.fr,
 "Guillaume W . Bres" <guillaume.bressaix@gmail.com>, gwen@trabucayre.com,
 thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr
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
