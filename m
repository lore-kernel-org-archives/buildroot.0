Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC84C43217
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 07:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404FF41600;
	Sun, 27 Nov 2022 07:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 404FF41600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LY3PjjapnfKO; Sun, 27 Nov 2022 07:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A03341602;
	Sun, 27 Nov 2022 07:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A03341602
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0190F1BF33F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 07:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2BFC60C03
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 07:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2BFC60C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPlnupPScN5L for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 07:39:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B68D60A88
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B68D60A88
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 07:39:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D2B3C0008
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 07:39:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 07:39:11 -0000
Message-Id: <20221127073918.A2BFC60C03@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669534752; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G9lZixsDBBigLk+GzIxQaw74gy9JueiKVcbSu+R1lYw=;
 b=BIL9cK6kSmbtOTtAi1HARCBwALdCh4aE20w4ddl/5O5RHXZ3jHIRuEGcwKnPYwSaD3qJeS
 Lcw12DNf6advXNvfzrbb+H3z1DbWEx4Qm/PPAqHvr7Q4vOialzUhjskefoom+Xcp+5JblE
 Av+6aR9wBa9eviR1DDU2IMnl+ObhQMIlkRAdXZGTvPzS5Ka1rT4dMxaQr14iMtlzJzvz5z
 aBDg3uXEsk8ZBNh0quGp2eDi29XlrPQasxaYKMGZjgS0mdFcDl5E0PJvDDD4SFVGsrOBoe
 MZkMv+IlTn3IA5A5YeZxBdYSjleYJBu1g4VCgu5wS22QuqGOFSiN6axe5lm7/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BIL9cK6k
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-26
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

Autobuild statistics for 2022-11-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  1  |  0  |  5  |
  2022.08.x  | 17  | 20  |  0  | 37  |
    master   | 245 | 197 |  6  | 448 |
     next    | 14  | 23  |  0  | 37  |

Classification of failures by reason for master
-----------------------------------------------

                      xz-5.2.7 | 11
              host-pahole-1.24 | 10
           python-numpy-1.23.4 | 9 
  gobject-introspection-1.72.0 | 6 
               libglib2-2.72.3 | 6 
                linuxptp-3.1.1 | 6 
         gobject-introspection | 5 
              host-rust-1.64.0 | 5 
            host-binutils-2.38 | 4 
                host-go-1.19.3 | 4 
             libgpg-error-1.45 | 4 
                   linux-6.0.9 | 4 
                       unknown | 4 
                wtfutil-0.41.0 | 4 
                  boost-1.80.0 | 3 
                     efivar-38 | 3 
                elfutils-0.186 | 3 
             fontconfig-2.13.1 | 3 
                gerbera-1.10.0 | 3 
              memcached-1.6.16 | 3 
uqmi-0a19b5b77140465c29e2af... | 3 
                 wolfssl-5.5.3 | 3 
       freeradius-server-3.2.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
glibc-2.36-66-ga1dc0be03c9d... | 2 
              host-delve-1.8.0 | 2 
host-spirv-llvm-translator-... | 2 
              libgcrypt-1.10.1 | 2 
             lirc-tools-0.10.2 | 2 
        ltp-testsuite-20220930 | 2 
make: *** wait: No child pr... | 2 
            ocf-linux-20171122 | 2 
                   perl-5.34.1 | 2 
                tealdeer-1.6.1 | 2 
                xenomai-3.0.10 | 2 
                  zabbix-5.4.9 | 2 
                acpitool-0.5.1 | 1 
android-tools-4.2.2+git2013... | 1 
                  check-0.15.2 | 1 
             cni-plugins-1.1.1 | 1 
                      crun-1.5 | 1 
             dahdi-linux-3.2.0 | 1 
                 dash-0.5.11.5 | 1 
              dieharder-3.31.1 | 1 
                 dmalloc-5.6.5 | 1 
              dropbear-2022.82 | 1 
                  exempi-2.6.1 | 1 
                     file-5.43 | 1 
                    flac-1.4.2 | 1 
       freeradius-client-1.1.7 | 1 
                 freerdp-2.9.0 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/squashfs/squashfs.mk:56:... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
              fstrcmp-0.7.D001 | 1 
                    gdal-3.5.1 | 1 
                      gdb-11.2 | 1 
                   guile-3.0.8 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
                       kmod-30 | 1 
                    lame-3.100 | 1 
      libabseil-cpp-20220623.1 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
             libiec61850-1.5.1 | 1 
                libkcapi-1.4.0 | 1 
              libuhttpd-3.14.1 | 1 
      linux-5.10.145-cip17-rt7 | 1 
            linux-fusion-9.0.3 | 1 
              liquid-dsp-1.4.0 | 1 
          lttng-modules-2.13.1 | 1 
                     lxc-5.0.1 | 1 
                  matio-1.5.23 | 1 
                          mawk | 1 
                  mender-3.4.0 | 1 
                mongodb-4.2.18 | 1 
                  netsurf-3.10 | 1 
              open62541-v1.3.3 | 1 
                 openal-1.22.0 | 1 
                    php-8.1.12 | 1 
                 protobuf-21.8 | 1 
           proxychains-ng-4.16 | 1 
                     pv-1.6.20 | 1 
   python-greenlet-1.1.3.post0 | 1 
          python-orjson-3.7.11 | 1 
                    qemu-7.1.0 | 1 
            quickjs-2021-03-27 | 1 
                  ramsmp-3.5.0 | 1 
                  reaver-1.6.6 | 1 
rtl8188eu-c4908ca4caf861d85... | 1 
                     shim-15.4 | 1 
              strongswan-5.9.8 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/17d61036c3f19adf799e0e2ef5e5a86ef73dfe1c |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8b193a57179b498e665fe0d30f6b6f1b4c14be14 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/46457adce6889e730dfe96cedf6b4e07dba7f66d |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/237cb7159273ea1925611ae45099215597adee6a |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/9beb0b1893350d212207355555183c05add40445 |     
    or1k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/171c4f12acc057367ba3c9df93407a742a1cb00c | ORPH
   x86_64    |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/d724fe9e2ac6a13f031fdb5685ea854c7d0efe09 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3a58f0f95f6cb2f71d35a71f9ab79d9845e3f153 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/c20947d500bda178a8dd2ca9ebc50fabfca92268 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a4287b86186bf0a1d5370cf53123b324ae65c1da | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/8d930f713d7c2ad73403b30676ef29c2d85b0ae0 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/0064e41396b479d6417bc73d1f423457146ff836 | ORPH
    or1k     |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/27992aed376382b040f7775cb5ea9607ab72fdb5 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a6bf598df1cf3e738a98dfda149c23835799cde4 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/559347e5e5877cdc0cb4d6c01a5ffa43e7102ac0 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/26f12bffdaa662d87121f6b16475247ae0850d71 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8bd7747190b44f9951303c142ff9eee70aed4d99 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ff760d7eecbbae919b66a20c52319dae594ab5f6 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d53a621193ab4a228aff3879322f8f8115f9c475 | ORPH
powerpc64le  |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/3222f3db85f8726859df223927cccdd03670d293 |     
   x86_64    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/b0a963e37274381b1a0a5b4224e517f4a8cdeb51 | ORPH
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/8c56a7c281f49af874d223c373d863586841bb4a |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/d7a0b58fbf0d012bc96fd66e5a038a0135ac4cac | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b60ed0d87ef2aba568dee72a1f220a467610798d | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a505377498ac4b3d5c22a6069bbf31b1d93cb2b6 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/ab23892ea4b6a70fa96daf8009812c31c6395826 |     
 powerpc64   |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/7609bcd41e3ffe8d90c0a06f68b3d821b5beb576 |     
    i686     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/1ac50379503365d09b67e7ebe6193b815411212b |     
    arm      |         freerdp-2.9.0          | NOK | http://autobuild.buildroot.net/results/8c2fad8665446cf5d8b0cb7dd6b5263c82a714c5 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/2ccd377f66a0b24667c240854c09e297d0816065 |     
  aarch64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/72eade18e60a816e51a70d2b0d6dfe5bc6a0487c |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/cfa385471cdd9d8dd912cbb5576f83fc413492fc |     
   xtensa    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/476866bb492a85575816d076e3d2333b49e05cd7 |     
    i686     | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/ad6b8a79ba95791eaa09396d4b86637aba5cfdb5 |     
   mipsel    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/ab2ce11fcc5cb88158cc20f7deb6487f73e72d6f |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d32df7629d5b36fc459351b45f69efed81e259bc |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/40995f3c366e614bacd537c0eb89c3bdc65f8fd8 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7699d4b71684b779256eff0e70dc479deed2a1d4 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3c8810fee32ff037befd610983c96327bc0c5319 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/db8d3ecc6cae3227170231fd2515b0dae0821f9d |     
    sh4a     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4df9bd267de307d86ca2fa10148b7ec64285f05c |     
   sparc     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b72fa68a28f8c6936efad6a92b44aeed3a00fd4f |     
   mipsel    |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/136a2eeec2f77462509b8386bced562f5a7aac5c |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/0e5d1083bd3ea4822ef1a82c87a72be6adc003fc |     
   xtensa    |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/e1f5bd742f637d2a7406dce4261e81e6588941c0 | ORPH
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ff66a37f20dd5329122e0fd59086cc68e92242d6 |     
    sh4a     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/35fd7fb4c2854e9199e0ef435c426ac50f534c38 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b6adc5ed1087717f4c4f6824ad0576f0094f25c1 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6e0af163bad85dd39dcc18d90315ba89a54be939 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6fc29f96bc2358fd2dd84e1cafd2b99739972ce5 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5261e7737c48a5cc4295a380cd2c077f4dca6689 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f02c6a7b0dd2a754db9ac062ba311098a666c646 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2209dee1f5fd236cafb4afff17c0eef91048da12 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3ee7215263e048350fa37ffa1915b8694301a851 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/303f7160d54d64a3fc1ad0cd74b6e128c5172fbc |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2271c80358165f3105c9f90af4fdda91e106aff2 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/097adbda91e7f195b9487d7433bac46b8d139329 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4641d1fc12b93878d1f70f24ed4e6362049865f0 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3b3498c02801fcf8b63ca472c7578cc4e6db9f54 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4961dc74009d3b51d28c10e6dcb0852a75076174 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/54dbe696754287c7ee602d12bedbdccef0667a1c | ORPH
   mipsel    |          guile-3.0.8           | NOK | http://autobuild.buildroot.net/results/9b60c8bfb730cdf3c9ebe92123efaa1e329ac2aa |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/037491f28c4869e7a9eb38f73683bda429c304c4 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7aebf9c7db2e46b06febbe51965bad4698a8714c |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7ba521978338491e412d91b27d89145bf94329e9 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/67ed0fe4975fb240cac56621355481dbfc0e7d5c |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3b469432d032d6568ba5447242481bdee4547328 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/86f8fa17d61314c95cfcf2e4f9a771498cbd806f |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/3b6d28e771f3b2a21f38335ba27d1725c10551c9 |     
  riscv32    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/f6cec28d719388b9b4169b55310630483ecb00a4 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5cd535e63178f402f541f383cba5a194d8e97e65 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/768b004882dc670b11035583042bfa62c55fd65c |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/8122c46d33d43713cf05b10f42ebabbcf656f532 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/0de20dd478acd013c79b8ecc0dae971a02ff7b4b |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/14dfd11c86da08a7f512c53fe777e67c5808e2aa |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/715a44f5ac78f86a214f46cd3991a7ae280697a0 |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/298f7c62336188969d595c5050516e48bce7f4c6 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/54099a27240d48659997549aaed2c134d41021a1 |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/675c9b2f31d6d5f567e95e38dc3d3db6b47448e2 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0ced84d328a20399b4a89dfd4d097dc79dbd0053 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/323cf70e461453b8d02cdf3dcb369fe80cbf5033 |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a9866872132e5328f1b7446c273bfa1146ad3910 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c3af792e8b48e0763c159163a1fd9865a12bcc80 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/01c57d87b5445c2323bebda6c8d7150a521ecf8a |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d9d6c89f319ddf13bb189fa2a6f759a1d2cd26ab |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/1ddbd1a13fb4d936e3e301accc8a4e30db680b79 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ab946bc0a01b7bc195183e77822aede69117e979 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9453b73ea5d04c92cc101cb395c73cdb0f0be2e0 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b30d70f5df90d3fa3dc7a4f37951b35dac310399 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/7ceb428acadcb5a0d01bfb374614628f3dcbc783 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/e1fa9f3ad4cfc1f1183b4f20376fa64f6f7bec9c | ORPH
  mips64el   |            kmod-30             | NOK | http://autobuild.buildroot.net/results/a61bacc83376c2f58ac5f9b36c82799716b93763 |     
  powerpc    |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/2938da734436436c52f47451a9f5510f99c35768 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/2abea9224e8eb5705650d5d4c3ac6a1b010c2ae9 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/5f1a42c8becf9d9872fe1168f8032c2f2091d901 |     
 microblaze  |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/43a76d3fd8322088a9b659795e2ab626b6658646 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ddd02f2f38638d2f59495beed36e4c7226cac4ab | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f3d463994e4813d3594f54d3d23eba10b93b293f | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8fb07392fb9203168ecf1b6a7dfe4fff6060a398 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/aecc0ebb66ade986ca29d3cb7c749da45c42f59f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ac3160f370ea8d52f094fee04d0aebbeaace90a9 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a4ab2ff6b699cdb2707aa3a62a428696b828fef4 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9a1c4159c9e99f45b505c8309310c3b3beec32b3 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/61ad75b2848bb32a3e5b8cc193e142e023e653e8 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/04c8a15d9be17c7711e24b845b39f762f96bb035 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/9afd82032cf16f205c32af9b5f3e0333db3eb522 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a61739730ef614b90303c4976314ac7e96e2b997 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/447866f0e4a1607e9b556983bbd5d713a1778a21 | ORPH
    or1k     |       libiec61850-1.5.1        | NOK | http://autobuild.buildroot.net/results/76789e04d742a848f4674f245f3d224f021b9e52 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/4257edd6af7eff39eb8a0d12d9e8dec8b1d83832 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/db547020d29326d238baa072966b00dea75a1b35 |     
   nios2     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/05aa28531c7ae78d3de4efa8abd964e1a94e5ec7 | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/11a014d875eb51bbf7b9c29707f8876697de1460 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/8b6d8dd72b9d58df2500843fce6f03f61beb9f0f | ORPH
    arc      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/cf4dea54cc3644bee4496cbad311593e3fcc0e85 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/baef84d0dea59b0eb012c4e4dda1f8f82eff3440 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/3d2f7927bc088a7e58481bff4f660a0cd30df59d | ORPH
   mips64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/885091fbdfdcfc070aa4e7b45f622029d484cdf7 |     
  sparc64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/4582562f3c748041a1d9f9d26fe58e8ce08538ca |     
   nios2     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/3c50fdfe6f98cf708bf138fcd043f4834c0492f8 |     
 powerpc64   |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/d2dc4e6a23b768803cc54a97c9809fbeac73648b |     
   x86_64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/663c2d1b07d42e3c21a1017c9439c6f3e920e303 |     
    arc      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/16f4efabd4b31eb12f966853bea39e695d48d763 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/5e53d6a3a6a0e0de0f03ae21b0baf98b10bd8615 |     
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/51e57c557e2d2cf9425005b639990b6afff8b3e7 | ORPH
    m68k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/fc9536499e5794fbed1d3cd77d7f2d87a413f20f | ORPH
  mips64el   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/8bedfbcbab936dade4e0835d2530899aadf51049 |     
   armeb     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/7fa378197a77d702ff59b7442fff51ec645bfe17 |     
 microblaze  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/47fe0c1530e51a07f2a0378c5c026d2d429267fa |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/8ef6333191f91b91ebea017eb4a1e7fd43e0520b |     
    or1k     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/6dfe332ea8e946f68889957c593661375ca759b1 |     
   mips64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/689f848a9980d7374c22b6277dee2aa72907eab6 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/b6ba47f31e9be2db30c1cd0efb20bc04e0539e61 |     
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/2e4d6140c32973e908c27fdf073c388490c779ad |     
 microblaze  |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/1369e5280be62e5388ae1e8df48fd0b504a2b0c8 | ORPH
   s390x     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/720dcf0a7abc2f5b55af0355211e7ab12165f086 | ORPH
  sparc64    |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/79d67a75c6b579847059f30744da5492c3a26c5e | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/0476bc298d5051f1feb585f2579dc4b8e710b974 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c97367aa9cc24d77bf66e884e09e70a4093877a2 |     
    m68k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/2ed1a3aaa1c8fe1b73ac6dabf8db9f5ef692297f |     
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/2e68988b653e1c3dcaad0367d1bfb9448670ef71 | ORPH
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/aa1e2dcd545062f448d43ffc8a01c4c11112c23d | ORPH
    m68k     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/d50afd6310b55e91e1ad6038198070433616ddda | ORPH
   mipsel    |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/a5eea0e48d9e8ed20367ed8335f2060ab97e88eb |     
   s390x     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/9c246e1daf325bdfd5d7a59570c8aae526dc37bb |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/606bcf61e620cf93ee7958e8eba4814d23dff07a |     
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/60a370de4eb1c525ef742d7cd0173f98fe36227b |     
    m68k     |         protobuf-21.8          | NOK | http://autobuild.buildroot.net/results/5518f93e98ad4c651e1ef1660b4cabccd7616535 |     
    mips     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/69d59c8d24b52a2a66fe4d2d202ab8bb8a290903 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/50c7a42241bda54b95b97962ada897cbf9c7c01a | ORPH
powerpc64le  |  python-greenlet-1.1.3.post0   | NOK | http://autobuild.buildroot.net/results/f914a57849acdd12c0b23ef8e9dd08a73e3c7746 |     
   armeb     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/25bda6ebc0e33655c9416c0b9b9dd3222be21ca9 |     
  powerpc    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/a9bfcded867dc54219b2920135080dd6769bbf6a |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/c3edb269f464a0338707a55a766220075aeb2ba6 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/c191018a93014b6799cafb5d52224c63f4286b64 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/c153d7aaf109a54625ba04c5d1b9a96b2aed6103 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/8c15771e3167644d3636ed20b04afb5f65d07350 |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/7c9c9af0b3520a8fd0de6727ad515090ac2676ae |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/a6c2f02a11b2629b09bd2d077a2393107c14dcd1 |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/1279f50fad4b96e4ae7c4dfb98dd15765444a10c |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/85cad5310979d41ea6cd038e4802941f108b2c5a |     
  riscv32    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/2e714b78502cac4dcf28a6ce83f84a62b06a88d8 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9f6d49935dd94c40572905d7d89a12c85b689082 |     
    sh4      |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/30309c20cb7bcc42e8ef68c7582e962d56848764 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/633f58dc0eb1eb471100ef39a5848822241678b0 |     
powerpc64le  | rtl8188eu-c4908ca4caf861d85... | NOK | http://autobuild.buildroot.net/results/8bcb4d0adabc141ff8144f9e22bd549e3cd8858a |     
    arm      |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/4d444da2d25d64f7fc3f1488dc4e3fe833435fe1 |     
    arm      |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/4928069bc40489c42efb63e6fef5428accc958d3 |     
   mipsel    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/4aa3c1ee91a43e5f9df8de3f86cd684b2a1659cb |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/0adfb62eb50a1281e37376bed8d195e09fe4d31d |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c9cee400a0213c81e02e6ca513061b0a04ebbe63 | ORPH
    i586     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/bec5b02ae5cc8be1f764583a67b3ceb45b057305 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9a256a22f86565c8577bd5b1740f8328b9e5c615 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/67d67428253149746de3e6609a37e84ed19f9454 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/ca725be1243b8b3ccee1c89d0f9fb36725fc55cc |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/bb5d244bb41f5789ff65ea26d496632a081a6a8d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/edb98ac041a0173224ce10160e54f3d8a53e7e78 |     
   nios2     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/1e2e072620c0a9086336dee3c4dde2ebfab277c2 | ORPH
powerpc64le  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/7b3e47d6c0f0c2774b42c1c289d52564dd15bd67 | ORPH
   x86_64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/97052c9e46796730b9dbde308b1eddaf6055f1b4 | ORPH
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/48fa323bd7e4faf6fb2adbe9a5769e9148a4f58d |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/66bf9ab3b7f584e505fb77f727156c5af6440b86 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/1a6429baad283f6a89e55495686008c55a2ea762 |     
   mips64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/02397f6f7a539e30802516f716ca7472306dc506 |     
    i686     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/771f72fe4f221c82c91e1d6ef874762d630eb8d3 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/ee0cc9c3c0e8153a7519490e4a14271fe82aeab8 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/53e459c83b56ca78c28f42f0bfdcd532c47f8766 |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e3ce1450b919e4525f02a115e3eca9caabb8a96a |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1c661ebb27e01c4f667f643f5b8662145533beb7 |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/193f54bd949cf4dc820dff57cac49e1d23536e17 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/641ab9daa594230e82800f899d70fa0ea8b12ade | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0b58a29951e5df9a02c82bf8ec8fe438df593db8 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/70b89d4f5b4edf8059d5beed16000082073fc478 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1a2f47ab7cf68dacb4b3e5986ffbe7dcf30f07d4 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/21d2e9ccad8bbfe7a30a2d21479056e568273b1a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bb63ed3dbe303f6fa50efbd62ac4ba3b4410596c | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2d505de7bd7bd84abaff7717fe4ac5947941c4a0 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5e2d94e1c7877b0c566ad1e2eb4488a9ade0c533 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5def22607ceef29cb7b2317c3cb8f8be4c9f3bc0 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d63d0d325dfcebf6cf260573b40fb71eb8a78feb | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e7765eaf2bfefb2a74522951c9268c1c12c3aafc | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/91ce38db8c7074f4a7b89f08cf223eeeaed5d6ce |     
  mips64el   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/005e7b499ca631da00fa8f1823886adf150f88dc |     


Classification of failures by reason for next
---------------------------------------------

              host-pahole-1.24 | 3 
          imagemagick-7.1.0-51 | 3 
                       unknown | 3 
                   aubio-0.4.9 | 2 
                host-go-1.19.3 | 2 
                 coreutils-9.1 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
                  jack2-1.9.21 | 1 
               libglib2-2.72.3 | 1 
                   linux-6.0.1 | 1 
                    lxc-4.0.12 | 1 
                    norm-1.5.8 | 1 
rtl8192eu-1e15b6d451731bc4d... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c199f18da2089bbf6ef5927871398721bf106117 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/184518aadce119121b170094de455eb7fb16b5da |     
   sh4eb     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/23a4643c160be4b6d372168996211c0efac66cd4 | ORPH
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/88194c46d82244c6c610edb8bd52c4e3a4ee5201 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d4f7fe51949857c3b1dea7389932c205b71f043d | ORPH
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e9f5cc8c39aaae9bec5aac6f2f29aef22dcaa50b |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/092961de953f28eb0db0da57d0f72e7cf95e1fae |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/858bb24f2be40542de27b7573d84f89003ebb046 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8b3d3efb5158cfc2d89e0082bda22c8598eb4963 |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e3fd56a4d3056e0812761be58dd1a3d19ebdf083 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5128c4fd71a5ac383bd5ff0fc876b96cf2ee7d9b |     
    arm      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/4a2f6d83f7182dac4dc40cc5c11fe7484733823c | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/758e6bbe6740d5969473f6c83405f086df8e9500 | ORPH
    arm      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/18aa3512047030c9c1197146c105a519f7c5bb40 | ORPH
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/8a44f5e161cd8f2b053d0844ffe15f5559f20d1f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/da344db3cff7e9c42e293d6379112b6f7163f552 |     
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/5002f77551bff64f0d17df942722cf6adb71af15 | ORPH
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/c46ab3e72cae0eb406697ac3e586eb1548197747 |     
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0ef9889acb2f9ccf64ba7b76b1f1101b3c5163dc | ORPH
    or1k     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/99996109c5826f5194f76dc9ee9b3aee111fae4e |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/717b0ee3c66480e08b2c455cd96e0436cb80e20f |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/8b8d63d59c92978a47d586ac804df1e9b53c6e52 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/202114e775ff27ccb16e4b13012b3ba83aec57d1 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

libcamera-1966b9a58436fab51... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | libcamera-1966b9a58436fab51... | NOK | http://autobuild.buildroot.net/results/5ea8f180e4909f8157565238b25f567fcf1f3beb |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            igd2-for-linux-2.1 | 3 
                 linux-5.17.15 | 2 
                  acpid-2.0.33 | 1 
              alsa-lib-1.2.7.2 | 1 
                  check-0.15.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
              dieharder-3.31.1 | 1 
                gerbera-1.10.0 | 1 
host-pahole-73383b3a39afe86... | 1 
                jemalloc-5.3.0 | 1 
                libdrm-2.4.112 | 1 
               libvorbis-1.3.7 | 1 
               lpc32xxcdl-2.11 | 1 
         mxs-bootlets-10.12.01 | 1 
                 openssh-9.1p1 | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/bfd88985bf8d5b8bf1f07b9560c7438706e6ce1a | ORPH
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/7c2cb4e7fc3ed3876d5638bcfd065b948eb73da0 |     
   arceb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/513c50372e2d2e525574e2c16ff143e6ff2d4926 | ORPH
  aarch64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/2787f900284801b7659cb98ffa47d7c7660e9bb5 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e4d132a348eb967649c1bd77444b0dc5974bdfad | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/b288dd38aecb736504080798d0a56e7faf28157f |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7d362ef5375100af865a9e0d432691d7831514d3 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a088593574e89dc867009944ad91d6378284f1de |     
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3b7a1e83c5c3571f821c08fe240710972edccbac |     
  powerpc    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/322293a370c863e75677cc4ba2188371c25d3ee4 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/cc84a62db18655ad849279bb993515c815ae808a |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/c9605795ff91ae4d0c017a353803b16aa456975b |     
    arm      |         libdrm-2.4.112         | NOK | http://autobuild.buildroot.net/results/bf5fbc70a763f6d37103f109542782a3a58f5d84 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/008680587ed329c62c046fbde461d1ee660272af |     
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e460b9db4fe27f58e8f46a0a70ae826e5fa33f52 | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a25d4d649efd991603d98bd280e00f19223db1f8 | ORPH
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/2b77e285f0f8f87075cebce08146f8213c415706 | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/67911679b61a61ccd8d064b5c7cc77e50250c666 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/cd6ab054bb9cbe02818b5f7d4b66ab4e1b794b49 | ORPH
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/42f576d004f7f21dd1dbdca897e0bbce38609484 | ORPH


Gitlab CI results for 2022-11-26
================================

Detail of defconfig failures for 2022.11-rc3
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3378473592  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

