Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA49C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 085FB610CE
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 085FB610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D003F402BC;
	Tue, 14 Sep 2021 21:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DSzJU0o1FiL; Tue, 14 Sep 2021 21:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 347334026E;
	Tue, 14 Sep 2021 21:04:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D12EC1BF3DD
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDCA04026E
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1w1s5T4BoLP for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 21:04:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B1454026C
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631653464;
 bh=KuQD9KZFlMVn7Jj6PrroP/svN/gwfO9RLkxX4dGor88=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=K0JjiXTuRP4Ledz+WbE6rFogYohhmynm48rk+/Ncy94jjs65ud3kdwqZPSoDBqybz
 SpjsrrRmMeu0rdnZgkCtbfM+08P+4ENv7zoijH2igesSxe6Jv9atnD78yzK9SU8lay
 0o+mThKFDtCM7E0MhgsIbMxA/7xvKgsUp1BqLHKU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N1wpt-1mso7700ev-012FAY; Tue, 14 Sep 2021 23:04:24 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 23:04:23 +0200
Message-Id: <20210914210423.29792-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+wYHECsR4m4gYlfwyavtZi0u3iMpb0NWXacHX6GcwT1QzJyKn3V
 3kuQqx5Gwmi68f3o9KLD8i8Qchyge4fGuPhxufON54k1m+jOicInMEtjBHzYzBrg5fLnyLu
 Roz01sbvL71KYa07d5rwJ8M1tLp75e5zTL0//4Q4xFm7EFHuwdbVk1V++0fP2bDVXL5BPnr
 pHMg08I2UH2HJ1sVYfCWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JworW4HU7IY=:QMDFOVy3yfiULpOKj3yhWU
 eLKJYPgVOwsVwFUUAWn8M/4Tq+TwxF5tMqYxQezsL843AJmd/nUXvScRK/JD3Q/W28Wx8YTik
 gGIUszFFQpuB2PCfLtLALeqPqH/XEXXmZZGkmOpytSVB7E7AU41OUJedk/jlgURQEgzel2ExQ
 I79lxnnR1WZeHzXTI6cGQSN6LAWfalyPMOQ8lqj4wI3OxUFnzL94Anf4hAy5olidgqc5q5G3v
 6DuWjkGrWkBlGGqSyz8PAZXIhfRKP5JcCKSU/a9Ze6yDdU+ViIbKU2VozUx4Xss0/96c1hwR2
 7fTLJt5CpOhR+uEJZmFsvJIEljp3AzGvJ3onBMsopbt8SijGREKCbdwrB4AxdWjFITXww2Y/g
 UF9PUO3Ab5/9Bf0LYtEJ2Td6JmFtjZZ72qGrCWOYYBb84aOAOqQbw8D4RTXkBV4uPrbwAD+7b
 rS0rmTe5AbP1qmXMFyODcgXDht4dWLxiDmHcDgLwR5EWUo2Na8agijR4kkGFszI9dbVikiIs0
 lLkJHaSxJhsKLlQNaugrW2wodcekpRtY9L9Ri5iY8PP/7eVmUQDnj7BpHoTrNmtS7JGt2Fhis
 rRtPvMYybkP+wxC6Jyv9XfgjEYBVjLAZ2QOT9GjlDGdpRtGCcUEWUNSRXoZtLzA7MPxYWhGFd
 Qr750KiTw+y3V/iR98E5S+Mw2/hGzXJLfEsfc1yFqojqa4t5a6zd6o45KQufJdegtsGbkVL1P
 bXGDk2vIyW82XDCcGRoyLzZRMxK7Jv4iuFUVFvTu8YInqUF9f3dPV7gboev/xRAUFooqLdnTh
 kQ34GpikVxeSFBc4RsaqxlhQgHyj2nQCejpwgep5IMYPCg0k5i2fcW1Y+xIHXbAFALBS8rOWF
 wmm3K1fETFWVa1ODITpEhu6ykWQ0dMvUHHSDpRe3+zcUlTj3a3T1YCyocU3w5FZZivG2LpnyC
 dSfl0cmK+j83bjSHBYY95bs4Ou0JZH7hC1hEbNOXAwBvlyz7s60h7VualKkcjvSU+nxWUGwCs
 /rjklW8J9bygbuWfq9UO4MLLM5Eya7DXpF278GE5GkYEFrM9+sNAEBTV8pMojwzpywoG8DXo5
 jdKbXP+Dclqaf4=
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.19.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- add new optional wayland, wayland-protocoll and libx11 dependencies
  in case the debug gui is enabled (libgtk3 available)

For details see [1], [2].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041971.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041977.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash |  6 +++---
 package/libinput/libinput.mk   | 11 ++++++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 8b6a5466ed..7d57ae9b2d 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-August/041934.html
-sha256  9ca14021fbc2523bc0610582c51f368321592040b6ca63becc2fa1ea11f1a7cb  libinput-1.18.1.tar.xz
-sha512  450e38c0f8245aa0165a8047d25aebee646332f0f2ed442bb2d1bd3e723c2082b6d00d6e3bda308981ece8e29b5cddbd56eab900d2b7497705a45fc27b281828  libinput-1.18.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041977.html
+sha256  3d3a2f12b4a65cd82684121ae4b33cdc3ad541c761a55e8eb73a8e5e443cccbb  libinput-1.19.0.tar.xz
+sha512  daf42ce797f2b5aef8d6f7a5c0d967590581e6ac12c26fa6bde5fbc619d75319e39ca55d65d5347e554dd6a48b91f5fed4d3167eabef8ad1ebc43bc0c3e8e220  libinput-1.19.0.tar.xz
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 844a4ae8ba..3ab1a2c38f 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.18.1
+LIBINPUT_VERSION = 1.19.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
@@ -17,6 +17,15 @@ LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += -Ddebug-gui=true
 LIBINPUT_DEPENDENCIES += libgtk3
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBINPUT_DEPENDENCIES += wayland
+endif
+ifeq ($(BR2_PACKAGE_WAYLAND_PROTOCOLS),y)
+LIBINPUT_DEPENDENCIES += wayland-protocols
+endif
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+LIBINPUT_DEPENDENCIES += libx11
+endif
 else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
