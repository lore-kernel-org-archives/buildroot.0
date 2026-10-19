Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE96606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m4P7FIro
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B09360727;
	Mon, 19 Oct 2026 17:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDslaSsZO9LG; Mon, 19 Oct 2026 17:45:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D44960730
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431953;
	b=NoImTw+haAwN00SlbBkb9xOrzWAmr9HbzZBV0gdCluabeoCej+IxlhbS/Ex8NXx3QRrb
	 jMufEO5WLYMJij1bTCCMw+YOFMCJRXqAo8O63ARIM8kze5GAfT5BzcH0+36b8BFmC6FLn
	 pp6625fviJhjBrztTdArfSBQ2HryaDr6Lz56Nn/klUArtnNSoL6iiacBhYmBUkXGB4S70
	 3Z72aqWaPEsxvF/Jjwwx5cfCiTrM4uF4RUFn/QttFiNZb6vARbUCc5jcssyap2ozmtKWd
	 jQ1NwnpSwG8LZrGXWrR4VV03j/ptin4rZx1ZxuBQxkmK7WN1t6AWXtAESw6vx8asUiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431953;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sNYwRb6rhQkiP91ay8Z2k5sRV0npBFFQVLfoh1+R7E4=;
	b=PguA74dZm81/EEqFj2w5fKdTi0xdXcfY3f/9qMyZWLJvVx84b/ca4jjabUpb6UjO2S+K
	 GEu3/IuJTmm9u+V2yE18D0pV/GmkeGqxrX8T4eQ6SejGEQ/Dhv7Kcc75VuZfiW6VTUdLa
	 cz7H5xf9yT58SMPovlB0Bwr/1E6YpGZjh8IYL3UaOW3aQHdw4eIGHr/RSlzWKIY9XLlmg
	 7+Tk5J2fR22ZCz5jyOyR0HQK5kyhHjz4LrsxZFKIQ8VYmJvQwbuFx22BH3l7N2e/4wbM6
	 JSG00O0bcfK9zBRAN5Dwbsj6jKxGHkaia3KBNZe3OGOHrvoumVPIKYrzxpM9gvEIEqQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431953;
	bh=sNYwRb6rhQkiP91ay8Z2k5sRV0npBFFQVLfoh1+R7E4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m4P7FIrojNLxd6W+8yrwijZ4luGvRfNIXdJs39YayL1NNAlnpC5bgpNeXrk3rr/eQ
	 i4SZRuckThCNEp6UECirXqJxan95s14YaLTvVTrl7uy5n7XzZRq6wCWIv/C/DH0WE1
	 eS730zaR5xTmmgBkkSDDCX9KenfBhsfDQfVdpCTssUBOdu1EBIrXZ9fAd9Uak3BYTT
	 FpHBVMjvsh9pXYbdYUhm0qp6L9oO7btSOQgrt3ls8JrQNfTIn11G8qJnmi0zxT97Dr
	 kQgvYymlWXaWA27aVbK22AXZn3jbGe4XZNwHMkydSojXL9vZBjntgWIkjj4YEx/f6O
	 /sP00oL7JlUMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D44960730;
	Mon, 19 Oct 2026 17:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A692279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D8F40699
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRrJY3Zogsbk for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 27F7840620
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431946;
 b=lUwV+rlADilx87LQgMlDhUsRh4w6BRzetJTTYd62onQhLMR9v/eU19itV1wqV8cFPNlx
 Sw6TzTl0wGcJf/yI+jDq49rcZC0gtOfXnC7Kgq9vaajCiuJytrQ4PhiaK4VnUaPUC6SaH
 kIYKTUJqg/AG+2YmcUp9WzH/9qZLzmgZQCc1qONt+jjT2qJFDjDvkPP5ClY46CV0v1u6V
 i3BMRwajHaUEx3UWs16LBdXXSbJVKWq+Xrh88my74e2muEjh4eH38BcPd2dedSbAmIIfO
 t6Kw2QxQIcl9SGIqj9IenMzRbBHyrMt7PsWKRAzEa2UJg98AO3zXbRR+U+6/948aZpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431946;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UFhT2B9VB8z8oGn8HLuF17TbwnzaQRzL72U9JElHw/o=;
 b=q2NZKzMqxry3AbD6xxLG8MpsObs0KtWDZZN+yGjCjDHjHPgoX2J4jlriXS4ftQFZla7a
 f3/CpK4Nx0+GalZP+3E5134lDkPM0C5dyv6awKkZdeo1dpE7p0YVzAnIF3Y5DRlIzFBtC
 ulA0o8g9rK1tO02ffPGcsqIAyqg8TBMCr1YJo32LiBumVpLap+CFqXaQDWd7ZNf/A/xBw
 5qOsUJajIygda0d1YU3mqCvSR84+6Wu4UJ7idEdNpl/4c44dwFZX/FVIW4tJfYsCrLBwC
 kuNSDPAm6c2w7nfpgV/sxVDCuTasyJT3gZGdR6EL8bUYXIrRgNWdfmBbu6VqaYrUhog==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27F7840620
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81DAA9926F; Mon, 19 Oct 2026 17:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44f77c2dc6715e68c9aa0b4dc1084b7c8bf67079
X-Git-Newrev: 79ab24a7e4414f7a23d6e8106fabb2867f9b0bf5
X-Patchwork-Hint: ignore
Message-Id: <20261019174423.81DAA9926F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-text: bump to
 version 4.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79ab24a7e4414f7a23d6e8106fabb2867f9b0bf5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the host-python-coherent-licensed build dependency.

Update license hash due to generated license text:
https://github.com/jaraco/jaraco.text/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c

Add the python-typer-slim runtime dependency.

Drop the no longer required python-autocommand dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-text/Config.in               | 2 +-
 package/python-jaraco-text/python-jaraco-text.hash | 6 +++---
 package/python-jaraco-text/python-jaraco-text.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-jaraco-text/Config.in b/package/python-jaraco-text/Config.in
index 44000ccb18..9d987063df 100644
--- a/package/python-jaraco-text/Config.in
+++ b/package/python-jaraco-text/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_JARACO_TEXT
 	bool "python-jaraco-text"
-	select BR2_PACKAGE_PYTHON_AUTOCOMMAND # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_TYPER_SLIM # runtime
 	help
 	  Module for text manipulation.
 
diff --git a/package/python-jaraco-text/python-jaraco-text.hash b/package/python-jaraco-text/python-jaraco-text.hash
index 8de574393e..e4c69141ae 100644
--- a/package/python-jaraco-text/python-jaraco-text.hash
+++ b/package/python-jaraco-text/python-jaraco-text.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco-text/json
-md5  3c519c7a49d6448e6dc2073d466afd39  jaraco_text-4.0.0.tar.gz
-sha256  5b71fecea69ab6f939d4c906c04fee1eda76500d1641117df6ec45b865f10db0  jaraco_text-4.0.0.tar.gz
+md5  23d91c6899e89f3bb1bb6f9148302b92  jaraco_text-4.3.0.tar.gz
+sha256  ddd5eb6259d0701e08cb642c8d6b63bcc73947d03df9239ea67bbef911b3e4e1  jaraco_text-4.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  9755a18519666e5f0f4cae3daad3d7012bcae48a600b31237d75e9fe134e6683  LICENSE
diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index 2d612196a6..e0868bc575 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_JARACO_TEXT_VERSION = 4.0.0
+PYTHON_JARACO_TEXT_VERSION = 4.3.0
 PYTHON_JARACO_TEXT_SOURCE = jaraco_text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
-PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/4f/00/1b4dbbc5c6dcb87a4278cc229b2b560484bf231bba7922686c5139e5f934
+PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/be/8c/c74f1107719400477289d99cd2c0b5b7809a45f60acecfb5ef961c3533c8
 PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
-PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-coherent-licensed host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
