Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257DDEE3F3F
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 22:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92AEF41B87;
	Tue, 12 Sep 2023 22:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92AEF41B87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XME0qrNiAnwR; Tue, 12 Sep 2023 22:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C6B41B77;
	Tue, 12 Sep 2023 22:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0C6B41B77
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 528591BF831
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35FB341B77
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FB341B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyQcSX9Exqjw for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 22:15:54 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E34041B67
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 22:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E34041B67
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31c4d5bd69cso6377086f8f.3
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 15:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694556951; x=1695161751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FuUdgybIzioJQgU+A3XXy4gixHVTNwGzneO9YO/XveI=;
 b=tDRZNrYVsSeq3LcNgrHoCGvsDdgMinQh1CV7OGl4pXGqQgkbQTSRCBRYtxmc0kh5QU
 6rNXnO0JwJSlZdRnJetqlOVn+vIY4FgF/0l1ak3K8xfcUuDMTiIqrtFcEtxWG6ufv2Rc
 6EET+BJ51x0NKcnz4I4sPbB+gWsNFJQmqoYHnv8CaDQXKVNnnuKE6rtqLhC0RjEI25gi
 jXjgSaP94OQfRoj7kOVnLkb+iE6kShGfoIUqemHPOjd2I5oRZZE5uJT5fx3upXwrvJpc
 QoUwI8wYnFt+RuSGrJUEm7Q0gAc94HbVRaFGL/v/L+4F516at7rcYmdYLmZUAdSS1NHL
 gB1Q==
X-Gm-Message-State: AOJu0Yxfa6LKD3gYwI4kd8d/pYfmMvN6UfxylXsVBoup6UiV2cfd9JeR
 EG04XWA4cKQ2psJhTWN0HFJTjx5+FIk=
X-Google-Smtp-Source: AGHT+IGN8o8l7fz+noVK6yeEnkQ3EadEXzDhQOEN+kIrwZzomjK4NMJhmk44ePRRR++/LpmmFR3u2w==
X-Received: by 2002:a5d:470f:0:b0:31a:d8c0:cb8b with SMTP id
 y15-20020a5d470f000000b0031ad8c0cb8bmr610339wrq.25.1694556951149; 
 Tue, 12 Sep 2023 15:15:51 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:d377:8b3f:c881:5464])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d6983000000b003197c7d08ddsm13819783wru.71.2023.09.12.15.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 15:15:50 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 00:15:49 +0200
Message-Id: <cover.1694556946.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694556951; x=1695161751; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=FuUdgybIzioJQgU+A3XXy4gixHVTNwGzneO9YO/XveI=;
 b=RPkQClGpsXez8qT0a3TsM5+HWEFPnZdA8xmlsbTyALIPpcN6vnhpEQdRQTn69V0diG
 DsWGRu7yU5+TeQdlVOPQ/3ZAAHz4zpSk5KvNW296uiZmVR/+gI2/HkjSCciVdY5VOoGI
 /p6qjBO/GHAHAio6oJ3puIKsATqPoau48gsxQEfaHdsjYbKS+XpOdfuR3CgHqhZ3maz/
 TlkT1ujA3AZmPQfn+UjTONx45wYspebBqEy2PYfTesf3izbJIvc4qxmXO2tqmEB6kz1K
 rg5tRqBijdVp7q2Bq8H3hXtUbWaFuRo5DezwCUaqkf7oLirGGHelmc+opCGSDlyEVzug
 XHQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RPkQClGp
Subject: [Buildroot] [PATCH 0/5] support/downloaf/git: add support for git
 attirbutes (branch yem/git-attributes)
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Woody Douglass <wdouglass@carnegierobotics.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This litle series, after a few fixups and cleanup commits, introduces
support for git attributes to the git download backend.

Git attriibutes are very similar to the decades-old CVS-style keywords
and placeholders; except they are acted on while generating an archive
with git-archive, rather than on checkout.

Some packages (pcm-tools already, luajit soon) use such markers for
versioning information; luajit uses the UNIX timestamp as its semver
patch-level.

While introducing this support, a few fixes were first needed; the git
backend was also cleaned up to pass shellcheck.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (5):
      package/qt5: fix upstream git trees
      support/download: generate even more reproducible tarballs
      support/download/git: properly catch failures
      support/download/git: fix shellcheck errors
      support/download/git: handle git attributes

 .checkpackageignore                                |   1 -
 boot/edk2/edk2.hash                                |   2 +-
 boot/vexpress-firmware/vexpress-firmware.hash      |   2 +-
 package/abootimg/abootimg.hash                     |   2 +-
 package/aer-inject/aer-inject.hash                 |   2 +-
 package/am33x-cm3/am33x-cm3.hash                   |   2 +-
 package/armbian-firmware/armbian-firmware.hash     |   2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash       |   2 +-
 package/bayer2rgb-neon/bayer2rgb-neon.hash         |   2 +-
 package/bpftool/bpftool.hash                       |   2 +-
 package/brickd/brickd.hash                         |   2 +-
 package/c-capnproto/c-capnproto.hash               |   2 +-
 package/dbus-triggerd/dbus-triggerd.hash           |   2 +-
 package/dtv-scan-tables/dtv-scan-tables.hash       |   2 +-
 package/edid-decode/edid-decode.hash               |   2 +-
 package/firmware-utils/firmware-utils.hash         |   2 +-
 package/flashbench/flashbench.hash                 |   2 +-
 package/freescale-imx/imx-lib/imx-lib.hash         |   2 +-
 package/google-breakpad/google-breakpad.hash       |   2 +-
 .../gstreamer1/gst1-interpipe/gst1-interpipe.hash  |   2 +-
 .../gst1-plugins-bayer2rgb-neon.hash               |   2 +-
 package/gstreamer1/gst1-shark/gst1-shark.hash      |   3 +-
 package/ibm-sw-tpm2/ibm-sw-tpm2.hash               |   2 +-
 package/kvmtool/kvmtool.hash                       |   2 +-
 package/libbroadvoice/libbroadvoice.hash           |   2 +-
 package/libcamera/libcamera.hash                   |   2 +-
 package/libdbi-drivers/libdbi-drivers.hash         |   2 +-
 package/libdbi/libdbi.hash                         |   2 +-
 package/libg7221/libg7221.hash                     |   2 +-
 package/libilbc/libilbc.hash                       |   2 +-
 package/libsilk/libsilk.hash                       |   2 +-
 package/libsvgtiny/libsvgtiny.hash                 |   2 +-
 package/libubox/libubox.hash                       |   2 +-
 package/libuci/libuci.hash                         |   2 +-
 package/libyuv/libyuv.hash                         |   2 +-
 .../linux-syscall-support.hash                     |   2 +-
 package/mmc-utils/mmc-utils.hash                   |   3 +-
 .../netsurf-buildsystem/netsurf-buildsystem.hash   |   2 +-
 package/odhcp6c/odhcp6c.hash                       |   2 +-
 package/ogre/ogre.hash                             |   2 +-
 package/open62541/open62541.hash                   |   2 +-
 package/opkg-utils/opkg-utils.hash                 |   2 +-
 package/pcm-tools/pcm-tools.hash                   |   2 +-
 package/pcm-tools/pcm-tools.mk                     |   8 ---
 package/piglit/piglit.hash                         |   2 +-
 package/pkg-download.mk                            |   2 +-
 package/prelink-cross/prelink-cross.hash           |   2 +-
 package/psplash/psplash.hash                       |   2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash       |   2 +-
 package/qt5/qt5coap/qt5coap.hash                   |   2 +-
 package/qt5/qt5coap/qt5coap.mk                     |   2 +-
 package/qt5/qt5knx/qt5knx.hash                     |   2 +-
 package/qt5/qt5knx/qt5knx.mk                       |   2 +-
 package/qt5/qt5location/qt5location.hash           |   2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash                   |   2 +-
 package/qt5/qt5mqtt/qt5mqtt.mk                     |   2 +-
 package/qt5/qt5opcua/qt5opcua.hash                 |   2 +-
 .../qt5webengine-chromium-catapult.hash            |   2 +-
 package/rockchip-rkbin/rockchip-rkbin.hash         |   2 +-
 package/rtc-tools/rtc-tools.hash                   |   2 +-
 package/rtmpdump/rtmpdump.hash                     |   2 +-
 package/signal-estimator/signal-estimator.hash     |   2 +-
 package/sox/sox.hash                               |   2 +-
 package/tftpd/tftpd.hash                           |   2 +-
 package/ti-sgx-demos/ti-sgx-demos.hash             |   2 +-
 package/ti-sgx-km/ti-sgx-km.hash                   |   2 +-
 package/ti-sgx-um/ti-sgx-um.hash                   |   2 +-
 package/tl-expected/tl-expected.hash               |   2 +-
 package/tremor/tremor.hash                         |   2 +-
 package/ubus/ubus.hash                             |   2 +-
 package/uclibc-ng-test/uclibc-ng-test.hash         |   2 +-
 package/uemacs/uemacs.hash                         |   2 +-
 package/uhttpd/uhttpd.hash                         |   2 +-
 package/uqmi/uqmi.hash                             |   2 +-
 package/ustream-ssl/ustream-ssl.hash               |   2 +-
 package/vboot-utils/vboot-utils.hash               |   2 +-
 package/wilink-bt-firmware/wilink-bt-firmware.hash |   2 +-
 .../xdriver_xf86-video-intel.hash                  |   2 +-
 .../xdriver_xf86-video-openchrome.hash             |   2 +-
 package/x264/x264.hash                             |   2 +-
 package/yavta/yavta.hash                           |   2 +-
 support/download/git                               |  72 +++++++++++++++++++--
 support/download/helpers                           |   3 +
 .../br2-external/git-hash/package/bad/bad.hash     |   2 +-
 .../package/export-subst/export-subst.hash         |   1 +
 .../git-hash/package/export-subst/export-subst.mk  |  10 +++
 .../br2-external/git-hash/package/good/good.hash   |   2 +-
 .../git-partial-sha1-branch-head.hash              |   2 +-
 .../git-partial-sha1-reachable-by-branch.hash      |   2 +-
 .../git-partial-sha1-reachable-by-tag.hash         |   2 +-
 .../git-partial-sha1-tag-itself.hash               |   2 +-
 .../git-partial-sha1-tag-points-to.hash            |   2 +-
 .../git-sha1-branch-head/git-sha1-branch-head.hash |   2 +-
 .../git-sha1-reachable-by-branch.hash              |   2 +-
 .../git-sha1-reachable-by-tag.hash                 |   2 +-
 .../git-sha1-tag-itself/git-sha1-tag-itself.hash   |   2 +-
 .../git-sha1-tag-points-to.hash                    |   2 +-
 .../git-submodule-disabled.hash                    |   2 +-
 .../git-submodule-enabled.hash                     |   2 +-
 .../git-refs/package/git-tag/git-tag.hash          |   2 +-
 .../git-wrong-content/git-wrong-content.hash       |   2 +-
 .../05/482df734b3715b849ef4a3147a9b1b1f8cca38      | Bin 0 -> 35 bytes
 .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26      | Bin 0 -> 197 bytes
 .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8      | Bin 0 -> 28 bytes
 .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0      | Bin 0 -> 112 bytes
 .../download/git-remote/repo.git/refs/heads/master |   2 +-
 support/testing/tests/download/test_git.py         |   4 ++
 107 files changed, 182 insertions(+), 111 deletions(-)
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
