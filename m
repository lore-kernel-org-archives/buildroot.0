Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA1606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=exVWUsLE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10DBE81285;
	Fri,  6 Nov 2026 21:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JlxS8aoCANQ; Fri,  6 Nov 2026 21:14:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DD38581230
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999663;
	b=Rw5oDNVO0ZoWY2nTyzdq5sbsZj/pdEZ5xPJvKVlSHxauALRdo+OVTFgi6kspscBF0A0w
	 mC8WSGlwI2b+Q7tDg+mM5T5cHrkRPhgXMrQrYPGKLZ9IDqBCl+skScD3Z+M9AgdDzNhLU
	 jSVvp6Gbi1Rjlw5XwjpL/NFMZEGC9ocoFY4tVhsM4fenIvgnZMZWpHdwQRWeLZg4A8Wk2
	 UKdRtFsCqfq+oW2qP86uTPTjXF0PC3a1+l2IFEZfkUb2wxEF+n3laJzHnMahoPjF7/tiX
	 2PCY/37kuvezoVhsCu4XrYNPjxBjbsGFmpYDG8HmdxP8pyyEwQKCbAFnF/yLH1D7wtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OdqkRK+I6sujLAntRz+4Mk2qrcw7Wq0cuI9O+2VEESg=;
	b=ADJ7kP6ZGyBrsxIQ+XgMhCz93NPG7UYG2s/ayMYgeLeCsMicDQ7pHggKckg77LfPaLsP
	 1FYdKU4wcYDqudUciQ3+/hKoLSOP+ggr+MQOLqBJJ0gGXnQpoPfJzvNn3JeuAPT4nF+IV
	 3KuegRwcmGTpPgDUPj7vGOwWGL75Uq0y4KLkqIUPnm5z1yNNSegakG04qfHlnfEk7TbML
	 LaQOrKfHn54Gt9RuzckcPHn3PjnC5Fab+ERif7AIVhl/cjtN0cwvRhJIF0JXt77ax7qhW
	 YHixQLVUSg0NVXE50DU0wPBzjvp1L2Rgb7MbGFrU1U1svR7dR4n9Y5DvLAm1r/hdknQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999663;
	bh=OdqkRK+I6sujLAntRz+4Mk2qrcw7Wq0cuI9O+2VEESg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=exVWUsLEAV1Fbe9KdIrQwOE6oNovrk4flVSM2f/QDQUGQsF3zTG5BecjWNxO96ew3
	 KQHs6QKN+0uBiC5YmxqqJQrg4ZSXND+b6962j+1dmTPDtyEBkcPsBLNoXLW3GseFIA
	 hanIGvY3pZZMHS4uWAAOuOXrzfOH2nQZW8PiIStw0IQk4InG6qQe4WkQa2lVN/C9UE
	 w83p8/Imu2C2f3dJR7KZ0r07PHtiFO/+7zpVpblpfym1hNLmbukAJ7IMFBhTvU47m8
	 4+ZelXL6o9tuTe0E+K3QFxTfQu54srWocJiokOl/1aXx95o2jElVH5vIwZx1mPNg7u
	 mLw2c5MAbnU1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD38581230;
	Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFB9832A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5AF8608C7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auRPWv0Ze7Y8 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 15714608A5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15714608A5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 214249E0FA; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a3712d43d13ee145114323246227e4c46450dbb
X-Git-Newrev: 3dd134b8dfbbc85079a8fe9e4bc567a6e96c409d
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.214249E0FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apispec: bump to version
 6.10.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3dd134b8dfbbc85079a8fe9e4bc567a6e96c409d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index cd3a0c8aaf..b36bd571e1 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  847fa44044377f3e52bf15abc471fe8c  apispec-6.10.0.tar.gz
-sha256  0a888555cd4aa5fb7176041be15684154fd8961055e1672e703abf737e8761bf  apispec-6.10.0.tar.gz
+md5  06365fb40f68398ae69f779d97863d94  apispec-6.10.1.tar.gz
+sha256  46896cb0cab23b4e853e528528937719739f836358832bb8610edd14db1d9c01  apispec-6.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index ddbb211244..3ae771c1f2 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.10.0
+PYTHON_APISPEC_VERSION = 6.10.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/4a/f1/1f5a9332df3ecd90cc5ab69bc58a4174b8ba2ac1720c4c26b01d20751bf5
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/10/ae/da295e3a85bf8188dd5f15e91e245ecc946c9c6af319883baaffd37f1b6d
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
