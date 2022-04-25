Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 04:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB1B36068A;
	Mon, 25 Apr 2022 04:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fc9vc1Ah620t; Mon, 25 Apr 2022 04:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12D29606C6;
	Mon, 25 Apr 2022 04:40:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B69AA1BF3EA
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 04:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A5540866
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 04:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xvT1mBvzbVB for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 04:40:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07E4F403EC
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 04:40:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD6FDE0002
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 04:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650861645; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=++XJ4/Bd0lZ3SiKivO6FiYcZCzUVSR8QEM1B4CnO3u4=;
 b=fmhXO9gLTs7Q0pfdARcx6aWSI6BNnSaJ4Ox1xBIWFlgCVzGyaj+HS5NW1GRcm8Leav9Uq3
 zt1PTZjQNRdwoeH5duL6igQGkQQv7qcepp8GlmfSISSRmxMA0DFtaWFkN0x0awn8PwLIAF
 H68B5TF6+9i/Mm2RS00sk+oS4vxtJC604AZc3+qJqWW5NnWHcCO2h9uifXVjBmJuV0zlJ5
 i7uOo32a4j4ASXzzo4PNtMGCjl9aZKKlLZDaZPYhrbF7PFRbdfUSiPLhHuGY3E65QIMO8o
 S9XghUlMuJSUmSHpyXH/pl6cFhKQq0vnI4HPpD2rc5H19G4eOzMzL+6IsVsmWg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 04:40:44 -0000
Message-Id: <20220425044052.A7A5540866@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-24
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

Autobuild statistics for 2022-04-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 20  |  6  |  0  | 26  |
    master   | 129 | 464 |  0  | 593 |

Classification of failures by reason for master
-----------------------------------------------

package/pcre2/pcre2.mk:33: ... | 57
              pcre2-legal-info | 29
            host-binutils-2.32 | 19
         host-gcc-final-10.3.0 | 19
                    git-2.31.2 | 17
                 uclibc-1.0.40 | 17
             libopenssl-1.1.1n | 13
           host-libselinux-3.3 | 12
           host-wayland-1.20.0 | 12
                 linux-5.15.33 | 12
host-elf2flt-7e33f28df198c4... | 11
         argp-standalone-1.4.1 | 10
                  zchunk-1.2.2 | 10
                python3-3.10.2 | 9 
toolchain-external-bootlin-... | 9 
                 zlib-ng-2.0.6 | 9 
    toolchain-external-bootlin | 7 
                libressl-3.4.3 | 6 
glibc-2.34-109-gd64b08d5ba7... | 5 
          host-gcc-final-9.4.0 | 4 
                host-go-1.18.1 | 4 
              host-libcap-2.63 | 4 
              libgcrypt-1.10.0 | 4 
                   perl-5.34.1 | 4 
                     refpolicy | 4 
                       unknown | 4 
                     aufs-util | 3 
              cryptsetup-2.4.3 | 3 
                  exempi-2.6.1 | 3 
         host-gcc-final-11.2.0 | 3 
host-gdb-arc-2020.09-releas... | 3 
              libeXosip2-5.3.0 | 3 
         linux-headers-5.15.33 | 3 
               pipewire-0.3.50 | 3 
polkit-a2bf5c9c83b6ae46cbd5... | 3 
            qpid-proton-0.35.0 | 3 
                   uacme-1.7.1 | 3 
                    brltty-6.4 | 2 
              bubblewrap-0.6.1 | 2 
                clamav-0.103.5 | 2 
                 coreutils-9.1 | 2 
                elfutils-0.186 | 2 
             fontconfig-2.13.1 | 2 
fs/ext2/ext2.mk:65: /home/a... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
fs/ubifs/ubifs.mk:49: /nvme... | 2 
gummiboot-2bcd919c681c952eb... | 2 
              jpeg-turbo-2.1.3 | 2 
               libglib2-2.70.4 | 2 
                   libnss-3.77 | 2 
   linux-headers-5.10.104-cip3 | 2 
linux-headers-5.10.104-cip3... | 2 
                  netsurf-3.10 | 2 
           python-zopfli-0.2.1 | 2 
toolchain-external-codescap... | 2 
ulog-0389d243352255f6182326... | 2 
                    vlc-3.0.16 | 2 
                 wavemon-0.9.4 | 2 
                       xenomai | 2 
                     ace-7.0.6 | 1 
               aircrack-ng-1.6 | 1 
                alsa-lib-1.2.6 | 1 
                   aubio-0.4.9 | 1 
                    bat-0.19.0 | 1 
                bitcoin-0.21.2 | 1 
                  boost-1.78.0 | 1 
                  cairo-1.16.0 | 1 
              containerd-1.6.2 | 1 
                 dash-0.5.11.5 | 1 
                    dhcp-4.4.3 | 1 
              dieharder-3.31.1 | 1 
docker-proxy-339b972b464ee3... | 1 
                flannel-0.14.0 | 1 
                     frr-8.2.2 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                glorytun-0.3.4 | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.10 | 1 
          host-gcc-final-8.4.0 | 1 
       host-gcc-initial-10.3.0 | 1 
        host-gcc-initial-9.4.0 | 1 
           host-nodejs-14.18.3 | 1 
              host-rust-1.60.0 | 1 
            igh-ethercat-1.5.2 | 1 
               libcap-ng-0.8.3 | 1 
         libcpprestsdk-2.10.18 | 1 
             libgpg-error-1.42 | 1 
                   libks-1.8.0 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
              libuhttpd-3.14.1 | 1 
                 libusb-1.0.25 | 1 
               libvorbis-1.3.7 | 1 
           libwebsockets-4.3.1 | 1 
                linphone-4.4.8 | 1 
        ltp-testsuite-20220121 | 1 
                   ncurses-6.1 | 1 
               netatalk-3.1.13 | 1 
                 omniorb-4.3.0 | 1 
               pamtester-0.1.2 | 1 
          perl-net-ssleay-1.85 | 1 
                   poco-1.11.1 | 1 
               poppler-21.12.0 | 1 
    python-cryptography-36.0.1 | 1 
                      rauc-1.6 | 1 
                    ruby-3.1.0 | 1 
                suricata-6.0.4 | 1 
                  tbb-2021.5.0 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-bootlin-... | 1 
                wtfutil-0.41.0 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/c38ddcd1f181da8332838e149990691f0566ffdc |     
   s390x     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/2278e9df7d06fcf031cdc4fd2160aa1304d586c0 |     
    or1k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/5087434422df419116c0e4590d831d6e3990cd43 |     
   x86_64    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/73b9ea08f1c138ab9da2959a857478c43b76b9ec |     
   x86_64    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/244101b1c414ec6584d91e3c1793e603e7f17209 |     
   arceb     |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/3340851909546a69f8632cf490e3ff4a368007ae |     
    arm      |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/e43443580d234aef7a54ba0cb0b7d107af56ccac |     
    or1k     |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/0e27891e709cfdb5165c64bef38ab788042c98af |     
    arm      |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/21fed655a52a917d6197b64bdbdbed20cdb9ed9a |     
 microblaze  |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/99d8ac3c876c044ea213034334c8fa9ae6de9fb1 |     
    i686     |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/5b248e94ccb412d2b4e68f7381c6e971c768f788 |     
  aarch64    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/eb6b7579eef98d04af79ae1caa29afa505f9e9a6 |     
  riscv64    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/40640c07f9ce9e9d083049cb21cdaab67481a79f |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/368ffe90a01f2eb23651e2974ea20090dc534b4b |     
    arc      |           aufs-util            | NOK | http://autobuild.buildroot.net/results/eaf71dba8d6bfc67acfe1f1b3c58de334fe791d3 |     
  sparc64    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/30198b99e6885bc75b95c743875927ee06c5b735 |     
   s390x     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/41fbdc46c682a104dd356c3bd9c8d5faed68c509 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/aa7fdb4a1b849aa76bfe46026b8ce11c4a31fe97 |     
   x86_64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/0c0586a77fb96ddbce7369d0bd708d17c2b3577b |     
    arc      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/a515c7b70829359475bfa77f061f61d1e17c9f44 |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/28da4ad3f73804b0e1456ee9b2aae190842b4678 |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/50d22c92d69b976b2e2fa325ff5c4447742208a0 |     
   arceb     |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/879f9b43044f3d07d8fac52ca23453cafce08fc2 |     
   mipsel    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/e5011d5dfbca7e9cb69ebdb7093dcad110f085eb |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/836348270d564a46cc9ee840cf87b2494cc82cec |     
    m68k     |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/d61396a62a4247b35a76775a35e192dd995180fa |     
  sparc64    |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/e7f6cc633b35a8687824b142731a6024e4729cd5 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/add6044bb872d618808a4fa72662567a993d335d |     
   mips64    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/ab440926091a24dce5460a7ad1a0583d07aac811 | ORPH
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/f70079ce974d3939f324cc629b79da7bfc436494 | ORPH
    or1k     |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/6c516b82c646c35e115019e06b9f13bdc210d7e2 |     
    i686     |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/cb3fdae4e0da603f304501f65127800346cb3915 |     
    arm      |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/f8832b410c499ccdaa7e4fabe57296f02ee6e2fb |     
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/4c87149bc22400e11212a37381e1fd989c0d3e7b | ORPH
    or1k     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/37ecc6a8629ade029f32d75ef3e698fd5eb95601 | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/b9470c87fbbc3c7fa2cda3077306f101b9371495 |     
    i686     | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/b2f214e2915b82d0e6784dd87fcd6eb31bb872d3 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a360d0278cb263ee3a5c830f0b122793cd45a628 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4aaee9036180761b5e6f0c03c06c22be49945d3d | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/e4402659af9432df3c37958048e1d5b12b3d5338 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/79709333295abfe2ed9f4b49a04fd2a07cc1f39e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/49e818aca77c823a50ea0c04adfe36575bc09db7 |     
  aarch64    |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/911b21ebc39024b911b0f1f42794c254efa393de |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/15ca5c123e7212c01c4c801195af2ed38c484848 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2e1536acbfad01091890165f3804d2e2701d6306 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/2e9919ce5ef68d0cc3c0649123b399d08b617108 |     
    mips     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/e2ab17e4c930a7237874719ada231837590e1a8f |     
   mips64    | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/989d5aeacbeac83d863b3bc81400dd9094141fe0 |     
  powerpc    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/feb87dda6dc6c04f6c9816da087543af4c15240a |     
    arc      | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/c6cc83abcac89df41b5b99d465fee39f8a0d835f |     
   mipsel    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/d74befc14c499b24516e68bed7a1c41b3669eec0 |     
 aarch64_be  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/9bf58db7ef26cbc614b3934241ca16b1cbdca154 |     
    mips     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/fe78238e147d1aad14cfa60ddcfbada32b749530 |     
   s390x     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/075779d14b7b5bea25f0651d04c367c66964247d |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2ec7c6be7d0cfae962363e8bc7234068ec7f480a |     
    mips     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/f716da39fd9b34e29f68e1f71ac2f5cdcaf0e5d3 |     
   sparc     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2dd5633bbe34888a2becffed4477dc298e8343f4 |     
    m68k     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/614b8bfb19dbf2fb2b664cbe930e7420ccd42a58 |     
   xtensa    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/23f79344e964ccbcb6850899ddb4dc7b668237b1 |     
    or1k     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/bf387fba38ead78fbf1d3cd99fdf638249d31d55 |     
   xtensa    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/4c885c66c51e86a2e79534faddbdf6c9f67043ff |     
    i686     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/0c8a53ddf9033fea25c9bfd949cdc1e86f54b859 |     
  powerpc    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/215a84a6c634dcbc6f4efde938136bac13da6ac9 |     
    m68k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/5610c5b3157f5ea2eb9021c63f080de288482c28 |     
    mips     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/30b202cdd6494735ad9afd93b33f930f0be14a7e |     
   arceb     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/c05de87789dc928b04bf2bcd393bfef7ee75707d |     
   xtensa    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/8adac5021964e4ae7f866e605be38ab449430f72 |     
   xtensa    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/ec03f53e6d603d10d83a30099b377ebcaaac473e |     
   xtensa    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/4389891dec247c5ee486f46c18202ad23d48e4e9 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0523755165acde09f1785f5c2e0c09ceca37fc6d |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/53e7d0444782449ad3a900e109d5bc3ceab58843 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/09e7d5d10096e9100bc1bd88ecc24c2f123bf060 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ed1800c05cc492c287f55a27131c35ff4876c867 |     
    mips     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/700ec9f2da98e33a37cc1fba4ad5b1bec9a3c12c |     
    mips     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/d1291ed2ea34148cc26ecdd13390a5cbd9534fc0 |     
microblazeel | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/c4a9febf05f700bfc67a8d52a63cf461145b964a |     
   armeb     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/49b402cc941e58dd6e218561289354782743b304 |     
    m68k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/7458dcd397747eead7999baa9a5d9cc8118b7b46 |     
 aarch64_be  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/248472054a6941b878181d75d4bf93fdcc8ea7df |     
   mips64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/60078349d660955763ca4a6be99b258bac04e306 |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/017003995874520264bd59442816247079842ff5 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/cb1b5489bdd8d93757194eb269dd306683b3dba4 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/1baf7baac791d50ad001d59cd6a5785a6cc8ae1c |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/02e1d09d554f8a430a95b5c7e0dc74130d6f14bf |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/43c62f0cd970dbef3a969ec1c89795b3134f2769 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/1ebbd482ec8bbb27d4cb1bc4f680ce49d38ee341 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/38aa62016cc8505b86c29a3d5e02115e473fd1ad |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/6c79965dad7528b8b4156ab5308e42901fba7705 |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/0ae8937eaf3da54f4f28554765a3456e32d58fe1 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/31765c98fdc11079350e2cf48eac0c33434487b0 |     
   sh4eb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f3235b8741e8d904b8df4d1e9626b7953d59c48a |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/202263d4fd0792213dc4d140a62b9969738d0b74 |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/de91794e7268ee5062cd072abfc2519e15c659d2 |     
    arm      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a0f13124213f350c24e9b8ba168aa5d7ce4f9419 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/6f756b7a2e71b799228da62ed803d40a85a93f2d |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/7bbd9e92cface0a741b8fa111c104514a076cbbe |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/521f94793ef8a257b1543e4e9d5cb11c085fceb1 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/48adfd26531c63d598d49a16edc66940ede8ce7b |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/a7441aefe1d309fc70d62cf23750484157f220c6 |     
    arm      |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/da8297b4998ba9c744caf09df4d7c79d4a2dd329 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/de19393d14e79c3329ced199113d380768372a21 | ORPH
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/0ef9fe710d4aa3097242a28a03b41b3f8a93cc1f |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/e517c8a5ded5b251ae198f0f3339053d8189aaa7 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/6fd6797a35c77c17014982e9f6f06699a33a3011 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b87aa9deb9f496c9ae4fa0c93346090297b73639 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6a5bf9a0a4c07d22b80c9bb1dd381ed322e8e462 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1672eb688d85f7f9c1565c9f09dfe7c5ce4928a4 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8960a31cac24dcc84e445c05c972211ee1e4d54a |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/00afcc00f08c057ca70d1c92755bb8762c054164 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/407c11f8f2d18cb832a2a0d38d4510a00a40571b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a2aaf0468177689d0ab39071a27116387e5323cd |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/754cb3505ec1625ea89c742da6bd148dc2a3395d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f2a0fc7feb31ff6a3a1d6409462da013602f3d21 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7a2a88cce3c6fbb931c661caa042bdf5f14f1c7f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/78dab41d53924cffdd7920490861a3d35d0cdb7d |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a07dcc62f1378824d183c820caaa2ff6bf68a149 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e3046932c1ab1b10236348fe544272f807f99394 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/74b14903be7046c48fac73cb7afc56913c2f209d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6b6746dfc11092c5b64684ab49eeb88af55d1fe9 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3689978db642de9a88340fb41e38ae2315a79085 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/38e1e44385264cacb350a8b2d27c2e84c5f7309d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2ab896c2ca98a0f0dcba30bcc9529a65b6e3d8b2 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/87233232d17d85af9a39627b4b1391db747a92c7 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c28ea27cc21a6844f23d82f7d8c2f10514926f0b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/ae6cd4350a9995c99b80190cd6caaeb8a4a81ece | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/27d55fce716107371c6f04cfd8e4e51169da4d6d | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/0fb2a66155e9d82bd793aa776dad4648af05f95a | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/b498bc603189a7fc5993e7d33ec77b72be80d996 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/93811a6eac00e285af470abcf06f66507f5a5cd7 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/d9a730de035b5c3e0d17a328f55c8f7504dccc48 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/627f4bf8fa4bc723be7d9fa49c6adc3d3bc7ff85 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c0294b7fe629cf2040aeae157d7acc61e5a507f3 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/43082679156691b37a87cb391f99b8409faed226 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/2a61a69212743f278e46f0492effb33501119c01 | ORPH
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/aa74d37e4206ed106afc5754241eaf735836fdf8 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/148de976e9d8d231493e766776aaaf9ed46b2249 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3383ad7a5d5a5f292c1ba39924c112d177eae98b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/215cc72b578329043a0c6167b48d749551e3ad69 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cf15062ea11949e158ef08fbd327d0e8e6a6107a |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d708b7a53fb6f4a0a97830414d2a0cce9d008d2e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d6dddaf47569a78322d0a07a13642800bb2b761b |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b898588abcaa75d621dd1dcc11083148db936b2f |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/80d56a29b85ec55d6ab2bf73be018c204b941110 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1543f3148fec42d09be2af3999deafe0e9447f21 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/442ea779d562f7a99e53533da460e4b838b70709 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/15b58a454bae217d4891beda91c1e1ac446a84b8 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2624d9c7385fc25f64519cec07fd9f934835613d |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9dbea30059515dbba6382bb4b2464793f6f9a4a6 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3995d56e94173200180da41e0cdb4fe4250e74f8 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a840956d9995a07f768ac4c62938ba9a9d98c913 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/762acfbb3287ffb8d54cf77fa7d8eb6b4a4b02c8 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d2cc3884383f7604fa577d8f1710a67d32f7f36d |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2c0d8c32a69216055e349d21b51fd003637142e9 |     
   x86_64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/543f0f5583c76639eab0106bf3a41a6a3111e51e |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/692317ad09590284d952b7723fc6427c07c61912 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/a3f016d520ddf7eaf546ce19c2b8b9e0368baa8d |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/acf3c31574e34391057cb13e4a8e522af60e5413 |     
microblazeel |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/fad075d80bd554a4a1577e5ec2ff35b5d870863e |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/ea856a0badcd419aca79a59cfb8445de084e8310 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/50cdbc56e568c868f830a2e4e0172a6ab336ba6c |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b6053530d57fbbb07a0a164ab13a0e2898c97306 |     
    arc      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/a3d05851c4179bf76e78fd57e76b789b04c704a7 |     
   x86_64    |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/5eb0ce342fe20f73ec7ad52a4adbfc3f77e27ea1 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f0fc8d5959ef7459bf5966eacc1322688696c3cf | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e52fe6a09b202ccdd4db21282dea99ff7853547f | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/b583a1e2a8d6a9847802f3734dba637407acf5c3 | ORPH
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/44b1d54c2cdf211b4058d072d54999dcae3ffe0d |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/6a46953bc01409aa354e060202461f5894d82960 |     
    i686     |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/eb8d68ec5bd8efb5eefb088c62eb0963441bcc25 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/333fd5c24d1a85646dbf322c4d5ab057fe5a65aa |     
microblazeel |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/1cddd6381a9478f16acae7a00ee1b0970146bcb8 |     
  aarch64    |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/83b505a22d7894ff5250d68ae1ff1ac6ecf2ac34 |     
  powerpc    |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/15656873963d8d5152687fb88c56fabf83a38eac |     
  sparc64    |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/af5a001c83ad664d93b4911e993200ffc406b03c |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6ae9a38d9b4dcefefe02b29faf6c790f47a4b553 |     
    i686     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/76067c447749383cbb3b77288bbb32501723a475 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/2371cc85f4733448350325d8aef0ebb8dc825ef8 |     
 microblaze  |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/756d068fe4cd355dd2c1a0226726e960b3c5f4bb |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/afaca46542c7e7a1e4eb0f5e4a090c436b41d497 |     
  sparc64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/d9b7a08f3da1ac94d61ae7117ac33d7fb12649f1 |     
   sparc     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/42cbad6308c92af221f4c01e97e7f06b81fd1efe |     
   armeb     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/7f96b33ef47a74c9aadab1f7c2efd8e798e78eae |     
    i686     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0a6496a6c9f6c90e22274f30139e9358df664561 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/633c0631b448ce400aa4e2fa47d2682b2786dccd |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/39f0e46d9ffec00bf67c3188c17685f5c40f2521 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e146d972050bcc190f65dbf8ed01cbf642ea1c5a |     
 microblaze  |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/4b9f6582d41db9b4f10884459b7d0410349f4f4d |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/d90eb421b15dd4bf7fe1ef5bed72e9a3cb3413f4 |     
  sparc64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/6a47913a104b5c588f4d41c1db8b6d9b4dfa47db |     
   xtensa    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/98435680a904d57040d16a0dfee782fc2ee8e393 |     
   arceb     |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/c0c9c2fc27a4d1bf9cece2e0e606bbd32ba58967 |     
  riscv32    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/704b423c627c89d58873ea74d48f92a78a97716c |     
   x86_64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/2ce6b9aa77e2da9c5a958e05096a52189170db6c |     
  sparc64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/8592e3c5f7c4b465553eb95f3f9d08bc75bc4fec |     
  sparc64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/b733616ecb2daec131a96f4a917530fcd1a79173 |     
   mips64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/92a60fd0747a943355e4aca882c43cb6b35d6d87 |     
  riscv64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/f22636f5fde38e995d1ef4f9279f301e4ce0f9f2 |     
   xtensa    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/ff53522e4d5b93b9327a32051be3a10429544595 |     
    or1k     |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/3a892c3b271df716f25adc7ad0e7c40e8be17e45 |     
 aarch64_be  |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/283d7f2bc386438e8fcde717b46d93cd698e43ce |     
   x86_64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/91a81f3bccb109b3da41761d4bc4a7eaa1451638 |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/d2ed3fe6d2539d4f2113862452da323852cf08d0 |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/90c754923dd3fdea7a55172fd128146333f525d7 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0c6d6312b6ad561981fc5282e399806c7db82a84 |     
   arceb     |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/844a29d1f9b505c26a5ad4a769ab6a69adbd3e72 | ORPH
   nios2     |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/512f07ee7457eb3ace086db0fa712d19781bfba8 |     
  sparc64    |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/5e88d3bdd367d3ff7540802ce7b85f40d9242420 |     
 microblaze  |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/144dddb1e09f2febc481a234054e4248a179191e |     
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/9c3cc84f909384eb4a2b68b1cfdbb243b47c11d2 | ORPH
powerpc64le  |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/dd85bfab3d256aaa222965e62e5da6edfa18a33d | ORPH
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/4670ecc45ac63dab6577bbedfebc12a31a9e24fe | ORPH
   armeb     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/69db2e36c670ddcc4b37ee91bd84833f2a61ad9c | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/244e6b30ade8987d630b9998b677a8fa97e431bb |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/04ca9148b38530bfdefe22a1e50baefb6ed380c6 |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/bd35da9c9ee1664c3a8952aacf4b2ef3dac70228 | ORPH
    arc      |          libks-1.8.0           | NOK | http://autobuild.buildroot.net/results/8a93b75ee51e005383eac17aa7577b43eda4cd92 |     
 powerpc64   |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/460cd775b50e0b50b7a44b780d5ea8335f3e0119 |     
powerpc64le  |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/417690ddcc9050c0d4f2e0b83db496c31ad524f0 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/86d67e605e6f4b83300e70246cdfd7fab23ce4cf |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/df713e1afd410cbe4362a5b76a30de8c97ca72f7 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/69df98340294395cf9bb98a80b7bfb81aa19f56f |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a3a24fc0cf38acd5059332094257767612e1aeed |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4d192a6dac7dac278c0b1a6720d2d03f123baa76 |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/61f0f96e544fa59677e6483662c74314b4ff9877 |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c43bd4a413356592f74e48e25e7a57bb6428720f |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ded19f7376f9a13c6ec4873b3d812da1806ac04c |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d009443313a6561129d1f46b187e46567c5fc713 |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/f3056c8be3f3952830bfb4f2489ded51c7995393 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/cbdb831935690c5358cfe41e8883826b95065149 |     
  aarch64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/5af6a12af642a0fcfaae94bc7a7a785a3a433cb0 |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e5aa28d5af7324ba50cecdb97fdb0b6f42d653e0 |     
   xtensa    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/bf01daee5117cb96be62ba9b7e55c0ee9333d0c9 | ORPH
    or1k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/3dcb114dbc1e8ede70dd34977c6610592f4d84a9 | ORPH
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/7e8ff783eb669d4fca40cad2f9acf29dd7840652 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/1a53e6268a328c939071945a33692b58b755f24f | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/78fa9fa529cb07046b63cfed0a35ecc3f7a1e24e | ORPH
    or1k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/958c58f20105ff254fa807059f22028dc2bfe6c8 | ORPH
   x86_64    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/2f901c8576d1c741b0f81dc0deb926da721ed440 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/a8c7375962c62955c648ccbf0063361aa77eadfa |     
    or1k     |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/030a5d32a8c6f571da7c809283dfa909e8b94b0a |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/fe96338dae1d58e59ccecded0b2a0288b62acde1 |     
  aarch64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/65ad184858252fd23efb7a601e9a817c536b7c5a |     
   nios2     |         linphone-4.4.8         | NOK | http://autobuild.buildroot.net/results/e4d27116a52044730a6d58865dac4e07ddbc257b | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/df31a99089e79222f7b6cd505597ae66dbe7eb4b | ORPH
    mips     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/302619bdecd176684f74ff95fd011f8921abfea9 | ORPH
    or1k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/a7ddf3924b5b9491d7c2f2d78f5154601881bde8 | ORPH
powerpc64le  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/aba6a9a7a8ae22c022c0152698f48cfc2c72313e | ORPH
powerpc64le  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/f8211e7f2fd9a09ec4106e5cd1b2b909f96c2d6c | ORPH
powerpc64le  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/806be10849eaf5c2ebd307414bb18e715aefffd7 | ORPH
   sh4aeb    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/3eb36286d6ac3d8948245258f84077c4627ccecf | ORPH
   s390x     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/dc25823bfce86c7199a76749202ce68ac52848e1 | ORPH
 powerpc64   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/af73823ae1dc695e956ee2356850b6d8d5720019 | ORPH
    or1k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/35a9527e128120d6f335c416829c71332a35d06d | ORPH
 microblaze  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/dbcf7c1676a6262ccdab3ed874e72784c6fedfd0 | ORPH
   sh4aeb    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/59b60720101c486fdbf7168d80e277953ffc44d7 | ORPH
powerpc64le  |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/8642c114567c58daba6359edd920cfc99dffb63c | ORPH
    m68k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/a6a751529525366f82227af6bbb31b2ccf812dd7 | ORPH
  riscv64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/c23fbf68c766be12536eaaed257ca04fb1b2e8a7 | ORPH
   xtensa    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/42cfad8a7934c9e169eeeb59a0ec8437e26cb0d7 | ORPH
  riscv32    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/8cfbe6da0bad1a9ac8b25efd31d04478bc4a6b62 | ORPH
   sparc     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/cae9721c000daabd50c53de9b0c751f4d4d9731f | ORPH
    arc      |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/77318ad084f9061227e98752745a14d63f1061a3 | ORPH
   mipsel    |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/bfd0d906a05564a4f323db604f3b908abf552b20 |     
    arc      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/8e14d93c5bad7540399839860c91c2e8447d9a64 | ORPH
   sparc     |        netatalk-3.1.13         | NOK | http://autobuild.buildroot.net/results/9e23f09586f4582a0f875d0b8ded9cfcfdf6ed04 | ORPH
 microblaze  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/07240d8470c8b8a029a96fb5dccfdcd51ddfd0f0 |     
    m68k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/dff4972fcfd7904b6a5154aed55183f6e8ec03eb |     
    m68k     |         omniorb-4.3.0          | NOK | http://autobuild.buildroot.net/results/47b1906eb7dd122a81191d14ad663c5931cbfade |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/b03eae6cce0b7ac3ac127e0a83d0eeaf6c6033ac |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/4f3f15c780ded0ce1c9bc8c06ff7cd56bd834611 |     
    mips     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/c9cc1d42ffb244900cf0d21b9c57306ed2f77f26 |     
    or1k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/cd027bbc9fba580624551e7f08971854be749326 |     
   s390x     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/e0a875e9acc564b8c6c5a32d25cd5a7604b41c79 |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/794e3b4e36ac2fc88a700c04f95bda6af65d86de |     
   sparc     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/326fafd6584dc4f989c17ff51e9ffd1badd01c9d |     
 microblaze  | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/471a0a0071ba8bfae2f33766b2fd6ba8494e1413 |     
  mips64el   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/52a22cf6091c2125815e6e33824f5461ed58e43b |     
 powerpc64   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/a62d6d39fe6a365b8cdc675c7ee64ca5f5fff337 |     
 microblaze  | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/3fd56eae791f691b521257abbed6b607922f7688 |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/93299acc7b91e2523f60e1d082817681178488db |     
 microblaze  | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/85f2a0474fb661a588db33dbca6563e8ceada38a |     
    or1k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/3434d682d91ed63f9e35b023d1e075a85a88ff00 |     
microblazeel | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/856281dab3cd0694635aaee8a62660ffffc21622 |     
  mips64el   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/1d0e2ac64735e74759813dc29d957248e65362ad |     
   xtensa    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/29b91c7f7a5334c30478afa733c9b08f03d0549d |     
    mips     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/28113725235c8a1fe080987222e1ea7c9774b8cc |     
   xtensa    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/4434b49af60580f9c81493bcb9dc497c748216c9 |     
    i686     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/d874ce73c25725c67c6200f49d40687851eb1d6f |     
 powerpc64   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/1f3281461b333dffc3a60062a9b467e2b91acb27 |     
microblazeel | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/42e95c514a772410672d18e49028711e5a80e18d |     
 powerpc64   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/84fa00c1a9854032eefbbcba478989f76a23bad4 |     
    arc      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/55869ad326201156c970d8b0327e161350ab3d99 |     
    mips     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/4a655c5bf6d381c9239d8e8cd39c8ad14edf86c1 |     
   s390x     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/c5b98487738869de098cfc21309c6674c81216e7 |     
   sparc     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/7ca8b973112d1d1422aa885509b632f58e31fe3b |     
    i586     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/b6ee69bb05ef3f160a51a87c76eb569f72982991 |     
  aarch64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/955426a2556661a66c6e27e535eba90a1559182e |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/3176a1ea11d4ce01aab8f14fc7cf1b73b55d5113 |     
   mips64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/dffa28583b087456c9f4e4c54ba8449c57a1cbd5 |     
  riscv64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/64a92783b663a838ec59f3fa2de37308f3912f0e |     
microblazeel | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/6b5045ef8208b364a1106686723e738d5780318e |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/678d4f5702bf9229b0af331e0a8835ae387273c4 |     
  riscv64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/0ea4393cb4b268fb418524d45cbd5f5e78ec4f53 |     
   armeb     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/1951e769f9e06b4ecd897f782b35a32fa415b89c |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/f17b0ce7c3d0e828c04a8fdf51468385c781fdfe |     
 microblaze  | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/254f33f368bfb586dab0138d8d89844508bb6880 |     
   mips64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/6892bb71e856054da8e5ba73cfdee89f149ce895 |     
   nios2     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/5e409cf4bcc8e0bb47b953447ce24d37362596f1 |     
   mipsel    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/335fe2105fc3e586224c3bd0a3b9a124b60f4b87 |     
    sh4      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/f82dc39de0c71f9e3dc1e1acf892708f64464326 |     
powerpc64le  | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/af1d1bfd082b99948e5c7307158dd71efc3dc34c |     
   sparc     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/2241280d97a6f24f5353dd8028cab22aa0d65444 |     
 powerpc64   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/76e8b4434dd96811576d76a149b35f73d9d52e67 |     
   s390x     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/7a6ca9f7d6a63cd78f8afccd254ccee97fd230dc |     
   sparc     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/a91bce3f0cdced955f57213a8c0cd78845eb7827 |     
microblazeel | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/78e1433b8b16728259f118c21f3f64e28bea0e6d |     
 microblaze  | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/0048298df11303f668c0b0f3496ab41aaa2c64a7 |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/145550a1b7761d417e4a37145e525dd44f5751a0 |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/bf776a95a76774816c5a2e1aa6b8165b5ba5a959 |     
  sparc64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/6e41fcd6cebe8f38c27e74ba98370292cec7d3c2 |     
    arc      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/0166e0b7dd2e4c18fe96818f802728dd274de975 |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/1af379393364ee0836de2bdd72cd00df3d44dc3b |     
microblazeel | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/0770d7c270d3c91eb1143c8358882c9e616d2236 |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/eb70526166b0455815be7e5c0db3d76be5b75a2e |     
    sh4      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/3f4b1abe3b2e1cdf4ac99131eeb5d7a2cfbb83ae |     
powerpc64le  |        pamtester-0.1.2         | NOK | http://autobuild.buildroot.net/results/c000aff659da024b6eef42bca824bdea7b5541c2 | ORPH
   xtensa    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/136448f6dd714d946290515598a90c2687fcb5ea | ORPH
   mipsel    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/e3017606f60c841f6eb68f4094505b464c28049f | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/34f72326659abd11474bb554de5921357301591c | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/58ef5dc4373a8882ba778fb2ec78e702f92637e7 | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/f47d45ba33cf62641d348e6b0b9aae92d1193d16 | ORPH
    or1k     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/144b075bd090ac3ae71061a7146191447bb1ef0d | ORPH
  powerpc    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/ac2998e3403aad6fbc952a2c91160f346f65ca64 | ORPH
 powerpc64   |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/f1edbb0ce9a91ada75b7005c95d15a9f70624d7e | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/2672fa7db2e865086e72b4f1bbd131f989bac203 | ORPH
  aarch64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/780128187de00194499c628e41f3aceec095d7cc | ORPH
    m68k     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/3c3a0cbf3697e14024f3b5c034611546d37e089c | ORPH
   xtensa    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/0b8e57948d3c07df18627505b6ce1b9f81de7a32 | ORPH
    m68k     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/227db0a5d33f92ab55bcb8817a4f987fda4abe69 | ORPH
  powerpc    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/9b2adb14e0125e034bd2dce68f7090a5a7e90345 | ORPH
  powerpc    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/cefd4d91e31480f2c5a883ea6fe1a80f92e52b88 | ORPH
  sparc64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/ed1adcfa0805c648b5e3f88fea53df5825f12f97 | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/7ceaaa57770879bebf6a2d99dfa60f1ba569e101 | ORPH
  riscv64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/b4a5c069271a604b61aea40d1f632f0419d36b59 | ORPH
  sparc64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/3fe2e499aff02ab3519726ae650158ebf8cc5b4e | ORPH
   mipsel    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/2cadbba3ce3c67f7428435c6688d3e2560965ed0 | ORPH
   xtensa    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/30363c1fbd2bc9ffc9c434811719c43e92ed84cc | ORPH
  riscv64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/e949f0b2b3dbd4e2c910449012ea001302be4972 | ORPH
powerpc64le  |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/f6bb4f2cfecf0202af9ba7c8207e92a5cbd4c658 | ORPH
   xtensa    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/4a62655f3ab757d2a8ac0e1514bb7b96b0844fcf | ORPH
  mips64el   |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/3ec71e72d38c9ea4094976c94734dfd8319643a0 | ORPH
  mips64el   |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/49293a15e78e3dbddb2b060fad6ac7ebb0f862db | ORPH
microblazeel |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/8853dfb017a515a9f90c3981e747d5c283cb60ff | ORPH
    mips     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/d1d0785d073b10900776260e675e665d525d23f6 | ORPH
microblazeel |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/64878921ce597048256407fb86201a49e5f56750 | ORPH
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/88faf7490b1f30aee3116724fa9ec1e9d0a078f7 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d5a0443d7d6f9af7fdc2dae2789008a1f9edc8eb |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4f94d84966a53e60ec5096897f99af22948bb494 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7dfbb13ea0ac233c543371524691642faddf59a8 |     
   armeb     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/71337cc496727f2b1173c055d706c5bfc2f5d2bc |     
   mips64    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/06a5233931ef842f910e589d07622b586cd7f852 |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/c3107d61393999b13f94b409857d2cf1edb72191 |     
   xtensa    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/ec2b4deafd9fb01d64f7c9e7b155f09cdba8f541 |     
   sparc     |          poco-1.11.1           | NOK | http://autobuild.buildroot.net/results/21a3bf006150086b898bfe0f31e365df2053ca74 |     
    mips     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/dd745f43315c4583edbe0e4503fc62831e12a674 |     
  mips64el   | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/a0ba38970ddfaeb340f241e55f07fecc75542552 |     
powerpc64le  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/9926fc231b39cc9bca0433db097c402b610ba5ba |     
  riscv32    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/f643ce2e08bb5ea0e950870c270f55d0aff02131 |     
   mipsel    |   python-cryptography-36.0.1   | NOK | http://autobuild.buildroot.net/results/37201da0e99923c82563ecf0f2ee39737031fd79 |     
   s390x     |      python-zopfli-0.2.1       | NOK | http://autobuild.buildroot.net/results/d0e78baacea179bb05cae53f76f0a7b83b9f4493 |     
  sparc64    |      python-zopfli-0.2.1       | NOK | http://autobuild.buildroot.net/results/c7d1d2dff1efe50d6bf64e67e4f1bdee6f6789a7 |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/3add10bc3e6b50f61bec74969b7dbbcf049a5884 |     
   sparc     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/3ed166f7a301bce421fee1c577816908b6ded322 |     
  powerpc    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/641723419fac3a0cf67ef018b904969d832175d8 |     
    mips     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/d1f60b3034e486e7a37fe789714f6aff809cba4f |     
 microblaze  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/56f75e8d8af22c6194ff0d90786373d2417d344f |     
   mipsel    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/7cd937c054ea6905e82a3ab22a21a0ace9cc4b35 |     
   sh4aeb    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/9568529c2dc301681e8d070e8aafe64eb27c12d8 |     
    i686     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/2384a753c95c812ad524f6e49791ebca3e99b74f |     
 powerpc64   |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/3054e13810c59f913cab88b610adc62aaaf16615 |     
  sparc64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/6375e1efdb60cc65b46eee6ffed2099e69506bca |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/b32d48853015e67c1754253b9af4df4e787d4e6d |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/c96bc6a8ea651dfb1955c05b756ee16abfd6ed68 |     
 microblaze  |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/1f37bdf72dc35e99178932b39a1d07812039672f |     
   x86_64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/fa3db33eda7e71991c1fb07544b14a31392ef2ad |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/49d33cdca0e0f845b5c5a269bdda813f70c48c91 |     
   xtensa    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/34abb5688984e70791e6e51c36c9cd9a2caf2f7f |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/848591927338b1268d438fdb1af5149cb06f250d |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/30502ccce6c7e78abc562215044cf65a41c70793 |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/5e888afb6027bb488cf1aa2bdf8a0c1b25f8ec59 |     
    arm      |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/0b2671ef1de3a06b70686c1f0923aca256894d37 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/e0a77cef46940fe9540548bd729501d3e11fa04f |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/3b199ef7f4e217401986e62d69362d03d743a633 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/bdc860c65c35a5145e7d85082cbc77d9ccc5fca2 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/9a90f599a59859f4a35a02aeff2ab919c704e6e9 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c31a668b16b607080350f432f83c55c1c275e6ee |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c82127b787c66cc4e0321e9e55e771e401937835 |     
  riscv32    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/36683c918a4810b3b8cdb83f784917054823793a |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c3025f21906f530a2d0f2a15cecdc99ef2d0af20 |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/eb3c70a75e74d755f9cf390454cd89ae77a6e34c | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d43ddb97ea8bd89318b4d98eb41604ddb7f8f7bd | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/05677cfdf5bd12789844ad5e5d6c799d46b0a4b1 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7da40dc7b1e2c3690e061f24d2122ee380698a28 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d85f10e9bdb2249474bfea0f8840ea6e3ea0856a | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c8acecf3bb3b43cfdffdbe7d2ddfe07098c6f0da | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/3aecf45c5dc6fbd8e19a6d471cb6e17d3ee5b0ef | ORPH
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/bd03060fb4c706ad86b6a9d51906a081438d1b41 | ORPH
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/9e1efc4240c8c18751ec3532fee3d9100fba478f | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/be71e57e9a9fe9f8fd2b6c292bf5bfe555402e86 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/7e86685c73e4ed7f629e058cfe4358e3b4fafb1d | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/dd23cb90679aed5b0590f74181a23978cbac6a06 | ORPH
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/38cd95ae8f2fbf844d9ac7889c7d220844e6076c |     
 microblaze  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/9433266645da8bc2d67c2c6c6d06082bef6fbe92 |     
 powerpc64   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/8d492fe283ad639fa5fbb8c0045f67f432bb3d70 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a228c25671c8cbc588e44266f874dc6793acbf7c |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6f2c6545a958bcebaa5385a35770130e0f25e0ee |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a3a58c7798245bd5bec9b0e6fcfe22d98dc8a88f |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/014a068e7d54d0843cf49fe213a7b0d3d1caaa3e |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/45be9a1bab42cb5048fe66e78366c09f882fba82 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/034c114fcddb64bd7d078dd1645177d2e82df984 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e3ee376da38e6a3ddccfc9e12168579da3a3571a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bdb793c48bff2bb17c4fcb80ef3b705a91701b6c |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/c45d7d32e81ac36da358ffbfa93479957af7ea8b |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/aeeb2db9711e8aa1fb39f015f31f547c6e1ce11f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f772740354606a2b6405f1b445efa41a7bc72970 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b1c9e1d6a9a5be7511a9f50a5b38c5c96f685037 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/01c7e86e25819a340a33f250b47fe031dd16337f |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/2445a8fcecb257e6849c472e93a3efac29368d67 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/674da45163a78d5492607a12601252218f69f963 |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/76152a44711d21763f2e62e10aac35bfd13559bd |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8986b0d8fbe5523ed6f6d2729ee6656af0336eb1 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/4e83404d7f1cbf72362db79a317dc0a0ae2ae6d1 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/65861b4e8aa14385b987eec201c3b0918af288d9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ff2fb762142b13bfe22c4d591f50d8b9b9a643f9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9993194d8b493883b1920ee51176b12a92484c95 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fd28dc94bae78f50d2eaf8f8ddb9722ad6542dcc |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/eac66f374439e66e899a05e88092d454b1de7c72 |     
    or1k     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/2439836e8a753df0e83c347bc2d9fb89dc9f3872 |     
  sparc64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/e8ea4e3510e11df4ca55c8abfd4447a2f66c6d2a |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/535b35dcb2641ee977104f66f5b41f1b72484028 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b86d8aa7fc3dca792f26143c6b336e998ce9d120 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/937a12b35bcdd5b93f2e9a599ea4dd5126268880 |     
powerpc64le  |            xenomai             | NOK | http://autobuild.buildroot.net/results/5a702a08472aac89cde44eb0c6940d78ea7f99d7 |     
  sparc64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/0ccd15c355981d7eca8244e224d4a54f26bcd949 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/3cf453f7b238962d20513125ba8323470f6729e9 |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/814924c5f9d9fd83ba3afda11d3969e21129b727 |     
    i586     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1887cfc896fa9d58598ecb7d4c93582a47ba328f |     
    sh4      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/73d1bf03e010a550eed0169032fd6e6ad1ada219 |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/8ac3f7fbaa4d4d4d2f2d6f410e17fbbd9f0176ce |     
  mips64el   |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/49a9b9b27ab59a5d23f1a6235291dae4c329f235 |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/ac092a43d57ebf70c8981956fced973b4cf3386b |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/bec52df4be1358dc8072a61379ccebce43801e9d |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/5ff3f6309ae215c7ede91b1ccb11a2401c8c02ec |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/7dfc8e3d6d140c529a196e220c3b0d4592b7faea |     
    i686     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b10e411457feb2af89c0171a51a00f0593c0f2fe |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3f456b564271de6205d28d0de86d5ccf44d7b3f8 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a5c6cd7b0061753c74a089dad72dd11346a9450f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fdd8862c434660a5fa7ac5dc01a189e9e55d85b3 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8913388adbdf86dbadda9a0ea0cf0cfb40bbd271 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/806f943afb0f439243edd4bd279a06045cbd71d8 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/48cb6a8fd28b78a07d57d08d5164ac68098a381a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/936f445f1bffd3650d5df048344b6054facb19dc | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/40800405910995e638450cdce89719926326c60c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/017aefe7b71d7152b8907831373785a0d2fe8bfa | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 2 
           host-harfbuzz-3.3.2 | 1 
             host-pahole-v1.23 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                tinifier-3.4.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |      host-harfbuzz-3.3.2       | NOK | http://autobuild.buildroot.net/results/186ba7c1355f81fbf1dd76a6abbe5c350e2f4aae |     
    arm      |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/53e08d0dd589714be0b6eeeb52992d47563d5135 |     
   x86_64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/8beda6c3282d157a425865f694881413ca2132ad |     
  aarch64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/55e6dde45e14d43976ba24ac5c1a40392c194150 |     
  aarch64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/a40448db1f856019723d5792ea1413158e457f33 |     
    arc      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/f0671ac127a37042fdcdfb3713c22586b9c7e895 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20220331     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 42.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.3        | 4.5.4        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.6        | 1.2.6.1      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 12.1.0_r4    |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.0.1       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.2.1        | 5.2.3        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.25.2      | 19.3.2       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.44.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.8        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2021.02.19   | 2022.02.11   |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.11         | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.12     | 20.10.16     | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.20.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.0       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.4       | 2022.0       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.6.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.17       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.6        | 8.2.0        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.12       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.12       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.27      | 9.18.2       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.37         | 2.38         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.8        | 2.0.9        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 22.0         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.78.0       | 1.79.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.1.3        |     
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.22b        |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.6          | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.34       | 1.5.0        | ORPH
                        cereal |  DISTRO  | https://release-monitoring.org/project/11606 | 1.3.1        | 1.3.2        |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.7.1        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.13         | 6.14         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.5      | 0.104.2      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 14.0.1       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.18.6       | 3.23.1       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.12.4       | 0.13.3       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.3        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.12      | 1.28.15      |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.4.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.5        | 3.0.6        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.11.5       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.2.2        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.0.2        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.2.9        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.22      | 1.14.0       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.8.0        | 1.8.2        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20220414 | ORPH
                     ding-libs |  DISTRO  | https://release-monitoring.org/project/13710 | 0.6.1        | 0.6.2        |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 2.4.1        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.19.0       | 9.20.2       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/21344 | 1.5.3        | 1.5.4        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6.2        | 1.7          |     
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202202       |     
                        efivar |  DISTRO  | https://release-monitoring.org/project/00664 | 37           | 38           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.2       |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.4.0        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 20.07        | 21.12        |     
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.13.4       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.49         | 0.50         |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.3       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 24.3.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.21       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.18       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.29       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.14       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.8        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.45       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.27       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.2.0        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.13       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.24       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.48       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.6        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.28       | 1.0.32       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.12       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.9        | 1.0.10       |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.15         | 5.17         |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.8.3.0      |     
                         expat |  DISTRO  | https://release-monitoring.org/project/00770 | 2.4.7        | 2.4.8        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.26         | 1.28         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.8          |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.1        | 5.0.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.30         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.17.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.13.04      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.13.04      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.1.1        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.0       | ORPH
                         frotz |  DISTRO  | https://release-monitoring.org/project/36391 | 2.53         | 2.54         |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.8.2        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.11.00     | 22.03.00     |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.11       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 3.41.0       | ORPH
                          gdbm |  DISTRO  | https://release-monitoring.org/project/00882 | 1.22         | 1.23         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.8       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.9        | 2.4.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.55.0       | 9.56.1       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.2       | 2.36.0       |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/17093 | 0.6.0        | 0.7.0        | ORPH
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.72.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.72.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.5.0        | 0.6.0        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.14       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.32       | 2.3.5        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.10.2.0     |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.70.0       | 1.72.0       | ORPH
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.8        | 1.0.9        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 6.2.0        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.37       | 1.3.38       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.44.0       | 1.45.2       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 42.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.5.0        |     
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.0.0        |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.6.1        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.4.1        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.5.0        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.1       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.4.15       | 2.5.5        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 4.2.0        | 4.2.1        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.18       |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.11.2       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.2       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.3.3        | 1.3.4        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.355        | 0.358        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.7.0        | 2.7.1        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.40.0       | 2.41.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 71-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.37       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-19     | 7.1.0-31     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.9.0        |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 53           | 55           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.1.0     | ORPH
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20220419     | ORPH
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.1.6        | 2.1.7        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.10.1       | 3.11         |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.24         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.25         | 1.27         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.20       | 1.9.21       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.11.6       | 1.0.0        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 3.0.3        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.3.1        | 3.4.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.13.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.1       |     
                        json-c |  DISTRO  | https://release-monitoring.org/project/01477 | 0.15         | 0.16         |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.9.1        |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.23       | 2.0.24       | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.3-Ma... | 20.1.2-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.1-Ma... | 20.1.1-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.4.1-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.2.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.2.1-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.3.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.2.2-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.1.0-Ma... | 20.3.0-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.8-Ma... | 20.2.5-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.3-Ma... | 20.2.3-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.2.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.2.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.1.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.2-Ma... | 20.2.1-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.2.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.3-Ma... | 20.2.2-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.3.0-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.2.1-Ma... | 20.4.2-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.2.1-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.13-M... | 20.2.1-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.0.1-Ma... | 20.1.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.2-Ma... | 20.1.0-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.1.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.0       | 3.10.1       |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/09815 | 2.13         | 2.13.1       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                        libaio |  DISTRO  | https://release-monitoring.org/project/01557 | 0.3.112      | 0.3.113      | ORPH
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.26-1       | ORPH
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.6       |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.63         | 2.64         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0.1        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.0.1        | 1.03         |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.11       | 1.0.12       |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.5       | ORPH
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/01623 | 1.10.0       | 1.10.1       | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.4.2        | 1.4.3        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.6        | 3.3.7        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.70.4       | 2.72.1       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.3.2        | 1.4.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.42         | 1.45         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.16.0       | 1.17.1       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.29       | ORPH
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.6.3        |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 236          | 237          |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/01632 | 0.5.39       | 0.5.40       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.38         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.14       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.20.0       | 1.20.1       |     
                        libite |  DISTRO  | https://release-monitoring.org/project/17367 | 2.5.1        | 2.5.2        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.4.0        | ORPH
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.11.4       | 0.11.6       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.3        |     
                        libmnl |  DISTRO  | https://release-monitoring.org/project/01663 | 1.0.4        | 1.0.5        | ORPH
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.0.24       | 2.1.7        |     
                  libnfnetlink |  DISTRO  | https://release-monitoring.org/project/01682 | 1.0.1        | 1.0.2        | ORPH
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.1        | ORPH
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.11       |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/02566 | 1.1.1n       | 3.0.2        |     
                     libosmium |  DISTRO  | https://release-monitoring.org/project/07023 | 2.17.3       | 2.18.0       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.30.0       | 1.32.0       | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.3        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.3        | 2.0.6        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.4.3        | 3.5.2        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.1       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.2        | 2.0.3        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.5.3        | 2.5.4        |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.5        | 2.4.6        | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.0.7        | 3.2.0        | ORPH
                    libsndfile |  DISTRO  | https://release-monitoring.org/project/13277 | 1.0.31       | 1.1.0        |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.0       | 3.0.6        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.6        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.5.0        | 1.6.2        | ORPH
                        libusb |  DISTRO  | https://release-monitoring.org/project/01749 | 1.0.25       | 1.0.26       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.43.0       | 1.44.1       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.4          | 1.5          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.12.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.2.0        |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.0.112      | 2.0.164      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.24       | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20220310     | 20220411     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.04.15   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 14.0.1       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.13       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 14.0.1       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.18.0       | 3.19.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/01842 | 0.641        | 0.651        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.4        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.2       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.1       | 2.13.3       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.2       | 2.13.7       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.15      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2107         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.0        | 1.7.1        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.34      | 10.8.2       | ORPH
             matchbox-keyboard |  DISTRO  | https://release-monitoring.org/project/230595 | 0.1          | 0.1.1        |     
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.22       | 1.5.23       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.0       | 3.1.0        |     
                        mbpfan |  DISTRO  | https://release-monitoring.org/project/115980 | 2.2.1        | 2.3.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20211018     | 20220418     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 180          | 181          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.5.1      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.20       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.12       | 1.6.15       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mender |  DISTRO  | https://release-monitoring.org/project/20629 | 3.1.0        | 3.2.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.0.2       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.0.2       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.62.0       | 0.62.1       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.44.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.4.1        | 5.5.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.4.1        | 5.5.0        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2022.02      | 2022.04      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20220315     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.10.0       | 0.10.1       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 5.3.1        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.6          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.177   |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.29.3       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.1       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.20       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.3        | 2.1.4        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.39       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.94         | 0.95         | ORPH
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.19.0       |     
                          musl |  DISTRO  | https://release-monitoring.org/project/11688 | 1.2.2        | 1.2.3        |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.16         | 2.1.1        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20220423 | ORPH
                        netcat |  DISTRO  | https://release-monitoring.org/project/21534 | 0.7.1        | 1.218        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.34.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.0.35       | 2.1.16       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.1        | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.18       |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.1        | 1.0.2        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.47.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.21.6       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 14.18.3      | 18.0.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.14.1       | 0.15.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.132      | 390.147      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 510.60.02    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.0          | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ocrad |  DISTRO  | https://release-monitoring.org/project/02526 | 0.27         | 0.28         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.3.4       |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.2.2       | 1.3          | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.21.1       | 1.22.0       |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.5.5        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.8.0        |     
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.14.1+1  | 19+19        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.3        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.44.10      |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 12.0.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.5.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.16.0       | 3.17.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.16.0       | 3.17.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.16.0       | 3.17.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.16.0       | 3.17.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.28       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.12       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.0       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.4          | 3.5          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.14.5       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.7.0        | 3.8.0        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202203       | ORPH
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
      perl-crypt-openssl-guess |  DISTRO  | https://release-monitoring.org/project/17375 | 0.12         | 0.15         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/02748 | 0.31         | 0.32         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.14         | 6.15         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.76         | 3.78         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.14         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.60         | 6.62         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220408   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.22         | 9.24         |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/03152 | 6.21         | 6.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.0.17       | 8.1.5        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.21       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.5.0        | 3.7.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.4        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.2.1        | 2.2.2        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                          pigz |  DISTRO  | https://release-monitoring.org/project/03642 | 2.6          | 2.7          |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.0        | ORPH
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/91990 | 1.28         | 1.29.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.8.0        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.11.1       | 1.11.2       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 2.1          | 2.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 21.12.0      | 22.04.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/03694 | 3.2.0        | 3.2.1        |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.3.9        | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.0        | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7d       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.0.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.13      | 0.12.0       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.19.1       | 3.20.1       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.14         | 4.16         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 15.0         |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 3.1.0        | 3.1.11       |     
             python-aioblescan |  DISTRO  | https://release-monitoring.org/project/21242 | 0.2.8        | 0.2.12       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.1        | 0.4.3        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.0.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.2        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.5.0        |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 22.1.1       | 22.3.2       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.9.1        | 2.10.1       |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.10.0       | 4.11.1       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.14.2       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.19.2       | 1.21.46      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.22.2       | 1.24.46      |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 2.0.0b1      |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.4        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.4.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.6.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.1       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.1.2        | 8.1.2        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.6.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.3.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 36.0.1       | 36.0.2       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.3.0        | 2.4.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.27      | 3.0.0a10     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.54.2       | 0.55.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 5.1.0        | 5.1.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.3        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.1.0        | 2.2.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.3        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0b2     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.1        |     
            python-entrypoints |  DISTRO  | https://release-monitoring.org/project/12081 | 0.3          | 0.4          |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 3.2          | 3.3          |     
                 python-falcon |  DISTRO  | https://release-monitoring.org/project/03860 | 3.0.1        | 3.1.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.1.2        | 2.1.1        |     
     python-flask-expects-json |  DISTRO  | https://release-monitoring.org/project/127659 | 1.5.0        | 1.7.0        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 2.1.0        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.5.0        | 0.6.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.5.1        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 0.15.1       | 1.0.1        |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.32.0       | 4.33.2       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.27       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.0       | 3.42.1       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.4       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 4.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.31.1       | 8.2.0        |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.2        |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 2.0.1        | 2.1.2        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.5.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 3.0.3        | 3.1.1        |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 0.10.0       | 1.0.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.4.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.5.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.4.2        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 2.0.1        | 3.0.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.5        | 1.2.0        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.3.4        | 3.3.6        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.1        | 2.4.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.0.1        | 2.1.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.5.1        |     
        python-memory-profiler |  DISTRO  | https://release-monitoring.org/project/38508 | 0.58.0       | 0.60.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.2        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.12.0       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.6.3        | 2.8          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.21.2       | 1.22.3       |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.1        | 3.2.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.6.1        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.8.1        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 9.0.1        | 9.1.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 22.0.4       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.1.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.29       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.19.1       | 3.20.1       |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.8.0        | 5.9.0        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.3        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2022.1.1     |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.9.0        | 2.9.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.21.0       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.8.2        | 1.9.0        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.27         | 0.28         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.12.0       |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 2.0.2        | 2.0.3        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.9          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.20.0       |     
                  python-pylru |  DISTRO  | https://release-monitoring.org/project/21584 | 1.2.0        | 1.2.1        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.3        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.19.6       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 21.0.0       | 22.0.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 3.0.7        | 3.0.8        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.12.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.6       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.9        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.3       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.2       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.2.5        | 7.1.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.15.1       | 0.18.3       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2021.3       | 2022.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.22.0       | 0.23.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 23.0.0b1     |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.2.2        |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.2        | 1.3.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2022.4.24    |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2021.3.2     | 2022.3.7     |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.0        | 1.3.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.7.0        | 0.7.1        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.3.0        | 4.3.4        |     
                    python-rsa |  DISTRO  | https://release-monitoring.org/project/08808 | 4.7.2        | 4.8          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.5.0        | 0.5.2        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.2        |     
       python-semantic-version |  DISTRO  | https://release-monitoring.org/project/06514 | 2.8.5        | 2.9.0        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.4.3        | 1.5.10       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 18.1.0       | 21.1.0       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.2.2        | 1.2.3        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 60.9.3       | 62.1.0       |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.5       | 3.17.6       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 4.0.0        | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.6.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.2.post1  |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.35       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.1        | 1.3.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.2        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 5.0.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.16.0       |     
                  python-tomli |  DISTRO  | https://release-monitoring.org/project/207408 | 1.2.0        | 2.0.1        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.64.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.1.1        |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.2.0       | 22.4.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 21.1.0       | 22.0.0       |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 3.10.0.2     | 4.2.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 4.2.0        | 5.2.0        |     
 python-unittest-xml-reporting |  DISTRO  | https://release-monitoring.org/project/72281 | 3.0.4        | 3.2.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.26.8       | 1.26.9       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.2       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.1.6        | 2.1.7        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 54.3         | 55.0b1       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.3.2        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.3         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 1.0.1        | 2.1.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.14.0       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.1        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.3        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.7.2        | 1.8.0        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.38.4       |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.10.2       | 3.10.4       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 6.2.0        | 7.0.0        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 10.6.3       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.37.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.2          | 1.3          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.9.15       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2022-02-01   | 2022-04-01   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.0        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.1.2        |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.2.3        | 3.2.4        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2204.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.3          | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.0.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.1.0        | 3.1.2        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.40.3       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.20.0       | 2.21.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.1.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.3      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.7.3      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.5.1.7      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.4.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.3.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.6       | 4.16.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.32       | 1.1.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.3.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.59.0       | 2.0.3        |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.17       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.4        | 4.3.5        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.5         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.11.2.0     |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.2          | 7.3          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.4.10       | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.9        | 3.4.10       |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.18.0     | 3.1.27.0     |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.6-41... | 1.13.7       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.3       | 0.14.4       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.0        | 4.5.1        |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/04879 | 4.5          | 4.5.1        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.3          | 5.5          | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 3.7.1        | 3.7.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.7       | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 0.22.0       | 0.22.1       |     
                    stm32flash |  DISTRO  | https://release-monitoring.org/project/227276 | 0.6          | 0.7          |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.16         | 5.17         |     
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.4        | 1.0.5        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.60         | 5.63         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.8p2      | 1.9.10       | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.4        | 6.0.5        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.27.1       | 0.29.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.35.1       | 3.36.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.44.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.0.53       | 2.1.42       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.6       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.16       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.03         | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.4        | 4.4.1        | ORPH
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.1.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.4.8        | 2.4.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.16.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.5.2        | 2.6.1        |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 3.5.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20210601     | 20220311     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.32         | 1.37         |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.2a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.1        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/18777 | 1.7.0        | 1.8.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.0.3        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2021e        | 2022a        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.04      |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20200328     | 20211207     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.11         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.2.0.0      |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 2.2          |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 6.1.3        | 6.1.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.5.16       |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.11      | 0.99.17      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.11.0_li... | 2.12.1_li... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.1       | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.18.1       | 3.19.0       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.4732     | 8.2.4815     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.16       | 3.0.17.4     |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.8          | 2.9          |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.68.0       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.212      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 0.2.10       |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.36.0       | 2.36.1       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.11       | 5.5.13       |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.7         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 7.7          |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20210606 | 1.0.20211208 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.04.08   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.9        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.12       | 3.6.3        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.14.1       | 0.15.1       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.36.0       | 2.36.1       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/15053 | 1.0.5        | 1.0.6        |     
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/17160 | 1.0.7        | 1.0.8        |     
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/15048 | 1.0.8        | 1.0.9        |     
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/17161 | 1.0.4        | 1.0.5        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20220111     |     
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/15043 | 1.2.1        | 1.2.2        |     
                   xapp_rstart |  DISTRO  | https://release-monitoring.org/project/21256 | 1.0.5        | 1.0.6        |     
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/12314 | 1.3.2        | 1.3.3        |     
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/15038 | 1.0.11       | 1.0.12       |     
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/05253 | 1.1.1        | 1.1.2        |     
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/05164 | 1.1.0        | 1.1.1        |     
                   xapp_xclock |  DISTRO  | https://release-monitoring.org/project/15032 | 1.0.9        | 1.1.1        |     
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/05255 | 1.1.12       | 1.1.13       |     
                 xapp_xdpyinfo |  DISTRO  | https://release-monitoring.org/project/15028 | 1.3.2        | 1.3.3        |     
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/05180 | 1.2.2        | 1.2.3        |     
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/14992 | 1.1.3        | 1.1.4        |     
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/14964 | 1.0.6        | 1.0.7        |     
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/05259 | 1.0.4        | 1.0.5        |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/15900 | 19.1.0       | 22.0.0       |     
      xdriver_xf86-video-dummy |  DISTRO  | https://release-monitoring.org/project/05216 | 0.3.8        | 0.4.0        |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.4       | 4.16.1       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 5.15.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.34         | 2.35.1       |     
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.7.3.1      | 1.7.5        |     
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/01770 | 1.2.0        | 1.2.1        |     
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/01796 | 1.0.12       | 1.0.13       |     
                         xmrig |  DISTRO  | https://release-monitoring.org/project/17499 | 6.16.4       | 6.17.0       |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2021.5       | 2022.1       |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.2       | 21.1.3       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.20         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 371          | 372          | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 11.1         |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.0.3        |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.0.5        | 2.1.4        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2021e        | 2022a        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                     e2fsprogs | CVE-2022-1304    | https://security-tracker.debian.org/tracker/CVE-2022-1304   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2022-24754   | https://security-tracker.debian.org/tracker/CVE-2022-24754  
                      libpjsip | CVE-2022-24764   | https://security-tracker.debian.org/tracker/CVE-2022-24764  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                       mariadb | CVE-2022-27376   | https://security-tracker.debian.org/tracker/CVE-2022-27376  
                       mariadb | CVE-2022-27377   | https://security-tracker.debian.org/tracker/CVE-2022-27377  
                       mariadb | CVE-2022-27378   | https://security-tracker.debian.org/tracker/CVE-2022-27378  
                       mariadb | CVE-2022-27379   | https://security-tracker.debian.org/tracker/CVE-2022-27379  
                       mariadb | CVE-2022-27380   | https://security-tracker.debian.org/tracker/CVE-2022-27380  
                       mariadb | CVE-2022-27381   | https://security-tracker.debian.org/tracker/CVE-2022-27381  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27383   | https://security-tracker.debian.org/tracker/CVE-2022-27383  
                       mariadb | CVE-2022-27384   | https://security-tracker.debian.org/tracker/CVE-2022-27384  
                       mariadb | CVE-2022-27385   | https://security-tracker.debian.org/tracker/CVE-2022-27385  
                       mariadb | CVE-2022-27386   | https://security-tracker.debian.org/tracker/CVE-2022-27386  
                       mariadb | CVE-2022-27387   | https://security-tracker.debian.org/tracker/CVE-2022-27387  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27445   | https://security-tracker.debian.org/tracker/CVE-2022-27445  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27447   | https://security-tracker.debian.org/tracker/CVE-2022-27447  
                       mariadb | CVE-2022-27448   | https://security-tracker.debian.org/tracker/CVE-2022-27448  
                       mariadb | CVE-2022-27449   | https://security-tracker.debian.org/tracker/CVE-2022-27449  
                       mariadb | CVE-2022-27451   | https://security-tracker.debian.org/tracker/CVE-2022-27451  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mariadb | CVE-2022-27455   | https://security-tracker.debian.org/tracker/CVE-2022-27455  
                       mariadb | CVE-2022-27456   | https://security-tracker.debian.org/tracker/CVE-2022-27456  
                       mariadb | CVE-2022-27457   | https://security-tracker.debian.org/tracker/CVE-2022-27457  
                       mariadb | CVE-2022-27458   | https://security-tracker.debian.org/tracker/CVE-2022-27458  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openjpeg | CVE-2021-3575    | https://security-tracker.debian.org/tracker/CVE-2021-3575   
                      openjpeg | CVE-2022-1122    | https://security-tracker.debian.org/tracker/CVE-2022-1122   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                       python3 | CVE-2022-26488   | https://security-tracker.debian.org/tracker/CVE-2022-26488  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       rtl_433 | CVE-2022-27419   | https://security-tracker.debian.org/tracker/CVE-2022-27419  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tiff | CVE-2022-0865    | https://security-tracker.debian.org/tracker/CVE-2022-0865   
                          tiff | CVE-2022-0891    | https://security-tracker.debian.org/tracker/CVE-2022-0891   
                          tiff | CVE-2022-0907    | https://security-tracker.debian.org/tracker/CVE-2022-0907   
                          tiff | CVE-2022-0908    | https://security-tracker.debian.org/tracker/CVE-2022-0908   
                          tiff | CVE-2022-0909    | https://security-tracker.debian.org/tracker/CVE-2022-0909   
                          tiff | CVE-2022-0924    | https://security-tracker.debian.org/tracker/CVE-2022-0924   
                          tiff | CVE-2022-1056    | https://security-tracker.debian.org/tracker/CVE-2022-1056   
                          tiff | CVE-2022-1210    | https://security-tracker.debian.org/tracker/CVE-2022-1210   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                     e2fsprogs | CVE-2022-1304    | https://security-tracker.debian.org/tracker/CVE-2022-1304   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2022-24754   | https://security-tracker.debian.org/tracker/CVE-2022-24754  
                      libpjsip | CVE-2022-24764   | https://security-tracker.debian.org/tracker/CVE-2022-24764  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                       mariadb | CVE-2022-27376   | https://security-tracker.debian.org/tracker/CVE-2022-27376  
                       mariadb | CVE-2022-27377   | https://security-tracker.debian.org/tracker/CVE-2022-27377  
                       mariadb | CVE-2022-27378   | https://security-tracker.debian.org/tracker/CVE-2022-27378  
                       mariadb | CVE-2022-27379   | https://security-tracker.debian.org/tracker/CVE-2022-27379  
                       mariadb | CVE-2022-27380   | https://security-tracker.debian.org/tracker/CVE-2022-27380  
                       mariadb | CVE-2022-27381   | https://security-tracker.debian.org/tracker/CVE-2022-27381  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27383   | https://security-tracker.debian.org/tracker/CVE-2022-27383  
                       mariadb | CVE-2022-27384   | https://security-tracker.debian.org/tracker/CVE-2022-27384  
                       mariadb | CVE-2022-27385   | https://security-tracker.debian.org/tracker/CVE-2022-27385  
                       mariadb | CVE-2022-27386   | https://security-tracker.debian.org/tracker/CVE-2022-27386  
                       mariadb | CVE-2022-27387   | https://security-tracker.debian.org/tracker/CVE-2022-27387  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27445   | https://security-tracker.debian.org/tracker/CVE-2022-27445  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27447   | https://security-tracker.debian.org/tracker/CVE-2022-27447  
                       mariadb | CVE-2022-27448   | https://security-tracker.debian.org/tracker/CVE-2022-27448  
                       mariadb | CVE-2022-27449   | https://security-tracker.debian.org/tracker/CVE-2022-27449  
                       mariadb | CVE-2022-27451   | https://security-tracker.debian.org/tracker/CVE-2022-27451  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mariadb | CVE-2022-27455   | https://security-tracker.debian.org/tracker/CVE-2022-27455  
                       mariadb | CVE-2022-27456   | https://security-tracker.debian.org/tracker/CVE-2022-27456  
                       mariadb | CVE-2022-27457   | https://security-tracker.debian.org/tracker/CVE-2022-27457  
                       mariadb | CVE-2022-27458   | https://security-tracker.debian.org/tracker/CVE-2022-27458  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2022-1328    | https://security-tracker.debian.org/tracker/CVE-2022-1328   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openjpeg | CVE-2021-3575    | https://security-tracker.debian.org/tracker/CVE-2021-3575   
                      openjpeg | CVE-2022-1122    | https://security-tracker.debian.org/tracker/CVE-2022-1122   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                 python-django | CVE-2022-28346   | https://security-tracker.debian.org/tracker/CVE-2022-28346  
                 python-django | CVE-2022-28347   | https://security-tracker.debian.org/tracker/CVE-2022-28347  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                       python3 | CVE-2022-26488   | https://security-tracker.debian.org/tracker/CVE-2022-26488  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       rtl_433 | CVE-2022-27419   | https://security-tracker.debian.org/tracker/CVE-2022-27419  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                    subversion | CVE-2021-28544   | https://security-tracker.debian.org/tracker/CVE-2021-28544  
                    subversion | CVE-2022-24070   | https://security-tracker.debian.org/tracker/CVE-2022-24070  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tiff | CVE-2022-0865    | https://security-tracker.debian.org/tracker/CVE-2022-0865   
                          tiff | CVE-2022-0891    | https://security-tracker.debian.org/tracker/CVE-2022-0891   
                          tiff | CVE-2022-0907    | https://security-tracker.debian.org/tracker/CVE-2022-0907   
                          tiff | CVE-2022-0908    | https://security-tracker.debian.org/tracker/CVE-2022-0908   
                          tiff | CVE-2022-0909    | https://security-tracker.debian.org/tracker/CVE-2022-0909   
                          tiff | CVE-2022-0924    | https://security-tracker.debian.org/tracker/CVE-2022-0924   
                          tiff | CVE-2022-1056    | https://security-tracker.debian.org/tracker/CVE-2022-1056   
                          tiff | CVE-2022-1210    | https://security-tracker.debian.org/tracker/CVE-2022-1210   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  
                          zlog | CVE-2021-43521   | https://security-tracker.debian.org/tracker/CVE-2021-43521  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
