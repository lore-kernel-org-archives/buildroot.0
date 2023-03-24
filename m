Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A012C6FD20
	for <buildroot@archiver.kernel.org>; Fri, 24 Mar 2023 06:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDFB2401AD;
	Fri, 24 Mar 2023 06:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDFB2401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mskquMWMJ4W2; Fri, 24 Mar 2023 06:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FA8C40236;
	Fri, 24 Mar 2023 06:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FA8C40236
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE2A61BF295
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 06:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B03AB40236
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 06:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B03AB40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xtm216byWJUP for <buildroot@lists.busybox.net>;
 Fri, 24 Mar 2023 06:38:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66186401AD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66186401AD
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 06:38:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 589351C000B
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 06:38:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 24 Mar 2023 06:38:47 -0000
Message-Id: <20230324063852.B03AB40236@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1679639927; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=imSXHgFTHLJb8g421yiQ7dyWZY1VIh9Z36NuOUD7lIs=;
 b=kLoKd/HiS74rRyr1wOe2wI+bkH9xwJgBl8qfjV/QTUvB+SJBbwKen/rELp7uqfDYITaFCj
 XjNfuLqXTdr+74648d4EcDi9h/nAepYH7sVEK1ECcXMD3zNcjUgE3ji/wZ23a41fFmQF5r
 H0kcb0D8Hfj4DRGHFGQqC2vxaI1rSxfFKCyrSj2JwGM90ozMrHcPtoOJiSQPKPJc8cAPgw
 5wLPysru2pb3bQ2dD5oW7es/j+jXfxC9eZJKu4Huuj+r/xLU6HJegp14EnZBNcrp04LCYV
 M1M/2/60vNDa/WMIUKp1SRjNTJIVd65zyeCyBfW8nhPxEIy44XsyuptmDy7vJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kLoKd/Hi
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-23
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

Autobuild statistics for 2023-03-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 14  |  6  |  0  | 20  |
    master   | 204 | 160 |  0  | 364 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 9 
                  snmppp-3.5.0 | 9 
            host-binutils-2.38 | 8 
                host-go-1.19.7 | 7 
                  linux-6.1.14 | 7 
             bluez5_utils-5.66 | 6 
                elfutils-0.186 | 4 
                     gmp-6.2.1 | 4 
            host-binutils-2.39 | 4 
              host-rust-1.68.0 | 4 
               libglib2-2.72.3 | 4 
        ltp-testsuite-20220930 | 4 
                    brltty-6.5 | 3 
glibc-2.36-81-g4f4d7a13edfd... | 3 
              libgcrypt-1.10.1 | 3 
   openvmtools-11.3.5-18557794 | 3 
                  cmocka-1.1.5 | 2 
                 dc3dd-7.2.641 | 2 
                 dhcp-4.4.3-P1 | 2 
                     file-5.43 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
       host-gcc-initial-11.3.0 | 2 
               host-qemu-7.2.0 | 2 
                  ntpsec-1.2.2 | 2 
                    qemu-7.2.0 | 2 
            quickjs-2021-03-27 | 2 
                    sdl-1.2.15 | 2 
                 uclibc-1.0.42 | 2 
ulog-0389d243352255f6182326... | 2 
                       unknown | 2 
                xenomai-3.0.10 | 2 
                 augeas-1.12.0 | 1 
                    bat-0.19.0 | 1 
                busybox-1.36.0 | 1 
                  check-0.15.2 | 1 
             dahdi-linux-3.2.0 | 1 
          docker-engine-23.0.1 | 1 
                     exim-4.96 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ext2/ext2.mk:66: /home/b... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
host-gcc-final-arc-2020.09-... | 1 
          host-rust-bin-1.68.0 | 1 
               host-zstd-1.5.4 | 1 
               ipmitool-1_8_19 | 1 
                jailhouse-0.12 | 1 
               libdeflate-1.15 | 1 
                libglvnd-1.4.0 | 1 
               libunwind-1.6.2 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.7 | 1 
                    mpir-3.0.0 | 1 
                    ola-0.10.9 | 1 
               pcsc-lite-1.9.9 | 1 
                   perl-5.36.0 | 1 
                    proj-8.1.1 | 1 
           python-bcrypt-4.0.1 | 1 
                  ramsmp-3.5.0 | 1 
rtl8189fs-ed6741b52bc998875... | 1 
rtl8723bu-92c19318cb54ef96c... | 1 
              skalibs-2.12.0.1 | 1 
               tcf-agent-1.7.0 | 1 
                   trinity-1.9 | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 
    xserver_xorg-server-21.1.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/e20fba31a0828c55d4ecb91844af5f3265e54357 | ORPH
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/53d242b9650df47cdaa5c77d204adad17a4af886 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/a93b276d48e8d3c8aa11632f21e2e40ecda12e98 |     
    i686     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/b9ace07145f8b0a8cd7bf8231e5d5a1e924f1017 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/942282360f44ceb4469c96f667c04e25ae0546aa |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/4b9447609dd67dc23f3ed9ad1a41a77847b4ecf5 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/4af4c1dd4722255af447b9377269c2e5e732e990 |     
   armeb     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/8e27f584c0e1f6be557eedd917ca229ae498c078 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/0119cbc00edb550b117afd02fe5defd8c5ea48cf |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9214cee05e0b9159f5e673d584c1b012eab56875 |     
   arceb     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/507fb0a3f1435f0cdf6f2d4070d99ef2e188c6d4 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/f4b6e6e0ca7fc954ecb286041d015305db7df716 | ORPH
   mips64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/02491f08d42d96e2a5d98743cca04f6d0f0fedcd | ORPH
  mips64el   |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/70c1be0d9abea1ec3e349100221c8a2d7a45f1ab |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/18a2431e1103493bb2b8629cfb036c81398d1d72 |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/d85fafb084076db756f9b60bcba3fdaf72376858 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e4431162bca99a0dfb2fbf2b9f143a43e2495a85 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f6d7623ebc801109a67b92853aa6876584c57030 | ORPH
    sh4a     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/11e96a7a34d6fbf84dc4430f29d90d08025836ee | ORPH
    sh4      |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/c96c84bb96c617b843d7eab794b0f3cb3c548b76 | ORPH
   x86_64    |      docker-engine-23.0.1      | NOK | http://autobuild.buildroot.net/results/5e3304a66a522afd332b456923d7e5319f9907c7 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a5696db925936953a70449c429a07987ea70fbb1 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c33dfe8cd21ae49f7c2c862458c6331cf49d9930 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/48b5880ee4704d746d34fcf65d50cc6066c10698 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cc9d8aaaab5b42dadb3b387c560bcb1ea35ef104 | ORPH
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/61d02aa977cb9c54610c99c0869453ebf773c3ae |     
  powerpc    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/6d11cdd725789ee2d9e4668ccaf84ed88a07d378 | ORPH
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/7f5160b202d0cec9eab6d367d4b09b3048b574bd | ORPH
    sh4a     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/352f91a4b226fc2522c45ba0b46b1f5fb5ae608b |     
    i686     | fs/ext2/ext2.mk:66: /home/b... | NOK | http://autobuild.buildroot.net/results/2655580363b8fa3f0262d835081924fe29586958 |     
   sparc     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/2c5eb276cd93da8801026fa87fde143780bb7a38 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/96340f7f11a06ee71593354f18318c6c20b13010 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/57de992b95c0aef3356eadfc6134c0535323629e |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d4b8c9f8a90f581d61af2e1ebe72b0cfabfd22cb |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8873b7396554642b33daddf987cf4d873e235899 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/791cf6f762893d9a6bc77ebfd761bde8ad2e573c |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8f7951534fc01202a08e89013fefe58c59fcb482 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4d1ff4382ecd9ebf44fd8ed7c03882ac1c99b6e5 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fd0c7a107b741e61aa49c23aa4d8310db0b65f18 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/4ee2e08222065e36b1289ecbf3f6091e917cb2b7 |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/a05f419de4ea44ba66997b6213f65b1386158711 |     
microblazeel | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/8d8b7d34862bab6ba8aa8fe1d2f1f227063aabe6 |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d87335748c39191fd8fcbb70c3bd1971f07e64db |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/99a05f261576304985a29060fb627e9ada81b738 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/6b61bf6865a1f3da15cb08194967816e5d476171 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/9a4562a117646fde268f5960a781a5c817d69856 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/f0daecda219ae7f09ff2a6f3daf301949db3cfde | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/878844900a13d3e7bc01c670d31d1338334f20b8 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/d1e1a34a871115349b039cd451e37a630c2f7499 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1f29a392d29e4e3efd86990f25e102b27efcf182 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3e5fc3fd547c6ecfa61d9ac1efca3041e4886f63 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/de3ebe9f3dca7af800a33812f84694eb834d0b7b | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b23bff1c5fa3cfa1a43e674b50533ff0ebbf72e6 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e129525ba4c315cf520e7b7d51415c3ce7495bac | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a1afbc5ee6508abb11532f70d303fab4eb343e94 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5e67cbd129b9adb764901b2ae901624cf27a3bc6 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/66a9068223135ad06fb21bfa0b4b77dd8f592cbd | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1f0d9a7dbeabb14568d115fbc7d807dbfd04a7b2 | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c57fde1d4b41b21c2f36b22edd42498ec02cc77a |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0365cebd861c82f0d678b90cf128d7e378546925 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d30c23cbf33bc3795f6b36014631156bd7c226bc |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d3a580f017669db139e0a4155da6f077d53217fe |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5d4a325ac760840a98d7e1fd316408f374f5b749 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/037cc75bcdd5c97e57b44c2acb95b293feb511a6 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/23d77f75d68f3e38ee581b17a569dc06df4d4438 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6948ad5471d49a205bb5330164e7f39b0a347ba6 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/99e7a83c7b3ad438a40cda75025767872bdcd64e |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/48d331bc1acbb35adbf125b8422f19ca3e9f5c8f |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/4432b44146e8f02f16298eefb99979ca5485a6be |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1cb39152a4007ff1f25579c6a49dad7a35953fca |     
   xtensa    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3ad337ff509fa3151a274ef8340f1520c42d1b64 |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/cd6e22a811ce9795137c2cdaa560822c3aa4dc4c |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ec4a385f3f220f61424bde162575d1b74282984a |     
   armeb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/95c41c50856f8f36dfa24cf9a0a4931dc5cf4c22 |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/cc0e4c5bd279eb87c39913b2bdb23aa91718bdc2 |     
   mipsel    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7e19c941c8c5ff9293219bc29d1ec9721ed7cc9d |     
   mipsel    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/39e96451da3f943abf430fd291117eb0226cac79 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/29a1e22cfa62e62c68f3140f6aa1c26b51344ef3 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/10cb204de8786e0621ac7224b1fe81e4d5a3d4ff |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/9b5eaaa30abc8c9602c88450f017dcc1379d80f8 |     
  aarch64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/df5fddd4040d78ef7a666c090e8deaad8a7adf9c |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/82bd8581bc804272dd7c83ea37ae1e39ac61fb10 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/1ae09a3ca02c441e4fd02219858c2bef6ad23ad0 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/b500a8155ea01d27157ae6221d15a07a26ac5d99 |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/9aabcd4e39163cb299198b7541cb766f09853403 |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/1d8f06667982c8260dcfce52015028d0093c7335 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/d5db82d1d60e59918d64fca6f6f6c5a6a2c78cf1 |     
    mips     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/c1bae381f10d6eecb571bf2abba6cbefeb40ede0 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/72aafa21ae8438a5380e689ce361054697eef611 |     
   mipsel    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/8290bc0416ee4184da4715bf67bee8a19a44920c |     
 powerpc64   |      host-rust-bin-1.68.0      | NOK | http://autobuild.buildroot.net/results/0cbfcf21e0a845c1f40557e0c816a5cf76617367 |     
  mips64el   |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/14f14295cd54ad3c0c0074226c3600c46bba6ddf |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/1fb43ae5e23873a1bdefc1b3206acc6897f05109 |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/2ce942b944a56e47bb473b431896bd1a29ad294f |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/171057c06b91c70bf624117bf2e29a5282f69d1f |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ecc5a8c0c60bc94a70815a3bc4e8501411b9e8f9 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/87f5114fcc179332eb1491e6122b0684e5d9168f | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ce5db2c44737f8c1862afc407be295d81c1ce8a1 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b6303bc1e68a5a6171b47349167e002d46df54ff |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c89c913cc9986dd01f89c671483306e565f4c2a3 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a1062fd50a0f6ca07be35981c09b62c3aac0bc4c |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/067ae1d0650fb1020acc80cd4c3d84f933265d5f |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/a7686db738ef9d8a7b018b27836d05955c0e3d9e | ORPH
  aarch64    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/da3efaf9576af67be7b2a8660ec8c6f554f0febb | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/d909aa2395a9a161decb112fd2b77efd18003c49 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/72c93f35dd74903f24fb3cabf4c396b55b678d4b | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/748ab6d09941f0379fc0d42f03e88b6b4f4ea959 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/4eaf82b2861e97d63007415f5ccbcd2c157dfc57 | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/88a4110a80553dc4f1ed8093ae87c7c243d02338 | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/1afa33079de0991c2282f952c05abc127f546ed9 | ORPH
   sh4aeb    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/e83cb0c0e8e3915e97b512630f89ddc8fd22fdcf | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/704a84d3aff20496916e7b1f6979d9ca5ae871eb | ORPH
microblazeel |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/9d0047793256528be40bebda87beea788c1af11c |     
 aarch64_be  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/908d7a2067e329a196f16d8fe01b6ca369604782 |     
    or1k     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c8c5d1796006e7a6414026d701ff8ce33953b84a |     
    i586     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c48fc6b82d3286b127d1b838eb63d767d08e84f9 |     
   sparc     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/c4b2b8e4b15c1f1b569fb59fbea89d7c953a1609 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a4e5905c76777e95222e24729df1a9b33bdf3111 |     
    m68k     |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/6be0ac3a4728a3746f1558dede1fe629820f0364 | ORPH
   xtensa    |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/a0c617f027019fed38be2f5d068e6a8dfcc2656c | ORPH
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/75dffa4184a96db8b913599b2255a1384c07ecb6 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/475e1853e369bae8fed2563b4c304e25618a8595 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/e1723c3b59950beccff7b07214b93e90c5aaadb2 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/b38c574f276a3129e34b7d56dc948aa1017788b5 |     
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/952f3897a08b2ebf1aee52952047d29ceb7627eb | ORPH
    mips     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/6c8829b9d90a4833c92b97bce732eb6428baf14d |     
   x86_64    |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/9c7d32429812b0d0c36e0594d1c13d3b4ae23616 |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/dc518ad80de69bfa22b96e1df81c32eff17478d1 |     
 powerpc64   |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/fcb12dd48766380d1fad656fc00f0d4b4c5c8768 |     
  aarch64    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/7ddbe1497b1832c9f5c740230efccb0ce2687a58 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/746f331112899a90a9520d317de45b3fb85cc542 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9f163429d5e76e35d44e35a7f9dc015887ebaaf4 |     
   sh4eb     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/7f5759a2bbbcb8d2dd0e0c3b11380577ca6dc11d |     
 aarch64_be  | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/37b1e064c377b03605dd70db55f8d581b8c3563e |     
  mips64el   | rtl8723bu-92c19318cb54ef96c... | NOK | http://autobuild.buildroot.net/results/0d5a1d933453bee04f661b8fd59e53550cd1160d |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/a82fb69d5bc452327faeb9d1aab3c43d66c341bd | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c7027873e490bd52d518ca552f7ac48dddc0272e | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/77182622bed6d6fbf8d4793fc06be07a93415aab |     
microblazeel |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/9cc85e15eeae259ad98ed9394288498059569131 |     
  sparc64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/d5b28a8102ce9ff36ec69614f23391187eecb9fe |     
    i686     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/d2f7d0dbf03d784862add883e8235c88714363c3 |     
   arceb     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/bcb087a5853eec4061d425a06d3e621791a8d41a |     
powerpc64le  |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/9489a959d302579846b795b4f1f5e92529bbd167 |     
 aarch64_be  |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/1a6fef200ecc0f9875ff2e73f810a3c087777881 |     
   x86_64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/aa9ac70dbe71cd9429223db609bb0c9fd0de7961 |     
    sh4      |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/48953001669d921244b6beb61e16eb79cb2330d1 |     
   s390x     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/2b9b0904155348a81ec6edd0b951fc7fc8226641 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/47a81d72c0ee5f5a4e2deef6261f843c15fb8add |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/1eeaf3e27f46779683e879fd9f6a079d779d5717 | ORPH
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/08442a936131edae73ee2951f00599de2792e73f |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/e8eba0b421d38e579cbf2a3c7adf471fb4ec198e |     
 microblaze  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/847a2a2d24b52828c4d4a3e5e3c2240d25eea27e |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0e411aea103ab9f831ae33f970a76a2ab8ffe520 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/0ef60c934fb23b354d64812211bbeaaa92e8867a |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/7ac8e5a3007cb4eb740205750d9ef5eebbe7da52 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/79ebdd0d7c6f1c61725096eedca0d577194b02a4 | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/df49e71fb8c481e61d7fa022816ccfd68cb759f7 |     
    or1k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/30d741b173ec4f7dda95c50359d033334cce142c |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8b3d2a9838fe67bb8442583654aebb193cee5c09 |     
  sparc64    |   xserver_xorg-server-21.1.7   | NOK | http://autobuild.buildroot.net/results/d9a036a766f7ce0e645c17459d1d9c20bdf80f91 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/cramfs/cramfs.mk:46: /ho... | 1 
              host-rust-1.67.0 | 1 
                  linux-6.1.14 | 1 
                   luvi-2.13.0 | 1 
            ocf-linux-20171122 | 1 
                  reaver-1.6.6 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/6e6cdf60342c151caffbc7cea91299427cd2232e |     
  sparc64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/424521775a9e0cbeb5c029c6c66ddf69ab74fd17 |     
  aarch64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/dbb0f5d62ca99e3923d4bdd061336681b002b5cd | ORPH
   mipsel    |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/fa2254d5c8ccd6afac1235fb0cac4bcf7906caf8 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b3cbcab54c2da557ff2dab7ab36b0a5f29c3eef1 | ORPH
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/4dee4bb06bb0188d52e703095d0d2f1e76c613a4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
