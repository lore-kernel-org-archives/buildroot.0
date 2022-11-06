Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB160C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 07:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A1960B45;
	Sun,  6 Nov 2022 07:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A1960B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pU6RlQjgA5fH; Sun,  6 Nov 2022 07:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC3060B38;
	Sun,  6 Nov 2022 07:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FC3060B38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 220481BF2F2
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 07:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFBD4400C8
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 07:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFBD4400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kbS721nJr9u for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 07:34:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86EE240529
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86EE240529
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 07:34:17 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A04C2FF812
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 07:34:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 06 Nov 2022 07:34:14 -0000
Message-Id: <20221106073420.EFBD4400C8@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1667720054; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EnRgjUASSCdfl6U+YXDLg/rX59wCiuZFaOXpkehM6KY=;
 b=X0ry6+BTIz/EjyhJucM9W8aX3XpTDR6F+1m6oFbCzBpOHz97/4Frq7pW6qb3mmiIFqz3k0
 K5Q2ubrFP5z3dXKcXty/vCqgSO2xZ3QozW9SZkadTLHObVsnwvNUOnEtfmZb+vl5Bl5yYR
 mWFv9UDCVXK+72ryYUxpXVIp6XYO8/jwKiraaHzVYZO3vPp9iW922DNKYoxJ7G33yvRcEc
 dneELBZaFNy0apj8Z4eSAlnVWg2LxvaFeuNyn1h8bDsY0Y4vmZcBbPx5mCluWW5Edr6Gjk
 fOin917RujR+GkrB7/FZF6TpsI80Z/nzkRMHRJZdn/0LFCsTlLsCeBJjX4tZvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X0ry6+BT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-05
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

Autobuild statistics for 2022-11-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  0  |  1  |  1  |  2  |
  2022.08.x  | 14  | 17  |  0  | 31  |
    master   | 159 | 265 |  1  | 425 |
     next    | 14  | 20  |  0  | 34  |

Classification of failures by reason for master
-----------------------------------------------

          imagemagick-7.1.0-51 | 20
         s6-linux-init-1.0.6.3 | 20
                   libnss-3.84 | 17
            host-binutils-2.38 | 11
                      xz-5.2.7 | 10
glibc-2.36-66-ga1dc0be03c9d... | 9 
  gobject-introspection-1.72.0 | 6 
              host-pahole-1.24 | 6 
              host-rust-1.64.0 | 6 
                    lxc-4.0.12 | 6 
                  gensio-2.5.5 | 5 
                host-go-1.19.3 | 5 
               libglib2-2.72.3 | 5 
                     efivar-38 | 4 
            host-binutils-2.39 | 4 
                   linux-6.0.1 | 4 
                   perl-5.34.1 | 4 
                       unknown | 4 
                      crun-1.5 | 3 
                     gmp-6.2.1 | 3 
           python-numpy-1.23.4 | 3 
                    sdl-1.2.15 | 3 
                   bdwgc-8.2.2 | 2 
                  boost-1.80.0 | 2 
             dahdi-linux-3.2.0 | 2 
                 dash-0.5.11.5 | 2 
                 dmalloc-5.6.5 | 2 
        edk2-edk2-stable202102 | 2 
                elfutils-0.186 | 2 
                gerbera-1.10.0 | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-12.2.0 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.45 | 2 
                libkcapi-1.4.0 | 2 
                linuxptp-3.1.1 | 2 
              memcached-1.6.16 | 2 
                    musl-1.2.3 | 2 
              open62541-v1.3.3 | 2 
    python-cryptography-38.0.1 | 2 
toolchain-external-codescap... | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                alsa-lib-1.2.8 | 1 
                 apitrace-10.0 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2020.09-release | 1 
                  botan-2.19.2 | 1 
                  cairo-1.16.0 | 1 
             cni-plugins-1.1.1 | 1 
           crucible-2022.05.25 | 1 
                 dhcp-4.4.3-P1 | 1 
              dieharder-3.31.1 | 1 
           docker-cli-20.10.19 | 1 
              dovecot-2.3.19.1 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
                    flac-1.4.2 | 1 
                   flann-1.9.2 | 1 
             flare-engine-1.12 | 1 
             fontconfig-2.13.1 | 1 
               freeipmi-1.6.10 | 1 
       freeradius-client-1.1.7 | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
         gobject-introspection | 1 
                       gsl-2.6 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                       kmod-30 | 1 
               libcap-ng-0.8.3 | 1 
               libdcadec-0.2.0 | 1 
               libdeflate-1.12 | 1 
                libmad-0.15.1b | 1 
               libmdbx-0.11.12 | 1 
                 libsigc-3.2.0 | 1 
              libuhttpd-3.14.1 | 1 
          linux-5.10.145-cip17 | 1 
                   linux-tools | 1 
              liquid-dsp-1.4.0 | 1 
             lirc-tools-0.10.2 | 1 
               mariadb-10.3.36 | 1 
                  mender-3.4.0 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20171122 | 1 
               openpgm-5-3-128 | 1 
                   opensbi-0.9 | 1 
               owl-linux-1.0.7 | 1 
package/qt6/qt6base/qt6base... | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
              rsyslog-8.2204.1 | 1 
        s6-linux-utils-2.6.0.0 | 1 
              skalibs-2.12.0.1 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.2 | 1 
                xenomai-3.0.10 | 1 
                  xxhash-0.8.1 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/eec0f6fe766b97932f9fd846067b420a7a9df748 |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/d73f30467868f8a800c66777d9ff8e5969dd5d6e |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/d1a92bf4a282e51faa486b2b28828a6a49fae10a |     
    i686     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/3aeea378ad4ede6d4f2b88042f710cce6a9ff77c |     
  riscv64    |          bdwgc-8.2.2           | NOK | http://autobuild.buildroot.net/results/d593a6148c5bc1b83cb26ca6a26f0bc1d461f69e |     
  riscv64    |          bdwgc-8.2.2           | NOK | http://autobuild.buildroot.net/results/2b9924cb8c36a75e1ca7aefe83e95dc11c10ded6 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/b3d8ad327de68332c742e0afdf337dc7c80157d6 | ORPH
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/55c491380f5defc97e45f009e9cd998350d84f7f |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/06362e536c75ea553a1687993f9ab25ed9e1db26 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/1f28a5db8646bcf320e16196316c725c6c5cb78a |     
    m68k     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/19d4aa575b7c6e11a0bda781687b4c2234dee787 | ORPH
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/9ae9232a7eacc8dd9fc490eb942f2a35b677945f |     
powerpc64le  |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/3d9571ed48578bcebcf044940d45d50a41e1e80d |     
powerpc64le  |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/9fed0a260098a30c9cac1ebe22c4f7cfb4e85479 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/de66c4dafce2d9a3d30ca0f87604c85f0b05cff1 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/87f831907597ab8809f7cd2b421b26a04a863013 |     
    sh4a     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6918b6d87e978960c219c4c0f705a82ec9d9cc0f |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/09838d2d86adb4ef0c2e7a7a4496b5dd4426b1c3 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/01144ac7ad04ac584d926b72c672cc7eb94d87f5 |     
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ce628e3abad9cfb9ae543529611fbdf7b31e765f | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1a1a103fe06b4af6343c2152f696435904cfa697 | ORPH
   sh4aeb    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/87db2586b35259ea6bf758102768dd80ed65445e | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/829445d70babd498d2674880baa3d467e8775bbc |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/6a1d5559f6138506d6dbe51bf786846f0116f105 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/96ca5bf421166a2f2b35cd63fd0c9de3a4421296 | ORPH
   x86_64    |      docker-cli-20.10.19       | NOK | http://autobuild.buildroot.net/results/1fa6a6c539db0ca36df5143ee2b2da3187079c6c |     
   mips64    |        dovecot-2.3.19.1        | NOK | http://autobuild.buildroot.net/results/6e30f9be8798162666275be842917b5fcf106d9c |     
    i586     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/e1dc17abf04f53d6218fd9da6cb442f62694a9de |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/55ed7e3a05baf4c5619f24c95aaf80728b31e209 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/4de664bd2b3956c9de63da5fedcb269469f8f7ff |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a008254c2eae168273976e9828f977977a1ab586 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/af8ce4328ee0fd62d26cf78c62042e2a93192ab8 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f6393f1aaff4cb1fb127268227512275146fcd6a |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/64efc12ffb7489a4f6f38f68cd1909f4f392ee49 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b13d982e4e6515ec581455852985b49e26e609c5 | ORPH
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/c77c3f3c6b9a0cc3b01ffd2701032c814ecb295f |     
    arc      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/fdc6782d4813b2c051c26effb35689c34428808f |     
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/b39e2beb3c2452f85830a87f075b7b266a153d7c |     
  mips64el   |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/91c443a170e73f26ea8ed778a9ffb4af238e1e6c |     
   mipsel    |       flare-engine-1.12        | NOK | http://autobuild.buildroot.net/results/ef845f7270aaaad8991f39a63b63e10ec70be847 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/8a9c716721af937c90a8b6d9e0e75d58d0dbec2e | ORPH
 powerpc64   |        freeipmi-1.6.10         | NOK | http://autobuild.buildroot.net/results/42c83f2838c65dbf9a5d1928564317bbce554f6e |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/f392358bcdc9fb4057dfd7b94255e4a1a9888d18 |     
    i686     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/19e3a7258c3333c04138a97e991d3bdeb0362c7e |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f320003fe43bb158bfa62c8e5f6cd3504a2665c5 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7f99ed8cee061f0d252d1272eb11a89386d5d58e |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/af655b7e0e2dcf33413be2bf411702857d3be641 |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/66720409fe3751fcf1cc37f27f608586c93c2658 |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/803c5bcfcc0c6a2a480fb770003878ba87983857 |     
    arm      |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/d653a2c07df360db7600a9eb51ffc382b1bb9016 |     
    arm      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/184a72171e5ce927eebe76c4031a9f9aa8c4aee4 |     
    i686     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/04fbb7b6f6685205516c271a77ff834fc49c3b78 |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/998aca68fc53ffb305780d193611eccfdb7aa519 |     
microblazeel |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/09ead8c6e12e86ae239b97b5ddceb15c2783a63a |     
 microblaze  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/a902edafd635700e56695eda7b4f76651eebe318 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/4ba72b08f771b5056943b81dcc731cd4276e44a6 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0db4939971e56ddc27ca50b182e4bcc37f82d506 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/407e8a0562f3717c3aa36f3ed83e9254cd24bf8c |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9a814bcd4ec06fc2cbef895d4b1604f984c0779b |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a24f6433abea03850c23a7ed266c890e63132094 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8170863fbb7b6cd0b3347f93f8d0081901293185 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/335c0919102a216abf5ab62976182398e7a5fd60 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ff733f645999365ef7edf8446031f9ab29b7f0e3 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/965172a514cff2ab395319b59317dfd04715cb41 |     
    sh4      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c7305bf3b5721195d4f04592139bc4e097c3e81b |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a0a2c6d6088040995fe461fe5b7aed4ba6e4a6a3 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/bc18cd35f3d6280e8103dde07927791979b4f38e | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/a46829f921b6fa8a84ffeab0a21d4f770ca2b456 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/2a20492f123bb573e7240746e0783a615da12a49 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3dc3a0602a9e09f061098a3f92143923fab1f1cf |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2df97877e9e6b05efb206af4a2af6c523bc0f7b5 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ae7db6b8a29c5dd00468ba4bda316377101149f1 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/df78965c992e5c1eb84eb9654332da6a0c648795 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/490ce8300f2d66f5a0ed6db01298c13b42d3ddce | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c1147698150fce721f5dd02d5bbd584e001111b7 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/34f01fca77bf28099b40bfd5e56770e7b8e3ec04 | ORPH
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854 | ORPH
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ad2eda687d9b8a174ca1dd811fc4d2ffd5c54910 |     
    arc      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/97cf3f850516bd935b6216a7cd2c1cf2b94c3a15 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/39219db048852e7a1ca6d12c4447cd7076a17d08 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7552922c91587d14e2a9e290983dcfa78b0e6440 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bcd6545c46aaecd1d2840b0d2108a30b99b4d378 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1fc6c0e2e3b6a7817362bca9c55c872ab1a826c5 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/da19486de3e1c77a852e9a3a32cbcfd0a99dfeac |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/650c53d397acfacd7f343060db08dd563b80263c |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f7c0a923dbe6830f21792d4a50899e42750e9b61 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ab9521be664445c8cd210d68fc64b5d9b96d6f48 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/78ab3f7476bce4605c13ca015d7e9a619e5f9e5d |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/26dcb1b5c7687b35b0e65a54d560a7799a06f311 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f6f6736234d9b6a3b19d3bf6d17ae234bf442a5d |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/07287c2fac55ce4eae7d605a7f22da6c83d6a330 |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/55b31578d363c831b6e0fde8e4cb5102a79fdd6c |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/11402bafb9009a95155e7e8773d2982fb82b1f8c |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3f41bed2f4463232113df340243a4d4cb708639e |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/488540544fb7e6d7460caafffdab9427a59d63bc |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/25d267b3380c41c640fd8e291cd593ef28efe225 |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/b1a01e418eeb12543a4f4e66fe45eb30b3c82287 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/bd0f89ea94bf04b3092d3f6c04bd0934b389fc67 | ORPH
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b55605d1bd78a7dbe520f652b05ef117aa4362fd |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/acbdac4afde26f2cd3b8eb3d59583d37af44fec1 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/0e26d1e50bcb0973db38dfaaff991a640cfda17d |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b6ca79b8df0e07ec46243213d2e3ca686bdb36d5 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/4d71b5e5ec1584856d9cb0f480823e2ff2606cbe |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/086d624686a6b989323eb47f109b3d1238cd141c |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f9c471cbb49c98a065819154b0a7f153abd5f873 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/af8548da8c772afdfb2b498f79780d66b84bc59e |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/131c7e3bdb45632ebc7f346426106c57f45010f4 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c346987b21d371221c7b0563b087c41794c3b28c |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4a15dbb1debe8fb3b7b57dc3d5b1a4233c8edc6d |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c92ad2dd31e91baa574aba2bcd8c3b084fb10919 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/25c58c25649f4c1805022db6769a760623c98f3f |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/efada58f55d56b528107ebd49723438b3619d320 |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/570e1af28ca414e70dc8b443ba3daecd54eb7ad6 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d36a43cd2d81a6e38231daf9b411214b03262174 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/007e975919bf2095a1834b1e107711a77fda6b5b |     
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5a7b516970ea04f63b3097379c6903de5e45f37b | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/a6745fb8b6e15810cd6667b083a2264985fd030f | ORPH
    m68k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c65e34c686a507d12f1bd3529480a14e9a501441 | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/31e024e745a2abeb018bc5cc5127419f516fd4df | ORPH
 powerpc64   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/a1572eb01b9ebc553f53a7cd8695a882bcf90676 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/10da6e158e2201b4445d565e6b382a1cf3be695c | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/89a2cf45cb0fd2cef312d4c4bee700dec5361950 | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ff78d4069f7623b4ad9c84a639e65d6afcd54540 | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/96840ecf5fb4ba2bfdb69773bacaf55bdf9b5209 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/a1742f5a0744e49698d9e8e166947a6ab790d384 | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/6a10ff81d1551871e9275e5178e437eec8b65dd3 | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/243a0198cbf46c9e8499c1d7a73ae99da940c659 | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/68af21565e452c0fd5c143810c388293e6badb54 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/33713d9ddc572ef60e3c0036deadbc8e1362874f | ORPH
    or1k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5cf7bcec93473f16465ed92002269435816c24f4 | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/cdb18c0d830d262f1f0c77c122fdb84b3bbaf5d4 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/794e6eefa5544906ee5ffb720a191bbf687c8c46 | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5863cfda6e644acc3bebfe80a5d63f06f2a65214 | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d2c0ab701241d4d9280767b10733f69615922cf8 | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/a6fd55ee1568397c0b4a5f5c68b8ed823c070ac0 | ORPH
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/3545d54c2c174ad8e79431db1d8092a30dbd7d78 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/520c9692721a01ecbe66b88559cb1a860a886527 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/79ed632255b5700760b0d01d58af3fc43a29c6c2 |     
microblazeel |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/20de6ba4d18a9591eec7f9ba9b9270b46b2b7e19 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/dc43f1a83c8fbd1bf205d5c6bed8f88e49d39401 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/38737869dd7551e8f7febd7e489802a309d79320 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/498245cc1ab3c4cc78e5347884c6e10096d42b5f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/06fdd59a4b7cda73336fc196c10da47b68582344 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0b3c0df906ec3f68d83c54e0eb00f2cb4bc34302 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/48a07b3a2b0f1845ab982c1726a22d178e5a23a4 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/dd6ac6414caf84d8e0a17c6ab5cf92a0bf51a0fa |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4964fa883d0792e24cc15115947db889256d99e7 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/7377e6301ea40ef7f1244f907a93d90410c9d987 | ORPH
   sh4eb     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/7293886ea11398e1d71e42512922cf51f8ff69a7 |     
   armeb     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/9130babd78e35727f5bb55b8a69474bd8e3aefa3 |     
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/d553ebe6f6ced3293502ea610a62196ed5485742 | ORPH
microblazeel |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/6e6e59cce29599f81fda446f168977b1f34af713 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/225e1c051db625a51a1bf1b33320b15d385cc9e3 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0fa227095967d27b59ed05a6f2042a9bbcba38e6 |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/766dcf9d654ef834ce7d5f24624af343f4f90f6f |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ac5a5abb1c10b827487f067874ed8179a5fd378f |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/00b7aa196ffbb7f29bdaf81cc26a5e7ee83c2c6f |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1e194fd3b113b41ebcc2c9cc6023825668f3f73e |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/153e40d9001bb106bb4ed5746a24fef0b254cfa1 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/44a9e284e5a237d95dbf783ea9945d3a23367e7d |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9553724113e10182983ff5e58744207338ad7f33 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9fa873e6933a43bd337d0128e50ae667cf3021f3 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/eca27def24d6004e292f86c3da6723bf29c7927e |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e87e593c0022837145b417fa7b84dd8574eb9833 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/94e9b22494b71eb1a054a2abd093ca4ed9fcc691 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d7f3d89510f40491f15605628c3d7eb879b7159e |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fc38d01fcac30641da0efd5b4c2d4d16a7e76d80 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/d1830e8593da24f14cdce25c8fcbecf494d3a381 |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8ee18d7552c20d583b46757472b21ab5a3db8427 |     
  aarch64    |         libsigc-3.2.0          | NOK | http://autobuild.buildroot.net/results/9f055c6830610519cd34bfe5e93762b4ecf8c9bb | ORPH
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/3261b0035c8aadd1b62538b53e03af1cd8a7b312 |     
    mips     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/6b9da1c4aab5b97109af2c2a8135d03dbbef55ad | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/cee421cea2be7369743132ccbbd0428efee27e3f | ORPH
   x86_64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/732b8bc90074549921ac5e732230fe39fe650632 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/ce3bb32cd9939e62b777025846c1ed9f59fb9883 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/2f4d8194f5c34a096add59c49184844c9b79d315 | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/b6abd641f528101e74f9af33e54ccefe0731148f | ORPH
  powerpc    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/cd515e87c187e8110b53b2d2f1b0e50aba15b039 |     
   armeb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/18630ac9a3fc3fe2c86dab3f915aa2170758a29c |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/2686af57b81b4814b36fceeaed69774f7f013640 |     
    i686     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/bc9a24a685a51b0894e81cf9d97be9360d76b925 | ORPH
    sh4a     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/22ab6b8b1c17642f634b7c66c83338bea0c42724 |     
   sh4aeb    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/0d99505b29da7bce321e946e895c183f8ac05fbf |     
    i686     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/d6a5ccc820bb24bfcf80e3f1f3f7ea04ef6dfc23 |     
   mipsel    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/c1a396c72595cb94d3fbc075c28eb087cd3bd51e |     
   mipsel    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/4cdb8ed0ddf3b3e3bd68462c79aab7891a6afe18 |     
microblazeel |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/7e4267b43b46cb10dcd64e86c3a0f49ec03cd9f5 |     
  sparc64    |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/5c1dbb2486af1b267dec549272e0be04fa77ec34 | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/8c802408f813b3f7a8751ae33439dd861bc31520 | ORPH
 microblaze  |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/810fd8566a14f24a4d01bdfe71e70fd86326c968 | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/55063c5f119963a292d3ce11372d171cd6b05125 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/3a7cf316ae780ab632e05b67eafdcc1f020bb88d |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/0ffeee1646fe82ae2352eb7f846746cea3bed317 |     
   nios2     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/d0ce0cc8ad715a743df08d6986c97126d07cca8d |     
 aarch64_be  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/bf7eb86aad0cf2341c64abaa44955994e314f4c1 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/c336a206828813ef01d397427dd530660ef8bf49 | ORPH
    i686     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/b2338c307bcdede99537a9f3b8ad09212d9d3c34 | ORPH
   armeb     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/0158eba103da1d7301e47f9d375660c1bfaa7b8c |     
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/ab83d32554a538e7861957e1ced2024daf9fd3c7 |     
   armeb     |        owl-linux-1.0.7         | NOK | http://autobuild.buildroot.net/results/163eb4c3b7445a3e33a0adc78278b017b78ff63d |     
 aarch64_be  | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/c7c410d8ee95a4278f6f253e0caee723c1a2ac68 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/36ddc638aa173c4423b72222a5706108a7a5ffdd |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d0279714d821c06b9df7a4c7a54051a6be2bd9ed |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6bee2f3392c7700825c8da25fc7544c950b06138 |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/83aa42e8e3f3f0d4e33c4eb5b6ecd84c8a038c2a |     
powerpc64le  |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/64d794f948f67dd0b460c00219d348c3dc09eb05 |     
   armeb     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/ada63ba5e510ed82a61e2c3d8feaf6d59b92b0fb |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/f0ab6ee1fed7e2b9a808517a553b7c040ff0bffa |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/f335cf5099eef0d88eaf24412e336c3f94610545 |     
   armeb     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/4bcbe9d3e953cbd016c87aa14372bf7159e52dbe |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0c65034672901f6ef54ca8f5a604e3dcb115ab23 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/e727a14032314650624756062522c7847f3cad12 |     
   arceb     |        rsyslog-8.2204.1        | NOK | http://autobuild.buildroot.net/results/4aa8b4064ece921aa8f566d65ee0f0a34792c272 |     
  sparc64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/70df168ee3d56161528a5bf350bc763063a8971a |     
    m68k     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/f393b5199178d0c092f254a825318b4ff393ff64 |     
   arceb     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/1e1a75bd9a630f03bddcc165d33d9e1626b201fd |     
   mipsel    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/9d6d3411fbde2a58db73c50e6c217a7aeb5c2381 |     
  mips64el   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/cfa1e98db4a30720270fccd7b7e34b1fe6b4007b |     
    or1k     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/e180387538ee0c704926ec6296167f8a0dc1d911 |     
  sparc64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/b974e7d00f9ca5ad4d3c327a25181b4cdc550683 |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/3ea87c9070e0522d4e8eb32e36b4adc14fac1c26 |     
    sh4a     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/d19c495f2fa511d5a45da535bfffceb382c493ea |     
 aarch64_be  |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/65b11baacede72dfcb9bf69f4a78b24cda39a301 |     
   armeb     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/24e94bde79401585ca9674d526ba278e777450b9 |     
   armeb     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/58ff8deab7de8345de7f09452084f2083ad99b93 |     
powerpc64le  |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/2a66fc2efe5e8092fa1d597ac0249ad785906c50 |     
  powerpc    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/ceea3753a3789f3ee807d856b3b636b86b479d59 |     
  sparc64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/53a6c55c50c2c70d93101d58918284d99e008d2b |     
    i586     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/814567399c2babe4c966dcc5a5050c2a5ef55602 |     
   xtensa    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/488296450da14502102a2c6f502baa61ad97f4ef |     
  aarch64    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/b39a646c53d9d1226793a3db59bcffd4f475b033 |     
    i686     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/4add2d4a75a9602f1135cec124819988eba7e284 |     
    mips     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/c6ec9dc000b0a26ab5de1fc35c7fb0342a10ca4e |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/58e8268e1cb9ee456d77f5f798a791b9ea3271f8 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/e52873198173cd0dc61091363ee4a2f08b8e4485 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2b6b4741961a991aed36428f1f4707e2b15f27e0 | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f53274299d25b71d565e39ea51fc7e7194c488fe | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/83c94bf8a5f2a18cc32fbde5a8c9929769a5192d |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1675ce1a2b628f61d66aa473e69801277c4575a7 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/f8b17f0ec4177c5acb10b3c5f0042f9d66c46c4c | ORPH
powerpc64le  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/026e2dc87ff2bc997346efdb9d21a012d0d58e54 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/a1d4093ba27e50ec1779590e266bedbfbcc319b7 |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0efe1d147a1bf60a26d1aa4ba84760d478ca23d4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a23b8889d1505848b632f73a5b84937655e9b0a4 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/7dedc20dec7e6eeb0a6050c26b1f64ef6ec34d80 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b75276f4ff3d77ccf321c9a683693252e33ea352 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2dbee63e28e744e854d2c95c35e583a168de5857 |     
    i686     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/11d5ab55abe639ece0cdfbb44905c04ba995fb69 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/0929f9228bc7674721969a00900050af65a1d5a0 | ORPH
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ef47e810e5adb6856f59d4dd89142c2faf343fd7 | ORPH
   mips64    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/087439f39ca9ee53fe09394cc20f7cd9a507aa5a |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3aeef649233e607cb78e70fdde65626d137e06e6 |     
  sparc64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/98ff851932ccab3747f533e52b36ef73159e17b4 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/cf5e95d63a0da7e42e913666b6afcb445fc35a94 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fc75d9a5b7b6c05509a8d93fa6b8db633fb4b956 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/57c92e1a9e84beb927be7163113904f92288a1b5 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1e26164aa26bf53da782c8be246d84e985e2da62 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f24125eff0b41577a13ba051323d53b910349807 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/179e2fa6afd5a15d4b5af607841bd9bd18b7716a | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f53ac3869e31dfbfc6cf8185d592dfe1e153fd4d | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/61c22a7604e8f3486a13c66fb6c1efdf74d8c007 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e2a74e836230d438cc50909f80af31e1246acd7d | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/859ab3321078931eb19c2937cf80edb455376f0e | ORPH
    i686     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/e65899da69d7136c40abc410276ea753f8770d92 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/70a5f87fcdf60d4bcf133dded44ed611808974de | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9e60d64b9f7bef6c54caef3822c4112a412c036b | ORPH


Classification of failures by reason for next
---------------------------------------------

            host-binutils-2.38 | 3 
                   aubio-0.4.9 | 2 
                 dash-0.5.11.5 | 2 
          imagemagick-7.1.0-51 | 2 
                     ace-7.0.6 | 1 
                  boost-1.80.0 | 1 
                  cairo-1.16.0 | 1 
       freeradius-server-3.2.0 | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
    host-python-greenlet-2.0.0 | 1 
             lirc-tools-0.10.2 | 1 
              memcached-1.6.16 | 1 
          perl-net-ssleay-1.85 | 1 
                 sudo-1.9.11p2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/65110bdf7dc8387e449e14d5fc53219abb65795e |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b744b5555ed2eed36485ebca78941c28dfb9f629 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a3255e89a3bc554ffa5045e63dff4584eed83230 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/52ecaaae22c091eae56e56629723d19d20d7520d |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/fd2aaeea1ef57d16bc330cf565db26d0105a55e0 |     
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c15071812943e10aa92eacf19bbeadc0de2eca5b | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/73515e8c3dc5ffe2521fbe726b4ed3d27290f24a | ORPH
microblazeel |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/cb64d3fa30e42d3d2494132fbab06081b8e00e08 |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/dc0eef08b0d08dffed1c97a4dc6db650556e0437 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ff24942e753374795699e24483b06ec1e9b9d60a |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d0fa9e9ebc7322d6e9f39094e5e2154a2a245105 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/71cb4c056870dff79c9519ddd5b78d91c4fab441 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/533eef356b10fb2c29a2c008e2a888ba58ecaae7 |     
    m68k     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/49dd51fd9fb6705e9b6b96a8b4f7e6df92dda7d1 |     
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/f289c82d7cca61921925bc764c467b046e8eedbb | ORPH
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/dc117ecebc40b7c7461b3cef0617d6343a0b6a30 | ORPH
   mips64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/e0bd985abab90cbe51290b318135c8e6288bba40 | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/1c55b2ff1f20a1c3873a8e13d221fb065d681abb | ORPH
 aarch64_be  |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/642a27ab6b3f5bd8f4070a36c8e57be7317638a3 |     
   xtensa    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/82bec7d97cdd7e160f89eb8b269652e5c56087ae | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                        nodejs | 1 
               poppler-21.12.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |             nodejs             | TIM | http://autobuild.buildroot.net/results/c02c153ced5cbf86775f9e70500693811cded10e |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/ba55a53253a379fa48509ee673a96f576e6141e7 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

              host-rust-1.62.0 | 3 
                  acpid-2.0.33 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
                gerbera-1.10.0 | 1 
host-pahole-73383b3a39afe86... | 1 
            igd2-for-linux-2.1 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
               lpc32xxcdl-2.11 | 1 
                   luvi-2.13.0 | 1 
              open62541-v1.3.2 | 1 
     s6-portable-utils-2.2.3.2 | 1 
                tealdeer-1.5.0 | 1 
                 wolfssl-5.5.1 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/684f999b61ba614c9e145dde8f4e24472d846a8c | ORPH
powerpc64le  | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/3a55651130740c405287f8cb4c5d2f5ab7199a13 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/998a7be9beca7f20d8d64245c2eb26784e0f9fec |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6e22aad3b2585be9f7884c607b29e4afaa72eca2 |     
    i686     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/b1a497e4c7f82bf4380b4ec35875570f75bd8fe4 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/1fc21bdf544b71d29cb9faecbc9a97830f6c486c |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/70d1cb4cf72c17bc2fd8d234d3f4cf476d52bb7e |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b8459dee08efcd7f90eed5033a764181130e0a4a |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/a1ada753d27dc621fb00a24b067ad89ff319608e | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a8fd2c9117c3d923ba488050941855d4f3751813 |     
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/88ac2225ee2364c7303ed3b06bb00209124083e4 | ORPH
  powerpc    |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/f40f0372932d58cc49882a1c3d481aac2dad3e54 | ORPH
   mipsel    |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/3ee6607135a17f6838b8c5d26a9d2107d421a508 | ORPH
 microblaze  |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/65da355abc4a3e3b7810b60b55ef1a8e626f7a55 |     
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/0afe22fe722b6e0c7de85eb5af8ee671df3aaabd |     
   armeb     |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/bb410201c4e6b0253cfb5924d8c8a8ac7acb7c6b |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/13c7cc42c20046cf63ae20183dfab689cbece9b8 | ORPH


Gitlab CI results for 2022-11-05
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
