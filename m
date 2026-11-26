Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4A606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AJjJcS4W
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7896860B34;
	Thu, 26 Nov 2026 19:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFn1dHZlm6_h; Thu, 26 Nov 2026 19:25:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B7B160AD4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721113;
	b=eyKjTA8soIGToVH0jSVbRyA2dtl8H4Ng4X4DKrpAFK9eUJYs01zI31TAnuvnUKxSMP+T
	 Ef//nyBAhXS1nRJa1ZLPJ68Js18ATYiXLnrEln4QTLnb0cyN4Opyia32mmF3hM/4aLgHj
	 vRAdesnNQpdsZlcUdqnE98/ke+Ro2y7psPWRKbslg86/UR61CIvHziU4GEXKYLq7WoyS5
	 fj92G8H0mJYNFhKudQx6Fg9923BCRVGI0uUiDvHxsMrxUEQ+ohMefvi5V8TMiaezU7JWm
	 Rc8WiXwAFcXpl1B534wSEAzfQBsSLv6MvNVO/02Qc9k0UMvSJ9xKMy3dbcVkfDv98YA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8JG3S0gtBT4SC2xmjbnncFPKDd4Fhrjt8l1sWzhI97o=;
	b=S3i7rH6KklhxF/biIryrGuyGd/cpuSu4wqf41jakx7rnyIn+FTX+Nt9f5ZII2BDDapSV
	 I8IXzirPvVchFIWggc6O5Yjurx8Id49Tq0QNEtILWX/OHPUk07YEg3SJh71hDAg8g5FcL
	 6ZgIDeScjt4HrVJDGSkfLl8wXJA8V3pdSUYc3bSE5pLhSN4TKhdVd1FBgPf++aS/pxrbk
	 UHANSKs9j/RCt1I7UY9Idi+y+/cTfmzC1iPbMw/jz6oxKGikhAwOfJxSTG0Yico5A+Hx1
	 ckcAESY9iQt4dPPiXLBTy89fIoI3FhT/CeJ/awV+dAgZe49NwI6GSeFfi8cF51qtE/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721113;
	bh=8JG3S0gtBT4SC2xmjbnncFPKDd4Fhrjt8l1sWzhI97o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AJjJcS4W9TdoRjEubLhAPz6btBgropZ2tmpiHTY0ONFhUhPrFlwSD8pZtM5Swkl+V
	 +Z+eZgegNNlh2mf8iA6jMutpoaJeZjte/xdlQFTFNvd7YvJPJB2FuoP0jgNhnSsb1p
	 oTU0K/S5Q6L3RJmDoAXne3+dZXXbsIB3FV8qLdE5cA+JWhRBASMXPTG23Z/WB42F9l
	 DyzhRjRmKyfyhbEwbw4xAHrTKMlPGVKJhyC3V116HK2Za9kvkY7M5zuqr902Pt1h/D
	 HLNLfKMe5Uc+o0xZ9rcpdwDtG6N+hW96nzS+EEoEAU8XRzVwOLXT/KklyORYVsKC0M
	 3qjo/CJEt8sGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B7B160AD4;
	Thu, 26 Nov 2026 19:25:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9D9222B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B06C040549
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxweYa58-ydW for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 26F87400E6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26F87400E6
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:06 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721105; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:KfUnbMZuhURn2/I9LNJmSTHtAXjW
 okIaV71Cu091ODqlSoqKfaGKNy+4/pVZ9ZaFMWKaVTU7z7QfLAuSVXfv9C6uwozMJtymtEWB9Ys
 fU+d1e+cfok7RfRznXWC3Q61flWoG4SKvf6UwsfmJYqpbrA7XHmPsoj8xyPugD5KdgglmuUXsCr
 GT/0wibqis7Z/pKD8rVAQJHUEk0KW7m8t8cgS5bRmiBC+os6IQiupEalN0iV8oeNvhhwZOEyBhf
 AaVD7enHt628cRIDec0U771Rkt9RH/ecmfthlHfAVnnAMBAjKj8FJjIZynH1I5LkmeYPrJVq0Li
 cDi4Nt7vCK2/Ig==;
Message-Instance: m=1; h=sha256: ln4LjCK1IY5QLEHR0JDPdTJOcjyXEPeOpJrC7ziYrTA=:
 AxRQcpRSGI+TPzQzGgWi0tWSHa8kt1/cz12K4+R+XLw=, sha512:
 GFJEMtIgYBcAVOASN9IMQgeYdZzdsYsZz3hxhh7s1+N+yae0h4GpJ6ZDjBFdQ0Acj7REMuKSC8Cpyj6Yp/VHdw==:
 9hbqbEKmzeI14JYVn5f4Z+zIsCzruDlThwyBFnts/hJZ0TyqX0uiZhhL8rctayg1LqH8SkSl561BY7/NWjhTlA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wPh-1xZi1u2YqB-00CF6x; Thu, 26
 Nov 2026 20:24:53 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:25 +0100
Message-ID: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:AvNu48T1oyGUVVQ/nkjwsgyQasyZh/qGjHJudbFSqrT6JbMxa9s
 rypqEKJlt9ZrnDnguJd9S8qyXDhgAPFI+fmzvnblhVgPPX+m6Cyf6+Nkkh78AXai5qkK3mM
 vU77+JVxRo5ObdyZYWL0X8q/dfKkO7vFwOlcfUofGxdjlJeN12hSlo7B319NBgSAEQqSd2e
 EVXgXmActgnczgdoavtlA==
UI-OutboundReport: notjunk:1;M01:P0:3xiACkpgSEQ=;Lzc4bt5P1vVKZKIwszrJ3ZI5SQ4
 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
 ba2fm8JRhUY8IGuWP6tHQ=
Subject: [Buildroot] [PATCH 00/10] Update dracut to v113,
 enable proper cross-build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several parts of the dracut code expected dracut to be installed a
sysroot, and to be able to execute binaries from sysroot. This led to
things like the busybox module being unable to install applet
symlinks, because it tried to run "busybox --list" to find the
available ones. Most of these have been fixed in v113 (in no small
part by me, see [1] and the various PRs split out of it). A few
remain, for which this series adds patches.

On the other hand, Buildroot was not building dracut-util for the
target, which is a helper tool to be installed into the
initrd. Missing it breaks a number of modules at runtime. Including
the cross-built dracut-util into an initrd built using host-dracut
still needs a patch pending upstream.

The first three patches set variables that already existed in previous
dracut versions, so they don't depend on the update, but they aren't
terribly useful without the futher fixes.

Technically most of the patches after the version bump could be
squashed into it, but I hope they will be easier to understand and
review this way.

The result: Most modules (from basic ones like "busybox" to
"systemd-*") now actually work, and I'm including a test to prove
it. :-)

This is quite a big change to still make it into 2026.11, but v113
also contains security fixes (how relevant they are depends on
selected modules), and having (most) dracut modules actually work
seems useful. But I can live with next if I have to. ;-)

Best regards,
Fiona

[1] https://github.com/dracut-ng/dracut/pull/2588

Fiona Klute (othermo GmbH) (10):
  fs/cpio: set DRACUT_ARCH to target architecture if using Dracut
  fs/cpio: set DRACUT_INSTALL_PATH to target PATH if using Dracut
  fs/cpio: set NM_VERSION for Dracut if network-manager is enabled
  package/dracut: security bump to version 113
  fs/cpio: configure Busybox applets if using Dracut
  package/dracut: add target package that builds dracut-util only
  fs/cpio: if using Dracut, provide target dracut-util
  package/dracut: install and use systemd modules
  package/dracut: install components for systemd exitrd
  support/testing: test_cpio: add test for dracut initrd with systemd

 .checkpackageignore                           |   1 -
 fs/cpio/cpio.mk                               |   5 +
 package/Config.in                             |   1 +
 ...nor-DRACUT_INSTALL_PATH-in-find_bina.patch |  43 ++++++
 ...ll-allow-installing-from-dracut-dir-.patch | 138 ++++++++++++++++++
 ...low-inst-_script-_simple-from-dracut.patch |  75 ++++++++++
 ...004-feat-introduce-DRACUT_RUNTIMEDIR.patch |  69 +++++++++
 ...l-dracut-util-from-DRACUT_RUNTIMEDIR.patch |  30 ++++
 package/dracut/Config.in                      |  14 ++
 package/dracut/Config.in.host                 |   1 +
 package/dracut/dracut.hash                    |   2 +-
 package/dracut/dracut.mk                      |  39 ++++-
 package/dracut/dracut_wrapper.in              |   2 -
 package/dracut/merged-usr-module-setup.sh     |  26 ----
 support/testing/tests/fs/test_cpio.py         | 100 +++++++++++++
 .../tests/fs/test_cpio/dracut-systemd.conf    |  83 +++++++++++
 16 files changed, 596 insertions(+), 33 deletions(-)
 create mode 100644 package/dracut/0001-fix-functions-honor-DRACUT_INSTALL_PATH-in-find_bina.patch
 create mode 100644 package/dracut/0002-fix-dracut-install-allow-installing-from-dracut-dir-.patch
 create mode 100644 package/dracut/0003-fix-functions-allow-inst-_script-_simple-from-dracut.patch
 create mode 100644 package/dracut/0004-feat-introduce-DRACUT_RUNTIMEDIR.patch
 create mode 100644 package/dracut/0005-fix-base-install-dracut-util-from-DRACUT_RUNTIMEDIR.patch
 create mode 100644 package/dracut/Config.in
 delete mode 100644 package/dracut/merged-usr-module-setup.sh
 create mode 100644 support/testing/tests/fs/test_cpio/dracut-systemd.conf

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
