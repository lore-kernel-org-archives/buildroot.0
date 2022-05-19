Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 04:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B543404CC;
	Thu, 19 May 2022 04:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8ytalfzWisy; Thu, 19 May 2022 04:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ECBB401A2;
	Thu, 19 May 2022 04:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9F41BF3C6
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 04:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D61560E9F
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 04:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2sBMEhS5VIj for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 04:48:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B2CF60B70
 for <buildroot@buildroot.org>; Thu, 19 May 2022 04:48:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 325A540007
 for <buildroot@buildroot.org>; Thu, 19 May 2022 04:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652935688; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c/jVR3cffSEv9KiT0LgWU2QAuyjd9KqS767kl8pjCHk=;
 b=FWQ46Lkw4Lbs38KXeUb4v2oEXa6+M65eHN5IH2HJIPsW22pGFGevR17N8cMr2LyGOaavgK
 ZmKT96Qv5AdDWV411Ns0kWMUJPI8cxxj/8wVkQvDGO4vQkJlhmOxlozsRwMlSSLmcfIkiG
 /naI61pLxes3c6p2xuD7lRdPtu6Tfhrw4whWOHynMmYnjaGBfgoD3yA2+C/O+wVXFErjpu
 a7//E0ZT7PTZoFVV3tqom6tFG+RYEF4RT8MnTCRgwL1hiXdUZpPAPwxV/MQVfjlD/l+vV+
 XRKq3wKV1sUP3x57gAwuBYjhfyOl1c50QJLxA0DejK0y0J2pQjbuNGN/Dg/f0g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 04:48:08 -0000
Message-Id: <20220519044814.6D61560E9F@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-18
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

Autobuild statistics for 2022-05-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 22  |  2  |  1  | 25  |
    master   | 140 | 122 |  0  | 262 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 13
         host-gcc-final-10.3.0 | 7 
              swupdate-2022.05 | 7 
                  linux-5.17.7 | 4 
                host-go-1.18.2 | 3 
host-pahole-73383b3a39afe86... | 3 
             libopenssl-1.1.1o | 3 
              libostree-2022.3 | 3 
           libwebsockets-4.3.1 | 3 
               protobuf-3.20.1 | 3 
                  boost-1.79.0 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                  exempi-2.6.1 | 2 
glibc-2.35-96-g2c4fc8e5ca74... | 2 
            igh-ethercat-1.5.2 | 2 
               libglib2-2.70.4 | 2 
       linux-5.10.104-cip3-rt3 | 2 
                   linux-tools | 2 
                mongodb-4.2.18 | 2 
                nodejs-16.15.0 | 2 
               pcsc-lite-1.9.6 | 2 
                   perl-5.34.1 | 2 
               pipewire-0.3.51 | 2 
            qpid-proton-0.35.0 | 2 
                     refpolicy | 2 
    toolchain-external-bootlin | 2 
                 uclibc-1.0.40 | 2 
                 wavemon-0.9.4 | 2 
                 zlib-ng-2.0.6 | 2 
                    4th-3.64.0 | 1 
              alsa-lib-1.2.6.1 | 1 
                    bat-0.19.0 | 1 
               belle-sip-4.4.8 | 1 
                  bind-9.16.27 | 1 
                    bird-2.0.8 | 1 
                  bitwise-0.43 | 1 
                busybox-1.35.0 | 1 
              containerd-1.6.2 | 1 
                 dash-0.5.11.5 | 1 
docker-proxy-339b972b464ee3... | 1 
                     frr-8.2.2 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                 gnuplot-5.4.3 | 1 
  gobject-introspection-1.70.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
         host-gcc-final-11.3.0 | 1 
               libcap-ng-0.8.3 | 1 
              liquid-dsp-1.4.0 | 1 
                  netsurf-3.10 | 1 
                    ola-0.10.8 | 1 
                 openvpn-2.5.6 | 1 
              rsyslog-8.2010.0 | 1 
                sg3_utils-1.47 | 1 
       shadowsocks-libev-3.3.5 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
                       xenomai | 1 
    xserver_xorg-server-21.1.2 | 1 
                  zabbix-5.4.9 | 1 
                  zchunk-1.2.2 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/0bad974e4a6ffd95e113875cd3f4bf7a44d0e6b8 |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/416502c0d7a3cbeda342df5addf28653f37f9042 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6c32cfda4d27a405157d2c8699e0864d5abbd64e |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/22b529ef8098ae16c43ac16ab387d8415fea1a2f |     
   sh4eb     |          bind-9.16.27          | NOK | http://autobuild.buildroot.net/results/439da7e75c2aa7f8cc18a5ec6541b28951a044b3 | ORPH
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/b18b1150387ac0d2afaf83a8954a4da787bb4c6a |     
  riscv64    |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/58baecbf39f73c4aed9bc5be56d2db82dcc943a9 |     
microblazeel |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/d8785bad5fb998bad9c9edaff342d99297d10c75 |     
    sh4      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/adde55ff7912737d5cfa321bc5af6134d347cd07 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/e17e544af17aaf19147107773f656e04551d71fb | ORPH
    i586     |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/dca7ad80e5b35065438770c24843aab99a84313b |     
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/fe9890629d652392507f85b9aac9c8f60bdc3916 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/774e40658d108592174783e9b0e1b8ee23521fd8 |     
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/18da29cd28da84f4b2407a00c7b6d53adad58238 | ORPH
powerpc64le  | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/74509013228add1746a515baa8a755ebe9fad259 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/d59e09fb0189ee2bfe52dbe7cabda9dd424604b7 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f7914d9becdcad83894107155c421902e322d6c1 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/2ab5a7f957e64f9af5bc543429a60e6ef5ecc7f2 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/299694a841d8d0932232976f99d55b7a164b4448 |     
    or1k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/f1ada0cc788bbed103473a1055c7c260c90ce768 |     
powerpc64le  | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d9970a62d323a79cad0817127d3321597353e9ed |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/f3220dca7012edd3f01d6803f810806ade89a097 |     
  riscv64    |         gnuplot-5.4.3          | NOK | http://autobuild.buildroot.net/results/c043f2a940b274a787c5a860c0c2bb2ae11f7794 |     
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/b647101544abd9377e9e4533e8d8cdf486c4c259 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/6199087326499e366b35a563f58e8eaf1fb1e2df |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/972c7c21ec245f0f936ddc93b83fc2f5bcf9daa1 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f74f9c63d985669d47a8beda9aad58a67463fdeb |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9b3fff0b55e2a951b52a0224278801ce868f8390 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5de33c38f0c467818cb9777839c681515e107205 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b2aae4bdc634f954d6486a3df627a57aea3dce28 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0698ec034cc3a3c53c57c5906064d5cede0d094c |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4bc71e19bab87528bf7c39c7f7413a5501b4a6de |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/db9fa36762af3fb3ef7ef9086e565bcf43c2f09e |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/cb82d8e68885b04cf11ea2e3aba63946e081d449 |     
    i686     |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/532c000e3f1870b6a523a357bd9d407a47baa4ca |     
  aarch64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/9d5e06132d60b7a10a9252f88970f864e65b681d |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f3a31d22aa518980ba8cd0f5dd7764c2fc0edb93 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/78a3bb5ef38a1341f5815c7cf7c3ea0e6c4893d0 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8269dcdbb74b1191f49cd9074c94c8fee259c4f8 |     
    i586     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/bcdf853d3c7dcdda6ff9e83fc9cca7b2238071c7 |     
    arc      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/d509772c33fe5ad2b4278a699c586aaf35b9fbd5 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/855638bec8de73e8153586adb267296bf7a8840e |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/6e5dbdd1fcd30ae063507c53bb9581c5b391ff5a |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/d915a18a93f9fb201384245d322ed9d4e1ffc2e7 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7f855ac386abbe1a8fad5839c23962a434ab256e |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/307f831198240dec48512b6169155e71bf29f9c6 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/78ce4855afa73427c8265db3f27e1b9ad726baf9 |     
   s390x     |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/1bac1cfe88a1004cd688433ac7c7ec31bbba3a1f |     
 powerpc64   |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/e63d2db6bbe307efc2db1ce06f2ea4ec5a5fb4b9 |     
  aarch64    |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/d68b4d0c60542b93f3281615da6ac813b6faee8b |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/9f5a9db6d2d94e04b96b97dc09dba6c01408647c |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/0cb4d9b7f721cfd85cb42411c0591f2f5740545b |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/ddf486ae6efcd0bd769f903e81f20d187790d247 |     
 microblaze  |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/fa9024701e93692642dc39e4e0b6f0765b65892f | ORPH
    arc      |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/ebd58245c4696aa2650f69995120784ec0a8b128 | ORPH
  mips64el   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/38e3b66b786c75c0a70a30d11e8536884459fc71 | ORPH
    arm      |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/1f823a99f00408c3ebce76da81da1574f2175f46 | ORPH
   mips64    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/3d3c11bc6f579e15e82437386e04e9665a92fab8 | ORPH
powerpc64le  |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/75049f3a125da449a5a5cd3579b44bab3e69acd6 | ORPH
 microblaze  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/f143d9106135799d08b61bab80a6811dacae361d | ORPH
microblazeel |          linux-tools           | NOK | http://autobuild.buildroot.net/results/cf1e31b69ea21d8329854dda27fdbceed37de360 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/eecc898c3f15d84e4ca1b548cef910ca4df0f046 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/a9be8ca557fb23a2dada5d0f66793d2536c8f26d |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b4bd9041052ffc262f056719cd14a3e49c179311 |     
   armeb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/88c98908b63bb603c1ddda12b391aeca123a0227 |     
    i586     |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/4371d08f47bed37199c5c1670273e84bfdfd606a |     
   mipsel    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/dea2eff7ffb225f22f7cf341708ec93ae0298c6b |     
    arm      |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/89682d2673e10d83a102b274d33a9ee5c319b9a1 |     
 aarch64_be  |         openvpn-2.5.6          | NOK | http://autobuild.buildroot.net/results/c8834fa5ddcac6fd22fc9406e10221e64cdb8856 | ORPH
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ee1fabf1e8650b96a9c37e1fb03bdaae22fd6603 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d8994fab1dd8c14e64e3621d60bdfe6db86162f6 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/9a8180a35928a9abd4db505b9f28fc15f16f9b3b |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c5da4da1901dc5042a2b8f351d7a95f132c6fd8a |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7f46380c0f26757501eeb942b49c7ce097a7e54c |     
   x86_64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/80007d47f2ed7adbdeb91c5e1d623062d2cf6354 |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/492936477c10e54fb947f9004ddccf0d2c092ff2 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/05cb29d10774936c87a12659ed8e8611c76648a6 |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0940878e5784b2b31fe4396fcd9b97b6f068cfd4 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/e5f92f0972ae21fe57024ace1ef5f2c8646be6bb |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/38be6342fd12ff419a8840b785698b3f6e249a8f |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/32e7f15c4f3fa8c4eac3fd5c0d5ef361af458893 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cc76f364e4a7ba18f1614b639d536ae7869de95a |     
    arm      |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/6428880965f327d765b8dc3bd2f04cdafca45b97 | ORPH
    arm      |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/49b17e8b2767a16380d9930cbfc4a7a017c3d1a5 | ORPH
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/991832cd93a505e4013b04cbbcabd2edcdb3ca7c |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/53b80ec00cd962c312d33e6635c5048874a9009a |     
  powerpc    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/31f0405922eec4c4e43622c2329b623e9e2d5833 |     
    or1k     |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/bf80796d216011efa89e4c9328229ae8dd43c2fa |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d1c4d868ccabef71ae17ef425dcecbec2173aa6b |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/62577291484d1cb5828fb084d324e330326fa23c |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d6e13eae42b73c99ad2d3c77e6d2a7c7a734f9eb |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/81f32415cb829660a81802fb48391cdf9688fbd2 |     
   s390x     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/4856d3db68de2d2eabb2d6373b8c7b854a35eaf5 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/e33883a3bfc3ac6f0602b1842e00eea2a44b96a4 |     
    m68k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/59697e9c039b8b9841a391031ecaa4ecf7eacc81 |     
   arceb     |        rsyslog-8.2010.0        | NOK | http://autobuild.buildroot.net/results/68b77725969e7c88c038038d7158fef434c81b7b |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/a10fe6e7bc18cb1f14e2620480f3b7cd20d55024 |     
    arm      |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/95d672e08776d9ab929d1fb4f59127161de190e9 |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/de8654de7bbafe023238151e906227a56b155e34 |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c019146146311269745269725fc5e7c899712160 |     
    i586     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/6e108f5bd008f8d5fc762d57757e7b4285a6c24f |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/b1d7b6a5623d5b74e13b9e6467b3ebd21cd76690 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/77c34f33d0cb96b0775462ab40e48f87143a38ad |     
    or1k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/96da9d9436cadad17ca50c08bd46a1beb7cbd654 |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/fab23b3c7ac5effee645c8caf93a9c2764287e0b |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/ddef15da0b117f26ac9f3a46ec5491ac60d430d2 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/e301169b0749afbf219a6afbeaaed610e0143e43 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/36941b8883ff15fdc07a8519ce5db9aab7deff5b |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/24c70d7017ea34e62b61f8a1c433eeff326c4f82 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b8eaf31c39605db9ff882980f30cf19ff835d633 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e902afbd0f42d2fb8ca30be6f872a950c594c235 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/f8634d8fbc6e81976562875e93a5fcc639d5c8af | ORPH
  riscv64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/966d9ef45d8958e7bed7ec93bd448c9ad6846450 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/33744af64a8a6cd82808d47a4a3f6dd0568ba4e8 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/12ddfbed8074ef5dbb6aabbf1277ed090c5fcc30 |     
  sparc64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/43595f8f17bdc9ae7d93e4045efae15b9bc17125 |     
  aarch64    |   xserver_xorg-server-21.1.2   | NOK | http://autobuild.buildroot.net/results/9471b77db9aefa2fd0e5be61ea84709183511623 |     
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/e8af1fff27da6735d8ba338dca9f832c6806c18c |     
    i686     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1242d0b15ceb816e946bfc1b31dd39e68227359f |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c5ae914d302d887093fecc82c82392292b27d402 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ede3709dcb81ba6292c5f8f2ea91440071bfefb3 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/c5be5585c0d8cc18383430676cb2ee66aa6b2751 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       libuwsc | 1 
   openvmtools-10.3.5-10430147 | 1 
tvheadend-1295dd2be863f5beb... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            libuwsc             | TIM | http://autobuild.buildroot.net/results/26aecb7e09d0350f5a95e45a35089a23ec874e30 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/1588c69a556552e3d1719f53d50ce95e9b5c09eb |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/6806d1637ca5e8dc4aa52c0c9b73f651faa0ed34 |     


Gitlab CI results for 2022-05-18
================================

Detail of defconfig failures for 2022.05-rc1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235155  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235161  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235166  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235216  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235219  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235222  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235264  |      


Detail of runtime-test failures for 2022.05-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235401  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235805  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235806  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/2472235840  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
