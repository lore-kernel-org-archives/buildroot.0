Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371A1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C55D9418FB;
	Tue, 17 May 2022 21:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0jsNOZMn2GG; Tue, 17 May 2022 21:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C0F418FE;
	Tue, 17 May 2022 21:59:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87EAA1BF20B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8496F60B7D
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ww86NoAYFVqM for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:59:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D03260B64
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:59:38 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id e3so308097ios.6
 for <buildroot@buildroot.org>; Tue, 17 May 2022 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsrhzdDz/RI+EK5bKKfCxWbHuySJ6yEuIqTHFN7viLU=;
 b=YDqUOP5KF2gi2oOnaLuNGSa/OCfrfBfuMfnlUz9QGPTIe8vHRTAMsFVs8sDtS1VMcD
 8ZyyD84nPyCemb2XBFWIPMCv1/iLRP7LN/igCq68h9n2YlOvgiDiAccRl4Wh8821fMxL
 sqox8G16o6C6fMX/Km9ChvSiRY51t+vuSCwPi81Z3bRgT97z8aWyAnMF1FCgtiScoXc4
 Adp+W1ntB9+tkRpZu+OsPpIuzRCVZYfIok/sX6S2RVcl8Pi9BmqyeM7PBo/TPYY8afUe
 xp501BuVvNDeCbq9YBzA6wgcgIftD4qHD20JsgYY0fx98QVSZ/vIBbO2dUMH151zVpgo
 fKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gsrhzdDz/RI+EK5bKKfCxWbHuySJ6yEuIqTHFN7viLU=;
 b=7SspmDMFkSyv6vBJhCL72+Koj8ZXQBK/kEpTkgj34JPfn7y6KfTmBTQn5CW6RsBUEG
 nrNjDrjDoT6HEDOQ1JrwIJ/1kujO/tbEcXZwP20PFiCPmk3K67WhWcO3SJU9DTnthvHM
 v3mMKwjUBSCdirSW9KaIugBdUx0X/RMvtrNxXFUIWPxsTHCAYDpTxksYGOYVHZDBgf9q
 5Fffx2+Phy5XOg95Iw4Lu9AITJz/cx+ATQ48mA0f3LsFNbqrs4wsDzyGooPhS6RJKqcJ
 qpntelpzKlvdjN2JyfbrCitbDx+V5FxGhabWOv7T1kNtKOzUSMtbxSruZtZdGv/ofBvR
 +Lvw==
X-Gm-Message-State: AOAM533Be/rcAmJhUBkFiKCINvt79Wz56fDjX4GNDA/nmT6m/ILEv8T+
 Wz7IqY3cjA6C+AzcTr8+9bodW/uLcz0=
X-Google-Smtp-Source: ABdhPJziCAeTmDO573VtMoPjvkdnL1d8ZUxfrNV2uJqe5ezAXg1AERQwBoJcmLBfIol1k75XkpgJ/A==
X-Received: by 2002:a02:a604:0:b0:32e:68ee:af1 with SMTP id
 c4-20020a02a604000000b0032e68ee0af1mr604101jam.304.1652824777497; 
 Tue, 17 May 2022 14:59:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 j13-20020a02cb0d000000b0032e262428d1sm67354jap.143.2022.05.17.14.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 14:59:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 15:59:31 -0600
Message-Id: <20220517215933.1553086-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517215933.1553086-1-james.hilliard1@gmail.com>
References: <20220517215933.1553086-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/python-mypy-extensions: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-mypy-extensions/Config.in           |  7 +++++++
 .../python-mypy-extensions.hash                    |  5 +++++
 .../python-mypy-extensions.mk                      | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-mypy-extensions/Config.in
 create mode 100644 package/python-mypy-extensions/python-mypy-extensions.hash
 create mode 100644 package/python-mypy-extensions/python-mypy-extensions.mk

diff --git a/package/Config.in b/package/Config.in
index c1816297c6..aeb48945be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1105,6 +1105,7 @@ menu "External python modules"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
 	source "package/python-mwscrape2slob/Config.in"
+	source "package/python-mypy-extensions/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-mypy-extensions/Config.in b/package/python-mypy-extensions/Config.in
new file mode 100644
index 0000000000..cc5b78033e
--- /dev/null
+++ b/package/python-mypy-extensions/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS
+	bool "python-mypy-extensions"
+	help
+	  Experimental type system extensions for programs checked
+	  with the mypy typechecker.
+
+	  https://github.com/python/mypy_extensions
diff --git a/package/python-mypy-extensions/python-mypy-extensions.hash b/package/python-mypy-extensions/python-mypy-extensions.hash
new file mode 100644
index 0000000000..ffe850d7bd
--- /dev/null
+++ b/package/python-mypy-extensions/python-mypy-extensions.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/mypy_extensions/json
+md5  4163ff73d0db8631c0a78bb55b551c84  mypy_extensions-0.4.3.tar.gz
+sha256  2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8  mypy_extensions-0.4.3.tar.gz
+# Locally computed sha256 checksums
+sha256  a50450da1d53cd777b80ced77c58ff96abe0ccd879706bd142c3ec20e245f0b4  LICENSE
diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
new file mode 100644
index 0000000000..26dc329a37
--- /dev/null
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mypy-extensions
+#
+################################################################################
+
+PYTHON_MYPY_EXTENSIONS_VERSION = 0.4.3
+PYTHON_MYPY_EXTENSIONS_SOURCE = mypy_extensions-$(PYTHON_MYPY_EXTENSIONS_VERSION).tar.gz
+PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/63/60/0582ce2eaced55f65a4406fc97beba256de4b7a95a0034c6576458c6519f
+PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = setuptools
+PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
+PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
