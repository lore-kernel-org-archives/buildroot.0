Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1477C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 15:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A92C60A9B;
	Fri, 10 Nov 2023 15:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A92C60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRN54JwT1XXJ; Fri, 10 Nov 2023 15:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE38B60B99;
	Fri, 10 Nov 2023 15:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE38B60B99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFAB11BF37B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87F6A42241
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F6A42241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxpMpiSPMSF1 for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 15:58:31 +0000 (UTC)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83A9D42038
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 15:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83A9D42038
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-6b709048f32so2006305b3a.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 07:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699631910; x=1700236710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZLyzpwhgRTtsGqZlXgtWuOSWUmesBXQ1wkl0Mzk9DGE=;
 b=SFlj9bT/sVGV3iNaPIVhFJiwk0VhbKlhrKHxcUckp7RMwSAaHhZkpW5Do1q+0pgDL2
 GAbJOYpt/32neDxH+VCZjis72HIJZqHdjQj9ZVPVi9Aq216LzQlFOa3qPZaT26Yl4OIW
 kvZVv1ScTPgSTWZJ8hG7Eyet0VTbNbmCWrk3gMjRVp+iZvlsdi2MKmeSddrQduaEijpX
 7m6IyusSWi2GSMFDoY6QdPBHpLJnBCZzd6XKtrOU712ykg4I7+UFXsMWsAtKB9AbgNS1
 MXeGRm3AR6Tz5XpmaxU2CE0/hYFyCfnYt46tI2wM7hyapgmketrdUBqWxm3cH447zDu0
 lkVg==
X-Gm-Message-State: AOJu0YwoXRqhfllBftgQBjHrFePkNByMIz5nkqN5AQYYOcHtsoS+aRAU
 SsZbdMVe037TrQxu9SxiQzJH0E9AamNqwRvge+RfsVkD7rM=
X-Google-Smtp-Source: AGHT+IGzeoPCFBIqJ5FRnHSfvZEw0WmKnIKGq6zJW7hVD7RA11Wg5I8YvjZ97uD5jeEdSnHf1ptvQw==
X-Received: by 2002:a05:6a00:1707:b0:68e:2d59:b1f3 with SMTP id
 h7-20020a056a00170700b0068e2d59b1f3mr8732824pfc.13.1699631910318; 
 Fri, 10 Nov 2023 07:58:30 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p55-20020a056a0026f700b006c2d53e0b5fsm12796153pfw.57.2023.11.10.07.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 07:58:29 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 08:58:19 -0700
Message-ID: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699631910; x=1700236710;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLyzpwhgRTtsGqZlXgtWuOSWUmesBXQ1wkl0Mzk9DGE=;
 b=bzovzOXsqrpwvypO3PP4o3S/WpPjZR6NuIo1/1I+/E2zStuXEpt5Uga08XK4u0NA9x
 rZDDWCRqC78veJzz1exRmZBA6z4He6aO9uUCD7KWuzhGsPWFQ4XMa0IdZptJRcvWFhVV
 4mfA96CsukF6YlZMfnJ0rQu6gJqZIdSdLXIxc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bzovzOXs
Subject: [Buildroot] [PATCH v3 0/7] Python3: bump version to 3.12.0
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

Hopefully the last series to commit!

Changes:

  - Drop python-pygame with a new message about compilation failures.
  - Squash Bernd's patch series into the python 3.12.0 version bump patch
  - Add "package" at the end of the Config.in.legacy python-crossbar help
  - Add a Config.in.legacy option for python-pygame

Adam Duskett (7):
  package/python-systemd: bump version to 235
  package/python-versioneer: new package
  package/python-constantly: bump version to 23.10.4
  package/python-pygame: drop package
  package/python-crossbar: drop package
  package/scons: bump version to 4.5.2
  package/python3: bump version to 3.12.0

 Config.in.legacy                              |  23 ++++
 DEVELOPERS                                    |   3 +-
 package/Config.in                             |   2 -
 .../python-constantly/python-constantly.hash  |   4 +-
 .../python-constantly/python-constantly.mk    |   5 +-
 .../0001-Avoid-intentional-syntax-error.patch |  29 -----
 ...s-min.txt-drop-indirect-dependencies.patch |  74 ------------
 ...ice-wap-use-markupsafe-instead-of-we.patch |  53 ---------
 package/python-crossbar/Config.in             |  71 -----------
 package/python-crossbar/python-crossbar.hash  |   5 -
 package/python-crossbar/python-crossbar.mk    |  14 ---
 package/python-pygame/Config.in               |  50 --------
 package/python-pygame/python-pygame.hash      |   3 -
 package/python-pygame/python-pygame.mk        | 111 ------------------
 package/python-systemd/python-systemd.hash    |   4 +-
 package/python-systemd/python-systemd.mk      |   6 +-
 .../python-versioneer/python-versioneer.hash  |   5 +
 .../python-versioneer/python-versioneer.mk    |  14 +++
 ...e-the-build-of-pyc-files-conditional.patch |  24 ++--
 ...taddrinfo-configure-test-when-cross-.patch |   2 +-
 ...re-to-disable-the-build-of-certain-e.patch | 108 -----------------
 ...-header-paths-for-cross-compilation.patch} |  31 ++---
 ...tch => 0004-Serial-ioctl-workaround.patch} |   0
 ...ook-in-usr-lib-termcap-for-libraries.patch |  31 -----
 ...g.sh.in-ensure-sed-invocations-only.patch} |   0
 ...0006-Add-an-option-to-disable-pydoc.patch} |  50 ++------
 .../0006-Don-t-add-multiarch-paths.patch      |  37 ------
 .../0007-Abort-on-failed-module-build.patch   |  30 -----
 ...07-Add-an-option-to-disable-lib2to3.patch} |  74 +++++-------
 ... 0008-Add-an-option-to-disable-IDLE.patch} |  43 ++-----
 ...e-shebang-of-Python-scripts-for-cros.patch |  35 ------
 ...hon-config.sh-don-t-reassign-prefix.patch} |   0
 ...d-an-option-to-disable-the-tk-module.patch |  79 +++++++++++++
 ...fix-building-on-older-distributions.patch} |  12 +-
 ...p-CC-print-multiarch-output-for-mus.patch} |   2 +-
 ...option-to-disable-the-sqlite3-module.patch |  62 ----------
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 ...d-an-option-to-disable-the-tk-module.patch |  77 ------------
 ...-option-to-disable-the-curses-module.patch |  61 ----------
 .../0016-Add-an-option-to-disable-expat.patch |  82 -------------
 ...-Add-an-option-to-disable-CJK-codecs.patch |  30 -----
 .../0018-Add-an-option-to-disable-NIS.patch   |  33 ------
 ...Add-an-option-to-disable-unicodedata.patch |  30 -----
 ...021-Add-an-option-to-disable-decimal.patch |  54 ---------
 ...on-to-disable-the-ossaudiodev-module.patch |  30 -----
 ...an-option-to-disable-openssl-support.patch |  30 -----
 ...ption-to-disable-the-readline-module.patch |  30 -----
 ...to-disable-zlib-bzip2-and-xz-modules.patch |  42 -------
 ...Add-an-option-to-disable-uuid-module.patch |  33 ------
 ...ion-to-disable-the-berkeleydb-module.patch |  30 -----
 package/python3/python3.hash                  |   6 +-
 package/python3/python3.mk                    |  81 ++++++++-----
 package/scons/scons.hash                      |   4 +-
 package/scons/scons.mk                        |   9 +-
 54 files changed, 274 insertions(+), 1484 deletions(-)
 delete mode 100644 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
 delete mode 100644 package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
 delete mode 100644 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
 delete mode 100644 package/python-crossbar/Config.in
 delete mode 100644 package/python-crossbar/python-crossbar.hash
 delete mode 100644 package/python-crossbar/python-crossbar.mk
 delete mode 100644 package/python-pygame/Config.in
 delete mode 100644 package/python-pygame/python-pygame.hash
 delete mode 100644 package/python-pygame/python-pygame.mk
 create mode 100644 package/python-versioneer/python-versioneer.hash
 create mode 100644 package/python-versioneer/python-versioneer.mk
 delete mode 100644 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
 rename package/python3/{0004-Adjust-library-header-paths-for-cross-compilation.patch => 0003-Adjust-library-header-paths-for-cross-compilation.patch} (64%)
 rename package/python3/{0008-Serial-ioctl-workaround.patch => 0004-Serial-ioctl-workaround.patch} (100%)
 delete mode 100644 package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
 rename package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (100%)
 rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch => 0006-Add-an-option-to-disable-pydoc.patch} (54%)
 delete mode 100644 package/python3/0006-Don-t-add-multiarch-paths.patch
 delete mode 100644 package/python3/0007-Abort-on-failed-module-build.patch
 rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch => 0007-Add-an-option-to-disable-lib2to3.patch} (59%)
 rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch => 0008-Add-an-option-to-disable-IDLE.patch} (57%)
 delete mode 100644 package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.patch => 0009-python-config.sh-don-t-reassign-prefix.patch} (100%)
 create mode 100644 package/python3/0010-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0028-fix-building-on-older-distributions.patch => 0011-fix-building-on-older-distributions.patch} (82%)
 rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0012-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (97%)
 delete mode 100644 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
 rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0013-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 delete mode 100644 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
 delete mode 100644 package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
 delete mode 100644 package/python3/0016-Add-an-option-to-disable-expat.patch
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
 delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.patch
 delete mode 100644 package/python3/0019-Add-an-option-to-disable-unicodedata.patch
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-decimal.patch
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
 delete mode 100644 package/python3/0023-Add-an-option-to-disable-openssl-support.patch
 delete mode 100644 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
 delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
 delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid-module.patch
 delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
