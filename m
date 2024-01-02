Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C2AC46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C2A40A66;
	Wed,  3 Jan 2024 00:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C2A40A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XjNJdsaDCp_7; Wed,  3 Jan 2024 00:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABA4E40A5F;
	Wed,  3 Jan 2024 00:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABA4E40A5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3781BF311
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20E58416D8
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20E58416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPl_4sV3L3TS for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:00:04 +0000 (UTC)
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57DE0416CA
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57DE0416CA
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1f055438492so7666596fac.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 16:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704240002; x=1704844802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KfIHQxbFzxKklpWJ8YvgCoPpp8ZOE1XfnbGqydQtzoE=;
 b=VXLd2rFxBfFxxYWaOCHjFeSsOb9MzrfveIrnDW1azVAbmcOi19v19IY/sOeE0W8CJR
 IqW0lFf8Bvd8VtiNHDpSqE1HxLCcUw60zE22H45ZyB4qs2pZES9PmU7Dc5C7i6l8lWgx
 VPN98IBu6szsT2FVYEBdMvowXXkZhzBlzo7xRQx2IHQsXMes40rkvxbK4sJ/Al7dPRwR
 lJ6/C0YuUtny0epPY3HgV+6KhDcNnEaccSVf2l4PtKjXajcuz2QEM5gUxuILsb1+X7Jx
 Qg3Us+aC/fpnAHQ3K2vIoP865T6N91p/GGygy8/qjdBbSY6wwLa0S0JytHPb8YpHi+eD
 iYkg==
X-Gm-Message-State: AOJu0YwM0r8wIt0g7niv8e7JOqpAxgCSeCP6XiEusns8zZhtmBU4zghI
 OOc00WbxMuhSuYl8xs5/CAWaap17QofR8oZnWMmEJolRXVw=
X-Google-Smtp-Source: AGHT+IE4CXRED5P3o1S1d2gkm82L3Os6d3UHXZPVe3DNWzQq5yGVfLI+386z71dxjalSNEi8LSRwNw==
X-Received: by 2002:a05:6870:469f:b0:1fa:e2e4:d8d1 with SMTP id
 a31-20020a056870469f00b001fae2e4d8d1mr21294605oap.52.1704240002354; 
 Tue, 02 Jan 2024 16:00:02 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0028b8499dc80sm181824pjb.39.2024.01.02.16.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 16:00:01 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 16:59:22 -0700
Message-ID: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704240002; x=1704844802;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KfIHQxbFzxKklpWJ8YvgCoPpp8ZOE1XfnbGqydQtzoE=;
 b=YYt7oPzPRQiBibmPKfnWLQNuNBNjQRRkynYz/w7NDeXAPpQIKZaI70sGbjAdJBErz7
 +Z0N/1XaMFeaaBC5Inq8jtCXjD1rnFcB/mlaBaKhWm1ddHowo5jyGRVnNG/g19Rdp5pE
 YhEeTmxcAtmn2HE42Qm35cYQ325TQUybr2ndk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YYt7oPzP
Subject: [Buildroot] [PATCH v3 00/11] flutter package improvements
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

Hello;

Included in this patch series are several packages that improve the current
set of flutter packages available to users.

This is the third set for this patch series that includes the following
changes:

  - I rewrote the commit messages for every patch to be far more comprehensive.
    These commit messages have also been ran through grammarly to ensure that
    there are no typos or glaring gramatical errors.

  - I have dropped the "package/xdg-user-dirs: new package" and
    "package/flutter-gallery: depend on xdg-user-dirs and fix build options"
    commits, as xdg-user-dirs is not needed by Amarula nor was I asked to
    port it. This means that flutter-gallery will still need the
    0001-remove-GetStorage.patch to function.

  - Updated flutter from 3.16.4 to 3.16.5

These packages have been tested on a x86_64 host with an AMD Ryzen 9 6900HS
with Docker 24.0.5:
  - The following distributions:
    - Fedora 39: Host system
    - Ubuntu 22.04: Docker
    - Debian 11: Docker

  - The following targets:
    - BR2_aarch64
    - BR2_arm
    - BR2_x86_64

Also, these packages have tested with the following testing command:

./support/testing/run-tests \
  -d ./dl \
  -o ./output \
  -k \
  tests.package.test_flutter.TestFlutter

I hope that the quality of these patches are to the maintainers satisfaction.
If there are any problems, please feel free to email me directly and I will
respond back as soon as possible.

Adam Duskett

Adam Duskett (11):
  package/Config.in: move flutter-pi
  package/Config.in: move flutter-gallery menu entry
  package/flutter-sdk-bin: bump version to 3.16.5
  package/flutter-engine: bump version to 3.16.5
  package/flutter-pi: bump version to
    f34d7bdbda713ba607b9625541ddfa314d9999a0
  package/flutter-pi: add the charset converter plugin as a menuconfig
    option
  package/flutter-engine: Add profile runtime mode selection
  package/flutter-sdk-bin: add dart arguments for different runtime
    modes
  package/flutter-gallery: add a configure step
  package/flutter-gallery: clean up install_target_cmds
  package/flutter-sdk-bin/Config.in.host: add pub-cache location option

 package/Config.in                             |  4 +-
 package/flutter-engine/Config.in              | 25 ++++++++
 package/flutter-engine/flutter-engine.mk      |  6 +-
 package/flutter-gallery/flutter-gallery.mk    | 17 ++++--
 ...er_surface-properly-fallback-to-surf.patch | 59 -------------------
 package/flutter-pi/Config.in                  |  7 +++
 package/flutter-pi/flutter-pi.hash            |  2 +-
 package/flutter-pi/flutter-pi.mk              |  8 ++-
 package/flutter-sdk-bin/Config.in.host        | 11 ++++
 package/flutter-sdk-bin/flutter-sdk-bin.hash  |  2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk    | 25 +++++---
 11 files changed, 87 insertions(+), 79 deletions(-)
 delete mode 100644 package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
