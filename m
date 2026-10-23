Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9D9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tHLi7Nsy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ty0vs/X7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C47B815CF;
	Fri, 23 Oct 2026 18:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EWfyAAhR3bd; Fri, 23 Oct 2026 18:18:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B41A8159B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779516;
	b=bRoS3zRmVqJVzH3QllprP90UNlymDkQqWvxUy95PIOTxyEd2L2r3rZcEF2Y5ol1MTPFu
	 Qvbb0mnzkQY7e+rP2WcHqJ+k+eI5f8iPvISQ1WoXsoO/WBV7Xtr5YT4CVx1DkveKtf/LB
	 kkVp0wRa33AXjcnWeJTsyWZ0p4HDVy2sRakmaQtGe1cFFtDoKFeQRptPfRglAmlMEQD6w
	 fCNvjGaUjBE/kDy060E5PCiry1xo5mmefsqEKG/jpVPDJUBUiu+jkIYcTB2eZxAz6wQ7B
	 NpMZSTwKcKuA2V7vEWrsr3ZiSG0COCb8JzaElOx3LqQT/c8X3ddIY4qIzjqLTKhU5yQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779516;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZgJHwchBuF6Brf/xhdqE6yozUEhlhy6luzfXHUL3Das=;
	b=hUDzTeAWQ5vEfpMMzu9h5SJILptA5aVyoe6H1ttknMVD7UTVDPng94uK7Lc8pKkjNUio
	 2Mg1FbFGo49EosnzW7sQqZkDuC6esiVPc4FSYoTVdvcn2/DCLkmDMNG3JanZIYnvItZiv
	 ww8H0X2cu0BIEJVB61bxX1cJcUWUjJ7fQTVYCkgFML5EIPWmdP2doZom4Oz0yurzqFKSw
	 jHwt82lzYPLoRVj0P05Zz5+31/Z6TsSFIrwX6IDQuaueFqELlOaWFFEWmkKx3TFkHJP+3
	 ANMwK0KNdoGkb8C/K4Pp88eoc4URKVMZ+SEGZnirJ+dzXGmwL5ZpwQnget6NU+s/1Rg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779516;
	bh=ZgJHwchBuF6Brf/xhdqE6yozUEhlhy6luzfXHUL3Das=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=tHLi7Nsyu1h56bmEY9b5mY8YAiysZWoyeznPirNaNkWo+XzaAyVyMYwVrt5HbgImF
	 bGUKAtDl/FzNWodX3iRkmJTyHahS30iDGP3dQkD+gEtOp1hDkVN+5tP/bhCv+6AHS2
	 r+7Fx8EzhKpYwvTqkPFRwXH0GbkBdpyIJp311JVbbO/yqsl63PbIpVxohp8ZCAJ7Tp
	 n5qi3ofOvnlyyiPfkPx9DpJ+7i+TEur9qnCBFjayz37PYBU5tonFEY8fzba09OtCkT
	 L6iCCgwYe0Tdfgvl09YhoWfem+PM2mz2wFdeWshz2+cGr2UR+f8Ye5fDnYJbg/Khit
	 sAZFeE7EBfsmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B41A8159B;
	Fri, 23 Oct 2026 18:18:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A61F12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60A1E60906
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMxi7Qe9FUp0 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7C09F6074A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779511;
 b=HsmP/UsDVEj2a3A1OJFA3XuwclgwmGUdKzMPe/TCD0sZnXwVJncQz2h7TaK3VbCZ64Y8
 KkLDPs4sVu4EdnkthlFipi2v/tdU7H79jnyIiq8HoYd/ZRK0bBG59ev3BURmdxVqWTGbd
 B03v4dwd8i/c+gJ7A6Ap0bsUy5TI1u06VobMwo29xhH+dWBEC12FttxNOBRtjvjo4Lv3T
 N0Lyxw673iSizd/XvnSEhBHLMQuE7wvYD1nb4svqpTgv8PH3gh8JH6QSbw8ZO3gF5INs3
 BNDe22CpOhpqpgMRATndeol3kwbkQlD2XzAR9I8XtI9pHQgMl/7xo3A8WM9Km74LFdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779511;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ceRwrO8LxEjG2jC74tqLCNLqmGEM25rd93uW6eXS+nQ=;
 b=eQ2lNKSRMIKgvwrAi4Dr/4s/Z8nXl6bAP2IaJzrywNHnI2hz5Jnh40VAVxs0EJDYVHk/
 FlCSVkb3It1ZffclwSe5+WqYmXGJjAs/enfecrm3+YRfE1AwWsxgWoPYzzPi/sA4YCEtZ
 gNHNSYqPjpAHVaaGA3ZCJGRsB8KlYzi9FidMKW4ZMswqmvRoQaYxcBoL4ksne3KZ9G/4v
 W73vMDrVnrqIpGxejwa3ESBVxswbrKjS5sRp0lfcrs7uZmeNv4K4xA+q8zFvc8p6WhUWB
 Wvd/1mS3wZq+Wbv2EyAQLtHDof1W4pOUpvGjA5Ws0YQtumShPvhmxpsDiY6lZrHjJ/g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Ty0vs/X7"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ty0vs/X7
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C09F6074A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:30 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-81ae6aefdceso1000183a34.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779509; x=1793384309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ceRwrO8LxEjG2jC74tqLCNLqmGEM25rd93uW6eXS+nQ=;
 b=Ty0vs/X7+2HNh5/ur5QebEhAiCd8uGm7zDspTDK7f6P36rJfcFvh1QEMYE43quAYa6
 MtXm9ib1mLm0FLxV6js2sbHW6uBGkb/h+hCmxB1nb2IqMOdk74XfY+1rNhLGS90667Km
 B3qX+XJSdtZtiN4vC7lPyd1yvyOSWoPJiEfbKOmAir72F17Xe3gkRKypp7aT67hQQsoL
 vxtG4FFQZ5/Gl3gjm2oFMu4e3vVdKuJzNjV9uJO5FBk5uuhXXPz3zHoMTy0n704Jm3XO
 rlmEyvFqlvb0xLYb2Gtf5GaWUApkcuKnK5GcO80iB6Y0TR9RnAvZSxC4NoC9UZeFNMdC
 y9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779509; x=1793384309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ceRwrO8LxEjG2jC74tqLCNLqmGEM25rd93uW6eXS+nQ=;
 b=gHyTnywbmfwZAwkBxB28BpW/gq+OtO26sHS3rsW9pjcPbD765G0UIbRfWQekqxp3mP
 nI+b+ZObGmn3fCgMbWFIfvG6Nt7W7zQCOBuBwhWJy8SaUjd4Y+zCMSi9q+ZqM1jzc7og
 KLkx773SzMJt5avtj0dJans0/9S21A0XQxH1+rxs9zQ7SbfJNjqx2rykClj/PwnBEIm+
 Ef9Mzt36jSMPFdfHOXXtvYQjXgWQH3ENALiddoA9+qMf3dsoUOxfN489uHvJSg+n75m1
 sHntdIFoexXrQtECRTEMi3E/+/oC5lRMjHRIhL8qcvDRQasIjakGaGesxPx4W8x3hHtz
 eaFg==
X-Gm-Message-State: AFq9FYIZCa22YcjK1wd2OIII5HQnK78bSoPybbnUNfwRk8YrfN7FJpGj
 p1sfll+YZb0N9q2MO7oh8S/QmjZI2iky0fFW4B99BUS9fSrGf/y8brRQIb8gFg==
X-Gm-Gg: AYBFou0iwkvr4h9O4+lCdEVZ+rCg+xYnLHb15g7g0JYy8mS+Pv4XCbwy9SfMliKZqOD
 a5Tm1IKN+Jk46mSi3W3xMYjUTTxjMWZXvvXZAnBHNoGo7kjcb3iMFalhd/LAa/86W9pQrqTodlJ
 aAPCsBl8Rno4UFPnhL71oByaBK5NEyiaqwv3ucen0JqNbBwPvi2/3lpC9b40DJpqTDTbTEcytBT
 hu1hVJKWp3wSkbpyjmxCyzMq5HnL89JZETH8JJU++gD+jzVFR+Jtj0yLp1lSH2APZmTelIXTRZT
 WKPxCeZWSARh09eStq5vYgVdQc/4uNqmvVDH34U/xXfuEFhl5wwR4a6BrsqEJQ4YTZztbdA7ynj
 qBkhs7YwQhbwYHm28fCBkQGBlJHGSGuwfwcVfbKn8TzX/qhZOy7xLh9cl+YsCXKVru/EBYsQJt1
 O55jN0oYGKcasuaBUS9ju5WsKfRXt2D/BCyovsrIMLaqrQeSOsv5twFvOEW0V7rfuZdyUckN1R/
 oxC8eRtFXa8ctxvKpwC1zL5aKQW1fWYgRj2fXUXbioF6hViS+BQLrsadbmWkY/sHtpR/YyZ3yjK
 e4jpHgkqJHw3TUE9HLMmiKWubp1eMgi/VEL46zU+B11JkMIpvlUE1Wf13s0o/JlMw8Ya67ow9TQ
 PJz3RjEe1BLo34Io7F+jdpF5pRqgGyZxUHe+8teMFkupxZgZSAsNkHcwNsJ3lUw4fJsEqp3Uq4k
 gf8pqJKRpQNJUwIlTfLS/ZSnY=
X-Received: by 2002:a05:6820:5601:b0:70a:598b:12a9 with SMTP id
 006d021491bc7-70b88a66316mr1629477eaf.53.1792779509653; 
 Fri, 23 Oct 2026 11:18:29 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:24 -0600
Message-ID: <20261023181818.920329-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cachetools: bump to version 7.2.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 3145620cb9..0d1ed1532d 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  cc17ff466a8a3c11920c5f9744719db0  cachetools-7.2.3.tar.gz
-sha256  e6fafd06de4a5bd915ff7d247588ea497e28c9a568c62db8678d9a5f11515a9a  cachetools-7.2.3.tar.gz
+md5  cc09f6909df2d4c8c1db9af8572f47fe  cachetools-7.2.4.tar.gz
+sha256  e0203b04b75fe13e62098eeb5b2018c4eb1a14c04e2b5b450e70db3ee7e92ec5  cachetools-7.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 73bd924bc2..9d1e337d61 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.3
+PYTHON_CACHETOOLS_VERSION = 7.2.4
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/09/88/27fe0785c7a9aa285c753db0b4ea967adbf76128fede66379c35a4b8d054
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/3a/5d/15ea0494ebcb9062c7ca79bf026cbba380a50538ae73753fb40bdffa79e2
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
