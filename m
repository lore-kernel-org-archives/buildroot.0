Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3590CC4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9B86404D8;
	Sun, 11 Feb 2024 17:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMqaCFyEZR_m; Sun, 11 Feb 2024 17:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8B0E404F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8B0E404F8;
	Sun, 11 Feb 2024 17:08:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92DE41BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FBAA406F7
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7bOs_ICzv1s for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:08:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57472406F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57472406F6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57472406F6
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:08:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b814d44f0so188680f8f.3
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707671283; x=1708276083;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MvshHLZt2t5lKWOkKYURgrTE/6VSJO/ZnlSGGCk8BCU=;
 b=qPNKoUk8JsKbUksV2CJTsxvNIgRHIYsKiU2oSAR8TwmvYFn4z0H1AEeid1DXwAwS0k
 FJBopEVFoCMyOkGWZGNwRpWbMmFppOWS5fMpJoWLot2f9n3w/6O0/dFODSYBZiez2gMx
 1QK6RdlZAwIG+K9n08bWRhvv85yA++7XG4CPRG8aSBhaUa5AXEnst3T6x05fvqeJgPO9
 uxkKE/ZSaHvy0XL+Cz4KRYRRJMdkl+OjcoUi94r9SVVx41Oew58KZdayJofityxkrbvO
 jOSrhYXYBQdW8Ao8CqPq71o9hKbPztIXHVYMjeaWarRlcmnQoMeP4/QkQKWEGANxcIWm
 lq2w==
X-Gm-Message-State: AOJu0YxRaFUEiYGPvMCCurlnBRojxTx0audb0lD34yEQGe/J4eAqkg/b
 z08cpkb1y4uXFwMb0zO7JWKuzt98ZKMCpms4J6jF16swmd0zUWXskvDL9z6XiZY=
X-Google-Smtp-Source: AGHT+IHfhesmLXzRZsOeLIfZcr3NZnBN+xSx3a53Cbjny8qkj0O6htMyokMPOaQ08mu4NSw5f7RzTA==
X-Received: by 2002:adf:f24e:0:b0:33b:304d:36b7 with SMTP id
 b14-20020adff24e000000b0033b304d36b7mr3812916wrp.56.1707671282697; 
 Sun, 11 Feb 2024 09:08:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYFO2BF8qUD4d0qjC8WijG7SqfN6qOWWNJD1kLZml7WCiiZQsmTYOBImoUUY85sPT8d5JXhq4B3VPX+JShvmYEJGvlyKn2IFYNnw==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bk26-20020a0560001d9a00b0033b46111d7csm4741722wrb.6.2024.02.11.09.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 09:08:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 18:07:07 +0100
Message-ID: <20240211170707.524645-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707671283; x=1708276083; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MvshHLZt2t5lKWOkKYURgrTE/6VSJO/ZnlSGGCk8BCU=;
 b=aFKCbVHBwuEeJ4eRRsvi5vRl1iAXgTKYVFk2UIuaZizwtKHwVSYfMvyLIM+zm+q8YW
 puvcNANGlfI7xlHR5kw8yo/r04Rmj+Qq4Z32rcSDe0oyoXxyWge5JBpBVzDZZq/RNFxm
 cj/yu0iE136p6woS3dpUND2Boy9KsqB5BrDcERuall6YfiT+x8qKFns4e/tk8CHMYRxW
 Og4XYk1wUm/xCN2R317n13AWWyO2X775aEFlJAdYg5B+MpeG/GZZG6HGgTayB8mjYQXK
 x9K4UNa4QOaD5JXR0gL2xTtPohWnaFhXmXUp3SehnOdob8Z7MVX6aQMxnEv1C/HuXuHn
 G5mQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aFKCbVHB
Subject: [Buildroot] [PATCH 1/1] package/cracklib: python needs autoreconf
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
 =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set CRACKLIB_AUTORECONF when building python to regenerate
python/test/Makefile and avoid the following build failure with python
3.12 (which removed imp mpodule) raised since commit
36e635d2d5c0166476858aa239ccbe78e8f2af14:

Traceback (most recent call last):
  File "<string>", line 2, in <module>
ModuleNotFoundError: No module named 'imp'
make[3]: *** [Makefile:485: install-pythonPYTHON] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/aec4c19fdf8087c76c1d5f472e855e0f84fcf7fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cracklib/cracklib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index c5226b3326..dce1fe9c9f 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -22,6 +22,8 @@ CRACKLIB_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
+# Needed because python 3.12 removed imp module
+CRACKLIB_AUTORECONF = YES
 CRACKLIB_CONF_OPTS += --with-python
 CRACKLIB_CONF_ENV += \
 	ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3 \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
