Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529A3C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0758660ACD;
	Sat, 13 Jan 2024 20:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0758660ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jbLy5FgntDG; Sat, 13 Jan 2024 20:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DACF60A9A;
	Sat, 13 Jan 2024 20:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DACF60A9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE241BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE974044F
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CE974044F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNyB9NW67xsC for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:24 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C825C4026F
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C825C4026F
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d9b2c8e2a4so6367777b3a.0
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177223; x=1705782023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48T2PGj1/dlmET0hRmbaXdXoJxl3nWh52cBrZFPFL90=;
 b=BYqxuaAcpNRDUYgbIwZeNcxFCRPhJzrd5iCIA7a0sq9C0gx/ffVhFsmdd+EZIrxLlZ
 NO7EsroaJR6t2MDIOuk2YYGwj/gL54G3xEcOdVRv0fv/PTxYD8YELIOl6UaLjY1O1kB8
 wO8osd/ZB7GdKvvoB1/DouB0BaYrGxyBGKV2Aj2+bZ+ZjngntVvH3oUFFm33dtVeVp0Z
 ddsUF+E2Ah/dmijWmQL+jI7b5upWUuYRExuMLjj6zby5yqSOcM5egJQssX0BHDqtE5oK
 UY7loG8LfFiwXIznn2IhiOPm/GzPG+fmV2VZU2FQdd62uLWJbQxcPZg7sv1DlGLFJbWA
 N1CA==
X-Gm-Message-State: AOJu0Yzl8231TcwAu+IibYjC97DKK+7BrvirLVIjJc299gdFf+p6KLBY
 N+biPn/xthLMwbwyrkcTNg0t6VOlAxEX9USGnP8hAEJzcr8=
X-Google-Smtp-Source: AGHT+IF/5llwqK/QbjDbazxUWTY5ck+pHqfY+cjC5SmRKZErfCP6w3zcB/A1GhdHPU4MPd9//+PpzA==
X-Received: by 2002:a05:6a00:a14:b0:6da:ed17:bfa7 with SMTP id
 p20-20020a056a000a1400b006daed17bfa7mr4523244pfh.6.1705177222755; 
 Sat, 13 Jan 2024 12:20:22 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:22 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:10 -0700
Message-ID: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177223; x=1705782023;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48T2PGj1/dlmET0hRmbaXdXoJxl3nWh52cBrZFPFL90=;
 b=eUk4Q1oMu/+3nleVaAuxQIpDyadk6BNchm8Wk7RjKWo16Jk+E9Sdaz1av8dmfglx/2
 HhxrUo5XsYIrw4DRcZA/LFbXEI24wLc/ttBWwTsXSPMql0UTh7QPAPHerzj5QcEHJe9Q
 537xtsgdZ+zMzLcWDAnuXngGhS7VyvNxdyyHo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=eUk4Q1oM
Subject: [Buildroot] [PATCH v2 00/10] more flutter package improvements
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes v1 -> v2:
  - Bump flutter-sdk-bin to 3.16.7
  - Bump flutter-engine to 3.16.7

Most of these are self-explanitory and simple, however the depot-tools version
bump should be explained:

The current depot-tools version is from Jul 13 2023, and there is a bug where
when building with PPD enabled, building a Flutter application on my laptop
running Fedora 39 or even in the Debian 11 container fails due to permission
issues when running rsync such as:

/usr/bin/sed: couldn't open temporary file [...]/output/per-package/flutter-gallery/host/share/flutter/sdk/.vpython-root/0e1e32/lib/python3.8/sed763MrF: Permission denied
make: *** [package/pkg-generic.mk:267: [...]/output/build/flutter-gallery-2.10.2/.stamp_configured] Error 123

After several hours of attempting to find the exact cause of the issue by
parsing git logs of the depot_tools repository and cross-referencing bugs on
https://bugs.chromium.org/p/chromium/issues I am unable to determine the exact
reason why the problem occurs or the exact commit that fixes the issue.

However, updating depot-tools does indeed fix the issue, and looking at the
source code between 4e87f5bf and 8d14454b shows improvements to several bash
scripts, such as gclient, vpython3, and spid. All of which could be culprits
of this bug. As flutter-engine is the only package that uses host-depot-tools,
it is safe to update.

This permission bug is present on PPD and normal builds, but causes a build
to crash only on PPD because of rsyncing. On non-ppd builds, the bug only
causes some minor annoyance when trying to run `make clean` because permission
denials crop up when trying to remove the .vpython-root directory.

I can't remember, but I * think * the autobuilders don't select PPD yet, which
is probably why this bug hasn't caused any autobuild failures yet.


As for everything else:
  - Tested on Fedora 39 and Debian 11.
  - PPD and Non-PPD.
  - Docker and host.

Everything passes and works as expected.

Thanks!


Adam Duskett (10):
  package/ivi-homescreen: add standard_method_codec.h to keyboard
    manager plugin
  package/depot-tools: bump version to
    8d14454ba4a35fd9d2483842b08815a2357ec86f
  package/flutter-engine/Config.in: Drop nptl dependency
  package/flutter-sdk-bin: bump version to 3.16.7
  package/flutter-engine: bump version to 3.16.7
  package/flutter-pi: bump version to
    b816d8cff40e917ed0bc7905ec5f8611c08b5875
  package/flutter-pi/Config.in: propagate flutter-engine dependencies
  package/flutter-gallery: add a configure step
  package/flutter-gallery: fix build options
  package/flutter-gallery: clean up install_target_cmds

 package/depot-tools/depot-tools.hash          |  2 +-
 package/depot-tools/depot-tools.mk            |  2 +-
 package/flutter-engine/Config.in              | 10 +++---
 package/flutter-engine/flutter-engine.mk      |  2 +-
 package/flutter-gallery/flutter-gallery.mk    | 24 ++++++++++----
 package/flutter-pi/Config.in                  | 31 +++++++++++++++++--
 package/flutter-pi/flutter-pi.hash            |  2 +-
 package/flutter-pi/flutter-pi.mk              |  2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.hash  |  2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk    |  2 +-
 ...rs-to-the-audio-players-and-keyboar.patch} | 26 ++++++++++++++--
 11 files changed, 81 insertions(+), 24 deletions(-)
 rename package/ivi-homescreen/{0001-add-missing-headers-to-the-audio-players-plugin.patch => 0001-add-missing-headers-to-the-audio-players-and-keyboar.patch} (77%)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
