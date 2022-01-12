Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA22C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 09:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E458541518;
	Wed, 12 Jan 2022 09:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40GemE7vpLMu; Wed, 12 Jan 2022 09:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2682841499;
	Wed, 12 Jan 2022 09:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA88F1BF86D
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 09:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C39DC40199
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 09:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Da6pgAzMyeNZ for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 09:47:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8975A4014E
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 09:47:36 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id b1so1804323ilj.2
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 01:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iFjLLQ4AQQ+i9iMjSX/gqsYGYlFxi1VU4RHdFJm5EEE=;
 b=p/3oaX574KwqH05lK/yVO9fieaDUm9v04mb+eEohmFxgptuuOSh2XGAcIVZql1R6BJ
 YuLrw+cHkL2OcSF6nRJfS6Ta8O/vRJnnwFa93Np40ok8DKdtYFDn69UkHTeTLzLnYsKj
 pGU+6kedfL9lKBg1BPMmT6XYPRjJ3Mci0PeShLR6BD/vlOI/BUw81vmumX5ccucqsBeo
 CV7g1831Fryiq3+geh6TQzTFEJbbHWPrPe4udcMFMl3SSy70m3KN0uqNKZ1Dw3xM1xym
 S+mQy5N4rLDFGC36KTcE/PpvYa11ryZ2kRKJYPYjv3VN80Ld34/yILpl+ENADCU2UzOa
 b+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iFjLLQ4AQQ+i9iMjSX/gqsYGYlFxi1VU4RHdFJm5EEE=;
 b=uQQGqRexfxCw/HsNHF1jT0IQtWLc9wVeF1vzjNQiIh2Atb1VdnzG3+J1rutJ2Q8ZrU
 9RsowyfuAfNEgth5ILRcVPHXsJGTqLbSklj4DIl527GO36jZyqpBVES7Bkr5F2kaJfHJ
 tL4L8Xsz6z2u+DDKpob80rRTW4k8VAg0lE1a3UZhrJRnpB0epVQ3zhg8Dudeqg7gA1ef
 j71Kn6E782KAMhIb+S/M1GHaW7xXdtQasL4a9Q+eXPBO2T6TJfUgVw4TIoirTj8owtyj
 IWGEWfx/JWSrqgSthGz5nkxSH+AuKSlixkGKApv54X1lgUUeMUdjV8Eg/95wnQFEeYS4
 NsxA==
X-Gm-Message-State: AOAM532xf0w8Hh8OA+rPSphLi+eboLv1iDNERnny6drmhqGwybWOmU5X
 e6lCGrUZ0ZsjbfG8sbvKW5TcTbqh6jI=
X-Google-Smtp-Source: ABdhPJyGm2+8CC/t90GSewT2ZxFmdJwXRTlYLxDVH2YA1htXlZG6AjI1wFmcJWkb7OZQkCqYg4h9HA==
X-Received: by 2002:a92:ca90:: with SMTP id t16mr4421692ilo.173.1641980855453; 
 Wed, 12 Jan 2022 01:47:35 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id s6sm6971252ilq.21.2022.01.12.01.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 01:47:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 02:47:31 -0700
Message-Id: <20220112094731.2117910-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/polkit: fix build on meson 0.61.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch removing invalid positional arguments:
../output-1/build/polkit-0.120/actions/meson.build:3:5: ERROR: Function does not take positional arguments.

Fixes:
 - http://autobuild.buildroot.net/results/b2d/b2d2b27844b32b3609e11005966d85dc0dfb7a9f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...tional-parameters-to-i18n.merge_file.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch

diff --git a/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch b/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch
new file mode 100644
index 0000000000..25fa4ef19b
--- /dev/null
+++ b/package/polkit/0002-Don-t-pass-positional-parameters-to-i18n.merge_file.patch
@@ -0,0 +1,45 @@
+From 30c368a6b729bc8a0a9d0d023739c4fa07b0928b Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Mon, 25 Oct 2021 20:21:27 +0100
+Subject: [PATCH] Don't pass positional parameters to i18n.merge_file
+
+These were always ignored, and Meson 0.60.0 disallowed them.
+
+Resolves: https://gitlab.freedesktop.org/polkit/polkit/-/issues/160
+Reference: https://github.com/mesonbuild/meson/pull/9445
+Signed-off-by: Simon McVittie <smcv@debian.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/99]
+---
+ actions/meson.build      | 1 -
+ src/examples/meson.build | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/actions/meson.build b/actions/meson.build
+index 2abaaf3..1e3f370 100644
+--- a/actions/meson.build
++++ b/actions/meson.build
+@@ -1,7 +1,6 @@
+ policy = 'org.freedesktop.policykit.policy'
+ 
+ i18n.merge_file(
+-  policy,
+   input: policy + '.in',
+   output: '@BASENAME@',
+   po_dir: po_dir,
+diff --git a/src/examples/meson.build b/src/examples/meson.build
+index c6305ab..8c18de5 100644
+--- a/src/examples/meson.build
++++ b/src/examples/meson.build
+@@ -1,7 +1,6 @@
+ policy = 'org.freedesktop.policykit.examples.pkexec.policy'
+ 
+ i18n.merge_file(
+-  policy,
+   input: policy + '.in',
+   output: '@BASENAME@',
+   po_dir: po_dir,
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
