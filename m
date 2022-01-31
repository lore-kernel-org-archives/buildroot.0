Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBBDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 23:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF37441513;
	Mon, 31 Jan 2022 23:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28cm9KlzF27B; Mon, 31 Jan 2022 23:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43C0B4150F;
	Mon, 31 Jan 2022 23:07:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E05DF1BF363
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF24C40290
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oa-1B6s-1Jdj for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 23:07:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95BDD41519
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 23:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643670451;
 bh=zXCByt+fUYbD1uZ0mF/pTIgMqiHw8MCbhzTyMnis/XU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=kIHGSto3YlCcrHGRZI4UhX0KFldhMfG++Xy8cYY2GfKw4bCXvPaeI/b1bZqGYKnQB
 Oxs2/gv4bByx0LgZIRsynBva6SOYygsG8nmIawTYw1BzyKGxRAGwUuCnzpx9/BXxPw
 1VtNQYWLiDyKrePyVy4z8o7/78f27v1dJTCIc22M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.249]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MOzOm-1mrWDG3H4u-00POcT; Tue, 01 Feb 2022 00:07:30 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 00:07:30 +0100
Message-Id: <20220131230730.22235-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:LhGzxJ+eG4JoaeEGvQdZQXuLFYkMozNPmYqeAEQsEJz1aikOf8I
 njcCHnOOkXFKYtWPGgrQrajr4c60U10y2xMETFBRS3Bocswi2qCLSmlHrW0wUtKyqxej+5j
 huPLI3C08Cc+n/VM9l25S/zfU9PNPA58NsYby7+3+XCmab2q+6YoLw3YA9uS0VY/+HtN2S3
 9A/Mr4ehdoydEdrmC0UtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ffyYqmgsZKI=:OlISAx2Fd2TLNc0BoHUo5m
 ACGv2rsmvUyiQYPF214dYAc5XyIAx4c7srFouTirPieOa7r8sOeGqQnvxgg0PItfsgIN7VIY0
 pEBVnVpckoYC8+rlfHoca9xhiqJIcOw1V3Oik/41uY3fqmqX2+JHz9dzFqHrGGPk2NucdYOXg
 SDTCxJ3y5iq1Lh2gNkl2inO+Ki1XhfVR+E+YFOgrAoG5YAxLQJgGGw2AzUkKgxc70SGJPhtxs
 3QncRYvAEFNOkRqWLCL0yh18qFRwvW0CdF20eoirtu0BFIqwRRdToPql6nNUDZ+OBaVOgsInt
 +9joTPLmkdy8x3tPWUr9hc8TvNxT6c7DQ4ia92CIWBudv5Gr2kZxFGGBiwRuqLsYLAbuM52px
 6U4yJGPxfSM2hST3wF21qUQOU9SGE/m6EySaXiS9A5Lze/MEmPL1hnWyEbA/hJZisyzlRKHHn
 BuoM23DNPquOjkw+LiQ5QO82YjsrbzLkPH8ksgPe6WfWqfUWomsuVDYHqXAjo9n0G0Hqk3hqS
 oPJE+rDIo40L12Ab+RPf8Wpt6Jr5i7zGiDpUDLYcAwO53po/0WcSB/K+QwwjzJ9zgxSo15+Ql
 Ty/t7S1RnugRKab+5WncZLhR5ZkeVOhpjO2CxAs9+29p1fJeiJEl4516/Ni9ghxzAB5Oddrow
 Q9bToFJDgXal2Lh7RejKjzMpEmkYPH/3gopLxIn5n1YCIqGqo3KcPb1xrtktQOKkjQX5W6zw4
 m8iSzqbIAHqlZ6MpB8XsCpFEBz6IRrk1vkrETYlSPSsgp1Ypkx3wT6OgSaBef7+Cvh6j4gCq5
 HjCOmA0iwVqYTwW5thyNxBmNzhRls9JaSox0+SDOjlL3dg4vUwsg91ghfgA7SkXFBL4P8TluQ
 unVWB+IKvpA8N7XKbzIRkglogTLzoy01P65lAwJ6YU47+Uxq8/MfdsB9A9Xbslxsyj15gr6Nh
 rcOzuhuVA59SqzaiBY6Zw5o9+FMndF+Fc3Uaqa7z28p9NJQ0oZt7r3anR3/18U37GZ+0lzRjS
 fNCxEGPvAv/QS7ABgASySc9x1obnYDSOe67qJ2KT9Yynl0yYlFlc37gazUb3dVrooSezHS7/B
 KqGw2h2ViWl3aw=
Subject: [Buildroot] [PATCH v1] package/libcamera: fix uclibc/musl compile
 with libexecinfo enabled
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- depend and link against libexecinfo if enabled to fix linking failure
  in case execinfo.h is detected, see
  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8/meson.build:

   32 if cc.has_header_symbol('execinfo.h', 'backtrace')
   33     config_h.set('HAVE_BACKTRACE', 1)
   34 endif

- libexecinfo already depends on !BR2_TOOLCHAIN_USES_GLIBC

Fixes:

  - http://autobuild.buildroot.net/results/a1077815895ab847c5ca82ec17c7d13fe97cff53

  .../powerpc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/log.cpp.o: in function `libcamera::Logger::backtrace()':
  log.cpp:(.text+0x34b0): undefined reference to `backtrace'
  .../powerpc-buildroot-linux-uclibc/bin/ld: log.cpp:(.text+0x34c0): undefined reference to `backtrace_symbols'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/libcamera.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 524cf07e03..9be45d248a 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -99,4 +99,9 @@ else
 LIBCAMERA_CONF_OPTS += -Dtracing=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+LIBCAMERA_DEPENDENCIES += libexecinfo
+LIBCAMERA_LDFLAGS += -lexecinfo
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
