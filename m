Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2968CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 05:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CFCB40449;
	Sun, 22 Oct 2023 05:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CFCB40449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVVQZ2_z3O84; Sun, 22 Oct 2023 05:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A30B5436DD;
	Sun, 22 Oct 2023 05:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A30B5436DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 318271BF954
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 05:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E762084C8A
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 05:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E762084C8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKfGX4DE6pK2 for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 05:36:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4554484C67
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 05:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4554484C67
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D6D51C0002
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 05:36:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 05:36:03 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231022053609.E762084C8A@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1697952963; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tXuvfPklKrqzJRSM/6//vDD2N+7G4gtSJNXfeM12idE=;
 b=ojAOrADEofO1DDFJyj4otFXm//d8Fye2hGMNOhbhUaDkHAUHMIUCa8Xg+WB2/oYPvh+qaw
 vQE8aYVar+CzwnRXr048zNSIn39/SLHMcEzUiYyK4ALMxlWPvRLAV+HMS7HsM6kTHpZZst
 I93510/oSx5XG8GE/wk5F8S9jZqr27CzjSdIt4BYUd4rioqHZ637lFCWzLY3IZlbTZo1Ab
 MPYp8yjkSzB9CLJSI0eOpIb7An2y8+0r+tifv/6j8HliE6MYLFPoxPeYvtq8fjNUvytQRP
 cllGX6HkD8r77KhC3chgRihkAjLKtYr5IQ6Mdizc4noEYaAMrFbAFPzs96jJDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ojAOrADE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-21
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2023-10-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 15  |  3  |  0  | 18  |
  2023.08.x  | 19  | 12  |  0  | 31  |
    master   | 37  | 70  |  0  | 107 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 11
                       unknown | 8 
                   bird-2.0.12 | 5 
                elfutils-0.189 | 4 
                    brltty-6.5 | 3 
                   linux-6.5.7 | 3 
               mariadb-10.11.4 | 3 
check-11970a7e112dfe243a2e6... | 2 
glibc-2.38-27-g750a45a78390... | 2 
               libglib2-2.76.1 | 2 
         spirv-tools-1.3.261.1 | 2 
          xdg-dbus-proxy-0.1.5 | 2 
              containerd-1.7.7 | 1 
                 coreutils-9.3 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.2.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 erlang-26.0.2 | 1 
                   expat-2.5.0 | 1 
              gcc-final-12.3.0 | 1 
              host-rust-1.71.1 | 1 
        host-sentry-cli-2.20.3 | 1 
              libarchive-3.7.2 | 1 
          lttng-modules-2.13.7 | 1 
              memcached-1.6.21 | 1 
              open-iscsi-2.1.9 | 1 
                   perl-5.36.1 | 1 
                    pppd-2.5.0 | 1 
                 reproc-14.2.4 | 1 
                 samba4-4.19.1 | 1 
                 systemd-254.5 | 1 
             util-linux-2.39.2 | 1 
           v4l2loopback-0.12.7 | 1 
                     z3-4.12.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/fd3795107afc572225c22c087f2445065941d866 |     
 microblaze  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/822c65dd563c3e4c4a806e035b422b4feb3834a7 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ed9dfa820b463e49af311c23a6a1838b126d69eb |     
    sh4a     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/46f810558cef261fa2e2fe44c6322c97b6a652a4 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3d129415e216045cdb2129bcc0574a98247bb409 |     
  sparc64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/edaa6f0bf3bc5d053c0b8e5dad08e6161d685377 |     
    i686     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/5d62bd4b6ae81b7b83df21f89876eb038d01b9f6 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/6e2e7ef40ca5a3e531f49777e5d1825921a69b9b |     
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/8db482f1203b0709a15449e1dce395580171a9cd | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dcac7ba56ccc9312e19064ef94f3d1c0480eaa83 | ORPH
  aarch64    |        containerd-1.7.7        | NOK | http://autobuild.buildroot.net/results/6cf9fae9beba0a331dc16e440d12f3e9ba011242 |     
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d9f27dad35ffa258f8ae068d69b0e021eb4598ba | ORPH
    i686     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/137e49a93dcbf84de8fb5ba40c4e0e6d7698e7f3 | ORPH
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/5ec34f0e8b9caa868626ca43677d0e59490aefad |     
    arm      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/951595f14add552c7f548e6fa9a1e7f0e37f226f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/dcfec1d9e75cb50ada5210b0abdcc22bb1f3ea2b | ORPH
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6c43cb4a6193583035a9d63f417d34044451ab0b | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/10636ad8965cd7efd95ceea34f7c406e2e34e4bd | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ec8204e6bf3cd4030169c6d66474c6eadfd65869 | ORPH
  aarch64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/6e902671b8dd10cea1344e37cdab7b5358751315 |     
   mips64    |          expat-2.5.0           | NOK | http://autobuild.buildroot.net/results/eedde7b985799756b1997cc41ddce59b1e4aa865 |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/03600fa1a6a160c59286974d7442102ae461461a |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/cf60420eacec064800d39783654153ea8a998e53 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/b8b9c89cae1407725ba9db33b7304784fff924b1 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/fa2d9a8832a57b209423f08176a73c5445e8d1de |     
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b1cce44dfb71acdc65f2ab1f0136befdb0278602 |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ce01e866f467a63376c729f291f2142e72b8e558 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/20956c713011d4fefc1e012b229bc4913168e9be |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/99138382808e48586c7393cac6e0137462e700e2 |     
   armeb     |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/0e3248b74ef7a29dea606306eb93eaa6c4998196 | ORPH
  powerpc    |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/d78f753a49243146194134dcd37c12f52df48bec | ORPH
   arceb     |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/261efa5bac2d1eb329ccaff75ab65a8762ae8628 | ORPH
  sparc64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/d30449a88d25f93908f68123704bfc475db6d497 |     
    or1k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/2307e240684e5a7df3fe0fdbfd958e91d45c1c0f | ORPH
    arm      |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/eabfd5918b37d8fd178cdd31f27e6234a0542142 | ORPH
  riscv32    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/ef72b4ee8415d0eaea49ea9180c0618fbd371bcc | ORPH
  powerpc    |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/187dffa7bdcbe5a5310c28756265959781762b28 | ORPH
    mips     |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/861cc7ccb94dc0fd045aeebe6c426c22b85f808d |     
    sh4a     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/9e6a11d9ab4ec7d4f095f1203a2356cbf9838c18 |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f2d168931ff3c2f2db705950afe1fe922dd36fe8 |     
microblazeel |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c4e6fb0f0154e6b7a678641de84a0c4d6a34d096 |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/04001371501546f69214f0933f0590bcd9ce4c5b |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/9be37e9268b9d1426b85395d29d5633d1e9f82db |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0b8476fc8109edb6e08a7f9e17c6de816f0e32e9 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/fd603fe06408529b03aeea58d25fd18fdfecaa55 |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/bedb6e791d081d9786140bd412ae1a00d77eb0b0 |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/436bf41661af66be7db12c5df12c0459364a449d |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c8d4304e61068c63117e06102a8e91ec1333b3d5 |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/385b4975545cb30c3660914903b3895631b824f7 |     
    arc      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/a4553bc059f443208faaaf29602dadc2aa74580a |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/dd40ffcc4bd5c6394ebccdb89f82ee7d697281aa |     
   mipsel    |         reproc-14.2.4          | NOK | http://autobuild.buildroot.net/results/98cfd9f506caa71d6436946a715da6b2b821ded6 |     
 microblaze  |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/864633ae68c6dc351739941fd51347de38d77054 |     
   s390x     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/a7588e3b2d53375b13f48bfa37113edd937a1f0a | ORPH
  powerpc    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/5ded76d1a05b190493ea3596c12ce4ee54680f49 | ORPH
   s390x     |         systemd-254.5          | NOK | http://autobuild.buildroot.net/results/d1fdca194b196cbab50d411730def555e76a6e40 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2a3c4c8d4bf5d0f25f92fdae09ca54938eadf1f3 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/119f15a4cc550b2ca863c44686d8e33cae65383a |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/d280034259ef3fb304befd78b0b697b4d91f9212 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/78e54b6ee502719b15d95af87f183a3a98d51477 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/a253af9d1704380d119e5353cfcd469aa87193f1 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d62f5481cbe9a1e81c631e2d55788692f475102e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/150585baf0e80e39aa9e732a9c3e73a377d57f70 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/2c6389184edc7d6232097391923156324df8b78c |     
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/ea9ca37eed33e17c64dfc682e7d1e426a7c9d13e | ORPH
powerpc64le  |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/ec150e3ed28f914bd3ccf759552d925bb48ce22e |     
   x86_64    |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/a041c65d155270f4850b66a58bb921e447369a7a |     
    i686     |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/b9c1471298b7b68fd1e5d5537ca42dd59a0c70a2 |     
 aarch64_be  |           z3-4.12.2            | NOK | http://autobuild.buildroot.net/results/adbbb1454967e3d87a20be62b31e2fd5493f510b |     
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/22e4de46aa9a6d9d304e3e2b5d5c0df4b63a50bc |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.38 | 1 
               libglib2-2.72.3 | 1 
     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3c815abe35b7c3a68d5dc860fb3b2d6ec08cf690 |     
  powerpc    |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e1930e1ac35ea008facf0f30aa0ec44d9eb91e98 |     
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/a97859ac55351b71f77e1f78bf1d01cc90f3b8e7 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 3 
                   bird-2.0.12 | 2 
                  conmon-2.1.8 | 1 
                elfutils-0.189 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
glibc-2.37-45-gb4e23c75aea7... | 1 
               host-go-1.20.10 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/39b96b759b66f7dcf6de61c66349fb60353ccb6c |     
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/fcce29be09476b0f2f24fef2f04e32c534579529 |     
  aarch64    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/3133572ca7aa0be6979271a5c201d27f7bd9640f |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c6ac981e48a3d82e87bd41d84de454facbb65914 | ORPH
    mips     | fs/axfs/axfs.mk:32: /home/b... | NOK | http://autobuild.buildroot.net/results/f662c3296f8e3b97be95a1272f44df612a5de36b |     
 powerpc64   | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/64ffae7a229946da38bf941f2921f1725b48a07a |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/322ae18b8cca68655fc8564f563f9b9881a30d4d | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3faa8ae6a8f4420732b3400fd711d90c2bcd7825 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/488cce41d0043e8cc1eed0bd5c8bfc1b3d52194f | ORPH
    i486     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/5bb77ec82c63ccc42b821888f6b878233b1113e3 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/f4bebd78bc5a7ea4444db71941e18be8817461f5 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/9a1dec776af1fb65c586905ddd8a7340344e830c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
