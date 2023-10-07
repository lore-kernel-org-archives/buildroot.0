Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013BCE95A62
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 20:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FABF417DC;
	Sat,  7 Oct 2023 20:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FABF417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74F8PfoZWHiK; Sat,  7 Oct 2023 20:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50E67417E8;
	Sat,  7 Oct 2023 20:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50E67417E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15B6C1BF3BD
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2BFE8397F
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BFE8397F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmxiZlwaZ5NW for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 20:36:38 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA61A83906
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 20:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA61A83906
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4064867903cso32388055e9.2
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 13:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696710995; x=1697315795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7+JSkAnDqfe8IvYMpi5SRDP1c5mq1HK5vsKGv3z9IJg=;
 b=hqBKupmK6v6wQux3qM6ZNNbKla809rcpI+3I9OC9oNRficCY5pMYXChqcUublTnFy/
 T/nGtIZr9NCf9S/guIqB2zL7KVdIUus0vzwA9K/x1wfNEyS90EAr6FX0YQQiwJnjcdfG
 zBVJyBmQajUR6QPEPccMfGTMM55BIqlCf+OxVK6WTEBn32o6zXp72W/lNsN4JsZgFff8
 ZZUi75gmb9WmQrEQ8rogCDPPVPDvbVmtu2UK7Cff7l5YWwA6yfd9cBMZNaMeaU8BZhAZ
 0hrJZblL2pa4mXq5CeFchyboSrcUHoric0Dm4214/9RqoTZrAgKfWdAjffHfFIy0spAJ
 nZQQ==
X-Gm-Message-State: AOJu0YzaECjbt7QWOMg4COt833K2JxFilMLiC0V+MSWm6N7rv/YzuwGg
 ZcicwdPIOG3HYVub3DqJCLjVN05Jk1KboXMI6LQ=
X-Google-Smtp-Source: AGHT+IF9jct60MZPs6Hh0Q36nphcCQydkkWEaOSh2/JaD59ZbgnIL3k2rlImwlCe8tUlWfHP/U8fQQ==
X-Received: by 2002:adf:ce90:0:b0:321:cec8:e64d with SMTP id
 r16-20020adfce90000000b00321cec8e64dmr10300937wrn.62.1696710995471; 
 Sat, 07 Oct 2023 13:36:35 -0700 (PDT)
Received: from arnoutx1.telenet.be
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa7d514000000b00537708be5c6sm4271519edq.73.2023.10.07.13.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 13:36:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 22:36:32 +0200
Message-ID: <20231007203633.2415431-1-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696710995; x=1697315795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7+JSkAnDqfe8IvYMpi5SRDP1c5mq1HK5vsKGv3z9IJg=;
 b=E2aXg4fbN2DYD2EfXVoVkx33n/tuO6oucimJJLsoyeLO+UmjEi/JtNl559UobY135v
 IvfvJpzfu5LzzLp86BbqOv9tdxh3S6GaH/TS3pN903m0vYTh1IaXeDfqQQI37/MS5Znl
 4NgrHVgSvP4ldWoKDxYUvWQBjuUiXp3xD3hEeSqjl3F4bJLUkYmMLBZGz3v+5J8pxzC4
 DMTWOfXHJ3yI4d7Rs3PI5plBgwSmDnLERTQ/d4n+AgoIla4npMN3KkoepAUSEsG6EvaY
 DeLa9SvLKpO52K3xRiSAT0YHp/lbSaPhvQOVN6lYsMXuxEL7yZ+3tSyYEYL66C2vS5va
 4XPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E2aXg4fb
Subject: [Buildroot] [PATCH 1/2] utils/check-package: allow exception for
 global checks
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

check-package has a mechanism for a specific file to make an exception
to a specific checker, by preceding the offending line with
"check-package ... <checker class>". However, this is not possible for
the global checks that are done in the checker's after() function.

Allow exceptions for the global checks by writing the same
"check-package ... <checker class>" comment on the last line of the
file.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/check-package | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 105902303e..38119f7136 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -247,6 +247,8 @@ def check_file_using_lib(fname):
             lastline = text
 
     for name, cf in objects:
+        if cf.disable.search(lastline):
+            continue
         warn, fail = print_warnings(cf.after(), name in xfail)
         if fail > 0:
             failed.add(name)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
