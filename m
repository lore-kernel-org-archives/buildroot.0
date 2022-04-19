Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481F1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 12:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBDAD612D3;
	Tue, 19 Apr 2022 12:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptK7j3G0EBiR; Tue, 19 Apr 2022 12:16:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9FF460DB2;
	Tue, 19 Apr 2022 12:16:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9C191BF288
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 12:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 963D84000B
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 12:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2S1pM-GzPEWt for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 12:16:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F6B940C58
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 12:16:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k22so22175981wrd.2
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O23IAsV4ysG0KOdo5IVH2lHztnneLGRUCdir3rAki3w=;
 b=arUWaDEsgv1wHo90zfnh3iDGgMmzvMlyL0UoztVwC/A8bgjQLEtKV5L9jUkIBQ3zFF
 xmNVL2RXdDi9XNt59Yjq8vcDhEaLttAfatMYPToz8D8dxHMGpw+tnOZy+AwIMYcD8NxN
 8ecbS1NimKoEcUXUBPl3HacHdmYM64dZB85RFb4N5SFo3ynKHTrr9y01vTcQj5ANYO6l
 3VusoaiEwfCoJbKnqFraj3A0kVOvbK0qaTcsE2w5JkdWukQ/LZ0bL2FT6pn+CgjYEY5K
 GMgfSxfrIJHBstz8HdCutClX/9v7jnok86tTKxIjNaKlSgOBjN6eYV5DX4kep7ixhvdN
 9Jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O23IAsV4ysG0KOdo5IVH2lHztnneLGRUCdir3rAki3w=;
 b=2ov9+3tgRfHsHX+F/83dDFNfXFOkywRjyW4gvDLpf71+Mro+hAulUTSrh+f3o/aUE8
 bxUc1bh1oJBV2+LaNe8tw55kbDqJVRY85YkrWxI1YGNFxIZOhAEz+u9EUb3JVhA6Yqtu
 krRWyarGBaxVhYwWtL0KszMnwwAGXZOZAbvg/U3kIVCcCfcJ6AmKp7//eXT2hOeVohll
 13dnVdOWnjtccVRTWfhXBhH2xMylkfqhkpcLRIuCQBlXqu7IGyEauXi7A89YrvGexEjN
 N5bM9oYXJAqFn84OUPdv4MunZO6MfqeG/JIrzVyyszc3zwAPcZK0lHqk+FAkcdvoEFOU
 pbyw==
X-Gm-Message-State: AOAM533EL0vivNpc41vYsfZ1kOVk0eDhaFOC6RhfLUIQP5J4JpvzW+cc
 HPChdFFlIEmdXfQ7zvUTLaFmDgI5Vsg=
X-Google-Smtp-Source: ABdhPJwC57lP5R4v9UG2fLTJHwBIGN+lCSH0UtJ0QbclDpzLXuhi2hnj8Ug43oL8NZuSxDDbDEmG7Q==
X-Received: by 2002:a5d:64cb:0:b0:20a:a4b0:dbd6 with SMTP id
 f11-20020a5d64cb000000b0020aa4b0dbd6mr3202125wri.328.1650370572976; 
 Tue, 19 Apr 2022 05:16:12 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a5d588c000000b0020a9e80d2b1sm4004409wrf.107.2022.04.19.05.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 05:16:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 14:14:09 +0200
Message-Id: <20220419121409.2055818-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] boot/shim: disable on mips64el
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

Fix the following build failure on mips64el raised since commit
11b347c03ab0b38389ec11b48f63236a3b4d6547:

In file included from shim.h:47,
                 from shim.c:14:
/nvmedata/autobuild/instance-17/output-1/build/shim-15.4/include/system/stdarg.h:72:2: error: #error what arch is this
   72 | #error what arch is this
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/74f4f1d010cfde6978fd614195ef0006f0acb45a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/shim/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/shim/Config.in b/boot/shim/Config.in
index 2f74d6f332..b0e549a51b 100644
--- a/boot/shim/Config.in
+++ b/boot/shim/Config.in
@@ -2,6 +2,7 @@ config BR2_TARGET_SHIM
 	bool "shim"
 	# it includes gnu-efi
 	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	depends on !BR2_mips64el
 	help
 	  Boot loader to chain-load signed boot loaders under Secure
 	  Boot.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
