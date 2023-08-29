Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1633C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CDF860F8D;
	Tue, 29 Aug 2023 21:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CDF860F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSeB0T6hbx7f; Tue, 29 Aug 2023 21:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE5B60F2E;
	Tue, 29 Aug 2023 21:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AE5B60F2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA35F1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B39EF60F2E
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B39EF60F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDPAl0O-1hni for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:37:30 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9D6B60ECD
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9D6B60ECD
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bdbf10333bso38489845ad.1
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 14:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693345050; x=1693949850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iezg17H6zJgbfnCl+s7qDe5XOUHl9HXveMS+eZca2/g=;
 b=gfgFBkb06Zq6vzjE7itSMUYrC8id5hmqmlHK+/1a6sJLdHksKy7AtgkdPLJ9v9ugyi
 Ihjm/vtKZ58B84F17Fi/5zGXi/tgy6GaqEHL5z3ZpGKrfxLaWUjPAf/NT3YCPxwUmORh
 NrC9Mj6uQMFPo/ghnmtkwhB5CB2nSWY7mMRUsRH6284uaL3LNnGTP41ERJbZmvSFxINl
 lnU1yH+pxJC/xMDTcE44N+oADyApHJB7FmfiP8A9hKr9iH74jNhv7h2IK3NSya9V+1Mf
 dXDTqJZO2dc/SBUGo82fU+6lyUpR7avQiflge0MSFlrPvyWwMHXMowRLz9hlhgTqdcOM
 au0A==
X-Gm-Message-State: AOJu0YzbX1g1mCNKTg4lFCM+CIbsTiuSFrEguXDNQsMi+K6B/MCuKmN8
 7hC2ELLa7m2M/Tkmqyw9IIW/gbZW48Rq9+KodMA=
X-Google-Smtp-Source: AGHT+IHVdQIASFaQdxWRJwaBi8QFf7CDkwvZPruDeXSThXgo/DNI6oXlPCDiI2dYsG0U7d0fNrIsSg==
X-Received: by 2002:a17:902:ce8f:b0:1b8:aee8:a21c with SMTP id
 f15-20020a170902ce8f00b001b8aee8a21cmr462516plg.31.1693345049749; 
 Tue, 29 Aug 2023 14:37:29 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902a70500b001ae0152d280sm9691516plq.193.2023.08.29.14.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:37:29 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:37:19 -0600
Message-ID: <20230829213726.1957587-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693345050; x=1693949850;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iezg17H6zJgbfnCl+s7qDe5XOUHl9HXveMS+eZca2/g=;
 b=Nue5tpA2h6+FygV4+mVPqmlDKIW6ljUqeulyuojV6az2gWG0gWnG5Riy1GGfkrXC98
 4E2Hnfoitm2k1RtPIDHY0RMX2Mqu9KefC7dIuksiMKIn8V11zGelCt3f7oIn6UKdsQMj
 bzkx174eNkvUJ8JTuItSM70+6/K8Ma4sCgfhM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Nue5tpA2
Subject: [Buildroot] [PATCH v7 0/7] flutter: new package series.
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 7 changelog:

flutter-engine:
  - Update from 3.10.6 to 3.13.1
  - Remove "custom_deps" line from the dot-gclient file. It's uneeded and
    causes compilation errors with 3.13.1
  - Drop $(FLUTTER_ENGINE_VERSION) from the icudtl.dat location as it is not
    necessary and increases complexity.

host-flutter-sdk-bin:
  - Update from 3.10.6 to 3.13.1

flutter-gallery:
  - Drop $(FLUTTER_ENGINE_VERSION) from symlinks.

flutter-pi:
  - Update from 004efdaa to 11c4fdc9
  - Change to a menuconfig package. There are a lot of plugins and options.
  - Add the following plugins:
    - gstreamer audio
    - gstreamer video
    - raw keyboard
    - test
    - text input
  - Add missing dependencies
  - Fill in all config options
  - Explicitly disable vulkan support, as we do not have vulkan-loader.
  - Add session_switching support if seatd is selected.

Adam Duskett (7):
  package/python-httplib2: add host variant
  package/depot-tools: new package
  package/flutter-sdk-bin: new package
  package/flutter-engine: new package
  package/flutter-pi: new package
  package/flutter-gallery: new package
  support/testing/tests/package/test_flutter.py: new runtime test

 DEVELOPERS                                    |   8 +
 package/Config.in                             |   3 +
 package/Config.in.host                        |   2 +
 package/depot-tools/Config.in.host            |  10 +
 package/depot-tools/depot-tools.hash          |   3 +
 package/depot-tools/depot-tools.mk            |  25 ++
 .../0001-disable-pre-canned-sysroot.patch     |  32 +++
 .../0002-remove-explicit-x11-dependency.patch |  33 +++
 .../0003-fix-toolchain-paths.patch            |  40 +++
 ...onfig.py-do-not-prepend-sysroot-path.patch |  37 +++
 package/flutter-engine/Config.in              |  55 ++++
 package/flutter-engine/dot-gclient            |  12 +
 package/flutter-engine/flutter-engine.mk      | 234 ++++++++++++++++++
 package/flutter-engine/gen-tarball            | 111 +++++++++
 .../0001-remove-GetStorage.patch              |  84 +++++++
 package/flutter-gallery/Config.in             |  16 ++
 package/flutter-gallery/flutter-gallery.hash  |   3 +
 package/flutter-gallery/flutter-gallery.mk    |  44 ++++
 package/flutter-pi/Config.in                  |  84 +++++++
 package/flutter-pi/flutter-pi.hash            |   3 +
 package/flutter-pi/flutter-pi.mk              |  85 +++++++
 package/flutter-sdk-bin/Config.in.host        |  16 ++
 package/flutter-sdk-bin/flutter-sdk-bin.hash  |   3 +
 package/flutter-sdk-bin/flutter-sdk-bin.mk    |  95 +++++++
 package/python-httplib2/python-httplib2.mk    |   1 +
 support/testing/tests/package/test_flutter.py |  56 +++++
 .../package/test_flutter/linux-vkms.fragment  |   2 +
 .../flutter-gallery.service                   |   1 +
 .../systemd/system/flutter-gallery.service    |  11 +
 29 files changed, 1109 insertions(+)
 create mode 100644 package/depot-tools/Config.in.host
 create mode 100644 package/depot-tools/depot-tools.hash
 create mode 100644 package/depot-tools/depot-tools.mk
 create mode 100644 package/flutter-engine/0001-disable-pre-canned-sysroot.patch
 create mode 100644 package/flutter-engine/0002-remove-explicit-x11-dependency.patch
 create mode 100644 package/flutter-engine/0003-fix-toolchain-paths.patch
 create mode 100644 package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
 create mode 100644 package/flutter-engine/Config.in
 create mode 100644 package/flutter-engine/dot-gclient
 create mode 100644 package/flutter-engine/flutter-engine.mk
 create mode 100755 package/flutter-engine/gen-tarball
 create mode 100644 package/flutter-gallery/0001-remove-GetStorage.patch
 create mode 100644 package/flutter-gallery/Config.in
 create mode 100644 package/flutter-gallery/flutter-gallery.hash
 create mode 100644 package/flutter-gallery/flutter-gallery.mk
 create mode 100644 package/flutter-pi/Config.in
 create mode 100644 package/flutter-pi/flutter-pi.hash
 create mode 100644 package/flutter-pi/flutter-pi.mk
 create mode 100644 package/flutter-sdk-bin/Config.in.host
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.hash
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.mk
 create mode 100644 support/testing/tests/package/test_flutter.py
 create mode 100644 support/testing/tests/package/test_flutter/linux-vkms.fragment
 create mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
 create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
