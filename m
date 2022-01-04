Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3085C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DD5C4033A;
	Tue,  4 Jan 2022 20:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uJuV6wIxf6f; Tue,  4 Jan 2022 20:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 791CA4063E;
	Tue,  4 Jan 2022 20:55:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7F301BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C55144033A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVuT7Lw-2tuF for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:55:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38F43405BD
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:55:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso1281202wmi.0
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IIHfLJRT0VRZ2anHEKT73fKXfD2ALdPF2uzGPBJORBA=;
 b=lsC+dxMCg5iCnZ0MAzTD8CTGXsNlr0JJ3BtfvCvoYiNjdg00+DAqT+ohDLTIWmXQCM
 ABN/Mr/4iAguEEQxiv+v93qBPreelm+LrXr99snr6yxu6CODnYMjfMFnlwQ8Js2c1rQw
 XGYgf33PiO/TWzQVAKRqv599mRzQAjropo6kpYeCoiOf5yKt7g9EMcV8kGikJtkMS3oQ
 gskeB6gh55NcjlS4PN3kXPf6D+1njjVfBzjz8Fa0t8Lk5+wXHaDj/Q31bJLFy3u8jutR
 I/SwfrtkVRcKfcvbitx/dHrQSpuExJc+lesgscxlNIuCVH4jcrV244yRfdrahnagTAOK
 YmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IIHfLJRT0VRZ2anHEKT73fKXfD2ALdPF2uzGPBJORBA=;
 b=sxVJgUpYTUd4B2ZA+QhckoNGW1tqIJsM4fJNtGiaRSON7xPbIkDQdBXGskpsxprS+8
 YL+oRhwQKdXSEqnV2CXuTn0ogKpC94v/+H/svjGXF1RhylL5OKjpHzyfIbmvnUNQ/qi/
 Sj8/5sbay/Ksyb5mBisJdb6hws/f8gGvMI66vdZFitpRw2XJNBXRb4TmXzVRcl6LrpGf
 /Q/p+KXOIAlUbvyS6PV/zUNKFN973iutYvTMv3m7BXK2uLJ3Ba4oux2q6kCwHyIN3aQK
 24oe/N4Hiyn6vBDzgWS9TgMKEpRlesazx3ag5eJM/WjNoOlks0Or/O5EKgNNtA+jj8AB
 3b7Q==
X-Gm-Message-State: AOAM533j1vRiglPBg9DCtyCEIAGM8vjzleIbKZyjozMWAXOW+IPin1vk
 H79tS0bMwgSqLU2QMGIks3l5ZhGpoqc=
X-Google-Smtp-Source: ABdhPJz18DmeM/T7m3ilD92ihq2qJqV4fI+hy77QhPbN9nqGXdrtm/zxTLPQG39LAozCwPI4yPiGgw==
X-Received: by 2002:a7b:c758:: with SMTP id w24mr138798wmk.30.1641329751161;
 Tue, 04 Jan 2022 12:55:51 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o1sm461069wmc.38.2022.01.04.12.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:55:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 21:54:55 +0100
Message-Id: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/file: fix build with gcc 4.8
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

Fix the following build failure raised since bump to version 5.41 in
commit d38b72bcd75392a88b5100839ac410859d0a6a79:

readelf.c: In function 'do_auxv_note':
readelf.c:1046:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (size_t off = 0; off + elsize <= descsz; off += elsize) {
  ^

Fixes:
 - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Set ac_cv_prog_c99 for host as already done for target instead of
   adding an upstreamable patch

 package/file/file.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/file/file.mk b/package/file/file.mk
index 12647af8bb..62cec4b2c9 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -9,6 +9,7 @@ FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+HOST_FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
