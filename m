Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0457C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 05:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44A83612C9;
	Tue, 26 Jul 2022 05:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44A83612C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fYlTfmoSAFYE; Tue, 26 Jul 2022 05:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA1C160E49;
	Tue, 26 Jul 2022 05:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA1C160E49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E10DD1BF28E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 05:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85C1A40236
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 05:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85C1A40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rue6n4CqIFow for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 05:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED5B8400CB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED5B8400CB
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 05:39:02 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A52C1C0004
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 05:38:59 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 05:38:59 -0000
Message-Id: <20220726053906.85C1A40236@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658813939; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2J66KiXiOnmb1HNTYbavMt28aSgldwrE6cPRqOg5uZc=;
 b=R5tRWOJGwr2vToYbq2ulKmzrowgL4RTtxFbpKvX2VTviM12UdPjPagF9BTRY0Zp8sk+mH0
 CgJCLyclRPfpu851OEMQqHfIXSfzdCdd8kSVuCmjTFiXmR7gJvqFNycDbWpCxMz2UGXzcD
 ENvzDsk0mwLMw4s/IjP04bFwafDl7FhokoVzber76PUlHD4rdGwEJLow/gKMJwlwchsOMC
 9Wl8fwMKwOrZ+q7esci6QA5R9rehFwyOeFeqmWfp1FY3yC+u+nR57BsJoj1dNjCaFj82Gw
 hzujuAu4qfYI642mnoTF72mJb3fm3AKSRZ1KLxV51Slxa0dUaml3UiNFnfqB/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R5tRWOJG
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-25
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

Autobuild statistics for 2022-07-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  8  |  5  |  0  | 13  |
  2022.05.x  | 23  | 20  |  1  | 44  |
    master   | 204 | 283 |  0  | 487 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 11
           libfreeimage-3.18.0 | 10
                 linux-5.17.15 | 9 
                 opensc-0.22.0 | 9 
                   speex-1.2.1 | 9 
                 uclibc-1.0.41 | 9 
glibc-2.35-134-gb6aade18a7e... | 8 
                host-go-1.18.3 | 8 
               pulseaudio-16.1 | 8 
                speexdsp-1.2.1 | 8 
                busybox-1.35.0 | 7 
                     refpolicy | 7 
              bluez-alsa-4.0.0 | 5 
                 dash-0.5.11.5 | 5 
host-pahole-73383b3a39afe86... | 5 
              host-rust-1.62.0 | 5 
                   perl-5.34.1 | 5 
                       xenomai | 5 
        edk2-edk2-stable202102 | 4 
  gobject-introspection-1.70.0 | 4 
       host-gcc-initial-11.3.0 | 4 
                 pixman-0.40.0 | 4 
              alsa-utils-1.2.7 | 3 
                elfutils-0.186 | 3 
                     frr-8.2.2 | 3 
         host-gcc-final-11.3.0 | 3 
                  lcms2-2.13.1 | 3 
             libgpg-error-1.45 | 3 
           linux-5.10.115-cip7 | 3 
               protobuf-3.20.1 | 3 
                   tor-0.4.7.8 | 3 
uqmi-0a19b5b77140465c29e2af... | 3 
                  acpid-2.0.33 | 2 
                     aufs-util | 2 
                  ffmpeg-4.4.2 | 2 
         host-protobuf-c-1.4.1 | 2 
                iptables-1.8.8 | 2 
                jailhouse-0.12 | 2 
               libdcadec-0.2.0 | 2 
             libopenssl-1.1.1q | 2 
                mongodb-4.2.18 | 2 
               openpgm-5-3-128 | 2 
                     php-8.1.8 | 2 
rtl8189es-39c17661136da48f8... | 2 
rtl8723bu-19b4bdc05483a1e79... | 2 
rtl8812au-aircrack-ng-37e27... | 2 
                    sdl-1.2.15 | 2 
                zerofree-1.1.1 | 2 
                 zlib-ng-2.0.6 | 2 
                    zstd-1.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
                apparmor-3.0.4 | 1 
               belle-sip-4.4.8 | 1 
                bitcoin-0.21.2 | 1 
                  boost-1.79.0 | 1 
                  botan-2.19.1 | 1 
                bpftool-v6.8.0 | 1 
                    brltty-6.4 | 1 
                  cairo-1.16.0 | 1 
                 coreutils-9.1 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                    dhcp-4.4.3 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-339b972b464ee3... | 1 
                  earlyoom-1.7 | 1 
                  exempi-2.6.1 | 1 
                     exim-4.96 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                    glog-0.6.0 | 1 
               gocryptfs-2.2.1 | 1 
gummiboot-2bcd919c681c952eb... | 1 
               host-4th-3.64.1 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-10.3.0 | 1 
       host-gcc-initial-10.3.0 | 1 
       host-gcc-initial-12.1.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                 host-isl-0.24 | 1 
            host-systemd-250.4 | 1 
                jemalloc-5.3.0 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
                   libnss-3.80 | 1 
               libsigsegv-2.14 | 1 
              libuhttpd-3.14.1 | 1 
       linux-5.10.109-cip5-rt4 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
               mariadb-10.3.35 | 1 
                 mesa3d-22.1.4 | 1 
          moby-buildkit-0.10.0 | 1 
                   ncurses-6.1 | 1 
                    ne10-1.2.1 | 1 
             nilfs-utils-2.2.9 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.3.2 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.20 | 1 
                 openssh-9.0p1 | 1 
         python-greenlet-1.1.2 | 1 
           python-orjson-3.7.7 | 1 
   python-pycryptodomex-3.15.0 | 1 
                python3-3.10.5 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
     s6-portable-utils-2.2.3.2 | 1 
                 sudo-1.9.11p2 | 1 
           uboot-tools-2021.07 | 1 
             uccp420wlan-6.9.1 | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.2.0 | 1 
               xfsprogs-5.14.2 | 1 
                  xxhash-0.8.1 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b7162fd7abad0b26e222aaf0e0c94056df5ab42c |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/312f0ea1b0320b363ff0a7e30db61d10b07b361e | ORPH
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/20a4148be1b3500bb28df43464dd12d1368b7c5d | ORPH
    m68k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6340d65197bde9d3bd9e6a12e9184dfe145b19d1 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/82bcf43766d200dd301d42b6c3e048ba28d44a88 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e586ff3d71a8dbba93d61c781cc598878dbc1813 |     
    arc      |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/09df2d2e322be98d90277bd9323781e5c7c2676d |     
   x86_64    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/e052d6968e1604059f6cb27970a498d15a01e623 |     
powerpc64le  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/a8e3113e92bd6bc279e065ccdfa26939c531ca25 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/64e54ef5ba3a3dee391b788315615d57a1dd9fa2 |     
   sh4aeb    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/fe8e65bdd79629091ac0430aac481500345327a5 |     
    or1k     |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/7241a21c8d52f8c982b9e2f1c3b3f29da922fbf5 |     
microblazeel |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/2f800bbb280e910e28d9254d821136071117723f |     
 microblaze  |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/151a1b052705e50c2f48c9e3734d1d3402a869f7 |     
   x86_64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/edcbc58826d682753af67f76a1e1d1705b5192b1 |     
  powerpc    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/2995f05c41d6789d7cb91aef83d237fe34d905a5 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/d90344cf6f4f26cae5a8126258835c861f5aeddd |     
   sh4aeb    |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/b7d08b02c3ccc887024b70217b1ad9d23c537e15 | ORPH
   s390x     |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/66950071233046e2ff508ac4da782864add83a72 |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/c14a7cb7d5740cb7119eb52ffb5936043a9e5b26 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/594c03d0b0381d44ef9f04cea000bad363c0b5c0 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f18612646824bfeb15e58cf064195f7a308cf4f0 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/ef24147e0e2631b2fd829f75cf8bd0ab03fe63b6 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/0a5c481adfca2fc22de06fe8b4302c1a1005cd43 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/7a8675680db49733132557dd5f55907814e10254 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/708ce969ad66976a2e9addae54f06640e6a2f923 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/8f8ab417ca7bb7f3244f57029cbe85b7cb698cbd | ORPH
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/d87d111d7e3bcc3afad7d9083cffc51411f1156a |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/d97345ed1642d92f23ad4c624c12d8f9c0a326e0 | ORPH
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f389796c988de199fa8717d168068be47b9c4e81 |     
  riscv32    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/72af06305d9f00724070a9ce8d3621be3f2e57dc | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/33493d1a22bf6ccc6923d01ce5f8e28dd5f9c8af | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/18d930a0b91084f53eea2ffd2a3d74d84dd00f46 | ORPH
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/041d8a35ba8a1bd6af8fc1c6fd7f980500e5f05f | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1fa9dc338dbd80da31c35d730c7a99be639485b0 | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/56d664ad2686c18a86c6406f735fdec601e43d16 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/68f60441e85dac83ed654387c06a67bb197d767e | ORPH
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/17bc7ebc74bd923de7cfe6438bce6555af1166bb |     
    arm      |          earlyoom-1.7          | NOK | http://autobuild.buildroot.net/results/8400074cd800696248a0bddb983756370d475c1b |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/118d2e52831406cac290f8a94d335a2de5fc9790 |     
    i586     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/cc2fd15e21d8b8f6375ad8424358836f6a67e010 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/2cb9013033b055c34a3c5d065ee1a2bff7166051 |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/810a8cb51685467a09ef1c14c44c94e1d3bb40cb |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0c51b22e192a148475f6033816a5d9689cb8b107 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/536f2d9eb500422d03734c0b17fc3499c54c50ad | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c813dce29564d9769a54299913e6d3f9ffa836ff | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/d2962b439cccb23c6a0e5178d1ece7f3ae0681d7 |     
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/a2095c5de2ec2d10432be9cedeae98c1d02450a5 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/fb0406ff134b143d2e3dd4f89a34f3c0f8ac007a |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/87cc86c601096f916b717e4d8452cb03245f1a13 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/1c73628951933fa490f56add20ba7d60e9e344ec |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/8985c1b7f51469dd8155ab217e0e27d2746c918d |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/b279f4c53257591c3d3800080b0ff99c36cdf3c5 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ed92d8d2df5f33644336ec0cf21e15d962db7964 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/b7d988cf76ea42faebabd1292bd441ebafe7cbf3 |     
    or1k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/8c5761331eedf7454070778724e519266ee1b44a |     
 microblaze  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/3527a29a6e98b7c51feed948b278d0bbeddc6824 |     
 powerpc64   | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/2e428e82e1312fb0816d12b6f211c3e0b8d0f430 |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/19abc01972499362faddecf4250da7524ace4a13 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/79ade6c301469630605503c7f4c5542e25ba28de |     
  riscv32    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/883ac8662ce082f13d8f815cf5adef324da2e6c3 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/89ae97697fe18313dd6a0dc65faceb7c199ddebe |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/197ce846777ea5b2b4c448ffbeb80bf8792721e8 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/9298242ca3860b0c8ded22c5bc305dbd02255147 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/f044f72f8f1a72366bf2e5ed1f1906fc31e97c52 |     
    arm      |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/5f9f6c78af669c59e5bdba7b3bb4c98079e0195d |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a8af51cf89782f2b237fb0618bd79a713f031d32 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/4b524ffd58a0651120b04b316da389949275caf2 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/aabb40689e2d2131eb331efa4bd8d36e1e15b921 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/875796a5255bfe5a290ea1f1a04546075232c06b | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/975c6d613380bfe56e19cfd700cf47edc3ae6a05 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/13163a70660039d5d84a1d28ca636b55c57a0ab5 |     
powerpc64le  |        host-4th-3.64.1         | NOK | http://autobuild.buildroot.net/results/894f365a6cba896398842c154e82d67d0a12a339 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/ff957b5db4035109892b266390ddd054d0a11241 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2695b278c93954e2136130679d5742b728cad191 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3259748291e3ae29b90f9ccfb9a6f940fcbcfec7 |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/5600e41d8be52d4ec01b7657e51728bdd5a010ab |     
  riscv64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6320dcc655f1871eb8bf6a9689bddde7447385f5 |     
    m68k     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/4309aa2b1db455ea78f8331f56c15333d4807963 |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/044ba4d6999dcf5aedb7ad5694bf148753930147 |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/180daaab7582978947ecbca68434ffb659b45fca |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/cdae1954ab60a6bdf4205b62b844aac02ed154b8 |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1ca2e52ed721fd6624ff2c19feb68ca7d7a85684 |     
    m68k     |    host-gcc-initial-12.1.0     | NOK | http://autobuild.buildroot.net/results/997753add98da87fabed1f40ca54efa64b5eada5 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c0b7383d30dddd0b22093501c7de238b14e99dcc | ORPH
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/bb9eb916b85fffa8838d5688e7b7a7a6ce07518f |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/1fca05dff4054d7c3cc5e93d1595523a0e492ef7 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/adf6e0fbd4eb3861886dd666e757c11b23c72d16 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/063edd9ceea62339d34238bd04e7898718aed992 |     
    i586     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/21651be2afcfd9e8286f015c54c0bba994c5bbc9 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/5564cd17beedfa0485de89c97c23c73f5ec9a591 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/42adb0fd05371cccce1b701e3de7997bb6d1d46b |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a4e89d9fd6aad7fd6781d4706eaf294f575c24ce |     
   sparc     |         host-isl-0.24          | NOK | http://autobuild.buildroot.net/results/e825cca123637336236beee1462e157f49c816bd | ORPH
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cbf3bf7c66b5cd759bf1b40a7b2c72f1cf063503 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f4beeb7fb6becdc80508b5632a4f8933822cc2c6 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1348e1ee618ccb36ea56d8b578479749747e4285 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3831097724f63f2498f6a4895086162b0bfb9b39 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bc28cd5dacb97d24e1ea6be0af99113072a031d0 |     
    mips     |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/e65c5d4d53fded578be7d0f6dae240b031e29252 |     
    arm      |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/826750fdeba00a22e53149922199baf4503495de |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/2ce092acb04b1483a21144c45b22de1b7220226c |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/1725ea25dc9ef6b7b153eb31e64c7627914302bc |     
    arm      |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/51d9aa16edcf184c9518e4bf5667f2b59eaf67ef |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/5b765bfb7f190ce21f283d4ea3876efa9ab35036 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/ea0e8bc3dbf354657a21c0a7c03cb0a6e0e987e8 |     
   armeb     |       host-systemd-250.4       | NOK | http://autobuild.buildroot.net/results/3d4bf440978019d0eee6810a9c584717980f5108 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/661c51ee363dc5696543543b1b1127d7db6e3a6c | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/77f3e772417cd9052bfc1a9f3f1b002227c148c7 | ORPH
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/6675adf11343412a91e57012e07fc634d19bb1b2 |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/a51f7cff45d39fe816c6f73056d3ff1b30786bdb |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/2a13e35eaa519668a9b5d2a8adeb413449f16bcb |     
powerpc64le  |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/02ff1b6c461bd0044262049c9e6124c5903e1122 |     
  sparc64    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/3cdb79d949ddc032911f76cadf3f58bd432f4da8 |     
   s390x     |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/b0cc63ca05ed7227c226e424353fa44e271207a3 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a098650187884e8510c3c3e0d3eca0ce1523c1eb |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/a35b9be80b7057db3df5b66f24c4db3bce4088e9 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/05901d624c493d839ffad3a39561e43f72776827 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/f01bb3625b76bb243fbab585ca4b8a9576304593 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/81e6d5bd596c0503eb64e650cbba313a3891984f |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3dce15b5c7061dfcf0f65f154ff5b62851bf8066 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b9284b4a63ac1c35ea455c46907d43ff9d4087e9 |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/451889ac24f283ba56e46f82e3cad7cd3ba911d0 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3be9e50961bb4918939a61bd2f91676ca11837ac |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/631a851ea0f4525572e2b15dae2fc9adc7a543da |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/85e9d86ebf8fff3821840b9fecb55df2bac527d5 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8ae5303e558c70f1afdef302171355bc3bb5d904 |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/322070c8954c6d42f282f617d0112985db79f1e5 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/462bf583a73097bae97d5c664724444901b59c77 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9c37610df2a4760ebed0c39ed1bb77dd2936519e |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e7d18fd17c786098de88b0d18887cf4faeeb1932 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1d5c49f2189079fba7e005d16e598699374f4493 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/20a51dfac47e47125e4855cc604b1d3b35101d6b | ORPH
  aarch64    |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/ff7fccd4a58991f09b362e06cc5ba0c47667338d |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/995a88e33ec8c7156e3b3d9f44a567b87fe2048c |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/628f4342573bf5b561dab68c8515c0db006e450d |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/3c435f79507fa392ffed834c2087a2249d62f28a |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/9ead206bdf613505238161059691469dc6b567c7 |     
    arm      |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/e0c3c6fd741078beb21ede5852606b2d5f82845d | ORPH
  mips64el   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/021bc26b72f06536a432da993482bbb3942cf9e1 | ORPH
   s390x     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/f669bfdc7f0c4b83d2a7835914209bfafe0985c6 | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/d86badc019b8d2839a94f132defc9b3b5c86e80a | ORPH
    sh4      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/40881cea6f726a0bd0f0592cc7966cf44db7a513 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0c43ce5cfc7f7150da0674839b15842f9258f299 | ORPH
microblazeel |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5c312650907c37aec0a52ebcb2425db2e7889b34 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/15fd1620990220ef973d5eeb678862e44982f90e | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6167aeff8364cb4b295bc54cd7e28342d106d4b0 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b0df87028a101d28fd70c1c1d1b9fc661dfe8312 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/93f48cf710aa8725f78203bda2d3a8739f5761b7 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/dd7e90df7e921e0b8a79e77b3d6f3d5ef15bd578 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/75973654c69304f08be56a17877181f40a404cbe | ORPH
   nios2     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/341782763ebe38da443f72ea414e26372b15b590 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/54db01e09a4c41024ed6245b175de2b4489de8f7 | ORPH
microblazeel |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/9b5dce4958b602c80140440addb1f072332e53c2 | ORPH
   x86_64    |         mesa3d-22.1.4          | NOK | http://autobuild.buildroot.net/results/e2ebc9a73ed421aa6be44fe41bb5224cc12f699d |     
   x86_64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/656a43479beb18d23e412ef0581c7b50ddce2125 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/34c544eaef0cdff06ccbf88bb1cb095f3ef6111a |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4ac9ccb771e259aa9e012bf4c9e8f7d68a25b7aa |     
  riscv64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/ef6ced469d65a6e454f60563a056e58f6f31a978 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/3265eff4a20ae1151f65831504145f8f6b27e50a |     
   arceb     |       nilfs-utils-2.2.9        | NOK | http://autobuild.buildroot.net/results/bf63daf801539060c29bcde75e9d203c0a67b26d |     
  aarch64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/379375e76e9e6008b91bcb41c4f71bb7a6d48a83 | ORPH
 aarch64_be  |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/81a5a4eed348b78b8174ea65fa259b3d9444e5be | ORPH
   mipsel    |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/099de9376fc0ae7bce2c37407737b23938b7f200 |     
   mips64    |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/97d7ab7e6de1e637d9a1ffa9d4edb65dcfa62b3b | ORPH
  riscv32    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/da2c62fdf0161e2b019be393fb21f3a8623de2c5 |     
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/591f5813dd0cd145d4cab969fa8583aceea4a87f |     
   xtensa    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/d8628985beabb272f8a400f19716fdc2e7707956 |     
    arm      |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/2dd3919c35c1173a94ffca67f243dac362312a8d |     
   mips64    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/4f6878c351d3071235ee585de87d138160581570 |     
   x86_64    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/97ead40e4bbcd8e0dfeab53f1ff31fc43d778296 |     
 powerpc64   |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/7b50ab363c174636fb27d554223287d7496676ed |     
   sparc     |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/6dc5baa2cfb037431b9ede9f2e0c5705957ee3bf |     
   sh4eb     |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/20bd33684c7a66845e1ec4e96155b7a873282d12 |     
    arc      |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/236bf1ef93239bf54b59be79e33a13c07900e1bb |     
  sparc64    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/c4733800147595173da83da82ea6d1149dbe636a |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/f94939ff953559fb23daf2edc357ebb070c60900 | ORPH
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/07810506253159a114c3d24660e08f942680cf7f |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/36621913f0ecf302ce369a124e32b6058c8e6f85 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2ad982561f3f59d4d1324cc00de68f64a0a786af |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1d2e1a083bf710c2d79e730a2239af06a80417dc |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5f4d9fda7871c985585eb2711a24f53d1283d59a |     
    sh4      |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/e35aae918a11d2cf13a79e235dbe63143ba006f1 |     
    sh4      |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/bb37f3d5275c64e773eeec260fff370bcc2f0403 |     
    arm      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f55a2dd3f75a46103b515fd5c880078599abd921 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c97cf711e44f021fa3f0322b283334320d47dcaf |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cddce7f4e508709f5a99f866407f8065d4fa0450 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4d1bdfdaf05f333fe8fda51764459dcf99ef0f54 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/611ae3af4d7054ba92aa9c6cc0e58d973722d0b1 |     
   arceb     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0f610643d894043ad1e814285bdb71f452cb4768 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c84fb0608f37e47ed8ff6a2108c17b5ba2b7f29f |     
    arc      |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/9f22128b25c39c471b61999941824ee6bd2ff63d |     
    arc      |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/d0b81c8615b46305cfc7a1c865273750014ad8ff |     
powerpc64le  |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/c33c6a95ba32d6ad40629f431ba5270bd4f024bf |     
   s390x     |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/e2436592a085fbf7fcd3ffa452a7f045101de69d |     
   xtensa    |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/f6e8294d27c1a5fcc555f31ea3441e7bb1d6a3a5 |     
  aarch64    |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/8e1ad18a4a17554a441bd6188f7f0450609707de |     
   mipsel    |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/127b87f97eb5517cd0a513289768a599081c15c9 |     
 powerpc64   |        pulseaudio-16.1         | NOK | http://autobuild.buildroot.net/results/6526a21bd4da3b8458188f27c1ec04c381e4b673 |     
    mips     |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/0db11ac77db0e77e69cc2976acb409c57ae7ab4f |     
    mips     |      python-orjson-3.7.7       | NOK | http://autobuild.buildroot.net/results/5c198e78937d99eafbd2c4310b8915ec37a98966 |     
    arm      |  python-pycryptodomex-3.15.0   | NOK | http://autobuild.buildroot.net/results/d817c48c68628d81dc50637685d297a4ec5eccfd |     
   arceb     |         python3-3.10.5         | NOK | http://autobuild.buildroot.net/results/02ec5b83fd0ccfffde2d6c658ea5a4188d02d8cb |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/745ce6c879f16f3f7bbdee36da9e4432d088c29c |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d38e471a3885db6fe893555107af27cfd93dce3e |     
    arm      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/2a6a62632ffd3522859ea4aae8f43dc2bcdbce81 |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d2674cf3688cc67c232ea801281e36d4e574772e |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/7e9eb33e57b42564f10e9a8f955920c566e19ff9 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b142a0d90c82469258ec4b9fa5353eaed160ad98 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/93963f7a5ff825604ffb20ebf0eef3d7d73de419 |     
    arc      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/2c33b1c00069b5ebf267df714b777a2861f2b986 |     
    or1k     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/c145fe4c87eead960ef655c530a6030a37d55253 |     
 powerpc64   | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/d24e051d3d5f82319820a9caffba7830bda9e636 |     
microblazeel | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/e3a61c5f5992a86333838800fc1d6ef29b95cf33 | ORPH
   xtensa    | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/1ba127d12ecf2eb3efec0ae8ff4f6581b78f972b | ORPH
    sh4      | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/7bcd5a96f182a861613ee435db1cd0062df408e9 |     
 powerpc64   | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/68a0fdac053c0dde74c53cad0666d030b33d31d7 |     
 aarch64_be  | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/74367215ee63dec93611f191cf371a5b9564e229 |     
microblazeel |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/56ebc6b4867ec2a9fd159b0061bb25e9b86a012b |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/72361bc253c31864c26292574e3f1a419d6d577d | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/63e6f53a57f522693797d94b658bd6912c984788 | ORPH
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/819e8234d3ec1a2e3252221d500412740d65cf13 | ORPH
   mips64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/9a020a03248beacb3b89968c83ed6b296323b79f | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c5539f5da64f3f4c6f55d1a87c018d452fbf589b | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/07dc53eb74f09a649d787e2bf3ecec3129dfa613 | ORPH
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/52d85e4ba8dc048fdefd4f370e73635ed106d218 | ORPH
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/15843a53a9881d6b22082986bebac38fa9f6de78 | ORPH
    or1k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/eb8a5b1ea51c81565d9a5c59051274b8764d05cd | ORPH
   x86_64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/d79658018d6076aa0a4c27cb67fb091da5338c5e | ORPH
    m68k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a8f7be1ee6660e69a63e6612cf5ef2d00e3d64bc | ORPH
   xtensa    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/dd7849f0930b7d836897eb37107f9bfb0b40c8c5 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/0bfc97cfb0803c0d84ed6293f65cdbd474f95532 | ORPH
    or1k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/cabb2c8526f56b591fa227a81d91434fc2fa0bcf | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/0c02602f0a1389d2f48c2a866b17ab6453f382e0 | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/90d574eb5a30a4e31612bbc5c7c946aa46278d58 | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a7ff5686cd8f1f9337f7734658198a1dff24d5a1 | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a02a13a916adb36cd03106acc3c6cce21ee94844 | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/48db8880eec51ba15ada9d4b452e9b21de3b672e | ORPH
  aarch64    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/1577f59e95fee7e89fe1fd583696a8b1e4763827 | ORPH
   sparc     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/f6a07edbd8abd63732da9262c35375e40a8d4083 |     
  powerpc    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/b5c746585a528dee4bf13a55fe300fd6141ff63f |     
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/01e4c7f84a454f38808e64965edac56e3cfbeb80 |     
    m68k     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/3f67bcb365ed25efcd4363755cabdce833cf5e09 |     
   x86_64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/6d77ef3dbffa2617163518139db0f79b4049ae9b | ORPH
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f47682e7cb6aa3337101adccc08cc30093bfffa8 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/924e6c4f758bed78cf043b14e5fb0fc9d93872c5 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c49b430f599ae676290994f23b42ff681336f7a4 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ae107099af3081bf8adee00b8e0ec66c3188442b |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1cf787b3a542492dc904581815489cc6a4032298 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dee23ae0fd7df971e68764f0ab67aea4cc0239a5 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2d387c366f200d4554e535084b0480c40ac0eab1 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/11bbfa0e9ad824bcd05a59e88b11f1d383e5481a |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/da2cc373b4a43825bdf79909eb3734e91f61db4d |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/f2b92ec8469f4058f3e4fa308c88b4e0aab87122 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/510f77be3173a5407629c9e0858f6c809cae1646 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0e054b5e4c989863127812bfa5260d38e70e82ff |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d1abd0f4f29c5b31a9115d60b5bcdacbd95cb026 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a77e29a6841f107dc7900c54a9998b324624ab2f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5e84b69ff5ead91d8fcd9b594ee3d234c5ec8669 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/983568471f1479b8e072dbaaf3b256e1f0acc528 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bd11a6a70bde02cbae705bb4c3304197717356f8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9c1cada8a931d65a4303fcd755b1a1583725cc61 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/90b6663eccd788ce62eec74cb741d158f3e149f3 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/95797b37a6cdbb30940e07181f6702829b8c5fbb |     
    m68k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/87a1779f226fb80f74353a12090e0f41e655af13 |     
   x86_64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/b5bfb66ab259881e6d897763ee3972c9523b2d48 |     
  powerpc    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/38fb4e178d25aab8f3ba9e0ead96ebbfdd6b070c |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/f38efc3f5521c9c1b7c3b8869390b955d1363439 | ORPH
    arm      |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/08eac247b8cb26e826ec2b7eb554df164c9c2e3f |     
   mips64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/a499e81c96ad05e4f3c399d2fc78f634611886cf |     
    sh4      |            xenomai             | NOK | http://autobuild.buildroot.net/results/496d6e5dec41fa9fca223b4db5cf22c79c071707 |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/a4c5162d03fc62129c964a172d5e329e4269b68e |     
 powerpc64   |            xenomai             | NOK | http://autobuild.buildroot.net/results/89eda0203621ae92e7791e475241f7483a9e2158 |     
  powerpc    |            xenomai             | NOK | http://autobuild.buildroot.net/results/c1690e174688c8b0f6473755a3fe19da20145297 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/0ebccd1b4400773810cd32ee370dc6f89107a01b | ORPH
  mips64el   |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/1d8f64884614648307a0d79085edb8b5ea05cb8f | ORPH
    arm      |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/6f654e4e8450467640b5404ba984b96588a5d42e |     
    arm      |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/57742c0ae46d2570789a49a11534666898442265 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3a466365402edcc108ee543dcce1d11e2dded632 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/917b24d3bf9c2c5a30689f2a96f7b742d9ca8f67 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/b62e35f0ebdd2f11d93b77b0f91f960e8f33b302 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/a51c6a59e2e8c37cc1c9fa717bfa8632534cd5a4 |     
   mipsel    |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/dd1974dbc1a22a96a3cedb117417e66119821514 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       unknown | 2 
                       frr-8.1 | 1 
                sg3_utils-1.47 | 1 
                   tor-0.4.7.8 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/470566563bff7ed87457b60738085fb51644c488 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/d825618e2219f48e0c1024af4d883fa675f6a0a6 |     
   xtensa    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/02db2cef7d7cf8054a213b5ec0ed14f076f5b74b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fb5a2f4053665d2ef064c3383f43e3aaddf359e2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/dce22d2c0d04d051b72e0fd123fb86f133b1984e |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                libcurl-7.84.0 | 2 
               protobuf-3.20.1 | 2 
                   tor-0.4.7.8 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
               acpica-20200717 | 1 
                  acpid-2.0.33 | 1 
           docker-cli-20.10.14 | 1 
                  exempi-2.6.1 | 1 
                     host-mono | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.60.0 | 1 
             libopenssl-1.1.1p | 1 
                 pixman-0.40.0 | 1 
rpi-userland-14b90ff9d9f031... | 1 
                 wavemon-0.9.4 | 1 
                xenomai-custom | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e131492db8cf14590e608496d93ef5dc0491fcf0 |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/0998a21cfe7f9b788999f6d64b597cf68705c317 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/3afb92d80e7dbe057bb36c605b5cf94bb6d0fb3c | ORPH
  aarch64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/603a23d741290a407c5b8c859ec255266b6ef951 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8f3d16429655f60bb8ffc0c81e3531ccab5eb4d8 |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/635a56a78ebdadae5db3e8a915e98fae154115df |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a430b6b92dfbf4f027f8b96a7d58eb5c1101f63e |     
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/3a32f7d12cd1c54cccb828cd603f7e3fc8bc900c |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/42bd6746001bf8cbb6a33738269e8bb14d281532 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d99b59437bccc60301baf8c8aa477c82e8a30de5 |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/a0e8606aae48a6761c788c9086536573247eeaaa |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cf5247723d3708261349aed12c0bccfd05d59b7d |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/844ded0ec51d544927ad24049d50f46feb129036 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/05b0db627725c6fab145f4ef9eb8a39dc86d6b8a |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/2a14b858f78bf9e9f74d56f9dc55b6575031f21f |     
    i686     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/bfeff10bac261b6a88560a9d66217aa62ef1a218 |     
   s390x     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/35e4b8754c86f881eeca2586bfaa1c20bd0cdb51 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/ef4e43380ed17ee6ecc50bd33f163e2b8af6855b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/7d51a2567c1ca524839d42c0dae2215f8bb42aff |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/08f51845353b6cfe718420f458134115df5c1914 |     
   mips64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/1985cfa5fe2c732683766bcaff73d40a24c19203 |     


Gitlab CI results for 2022-07-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703449  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703451  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703407  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703385  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703386  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703456  | ORPH 
  TestGdbHostGdbserver11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703463  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703467  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703367  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703374  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703473  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703439  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703440  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703442  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703443  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703418  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703420  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703493  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703532  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703537  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703549  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703569  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703579  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703585  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703593  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703590  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703596  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703598  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703601  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703602  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703613  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703618  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703620  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703621  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703624  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703626  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703631  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703643  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703387  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703396  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703379  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/2763703670  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
