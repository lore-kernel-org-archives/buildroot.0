Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633F606A324
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TbRWp3GH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnCYYTwR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9FD260B21;
	Thu, 19 Nov 2026 09:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdKrnovJjJWM; Thu, 19 Nov 2026 09:56:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB52D60B34
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795082202;
	b=OrL3oAHQ6lEolLoaAXsXs6vbS9b4FK6hIyF7AyYkPZkfR41onGsH5RYoRnGLsONAtVb9
	 0eVw8Je0gPjbFb83kZsK7gDvBZU6M4/W/JkIL5VmKrxK49lcbTUXsSm80mCA0LanlhPjN
	 NS9DBt38jS1Tjiyseaeg+ddGFMMgvZh+1LCtJIXnR8UXxDk52EE9JxNFlzmgOrDjtUO77
	 WJR+D4toD2KmupWbxAqIIb4FizOKuzVZyrBhlOAFtUS3YeDxv967MPOQfZ0CUHfWV6x/5
	 0ACjxCBXMe57oS+1GNxAzCxrec+/2lZUndhkUqeUW66Xo5CvM9UKfY2F0fKPMiqNsXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=aF89SxzLR/W1gUqVYHKwqdBvIieT/8sY4BdcY9k8y6Y=;
	b=kcopDnZa+f46pW9sdfguwyhEIx+GoQRpMvskXUf157fgDANggHcontMzJUpMEU4xJxnN
	 T5utdFTwem56jzQtq20LuJ3yz604UO+rW7IOSdaqiZfOkK1VpMD012irun1+Sy0St9X+U
	 yg6sOsfKahUeOvqc44xvjQTiCOHCIIlaKEirWXzqVx4Kv/Sn6eK4dXAjVbHCaqYsEU8Tp
	 WY4pIwZ5fAF9AOMFL5XHdc5siuKICl0UfPX5V0CD4XTPYAhKjpDZv3URYrAYUxj/v/YM0
	 EgvTbThw0mxtCBARmlpAS0fBvkKXC9bimxFwJSVKbY7sNLepm6X4Q/WhhL9l8e4a1bQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnCYYTwR;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795082202;
	bh=aF89SxzLR/W1gUqVYHKwqdBvIieT/8sY4BdcY9k8y6Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TbRWp3GHXVEfNP9c/pv431NeOGmAqq0HhS8qWA54HC9OVM19b03ROdl5gIwQRl6fl
	 EBi8zaAwH59DMMcACbrMPbKZrFNcbzl8JrrHSjCURP4lsa7CWrEaOF+hY8ImHSWfj9
	 K0Q6jNutBz+cXoyUjjSutrCeyhJYXsI+tf4DIhhMDSUPedk3KS01+BirmSnBo6eyUU
	 k5Tsot9kuEjU7ClW+0d8pPFGshrYOYbazGotVLI0gWoks9hZnuzmCt9PC9g+2a2Pa2
	 OVRMIl2lM8gwin7r8sGWufDmxKlZWh3t/hDyrAm1Y4ov7RKOu4+DW5ymuNqEvS37Pk
	 OIAItEhuU60iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB52D60B34;
	Thu, 19 Nov 2026 09:56:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BC5270B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 287EE60B34
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_hgTykodkID for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 09:56:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0553B60B21
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=VnCYYTwR
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0553B60B21
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4a32576da88so1111107f8f.3
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 01:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795082195; x=1795686995; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N1GyQFga6AQDQQaYApKegbnCyGOVAC/hkSCPzgU2wfA=;
 b=VnCYYTwRMBAIKgM0JaMdOio4IulQu3cvL6xnP/STKLxwI6AdylNSNdrDOSeIT5VEDi
 SVvCvosu01eSAkSHIiGll+RGZ/tkvLiBb6bm8n9ULphwlao9P23f1s/WlgsTIzIUpC3P
 FSqRNtRj5AopVbECj6wsEB0763RxsL2FXIDyZrV/iw1n4eW+qE146o6/L+Wkni6kpfdi
 ppNyHvamYZxNFvGZM/xkRZvTmkWI7kqZWlVBYeXkKKH5QL5VB4vfUCO38vw2XMJQ+rr2
 W6hIjrPwejWMIHSdDHw/gQ/uFiW83Y1FSkzd/yMjq7gEA/lteV/HaUu6UBhKcdJOXHbl
 bHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795082195; x=1795686995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N1GyQFga6AQDQQaYApKegbnCyGOVAC/hkSCPzgU2wfA=;
 b=sGJ8S0V43WqW61S2S4uADchsbStJJ/c3mpV5TcM6wcDjUtl/zENHTdjaW3JiPPOF6W
 b8ATowfWzIGqOLku+bHEOfs3FSuLsHvZEp/EzBEJZESJly32cq6KIltI7oJYIDSAETV/
 R5r9EKm4nLO/k1ZPwrUqvwbUMrfw6aPb4GHJh06Ft2F6BnWtXTzv1zf1jluILnm5mPV/
 52U3SIBB7/YIXdOVCAOYMwqlzfBCwfVdyx8D7yE+t0+ZPbvowLdsb3t2bddE7/Kobaem
 ThkD9LA6gDCaTLGpT7AwkUjA5eIqzKPunMtFNC+p/a7uQJHbGKIGLT/oP1nvDIhxIeBP
 t1hg==
X-Gm-Message-State: APuU4Z9IdzADbK4qF8C7hGLNbfUPX4/FHc7dGRaG0vpY1tcf+YRjxXWo
 ZxqM+d7kaSqiYqVj/vmYhiKI/ENTqH4VkhCgonvzpTBs4G0Zu/5DnEF4FfCcXg==
X-Gm-Gg: AZFdTZcTqHKajsV0dAXD3u6Qy/eW48nPb8VHurZydWTaDWVEIwMtUMUZV4MNzQffpO7
 r2w6OYI7HH2/ykCMOqYKjZJflkJS0bwIAJHloPER7XvEPQfnUhk7y7/O8PUhTkqC9YItyBZrsh8
 9f4lg4dtJIiSI14l+nsTD5bu3xElLJsPrkWEWhXe1Ne86baa+ph/H01oyq1PbdgVNVSKYkPGThG
 +4qAgoOV+ViKLAZ36F7XxMva8cXjs6ed4MBd4QvIw8xTMMgCFoKd76NneJKYDaBc79GR0t1AX5u
 2N9b8CgUyVZg94k0V1KVm6OtpJZG+yYbtBTKg0WFDf5LagYXEgGETGAJ1LrrjBWz2eRfQHWs4+K
 wIUSf8/JaqF9aNyshxnuMgfUuTXAeeONjr0v0Ju1lGt+YEa8W2+b3dgun3lzyIQjvGaLgiEtBeV
 4990xPPtlqeVmuOHcO+aHkMPZ9+u0tIe+7YTivKHkn9zRIFCTtyoJzWCO8/jh8KjthmjcHr07D8
 ewUxDvL54AvB8e0S9RgBMzEELkAC1M7rhu1105R29go4LsTTmPk9JD8LNk9bBVfOFoRFJvy53vy
 p9HgeBtm1XXUluun/4mHP87QA6yXb0zhUCl95lQhQEqemfJP7IqJoV2Jpaf31EKj/lt8UCI7MA9
 yUu2ce2gTOJuBP6SPWETR/Dh0QIyuUXjep+hcJ9qu
X-Received: by 2002:adf:e193:0:b0:4a6:4687:2cec with SMTP id
 ffacd0b85a97d-4a646872d7amr10640530f8f.5.1795082194654; 
 Thu, 19 Nov 2026 01:56:34 -0800 (PST)
Received: from angelo-Precision-7550.fritz.box
 (host-94-86-174-214.business.telecomitalia.it. [94.86.174.214])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560bd46sm9439635f8f.31.2026.11.19.01.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 01:56:34 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 10:56:27 +0100
Message-ID: <20261119095629.1990220-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
References: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
 <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/6] package/python-web2py: security bump to
 version 3.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security issues:

- CVE-2026-79318: directory traversal in read_file() and write_file()
  of the admin webservices
- GHSA-2vvc-854p-r9jv: reflected XSS via the Host header in the admin
  edit view

Upstream also fixed other security issues that have no advisory ID.
Among them:

- code execution through eval() in appadmin
- a flaw in the session_id handling
- an open redirect
- XSS in the XML() sanitizer and in Markmin
- a CSRF bypass in forms
- LDAP injection in the LDAP authentication
- directory traversal when the admin application unpacks an application

web2py 3.4.1 needs pydal 20261107.0, bumped in the previous patch: it
imports pydal.backend_base, which older versions do not have.

web2py stores binaries/*.zip with Git LFS, so the archive generated
from the git repository depends on git-lfs being installed on the build
host: it contains either the zip files or their LFS pointers, with
different hashes.

So download the release tag archive with the github helper instead,
which doesn't include the git submodules (pydal, yatl and rocket3): in
that case, gluon imports the installed modules, provided by
python-pydal, python-yatl and the new python-rocket3 package.
host-python-rocket3 is needed to generate the admin panel password.

Update the list of files not installed on the target, as some of them
were renamed, removed or added in the new version, and also exclude the
Buildroot stamp and file list files.

Changes:
https://github.com/web2py/web2py/compare/v3.1.1...v3.4.1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - bump to 3.4.1 instead of 3.3.3: it fixes several security issues.
    3.4.1 needs pydal 20261107.0, bumped in the new patch 3/6.
  - .travis.yml is gone in 3.4.1: drop it from the files not installed

Changes v1 -> v2:
  - use the comparison between the tags as changelog [Julien Olivain]
  - download the release tag archive with the github helper and use the
    python-pydal, python-yatl and new python-rocket3 packages instead of
    the git submodules, as the git archive hash depended on git-lfs
    being installed [Julien Olivain]
  - update the list of files not installed on the target

 package/python-web2py/Config.in          |  1 +
 package/python-web2py/python-web2py.hash |  2 +-
 package/python-web2py/python-web2py.mk   | 39 +++++++++++++++++-------
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index 0c141d9fc5..83ce4b3e74 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_WEB2PY
 	bool "python-web2py"
 	select BR2_PACKAGE_PYTHON_PYDAL # runtime
+	select BR2_PACKAGE_PYTHON_ROCKET3 # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index b100a1fec8..0f4f259e61 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  python-web2py-v3.1.1-git4.tar.gz
+sha256  3b04f9caf805cdbd46226c1dd7d554fd1ee34d9c3e694813929a9e6335a2595e  python-web2py-v3.4.1.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 68847a2385..53d7572d36 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION_UPSTREAM = 3.1.1
+PYTHON_WEB2PY_VERSION_UPSTREAM = 3.4.1
 PYTHON_WEB2PY_VERSION = v$(PYTHON_WEB2PY_VERSION_UPSTREAM)
-PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
-PYTHON_WEB2PY_SITE_METHOD = git
-PYTHON_WEB2PY_GIT_SUBMODULES = YES
+PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE.web2py.txt
 PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
@@ -21,20 +19,32 @@ PYTHON_WEB2PY_EXCLUSIONS = \
 	welcome.w2p \
 	applications/examples \
 	applications/welcome \
+	binaries \
 	deposit \
+	docker \
 	docs \
 	examples \
 	extras \
 	handlers \
 	scripts \
-	ABOUT \
+	.codecov.yml \
+	.gitattributes \
+	.github \
+	.gitignore \
+	.gitmodules \
+	ABOUT.web2py.txt \
 	anyserver.py \
-	CHANGELOG \
+	app.yaml \
+	appveyor.yml \
+	CHANGELOG.md \
+	gae.nix \
 	Makefile \
-	MANIFEST.in \
-	README.markdown \
-	setup.py \
-	tox.ini
+	README.md \
+	requirements.gae.txt \
+	requirements.txt \
+	SECURITY.md \
+	tox.ini \
+	versioning-and-support-policy.md
 
 define PYTHON_WEB2PY_GENERATE_PASSWORD
 	$(HOST_DIR)/bin/python -c 'import os; \
@@ -44,15 +54,22 @@ define PYTHON_WEB2PY_GENERATE_PASSWORD
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_WEB2PY_INSTALL_ADMIN),y)
+# gluon imports rocket3 to generate the password
+PYTHON_WEB2PY_DEPENDENCIES += host-python-rocket3
 PYTHON_WEB2PY_POST_BUILD_HOOKS += PYTHON_WEB2PY_GENERATE_PASSWORD
 else
 PYTHON_WEB2PY_EXCLUSIONS += applications/admin
 endif
 
+# The build directory also contains the Buildroot stamp and file list
+# files, which must not be installed.
 define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/www/web2py
 	rsync -a $(@D)/ $(TARGET_DIR)/var/www/web2py/ \
-		$(addprefix --exclude=,$(PYTHON_WEB2PY_EXCLUSIONS))
+		$(addprefix --exclude=,$(PYTHON_WEB2PY_EXCLUSIONS)) \
+		--exclude='.stamp_*' \
+		--exclude='.files-list*' \
+		--exclude=.applied_patches_list
 endef
 
 define PYTHON_WEB2PY_INSTALL_INIT_SYSV
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
