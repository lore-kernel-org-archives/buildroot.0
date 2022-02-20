Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EE9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 21:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884B960B73;
	Sun, 20 Feb 2022 21:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hwiSRx4XRAg; Sun, 20 Feb 2022 21:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABB1560ADB;
	Sun, 20 Feb 2022 21:54:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD551BF3D7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8292B60ADB
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqUWfJOJbswU for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 21:54:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E1F1606B0
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:54:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d27so23882965wrc.6
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 13:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mU7DJFFOwvMBJV5j2/CcJVMdSTJjbbVeaxfWCbE9EHE=;
 b=FUQ72EaaX9+bYcgC9YM3cdtz3FBkxw33679F7r7L9heVr9GQL/XCj1EzLDSCoqJ8/m
 2aWUOe9A+Bna1Lv92i8RleKq4PSHWn3Bvp0C/I6tju97c2Sn1CSL1C4Yf3gz3aijcLLT
 Qqg2jmtzpJ3NvzrjHd1qK6SC52qmhnx+XCkqQ8GHnEyBQM+/2ncbra9PLZ0rgH0PIRbV
 XRKEq3ZW7ZilIOB7E6tY1lLImwfrbvVssMKQ5K7pbzohf2WNBLsNlRorkaQM4LuUj0Gw
 u1oQ9YEHw258cOnshDdlGOtZBahcoOOnF7f8lIZFaGAU71hZL+74uTFg60qkaxPn8xaO
 ZlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mU7DJFFOwvMBJV5j2/CcJVMdSTJjbbVeaxfWCbE9EHE=;
 b=oKdqah7EowHn7wKXaLDgYrZfx51uqJMddtIuIQ5LcRxv2Sm0/sl8LcYehEr2V2BvDx
 D9t0o9NEd4bq8lJp3T9NEVALrNQhj2BVS1ihNK4U9/VYBXpBI0Ier+7pPmiYOi5fIOX7
 s/hjGpLRkMs0U410luADiPF6eg/Kj9J7az6qrUDfVXBRH6Ebc1AxiDem8RELbchtpD+a
 ZaQRGgVheoL6XcJJjFrZ7KMnxvC6vns33sRn6qbpzAb526qYXaNGW5Vm0WLFJoxuHZlN
 UQphduePtFIiGwyce3i1sH5yg0hDGYibdCmuo59AwZyUEbUGvbcJYLzq++b2ztLMa5lo
 aQ8Q==
X-Gm-Message-State: AOAM530v76pixYa9Dfm96nUEjXp3jpb9J5ZcMcrqNR03osQaFuU5yDz5
 6ZjtzisBFMEOwcOJ/QJUOzosZIfWCX0=
X-Google-Smtp-Source: ABdhPJyZOFTjVAnZ9HEY6G/HJkYkV5i2Sy2SBH2/PH9fDkqv6hUr50LZ3Acs8QetJlE1nsajKabIPA==
X-Received: by 2002:adf:e845:0:b0:1e3:f9c:daae with SMTP id
 d5-20020adfe845000000b001e30f9cdaaemr13479664wrn.239.1645394044430; 
 Sun, 20 Feb 2022 13:54:04 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id e4sm27779148wrp.25.2022.02.20.13.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 13:54:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 22:54:09 +0100
Message-Id: <20220220215409.1740105-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: security bump to
 version 7.31.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-21699: IPython (Interactive Python) is a command shell for
interactive computing in multiple programming languages, originally
developed for the Python programming language. Affected versions are
subject to an arbitrary code execution vulnerability achieved by not
properly managing cross user temporary files. This vulnerability allows
one user to run code as another on the same machine. All users are
advised to upgrade.

Also update indentation in hash file (two spaces)

https://github.com/ipython/ipython/security/advisories/GHSA-pq7m-3gw7-gq5x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ipython/python-ipython.hash | 8 ++++----
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 5f591129a4..cd18c3d125 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  f733048322cd34ce392ec5404813540b  ipython-7.28.0.tar.gz
-sha256  2097be5c814d1b974aea57673176a924c4c8c9583890e7a5f082f547b9975b11  ipython-7.28.0.tar.gz
+md5  6907b67691ba697173a3befb2c35f7ac  ipython-7.31.1.tar.gz
+sha256  b5548ec5329a4bcf054a5deed5099b0f9622eb9ea51aaa7104d215fece201d8c  ipython-7.31.1.tar.gz
 # Locally computed sha256 checksums
-sha256	341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17 COPYING.rst
-sha256	e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
+sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
+sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index c669dd1b92..389ebfa897 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 7.28.0
+PYTHON_IPYTHON_VERSION = 7.31.1
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/e2/c8/7046d0409a90e31263d5bbaa708347d522ac584a1140c01a951d9deb1792
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/fb/39/c1947dc1bb993a35469ca474535cb3214c91f5f9a7752a1fcbd9b6b37dde
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
