Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B78C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 17:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A564782894;
	Thu, 28 Apr 2022 17:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8Y9IxwRLUzw; Thu, 28 Apr 2022 17:56:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47B0282716;
	Thu, 28 Apr 2022 17:56:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E02AF1BF9C6
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 17:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCCD36076C
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 17:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpWogpD8DrcD for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 17:56:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9A426072A
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 17:56:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w4so7750736wrg.12
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqIjQcEsVrjmoKL2yQxBTXyxyyl/dyRadzLYLMRqG8E=;
 b=UtOHRr7pM8ji5RmsDEjcu6oONQaJTxyma3CTkJ+o4kW9q8EudRYrgZMFoZFgmL3II3
 ZubiDjP/TmCJXxUobgIhgaDK3bUWtwdIa+57gdekyxMxGB9LZe2xuXxnZ0OKuu9+5Zy0
 AL4+szEG/UUkWwgcgh7HM+3sogpQSRx4yJz/pM4ZU6QmGZ7ux7rppUGHgSIXrf4yI8d0
 DMgPA39IoXaFGpZrxHTObXKDZ/JIRlh1OWP7/xVXAjsmL7H5jpZ/qcGvY7YhkaH5bEg+
 y5+9aCkEaYOJikX6f4zalPNPCzIZQroLenGyUol8iKm3eBm089UnwuprUfiqlG+z8kVr
 p4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PqIjQcEsVrjmoKL2yQxBTXyxyyl/dyRadzLYLMRqG8E=;
 b=GZqwIJb4AXJIRvqmOXkWqpn2Y1NkBNFQa80PQLduloBG3d6tQytaa7nSp1YU6JeMOb
 udauQbpagLAyrFfe1rq78NC7CkclVaBNb2kLTVwWwcdkoPNUJFgKOcbRCG2bG3ewNnvX
 KFLOG1XoLG84aeVh27lfzBIAJkcPE3KeYoy0gydlMWPrZl3rewbM8NztK6XtWFvehvo9
 kKj+7vm6C7RmI9BwZphefZhhMiRRW4pQVyop+Xein+e1Vb7lgrl9MaD1QJXAuY9j2H/N
 4XYnKdAUjsFRAz9h5F7E+j9rXduB6rqpDWu6liEUlyGUwPYrphnHEykH0R8yKI6c+ruP
 tONQ==
X-Gm-Message-State: AOAM532CRcuHL1RngtRH2QcWLPs6uaIY9IFL/TaX2N6n1r/uWOUiB8ee
 Gr3kkrAFa+SxpbQW171pkAsGHQrQvJs=
X-Google-Smtp-Source: ABdhPJyFiPLH4qH6GCn3vLGUrGUR7trgMVt+K9gd/VN3jHuMLIC0W3IakQedLMDRl0WUJu5y0XXKFg==
X-Received: by 2002:a5d:48c7:0:b0:20a:c72d:279b with SMTP id
 p7-20020a5d48c7000000b0020ac72d279bmr27963713wrs.379.1651168611832; 
 Thu, 28 Apr 2022 10:56:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f189-20020a1c38c6000000b0038ff83b9792sm4590798wma.43.2022.04.28.10.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 10:56:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 19:54:47 +0200
Message-Id: <20220428175447.983405-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sdl2_ttf: disable builtin harfbuzz
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable builtin harfbuzz which is enabled by default since bump to
version 2.0.18 in commit f4da031a77f200515bcc5b2e0fe665a7b4f2a780 and
https://github.com/libsdl-org/SDL_ttf/commit/834ec54127dc9c2a12928f5fe32cf110ec4c7a7f
resulting in the following build failure without threads:

In file included from external/harfbuzz-2.8.0/src/hb.hh:470,
                 from external/harfbuzz-2.8.0/src/hb-aat-layout.cc:28:
external/harfbuzz-2.8.0/src/hb-mutex.hh:53:10: fatal error: pthread.h: No such file or directory
   53 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ac8b366558bec61ada84ec15cf27652fde2b63b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 54e76815f1..054e327fac 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -11,7 +11,7 @@ SDL2_TTF_LICENSE = Zlib
 SDL2_TTF_LICENSE_FILES = COPYING.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
-SDL2_TTF_CONF_OPTS = --disable-freetype-builtin
+SDL2_TTF_CONF_OPTS = --disable-freetype-builtin --disable-harfbuzz-builtin
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL2_TTF_DEPENDENCIES += harfbuzz
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
