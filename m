Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24638C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 06:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F900605AC;
	Tue,  4 Oct 2022 06:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F900605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeebdyoF38hR; Tue,  4 Oct 2022 06:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B5C3607F9;
	Tue,  4 Oct 2022 06:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B5C3607F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68BA91BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 06:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3073140876
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 06:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3073140876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPVzzLJRN8xk for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 06:34:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4AFF405AE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4AFF405AE
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 06:34:03 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9DC2C000A
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 06:34:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 04 Oct 2022 06:34:01 -0000
Message-Id: <20221004063408.3073140876@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664865242; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5fpXPtNk//rlGv9yYBsJXuG4Ge2GMQSE39+gUtpWVZA=;
 b=P+JD8/0Fd2XgDcIuEA/0Hp29Zqxcl5K+YfiLDYmXXGaH8RtKmAxye5rEkUjYsIGlfY0gzv
 fd0bun1k5r2QP5qNX1fdSjUKg3n2WwhSCiQCVPG25GJwYTdXsf9Maqn1tO+dzHWLmsOhxF
 kH4078b1HKiMThM723tXveHYicdBc1D94WWkKGTxIl6s0w9bZLZkGl0iKU3g79MPojxvtK
 CSGh4ekbtMmCFc0/1AWrJ5oSonN1wZErDtuFzdyl4DgwsP76Q3KtRpY12uMZcfuqwo1/YR
 zjy0HLMXgWwro/7rhFqmx3AkARhud0zZTw0V1RDXxZXdN/w1lbINmGamlBps5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P+JD8/0F
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-03
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

Autobuild statistics for 2022-10-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  1  |  0  |  6  |
  2022.05.x  | 11  |  8  |  0  | 19  |
  2022.08.x  |  8  | 11  |  0  | 19  |
    master   | 157 | 293 |  0  | 450 |

Classification of failures by reason for master
-----------------------------------------------

                      crun-1.5 | 16
                       unknown | 16
glibc-2.36-44-g2628500f5dff... | 14
        host-sentry-cli-1.59.0 | 13
            igd2-for-linux-2.1 | 13
                 sysvinit-2.99 | 13
        host-f2fs-tools-1.15.0 | 12
                host-go-1.19.1 | 9 
host-pahole-73383b3a39afe86... | 8 
              libarchive-3.6.1 | 8 
                 systemd-250.4 | 8 
                  autofs-5.1.8 | 7 
            btrfs-progs-5.16.2 | 7 
                 linux-5.17.15 | 6 
               libglib2-2.72.3 | 5 
package/acpica/acpica.mk:40... | 5 
                 dash-0.5.11.5 | 4 
                elfutils-0.186 | 4 
         host-gcc-final-11.3.0 | 4 
              host-rust-1.64.0 | 4 
casync-4ad9bcb94bc83ff36cfc... | 3 
            host-binutils-2.38 | 3 
             libgpg-error-1.45 | 3 
       linux-5.10.109-cip5-rt4 | 3 
                   perl-5.34.1 | 3 
                    qemu-7.1.0 | 3 
                 uclibc-1.0.42 | 3 
                 zlib-ng-2.0.6 | 3 
                bitcoin-0.21.2 | 2 
                    brltty-6.4 | 2 
              dieharder-3.31.1 | 2 
                  ffmpeg-4.4.2 | 2 
                     frr-8.3.1 | 2 
                   hdparm-9.63 | 2 
host-gdb-arc-2020.09-releas... | 2 
               libcap-ng-0.8.3 | 2 
              libgcrypt-1.10.1 | 2 
                   libnl-3.6.0 | 2 
              libuhttpd-3.14.1 | 2 
                  ntp-4.2.8p15 | 2 
                    sdl-1.2.15 | 2 
                    volk-2.5.2 | 2 
                 wolfssl-5.5.1 | 2 
             acpica-legal-info | 1 
              alsa-lib-1.2.7.2 | 1 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                    attr-2.5.1 | 1 
                  bind-9.16.31 | 1 
                bpftool-v7.0.0 | 1 
                  cairo-1.16.0 | 1 
                  cjson-1.7.15 | 1 
                  cmocka-1.1.5 | 1 
dahdi-linux-5c840cf43838e06... | 1 
              dropbear-2022.82 | 1 
             f2fs-tools-1.15.0 | 1 
               fftw-quad-3.3.8 | 1 
       freeradius-server-3.2.0 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gensio-2.5.5 | 1 
                gerbera-1.10.0 | 1 
  gobject-introspection-1.72.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
host-spirv-llvm-translator-... | 1 
                   hwloc-2.8.0 | 1 
            igh-ethercat-1.5.2 | 1 
      libabseil-cpp-20220623.1 | 1 
               libdeflate-1.12 | 1 
                libmad-0.15.1b | 1 
               libmdbx-0.11.11 | 1 
                   libnss-3.83 | 1 
                libselinux-3.3 | 1 
                libzlib-1.2.12 | 1 
               lightning-2.1.3 | 1 
                   linux-tools | 1 
                    lxc-4.0.12 | 1 
              memcached-1.6.16 | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.3 | 1 
                  netsurf-3.10 | 1 
                nodejs-16.17.1 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.3.3 | 1 
              procps-ng-3.3.17 | 1 
                proftpd-1.3.6e | 1 
         python-greenlet-1.1.2 | 1 
          python-orjson-3.7.11 | 1 
            quickjs-2021-03-27 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
                 sudo-1.9.11p2 | 1 
                tealdeer-1.5.0 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                usbguard-1.1.1 | 1 
                wtfutil-0.41.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       acpica-legal-info        | NOK | http://autobuild.buildroot.net/results/93ad774a7f69e761952a3a6c92a24de7506e6312 |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/c8c4801599cd954620aca4f71e7a1f5735e6f1b3 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7bec4f9c851f44a23e168453d7f79e5dfdf9a850 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/09bc0219b22abf51cc5dd74eba6bc4cd1f77a1f0 |     
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/0ae2bd9a17fbab2e41beefa94771178f1e807118 |     
 aarch64_be  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/cb0ec9883d3a56690c9b10fcceac2a3a809d9cf7 |     
    mips     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e5f536cfe0e624a7899b5af6e47ecdc7c791d7ee |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/37247432ac3dcae9b824956f63a55a02c6196a7a |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/07eb7b49a716463ba32daae8aa9aa3b16ef5df08 |     
microblazeel |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a2c18d7883618826c3d2da1e7d18de8d568e40ed |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/dac6153e1e49ffc8751015d82d22797e94e01e44 |     
    arc      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e4f84e966d35b3096db6cf8b966d1af386bf1712 |     
   sh4eb     |          bind-9.16.31          | NOK | http://autobuild.buildroot.net/results/2d56c5fd07d9f49101007ab1e242b53a339fc85c | ORPH
   arceb     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/bcbcbd3e6e0a1f76fee7754c30c9d00771a10bcc |     
microblazeel |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/bff1acb56477b1c3571b955f8f28ad25e8bc6699 |     
   s390x     |         bpftool-v7.0.0         | NOK | http://autobuild.buildroot.net/results/b5bc242a804536b5b37ddc2e932dd8df327d7c76 |     
  powerpc    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/842587b79b02874147fd959215606ed097578c7e |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/eb63683d52c385f5b91b4966fd459dd79c9db337 |     
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/6c163cc0e34839581efb138bd5ec1737d0890cdc | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/d82886fdc349050e068b19dfb8844d0b8e705f6f | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/f997d75423f5c12568cc01559d07a94922628957 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/2a33c580ed17b1a0511e2bdae4ee9001af67c34d | ORPH
    sh4a     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a85854ecbc5263eb25516c1bf90d11a567dd7dd2 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/1274d17b2150025a6307e532701c5ff6b10139d1 | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/cd65673d7a935db3a23dfddf46fe3f1b5b53216e | ORPH
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/6f3a99e7c451f6acb77ad0c3731700234b909e8c |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/761bdbe141852f7a3c9cc06240bddb0c9bffd026 |     
    sh4a     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/9590fe9d163cbe0fdd3897e35255f282ac85b33d |     
microblazeel | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/ae053ddf5f1f51b36c3fb2f650f9ca9560d93377 |     
  riscv64    |          cjson-1.7.15          | NOK | http://autobuild.buildroot.net/results/db107e24f690a705b9039bc083a20fe134a57f25 |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/3089aec215760126a22355023da482343501c320 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/cb8495ccaf968a2d9ed006a3fdf98d5658ca93f4 |     
  powerpc    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e7ae6bad64da036c938a12ebbc787ca60af8cf40 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b2238dea2fbb03815177efad8b6f250204c6b58e |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/22c895100c72d18215557e8ce5296d1da4ae47fb |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c3bca848941e4cc7127b88c8f7f3568d81400897 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/bb6bda5b01785a7d484e96b29a5baedc37a7f680 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/dcb7ee2b4a7a445a0c79432db4ad3f5dd978f184 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/088364b6e0c18ca08fc46296c60cbc995e11e26d |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3c45cc72777c6c18b7fff28739564b9bcc1c1c62 |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ca11c59aa9417e40c1cdd4c4ea5db95a1dcefbbf |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/62f2576d7f84045a66f0c4cad9a23b39d9065ec9 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/808dbebff49953d9e2b52da63c04ba6014e7e2f6 |     
   armeb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/dc58fbd511c986c3fff5d2aa1b09c7dcd4e841f7 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9fa2e9b4d7586177b91bc18381180e1cae6b385a |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/748c1eeee2e9bbff44ef529e94931a0b1170e6e0 |     
    mips     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/64bb2af94dca16de9434a48e2175bd0327fb7388 |     
   xtensa    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7bddb7777ec9a0f14402a76f1cc4f433b9574d82 |     
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/070fbec196306315e26d6bc58eb023757f42b496 | ORPH
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0f8ee0be99772f6c8f4241361bbcad05e816bf67 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6808130fc75716cb9423c98003890a3eb4e85cad | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2f411b8e17255012f5af73d55e4be4350c338e1c | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/4f3c7ea7eeec8a8d55a179c9ec0a8d9ad3f6d375 |     
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/f52569be34c38b710d18aae22255d8616069beff |     
    or1k     |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/064679013e2dd4947c24eec404b9c312ad3563d0 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/74ed1b8cce7d8dea355200622c6c1b3f6844c8c3 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6bc7e2ae86e388e16307b0bc3bca64c471247022 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cef048861632d28c9e23c23d7adb071301e3ef92 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2b11b37db9149276d7b0b0b2ac927cc5d8434824 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/ca473eec89fabd6838c60d91fd1fb7b98d64c928 |     
    arc      |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/18d4f96f2227a9eedb75cf38151e6a8f832b64c3 |     
   armeb     |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/21ada21b25cd99a433b9c6bb55f07a2f187dbfc0 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/09ccc504676d3549721fdbbb5c905a339c42d4df | ORPH
   s390x     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/dd907c8bb8c943d05d52111f271675a656f7f7ba |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/c8217d09f20c98a15ecf89b2029ddfd198304de7 |     
   arceb     |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/0466f00b7b03a8aa622c962659c5317249fa430e |     
   nios2     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/e98b66af0ce87f11d7bbdc2e18aa18ec0e40b7d2 |     
    mips     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/aac4280686374f177d546f03ffd0eb370dfbd150 |     
powerpc64le  | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/d583bf87740b6c6f5264507e6ec83796e5e0fea4 |     
   sh4aeb    | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/eb8f4112c731f409c0cef160f9fd518797d551d1 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9aa9ad190805332f3dcbf4489226bbfc43cfb055 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/35adc01aaa505b39e1bafc77239489372eb37fe4 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/dbc579354a19e4ee638ee6fbb51a3d9f65cc441b |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/5b7cedc547fa294b03ae96be02cbc21cd8c004b6 |     
  powerpc    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/e2fb84e4b6c9d07be6cfe0c7bfb6343d2bbcce71 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/4e3d2fd3081406babe95207bba07fa9d53b29373 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/44943d1fc610c006736da4ad0d178895633a40eb |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/93058c8b343688b1f777a75deca4ef750f9694da |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e4e5b6de2f10b2ce1dfd57f704fc34d023c8ecfd |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7dc71aab707cf0e668a5dbe189448039e267a9ef |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4c897e2df18efe9be5155741153040e1013e043f |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/27977ed67d0379552c190c35461d61df556eb8fe |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/10bf923418db4ff674fa2712fa11b7497aa1e3c9 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e80898f10ee1086929808ffba1a647dc5240fe97 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/deef8143dcddfeecd507af1d8c8a55bbc54db808 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1ae3c2227c76f2163c730be087028768191b9bca |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e50842e014a147bedfe17926efa560c66bef1143 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0f55dd495b8f1c7c68c8c819860ff3ba9e4715d4 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/59e558df3e6c99232c47c4f7273c9f20e73a978a |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6411597c19a77c9520e4190bff2f9e9a9945b1cd |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fd2f72e6c71f7576380ef7b56b21be1101402883 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/8b058cb32ca780020665a9dbf5c8ab9a2757d7c4 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/6680c97e210c5fa07d24a688337f3d6f8c690339 |     
    mips     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/d0c1aed960143ed513cb79bae075fb785baa6c18 |     
   armeb     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/212d1cc0023e4c369fe8cb96d2f6a75952207e4a |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ffaa276be5ef9e3f229cdd9da808948a367a699c |     
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5057604a182ed477b9549957fb60945f6baa08c1 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/01758e0dfdc77a8617ab7541dd03f8ab02f8f912 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5b1f2a5e9a59a825969b8b04a811cd2fa2643a66 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5d214e44cc2a8748f9e8c10843d3387c39c5dd8d |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/bb81fb1e2cc127f6a5c3bf10883063ae6e37116d |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/2021d3b5c6ecd4eb24381c0fffc98d593305c437 |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/70f207a2c03bad833787302cddd46fcf7a81cd52 |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e5d6e73b0961ae2a990862d0cbf7f6a7a2cee9e7 |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/4d8d8da0f6d674b7b883ce656f932accc4c238fc |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/70b7236ab62b846ebc4b438e8ba8c60d786287dc |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/43cad351ae24dac145e084eabc5faedaa427decc |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a26605f312262c75ee28d05fff4eea9733c3c14c |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5a4fb28b069a07a0a4c4fef74160c5e0d532c982 |     
   mipsel    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/3bce71b6ffca8406ea3fc58f99cf183aa146fd4b |     
   nios2     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ae088bbde2fef8be836e52580ffd6eb9ea8ee77c |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/6af9fe1ea7a4ad54730849275d6ac9ca77ec18c6 |     
 aarch64_be  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/01e7230d9b347b7698944900a66100922f067329 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f731bdeb6526ed13005f61ea8c9e34f1f7aa1c4d |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/623aff40b09d9901a97f8cee692c51b393b1b98a |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4868eec5f7eef7f58b29dd746a021c018405466a |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/14705b6c8852cfdeed944c17ef2f6c4e4258f6ad |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/05bed9b42a996e148aacb8889a9a93916c790c54 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/d3c1c98c30bda949308ffb4e03576d70ebd32e22 | ORPH
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e34e4fd12a2023d0bd67e956a05c601000c7dd11 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/3d3a38f8fa34f4e9e939241f65ea5f12bf5c696b |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/81dbd2143056942a7486431cdfed8f12115e3c33 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/26e72261b711a3e385562b10d9938705d2c10dc5 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/54977a384db36cf13c0948eeb13d7070abcfe12f |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/7decbe02e6104d26576c74dfc42495ce17dda306 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/3c6bf199f09d3bc84c059e02c79bc40388580329 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/6887179bf8d151cda11502c37eac6db8355d02fb |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/233218f1df42cef23cf77acba9f78d3c4ff9ff21 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/37bf69945aafda7c3b388f0004df30b1c120558f |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8cf288fa750b9ee02e4ca1ed50fb9e6a2ba8fd98 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0f65eb935a75ad54ef4df048d513f8f35871e147 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ae07e4d5bbe4528f759f79f3e22174e550560efd |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/afe040c5fdb386044392254522b073641424995f |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/310b4a9c11a0b46f41bb6fa86c0086f1f0c06470 |     
    sh4      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/79eff1c3596678dbcb32994138a6764d3de13d08 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/16bd4ae2e1829b54aa3061d472ba1dcbab979c9d |     
   mips64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b7f80ff82c249f74dfc7a879529f5868f87fe0c1 |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/fd3e3e51d9ca1f15dfb7756df9c6da07cdc0a7de |     
    arm      |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/fe0cad20d578a8051c52180dfb07b0cdec0d7561 |     
  powerpc    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/21f5db7c7adaa04be3f0c90af0f7efa25dd7e635 |     
    i686     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b51c9b66d783d08d9e7973e0ceb2b4f43942e0bd |     
  riscv64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8c45c6a99a7ea09c6c50f662135acdf870ceddc5 |     
    m68k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d7427265c4f2426c7f55f1ed0547cf24098de40b |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9bb1460b46ccce69afa415cf18451c4f457c738d |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/4be6d61c65ce75731b304def192d173a3d250e3b |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bc9231ee351a69d982cc8521771f8a594ae045da |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c9a78c9e46b65a3b8b79a9f6549687ae83bd669d |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8fcaa240b869661c5520d0467e6bf8312530035a |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7c519aced0a734a31c33e4c8a1b40e7aa1dc597f |     
  sparc64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0345db1d219fa0d1467eaa08ca58ba440e16a173 |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/46532963c26a7c36fe0f2c1014d5565e86374401 |     
    i686     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/7dce0f3ba7be0a1e63ff156b405eeb97605d7676 |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/074fe988f8f50e8cd8bee643ea59e8895a631f7f |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/693c4efa127ff7d488a802e189b84afe613892d1 | ORPH
   x86_64    |          hwloc-2.8.0           | NOK | http://autobuild.buildroot.net/results/2a6d22e2c96017f1ccfd3fe09cf0ee8c2a882f0f |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e732effae812bc34809ecab03dbb27706e0c2989 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/55534648650bc194262ab370cfafe86676534937 |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6dab4983466c36bb3eec9724cfa1cd97c4540e13 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/74bea4877455375218558dfb8a65afad82278fde |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9bca983a77d738aee849d773b745a4d632ef2def |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/367d4aa1e6d1f3492dd8933830638e948b2a87c2 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/cffee8a2a346e8982966a2dab30d90a0b91f65e9 |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/73f3bd3cb94b894c63af0a3897eeab71be49f017 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7c88fedaaea365831273e7bd5127c1e8c5e6ab16 |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5219cfe72a0cb9dd60cf8c1b84f55d0fa2eeb5ed |     
    or1k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7efa06b3ba361a1d749d6f76cb0201e7e66cae85 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/951be11967b0bb5b03145fca14fbec2a6e53b49b |     
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d8afe78e6784b3c60566943007d3d5b04124f9f9 |     
    or1k     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/89ae4daf7e9351785108327e23f20f5fe4463184 |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/1389eaf2bc58b7449d00a4a95fd516e47f82ee1c |     
microblazeel |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/39567200ddd47faf750fbaeac13045a4ba5df411 |     
    i586     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/dad77adca331ac384bc5514153f8d7af9ccf49fe |     
   x86_64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/c36c71c4a698c1a0c143aa90acf958be6540596a |     
   x86_64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/121bb6a9f4750ec0aa45b9e43349dcdc0032809a |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/606156844b5154ad5c323b2547ac42ee28d6f3eb |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/fa893fc83221725c3b6597f4c4885f3638175bb9 |     
   nios2     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/8abb8abdf0e5059f850d7f2da7c3ee450adf87a3 |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/2bb526b32ae3b2e53fcdfabbe2792d52e6a019ca |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6a1cdef4be2925e5c484cbfb2c963855f3f1de0b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a92c9d09c568209436d78f7e500aa8d0bfa5fa3b |     
   armeb     |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/ac65438440e466b09e7004330f7f11d07f1c544a |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/060dc1452b4f318a74264a71ee565f105eb22d72 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/728662d43101f3ebdea69fcf28890edb239d78e5 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/de6526e1a8d076d8fc70e1ce2aec8020c9e44f6f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5f620469f8cb199017e63c8b308251986b12e083 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a92597513aefb91912c4d7191f5db8635c92871c |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d825eb6cc71937431b59ffb48e4bb0f0a3ba5a7d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d6c4a9ea4beb19f49723a43fd7bd8ecfa21d3c6b |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/7dca88744e5a8e1e117b3ece90dbc4f78761b28e | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4f85d225b3be1ebb3f6df91a4ebb73c076c5da5c | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/26b0bc42d88611b5d0bb51e286a6c45e2158b1f8 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/99532f9971d49ad013313559c787e49fc44edc90 | ORPH
microblazeel |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/b37143fe43652ee5660cfe5d722c7814f4d4345a |     
   mips64    |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/ed5b7cc609897912737fedf90db6e5b1bcea995a | ORPH
  aarch64    |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/fe3b51681d3555547d31747d9fb5427b1ce74063 | ORPH
    arm      |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/be5827304ec9fe97999a5d5e664bc942a07a28dc |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/0ea8743ae90015914e58fab1ed6f7f647400c496 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/1cbdc34af2a0d5fb60cf9b3c804e06636e31afec |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/1e8ee7a0b1dff38e5d051c1bc49127031d112bf4 |     
  mips64el   |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/4136d68668acde7c96c887cda251761f867c1b9a | ORPH
   mipsel    |        lightning-2.1.3         | NOK | http://autobuild.buildroot.net/results/196bc28319e5d4aa25c1db887242825bfe7e6132 |     
   mips64    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/2b53efacc8c6e87ea1a4d2f660332ec5306fd3c1 | ORPH
    m68k     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/8caca181f4bea8fb75a0b9383a038b45443f2b86 | ORPH
 powerpc64   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/3336da275da0212aa4c18155e4d9da57adfec59e | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/87ec4822868880e69d8e39f436988ad4e2425cc2 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/15eb43600c666741843930833a684d8a11dc236c | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b20e184e2d6e299ea527ae26bd9ed57811af2920 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/67463bf1f1912b6419e77c7aebfa05c239d5c922 | ORPH
    arc      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/48c75d7097bf4f66f5a3d4d2e0e1f7a8b4534434 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/591509c801654b02e91e4551fa12fc16dbd0fda2 | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/86d911bbef3962081743bf3d89c82b5c7077e0ee | ORPH
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/ac6bcb0339b8c23eb378bc0f3ec4c0dfc3d3b413 |     
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/4c6e4859d7cb03d10ca4517acf53663920b7d567 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c7790589fea8062b8e42ef27556b55c2bd475bbe |     
   s390x     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/7355fd444211359a6366b33c3a2220acfc16d045 |     
   arceb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/3e0adafb443d1f90ff3979016ebec48e4b005fef |     
   mipsel    |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/1f24cbceca1c9de5e5bd293d02bdc9e9a59bde10 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c09ec1618ae384909929dc12607f0c8d0e5bee06 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/9150b44755c80881129236d01e815e8aba74777c | ORPH
 powerpc64   |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/034367bdb42f8968bce48b7bdb7fc3982d5b6ff3 | ORPH
    arc      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/c23b78db17b392e01438aa6472561a4702bba99e | ORPH
   s390x     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/99e902ad3290bd3131091e7b244d0cb5142b9846 |     
    arm      | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/d97f3e57b15b60d3cd5d3f3171458fc86b54a7ad |     
   s390x     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/8cd50a00f9378ae2df9eb03ceed27fa6aa1e2f5f |     
   arceb     | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/9bad322d8fb18cb262306db536bf856421212b3f |     
 powerpc64   | package/acpica/acpica.mk:40... | NOK | http://autobuild.buildroot.net/results/88df701448dcbd6282c68fb9e709f84b2e5f5e64 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2607a7ae6401e21695d412b3cd42d5a2e9989d14 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0e9bc7760e4efa1a2ed89379eaa5f792fbf3ce26 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4ec64c1a0cac59e604f56e424b50e3bdadab3d12 |     
    i586     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/ca6c55c9d1a36f9ef090b99a84d67c3df1261bcd | ORPH
   arceb     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/0c480d333bbb766edc402d7b96f5fb5b2e53213b |     
 powerpc64   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/b75ca75388d7ae5b2deee8c2198c12840394954a |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/20378bb7f58c756223e303f99679564a3c384323 |     
   x86_64    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/de1cbe555c1466849f0d5a1e5ed546805a8cc821 |     
powerpc64le  |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/ffda2b061964cb3d4fb38c6ff2fe6d8e40a02fe3 |     
   mipsel    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/608d71f719718843c337d3e94d68c9dc5193525f |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f5cb12213156a0de2b4ed7c45c7e00b4b6439e35 |     
 microblaze  | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/ccaf59c0299b5f7bb1bc8391b6a0e223c73303a1 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2b4e8a91270e5c17b4137c2964b9f90e42ca7de4 | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/02f0093f76d5a762789edc2b1c03137f9fdcb266 | ORPH
  mips64el   |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/7847498b0fc5af8db9f0e42e1134e76a94a5a05e | ORPH
    mips     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5b81db1d4dc58f159b0adfdde2bb1a40433dfd42 |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/79d45c882d3d1d83af1882cd35f6fefaf16a5dea |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f0863306b79e2c0f45d2884e394f22ce1221dbea |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/7df18f507cca37ef18572f5152b18d53efd883ce |     
   sh4aeb    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/716e53b1bbf7f5f35de637481d452d6d26faa68a |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1b4b9f92c1700df32863bbbf7a9df8797b30f785 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/33c3f735c688d56b0e1f6dd4121918d20cb1979d |     
    arm      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/fd973336c9a4fe1255f5cbafc748e011cb9cbc1c |     
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/acb20f8bf480150fdb3cb29a5f5bb970ee13ee94 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/efb8b17a436cefd0d9fc160d5772ab1e6418a840 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8997de61c086983acd8f82e40c27e80c043501c0 | ORPH
    sh4      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4b74503cca5fa0d82e2da1c8f2f782e6859a4606 | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9c8b1ea173be0ad3aa114233ea7ca3dd7ece2d78 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9f2266d9f561be3c42acc3b4b8355142c11b858d | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/dfe6201838a69b4f9eb5b6e8ea339cf23601d85c | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/265b53f5e92f1b6f33f4b0997d883d8e51b8d8a8 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/b2823ee91790f5edc38ba19c35baee9677602224 | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2d05182713f20ffcbda62139e20ce4fb2c92c59a | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/6e56f158eaf27935f9651157ca0a7a0229603304 | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ff7f314a621828c1c6c81ea7deeb09a1d9727925 | ORPH
 microblaze  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f96bfb70c8df6d41c0391a78e2f6a786e803f385 | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/67438ca62312d7d1f3bdf130b0c6f95e1813318f |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/bea8b1e3f917df20233e1f1fc873fbf417601111 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4a965026ffdd3ebeb1a67bf0dda92d74960ebebd |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/a60017721ca0881e17eb300610c9e239bd2e6451 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4d0769b789d87e3984c5fa6d71b6ffd07e54e6c7 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/44fd5b6b82cd6fd46c7160243413f73e3c8e84fd |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/93c9d8254be0c52ed606eb265009067b7ecf3189 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/d0176e0cd2625415bbf8fdcf60af33718288694b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/3d0377369be38552d04496a5cb61aaf9abbfda10 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/a78c37e899ddfc2b5d3d7ec2b6abb39aa625f736 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e6aa9867e28d437312072ee53e761badbc7ddf87 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/76758122e59ff30e963d888ba07620bb54721791 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/76360d1f216b3240eb1d0de06172974672cb9e60 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2923891fbe572c216aa167b72e8075127a35f840 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/c203e07385d87cdcf5c2e8dfec559765cd15be41 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6409c021965240ecfdd6524db92cca5344934920 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/43c08c4a15ba56a87e37eb0676c65b74fda55dde |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/3ec65c0bae58c5122ca878a175dcecb8b04840d8 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e41946e6505357e7d4c64c7fe089cc840e9fd81a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/da2cc43fc61975f1a00dccbd32a62857baae151c |     
    or1k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/604818bf6b30a9fe3362f9f8da6091c1387e57f7 | ORPH
    or1k     |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/e41950f3cd4bd83d9b067af498757cb9d2f207ef |     
    arm      |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/850b0d23e33b83b3ae38990f67870e0e2b316495 |     
    arm      |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/b3a65c0378a914dd56b2e11097c10f8fb5891e27 |     
    arm      |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/6510afd8781793d1c9d30007f999516ed30a479e |     
    mips     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/705bd42b73d96029eb6c7c4b7f3a2ca030ad73e7 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/4daebac1a4f76d60fdcd5151cc3da90a8c1b248d |     
   arceb     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/eda894825c769a14575895d4294d0798cbe121da |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f53c36f317ea5853433346b2ad1821753db79822 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0f3c6e1e4c28b428379c0b734c72f1f840b4d868 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6f44ec283095b9f93906b3ecba1156369f1fd52f | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/95498a183ab518cf46954c75014a250493e7900a |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                    dhcp-4.4.3 | 1 
            igd2-for-linux-2.1 | 1 
              libgcrypt-1.10.1 | 1 
                   libnss-3.78 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                mongodb-4.2.18 | 1 
               protobuf-3.20.1 | 1 
                 uclibc-1.0.41 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/37fa0f6f51739d61f5fccbf514fa9e8983e6a333 | ORPH
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/20c1eb54e02a392d69bc807c24d5572c30a5b6e7 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5ff6643624c219b32009a6dbfee7604afab82975 | ORPH
powerpc64le  |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/db1ea7124ef780142dd83397331d5575ff782f01 |     
 aarch64_be  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/739754c9a37468adf9ca1800385db7ee1099093c | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6f1c8cffe0cef90dfd0253ebb86747a72dca19af |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a4f6dafd215e501cae6836580162b550b92dfb79 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/14781ba6aeb3d1d8ef012f8c8b70114213445db8 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                host-go-1.18.6 | 2 
              host-rust-1.62.0 | 1 
            igd2-for-linux-2.1 | 1 
                libcurl-7.84.0 | 1 
               libglib2-2.72.3 | 1 
              libuhttpd-3.14.1 | 1 
                 linux-5.17.15 | 1 
                 pixman-0.40.0 | 1 
                wtfutil-0.41.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/c88e703b491b39b3b2400108ab4008214a941e7b |     
  aarch64    |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/1f625208923a748649db5f487f5c27834153e18d |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e1bbefa7bdcd025451656ead358daeaad0b0e780 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/6723b461039321648232700021d56def3f945d75 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f394bfebb22ff1d467fd9fbd15819806a5676141 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4203ac87a320a861022e33732e588fca2d77b93c |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/15ee26adc54e3ff4b48e237b0fca28ec906d7940 |     
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/2d1f61ea4276bdbf3e2a50f8cb13df8e2a0e016a | ORPH
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0c6f0eded1a03ac9a5742999ec698c76a5921915 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/fbbc957f10f5741b4c2fa4a50ace90721a717ec5 |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9154d18ae7cb7100999a69fe088955e5a4714767 |     


Gitlab CI results for 2022-10-03
================================

Detail of defconfig failures for 2022.02.6
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116099353  | ORPH 
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116099359  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116099451  |      


Detail of runtime-test failures for 2022.02.6
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116100182  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116100185  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116099574  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116099529  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116099614  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116099673  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116099732  | ORPH 


Detail of defconfig failures for 2022.08.1
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116104816  |      


Detail of runtime-test failures for 2022.08.1
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116105655  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3116105657  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
