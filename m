Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E044606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QVYiqXOX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5372060A5E;
	Fri,  6 Nov 2026 21:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yTEZjGe4iFN; Fri,  6 Nov 2026 21:14:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72A6560A80
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999694;
	b=FNsRKohD2vFrKVgD7As2ZUI2IKvmD48IOqcFtyN5zKy/kk78b3liRIloKOOwAQCq+4IQ
	 8aiT/e0p+NzaOpdVy35Bc/FE7A60K/Qn8x86srNSBU6u7Qg2nzbxbh3RBAfQ23sBLdOtd
	 nktGBMCDzCx1mWp7wTYV4Sx5bYnufbOoSOzprL/HkYEIlVe0uLKlEKUiuWCEQodH5huJf
	 Yc9NeTiAIvpj9rXkPwxMUsWQdvH1NPd5HrJJQ2ANBZDQyQ/tmnTETsawvHG9YWh8M0scS
	 hDN9X/6qnE4M/TzbDMVkjmbTS1xA/GlL2MMcX/DQOOhuzCHnwzuHAwTpEbYrKm7DU/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999694;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z1SeTTJd0gLZt8l3OS6mptxipc0MF74qKAkY2+wMXYw=;
	b=n3hOk2S7Wc4c9eleaZTmQ846XX3DqgiWhTQs79GtS7jWlURQO8kO3VLiVBT/yss4kiRs
	 eMqBZYZMGfzOEeYGs0ip8AjrlHKjEsUtrPpuZxpxRiWQXK7YhJ9s/7O81BeppXGdZ+7Nn
	 VyxRoscBSbikktXa1yXutKWEsGnkreHkLhvWd3ndbd3O+gdk9iCagXxkup6VxEaTsKEKs
	 0PAXMuboRPt1FJeUImyB79Wq5M/7Lk20CaOKpImv/VeFE0WeSRYkdHowMW67bln7Po/ZY
	 TNObrzJOeAdYaQg1dK+/RlLO2CRwjkABpiHJA60cUtYuT86YIsQ0w19aLwolGP7q/rw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999694;
	bh=Z1SeTTJd0gLZt8l3OS6mptxipc0MF74qKAkY2+wMXYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QVYiqXOXmWOPLsEDdnmS8QE1Dt1fbDUk/sPwDZ0KB/8tv8F79hb9uxdAsFGc1Tpxy
	 RkwVidPVePD3N85If4qfvdMCvsevZHTRQgjdgtN2B4lrRMDpAMB0irlseIP3DUjo7n
	 KjnSnlC6/npgUm77sNlxhLufv5iQDgAj8UP7g//bCcwoIzoC80vXwnKgtG00yZJEH4
	 xWHOXDciTq8evYQswRvUcBLTYHAWlB2Y7YqvysMuueeO5Ax8o2CQQVZLlFnwiVrSb+
	 NvCf8o+why4g2DOdYoei2TKQHzlndS7GCumatMXhfXeuQnHVK+NO9uon3x07H7S25Z
	 8BcUVFqcVSRwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72A6560A80;
	Fri,  6 Nov 2026 21:14:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D086332A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C246D81285
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTuhI8PDD9nD for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 16B4081220
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16B4081220
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33C6A9DCF5; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd1beeb4b6733e26ec89ff36b59e016fb2ab9d77
X-Git-Newrev: 4c94f4848b8dcf21da8aaf0986276dc126737634
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.33C6A9DCF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibftdi: bump to version
 0.25.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c94f4848b8dcf21da8aaf0986276dc126737634
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pylibftdi/python-pylibftdi.hash | 4 ++--
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 5b2104bf9c..25c3fda081 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  9ed7dcb7eb5b3f4136ef06cd6fa48cd1  pylibftdi-0.24.2.tar.gz
-sha256  c892e71178055490b90db488a0195cb5815b1554061c4f31f13c318806d532e0  pylibftdi-0.24.2.tar.gz
+md5  ee365f6fd1b07cac7497e431a1b0092b  pylibftdi-0.25.0.tar.gz
+sha256  011361fdd9efdc52d8d3feda3a7917683f1368e7fb5c59ad550efd6519b03f99  pylibftdi-0.25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a85d0bd07d1efe2c7b24be985d3d9bfd4e9492f5e003e366acd4f99fe95128f7  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 2e77069bd6..3c8a69a711 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.24.2
+PYTHON_PYLIBFTDI_VERSION = 0.25.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/26/d9/23e892c9a1d08a0e01623164cb84ee6334aa1c33dafd0f4cecf763513a31
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/12/5b/ddac3684466db288c7c2113fb2eaa89f663e088159123084e5b9ce3efcd6
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
