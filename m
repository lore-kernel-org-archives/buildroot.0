Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37BBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 12:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F7160F92;
	Tue, 15 Feb 2022 12:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9imt2u68ioNj; Tue, 15 Feb 2022 12:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4FA260F8A;
	Tue, 15 Feb 2022 12:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBEB21BF97D
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 12:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D872840190
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 12:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTNKbe6aYjgh for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 12:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D01B4016A
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 12:46:30 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id f17so31893314edd.2
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 04:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MEeymPLl8XrmXjdfV2I4oniHQmyWVs84bAARbiBl63I=;
 b=UEB80aITFBy0pGcO495DTqtD9NoY/2m5IjKbMUQ3/A11aeswL8efN22YbvsnU9U4pf
 OSg+KvTlLvYbBdhAvumrfAdFaWAuIkuDk+vH/07gK2D19yoh5HN/VCLy/2I6BVKfIPlZ
 SqMyZwc/GtzAPHQJ8S7cmrIhwOu/YFrz90z5OCqR+56PjqVn3QpLa6kY+oKGsgGEbE/n
 COHeCVdVkGOUYuW/cXCOfH7LOhnKoLdATb2CoWkSaYDafupGJimQEHIP3TU2b2Ax/AgJ
 mLRjwtpJShhdgUxtmna4rpTsJsfT1StMduSwXFk0hhY0kV4WGb1e/Tj8yHSawlk19gWs
 myNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MEeymPLl8XrmXjdfV2I4oniHQmyWVs84bAARbiBl63I=;
 b=NQITJWZirWDEMLI3+RNbYjk5G7okVsazRR1nN7wqxPj5V/3dClPVpbT16Eq9AMBvah
 vy1AM7nbihK7OnPDGCI6W29MPLtK01W8Pabzr9G+CzmDZ7lD80lwBkCIWwwqaSWGLZNh
 VZ8UllzbDujQBJMq2F9T3Yzgj+OHx6BAQ/btTfhN0AD9OLGyFF7/BKzitmgXHIhcxixZ
 4Ru7GCjwxbisJ7MhqnWJZMl8dnPRtze/nFV0HY+tC/s+4v2i5GoNZ48m+P6ZaVOhatAl
 HB2ArSgoQUsD/xFphVdqnEjK3uFcnuhWLgzqW/Dn3JQxw8Cqw7D8Dfx3DMEbNUJEsTog
 4vtw==
X-Gm-Message-State: AOAM531AEAcmyfOkAlfeGm+SPavkg4oUflY21XoLIEF6NAi0vfU4SVW4
 NWkymp0pwK+fjclvRZJyXfTReDsqN918SA==
X-Google-Smtp-Source: ABdhPJw28KhVWgUaJC05sjfWas/AlM3YeC3OPlIVDlNCBfdG+WYcYHkZSlXqLUE7WoPg/Qmo/lkbqQ==
X-Received: by 2002:a05:6402:f14:: with SMTP id
 i20mr3820618eda.123.1644929189349; 
 Tue, 15 Feb 2022 04:46:29 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id v30sm2356056ejv.76.2022.02.15.04.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 04:46:29 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 13:46:18 +0100
Message-Id: <20220215124619.563502-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215124619.563502-1-nolange79@gmail.com>
References: <20220215124619.563502-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] toolchain: prevent infinite loop in
 copy_toolchain_lib_root
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Norbert Lange <nolange79@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This can happen when there are broken symlinks.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 toolchain/helpers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index aaf2aecd80..7623d68123 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -20,6 +20,7 @@ copy_toolchain_lib_root = \
 			if test -h $${LIBPATH} ; then \
 				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 				LIBPATH="`readlink -f $${LIBPATH}`"; \
+				[ -n "$${LIBPATH}" ] || break; \
 			elif test -f $${LIBPATH}; then \
 				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 				break ; \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
