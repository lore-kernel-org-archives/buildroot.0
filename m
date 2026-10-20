Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86C9606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RVoRt8ZN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E6EB810D7;
	Tue, 20 Oct 2026 15:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6kuAydVSifa; Tue, 20 Oct 2026 15:34:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F3DEB80E50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792510445;
	b=q3avaGhWFkopfb6Wc7TYPpHzgTYtRKR+GdgSIiPsFf3Wm8MWx+4gQLNShygqhdz8ILE2
	 xenmCbj41JtbmmMUDCs7SqorMHDWIfybsnebqfj9q1bQ8eCsV4wRFYUZX93iJlOLoMIqq
	 SY5XSJdy12gSqJZxrnPZ+qWLhLTmgmBMVknOfVmsv0op1i68YgsC1A9htMvCt10ZzwDWN
	 K5SLq7nIQttGf7NrhdWWXVh9DPhbFbklHRf/HI3HMHVcktP8UzXwSc8QOsOvnsxaPkQgU
	 8IHM/C/FDIN4w3DZuz4fx50iZ0NnAj5Ky1t8PGeyiqZPWBGF+q2Uin+EkLh3juecJFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792510445;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=gnhzYW51332tBhWe2m5QFOhPkNfJN+HEsqdqhubUgQs=;
	b=IuwEF8YQemyyqbVoQgsG1ad8FitEWH4e5gnoqUh+qXmlOiQmZ9gf+qJXdwcyCBcLDBTH
	 Um5r3464ZeFer/yKpza5+9Fw7tY+bx2HC8gGDREowKLqUlMMttjQMmk82iHT+wER01tQP
	 AfpnTpk0/Jfkpoa4/4rQdTsKDlnfLv2+C/DHktjkSX1RS/lXaULtZGNKTUBDX6RNpbmM2
	 yrSPwVq+/ek+BDSVcyvJeZlrh6wkssBaSSJV9UAai+wVy38UrALwTzfq1mzBVc3EH6I4h
	 DSbNsoLcYrcGu5fTln2kPRUr9qKJuIBc/iRXHAlRYbJ6bVf4tiqCBSCDPj4xbjpuRmA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792510445;
	bh=gnhzYW51332tBhWe2m5QFOhPkNfJN+HEsqdqhubUgQs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RVoRt8ZN/RG/rc9RZtb5x8c/dZJY7PRzs0wIxJ14UDk+n7/qL3/R4XqsxFFPcmKBN
	 FJiNfSPiCa8v2Vx5sTJxfT6a9v6cET1Nqluof8oVd1j6h2A+gVAs+feXJNnhPOcbok
	 sBVmZ+Gw4yfd75eeldGSVUfqDT5td6Rcbmic8QrvccaoKhEQqnqqooBFsvUl1t6vZn
	 Ha8a60ytpdH7fpIRxLXK+dYIXrIwB5msxKeH8gNotex2XAJ5jyE0waRyqFhke9AGHK
	 K0trPDjCfbXmtwtG2ZtA3ValSvLWVX38OlPJfTRWNYCar48QnhWUr8vLlu0LlStHWV
	 Dhr7NqRClrhTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3DEB80E50;
	Tue, 20 Oct 2026 15:34:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 777AE930
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 683A7405D0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGcp9G2UtXeS for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 15:34:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 10557405CF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792510442;
 b=akiGdNKvZuMvmYw35iOjHW/0rtRg6dK8zncML5BB9mAFIbCcxKioVJ00QOV7bx0NvkWM
 rFKs+R5XNGxoQcGD1IN9toQDvwfzkYqX64HFmC9gUewJM8IRBSGERbBO3GqCJOYNn5hhP
 yDAt5N1hDIjUmZBwuIPYtJsLbqnF2MTIGIP/ukL9T0xuyrMZrnZScyPUnmlHYMUR8hrXe
 pW2YISmzao7wOjPxEgXn9kQ1KKkmTtFHuf9bwz4E1punYfkDhu48LeD5oWsCu0ZFVx81u
 1vXx/0nnlmP7pqcT4uzlRd5azLJH2zeoFWr7T8+70DjMdma9h24ZdddTgqiIbhxBLPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792510442;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=os2nbrIPfIDGgryQzSGUuJrVezb7+j8bocVYA4Qp9rg=;
 b=gJbKMq0bmRND6TwFztjj8mWhWCvAETkx+fji/atJIxnwNG0vD6HKk/frW1zQAsMiiYVI
 kf8psOWG5+LdS5b9F9lYxZp2nAaCg1WRZGyYIdh8pO4sST3ForIUJSv74HXK3VR5YMxSS
 rCkTC1Hs2DISOiaMZZfJSyOf2AAbIKwBzq086x+vLCKTUOVSQJjBtcFBLYyH2kmrxB9J6
 M0BDOlmhwbzcIETrUiiMNSr5qbAiyY57VRsLebvRYlXNTNrCE1yOQYzhMn5bOqNqAEGm6
 yajUB0pYHDEjaocVaecDwGeNmLS0BUcmdrcAv1C0wfjYeHtST4K0asT6K22rvBgzZVA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0jn0XqLA; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10557405CF
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:34:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2ED2C4E41251
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:33:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0490260393
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:33:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D158A103289A8; 
 Tue, 20 Oct 2026 17:33:55 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 17:33:52 +0200
Message-ID: <20261020153353.1865260-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/libvncserver: explicitly disable Qt
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
