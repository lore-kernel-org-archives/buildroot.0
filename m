Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E969C7EE23
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 04:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D240605A7;
	Wed,  7 Jun 2023 04:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D240605A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prBf22TERwFo; Wed,  7 Jun 2023 04:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4123960888;
	Wed,  7 Jun 2023 04:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4123960888
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 613B41BF3FF
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 04:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AE6640352
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 04:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AE6640352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGqun8mH7a48 for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 04:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E43140332
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E43140332
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 04:38:22 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01409240008
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 04:38:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 07 Jun 2023 04:38:19 -0000
Message-Id: <20230607043825.3AE6640352@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686112700; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sHtPu0x2b+wv/xvGABUy6TIxiISkHHDGFHzwDVRoIGQ=;
 b=R8jITUbm5J0ufok/dWE0chbZt+4fhQsujseHAQ77LHKQYj65k0YqUsQIBD5YPQgsdSzada
 fi7kp6uhZqB6m7gk2k+wCE2Hwi1fVAfTZCM7NU9C3sJUgZfjGK5R8EdKVXwT64EQiSxulM
 OqA3WIhtL0PxUliuxoJLX22dQRIjWz7YByvAwIJ9/T9aHudw/uR7NV65Q+y7G9Mj1Hex6U
 c2EchyxTgn2TAnw7qEjZJQ9n2frn6HGRGStpABNPsXmLsbjGytp2p8CKirNKaFstkmowJF
 rdI7rM9vOQ0Ehj42Dl+mndEYz8sVUJIDkahkRpuUsC9aHlT55tfWLO6LD7oVKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R8jITUbm
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-06
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

Autobuild statistics for 2023-06-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  | 10  |  0  | 19  |
    master   | 77  | 59  |  1  | 137 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.74.0 | 4 
host-heimdal-f4faaeaba371ff... | 4 
           at-spi2-core-2.48.2 | 2 
                 dhcpcd-10.0.1 | 2 
        edk2-edk2-stable202208 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
              host-rust-1.68.2 | 2 
                   linux-6.3.5 | 2 
                     php-8.2.6 | 2 
             stress-ng-0.15.07 | 2 
                 agentpp-4.6.0 | 1 
                 dhcp-4.4.3-P1 | 1 
              dropbear-2022.83 | 1 
                    dust-0.8.1 | 1 
                elfutils-0.186 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-12.3.0 | 1 
                host-go-1.19.9 | 1 
igh-ethercat-2e2cef61318953... | 1 
                       kmod-30 | 1 
                 lapack-3.10.1 | 1 
               libdeflate-1.15 | 1 
               libglib2-2.76.1 | 1 
               libsigsegv-2.14 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20230127 | 1 
          lttng-modules-2.13.7 | 1 
                    mpv-0.35.1 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
       python-stack-data-0.6.2 | 1 
                  reaver-1.6.6 | 1 
               syslog-ng-4.1.1 | 1 
                   trinity-1.9 | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8a920d439ad56f116046e653c90bd44f2db85bfb |     
    or1k     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/bff487831471c8cce1d02d24eb2f4d14838d171e |     
  riscv32    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/0b9ef4246341eed6b81f2c082d882a9b20db2ed1 |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/be1a28669595ab9a8bf844f122b1a1fa67f55c6f | ORPH
    arm      |         dhcpcd-10.0.1          | NOK | http://autobuild.buildroot.net/results/218ffd3b1b1f9d99fde706154c9f9d2e1ddd7fda |     
    arm      |         dhcpcd-10.0.1          | NOK | http://autobuild.buildroot.net/results/177319b8d288dde9fee4fdb9a5a12e6735caa4c1 |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/d50475c40265b7e8fa12ebd8738bbdd3d76e23f8 |     
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/b6fac7452a38d0c409ee4e7e66d7f02e09ca5dd9 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/2cd74679d42e35e0662569f8024ce9776d8bc9fa |     
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/a827e7a50f1f1547378831375bc305f39875f01b |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/995cfa46ed82af3cf9373d31e42a036b85190719 | ORPH
  sparc64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/5305a42721e5dadc3e11a569d8f0c2a5e2446e06 |     
    arm      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a5c451e591958f99e4f0651ac60d295c8ea0fe4e |     
  riscv32    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/1ffd9c16a09d39c702cd79ff9fcb76d97b48176e |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/63afa5d19327086905a3379492bf5f2cdc511223 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/348e47bdb9f4c0f71bd2f1d53f2ec13d212762e4 |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/5b3fa13f19a42633c78691963d76fe35fc2ffc0b |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/573ae382042447f888d621f9c2d46b985537c95b | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d13028245c8d5500ae8e6cc300d3ff3f5e7faf48 |     
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/7127c66a9ec2695cc0665f194c60aa39ec9dab09 | ORPH
powerpc64le  |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/715eb36a2b499f061bf6384fee47e597b493bffa | ORPH
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/5d30e16982de9384d431d6e01193b0e1126eaaa0 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/c757f5a354dd0adf2f17d2214292b0757904d4b4 | ORPH
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a4f5d4aba858b51dacaedc49c4ab790441979b67 |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/13575166e6dec075d57af98f92db7a6198096e67 |     
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/7416359d5a208b838a90a597d0c4bd80d59cf309 |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/e4d38f864fb00c60abf98cf3368ff43d98333629 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d24c75ad5e05a586f5a5403a681824cf9641d2ac | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/168307cecbb6f2b535948822510a3d0bd2f297ec | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/57ae13f903e6e60d2fddd228232cc02c8d6bb087 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f8020e8773f08c9ab943ad95742819fa7a9113de | ORPH
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/4089ac3dc36580684ce130cb95169bf73d580703 |     
    i686     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/d11460ca0755e5924aeb5196cfdbb1fd72e8870f |     
 powerpc64   | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/997e6ba12ac72d3487617fac338c17c09e705799 |     
 aarch64_be  |            kmod-30             | NOK | http://autobuild.buildroot.net/results/8100cb6d4c97955bc04e34dfef8c39a1e6236123 |     
   sh4aeb    |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/9348b22015496d54813ba0603c6487269e060ecc |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/0103d64a4a6a9b0a708bfb77bf1714edc7acc714 |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f98a9ef6caa2123560d59c8f6e27d68bb48cda05 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/daef0905c5e62a7c327cfd893118415a7e3f14ca |     
   mipsel    |          linux-6.3.5           | NOK | http://autobuild.buildroot.net/results/a87fabe047971bd72b6ec900a66b8c0f132c8db2 | ORPH
    mips     |          linux-6.3.5           | NOK | http://autobuild.buildroot.net/results/36459846a2b5488c493a19146877068d0e945126 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/df06e3e0aa966871ad5df38af95a3561db523164 |     
    i686     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/18e57a39f6b856b14fd5b9fda9f70f751e692965 |     
    or1k     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/b033d749184004948468a9e1ed73a37908154e17 |     
powerpc64le  |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/865ec124b190b167d328f47910acd29e8b1fcb7c |     
  sparc64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/5a09ac0e64c9fdcf0bccb50f8ef4cb0d8d94208d |     
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ac9b3f088c7e05d28b7ef6a13e26bbd80d43ddd8 | ORPH
 microblaze  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0ed3bfd58fd5a85116f4e056e32dfc7b2c90fae9 | ORPH
microblazeel |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/92e86d5d859829e89b3f1d72a403c6165ba6ad77 |     
  sparc64    |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/316451459139e250ba2d0c7b554606fd97eebd9a |     
powerpc64le  |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/bebc924d46f61b42bd8578c15618e083ef345d1a |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/99d9d9f747b1978c6004578083d7b2cba64e3e85 |     
 microblaze  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/8228d8aadbe8f2657ade301b77ce117fc4c8529c |     
   xtensa    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/a8203e91c2ce988a59cad8f3a8e7548581fa0b0f |     
   nios2     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/5996d083a78ea5ec5380c7289684df9d358eb024 |     
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/e0d5e461e989972e0a471691b6a757fc7b56a43c | ORPH
   mipsel    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/79c25dd476f9c8609bca17ab5830773aa378a22a | ORPH
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/ff5b72e3439d1e6e697a40690da8fd3e6158e208 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4224e680aef24fe2fae7ac6917c763beaaa15f9e |     
   xtensa    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/0502b05020de57e4910125c699c4264047187c51 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
       freeradius-client-1.1.7 | 1 
           heirloom-mailx-12.5 | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.67.1 | 1 
                libselinux-3.3 | 1 
          linux-5.10.162-cip24 | 1 
                    olsr-0.9.8 | 1 
               perl-clone-0.46 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e6789ce724b0835c25f91e622fbcc5cb29408c5c |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/ef6b14010110feec238016203cfee923e15d72a7 |     
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/856335121b969c962301ae487ac3abee1512a804 |     
    arm      |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/d6211c7718f10b792e31c5b891660013515cbecc |     
    arm      |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/4eaf998c2ea556b583c5c9a0a1fc11633d23b682 |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/7978a8f0ef9b8b1bd0d8f356dd7f947549ff40cd |     
    arm      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2427cab5862b26590db03b3353ec0c96ed0003cb | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fb4be43ec893c18d196ac6240e2ea54cecfd753a | ORPH
   arceb     |        perl-clone-0.46         | NOK | http://autobuild.buildroot.net/results/bec9fd1564e1741beffa5f2d415736383b38a5dd |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/821f1333aab865df9a0246822f6af60a088e0217 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
