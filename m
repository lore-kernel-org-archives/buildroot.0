Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7235FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 12:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D989400A4;
	Mon,  6 Dec 2021 12:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cJbbphgvxjP; Mon,  6 Dec 2021 12:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C85440130;
	Mon,  6 Dec 2021 12:04:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A78A1BF3C0
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB9F060B75
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jwqfOXKdB7C for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 12:03:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 067D460A91
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 12:03:41 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id h16so9929062ila.4
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 04:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRN+asXo2brTccQTRAM1NcGIE8LRFm5IToXH/oTwtnk=;
 b=lHr+gm1CM9s97jMS6m7SmBVQ1OFSxsOuo6De2Xbz+MGmdAQeeyWvm4D6QmnsP/foOs
 buFKwHw8ubKBUo+bZ5beRmuABMFEBpmC5R7sHTKYkqIxV/Nzu/GAmiLqM3wHqRx9ObU5
 QfoVY3TdaiZ+EyMuOZbdcmpE7021i1B/Rc1Ht7fYJ3H+9UQ+nd2HFqHs5K86Rk83zkft
 9wjGfCf35jpilVHaKll1QW59cVtyeNjzyPpEdXXWeW3UTSXowYJNgSPiKo5zwiBrKl5T
 Qh8o8jJKH7CD457hvXJCLviBDwI/EwGDlYK/5XCCgGVPvdpzrxEThhcD2a4dXD6mhX0I
 WGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRN+asXo2brTccQTRAM1NcGIE8LRFm5IToXH/oTwtnk=;
 b=02kHf5u5s89G+6sgdeAnbrgP3sfVAEFyvJPxueeN9ATu0zqz9wlP7KXqVYmBMCS9Nr
 G6uMgmSxXBDjMYLSk+7Yf1CUeuosIQjjsqvyDDCZ73dwWgcse2xa1oglhrrjqO9bY6XH
 ePz5VWt32fRcr4EcwAwdVryPNmurzt5D1EgaRu8LBbXKin9hxJISQ0bbqlMlAwuM8gUK
 4LMcO2wDq7zQCrWjQshWG/PMeTaqqdJMhN1+MLs5jTNRcEC57y4bJnpMlxathU3rHTWs
 Ymyg5VzXJ88rMD0HH1HjTVtnPw6W7BSjKKuLZhiLxCcS8iqQvm+WM/pLGNH96J4EbN4r
 JwFA==
X-Gm-Message-State: AOAM530E9ckGuudEgvcs9UEM/+8Vej8y6x+AnQnnQipGJ9ZBT2Qg+RsA
 FSo/BBbK6vmMGJg1C3zyMS1jgmMSTjc=
X-Google-Smtp-Source: ABdhPJwdInHfWRrO9sOWmWgC2MoxsYYG6u8EofMOnq62i8pvAqzdGntmOMHnUET+3zNBfXduw3g9Tw==
X-Received: by 2002:a05:6e02:148d:: with SMTP id
 n13mr31916397ilk.66.1638792220968; 
 Mon, 06 Dec 2021 04:03:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id u4sm7153406ilv.66.2021.12.06.04.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 04:03:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 05:03:25 -0700
Message-Id: <20211206120325.3120351-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206120325.3120351-1-james.hilliard1@gmail.com>
References: <20211206120325.3120351-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/6] package/python-installer: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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
