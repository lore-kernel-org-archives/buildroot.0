Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171D4E7735A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 05:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 611C241CFF;
	Sat, 30 Sep 2023 05:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 611C241CFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQwc_v0q_vSb; Sat, 30 Sep 2023 05:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E25641CF9;
	Sat, 30 Sep 2023 05:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E25641CF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1DA1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 05:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 031E460F68
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 05:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 031E460F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4iOC73vRx-DO for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 05:35:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0156560F42
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 05:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0156560F42
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CD62240002
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 05:35:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 05:35:19 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230930053525.031E460F68@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1696052120; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UyboxLpAglne3a8wZeWOqiZO53bhVNn71efvAZhm8gw=;
 b=SAcr0wlNO2nfN7j29ks/zVMlLfBq3cXbrx/cWnPkoF05LtdwX2FGEtebSgJK4PBKcbVwXw
 xOxrwylLTS848YdhRTPaUJbxlchqfi3myHG7KVXLSeFZJHrWaNfmL2FXJ3h0cOCxBw8DWq
 tyvcd+b2uhbBLGjQxMmK4N9q14VR2qra1o6p/dJnsuNmg2TYyYPfBVJnsnxezj42Hxeb4N
 65HyNwJFAOrjjODDzdOhlul3am6ABGmn/B2VOHUWzmqcZSDW6tsGV6ZSB58JAKorvY9Umo
 mU96ZEznZi+FWjKmu9NjTrWMuUTHwXix6M1DzfRfAhyKtFtNnBPeKq1yH7fyHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SAcr0wlN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-29
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

Autobuild statistics for 2023-09-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 10  |  7  |  0  | 17  |
  2023.08.x  | 12  | 15  |  1  | 28  |
    master   | 84  | 89  |  0  | 173 |

Classification of failures by reason for master
-----------------------------------------------

               alsa-lib-1.2.10 | 9 
                       unknown | 7 
package/putty/putty.mk:22: ... | 6 
                 gnuplot-5.4.9 | 5 
                   bird-2.0.12 | 3 
                    brltty-6.5 | 3 
              host-rust-1.71.1 | 3 
                   linux-6.5.5 | 3 
             alsa-utils-1.2.10 | 2 
                 dhcp-4.4.3-P1 | 2 
                elfutils-0.189 | 2 
  gobject-introspection-1.76.1 | 2 
                host-go-1.21.1 | 2 
        ltp-testsuite-20230127 | 2 
               mariadb-10.11.4 | 2 
                    proj-8.1.1 | 2 
             strongswan-5.9.11 | 2 
                   aoetools-37 | 1 
               apcupsd-3.14.14 | 1 
                   audit-3.1.1 | 1 
                    bat-0.23.0 | 1 
              containerd-1.7.6 | 1 
          cryptodev-linux-1.13 | 1 
                 dc3dd-7.2.641 | 1 
             docker-cli-24.0.6 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                gnu-efi-3.0.15 | 1 
google-breakpad-c85eb4a59b6... | 1 
host-go-bootstrap-stage2-1.... | 1 
     host-moby-buildkit-0.11.6 | 1 
        host-sentry-cli-2.20.3 | 1 
                  kexec-2.0.27 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.5.3 | 1 
              memcached-1.6.21 | 1 
mmc-utils-613495ecaca97a19f... | 1 
         openfpgaloader-0.10.0 | 1 
                 openssh-9.4p1 | 1 
                    php-8.2.10 | 1 
                     squid-6.2 | 1 
                   systemd-254 | 1 
                 uclibc-1.0.44 | 1 
             util-linux-2.39.2 | 1 
        util-linux-libs-2.39.2 | 1 
               xwayland-23.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/5f6b70ea72dfec1c374218408c076724a42161fc |     
   mipsel    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/c363c69fb36275972d025e08a081b6b5b29b39a5 |     
    i686     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/17b4a695e8d535b3f233812e83caca0b843591bb |     
 aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/bd831384d6bfa6ec1990d04476736abf7b2e5c6e |     
    i686     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/c213ec98fd95cd5c13fbe21739ea604c73bf82b6 |     
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b654eea38facee69428c96348acd15262493983c |     
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/23bdbbb7410c9725440b577ce8f0b8f74a5fa0ae |     
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/718b51bd907693e19118ee6ef895be00d57a45e4 |     
   sh4eb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/d318ee16505a19fa194d2a4d2cf921e0431d7c6e |     
  powerpc    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/c66bad73eefcee5c91b1d707e148d18605c9b775 |     
   x86_64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/fe45b7932968e4835b57f6eed87fe34f15e63f4d |     
   mips64    |          aoetools-37           | NOK | http://autobuild.buildroot.net/results/cdf3154ab53fe04c3abe21c09ac5cf5dae1dfe02 |     
    mips     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7f87d266093648220b56d289f411824ca8852b79 |     
  aarch64    |          audit-3.1.1           | NOK | http://autobuild.buildroot.net/results/3214dac93015280981c9b47e5e8a0d1798bfc97c |     
   mipsel    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/9981107e116093ad01e8b2f518e319a6fc1f55b5 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2b60432b147b19241de588dd848a5fd5ced4991b |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9c9f5333c025fa3266dbfcb99ec51549aecc115a |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/f64f18def96e2db8f2d99f9936b7769ab0297067 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/c07987178f47b50a833e627715776c81b7f4b584 |     
   x86_64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/669cf15d6439e17a73e3b053b39fac879590d0a6 |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/46746bae4bf3fb893337cc6a65ea040b76ce1d05 |     
    i486     |        containerd-1.7.6        | NOK | http://autobuild.buildroot.net/results/6bd1f84567b55fa325d7874010a49d9344b7b09e |     
 powerpc64   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/d6d939d32572ebefcabdc389c994bca6cd98cd9a | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a976c1939841701762469b1e4bbd7000830c75c9 | ORPH
    sh4a     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/fab44f7e8b54484f80424925e706e4e4f6a20e5d | ORPH
   sh4aeb    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/f7b276ed6fd4a6b46fe11aaf537fcd138839710e | ORPH
   x86_64    |       docker-cli-24.0.6        | NOK | http://autobuild.buildroot.net/results/f614c221cc0d20a0fd6bc61879b90253cf481ac0 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e375327278be8414a5b7a615d23988b99a221c8f | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0ce68753bd23588c68fc318733fdd0bc422c0ea9 | ORPH
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/47a800b050ddbe7bfbbf920b7d0f813d629ee733 | ORPH
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/30dbd71eb8247d06e39d1ea7d8fed3f273c5c165 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/d5938edcf50ebb7fdcec148d73f402845079779d |     
  riscv64    |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/16d032a46b995fbac5cf8731c722e9c9ef692687 |     
   sh4aeb    |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/666883521cf9fe67a4e0df61a213c03d22d5940d |     
 powerpc64   |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/74b43a40587539ad45093e47612fa3deed7087b5 |     
   mipsel    |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/2b654b78882b2f8cd95e89666fcedc7eff1df4b3 |     
    m68k     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/6ba57e83988aff76068f1c49ea624e256dc9a364 |     
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/46eadf101dea79f6a6d8e27742c4628d682141c7 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/601fea925fbef1d11f504b4dcd4b689dc84f6048 | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/06abb5c932f45e6021bd7bac4d88fceed4be33b2 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/4d0489a1a36f62dcbb9b5bf0a012a801ec156fdc |     
  aarch64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/9c6c4c4ab1a10c4eb34ac596113371fda506169a |     
  riscv64    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/c507ac15eb3377bc6e630c4aca124c70abaff74f |     
   x86_64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/470128451101404fdd92f68fe1a68c0610e8afd4 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/10dd7004da31600761dd404aa019c04028555df9 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/05bc6c52a58207b23c6fb81af10dc4f422c4eff4 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/5639434eb7d5cc17f4bc2e1ffacbf425fef7060b |     
    i686     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/bc27522aa34a6c775877f33b0443d723bbb3e9b5 |     
    arm      |          kexec-2.0.27          | NOK | http://autobuild.buildroot.net/results/640bb53f39321e82bcef252bfac401937dbec9aa |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e0d37a64e7a7d209339adbd33ee0e6fdd3f796b1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b615a4a07103175941725a06e178b2dd5a0e1c16 |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/c351058874066256d5a265dc5bba84828be8ed6f | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e730f5c12cdcb032b4568b09b8c5d1d07a348f14 | ORPH
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/7afbb21fd898098c346bbf96abb3d5b5927ac089 | ORPH
    arc      |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/0b064dee99c142e08439dea46ce031e5d9a72a7d | ORPH
 microblaze  |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/cedd40b382b1767516546b863e8dc86f6e535fc2 | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/7863c9e3392cfd3d7b89b4b6155900a5258f54d4 | ORPH
powerpc64le  |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/ef7e6283cabe197c13455eea046e290afd61fc79 |     
    i686     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/47224676048a29d2e1ca4ea9e82a47ef7daffd68 |     
    or1k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/6fb5447d17dc88c14f5e99c2121a6df205deeb44 | ORPH
powerpc64le  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/40d1361615657292e97f5a12323e10b74e374439 | ORPH
    arc      |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/65f56c8264e2f26b131f3187be5492c08a52af29 | ORPH
    i686     | mmc-utils-613495ecaca97a19f... | NOK | http://autobuild.buildroot.net/results/8f51db5c63eedab1bbc540439a460e67de0c2d2f |     
   nios2     |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/a9d00fa2387cad15a321678e83e8448e4b506ea0 |     
  sparc64    |         openssh-9.4p1          | NOK | http://autobuild.buildroot.net/results/43f788a4fc93929705dd743dfc7e79e255b065f2 | ORPH
 aarch64_be  | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/c97eb715e30fdf46b86f28345af27ac9fccc631e |     
    i686     | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/11d9075fd4df1886cae26e7e2f7c12bc94a62c8b |     
   nios2     | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/48d39dcbf99acc24e7a5e6790f54785d7c49e9f1 |     
   s390x     | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/900b3fe8d4bf029c6bca6ca63c6e093e42cc1072 |     
   mips64    | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/2024310e9f60d3ec01e7ab69ef2aa06a5ac53dd9 |     
  riscv64    | package/putty/putty.mk:22: ... | NOK | http://autobuild.buildroot.net/results/82c1c8c4046ed4ecaab691c27773543997891f29 |     
   sh4eb     |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/465c89ce120233ba99361bd3135b6c7503760324 |     
  mips64el   |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/b2fc1805beb09c9ede1f37aa1809f5171b472e99 |     
    mips     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/ec21294585d8a7ac9171e0dfed90e6c32e9885ab |     
  aarch64    |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/e7f60e84fa123d53d45b9217f74d0270883987f1 | ORPH
microblazeel |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/848d9a8fa490f15bf78aaef2f452d02f09534d03 |     
    arm      |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/7d12eb1f75fdc37c9deb8bacf7a1f57207773306 |     
   nios2     |          systemd-254           | NOK | http://autobuild.buildroot.net/results/43e8c65573acbfad8eb527615a061babaca9eb6d |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/3589bd4e10a36da79bfc55e76c84f9ca27bf8dad |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e60d4defd1f08f33d8907608d8ea46e59ded3f2c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b471dc81ac1ab62313b52292828d54162d01411c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/0789bdff6a1cfb685240c6657c5b71965a076ee6 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/eca1802c0cbdec986f0c2a7d20c96a5a1a4715fd |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/39e2a4288799282e2dd3ba3e0ed8548f0cc62fc6 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/4cb51f4ce43f1dfc4d1a91588fec6b3e520a6428 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2201764ba59c111049734050aec3486817673707 |     
    arc      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/8b85c1d06da886bc4f1f9f999d119d7afed4ff70 | ORPH
   nios2     |     util-linux-libs-2.39.2     | NOK | http://autobuild.buildroot.net/results/fabdbadbf9e9dbbe8b5c3c7f7c6466864872632f | ORPH
   armeb     |        xwayland-23.1.1         | NOK | http://autobuild.buildroot.net/results/1baf5ea816858f072c34d1f87a07c7a9029544c6 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               libglib2-2.72.3 | 2 
                flannel-0.14.0 | 1 
       host-gcc-initial-11.4.0 | 1 
               host-runc-1.1.7 | 1 
                  linux-6.1.51 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/934a37dc5d02beb809cd11da83b099819fa596f2 |     
  powerpc    |    host-gcc-initial-11.4.0     | NOK | http://autobuild.buildroot.net/results/b5460146862fd2698ede84723646896e42c234ca |     
   xtensa    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/a614aa09ab5153bce3790594bcba710a6dbfede1 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/786945984d0a42307751f98afd6e96beabeaefc2 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ffef194c85de8502c920c3e8a3ab22cb7348c024 |     
   arceb     |          linux-6.1.51          | NOK | http://autobuild.buildroot.net/results/01068e0180a9c8acef977dcbabe0aae95619a248 | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/eb2bf1a8215dc3d8a916342af13bbbdee840b6c0 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
                  linux-6.4.14 | 2 
                       unknown | 2 
                    bat-0.23.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  gamin-0.1.10 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  gensio-2.5.5 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
           libatomic_ops-7.8.0 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/3929bb0b586985e0186729fe3ab6a48f36d54e70 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/47fbb062554bb906e91b179f871439e15c6a2165 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/91512af1fa5ecb6fd9ad540cbed7230de5565959 |     
   x86_64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dc34b5819d856a5ca0f65cb1c153737af7d23ebf | ORPH
   sparc     |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/8241473bd9436ad1d408d574037e7c523f471774 | ORPH
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/4b5ce8463e791df2f02ac42a4f78295dff917f8d | ORPH
   nios2     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/4ab06b42af1008e0195b35a8d590cb2feca7bdc0 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/b107b8494435748d8a695d3270265cc845a6ba91 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/6d0ee2cb5820098ca60694e96c66ca3f88733c2c |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/947aeb5f6eecab2684093ae8a815292352191932 |     
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d4fd3b563c27c6a3845ea755783fcc2be5f7b413 | ORPH
  riscv64    |      libatomic_ops-7.8.0       | NOK | http://autobuild.buildroot.net/results/dd906142bd6d1e64cc4a09362742d037826a1ba4 | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/e2065831e977c7cace2a54cec1dea830d3a875f5 | ORPH
 powerpc64   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/6965ece4a7fd375dbbf878bd906cd317f144df1c | ORPH
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/f0737af8b8458afee288dbe0e3ae8104e0f77594 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/d0cb4d14191077ae27aefe40835fb1ca788aec25 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
