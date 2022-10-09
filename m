Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E885C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 06:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE6240289;
	Sun,  9 Oct 2022 06:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEE6240289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utiYtxeUkNv0; Sun,  9 Oct 2022 06:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36DA7401FB;
	Sun,  9 Oct 2022 06:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36DA7401FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C809C1BF303
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 06:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2232401FB
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 06:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2232401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xKo56JavWwe5 for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 06:39:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0861E4011C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0861E4011C
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 06:39:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8CA6B100005
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 06:39:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 09 Oct 2022 06:39:07 -0000
Message-Id: <20221009063914.A2232401FB@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665297547; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HatVTcW2I8wWAscaWet8XNmRB3yZh0RXF1+lQi11n+Q=;
 b=XS/RTjBn9TVJN+htY479IbKU+ig1YF/m4eV+RzmNBaCZ48clWlQeqiq4PZZRP2hheLx7HA
 MzGqZ9VPjcboQHofMsL+D4A97XE0nEwGNUrZhhusG0aL7A7XcqIZGo6J4TYsKPz+fd0PlL
 id6/bwUr/Zg4/bQbRLUdOuOv4Ie8Ficmbuh/JRW0pffwQBKzpjI4/xNRY5X/H/3tGk/pRZ
 7DVItjEFQk7NyToVBRlmMJpLZMWiPAhnZ040xrNZQ8nukuLaKZuwl4yopG9SRZPFAaH6GT
 dBnTuCLAagR44dBNcBnJYnAF7Rn/7tbGTTGWYfUol/NfUpLIRw4cDdqGGGzSoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XS/RTjBn
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-08
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

Autobuild statistics for 2022-10-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 11  |  2  |  0  | 13  |
  2022.05.x  | 14  | 14  |  0  | 28  |
  2022.08.x  | 14  | 22  |  0  | 36  |
    master   | 157 | 375 |  8  | 540 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 22
                 sysvinit-2.99 | 17
                      crun-1.5 | 15
        host-sentry-cli-1.59.0 | 15
            ocf-linux-20171122 | 14
              libarchive-3.6.1 | 12
                     linux-6.0 | 12
            igd2-for-linux-2.1 | 11
                  autofs-5.1.8 | 9 
                        brltty | 8 
        host-f2fs-tools-1.15.0 | 8 
               libglib2-2.72.3 | 8 
                  gensio-2.5.5 | 7 
            host-binutils-2.38 | 7 
            btrfs-progs-5.16.2 | 6 
                 dash-0.5.11.5 | 6 
                gerbera-1.10.0 | 6 
                host-go-1.19.1 | 6 
                   perl-5.34.1 | 6 
             batman-adv-2021.4 | 5 
dahdi-linux-5c840cf43838e06... | 5 
         host-gcc-final-11.3.0 | 5 
host-pahole-73383b3a39afe86... | 5 
               linux-pam-1.5.2 | 5 
                 systemd-250.4 | 5 
casync-4ad9bcb94bc83ff36cfc... | 4 
                     efivar-38 | 4 
                elfutils-0.186 | 4 
                   hdparm-9.63 | 4 
                     php-8.1.9 | 4 
                       unknown | 4 
                 fdk-aac-2.0.2 | 3 
                     file-5.41 | 3 
  gobject-introspection-1.72.0 | 3 
            host-binutils-2.37 | 3 
              host-rust-1.64.0 | 3 
             libgpg-error-1.45 | 3 
          linux-5.10.145-cip17 | 3 
                    lxc-4.0.12 | 3 
               openpgm-5-3-128 | 3 
                python3-3.10.7 | 3 
uqmi-0a19b5b77140465c29e2af... | 3 
                  acpid-2.0.33 | 2 
azure-iot-sdk-c-LTS_07_2022... | 2 
                  bind-9.16.31 | 2 
          cryptodev-linux-1.12 | 2 
                 dmalloc-5.6.5 | 2 
            host-binutils-2.39 | 2 
host-gdb-arc-2020.09-releas... | 2 
                  jack2-1.9.20 | 2 
               libcap-ng-0.8.3 | 2 
                libglvnd-1.4.0 | 2 
               mariadb-10.3.36 | 2 
          moby-buildkit-0.10.0 | 2 
              open62541-v1.3.3 | 2 
     s6-portable-utils-2.2.3.2 | 2 
                tealdeer-1.5.0 | 2 
toolchain-external-codescap... | 2 
                   uhd-4.3.0.0 | 2 
                xenomai-3.0.10 | 2 
               xfsprogs-5.14.2 | 2 
                    zstd-1.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                    4th-3.64.1 | 1 
                 a10disp-0.6.1 | 1 
              alsa-lib-1.2.7.2 | 1 
               apcupsd-3.14.14 | 1 
                 augeas-1.12.0 | 1 
  binutils-arc-2020.09-release | 1 
             bluez5_utils-5.65 | 1 
                  botan-2.19.2 | 1 
              containerd-1.6.8 | 1 
            cppcms-2.0.0-beta2 | 1 
                     frr-8.3.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /tmp/i... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                     gmp-6.2.1 | 1 
       host-gcc-initial-11.3.0 | 1 
       host-gcc-initial-12.2.0 | 1 
host-spirv-llvm-translator-... | 1 
            igh-ethercat-1.5.2 | 1 
               ipmitool-1_8_19 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
libcamera-ba6435930f08e802c... | 1 
                   libnl-3.6.0 | 1 
                   libnss-3.83 | 1 
              libostree-2022.5 | 1 
                   libqb-2.0.6 | 1 
      linux-5.10.145-cip17-rt7 | 1 
        ltp-testsuite-20220930 | 1 
            lttng-tools-2.13.2 | 1 
make: *** Waiting for unfin... | 1 
                 mesa3d-22.1.6 | 1 
                  netsurf-3.10 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.21 | 1 
                 openssh-9.0p1 | 1 
package/qt6/qt6base/qt6base... | 1 
                     pv-1.6.20 | 1 
          python-orjson-3.7.11 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
                  reaver-1.6.6 | 1 
          refpolicy-2.20220106 | 1 
sconeserver-8d1935919a20133... | 1 
uclibc-ng-test-0844445e7358... | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 
                       zip-3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e23e5ca46df6e138771b37a1c4a46216591d2887 |     
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c0ee998f550f90f0aba21eb7bfdfba60e4461814 |     
   mips64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/74e26c8bd78be0ffdec814ee196856897c491326 |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/32c661b62b9a6341b8ae19876344194538237652 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/7a222291acdb03468af1948ddf7294a3389cb5d7 | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/78dc0c70811dd9d1badd30a5b1659a18251c201e | ORPH
   mips64    |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/ca996ba7af04864b7af28dc94d18afde42d6d054 |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c160845944ac1da0a8ccaac3930a2286283cf985 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/e1b9825fc8c833cbc98d7f0080fc42ad9034a183 | ORPH
    sh4a     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/9c5bc055ccd5b7cc0f3d6b048995bafda5aefca5 |     
   x86_64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a75f5deb6419055d5fa6965ba8e09d63ff883b85 |     
  riscv64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d2e999d2a8856246f7a9f259535adf6204bab389 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/874340745f087eddb954d37109a3705e208522d7 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/75a7dfd2f2e0914c0d1bd6775b4dddc177a36628 |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/7653fe6a2619148a71dfe8602eb6de98c77845ec |     
   x86_64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/8c8d99d2298f85db200879850f8fc7fee540a7bf |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/90412a15eddf12f5ba67f4de7c9f6a8448c5d36c |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/6a6da5d33903f6950c12709a12843aae2199eeba |     
   sparc     | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/5de776d70191e8cf9ce52614ada430a5507ea51e |     
  riscv64    | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/1633276e5a89982ce89faeae311a60c1f461ab0a |     
  riscv32    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/bd553420e4eb0dbe7dd3be9c8c6923c45444d0fa |     
   mips64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/7a9ccf310b1b3ab54a2e12bf3a03c7e2a8a1a37b |     
   mips64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/38c0a90821f5fd06b3d6bb42ef46246a1362cf25 |     
   x86_64    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/054ba624e8805d01acc2ffbc25a35327d81b4a6e |     
powerpc64le  |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/7cc67db5fb8c965b6b2f3fc40aaeb9f08a376706 |     
    or1k     |          bind-9.16.31          | NOK | http://autobuild.buildroot.net/results/b32930f9cefe101af3d51d5590ee2367b5881a1b | ORPH
    sh4      |          bind-9.16.31          | NOK | http://autobuild.buildroot.net/results/80ce5f34cd246f081538bf89705ab606518c4e1b | ORPH
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/dfaa69d7da8385bf36a56e2ac36f13e3d766ebd2 |     
   sh4eb     |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/7aa2b3ba85d48e17e5991dd978e796c176440db0 |     
 aarch64_be  |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/ad1e4b8208f70c4385d8f716aa7de631cbd55300 | ORPH
    mips     |             brltty             | TIM | http://autobuild.buildroot.net/results/ca764fa1cc73d9a3bba7c5900235643fbc125a30 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/003d975fc80c289efe8ade781c1ee8f85c44ff33 |     
   x86_64    |             brltty             | TIM | http://autobuild.buildroot.net/results/1c4fba03f14ed9b54da965cb4a9922f33232f277 |     
    arm      |             brltty             | TIM | http://autobuild.buildroot.net/results/e2b091215f3d72e3cecc9f71abb3352ae02e1853 |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/be8fdd45c19192c0f5c82dac648fd269300b7184 |     
   s390x     |             brltty             | TIM | http://autobuild.buildroot.net/results/1af2ff23f97f014ca3b5493ba0ac8c29fc7877d2 |     
   sh4eb     |             brltty             | TIM | http://autobuild.buildroot.net/results/d47589e205bcbb6586580cfa5bef3da92b17c2b8 |     
    i686     |             brltty             | TIM | http://autobuild.buildroot.net/results/9b5d603de2a87e50ece439e8c025446fdd503c9e |     
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e74337ed6ed3041edf1801dd5d9e4c98f316e2f6 | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/f07af17cbaaeae48094ed6664fce57200f37c650 | ORPH
    mips     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a99d7ca3388fdbaa3e30ec4e6fa52f0ac2379199 | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/4a03d07e5935dab19fa16ab217cd9865f5cb9abf | ORPH
  riscv64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/12552f380fc1369ef2b1b7b1cdd0493674c23913 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/1b2dbb0253618356a41e37e8364091992f41d2f0 | ORPH
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5671fb27ab4c7a721a8d1e5043ede0d07ca25aa5 |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/403994094d7c97a6c70f9f096add534b4b698a54 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4a2782e89ff04a2e9f2b70b1be39ebc9915bc81e |     
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/31c4cb85403e09dc752c317a35f5ada0acd20c0c |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/05a81b3434d8897a6bf3ca4add6debe3f1ff103d |     
   nios2     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/1d8813f7cacc8e60fdea40c45c938f5fec201d40 | ORPH
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b72b1fd2cb02204e2cde26e93418fd7778d2eb8f |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/be779b7fc656c8fa4805e8d7583446883527c847 |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8b141b090ff140fe94e42cb351cae7efd203ef7b |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0d6a3e4df1a6a368a80033d9628aae2a1b2c7465 |     
  powerpc    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/eb0b78e97e974ddc3757d9e04029493d98209e9c |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/995eb512cbe702b98fa384a5aca883856c1375ec |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ddb0b41e9c1642a27afde88f05398840202cc272 |     
powerpc64le  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0e9f2d27cef9ba7807ce7acbd9542897cc6c4229 |     
    sh4a     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d8cf6c3da0082ba39b460ad15a4ce0b5923de186 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c90c0ba228dfdcd3d0014d99a65e3f3697a7230f |     
  riscv32    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6f0cfc6f2cad45e5c2209344b101c64f8bed7846 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/215370ff44d15de24240bfd6f7c221a5d237ac0c |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d2a1514ba40eaf2a0060f06953aad0de5d608823 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/90818c1a2e5383467154244e769d53ae2efe6607 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d26e1b92a62b8483b8d74bf47c3ffcffd79eaa69 |     
   mipsel    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/ae42dc6623be223555034c58b5d3c315050d5186 | ORPH
   mipsel    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/5f6950fc8d9270cd33f4cac067657dd9b1fcd1c2 | ORPH
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/6dde82ecad14af1e16b590b65ccc8d63f4a507ec |     
   x86_64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/168ffb9fa156176c1148ab5ea32e9a36df35b21b |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/45b7af4dd74708367519e036d27fe04191db0221 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3d7e654510d9f4aa748983696cbb707497ea8edd |     
   xtensa    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/293ed91950bca48c7a4886c2cf0741194ca97498 |     
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/00a9e48244b202a8467410b9cfd031bf0710481c | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ec3dd9830777f0fea984dea6a43dbe6e6be7d597 | ORPH
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7ad90e1c9b49a07ee1b559f8a543ef022d15e3f6 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7a9eb8cd67f1279a551bfe81c94d50999cbe9758 | ORPH
  powerpc    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8cff86cb9d1ba6f6d0f218f8b0f24ae8da514c14 | ORPH
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7d52cf5c864a9277e069c16b5cc1735861bac171 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/ac41425022d102698cbd5752751c0ca99b796bfd | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/3d252a4f2d155c29333e3564fb086bac6f8b14bf | ORPH
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/cc3ee99bfdb4d52c028d50c1cb48dc009d6afeba |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c49d894b109d68e2624074eab8b939fefa3b42ef |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7c68aac0f18c8c3dfeba382018b05716cab91745 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/3d1fa1ddad9afec45b5f11b5e9a396c7a31307ec |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f3a17ab2c283989a12a50412dbd91d0f2fa407fc | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/479c752f0b018db22113802011da2751a1322aba | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3d04abae742acc850a67853b3eb3b2eb75ab95ac | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9260d770544322994c116d90da4c3ff26b6ddbba | ORPH
   mips64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/262b1826a22127007d5e2c9ef95c84825aca5a6d |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/0e376b0e1c10ee19ef69860c51ffbafaabbcad6b |     
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/063f57a58dbb1fca941d6e45dda970a714279d88 |     
   mipsel    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/42ef768806ce6fdeb795e06cd8d1691b8c2b4a47 | ORPH
    i686     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/519575a4d39e1684f55f554fd9181aabfaf76acc | ORPH
    i686     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/5386cc99d8847763b730365f6e391209338cb669 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/52d42e3733c43d4dff7e9abff9ffd7895fc4f493 |     
  mips64el   | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/89393f7af8a56f2488d0183ca886e967757b0c5f |     
   nios2     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/a95913663329c700aec3790b5d6e22455a5bc112 |     
   arceb     | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/15f2d04344d9e2defcf43f11afcfae5641cc1d03 |     
  powerpc    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/a00b5e8c34863ff817e47bb2d3b12bf3ddf5409a |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/9b8950e1eef9b4cf81265f332a4f3a006c9098a6 |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cdf63cd17bb5701541dd8e87134e7d6919f555db |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f7a5d0bbf64365a19006c6e7098fac0ebe8408a3 |     
  riscv64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3079212a710abc635556c6e1eb95c2dddf94d4ff |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/693a1e362c2bfc0d2d7be9afe36a6aa20924f6f7 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/34a60b786f449e3baaa45812abbfdac2e76acb12 |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/cde4c9414d236bc77be4aed50c2dc93116d0d1b9 |     
    i686     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/bfa53d7e4338985c0d0df4b48c73fbd4a108b323 |     
   mipsel    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/1463bef671f7494e6bf528a4cade9117179bef5e |     
powerpc64le  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/1621a08d0652ee625e73d5da7f4dc18034df3a3c |     
  aarch64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/786694e5eb5bfb7302ec2d70610981896327054c |     
 aarch64_be  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/8d2844704cd4eebb4add21bcccb14207a360b3bf |     
   armeb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/46d241cdc0157a6e2da65651511af49e6b079a8a |     
 powerpc64   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/520df7caabc33b0da1ee7502b1e36064c024735b |     
  mips64el   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/37d3122b9cc11ac1cf5583bd0f6d26713c2ab376 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6674651f5b64c7dacb2957a8f533dc2104466f42 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5c0ec8e3e6a04b4facc3c2b3e44c643ca8724e8d |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fcb45e1eaa5d28c3747d3d6f76b5e6b74e94458d |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/560fcbae71a1aebc6e5faca983940be06d66c36a |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ffb5b1edaba146fcffe79fa569d0c6d8f488d8a7 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cfc8f7dcd68453a9950179c50d4dcfe732694167 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/879da7ff4415dd73650886a8daa0b9cbf19fec77 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c233f71ba54c822a5281cbf293acc5322ad9871 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0925f480614c9a6f6e35c29de501ff2b289da6dd |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d9b31f24aa37d180a135ae34517eb6e70873617d |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/edc4de2e9b99f90f1f6003763f48061d36ff8fd1 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6f0bd38866a778488094e9550142392fe0ea8110 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/35f6e0d412daf86e09a3abd987e7c570d9c2c23f |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fa7e13634a39b9f6566ec55b932b78e1fa03955b |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/20a751f0d703b46559d0f90e5af9fe1e654be345 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6d0be152938da471baa69be765511a0c41f65412 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8b269f466e2f04b540407eed374bb1d1532cb941 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/126f769cd3e1a051da1ace3da1f3230bbf546f71 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a3101f0388f91d0044efaced6561f9b481066503 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7dcef902c4b6643c2dec0e82bb144dbd19494203 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6a26cc349784f9d16be1276a25b86d12709aacc5 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/24a5e23ed96089f0b5d69d429ad06e41aec0255b |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9215b4e8ec73a438f4f0ec8dd38ef99fa2a09455 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d0646d1107fe54948150fb9e8cf865801f6119eb |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/755baae6ad0775e7b139e667d2da391c902d3da8 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/acc608ee44da76caf6245af816dcd9d3d6ca025c |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c5655446e291a494894395ff9f51d2d6a77cc93e |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7f3ad2defd7e58ccaa73c0ae24d0bd1de15a4324 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8def39661014e2033955516e3b44937719b8a63c | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6f727c9297ad73be8e22fbaab5151b3d3ba84b53 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/34690257caccca1ca15a8b1615a29d9ee3c48c9f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e3e095af0ac42e7967e2f89e66d2727028109246 | ORPH
  mips64el   |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/e057d923762adcbed9c7c78eeb9f9f77f0039b7c |     
  aarch64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/d231720e18fce19f11c4495e57efcaad9f72c57e |     
    sh4a     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/83a3009c44caee5dc2ea6883b59ace5f3479c0e7 |     
   mipsel    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/babac8dd6ff964fced47c61ba171854c8c07f303 |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/706419004fc523b36f4f3b8fb2b1f32316ce0d0d |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7527cd23b9593c7972d8148ccf526b6940532c87 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/2dae864520979ccca36ff89a6e840c6906fff26b |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/951e507b9e99cc07a86dcea581a90e12315f1ee5 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c8cbd2b75b83a5fe034206f6e8f88a38fad8e3d3 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7601282748aa16d7e1460bab0e75d3b5daf254be |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/80fece1c824848564f53f0a5616fb817e0fdc76a |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a59faef9ef3b2eac4da899721e0fe9ff3a98c35c |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/42844dd8c8c47252258c921406584910d59b2d41 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/90c5886858d8fdc52fa5b614db6e38363d8f48d2 |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/620488080f70762cf46453d54562a1c53693d0f6 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b366a4e7676312a87af93f4be708c3ca16a3f1d0 |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/29e2ce7c047fc0708803460234e38e4b96ee4dd0 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/2718a3a1e18102e02601479ce4f2e7d260bff9a1 |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/647e9c02d16e3c9b8c394f0151f6b99ec20e0f92 |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/95934c04328b8fab54b928e93d1aad34b87dd940 |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/2ce864a5ab6822efca343a258df487e94702aef5 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0b1a920afbd5eb3eace292025d1580d6b9df497b |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e8a9d4ddf5402e764862484c5d63737eab808b8a |     
powerpc64le  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e8cdf4fbcefe04c20a751b218ed920ff620d9a99 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/21e4a24c0b9881c1f20708758292035b88e5ac66 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/204f251e742af44646bb24675e91b83c78c05923 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/12642723597fe941b620207c7f408001154cb21c |     
  riscv64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6adc7908cebec0ef1ddaa723fd0d58b77eb097cf |     
  aarch64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/668781586c9f9f41bae0c41f9464565e3a36f168 |     
    or1k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b8da13212a1e5927594d0b09b3264b0752a7f605 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/7a51bac17002224b938950c512482131977b5ba6 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/be0ef1d40df290707589ab3bd8daf7fa125bf207 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/01a42d8c29ac410f2231f5fc7c19610e7a804407 | ORPH
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/89558cb33f271205d38fc2393f9cb605d2a352bf |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/2f7e161c6bbe1f546a1e5b537ee788d62dc72937 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/66754f41d9aca515135b9826da13e4f675090a33 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/0784e2a2591489bcfa9d07dd720849f698f4530e |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/7b0f19a0170ab9121da283b82f459322fea3ad1f |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f7530dd65d648b06887c8d73d5f0530ad0f6ea10 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/13a476ac0fd9f596b413078a7fec58cd62417649 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/30bdd85584dd7b8aa78efcd20f84a750e69d563c |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2d2d29af6dda8e7b39b4bbbb248c322052913e58 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ddfc9627d2ba7b1a3f443e9eab528712fd57021d |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5c8cb78d9c18950602c6cba027068cb133a74032 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/7962b875db59759c340bba87b01b0393fd62e239 |     
  mips64el   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/752b0ee01cf1a0c0a9d5b11b8b11e4d242fa5139 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c0b215e6f63b737db945e2cbbb36aca2ce25727a |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b50f45d39eddbd214cc6fca247dd96ab94a6bd4f |     
   s390x     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9fdd553007bdc5d56b307a1b7b59475a6111d4e6 |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/604f364a677c3187f7da96ddb3317462017b1f92 |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ee814e4022d2a690dd2409f81facca6e953e649c |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b7e88ada0e5020de5899a0ebe5f3b25b9db90359 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/65fae07b6462d540a32bb06de33c06b20d597d1e |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d599204c7fd76eda4f8ba27bda2b3060f922c132 |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/10f2789af75c0db28d746612ac4c2b3a26b644ff |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/580671ef1d37ebe67cdd16f4621a6b9523ec46ef |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/2ba733cef6ec0db7fd8e034fa1a63089aba232d1 |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c3a11c20bb0f99b258bdbaa9c150233d796fc353 |     
    i686     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f5379137626cd36c67e37a26b943b81d3856f557 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c8a225cb127031e66a171ed9cf96e64aa50d16bb |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/cb55c6095c86a568d595a41a89f61b814f319255 |     
   nios2     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/e28a7b5887fec9e56626063f3d0f9dbeedd75c9d |     
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/fa4faf7e36a461336e2631a4da2933617afe5102 | ORPH
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/66d2a87fb90404b15de9320f2033c50d4e1a9ec4 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f1d488235f761013a35192b61606a18edcd0702e |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/49797c6a697167a15e3fb1922665e7ea804d89a6 |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/cb54fd3ac6d735cf1404b75b4cf0b522cefacdc0 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3fb8f52f9ddf371e11424e3b1bf326ae2c453faf |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d10ee0f1f773738ebc824d2c723a90b5e29542ef |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/563252ffffaf725c104a341d99f30744e91d6d2e |     
   armeb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/671deffe99e040d0edc13e825952dfc42616ec2b |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b023510f9798eb0d881b18015e6ff3b5f2557faa |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/0b5e5dc99bbbfc3f51cdfbe190dddc1815b96b2b |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/bec293cbe86cc1306410fe997e838767bcb41c9a |     
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/00cdd54866b159f84f5d194fd8eb67b4364df003 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a1a6c0667f58b3113ecda380a4a08ba845afc99b |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/3cf43c95b7a3db4295fd0397d18a4c4ab712bce4 |     
    or1k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/1653a03d0c0ae355c1b6f7fc9ad36c552c656576 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/8fbfca82c891be9b20a19d90f501a86b8b45396d |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1b73b2eb863788bda786620a3d9f004689b35604 |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/4fc45dbdde9bb7e09b64a19f1f33a5336f937a22 |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5becd597c8f7f60afd885c7fbf86aa8e7fcd936f |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/f37c54d45d51771452e22d985333bb2ef76a86a6 |     
 microblaze  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/68e8b1d9a38aecaace9b8e17c33cd3c66ca7f62f |     
   x86_64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/071bc880c1c80257ebfcb499f24168b6a7b1b68d |     
    arm      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/871d20ea5db393d9d7450e9f797f851e628d2c73 |     
microblazeel |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/838abe3ad9122d33189900992ede400234d1904e |     
 microblaze  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/beb1403f5dd5d84eb9686232629fb2a6ca275bfe |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/28cda709008b394637cf1180c4ea3464d3312252 |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/5fdd487b1341e1cf9badfa856622985a21e42988 |     
    arc      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/419b8d70fa370fc1c8128292aadb71bb800a8ac1 |     
    or1k     | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/cd922dcced0d3a4076a42a0828fab2ca4c962f2c |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6165ba057ee526446d91808451d5350a804390ad |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a6a2532e1c12d31a29a61e46064d8fc2fb524c92 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0271d41b953a43e27138a377f5da9c1cb19f99c5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ff4dbe90965e060faff01863817b672e17a4fe81 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/63dd1fc2c99b172bc4b53b0036008802cb1f3c70 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4574ca78d4fe1f104e737489032ed023a541a243 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e5125e6bff5e9704dfac3b85fc1c05405db0ac19 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/66e93ade6d81c83ee2acffc96ce1232fd768eaeb |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8ce241c5068fa23add9e48715cfd4fe38fd5b804 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ef5ccc5365de23ff33ccdf6ac392aebdaa4c42c9 |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/4653dee2da4888a070557fa62b9b1a2cd88c0864 | ORPH
    mips     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b2fdcf564427c118cb2b36d20fd4543c2f4796e0 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e5b98df0f5de23117183c5842308e6dfd4b4ba9d | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/7dc9b9903b51cf4347078dac05dce3e59468958d | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/73e00c0872339d37fedd40012236f7080c85b81c | ORPH
powerpc64le  |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/aefc4fbd2676575d22b5f4209f89c4812eb3c45f | ORPH
  aarch64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/db78751b5e6b863fde6eb7536db830a31510c18a |     
  aarch64    |        libostree-2022.5        | NOK | http://autobuild.buildroot.net/results/3cf19f5de18723c6726aa0b328196c1b4ef22bfb |     
  powerpc    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/ae20eb328682ebe3826005254db280b266a4f678 |     
    sh4a     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/a2b733c7e23ec2000eeda802394566e03e4b74b0 | ORPH
  mips64el   |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/f39e68ab56b17126caef7c0dabaca61488dfd1e6 | ORPH
    sh4a     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/ef7696512922e0aa1a9349772b01d1bb6b755817 | ORPH
   xtensa    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/a8da4f32b46e1ddf630cea9502760e0e8a3ecd68 | ORPH
   nios2     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/8ef3b61b94ed4fa150890c3db892abdbb9022a4a | ORPH
 powerpc64   |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/e7787cb0464317d7e99e505ac0622b7b36ede1de | ORPH
   mipsel    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/03b62346e54a53dadd27c6e111ec837d3276aa25 | ORPH
    sh4      |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/f1f2f877e7e6dfa1c54aef68ed85d19c722578fb | ORPH
 aarch64_be  |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/8fa9a7ccbd248d289aa8036d681b369601e3d9e1 | ORPH
   mips64    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/b4121c433e9dd87265730ed7006cfa3bf485ca78 | ORPH
   sh4aeb    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/126c90d9aa5cc8fdd007300ec14a285ae326296c | ORPH
    mips     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/61caa406d79b1267ab820456fc8b1887c828a528 | ORPH
 powerpc64   |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/eb9da90f90653474fe37ae616e88a634fddf8d36 | ORPH
   mipsel    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/bafaf328ab7b9263f4416d0a95e59463f87fd877 | ORPH
   armeb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/eba3ec503148453df36bc710d28b1037d7d7ad67 | ORPH
    i686     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/1a2f834a16ef86737a06c3f2d1963430470cdec5 | ORPH
   sparc     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/48a3daad4127c11d94c9055824b729f4d708c140 | ORPH
   arceb     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/b20d5d1ec185dc319c4cf1fc49d4a456719e897d | ORPH
    m68k     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/829beb60761c6efe0aab3f10eb73dc2606e32cc6 | ORPH
   x86_64    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/382ea650da1892a3a20fb03fd088d993b99c8d04 | ORPH
   x86_64    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/f9da62dbdbd372d5bac9a4e56926dd44e68ca9a1 | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/a52385af8ecacd58b6c22b1363f3a63f89dba2e1 |     
    i686     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/ca9b2d3742c57fcb15d44aaf692a5cf541f317b8 |     
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/1ca1c1c15284aaf3acdb7a7e7f0aa85133941703 |     
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/16ecce59651108dd94d9a833d66aa69fc2dc38c6 |     
 powerpc64   |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/29482c15cb84457a8aa484a20a0b775cd927f6f0 |     
   xtensa    | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/6c4a7f238983acb8560e016e421d2d4cd446be3e |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/1ea63fb2c0ede133788993cd05b3fd8d1b3fcfba | ORPH
    or1k     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/5571ec37446327a5b6afe92c344d7d34d0324476 | ORPH
   x86_64    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/8f16ab8470f26ba432149f19ad197ab6be286edc |     
   x86_64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/8ced3c5c51cdba810ff37be3a0f09921a65bc38b |     
   x86_64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/6c451033c073d8808b8d5e0fc2eccb90e82e34c5 |     
   x86_64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/bb1fa6bdf601c5e4f6b306111fb6ab14723d650f |     
  mips64el   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ce6eb36649de8f7bff24c7ba0b570529eff1cd36 | ORPH
    mips     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/29306aa20d9ca22e7966f9ebb2b63835bf759d7a | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5cb2c974072a769e6df005f6435edb2f303c9c6d | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/817ea86be0c06c89db0343ed45b26794c6232da8 | ORPH
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/be07dd476768c084cfb27fb944d2de08aa11cdb7 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8da701fd2d09032b78415f456493465ee40707c0 | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f6b6740644a76df5665cce475792f7eaa612e996 | ORPH
   mips64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ca1975ce45e2bc9e6cfae0cf496a838142a453a2 | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/875c37817087095f256a3104d232ec75f5ac8b21 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/aa020ba74308ffde8c5834cbaa9cff5323fc5320 | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/202cfd8d7ac8804e6ec48ec1f476b36ef307b6bf | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f95063402c99e45522cb1c9a09bd222e9ca26843 | ORPH
   mips64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d3ff2e23c31fd41db5ba8afabb5748fff7681022 | ORPH
  mips64el   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5cb99a0ec09a9f4627ea302877e903482fae3e5f | ORPH
   xtensa    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/43d42dfceed61a2b0e842edaa1d706cb9f028683 | ORPH
    i686     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/4ca9d0317e514fc9c19783aa83ce0226857fa8fd | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/8b12d08cd861c7aed6cbd3f31db111c3bd7be7c4 |     
    i686     |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/716ec921f5f18666bbc32f98a5f4acb969719331 | ORPH
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/0db43bd4a87d17d3a667366b6e7d044ad24c08c7 |     
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/4002e5a44e36cdd58c626b5b6357a51e2faf2e4b |     
  riscv32    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/c480a7c05a406938f88071078a7aba18691fc235 |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/0384d9a5dc0e00542503d00b0d23178f56d108c4 | ORPH
  aarch64    | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/9d28efe7aac32c5d32d5192d583214ecf34b7427 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a54df4fe4b2e907f5b9561f98823e0e5930d84b9 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4f6764593c25e53f7e4c72849109d08acebf58b3 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/40725c9fe68ecb24699100a6127f3acf7c4e644f |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1fc839853e51b027b33ed4ff5fb0b4e86ea1e5c1 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/aa9cbd74b81607197eedd90e3d5c7dcbe2403d7a |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/48b7893c52301f1a8aef87954dd5e7ec23a24994 |     
   sh4eb     |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/523d0f63870085bc8e217cfe788a2d578bd4c7f5 |     
   armeb     |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/88a292911f5ec8b47a5f24a6aebc222fa2cfc685 |     
 microblaze  |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/0313a142494ff4a4d667738cac74e3aa39da9d0f |     
 microblaze  |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/a69a8f1399d2c57a5dd5b95ba23f5ff7bf191a6d |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/442cc0d85b29702886640c04d6aee788a0a1effe | ORPH
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/ce7a99fb0df7cb24abb3a6279c4625ca7e65b322 |     
   arceb     |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/286ca5cabfa21b97366e6111f5ecdb7b63188f9c |     
    arc      |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/b2f58d1302e78214f4b23b4169a039707b33a838 |     
   x86_64    |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/a2471302bea28fe6992f3aba3bb699ef2dc3a3bc |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/121f373e37fc17965d990b2528f7830a0c2a025f |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/46ddb3ccbbb0260cd037354c47fd8d8c58538761 |     
powerpc64le  |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/a9568b2fb4d7c505265c89f620e085031e01c005 |     
microblazeel |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/b78a882836abf03e9c2126bf81a23be72587a425 |     
 microblaze  |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/5121a09736aa03552f55572ed9aef9b0912b3963 |     
  powerpc    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/2120f1d0686ccb4f2b7a7d8f3963850b2c289ecb |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/3da4424ee43a0d7d12276bcbef1dbff21ea184d8 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/130f3a59c51be1be23b9c4aef17bce7f4bdf34ec |     
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/528cf652e41a404c1f6f2c2be1ed2438559af894 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c6a6a68de7082c71f0edf409b1044352725d9dea |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/3ce9a1ca79d909e936e06030e0c0e1366e0bdc6b |     
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4f3cd17142407a4bc5551b06b554dd097a3eff2e | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/99cd421a27fec411ef2b711b3e8d5c7dd6676b94 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3a768ebaee21813b5053a1acc51f01b5d3a75299 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2ca8b593911eb2e00d9f09e65fdf7197cdc3e841 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f478436b5f21fae8ae34aa49130530f57dca8887 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7193c52f601f78ecbfaed07ef0790561d33784e1 | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4a08b2d20b862fc30e447a29241ccbcd0d9b06f0 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f85e12194f3037187ff9693cdf5210ee25613136 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/6f8f5372d210b60ead14957e63a7ef76ecaa0791 | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f4d17e74f8673fe4814116bc3c03af81037775dd | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c2a6d33853dcaf2917f27de787c273ce43de90e1 | ORPH
    i586     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f481d24bfb53eb9c8c711086da3c3ac088b0a11f | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2749b6b5434585c3d4dc331b40539de6d3d51db7 | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/3efc20d887a20fc22cd2cb6ee468befdfa0639a8 | ORPH
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7193020c9a5a0a90bc241b0c319129425beb9429 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/66da7486191350cdc13b4e468949a91dd99cf6b4 | ORPH
    mips     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0a9cdc352c67e1b39636b3e74359f07bcaafd9cf | ORPH
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/e7087b49dd87e40472fed60beb9b2a0777b8a062 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/23dde1d453415f20531a436b49f2eba4df12cd26 |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/bf7676888cbe759ed0eefb71d7a2d0c90a39e66b | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/60b239b7d997999b9fb1c9cc328c7d9381348f25 | ORPH
   armeb     | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/2e630956b2438c9934e8982d1558959290b983fa |     
microblazeel |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/c1ea9f387b5a450ac96e548be3545da6d58c0b00 |     
  aarch64    |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/c4d3b1296efe641fbbc78632d189583b0294131f |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/149d835dc3e4f1e9015567130ffb7bf4eeec6d49 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/8acdfa2abc02cbf10a0b439eabd734c38b50e52d |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/054cfda089e7819adeb3fe963ce68641d90b08a0 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/cbd4ca9376d21503e27869ee41b518c3424dc0da |     
    m68k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/2fe1b4ee2f99154f256d1d56b552016f7b700d3d | ORPH
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/44f32435193a59ae4cd93ec90c26b8204af0bb51 | ORPH
    i686     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/399ca957c6309052cc8a06822601880ca1edd0a0 | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/dd9ef14b4da177bbbcc7cf0423f17fdf321e5f05 | ORPH
   sh4aeb    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/2a5521b2f957084266789d51803a9559c6382de9 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/42b7a13ec931fcd5dd9c35146a5ce2f2873a35e8 |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/95c482f450d713a73d9ca434203dc71d8e7a5d3b |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/79667bbe11c4018e09823f96f263c9bdecf7ee70 |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/f9301581fb2bd475ee7facc5b357cbf4df6008e3 | ORPH
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/0b344cce93d5f708b1782409d08e8771828aab91 | ORPH
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/53104caff2622f66911dae8734e6aad0b8cdb100 |     
    i686     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/96bb9fbf75aaf2b72131c581b5389c39dd55f329 |     
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/a9e1fde0a29741ea84059ef8deea4d671ba1ae6d |     
    arm      |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/766713ddd4e6e27e245d19d3398a84216f276f50 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/28a68af78889b14f7d6463886898099acef8dda0 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/32025bbdef9f2e0124f0a73b9ab52f7879a8dd4b |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

              host-delve-1.8.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/1a9d2535d0bb0c932f9605aff14012b5c8962527 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ec3f64fafa8808ab2298b0a3b0f69f2a5cfdcdab | ORPH


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
              host-rust-1.60.0 | 2 
               protobuf-3.20.1 | 2 
dahdi-linux-5c840cf43838e06... | 1 
           docker-cli-20.10.18 | 1 
                host-go-1.18.6 | 1 
            igd2-for-linux-2.1 | 1 
                mongodb-4.2.18 | 1 
                  tbb-2021.5.0 | 1 
                       xenomai | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/109796d8d99b1a862505dc3ee1362702e26b1d59 |     
    i686     |      docker-cli-20.10.18       | NOK | http://autobuild.buildroot.net/results/cb812916f70eecf307227bc7901f54d6fa521027 |     
  aarch64    |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/2ce2bd4c0bcdaee6a85264ed204e9a99d2f2a4bc |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/59e71f37e74f06184ec31f9de54f757e1ce929a3 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9c84de01c1335153155c279fcb5d57edaf873674 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/15618ca8c9b54941fc59617b69900cf47972997d |     
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/d856c74814c5e406c236bfb2658c400eb777df92 |     
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7d4f97e4628683f531e1598c6a57a53d1b8ff76d |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/9448e763f03046722eb00be296983b9343be8b91 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/652d137b67b3e42fc609bdc88e1d4c6c57c241ab |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/73bf83f30d9e4a4e6fa982ed072b42b7895937b8 |     
    arm      |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/82476601631d24764d4ac677c5f6096d8436a491 |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/da2291dc662fd07f66930ff6a33ee6c03c41951b |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9c68008d4003d2aaf206377e11d564e449ea26ce | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                  exempi-2.6.1 | 2 
                gerbera-1.10.0 | 2 
glibc-2.35-134-gb6aade18a7e... | 2 
                  boost-1.79.0 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
              erlang-22.3.4.22 | 1 
                     frr-8.2.2 | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.62.0 | 1 
host-spirv-llvm-translator-... | 1 
            igd2-for-linux-2.1 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libdeflate-1.12 | 1 
                 linux-5.17.15 | 1 
                nodejs-16.16.0 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
                    volk-2.5.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/5cd8c27853676dba1e4eb109cc2b5a03f03b7319 |     
   x86_64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/68b79aa6a38289e048ae5677899c70e511ca6701 |     
   x86_64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/6e650449c5603b1293be398c4342f464fc6121d6 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/963468cf6b2b6af086320787961caff9d42249be |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/fbd43e710a578cc886f71aaf111a2bcc241d317b |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/359295b21db137ea30f92dbd2b199f6e8f94e13e |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b48bbf3b2a73973c578db823e860dc8aa1329452 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c9d2961ff246be10b69ab8f4d5e1d168977c4504 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/0bc40328f4c41f3893d5e8c854e3970f669c356a |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/69a6eb1efe0c8a0e3fe95901ff9f27f1c7c69e13 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/01a254a0f08002a48435f0ff71521220df1dda50 |     
    i586     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/0f9bb6ca7b617e541ef2c0924d56230c76ac0047 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/fe32b8535e47c25fa5d9e5d2f67e006ee2f28b49 | ORPH
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9f08153991882e2608df17ac5ecc58ae11ada52b |     
  aarch64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/572ee10454eda32f979256cb11fc3856fd204ec4 |     
microblazeel |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/06d63a53d80c7deb7007b7ea3faa0f42c0d47f47 |     
    sh4      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/efb88e0886a6eda3ca93c9832ff0faf745fb3101 | ORPH
  aarch64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/00d97961a158bcd213e45ddb5f0206ba6e01d8ae |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/ad615c522d463ea8da3e3c2da386cd468899de2c |     
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/cc86dfa5f04872c82e95f850b80cc32cc5eab69a | ORPH
   nios2     |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/636f084d3016e01f51eaea8800351997ab602ba8 |     
  powerpc    |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/bd72a5e888fbc30c172b1a06137ec43920d78ea4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
