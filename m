Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B7BC43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 05:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98DB341049;
	Thu, 21 Jul 2022 05:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98DB341049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nD9baBF96wiy; Thu, 21 Jul 2022 05:37:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 958D5405F6;
	Thu, 21 Jul 2022 05:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 958D5405F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDE191BF86C
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 05:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9062141BA8
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 05:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9062141BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCJ6ZD0JJu0M for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 05:37:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FAC41BA7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48FAC41BA7
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 05:37:15 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5065BE0007
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 05:37:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 05:37:12 -0000
Message-Id: <20220721053718.9062141BA8@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658381832; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eSZywWpY4vrqAwqVVVi9wYQpL1ALbpee/ZwZSsdYhTs=;
 b=UFhg8zbdXqfBu65e1VboHWhq1KFDD1e/1wJTJMWVguQYt2RMqE1AkKw8e9gNnlMgl0bD/Y
 lUAWuBwM+eZioe/Fe8P0bCX+2UwaWuK55Gf7fmdcvQ6c0N77CloE0jXM/3lHVWETuQWl8m
 1rqAo5I0pX3Gb3KrQTuJ9cHH/quCU6+j0cp9zLcW1J8do/aViLiWaccqXdlv8Yt4SUsuud
 jj/EbvaE/RzlbRF2Uy5AqUYH5TsUNI3DfbaScan9uuh3eItOeaZ6zkxEvpoaSXXODVid4N
 hhBsc9WbOTfuDrAIVClL3NPiXLX8M49I5c37O+VI6kt/cxJNQKk2eDz+RCagsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UFhg8zbd
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-20
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

Autobuild statistics for 2022-07-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 11  |  2  |  0  | 13  |
  2022.05.x  | 30  | 22  |  0  | 52  |
    master   | 129 | 165 |  2  | 296 |

Classification of failures by reason for master
-----------------------------------------------

host-pahole-73383b3a39afe86... | 12
           libfreeimage-3.18.0 | 12
                   speex-1.2.1 | 11
                       unknown | 9 
                   tor-0.4.7.8 | 7 
              swupdate-2022.05 | 6 
                 uclibc-1.0.41 | 6 
             libopenssl-1.1.1q | 5 
                speexdsp-1.2.1 | 5 
glibc-2.35-96-g2c4fc8e5ca74... | 4 
                 libvpx-1.12.0 | 4 
               protobuf-3.20.1 | 4 
                gnu-efi-3.0.10 | 3 
                host-go-1.18.3 | 3 
              host-rust-1.60.0 | 3 
                 linux-5.17.15 | 3 
                   perl-5.34.1 | 3 
                 pixman-0.40.0 | 3 
                busybox-1.35.0 | 2 
           crucible-2022.05.25 | 2 
dahdi-linux-5c840cf43838e06... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                 zlib-ng-2.0.6 | 2 
                     ace-7.0.6 | 1 
               apcupsd-3.14.14 | 1 
                      apitrace | 1 
                     aufs-util | 1 
                 dash-0.5.11.5 | 1 
                    dhcp-4.4.3 | 1 
                  earlyoom-1.7 | 1 
                elfutils-0.186 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.70.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                     host-mono | 1 
            igh-ethercat-1.5.2 | 1 
                iptables-1.8.8 | 1 
                jailhouse-0.12 | 1 
                   json-c-0.16 | 1 
               libcap-ng-0.8.3 | 1 
                libglvnd-1.3.2 | 1 
             libgpg-error-1.45 | 1 
                   libnss-3.80 | 1 
                 libp11-0.4.12 | 1 
                   linux-tools | 1 
               lpc32xxcdl-2.11 | 1 
make: *** wait: No child pr... | 1 
                  matio-1.5.22 | 1 
                mongodb-4.2.18 | 1 
                    mutt-2.2.6 | 1 
                  mxs-bootlets | 1 
                  netsurf-3.10 | 1 
                nodejs-16.15.0 | 1 
            ocf-linux-20120127 | 1 
                 openssh-9.0p1 | 1 
                     php-8.1.8 | 1 
                    pppd-2.4.9 | 1 
         python-greenlet-1.1.2 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8723ds-76146e85847beb242... | 1 
       shadowsocks-libev-3.3.5 | 1 
                  snort-2.9.19 | 1 
                 sudo-1.9.11p2 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
                   trinity-1.9 | 1 
uclibc-ng-test-0844445e7358... | 1 
                  vlc-3.0.17.4 | 1 
  xdriver_xf86-video-tga-1.2.2 | 1 
                       xenomai | 1 
                  xvisor-0.3.1 | 1 
                zerofree-1.1.1 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/188a8d0e8ad25bcdddde7a67028980d26a31f66d |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b389494da7c09d7cadd22b0acc3071ec6967e715 |     
    m68k     |            apitrace            | TIM | http://autobuild.buildroot.net/results/67df6eafaf043da172d15dde74bf3ba37a85b673 |     
powerpc64le  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/16dca1f4469f5a19f7cd41a726765d38e18d0353 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/b47046f163da9cdb7ba3cab0c764ffc8195c7883 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f72b142c73e1d48f9da659c5d43fc9691900d2b2 | ORPH
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/c90d804d89935069c427a60c26a022382ddfc3df |     
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/5b00b20265a1382e112d39d9e24c4a79cf18475c |     
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/514a9f6762c57323aa65a95bd5d52dc65504f61d |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7be797eaf8fa672bad22614cf27d6b75dcba46ee |     
  riscv32    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2d4af0439a01be305c12258bb9a247acd953d78b | ORPH
   x86_64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/ab74a81fc66b8189fafb101ef21c4d46ec15d819 | ORPH
    arm      |          earlyoom-1.7          | NOK | http://autobuild.buildroot.net/results/d614fa1180d5dc7008bdff6c5db3f4c55b5efcd9 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5d567bf8df7fd24e0dce836a3de4a84dbfa2e9ae | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/df1cdb7c71bb0af1f7bd1d85627b787d4d0b7bc1 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/36289b855f47c7989e962235f175da5831689fd7 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8deb8c28f4d4e870698443e98309d74129b7c26a |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/56c56dccb6afadd24cfa42358b804399214833d1 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/55eac94089cc20ea80c75ce26111a252447ca450 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4019cbef2cbb44eab93d9d6f55a573a6737f099b |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d40a5edf38100111d5b5b8d56ae949d2c578c058 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/59f44eb158801eca2b629a1eb347bffe424666d2 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/6c592741c87b181779d074cc23c5a48560acee9b |     
   mipsel    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/92009b4d870e0a409350d3aa952f1534e3091642 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/a9a7372615e3fbe4b8abda946706d1ccadf28931 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/195285b29c944717e433ffa995dfa4c4625f7138 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/6e4de6ae392a18048fd53ed1be78b2e5a9ef3734 |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/68cd0619cc02317885d5299d46879cef1d402dce | ORPH
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a4c09330620a4b6f31131c4c060823d62fadc51c |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/02c573d1d576adf3c3c7c12ded861c14f84a2cac | ORPH
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/3d1830baad4debccab118fbb34a1ab6c999f6f4e |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/0fb0cc95673f8235906d9567ca66e21b5c8c09f6 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/94f3a450d5666722e168ea73c470396353306f80 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/7ce1ad20a5ac0e73d4c999a0fd7ea358d26d581f |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/18d4a0bf882335a7c16163a48ba0135f05ecd7b0 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/395fec296ee5f23ad6b0160aa3fbd3119bb412b0 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1e0ee6d94a5143cbfc9a49deb9672f0982b74973 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c4f84e563163fb5ec714e2e6c0da51bdefe43f24 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/db1f6ab3ce1559700a802dba057d968bab5be1ff |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/68b92f3a595c8af4eb99576da1bee5a43aa35e31 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/18d9a0ea6e54538613451b95339b8a1dbeaf3b03 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/527d0426d2d65c0cfacdd8fb03f2ba83707158fd |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fb33283fbc5e7e44971ac19c74dceaf03e09b45b |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bc39b96491ba9046245436bc1b788e0e7793251f |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/928e6976f6205afbe4a0129e547a79c174008e98 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b920968ffc4be38e9765ac345c9a27ff1a42d5af |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/14815aee74effac042920924edf0b131f8171ac9 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/9da0ed2cacf79d87b0b92b7bfc81e4369f509af9 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2ac57967706b6ba36f2c9f1bbfa4e87e741db7be |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/b70896d59b7aa5a5c776444c8d2cdd9a8961d53b |     
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/19302003bc9f506db34bae5c9f02a9e8aeb7606b | ORPH
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/452a762e2d9fe27e2ed6153cac6f8fcf3af6e154 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/3064b49104514aef104b0718326688bed2c1319a |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/92a4dad258b147829dff11c1bd0022c796c15fe0 |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ee594601c02875c5db65f89874cb0d0b873ef5cf |     
    or1k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9c511c07339c2c874e74765850db7f0dabfb9d7e |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d2c7de4c5936efa1228357ee6eb5473ff00bb458 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7ceca6a01eee83eec91745cac3cbe303adbc77a6 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9ccda7e3d82692c635e43405334f7a1d33b87cd5 |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e6df1db10a9b6117214e2da5acd927f3a66a9e74 |     
    sh4      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b2ce300c9bf6d64f7bff5dab4f1a2bde8af7e220 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/118ff579f9386b25768b324a41645a798b208a84 |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/329cf9df1eccf4c1ba0281691c0b6518d20e6215 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/70db609702a6e1006a311c673de9f0accf887cdc |     
    or1k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7ce7aae8af6c2cd98acb62fead619c425e90a649 |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/43a1ff677f69085d8b63cdab210f3032abc506be |     
   xtensa    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/46ce857554e1e42446e645917e564300adecb24e | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/d35e71bea85d0b187f8bfe4163b186b7de81df2b | ORPH
   x86_64    |          libnss-3.80           | NOK | http://autobuild.buildroot.net/results/36fcebbb957368757118f6267c3a24b1552aa73d |     
 microblaze  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/fb51c6d46ca4b076ebb114f0d0109c133911408b |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/1739b3f232bc7fb387afa39c2565865f53a0ab24 |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/e381c1bc46fcd47575d822017217c69d9af5d6e3 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/36f531582bf181f4321e1cbbf64712c5e181e217 |     
  powerpc    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/499368e20cb935bbb511a7985068559d9e32b29d |     
    arc      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/61670f40bb32c4e2c986d49dfb81d5c62b2ddd5d | ORPH
  sparc64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/697d31a4d4aff6da234931cd7b70081dd9a6adcd |     
    m68k     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/6f8af08c547c85488a041954edc435c9a9279774 |     
   sparc     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/8af0a37899b2c5a3f34967e02f85b6b4367dc2f3 |     
    or1k     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/d1888ab82951dc77e0469bbcaaf1b2049db91e4e |     
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/2eee76038e8a6d151e1cf096f55eab0a805da070 | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a3ca43c1f3d51183f633b98acdcc70aad74d78be | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/09d7b1372b571575ef96e52fe6a3f8b991f30c6e | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9123b727241a54860efac3a9b326542082e2236e | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/e984d6b8f192180dcd71ffd3051ec7f721652cd5 | ORPH
   mipsel    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/da05bc420da3796b1a7dfdb38a76bbf2ac9e3279 |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/7251b45993fe66cc2d23a2cac59e91af33543624 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/480cbabaa7676c0cf0a33dc94aa656041b06b27d |     
    m68k     |           mutt-2.2.6           | NOK | http://autobuild.buildroot.net/results/3ddf0f6048efbce5462b4391559d2a2f25bd1d82 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/d0e4a6f6513efa51348924a995fb73b808e2a847 |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/d60c481653d35dcf8502346f4104e6ea134b2c19 |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/aa58b8def66310677fa1a1da863c6d8ef00ec5a3 |     
    arc      |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/40b9a5085aa9774dbcd416a865d7e7ea53d5f267 | ORPH
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/9618d8cdba1b4f77e24ecc09ec6972568f6e24ad | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/da9405437724c6c9193102ccd03dd8496378b969 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f79b55c28a806784b808cbcbdd8ca42eab249bb2 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cb4fe751d9dc3d1ee03a6cf8fbad28234adc92ea |     
microblazeel |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/9f4ae660b7e3d3879667aa6886bf800ce2a19978 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2c1d2cc36293ccfc51bed0de56b29eb9de3448bc |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f73f6b7043334d927d14b557f1f51bed2256e05f |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e2d86b11834b4fb7e1d2d02b2dd3c8046d89504d |     
   mips64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/3bf14e439d03202cd9ea7320a7004116bb9127d4 | ORPH
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b58c7cf2b795632aaaff00ba16fb272b2d32388b |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8534aea0538f6a0c4b247525f243714effd5d44d |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3e194fa69b4fd8c9c501ea76a78e578ae41d75e4 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a9188f19cf11b75779089f6f556d434265cbc098 |     
 powerpc64   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/1718f03bf1c183ee11e5aad637b412e60448750d |     
   x86_64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/9f459e0637b921474dd54d6bb1bdea67e95c1747 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/8caefdd8c4d0f080a661ae26dcd4643bfaadfa68 |     
    arc      | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/7b3b46a5d9a80431adb00bee01adc1e5b635a484 |     
   arceb     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/9a66e9791f098dee9a22a3e9d4d6a4d9523869f9 |     
  sparc64    |          snort-2.9.19          | NOK | http://autobuild.buildroot.net/results/5505af433f780e10bebb5623c6f851f56f55d305 |     
 aarch64_be  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/7b10eff4893e9bc69cdf3a56678a83941497b638 | ORPH
   sparc     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/f9d64321cbd8356aa1bb8269f96ef78f53bf2e77 | ORPH
    or1k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/9d325aad624c086c45d63c8ae28da9fa388c2935 | ORPH
microblazeel |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/3e5649c9af5204d06472ae16cf0435d03ef8a7f6 | ORPH
    m68k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/42b72f83eb64637bda2b08b20d1bd723a3c7e37c | ORPH
   sh4eb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/eff7ccc41a2287d3def47fb785f2d34caf9812fd | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/d4dc0059dde7ff6100970ab614de8b1167ad608e | ORPH
 aarch64_be  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/48c3dcfd4b46ec3b587561a6f1ac9ec1f6cf3ec3 | ORPH
powerpc64le  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/6840c2a685580ac2722d1cc86eced1ad37defb84 | ORPH
    or1k     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/6e53f095947aa79868c5fa7d3c2b78e3f39332e1 | ORPH
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/4898274d0c4b5d7f853d2cafc984203f6a9caf5d | ORPH
    sh4a     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e77099d2f366e08fefdacfb0dd9d54aa9aff7da9 | ORPH
   arceb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/ca7e6d83fa88e7f44ba09da5080f217ec30b6016 | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e257e2812a7bd3aeee227b44883648a26f475d2f | ORPH
microblazeel |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/7f7e193f9cb2c98674dbfb6459c8dddd72b8a9e8 | ORPH
  riscv32    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/1793a6dfb4c22978048c3a62fc11dd2af5b3958b | ORPH
    m68k     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/01e0a80859a084f9bcd1571e35c0047a978c76e4 | ORPH
   mipsel    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/157b89a4c144c6ada2e89aad2caf3057f61e0c28 |     
  riscv64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/dbeda1de98e29712d55f365794935f2e28e9fee1 |     
  mips64el   |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/a9190b11b080a32d69b3de714787eaac214f0b00 |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/ffd54cdca91a3e4e7498a3e110665ca61c3d6adb |     
 microblaze  |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/0024f2b595a9613901ba4786d81b9fefdb4e6c5b |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/0e1ee8d47f3f4ac2d1a6f447d19f18c151177c9c |     
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/e2b4797def3171825d9ac0c91c46217ad1f2aae9 |     
   sparc     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/b73304d4bc8148c1eef71e8c15ade43b7c98421c |     
  mips64el   |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/2517b69726c806b7f976a1a6b30d6d5d88d39966 |     
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/28fb2dcf149b692b2b9c4dd88e4576a0e91f188e |     
microblazeel |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/61d08811f871b87ebb39c0f7439d930c92e26c44 |     
powerpc64le  |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/bd4c50952736bc57697ba0a63e89946346746d43 |     
  mips64el   |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/be4ff79a42e91dcec9c56b98969bbf6cead3c854 |     
 powerpc64   |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/8f7edd969c6a2e4ece7cc0fe002dfa2f3b3abcc6 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/11b2768a74d20437ca038e0fba8618b2f6913f7d | ORPH
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/faa6a5f8dad3dd645350cf3a933b55f0d9f4b0d0 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d5cb82fb8d37760e933cac75d5a1b62b8ae10c4e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cd66a84bf179d21753499f854d4ac0c900b1b5c5 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/662677bbf848dbca797e8e8fe0ee00a710218a7f |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1316f6f8423aca862edfc6355cdfe1af483897d9 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/767cc51bb42ab2f15c9bfe1a0538b81e4c7d369a |     
   mips64    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/f59216be69301dcdee3f437f10a790a847c397e7 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/76245cb4f7e0bb74d53d79b4a869f41c9726983d |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/d3cd119e9dd21e9cf14c5a93ec8246acd8b70b9a |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/ecbe84991594abc4dc7fb62a89697a04fb6a0411 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/3a8bb1d086d32433df277a8e6eaa015472362ac9 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/bf59b9db9a548cacffc449f04e12dcf534323dda |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/13c5f6b2801e598c2be40b3dc20689ebad85c4ba |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ae121a2025b8cbf72378ad485af6dbb69c3dd8e5 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/2e0ab553215fe98b9eeba6473dcfd804f34c0cfd |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c20814ec35ef34a6070632d5934f26836bf28329 |     
  powerpc    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/aea9aa899c9cc3eefc4675f16cfa81c36222e50c |     
  riscv32    |  xdriver_xf86-video-tga-1.2.2  | NOK | http://autobuild.buildroot.net/results/1864bea74b1ad8c44368f39ee1d0c07bddaca88d |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/589a5f51c3011f5e398ea78121ed7a2176a06a36 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/b0ef18bfddf9a0e58943b7de1ab4b6995024ec6e |     
    or1k     |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/0b345d782ca3cd08855a83373e0d89b27f763bf4 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6696df8c5cf3ad3c3a2a50ba4698f6176cc00014 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2501973bd92a428e121c210cd824ae30b8dda3fc | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/acd0cb3751734e3854b4895351fc79d9ceb80b96 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 1 
                   tor-0.4.7.8 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/eb5b28eceb25705f13db14fc6916e42745182191 |     
   x86_64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/972b6b74497b738e257d3f036bb681a0dcd6ccb9 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 4 
                host-go-1.18.3 | 2 
           libfreeimage-3.18.0 | 2 
             libopenssl-1.1.1o | 2 
               protobuf-3.20.1 | 2 
                   uacme-1.7.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
              host-rust-1.60.0 | 1 
               libglib2-2.70.4 | 1 
                 libpng-1.6.37 | 1 
              swupdate-2022.05 | 1 
                 uclibc-1.0.41 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7e9198b59809f1486d1376834d0bf3b66ebef884 |     
    i686     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/634b74a252e8b8403b75d190d9c7809c7910927e |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a7888213b5e587c612be3f91125f38323240e4d0 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/ca682502489b7fd95dbb1dd8d921e0325b545bb5 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/403c3c803cc71c4da482666b82f2b4ab2e0fe000 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4465319cca193b8d3efd79ba5dcd7348218d72af |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1d7cc29bf2566232b9341fe6e9ebb7d8215cff3f |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7fa4b031f226f0cdb9e85a5e5bc84ecd059fc062 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2a92e27d46ec2e9ba0ca0efa10644a788ecb81bc |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5e585437afe03ca302dbe8c561eb7dee1a87056c |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/318c2d55e0b632b1284d8019bf2cc050247ae5ed |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/e46cf4395c9c30b2cc4250d3089fa2dc002d9bf3 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/903e82f40e0998c54e2d546db539d963ae6ca341 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/43509c29351b1cfdbbc2f6e0a99b925f3c652078 |     
  riscv64    |         libpng-1.6.37          | NOK | http://autobuild.buildroot.net/results/2e52cd41cedb2d49bda7467d7e9ab0d20b008a7a |     
 microblaze  |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2d4dcf4ccc06cb16f2befdb192138b1a8471f742 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/511e5f28cbb6b78c364ea9198f242823b0a10b82 |     
    mips     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/ffe0bb76fbb034dd29555c44aa3a5be08882b083 |     
  powerpc    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/65a000ce00de97b3cb75230f4f15734b08ae37bc |     
   s390x     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/aa6b2e89b4bcbfc5e8fd7f8db25a3e9168d319a2 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/263769b4e20f4b29e2f1f2eea76111ea562186dd |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/aafa54599177aabb87219857f09368845348fd2a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
