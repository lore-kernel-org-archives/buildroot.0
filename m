Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48470C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 03:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4E2E80D7B;
	Sun,  9 Jan 2022 03:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5ST5IoIfzus; Sun,  9 Jan 2022 03:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4580D80DC5;
	Sun,  9 Jan 2022 03:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 722E81BF2F2
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F3DC40423
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bG2U5Y7p2O4t for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 03:56:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C57F400A9
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 03:56:11 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id o7so12849330ioo.9
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 19:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRN+asXo2brTccQTRAM1NcGIE8LRFm5IToXH/oTwtnk=;
 b=MrkjvfI85g3AV0q6HcJXJtoiKzk5TOeo9/t+ppv9trLicERWfBdY63Laai4FO6BQU7
 DDjxyT/upgckYDE3WPHNl5mox/3hMnG2+NIRbmzA5/qdVsN0kFOOTrPKd72cPJjQbozk
 uP7gChZWoT2/E4bGqeHqdM3UURc2kSvjhx9OO3uVJBq22iVNYiLZ+Sqwdcz0Cj6u9w0v
 LKReQKUqkmRTcoJEoDoPYhKfofWCE+OIDgPf5Kl9vDSaWcUk9DFR0wM8O8PwCjDjE20u
 Ifj5Cv/BUj7hV0leRC8RHiOk1aNHUnMtMXPFlrSTKkXqlaCaI1rv7zNTFTHYpyYk4R69
 g/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRN+asXo2brTccQTRAM1NcGIE8LRFm5IToXH/oTwtnk=;
 b=NmjZuE/R4URS+p58fsKEqhczd2X6Cm5Wseh7qWc6SsEPTz4swaAKNYgnSry+oZFuTT
 I09tFgdXmlQNK6dJRE2U8CNSEXyw3mmQlUw5nXmuNNWuZQ3ibr7lYmftG26XaMRXqAjl
 V/ZNVu0w5v/4TFYudgSmv7HXpc7eSVEIJT4hWyRRumvHaYsfot8dCzm/XO5MApjoeYO/
 szXv4waFNZfbv60YMCBPBewGnc0oUUh9i+6eWgJgwk+cv9I8Ybc6VM95FTOknX+wdEF/
 exTvJ5aIHKrxEEgGt0o58RH677vF00WPJSuly1nkZ9DrbkKS2sk1GdQZHg+pWIqLvJAg
 mz0A==
X-Gm-Message-State: AOAM53002BlkfnzZcQ/Ovo4QzbU5rvRsQEQHmaxP1JKOPCWcCDjWdWd8
 rUK89qvn5uXsJZzySaMKSCZpMSTgjY8=
X-Google-Smtp-Source: ABdhPJwMQa/kszZ9SUvlptgqYrW5WkwP9MEDhNih1iGAascdknFOnfFEFSC7Zuc33JPWlMXiqt403A==
X-Received: by 2002:a6b:f70e:: with SMTP id k14mr33008762iog.173.1641700570253; 
 Sat, 08 Jan 2022 19:56:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id l11sm1839833ilq.74.2022.01.08.19.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 19:56:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 20:56:01 -0700
Message-Id: <20220109035601.2483360-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109035601.2483360-1-james.hilliard1@gmail.com>
References: <20220109035601.2483360-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/3] package/python-installer: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-installer/python-installer.hash |  5 +++++
 package/python-installer/python-installer.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-installer/python-installer.hash
 create mode 100644 package/python-installer/python-installer.mk

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
new file mode 100644
index 0000000000..68af457664
--- /dev/null
+++ b/package/python-installer/python-installer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/installer/json
+md5  cf7b8f470620c54f2d28167fc80542a7  installer-0.4.0.tar.gz
+sha256  17d7ca174039fbd85f268e16042e3132ebb03d91e1bbe0f63b9ec6b40619414a  installer-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
new file mode 100644
index 0000000000..2c1d371dab
--- /dev/null
+++ b/package/python-installer/python-installer.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-installer
+#
+################################################################################
+
+PYTHON_INSTALLER_VERSION = 0.4.0
+PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/71/9a/8d7c724b0d51336453e75f76b32de86b336ef26755c64119204f1f5b4388
+PYTHON_INSTALLER_LICENSE = MIT
+PYTHON_INSTALLER_LICENSE_FILES = LICENSE
+PYTHON_INSTALLER_SETUP_TYPE = distutils
+HOST_PYTHON_INSTALLER_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
