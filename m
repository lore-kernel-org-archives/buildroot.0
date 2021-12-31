Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6479CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 09:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F20140587;
	Fri, 31 Dec 2021 09:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbimJaOgxF7K; Fri, 31 Dec 2021 09:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAC6A404FF;
	Fri, 31 Dec 2021 09:25:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C65351BF426
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 09:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A69698272D
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 09:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Th2qyGKUS0N for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 09:25:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68D2982668
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 09:25:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i22so55001041wrb.13
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 01:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7+E7Afp6bNH0gMtL0ykFIAYbBK0BpgPBd+kfkhYnPA=;
 b=TjLnyqB/s6bRkODth6x9kAy+GqQGfCqCs9zk/LUjY8BA0kZZdKIFswcPzYSj7OJtfk
 1ZzxPwQTm3nNBq2oT91mpOdffi3LQVyUU/jibr5ABwta0pheeboHNOJRzCm1LPBQRppm
 HkYhWD4zkXJG+26tJ+HNMe4Er/xshIXCzgWPJTvMNKLN5MsEDsL5kBn8mUUiulBQ4bL2
 kfr9Wb7IO6WM/efJiqD9aDo81Mmkibnwo7zwDKS1bWpTmdb89wUeaTjT/xXnVKfP+lt3
 yr8gYVpcWimO0l8A5i0pfmSnrLnVPJjhewqQZpeGk39tQwdKQlLUNXosYm0FGr8CZg4R
 I4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7+E7Afp6bNH0gMtL0ykFIAYbBK0BpgPBd+kfkhYnPA=;
 b=YLnBWqP66zAV/J2U3uQkVAqoT9ZgQcnjHySLgdPCV2FSPZ1NJCq3SvHDY/cTQEEKAf
 ceb9yuPHtv142iMIXKQfJ1nSVUOG4dW5RgHJtU4NyTs9yilUx3+lHR5PIcdRTNcNH95+
 DtyyNk+lWtCpAHnpktjBmoEjG6pC97ikUcmDsIOPmD6JH3KY9n9OlnpzghHYyfYXCpeN
 +nUDwosYyZiZfmLMsEWcvTJUbG84gjyqXCEdzQFPEVpQlaYiKlYwLCSF3E/Sb8IxWVd4
 rFopyEPlzBwNSZqMRAOWp9R6oqhSNsPJfOok9wqc2bTCbHYw4eWFnjGMGJeU9NIqjCR0
 dP6A==
X-Gm-Message-State: AOAM532eqoRNw0i6G0jcAFD6Qp/NAClxKxoI6XNIWihA8xp+s4HHVEHZ
 Ly2edCUrDK1a4ntnt3lDHyz0w4iAU5g=
X-Google-Smtp-Source: ABdhPJysdKwO0Ml2cpYx99pssTzNiAaFskylMG6eBkeAPqW6VXgMbI9WOgRoLEGEFI9UJRA29t9nUA==
X-Received: by 2002:a05:6000:156b:: with SMTP id
 11mr28981776wrz.261.1640942720514; 
 Fri, 31 Dec 2021 01:25:20 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id y12sm28113228wry.24.2021.12.31.01.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 01:25:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 10:24:25 +0100
Message-Id: <20211231092425.3550185-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python3: requires blake2 support in
 openssl
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.10.1 in
commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc:

/home/buildroot/autobuild/instance-3/output-1/build/python3-3.10.1/Modules/_hashopenssl.c:244:22: error: implicit declaration of function 'EVP_blake2s256'; did you mean 'LN_blake2s256'? [-Werror=implicit-function-declaration]
  244 |             digest = EVP_blake2s256();
      |                      ^~~~~~~~~~~~~~
      |                      LN_blake2s256

Fixes:
 - http://autobuild.buildroot.org/results/9112571b75aebb0ba5032ef1b16226d9848f5184

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index efc4dbb3d4..7714518edc 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -90,6 +90,7 @@ config BR2_PACKAGE_PYTHON3_READLINE
 config BR2_PACKAGE_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  _ssl module for Python3 (required for https in urllib etc).
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
