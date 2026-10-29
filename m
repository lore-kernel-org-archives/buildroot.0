Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6A7606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QJq+rBGm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25DF960BCD;
	Fri, 30 Oct 2026 14:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HRIwFGSEp05; Fri, 30 Oct 2026 14:18:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3ED6660AAC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369917;
	b=OsibIkrfPIAKd7a/NpvCGNA1M0mBpkA/iRAu0ioDpzsrV3gJTNhss9pr62geJV5U0/mt
	 68PJ8S6+fo8qd35RfJFzqoTlpEf/fd3zhRrQkMHAufnabCJDaiyvKiwQ2YV2HwM5T8CVc
	 K13W3E4Lt2LWWExkOG1JAXRgui9xwdepFMOOUh/dbx88g2EOkrg34fyuoe6HO5IxOBfmU
	 Avn/Ibe/c5t5D4LBHsAeHn6b0zsg5319ZYhpcWoRENzfuDyHSCheo7IvmTyAxl0TIACAV
	 kSsmzySFAb5fgsE1YPvjy9uVeGdVz0sW3Hk+eh+nnOIIYFNoQ0P54wZJZLjOzsuaPOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369917;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=NKuiTKr04PUbR2QiyHvq7YVWavg8vkzloN+ZuEefiMs=;
	b=i6W/chmRD10hqJnWj822qT+QhiI0l/8bvQ7v/sZK6B7FKU0w23DaGqWouwa+fyF3obYk
	 XU5nsHQLejH4DeA7k+X9fj00xkty5q4Iy/83C7FqlMn/GhCB+noldb/qnNtxIc/sNzxkh
	 5mEEx9w1mP2ZAX5RLuzYXl5Y2cAkIgmQujwOwcdv4t356yxUScLTsZtUNv+5kJnbcz3oM
	 CSSe/h9eyzwXQ3CuiaghAx1eAFBKZVn+HVfvA6k22VxCc8BwrBdWQZW6ueo+U/dhNEI3y
	 +f6W7KNsQts4FK8wP4Pkz8iZWk1N/OfnB0FFxsDO6cNNCR9i+AQEI9cDfkI5sfhcKrA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369917;
	bh=NKuiTKr04PUbR2QiyHvq7YVWavg8vkzloN+ZuEefiMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QJq+rBGmo7IINS9OjBK/KjYtfBGvx9SLPWm1lYoeBUxm8d0ErOlGHbW+p5dCfSV3G
	 0BdXuH0xFm5GMVcD1rzh7mDoAMDcRwK39IB7T8O4MuxL4iBxpmJB/NjOOmJUiCoxbU
	 z66SpKxm2yQXpugYvX7s0rMoYwH11tdzuNaCSgHp4mI92fbUr0Gb1o4lGSyRVPmDB4
	 ezUhmzlnmHSXLp0e07wPcEdvKlxoPwM1i94yPd2oJpXefBPAHwoyIGkrT1r9TDdKUy
	 yFTkdBAyGHv9OELM+I2cGiOPMzyP16zktmQQOkyBZLfec4X5HwZqct+PDf10BUqEuu
	 HijbCwhd+scMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED6660AAC;
	Fri, 30 Oct 2026 14:18:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91A4F712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77EBE400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmGmFCY5XUH8 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C952140243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=hCPngKZJQwgTqIisonri5oXXivZccoN2qXSuJBmYQoIilFWuJLL6k83d3wkfSJRUP5kG
 HT1iDcGAx3auTT5UBYtXGJH4y1jUq6mwgcQw80pzVMiWxYHWfUBAi9/eQrNbZ8QuiKgbc
 lvHz04/xqoJXlZuT6Ovj0RbSlwR3KTCv/xKJpSTc3Dt0CCGaYSLje7UmkPh9IIqlkCqUn
 onutDShwLAVrCTIQWAgf1qe+Jf3oY0fEDJmAAXKgLAx2B0uAsQxYSW3OONB0emoXCvT6V
 2Hswe8A6ynFt2uPpWnZsFbK8ATZwBqhVTUuY4yUqB7dDvcCNRxGgzHmyjWPvrLlGlaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Czas1TApLwjYVB15SAdmPTSutcaub9zINej5WiuwjZ0=;
 b=oGbhpmt3IaLh++q9JpAUUClQL8Vc60jugJJwm4+SypK46Q7TWJL2Urd9KNPB5v6HsAjB
 TTRdHViZGKauavFNru+FDqxoQtmzQTVtABUz2fPmYrtSOoDNwOd4625dRmViOsTFdFRLJ
 0aj9N2izKZle7UygwXbLAxasIvou+f5PzzHNcMS/S4R8h6pRtsQkF0GSH+5c5tXzjTjva
 CZ2awyo1mYH+ywPASEVziszCtxxuY2UEG9hw/CVHpjgEHcn7yYzMdmMK3dmhf+Xj507xW
 u16Zq6Q9o3RzCyTmSTqXGKhDj65LvCLcNA955VVi/pztlgzhiZp3k47nTWfixUqQP8Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C952140243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D55A89D389; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 646c6348c192b4808af5858ea0dc6e565a76a65b
X-Git-Newrev: ee525a6ae43a0ad2f7a485f4417a9f47f235f9de
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.D55A89D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libvncserver:
 explicitly disable Qt support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2735250625733106611=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2735250625733106611==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee525a6ae43a0ad2f7a485f4417a9f47f235f9de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Qt can optionally be used to build an example VNC client. Like for the
other example clients (Gtk, SDL, etc.), let's disable building this
example client. First because we don't care, and second because it
fails to build:

CMake Error: Cannot determine link language for target "client_examples_qt5client".
CMake Error: CMake can not determine linker language for target: client_examples_qt5client

This Qt client was introduced in libvncserver version 0.9.15 (by
upstream commit b44665c0a28ba3776edebb57548562cf7ddc117f).

No autobuilder issues were found, but the problem can be reproduced
using:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_GUI=y
BR2_PACKAGE_QT5BASE_WIDGETS=y
BR2_PACKAGE_LIBVNCSERVER=y
BR2_PACKAGE_LIBVNCSERVER_INSTALL_STOREPASSSWD=y

Fixes: 3b62f17f327ddacaca9ba134c4a9c1570bd869b6 ("package/libvncserver: bump to version 0.9.15")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 75a25f5c902a1c2c147a0db71d3eae1bfcdf6db5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libvncserver/libvncserver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 49c94b8708..e541c2471b 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -24,6 +24,7 @@ LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
 	-DWITH_GTK=OFF \
 	-DWITH_SDL=OFF \
+	-DWITH_QT=OFF \
 	-DWITH_TESTS=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)

--===============2735250625733106611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2735250625733106611==--
