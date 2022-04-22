Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39792C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 16:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D471982F41;
	Fri, 22 Apr 2022 16:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXxlPxtOHt1u; Fri, 22 Apr 2022 16:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A74D826A4;
	Fri, 22 Apr 2022 16:16:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE4C1BF842
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1F1A82B94
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RL25Dt6Uako for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 16:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA48F82965
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 16:15:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c10so11785370wrb.1
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o7cZOZFT/Loan71wuKHruf1KVKhZBThY/2xQeeanP80=;
 b=HA94JziP4aHjNXrqmUeeaTgB9RCG83I1VmPFkpxVwPEHJOA092i8tnGPQ+1o64ynPw
 heGiEi1JgwRMXc8JjXTQwaTsIdjzXFDbfyLvLTexwziljCgYlES7WJ9rtqubJ3h2o/vW
 +hibV3HYTZ6cBaEMzfmFDlTH2cLDSn5GA94po4xbtSZMDJFH3tM3SWEpRpBIL1IzaYan
 o4CZm3AV66K2PuCt6/8jv6stSTF+cCfNcRQDu6djN5JMLejt+0QmPor21aglxPa4hTfZ
 HN8Q1azkdnGj+pbdJF9bD/9mHGhwyIY6m6Mk95zdpSulm1GK78JUIbkLC58TzYLwLnle
 S2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7cZOZFT/Loan71wuKHruf1KVKhZBThY/2xQeeanP80=;
 b=UQ4yJ4sVYyK8DtSUpl/BDZrbpEJZgPTKXpaF8YEKe+TuzS0VV0tPI2BIeGQwvLezCK
 rLqCFNVJrkcJLLU2MSX57i5187xV5q/nQKWnNcdUcDd/FlL4dBHaieA8beipcyVrzZD/
 FvvAn2uL603ZPK6V5XIIaPrzkvfCDILq7tpWokB26ju+JmXt8OkWc8KzOFlOtkYbSyVp
 Xv1KO+XDF0K81C694gB13uVprplKj4GVMMaRGFD0fddJIfDD5jZhHQos7rZ6qlmofbRx
 6Ow6+C1NxEqBEQld5Dfn3RvU64KJ3MEK93Biccx2JFea9vypkMrPVsn19KoIVYwm/TCi
 44EQ==
X-Gm-Message-State: AOAM5324/7DTfzQ9yzxLbLla6ke4g8Qv+I7sKiQFA6zT9QL16nG0wJ6d
 f3rPWc7TWF4qPkLJA/WwKPGUkzPqY+M=
X-Google-Smtp-Source: ABdhPJztUV9f6La1XVawCneGxndqKqVg+KxAa6uc4hm9w0hNx7wcMfvnwpnQi453a4KG9OkdSkYr0w==
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr4254235wrz.219.1650644134037; 
 Fri, 22 Apr 2022 09:15:34 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2010671wma.37.2022.04.22.09.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:15:33 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Apr 2022 18:15:09 +0200
Message-Id: <20220422161514.3449177-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422161514.3449177-1-francois.perrad@gadz.org>
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/8] package/perl-html-parser: bump to 3.78
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-html-parser/perl-html-parser.hash | 6 +++---
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index 36b094a7c..7393f1e1e 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  60e266d5a07fbea671a0383dd8af7b6c  HTML-Parser-3.76.tar.gz
-sha256  64d9e2eb2b420f1492da01ec0e6976363245b4be9290f03f10b7d2cb63fa2f61  HTML-Parser-3.76.tar.gz
+md5  6d7c1ca50623cd2b398d1898e48f1ea6  HTML-Parser-3.78.tar.gz
+sha256  22564002f206af94c1dd8535f02b0d9735125d9ebe89dd0ff9cd6c000e29c29d  HTML-Parser-3.78.tar.gz
 
 # computed by scancpan
-sha256  0e57338bc10d5fb8891012ebee65a7b504b247f5bb485e121b8b48d7a118a60b  LICENSE
+sha256  9081922eb873ec1809c20672a7385a65f3c6b1163166bf69b2bbe986fb5b0159  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 097564dbc..190c00d46 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.76
+PERL_HTML_PARSER_VERSION = 3.78
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
