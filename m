Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F07C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 03:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B904F41D15;
	Sat,  4 Jun 2022 03:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZiW06ZeQTI9; Sat,  4 Jun 2022 03:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9937441CE9;
	Sat,  4 Jun 2022 03:24:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC19D1BF2EA
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 03:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4AF34012B
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 03:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zXk59L-08QP for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 03:24:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F311C400BB
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 03:24:01 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id c144so4912282qkg.11
 for <buildroot@buildroot.org>; Fri, 03 Jun 2022 20:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7dTG4XZw66uA9+CHcfszHEa32sWblFr8rgEKKk6TDNs=;
 b=Ff3201ULAJC7M8ilcYhEH9bjQlhxGhQD9Jsjnk6z3TdcgvQC6UGODN4KuFeh9GveWd
 V8NNhyTr4RLb1zgep91vyMvXqdO+VeXUSbJu0vz1aKlhfeqWMJ9MBeX5FcfuMnxgvOYo
 KWHdmIM1IOAJJwvncaw4kSrwys7lfP3+zlRAIuiipYal2tZl5otPDjwDK9rTr/czNcbf
 BAolAqwWojfUwjQouwzORh7i1nLJAYuEYkX4vE6M7ErkwTa9Qkztthfdnwxu9LV8b+JG
 uzUZkoB/o2aTxCmRMrkNyt/2v5vfldBh1DZTSPcMWWaJwZbi9zUMmCcKJi1jT9CvsF36
 gd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7dTG4XZw66uA9+CHcfszHEa32sWblFr8rgEKKk6TDNs=;
 b=6p7IYctMekluTo5QZHFddWGb+c8IE//q+GPmqwGK7t6msd1nhhFLxOoydM89XoTTQ2
 Q8GtKc0+jMnHo2+fqFbJXoW+VuBjcxg1igW20kA7IVo/qTPkJgD2NULShmRA4JOgCGpI
 8VQNtwJiIyQRTQtL6FDs81gWeUxgEtoydm4xTM4H6SJP9t8HGfHzTXIPFLls4rDKeuWz
 9KJif1NfN+yM6d28STzhf6vLIRR/DsQewkSqz2TMGfji5p+A8qT8LHMt3US2przLHve9
 G/D13DjGfq7im6YhEQeacnspCSEXIkXc6fEHL6YsgKS0Xorkl4qms5fIbd8D6QItGjV0
 9FVA==
X-Gm-Message-State: AOAM531vM1RGub+YWZq4gyhYkIAkosySCDweNYxIxrsPrUO2oPwxbNmK
 vzVi4Aj06XHEeTZkOt3FoE8xN91kGeeVAQ==
X-Google-Smtp-Source: ABdhPJxN39JnJ6HNFVqE7OH9Ugy0WolCKgKsL6jlblQDaETsKa2/1BuwUPc+eUrCdlkNJmwpcfksfw==
X-Received: by 2002:a37:9b87:0:b0:6a6:938e:35a4 with SMTP id
 d129-20020a379b87000000b006a6938e35a4mr5677415qke.172.1654313040335; 
 Fri, 03 Jun 2022 20:24:00 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:154c:e2cd:e1ae:8ff4])
 by smtp.gmail.com with ESMTPSA id
 m28-20020a05620a215c00b006a03cbb1323sm5984928qkm.65.2022.06.03.20.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 20:23:59 -0700 (PDT)
From: ckhardin@gmail.com
To: buildroot@buildroot.org
Date: Fri,  3 Jun 2022 20:23:45 -0700
Message-Id: <20220604032345.89818-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/scripts: handle paths with regex
 characters in per-package
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

Some constraints on a setup ended up with a plus sign in the path
for historical reasons and would then fail to match on the comparison
of the host/lib dir match. So, the =~ for bash can be augmented
with a double quote expansion to preserve the literal value of
the characters in the variable.

Example Path: /home/vagrant/test+buildroot/per-package

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 support/scripts/check-host-rpath | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 9a3866982b..b27cb883f3 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -98,7 +98,7 @@ check_elf_has_rpath() {
 	    # PER_PACKAGE_DIR and therefore ${perpackagedir} points to
 	    # a non-existent directory, and this check will always be
 	    # false.
-            [[ ${dir} =~ ${perpackagedir}/[^/]+/host/lib ]] && return 0
+            [[ ${dir} =~ "${perpackagedir}/"[^/]+/host/lib ]] && return 0
         done
     done < <( readelf -d "${file}"                                              \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
-- 
2.30.1 (Apple Git-130)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
