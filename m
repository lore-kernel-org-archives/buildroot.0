Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705B8C28D13
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 05:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C556040C0D;
	Thu, 25 Aug 2022 05:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C556040C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkEFSXIJnR_n; Thu, 25 Aug 2022 05:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50CA640498;
	Thu, 25 Aug 2022 05:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50CA640498
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C88AB1BF2B5
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 05:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B41260BC6
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 05:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B41260BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1U1XHj4yqT0 for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 05:46:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C464D60B4E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C464D60B4E
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 05:46:49 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A0F174000C
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 05:46:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 25 Aug 2022 05:46:46 -0000
Message-Id: <20220825054653.4B41260BC6@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1661406406; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fjhpQeVecnhA8E2TU+dYLt/mir0hesD+bPfIQCKvNeQ=;
 b=k9UkbXHvFVmFmPYNi3M5tA7qUUlM1nsTZ7Wa/uIVMyD91u/SuhGQ2nrnZPnzU7qSv7vssx
 pPbBnCQRtUJ14eca0TSYK0IssPu+hYray3XkQN1E+VcRZElWoyKOkUFIzZy1KRcv0rER9h
 9I+Grr3L01TvNdyl/GYUyzPJvCvVLBimukLh4YUT4kocrQP+2N1uZFaQyMmszx5kwRlZHY
 1lbLdGgpGLwMQHcp+4Y3QZonS1x7FvOXTEaQ651FJATs8Wa4j1SboLt3PfQVgS9maIw2pl
 GOySI6adgsvNMPms5RzbnIbnpGS/dWNsCH7s5JX/wXGY2sSUBLsz1+rkR4pu3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k9UkbXHv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-08-24
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

Autobuild statistics for 2022-08-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 10  |  5  |  0  | 15  |
  2022.05.x  | 37  | 24  |  0  | 61  |
    master   | 263 | 335 |  0  | 598 |

Classification of failures by reason for master
-----------------------------------------------

                    wipe-2.3.1 | 32
                   thttpd-2.29 | 21
                host-go-1.18.5 | 13
                 linux-5.17.15 | 13
                 pixman-0.40.0 | 12
                 uclibc-1.0.42 | 12
               libglib2-2.72.3 | 10
                speexdsp-1.2.1 | 10
                       unknown | 9 
host-pahole-73383b3a39afe86... | 8 
              host-rust-1.62.0 | 7 
                   perl-5.34.1 | 7 
  gobject-introspection-1.70.0 | 6 
                     aufs-util | 5 
             libopenssl-1.1.1q | 5 
                     frr-8.2.2 | 4 
            igh-ethercat-1.5.2 | 4 
            ocf-linux-20120127 | 4 
dahdi-linux-5c840cf43838e06... | 3 
                 dash-0.5.11.5 | 3 
                gerbera-1.10.0 | 3 
host-spirv-llvm-translator-... | 3 
libcamera-ba6435930f08e802c... | 3 
              libgcrypt-1.10.1 | 3 
             libgpg-error-1.45 | 3 
               libgpgme-1.17.1 | 3 
                   speex-1.2.1 | 3 
               valgrind-3.19.0 | 3 
                wtfutil-0.41.0 | 3 
                bitcoin-0.21.2 | 2 
                    dust-0.8.1 | 2 
                  exempi-2.6.1 | 2 
       freeradius-server-3.2.0 | 2 
gummiboot-2bcd919c681c952eb... | 2 
              host-delve-1.8.0 | 2 
host-python-pycryptodomex-3... | 2 
               libvorbis-1.3.7 | 2 
       linux-5.10.109-cip5-rt4 | 2 
          lttng-modules-2.13.1 | 2 
                 mesa3d-22.1.6 | 2 
                mongodb-4.2.18 | 2 
                    mutt-2.2.6 | 2 
                nodejs-16.16.0 | 2 
              open62541-v1.3.2 | 2 
                 openssh-9.0p1 | 2 
               poppler-21.12.0 | 2 
                     pv-1.6.20 | 2 
rtl8723bu-19b4bdc05483a1e79... | 2 
                 systemd-250.4 | 2 
                tealdeer-1.5.0 | 2 
                xenomai-3.0.10 | 2 
                    zeek-4.1.1 | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                  bcg729-1.1.1 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2020.09-release | 1 
             bluez5_utils-5.64 | 1 
            compiler-rt-11.1.0 | 1 
                 coremark-1.01 | 1 
           crucible-2022.05.25 | 1 
                 dc3dd-7.2.641 | 1 
                    dhcp-4.4.3 | 1 
           docker-cli-20.10.17 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
              dropbear-2022.82 | 1 
                elfutils-0.186 | 1 
              fconfig-20080329 | 1 
                     file-5.41 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gamin-0.1.10 | 1 
          gitlab-runner-14.5.1 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
google-material-design-icon... | 1 
host-gdb-arc-2020.09-releas... | 1 
host-google-breakpad-c85eb4... | 1 
               host-runc-1.1.3 | 1 
            host-systemd-250.4 | 1 
                       iw-5.16 | 1 
              jpeg-turbo-2.1.3 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.24 | 1 
                   libao-1.2.0 | 1 
              libblockdev-2.26 | 1 
                  libffi-3.4.2 | 1 
                 libglfw-3.3.6 | 1 
                libmdbx-0.11.8 | 1 
           linux-5.10.115-cip7 | 1 
        ltp-testsuite-20220527 | 1 
            lttng-tools-2.13.2 | 1 
               mariadb-10.3.35 | 1 
                  matio-1.5.22 | 1 
                  mender-3.3.0 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.5 | 1 
                  ntp-4.2.8p15 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.20 | 1 
             openlayers-6.14.1 | 1 
                 opensc-0.22.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                     php-8.1.9 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                 protobuf-21.4 | 1 
         python-greenlet-1.1.2 | 1 
           python-numpy-1.21.2 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                  reaver-1.6.6 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                 rtptools-1.22 | 1 
     s6-portable-utils-2.2.3.2 | 1 
               snort3-3.1.18.0 | 1 
               tcf-agent-1.7.0 | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.12.5 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/57aeb3380b09187846ae24c77d0b084c9b6329e7 |     
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/07212ef194cee45a155e8c3badc441b9b2a5f777 |     
powerpc64le  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/db6c0df150ca7c1515ce49636ac3e8944e567327 |     
   xtensa    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/dd30f07f817dedea55d50d57b5fe8666ee340c13 |     
    i686     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/6b579316424102b3bc23a529dd1f835731dddfbc |     
    arc      |           aufs-util            | NOK | http://autobuild.buildroot.net/results/107bd8843eb595a40d98ae898a3e12cd900fcbea |     
   mips64    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/24911815fc9b45284821b8e0523a0a4d0c9ab251 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/98c39195811c16f8145b3a588ed45ef041b8867a |     
  riscv64    |          bcg729-1.1.1          | NOK | http://autobuild.buildroot.net/results/25f61c73387f8247608a11d65bd8152d41c9eaa4 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/9d8ba39ad02c65cba7d44f2951caa1e9c7a2f4d9 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/ae241ccff5a0f16a06010d350164a8be62ca7c0b |     
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/9cc801bec146afc67c578615ea8c75b6bdfd0f8f |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/78006a21a0751cccf6004069f3c04cd7921b3d11 |     
   sh4eb     |       bluez5_utils-5.64        | NOK | http://autobuild.buildroot.net/results/74eb5aa6ce22dfc14205483dc6656702e2c7da77 |     
  riscv32    |       compiler-rt-11.1.0       | NOK | http://autobuild.buildroot.net/results/04a3b46ce94c30ca1188350177117d182436aac1 |     
   armeb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/4342689b14b58a38586fed1b4b198ed7d008d426 |     
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/4b64432fceef2a3f2909bddd8230df6fac1a5f74 |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c3452d0b36b89a19e7f0d7c625d9a2d4ae07d1b0 |     
   sh4eb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/afcea25e009b92198dc1e427edc58521c37d34f9 |     
  riscv32    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/99f0bb3d1fae6cd717b777649b466d5cbb795ff7 |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e547bfc710aad06878f692f863d27b89f1609c04 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1b62f841a2f15418d57d0485e2ea80d4e4521ad2 | ORPH
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e2711dce63863c3f5b267a8becf7af2204b47fe2 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6b6e01f2688e226b00e659350b49ff306bd5974e | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/b028a9b539bf2b7487bace2c5823b21a7bd49fdd | ORPH
   s390x     |      docker-cli-20.10.17       | NOK | http://autobuild.buildroot.net/results/baccc044cb6b309945280d9512bf4e735607aa91 |     
    i686     | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/66452c7719b1be8b4a4addd95ef88dcfaa061364 |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/aec0c457c47ece06cf4bf455a17309146164e38b |     
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/25d2b6f0ccc890bd58231c3414e7e24c3b29b8cb |     
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/18240713032be387a519ce215c56265c4e47995e |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1f1f2fa111a698132d26f3791388c51701f32210 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2ddc1fb9048594661b350800d0df9028d6aec283 |     
   armeb     |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/79f70b9d1a380f7652f27df088dbc17c450b9d39 |     
   x86_64    |        fconfig-20080329        | NOK | http://autobuild.buildroot.net/results/b3c5b4edc1aba563fff2e23301c61b60f3f24cf4 | ORPH
    i686     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/d4288181624e647e3f4fdaec9b56974ebaf4e3c3 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9850452d76801cca36095849513ccaadd502ba94 | ORPH
  powerpc    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/9657293e03934390cdbddd4e23215b595aa56686 |     
 aarch64_be  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/868c9b982507ec528f444691a56ad47b64f8bb63 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/e9f780d2aab09d011cc3377cef7b4200756cb8e7 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/271baf9dda41794dad63f4b4de9702b3976636d6 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d79df6c17ae5ade546300d2fd12babfb4349c08a |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/9497f1eacdcb65de163496a0240f4729cc2464cd |     
    mips     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/ee3748ea1036219312d6eff3f41299e0a29ecdcd |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f63b7c1d7aeb416a3d59dea3051cf3db876efa9a |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/241b4cc50983915804445d9742502cee0dcf8ea8 |     
   s390x     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/95e2227ddab84339a819caf7aa3dffa9ed297892 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/97a9b0d5711b54b61e298e348e3b3902c64a5ec1 |     
   xtensa    |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/ad59acd4dc0de9f452dd009cbdf2562ebf4ff986 | ORPH
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c0aa67546a061ec3edfb06e9407de8a551379faa |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8c294eb84557602504eaa12214918ebbfbac69ab |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/24d2e8f93f17395807d1edfccd29149cc712ea66 |     
   x86_64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/34ff870b24d7aa70635eee4be386442be12d6c8c |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/d80ebda093328c8b99758ffd934cc6744b5add3d |     
    mips     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/688c7b200bb88559da77bc8903c73a7defa9249f | ORPH
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/39ac9583cfa9382786d9389500c6f42013a38a4c | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/be7d944e0e0a50265382bb6640c26c0f8c78782b | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/6d40e17701a0c1cdd5ae13e473f47bd89dbbf181 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/e9f12a8aaac567f1a3481edd33f4e207e329ee2f | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/e7aeee4e949be282e11c0daf6193703aa67fb625 | ORPH
  sparc64    | google-material-design-icon... | NOK | http://autobuild.buildroot.net/results/3d2f6df31bb44fd678a05f5b133e234c528f2b07 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/474c7a12a046225c9c135d261c7ae22dac4c9de1 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/4666a9e1f58db3e41682550581f3d28a331c64b9 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/200ea7bda0822c9bb4a29079cd252d2502142b8d |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/c59522bed323cd9e139480060f1a516595d4f385 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e0783355d2964127e1ec15f1ab8ede48e5deabb1 | ORPH
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/dd3fcd0900429d81273084cca7e18e0eea28d877 |     
  aarch64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/06e9dc8424608be49121031957f71f9079aed454 |     
    i586     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/08e4198445faaf56fe0cfc0d9c2bc7cf8e831735 |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/fafd5c553ea14240b82a7305916bc63102a02204 |     
    i686     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/bc93906cf2497999fdcf108224429a1d1a4055d2 |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/36af327b4e3b898647c6958ce15dbaf9e421a1cc |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/fa321ee36b48d21bb050a6c654585044a8f40b59 |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/b2f2f3966e9f56b8a493f2418b72f39d3c49787f |     
powerpc64le  |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/2f2c6fe2559a476c6b2211356b2495ce8a3364bf |     
  mips64el   |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/bfefd2c44188d18f14d8386626ce13a45f8f3d9a |     
    i686     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/f9108eed65c3fed72f2e95c5a22f7cc3319bbc0c |     
    i686     |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/bffe8f588e5d55a916652e0651210cdb434c75f0 |     
   mips64    |         host-go-1.18.5         | NOK | http://autobuild.buildroot.net/results/d8971171ca612cac59370da5278ad2d2117a5c27 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/4d963a9f7cea65d94c8e73fc3c2c9de4fca285c8 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/58c87caf6faac8156c2bddab0081b6c76816d712 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a74e1e0e3b7a2271dfaa114be3d7e0de8620a8e9 |     
    i686     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ddde6e82b3875ef5215c3128c5e29123b520258e |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/59cec565585d85095a6bc23c602846dfaf37b2c2 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/40d629299d0e61b8a2bb1ec43d7ead04a99a0b62 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e72afbcab2861750d446d4165d69926aa7f30bb0 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/dfbd3718909991ca1aa636a5566f7f44bd3146b0 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cdc0d56b17b8dea234c3a3f36d8af7e99f50a96e |     
  aarch64    | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/ae54ebaaf47d9a55b175c885444d60f6a8e4891b |     
  mips64el   | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/56cc04bbfdf2b1103b7d7f72a41e6ab99a5a40bc |     
   x86_64    |        host-runc-1.1.3         | NOK | http://autobuild.buildroot.net/results/b741a00eee671c9f61df994be8b5373c718f2b2e |     
   armeb     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e70ffa1bc13f1951afc786e70627dd969354129d |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/db5fb469ba1201e2f1c56b09321bd179362097fc |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/90d9ac7e78dd861e9443acb1dbbd7367860d3347 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/368537a6fdeb1794999e398319d12df7ac71b480 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/c9021437634552fb90722449454ae09a1f8ab765 |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/0b7753de5e2b1d7310cae758865cda8d8d3a2bc8 |     
    mips     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/c1e8cfc734696924388fb4b9e5f46c3aa9b5317b |     
    i486     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/60782b91c7e82a46c5c70002f98754ef6cda886f | ORPH
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/7155ec172971bc4b64293d16d2a2536f44dd40d0 | ORPH
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/f760989aa8de2a28807baa2da5d8798f103d5479 | ORPH
   s390x     |       host-systemd-250.4       | NOK | http://autobuild.buildroot.net/results/41d20fd835db6b0674b4b6a0e9480484036fb08c |     
    arc      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/b56f3ed9b2bc8f031f128b266c2b6f37fb8f0bb8 |     
  riscv32    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/7964809a59d1f9e64efa6c20729011db46f4118d |     
    mips     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/89d096006839f32a3d03786e69e51ec3c5ea70f6 |     
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/63ee539be8821e567ef19ad87182d64ba6f46e29 |     
    m68k     |            iw-5.16             | NOK | http://autobuild.buildroot.net/results/fb0cb6df2bc30a607454264c6ba36beb4e2e1f37 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/be0457298bd7b6764e55741b155b8516e171a509 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/efda2ad2355d5a1fd8e3a000235429271c01cc71 |     
    sh4      |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/3851179c7b13ff2bda0ebead7295cd00b52b6f8c | ORPH
   armeb     |          libao-1.2.0           | NOK | http://autobuild.buildroot.net/results/c5de662fdfd83d948bbc15ca8ab33de72dded183 | ORPH
    sh4      |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/629ede4ca5ded004bb09219e3a9a6632a2d73f1d | ORPH
    arm      | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/958dd8e76ac0d82548dffd9f8da05c95414962bd |     
  aarch64    | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/532b75d55b86332e589bff2351fda843e7c5fb3e |     
  aarch64    | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/fb6a13f193c3f46c6f21d5725bf7b27a144fd050 |     
 aarch64_be  |          libffi-3.4.2          | NOK | http://autobuild.buildroot.net/results/7d04957bb8b3f9bf32b14b1403513eb06aca8d81 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/baa9eaf4618e738320a91f35735d6fa4747fa697 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/785e7532b1a36cbd08392e982a8f7627a5432906 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1fdc9435b8352f074d54df434c433d3dae904b3a | ORPH
  aarch64    |         libglfw-3.3.6          | NOK | http://autobuild.buildroot.net/results/0afeacce94cfbe27a70a57037b4a0115eba15741 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ba2906da6cc0acb713db08da688deca70d673f84 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/74876ac23edd425dc2f83aa4adfaa2f18ba707ad |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e972e5598a18a1a86b0c107609690d93a28a0553 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e5d1465aa6b246cd4405d9dc082634b26357fb3f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8ea89f2fd66be2ffae1745cc9ae9307fc1147f30 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/332a21eb11d71be4d534b702ccf6e37567abc49e |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/82146221a006d3f2d5db7196b699b865dfd075da |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/bd46b406843808f202f51264924d55aa7c1bce0e |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6b47f2c20b8c9ff203c4e3bf93c1d12d473d940e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/16c933de5b0e759898cf76871bc41fd0250ab8a7 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4c348db21ab4fd5628406810ba87440a01b1e3f9 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/68a8421458d07fd87050ce751d0ea7ebd4816067 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/30b7af9f4e22091f76546902f0f0db6bdfec2fcb | ORPH
    arm      |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/d8eecf0d97e0646d604fb3c1697aa387c996af43 | ORPH
    arm      |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/d066c6779fc0817bc7f050a5ad0442d37227bab7 | ORPH
    arm      |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/840a45c360cb7a75d5461015d90329b766ffdab7 | ORPH
microblazeel |         libmdbx-0.11.8         | NOK | http://autobuild.buildroot.net/results/05cda319e47da6719b1e3999b85c907a0edd2cd9 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/5dc93a73fcb08a0abbe3ebb915ef68660c45a981 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/1807008c30400e65f5bba8c6e5716df117111bf9 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/3abd6e714eddd8efc7bc09dd44581bed3901dd1a |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/ece795b3ab5d641a1012af928943bafed2e4d9d3 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/756f235c9f7df4b63882610d21569c70ec1c62fa |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/bd67fa3ad0df7bac4c3ee60f82c0ead65c43d016 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/f4887fa98deb5b0d2563d957361a2b3ea112466d |     
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/e9d4157551a3a0ef170464e9957d5b0db62d8b5a | ORPH
    or1k     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/f2da3236f911ff3da0c09b13d552593ade29868b | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/ec9fb5d3f2fc8c3843a26671989888a6b7504c7f | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8b99287ff21ec30e1e72a05ddd3330b1145f33d9 | ORPH
   xtensa    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ced98c9a63d0b68c0d234aa7f25d662466ee4b15 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/40c6721b11a96962762132ae444c6a18dc80b387 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a5ddc64ae8b872b8b124839fbc94c819f922087e | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/661f85fe5cf6d1933464d0aec0b1e27332be7ea1 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/14ae0099ab6e887d6ffd4619f5a18d591a94be13 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/70b827e65d8b345dcd5c46616d8e6c197515202e | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/91e3563876ed16ddf9e3205225044ad2f4ad8f68 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/04a1faca6343e474ff7df4541440f1ab86a4b5c0 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/507b3a5fd516c5fde088ec971b809c0151d8cf7b | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9b7328aaf577d5407b49fc57fd926c4e18dc43b9 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e6a574b65f2351b110b8aa2e4cea258e506f993b | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/660574e14175ad5f61b1b9361e90c7e87dbff21d | ORPH
   arceb     |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/4a1f30c7e3b32972a9249e613ba8f0011772a147 |     
   xtensa    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/ddd4fc1bd4d5296f6f607cc8d139c2febae73174 |     
    arc      |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/57d7446a7f95679171e80ba718a93248f98d776d |     
    i686     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/2d8ed46a4df6ce4c74c654caa5c336085103aa6f |     
    or1k     |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/2078590ec8af667a179526878a05a229fdda7864 | ORPH
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/532165e146890e8eb2a4c06c691433728b69d080 |     
  aarch64    |          mender-3.3.0          | NOK | http://autobuild.buildroot.net/results/b281e6c2069cfba1fd236548e54a4b60d00902d8 |     
    arm      |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/0b490a073a4394d3bfb4f9e1dea724884ddaa8fe |     
   x86_64    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/86cb78ed376eff5bb663b589c6924a6f110a9fc8 |     
   nios2     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/47aa48698d89eeec86537d43b79299ed5cc1ed98 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/dfbacb67d185560611413f3f3c54fa40f56b0791 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3753c3a2164ba641b0ebcc09bbc764d3ecb2415d |     
powerpc64le  |           mutt-2.2.6           | NOK | http://autobuild.buildroot.net/results/413f2a5a8f037c6eeedcf98cc66de389e8cf4f2a |     
    or1k     |           mutt-2.2.6           | NOK | http://autobuild.buildroot.net/results/da0947e237fd83148ebb0fbfc298cd0d921e3399 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/dcec1507300906ef4698c7505db3d55806378e6d | ORPH
  aarch64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/9a8142eee54fc623052f4c22d0a5a04e7bd85489 |     
   mipsel    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/ae6e6d04c5a85c161727578321d6b1950f2461fe |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/9493a2c0dde76be8e4babde65c8fb979b95e6ffa | ORPH
   sparc     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/d4299cd9369c2d3fcfc87a64bc8cec6357932aac | ORPH
  sparc64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/b81a666c1707368913969d1427c8ee4954cf53b8 | ORPH
    or1k     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/5bb8e0a35b8c137592571572fd197fb17ce5dc70 | ORPH
  aarch64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/d0960ec3f0d5676081eecf2aba782ad22f96e531 | ORPH
 aarch64_be  |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/3e762a4649e8d16f7d6f7869ef675bfcc081e433 | ORPH
   nios2     |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/55b196a4aea0f26f329960bc0ac083ec71e29ba7 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/093519e907e3290ff70fa9308608621158a6b5be |     
    i686     |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/141bf4ab5efdffd690b2678b3ea2320b61d1a135 | ORPH
 microblaze  |       openlayers-6.14.1        | NOK | http://autobuild.buildroot.net/results/d92505ee81ea7832fb75ec175933761d0f955f64 |     
  sparc64    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/45448a907dd412ca20695f093716c6821b27611e |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/0471b5120821a735396a73d7feb5d5f6940f8abb | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/153f242bb46feafebd8467f7e6476464cabe1ee1 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/d077add99ad3eb6c0fbcfd0708223ca0f2d54a4d |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7d2a64a453e6cddd78a67600bc856b993e59118e |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5e9a3551ae05c8000f8c2778f2fcba23ca76cb18 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4675def0c2b060b08e776ab56dc00982d4e85890 |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b540748592c6b0171a98aa4511dc4e64881026b6 |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/950537f003408009c6659763d57fdedf96cc2ec6 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6597dbbf00de290e960203d4301d676e14479a7e |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4c20e8c3f4314641bd328bd0eddf25be246b91a1 |     
 aarch64_be  |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/016df831db620aec4d24c47eb1a0017d54614990 |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/4ba536764bba66e30a5182ac1e173c2c8a5b6a88 | ORPH
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6580c43848e7c5f9597ee2338a8f889a6ef53253 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1fb0c670ec051378d0bf7242f9b0454161081079 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b02df5046c68cb50bf786fc3553a922f1ca8c264 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a5e936f5e43535c5fa2a97eae571c755d03904ea |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/36bd5c16c55b963cee4e466ad5496ba8bb91e471 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f5ca6848a76cb5aa8662bcca9a82000e22fd69f3 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fd3b715788ad7a89fd1c20c2ea7ab2527451132f |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cc4806a944501523e304bef086693b5064d07670 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5983d65c248e53470dda6805637b7e4ba2a6d5d2 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5d257b9be196bc91ba625b0b597c1e03f0ee3b73 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a1138a3513392b1d7365a5546900c341bed5cc17 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5efbc6e2663543740693770bb8beb06981caea78 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/abdead831411294f9da444811c1947b9591eda6e |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/e41123469cafe51113543e7769cac892422c4246 |     
    m68k     |         protobuf-21.4          | NOK | http://autobuild.buildroot.net/results/ba77d0e9cc109aa1271f09dc45a7e73e8711683f |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/9b309f8509089f16411b9d843f31e91d02d9a361 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/6429b5f5fc579714719f1c13ed298b2a8a25003d | ORPH
   mips64    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/6b1e31aaf732a895ee090f5b99bd19d40cdc5450 |     
    mips     |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/6918e77efd4a910b71fa427c3d50b8cfc8e2adc9 |     
   x86_64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/a2a4dbbbf67c3c635923e862a8b601f5bcb46d68 |     
   mipsel    | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/780ea47b7e04a304498f4d3b4ecc77330bea69fd |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/b18b64b91c8b46e0cf8c073c2c1114755df2cfc3 |     
 microblaze  | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/74ebe5602bea219a824d7f7ed1f753f4cd69758f |     
   mipsel    | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/d83d3226a6a0c65632b492022143f5dd0dcd98a4 | ORPH
    arc      | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/903f77eade2343384e7cbfd127bdca2bedf9bb6f | ORPH
 aarch64_be  | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/ccf601baf08d1d5692b9c820863de74ccb2d56e9 |     
  powerpc    |         rtptools-1.22          | NOK | http://autobuild.buildroot.net/results/1dd6cc60f2de02722f0e36d497a2d85d52cdd12c | ORPH
 microblaze  |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/d2b1b9bfa79cefb36e05b6e48bb07abb1f3df60e |     
  aarch64    |        snort3-3.1.18.0         | NOK | http://autobuild.buildroot.net/results/622f14f87a086d6069788e1d10f05010245a4cda |     
   arceb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/65495d866108c3e2f14fa71795d60499c8d1039e | ORPH
microblazeel |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a966f69c1059c13e864854af3bb045cf01b239c3 | ORPH
powerpc64le  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/738bc8e157f31ac6aabd45b645da8b78f264a00a | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b2c2d9bbb9aa22d01ad48bd052a1ccfc22531b13 | ORPH
    or1k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/5e8ab4dd693ccca810c18784107ca8dfc219c135 | ORPH
  powerpc    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/6beaec538e3cc284485b07d16c34f5c0e63d0b83 | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/41fa845cdbdae73cbcde0ebc0a0bc208aee9fc86 | ORPH
   sh4aeb    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e414bcda21d350b3f04dfbb7978645b6e22b958d | ORPH
    i686     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/8215ade2e12c3a456eccb243565bd9ae2194355e | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e826a891488a221556d514adbb362c64791f2ad3 | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/eb129894aacf21fd1c8e503e25335afffbbe7a12 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/cca1d84aba66c900060c806f7f209ca95731f8e6 | ORPH
    arm      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/0bf030adf5fd573ae1318b809aa5d4ef7f0d70b6 | ORPH
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/b6c09f2fd3fb96347b2cba127581b0f712a049a4 |     
  powerpc    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/aba9e8b6b226c668e3d7eaf260f774b04561f421 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/072f31193beb9890a700b2c29b0129c9ef771d14 |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/1c36fc7c70b1e53c270421a03c0da86fdc2ae0e5 |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/5366b097600fa21887803a001ff145db4b9f7e1b |     
   mips64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/4a0edd991eac48b39ad82302f307c0df6bc47d33 | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/beb94c1721300c9f33e00267f7a9af0194f54769 | ORPH
  sparc64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/f951587b1f4bab1aadc2ebc0a226989c0181eed5 | ORPH
   mips64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/8e4daf20096c97cc8f6d47a46f74aa86f3564d35 | ORPH
 powerpc64   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e22061351d91951a1311b1fe9024f6d1df027617 | ORPH
    i586     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2e5d7a71947707ec668b341e3bfccee2b8955b52 | ORPH
  sparc64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/02e0980929c774e3062d76090e0c5b8dc0fae5af | ORPH
 microblaze  |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2ec81011617838076c334fdb5a67cdcc9a3f49c1 | ORPH
 powerpc64   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/86683483936bd3733509cd5f1fc70a7755f092ac | ORPH
 powerpc64   |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/4cb1b6707439b65320e95dfa0d29f39e1ada81d4 | ORPH
  powerpc    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/9e03613315fe0f2cef98d696e09624e20f7b0d65 | ORPH
  riscv32    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/674f276195d0f6296674102b9f41c870aa4149aa | ORPH
   armeb     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e4ba3cba119b129ae581212dc2b110a96222a4e2 | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/3d6ba5d4e7ebaca5fea976011a3c177469f23212 | ORPH
   s390x     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/bca4891ddd04fe4145c2d7e65ddc35d96c11dc94 | ORPH
   mipsel    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/2a22acb7861e9dc95340b14d5f095440659f3f11 | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/42b09c81ed359c5c583b7bc58e6a44420a1eedce | ORPH
  aarch64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/ab3928e4f205932b0532b58286ed2237db2b63f1 | ORPH
    arc      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/e4066b969bba86e71d08cf6a69f1bfadbf5a9966 | ORPH
   sparc     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/d18db4e4602d6298ac11c249577b8a9108d0423e | ORPH
    i686     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/1eed5913d691e6e3cfc0b394a4e82e2103c65f7d | ORPH
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/12aa10a6fe49dbe673c47e41d9e98e36e6bd9288 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/34d1024be97a2776e6bc8a63f43e436f30bf6b89 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9a29a10141336d00e2ba94f47dfcd96a9640f7c8 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/1ded47a6795fd2290747f0cc10c675f31294f7e7 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/7cfcf63bda2e1dffb9d80592a42f70ad7f9c9a68 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/0420363a63bcbd1db27c98f6987a33572f49e57f |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/018ec394a773bb6f09c3e7100c465fe259371c0e |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/87d59c48eb0fb42184370eb63bbcc16dbcf0caf3 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/1407c3028c00cd76429cc587e0382a530b71be07 |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/390610a9a4f4eac1614de3e116712c08d5324fca |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/461014177f45cb691016657b4cdf769418cc11cc |     
   xtensa    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/e8877ffb43ea46d11ff71f38a195983be984c71e |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/55960c76b778f43370cd45b30316da1c00f132cd |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9eaf9fa3460e71c78054a37ee024a40c76f0bd9d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bcb4dd750cbdc9fbb21df523dd3987f5d7eaf7fa |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/bb06e97f7a01522f51604d06246669831d980109 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/700fd68ac9284ebb0da0afce84d5f217e11ce201 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/02b77a0afd39aee6cb33f4317a81a1c848daab14 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/abffb6788e8e0d8dffece133e51085656dec627a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f0eac63eac5675f7557c205604fec3812e02ed3f |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c6b5836e86b2878384b03eaf3b3f341b6859f48f |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/4d5456d4c5e6a68621a0749eb2f83ff50017eb18 |     
   sparc     |      v4l2loopback-0.12.5       | NOK | http://autobuild.buildroot.net/results/032121a64c190441f0feef034c66f72bd54c8767 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/ac776e4afe06fb004fcca74aad4080a442d6cd76 | ORPH
powerpc64le  |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/1cfc098f29ca4f7256c7896b047564c797b5f49a | ORPH
powerpc64le  |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/66549c3c588ab7ec60751c4dce85b31705f2ed4e | ORPH
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/507ef9ada4f8d7634053096df7599239a92a6cd8 | ORPH
  powerpc    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/261f56f301fe80f36a6f783f7d23464fccac2e4f | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/3f0606caa47348dcbcd51b21c5030e2445b3285c | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/ee0acaf176f8e9bba9e1729ea40ae964bdf84ed8 | ORPH
    sh4      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/761b875ef48233e1cc5a9c3e313953fa4c799fbe | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/b71c94c83a569395ade7493a985ce5dfcf7746fa | ORPH
    arc      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/cb46da7ab69cf90de81a06c20d2abe549f78a0ad | ORPH
   x86_64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/085bdd1d94bb12c16886424a67191ac9fa2d4422 | ORPH
  mips64el   |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/74144dbec2a98fe0e0d80c49e7849a11ae583951 | ORPH
  mips64el   |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/22428547f33bf6648224c451ff83d16d10389073 | ORPH
    sh4      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/7ff38512bb6d9e28452609c3742e2e4ce946fe7c | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/ad26c81675d9d1398f1888b7f0231a42ef9c88ca | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/0e9dc2413715d7e2691359e35a7a660db1c18d97 | ORPH
microblazeel |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/40e27f5be79deb727968b7db87ba2f75b8daa213 | ORPH
microblazeel |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/72588a728c6fc4411de2a9c9f5ed1fdf9f535bb3 | ORPH
   sh4aeb    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/b0df7efd8b9b8ff15f7cf0f6245d5b24d4e57d05 | ORPH
 powerpc64   |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/2a26972f2f51bde9b8c768b43963f9b900579313 | ORPH
powerpc64le  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/ff3661ad69d226c377288c615776151ef0857fbc | ORPH
    arc      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/9ecc66d9d9f91d23e4ba32289cca9c83900570b9 | ORPH
   xtensa    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/8d1e65a8e185bee0e623b54fe4a340bb1fddfc99 | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/887205b910db026768da25be2d4b7de005c4938c | ORPH
   mips64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/92041eaa65148862f7d68561c32b3e717d7618a3 | ORPH
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/030ed11d7645add323cd91445d4c0cd7bef0639a | ORPH
  sparc64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c5c551108b16daee10ead4bb74f5c4c9b59a685d | ORPH
   sh4eb     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/d46203bc2a3eb9917fc8a9aa3cbcd629085b6f61 | ORPH
 aarch64_be  |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/5ed1504686a4900769f12c33b754b8fad85e43e9 | ORPH
   x86_64    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/2e624321c6dddab7036ce518a9ce112a4d34a5ca | ORPH
    m68k     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/8ecccbffded1d15bbed35d025d16f6274755d1bf | ORPH
   nios2     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/5c912f755238d2063f418a48d822e1d8e1676041 | ORPH
   s390x     |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/4e5f95e33a1952eb85ee64dc932af2c1fe610b36 | ORPH
    arm      |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/6b6a255e7f68e84964548fe9863e6779ad39cbc5 | ORPH
  riscv32    |           wipe-2.3.1           | NOK | http://autobuild.buildroot.net/results/c3c835391b8c9aa8821b1f27a04f6246b7b0648b | ORPH
  aarch64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/22c80cbeb8fadbe85deba7a256d16c6c98800422 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/c0beab202ce6cc4c8d68323d577629167987f319 |     
   mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/90a2a5ca343e0a2c03e345b25690d7431d02d5fb |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2071e0c6abf1a489357218b992037bdbb9fa6ac3 |     
    i586     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6e346c7ed5590855b1cf9c858789010094f413fc |     
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d43e54c05337f957b47c552aa3cff61b1cdbac8a |     
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/784d17886d3859a587b8c5a033d3754700d3bf53 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/388065d807ea1dd717c3a7f978bd2708929258fa |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c33beed569f628dea40672e209765dd294c7a24d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2073ca17b1eae0926908e2f6f2e8f1db54fbd0da | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 wavemon-0.9.4 | 3 
  binutils-arc-2020.09-release | 1 
           libfreeimage-3.18.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/fc9b14971db6932998a3a4b9b3cf8236f6f0d6f0 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3c5ed4468edf1a5c92f9a348a91b8d8323222520 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cb5e556e707db2e0ddaf76dfacd61439764007a7 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0d8943c624611b920818a7119ee1529dda1214be |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8b0966fed929924b2eee11714d9aae59c1167f57 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                 linux-5.17.15 | 2 
                     refpolicy | 2 
                       unknown | 2 
                  assimp-5.2.1 | 1 
                   aubio-0.4.9 | 1 
                busybox-1.35.0 | 1 
dahdi-linux-5c840cf43838e06... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                   gstd-0.14.0 | 1 
          host-gcc-final-9.4.0 | 1 
                host-go-1.18.3 | 1 
                    libev-4.33 | 1 
                     mtd-2.1.3 | 1 
                       opensbi | 1 
               protobuf-3.20.1 | 1 
            quickjs-2021-03-27 | 1 
                 systemd-250.4 | 1 
toolchain-external-bootlin-... | 1 
                 uclibc-1.0.41 | 1 
               xfsprogs-5.14.2 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/17d02f99de0e12ab7356468ee571aafa905bfa65 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/65e207b13a522ecca79c2c91cbf8bac96ce6fbfd |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/cf7ed2482a4cc546bb5fe6ed858eb53f88903733 | ORPH
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/1fc27a5767f3db6419e5c80501f87a3fe9609428 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/acf540d14fb25cc56ce0fffe7f2825d3e2ec14b5 |     
    or1k     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/940841da7950df4a25c17978f3ac461b23fef3ac | ORPH
  riscv64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/961a5de57585a981045b1ce26d27bac709ea52ac |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/de337209d961331208f1beb612198837327caf42 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/0776fb4b0d43d78d6b7e26d41b99c25554edf30e | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/41de8cffccf3e032bb84cc55eb2cdc56af781c7f | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/16c906992c1209f9002b4ab963925fae328d07ac | ORPH
    m68k     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/d1e2ba93d0983ab86e0a070b9a01957cefc1f22d |     
  riscv32    |            opensbi             | NOK | http://autobuild.buildroot.net/results/e81be52706bba6f5fc61b09bff594c1cb1b49c38 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3eb0003bcfe3d45728597e28af957c3a8b5bc1fb |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/67e745063e7c1335926490bc23bec48fab476ca7 |     
  aarch64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9f25cb960d355588cf4cb587a2f38ff9da2d23a8 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/68323f6ddbd2328665ac46d8a6a80ba7c805e105 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/3b56fb94f6a0e6cc690d1fedc5917480ec2a4e76 |     
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9318247979fb8012ea6254b8f234365b673303cb | ORPH
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/5b05a1c2fb849777f958f46d0628666be5184627 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/2494e846757a43c6e60558b3cb5c45fe0437e193 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/1ac58ee1dd04d7d044cd9735d52619e2cf7b883b |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/ece0eca666d6ee91a48caf5f11ec76ac76a91054 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/968c8ac2f0146ca52fab595d34f8a4adf195c2b3 | ORPH


Gitlab CI results for 2022-08-24
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
