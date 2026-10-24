Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB41606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n/DwYxS1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C01D816A2;
	Sat, 24 Oct 2026 11:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26OHQPAUR5_q; Sat, 24 Oct 2026 11:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9D29881699
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842846;
	b=J3sm/mdeeZCukrIdSDlrc6ibIsNU/BvmqfyuFpgxjZWto3zVkP1SIwOYKkDkhpHwVBcR
	 I3yD1RkhPQK4fHCFCSzx36nWjirIf6fdMScAfjSZ54KQizhnZuDx4UWotWAOg2dCAGI32
	 PQLczItlC/3Ymn9kjD0Po35LqQs6xpVxCHVFvcHCNLP3joQLZIVDw4Nqf3sIwGU+aJ5gz
	 JgMBNYxrqvT8eA/n/8CSiTy6dP842zMLW1EaprJlBsbqnoyG969Z+F9LHCCA0V7hfdgRs
	 7KS4OH0YUdnvv2QGRTKgWQAuQcq+jYko1kJg6vyxd8bkeXgXoSHKv0INGvn8Tf17grw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+pNIp4W8ZqKTSNfao4IzKS9xg5FY/ZNEEi7TKuwzQW4=;
	b=taywO71TlhfKX2yzpLN/Tw55pEbtEOAtQY9n0B9o0I5hLabumiHZ7rfJ+rlBhr6/8pGu
	 hL6oK1YeyT0gSU2iHGCqg8FXrjYI6ZQ20r/XyABks4vBxsk3a1wtqgn7rjWv4oZcTf7ob
	 9a2xVpaDGh2kCnBu2mCoef9cpNfwDPohg/c50qCAd96vjQpGEYscTOtV58XPFPYyhrBR6
	 cDDiXp/1ZD1H8a5MfpJ6bPCYNByGP9qFwdk+GpjCYHecxpKhP+piKaSeRkltxxaeYK9wq
	 aHd2uXCjpe6zod4TqVFAECHatN/BEw+aJ7TYVTbqhMMdfjLPMOcOfgDxRUE6epRQ3ng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842846;
	bh=+pNIp4W8ZqKTSNfao4IzKS9xg5FY/ZNEEi7TKuwzQW4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n/DwYxS1i3bWrns8ehm7kpd24a6VJ3bD8SIc5M8loWb/rYA8A5+mgOVDa/ivLKIFu
	 pQDDfUO5nXllqzoXbXRhbrp1G2ppgS4R6xtn5aTo14vqJ3NMxoMN3t0bGQy4w+KZmc
	 4p7dV5y4ubg7pXTFa3noDmgPa2OxaQZKtadgoeY4rBS+QsL2fNwo9Nyy48JDGB/hKV
	 sm1wEP/7kEP+7g4mVYT+tlle3jzbyKDFMGot8qC281UERjFriMGC2gBZVKaEEJyeGQ
	 Y09hXEXnX3y3t3jgrsF4mxKLmF+b7UHmEIC/3F53qn4jt41IS4Y6JQIsJX2nJDY/wU
	 LRsdpCgoNzpJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D29881699;
	Sat, 24 Oct 2026 11:54:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1608356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3E5460735
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUreAamgS66w for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 073CC60679
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=Ip4h4B21MK2gByRTKDu3hOFnJiODvW1RyIah949/YXcliSpwPwAfTYhvXM/IinDH2yHT
 qNvJ8HFplSk3mzSrkGLVVkHkKEdr/2FGAawaGxfldgAf7AtSFD7YCsaK66VaTbndwQtcH
 Ij4oyhRKAGbWa/ioBP+0odca8qrx2hs6LvYHiDe8sSivShFg1ka5Xp8STuPWObLIxbJBq
 PM17Np1aykGXT8Kb48I1T5G1PihRvRFk4emG0tpKRu7VKpIYZUIKz27h6GjUhinnbYIBl
 hYAEZ1UOd/h+0VHZ9NukAhBG181rBshUKmu+uNT/XYaBEO7cAs2hYIEVtB4Qx7ZEZCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=snjHt8JC1gkeyzzCguWnOn2QavO7COOggdegMYhOCwE=;
 b=OhuuyQYzTxXaYVrEz/EFYxlcpcyUwGVRWblpwfqSpps65QsMZqR39QQNG3PlsP6GTltR
 csKXgPh8FdZEvK4ZKnhyWGb7H5lfICdnN9FLSSlI4xiyPfQzGz7Yvr3hfjPkccoylGOgJ
 8iPPiEH5ZZZrOwfXexvjpvYIXZ2mhMx1tVljRMC92d6nwzmHSJAWT0wyyI2i7RYKdrrrB
 I8m2WGIXHJHbQXMDWxO9qXCwbP9H7EXVMxYZrQYsI1SPiJdD6SlOLGLssFUYm3dIs1L0U
 SAWZM8iXjGDa/IFTBSdVl4NYK14Z47G6D9FZXQYM+60qMgmCp6j4e3SOOgA+vDCchUQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 073CC60679
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DE469C7A4; Sat, 24 Oct 2026 11:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:04:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 768584286558af3f450e5843e49d47d86ab17be2
X-Git-Newrev: 8f524367454123461ef3dd162b9dea753fd15dbb
X-Patchwork-Hint: ignore
Message-Id: <20261024115227.0DE469C7A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump to version
 2.1.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f524367454123461ef3dd162b9dea753fd15dbb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 49c20184ea..3960b36888 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  f1e2f4edfa4fdca60ca9eba308cdf610  sqlalchemy-2.1.5.tar.gz
-sha256  0df76cf1ca680ad745bd378a6299a058611a8a784eeaeb4ed78ad4a0b7ce2003  sqlalchemy-2.1.5.tar.gz
+md5  e48a02203a8c156dda64d0f8f703e5e7  sqlalchemy-2.1.6.tar.gz
+sha256  499eae5c9051efe96cb9a73ec2fbde8ffa4186f102b9094ebab8fcc9d3b99f52  sqlalchemy-2.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index fd152963e9..57a82f1ca5 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.5
+PYTHON_SQLALCHEMY_VERSION = 2.1.6
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/08/bb/28e3106ee586e5b2f5ecf211eec1348055f0f926314b13fe23b9cffa9039
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/36/dc/9addbf490110b5727380059ee542ad8353bdcee45a37ba6a5e0976966ae0
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
