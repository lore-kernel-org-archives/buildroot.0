Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BCE606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lEGcpPp2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A683816E2;
	Fri, 23 Oct 2026 20:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_rKXubnuIiN; Fri, 23 Oct 2026 20:27:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27AFD816DF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787250;
	b=aiJPFTlBVt+wPVbBAW/5DXMrp93IdA+D7K0J3VqMBL/eFcIunNxG0bNqc49x6tKX4ON/
	 UEerDGSLWhy0HMiaKHfnlG3DM+cU32dJWglMI37kPUpWaNudKfS+7yqa1HmCoM6PgfOGY
	 b8AkjdW5W8JUXulYAjjG9rdAuTfPRt2k/OieZ3uCaOG8PxXSF06pdrmE3b41yaOWblWgd
	 ETwgn/GoO6Chzph0v4pnWVJKf9dlUR2omUg2JtFvlZQdQCq8EWpSBCg+vR7lxlzknGXcZ
	 NfX/sCKYzL4ynUM3KsGJUgeyEMJrbAYOlUIG4TaoocAkQ1+4wAqyF9UL4TKYpbnPQxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+6aO9mbhqwH5HT3dlV06+e/LBGRGVdqyhvhB5Wggnso=;
	b=dZkgc7ejvhsvJ57M9X8QDWHbLd06cgR7U2p/CIhnlS21xEgjJRh01h7MmW+WkCSvdJ9R
	 Yhog6kW2IOFxMV9lnjvLcq/sNutOOkpcOrv9IS9JtWaOczain1vjut1A/mvLraeGDCE2v
	 bJ2kBEjUZCh+2WKLPreeXiWlrOMSuhxNSmbQUQdLDQB5aUjXOuHO48ZvcjhUwlcaj03Ma
	 TwzstUTTDXmc70RA0818iCYJ0tkZuB6ZpsnSTnWXrK/Gs/SrLxD4C4J8V5v+D74BafAgb
	 mjI4YuHBSxa/nAC2hhdMfRFlbWG67tMK0TUZJ95I6+KueqgtLsEcMLManu3fom8/7Vw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787250;
	bh=+6aO9mbhqwH5HT3dlV06+e/LBGRGVdqyhvhB5Wggnso=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lEGcpPp2YlIcfX/yp7a5qPAPd1dLLu6zYK/b9520Afew02S/Cba0zi5GaHEflkWaJ
	 vlaWF7QafSOlzzLJQrAAVOY/PxeLlpFGWZm/osTHgjzsTXomEgdq0JuRPHEt0B1S2W
	 BSxcreFbuAYTKBtGiPwYTZK2wJuGPwu0jWs3BV1WWj4fdzLtiOFgEbD+bxllV6ZxCE
	 CR4lSJDGq1oel0+8XvCiG14QkxxZZxCoNYhqqzX69DIZl9BHir2/5euTCJBurVR9cu
	 QnDy+W5GbBiYVucXFMwUaVWIdv/RCsqn587ffIFxgnY5swWcTZcDFkBUOAdJduqBvS
	 8HA6t/KUle1Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27AFD816DF;
	Fri, 23 Oct 2026 20:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99F8AD31
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B23E40474
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATDrIogPx9MY for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 59B27400B5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787242;
 b=sZDIIse0CIACd9cUvfnWxw6HLrbbdEuZoKhDeetFvEskbaQbp6xCKMJqUaymKYlY81oR
 8kzfND5aYQfrLL1XwZwPM5lcOaOR8qLWFyTrUmIACwgxMSlFBEqpaceIDgIEfbORaYxid
 PXdfzW1CwNJXfDGsgu36uZ1UC+KzknqnMs9isc6+f2qPBpeRBg/BziLPimD3rNgfEia4H
 oFMzV6e7ZpM51MnhfjDcb3nLGneUbz3VwhnrhvPy1PtzewJHWLR1RbdeFLglBXUTXx+q7
 csbFxwMCHKD8AOXOt6qSXvd4P3uJsIPfQEgz0KMH8Ca4Qz79vj0lXWeJVr9/XFsPrUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787242;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RGbn30qfVzrnGC4323plaex1dBMLA6wle7Sz4XfYK0I=;
 b=G1Fk1M6JoRgQ1Z5isc95fdeTUf+MkArBbgTXXEo5/iyK1VbPkLtujPwi+FhUaHm7mG16
 G9HCjzBCLuv41iBsq56m/0qNLVWPouGuXPaFRfl+DU1IiPdEIYfktn3jd1/7xtQIrG/e4
 Fpct07VzNNkX2cHRi8PXRGLOGvuHMkQcQWO/ch5763AyTb4wYbcEBNPoYAKTbBwwG6TVC
 QDNBeLLdgjUqMafJjj8wWOaWzU1aa47Ton0atjBKyDwTbUnqcYlKGAnIOrsP0ldGKoUFL
 PTap1tCKsHUUIzAeXhLA1EqrtxLtHLNQV4gi+UJtM5x30fEcbAMtPKXKVljIsN2U9fg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59B27400B5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB7169C6AB; Fri, 23 Oct 2026 20:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 21:52:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31840be2b92c023c3d0b3bdec990c8a42b065868
X-Git-Newrev: fe6dab82913805738d32894a5efd134d4ae13db6
X-Patchwork-Hint: ignore
Message-Id: <20261023202557.AB7169C6AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asgiref: bump to version
 3.13.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe6dab82913805738d32894a5efd134d4ae13db6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 43195778f9..087a48c6ff 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  1997ff1970b2879b5945c9e8c9f8765d  asgiref-3.12.1.tar.gz
-sha256  59dcb51c272ad209d59bed5708a64a333083e86017d7fcdd67498eeab7784340  asgiref-3.12.1.tar.gz
+md5  a0db8c36bb7847ea40fc11def500ceb5  asgiref-3.13.0.tar.gz
+sha256  034cc8cbf72d00553b4be256703ac545120b4e50af13b49dec99da899aeeecb4  asgiref-3.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 4955a631d1..8242eaab63 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.12.1
+PYTHON_ASGIREF_VERSION = 3.13.0
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/e6/26/3b59f2bdae5f640389becb1f673cded775287f5fc4f816309d9ca9a3f93d
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/6b/90/f5fce14e95fccf53b58e8e2c47cd84d40d105d64073ae1ac75166db150e0
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
