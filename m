Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27069C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 13:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C621F82383;
	Tue,  5 Mar 2024 13:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F05XKPdx8Sye; Tue,  5 Mar 2024 13:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A894582389
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A894582389;
	Tue,  5 Mar 2024 13:47:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B35DC1BF309
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD7EB82383
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZtyD9T062Cq for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 13:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A4FF82216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A4FF82216
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A4FF82216
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 13:47:51 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412ecc1064cso5479085e9.2
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 05:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709646468; x=1710251268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VqHJDSAguxNHS+ijISoXDYBqnA02wxT4TBdjfZ+8m9o=;
 b=GmgaoQHI0m7oZQThSJmulvD1x3V3pWgA1d5iBW5vghIvLmVExVptos7qhcToeilm+L
 zp9wMf4HO4Po4Q0tGwFn3LP5sF7IdPhwf9R/dddXU8wkGT4nZYzksC2l5uu+p+g6lCdj
 7CdYoyXgzaPooBEtyc3fFvwo7aOSORXaxzklz3E5/1ojwX3H12lmmC6sxdu51MJrIh/r
 gYqQlrpLBAX0AaW7vZjSBi2l7wwMvVfpHk5V0iULufsijNKWqzrsIgwpXnQUoP9j6+Sf
 L+kXtHhvA9fcyDl0VCqRHWCtyWXr2JSNTrFLhNQFqwC8WRISC8QzfXFPcynMwaJWljC/
 UJww==
X-Gm-Message-State: AOJu0YzpQeqlRXF8yWVbnORcg7QGj64Rw+IgP55Dl3ucClJcnONAnq3N
 LMyhRp+g22ylDFnj50aCAYWx2rl3dwC9xDKCRFiBVAFApfOGQx8p1N5eCKTY
X-Google-Smtp-Source: AGHT+IHZBjCPULurLRBZTOiUVf7b2IkuVi7uIoDFsdZGHhFojb9qGcp57ErLqGHplMLSCBmdcHdnIQ==
X-Received: by 2002:a05:600c:1d16:b0:412:a6b:d572 with SMTP id
 l22-20020a05600c1d1600b004120a6bd572mr8337247wms.34.1709646468277; 
 Tue, 05 Mar 2024 05:47:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bd9-20020a05600c1f0900b00412eeec84ffsm1315004wmb.36.2024.03.05.05.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:47:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 14:47:46 +0100
Message-ID: <20240305134746.1124362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709646468; x=1710251268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VqHJDSAguxNHS+ijISoXDYBqnA02wxT4TBdjfZ+8m9o=;
 b=A7s7NkYTPbkI4JJeg9rdAYB8OjoGaeAxDJcZBPoo8LvG/w5UC8z4nQ9m7spgz2AXlf
 x/+FTjXTsoe1pBi1DMHVVjyOsyNcKXFMiBwEJqoMHLe7Av4RI6iEk7aBj+s2lAeXxAXe
 9MUyj0lebl5ro61ReVpvdapAouUJt0zoBk2nO4ttPllOghIGUjd/DWrLmwk9X+ZvHSSq
 NCtswIf1xisZNnq6aWs8shEYKhzuRtd07f9arnNjxnpXCErZWWBSUzMqS3csW/8yZGse
 gpSxI6+EgIyW+x+F+oLMWJmTSv8TcnGH5ISsjqGdQ1D23mOaJVlK2zh9wJVZROYMnRHr
 2I/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A7s7NkYT
Subject: [Buildroot] [PATCH 1/1] package/restorecond: fix build with
 BR2_TIME_BITS_64
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/fts.h:53,
                 from restore.h:6,
                 from restore.c:1:
/home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

Indeed, this LFS workaround was there since the addititon of the package
in commit 9d6da7a264a5b36ad641a0d26b3a3d27188d3624 and is only needed to
fix a build failure with the old codesourcery-arm toolchain from 2014
which uses glibc < 2.23. as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/restorecond/restorecond.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index cd40905230..96ef8d2a50 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -11,13 +11,8 @@ RESTORECOND_LICENSE_FILES = LICENSE
 
 RESTORECOND_DEPENDENCIES = libglib2 libsepol libselinux dbus-glib
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
 RESTORECOND_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
 	ARCH="$(BR2_ARCH)"
 
 # We need to pass DESTDIR at build time because it's used by
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
