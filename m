Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C5AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 17:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30990416C6;
	Tue,  7 Jun 2022 17:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gb3j5xqiFeRN; Tue,  7 Jun 2022 17:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B44541677;
	Tue,  7 Jun 2022 17:29:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FF321BF2C0
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 17:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D35A41677
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 17:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwGsHPS42yGl for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 17:29:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8561A415DD
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 17:29:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id p10so25115108wrg.12
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 10:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvQezzJ93oRPNpEwUnIs9sRc/c+51rvAoRT4XFHutLI=;
 b=ijEJLZZm3BQfwvqwESawvrQtwEKkV5jDvlF5vBl2ItXqcNGltYk2X1NPCw5fYIZ0s8
 dLrsXbEs0Y/0femaoluqj8uimSNgCDg8TzUNPDFgwBlHXqpUJ+qmKRvHpeY7k4dmNwDG
 9ziXyO81lwj6fCX9PLlVWLibLgv+xCpk8sMQU2vPKTJty4JpAPCg9lF5eXUkFNNEFudO
 UrlZVvW6L9RNKNBCewbf4Cli8+1dimrxCQ8qAAvAo4UtXf3xd50QAJf/dpSHIYcG8pPE
 HjNs+WSZqW+rR4EOW5awVBiZ5thofLnH6PUJ/Py0vmdAC/z8FumWEIdKsKMR0AinZByD
 MsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvQezzJ93oRPNpEwUnIs9sRc/c+51rvAoRT4XFHutLI=;
 b=sSDshnR5xEr9PbGof+K3ZdPRxfyV/JM3vwjMBbXpSuSLsE3xOzgZkcLcZMhAJtuvz2
 PZBRBg2VBIadUB6IM8WYT4TDxZFlikfVA++MdbwoY9tBPcSfpt/neRmihOnvqmVT0kPU
 9QQy10YMtLhuEjUneTly7sPf+jBOqiwf+ATUqbPAQPyh2zi1H6bpNtuSj15Y6FQNLlIL
 yHMcIV/+lnuO2AR5OF1AFm+OCW6TqD+f5ZHCGrdtNc5M8+5l/XK3Esq6b2VkjxqPZfWu
 AcQDkH9H430znk9JBIFJY9x/1NrxiUuovoXinbGAEtw48cGWtLlCUnJCFz9DlYnBF53U
 4yyw==
X-Gm-Message-State: AOAM531AeDmyhDC3Ljc0eryxNaT1tN5CiyZk0AlOJU+Q+Ko49TOIoY1h
 JrrAKQLKr/L5fGyRgQj+nQPZBEGobTk=
X-Google-Smtp-Source: ABdhPJxcxgf8WOfhNHmPxDVtLmzCsD0MAVqJmkVMlDDoICswALySmQ9W9zDi2d2thTuSdQtMVjE3ew==
X-Received: by 2002:adf:c614:0:b0:215:cd85:bd88 with SMTP id
 n20-20020adfc614000000b00215cd85bd88mr20083220wrg.437.1654622956341; 
 Tue, 07 Jun 2022 10:29:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x14-20020adff0ce000000b00210396b2eaesm22442101wro.45.2022.06.07.10.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 10:29:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 19:26:43 +0200
Message-Id: <20220607172643.910948-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pimd: fix static build with uclibc
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass LDFLAGS (which will contain -static) to fix the following static
build failure with uclibc:

/nvmedata/autobuild/instance-15/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_FDE':
/nvmedata/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/sparc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469: undefined reference to `dl_iterate_phdr'

Fixes:
 - http://autobuild.buildroot.org/results/168202f65d168acc55b4d946c2e2416bf890c32c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pimd/pimd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
index 7a12f8fe0d..8abfbd5644 100644
--- a/package/pimd/pimd.mk
+++ b/package/pimd/pimd.mk
@@ -26,7 +26,7 @@ endef
 
 define PIMD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CROSS=$(TARGET_CROSS) \
-		CC=$(TARGET_CC) -C $(@D)
+		CC=$(TARGET_CC) LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
 define PIMD_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
