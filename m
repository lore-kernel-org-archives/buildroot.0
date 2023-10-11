Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0ACCD98F3
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 05:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E350B417D1;
	Wed, 11 Oct 2023 05:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E350B417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNzDQaML3vvB; Wed, 11 Oct 2023 05:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01880417C9;
	Wed, 11 Oct 2023 05:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01880417C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 618061BF3C6
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 05:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C93417BE
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 05:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C93417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-0jqDg_PDlp for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 05:36:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D0E6400F9
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 05:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D0E6400F9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D561FF81A
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 05:36:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 05:36:11 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231011053617.16C93417BE@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1697002571; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YDY1d8YzgUa2L5pQkiq2Othlo+MGnxxXVq0ytuWncuI=;
 b=DAHtUOdeQ0AB0aLvRHzNC4hnkUfprk0AWw5ViqJpMF5DNCcU3tGTj57az9URdGPGzATKAM
 Ac36JjEDSTtFM8ie/g1OeUFJ6p+C28QszW1W1QrA0l0QZKJn7sph8/udzCYdGOOKVnG6PN
 PEus0EdlSDMJarIpZkxr+NWCFDgwpkTKbGCAJof0pjG6IUk7Pr2RhSfLWXDov+X8mR/owZ
 ZtdId5GWzisB/Gmv1BTj54+bAACnmS//9v60gJyo1EmenuM5FwIpUJiTmgKQITM8EqMz+R
 e8BYZ7dSCw1BNPk2voR3PT6Zu+TsdM5Ute3M424xc+I6qfXszLvZHtm9hQpVlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DAHtUOde
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-10
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

Autobuild statistics for 2023-10-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 22  | 14  |  0  | 36  |
  2023.08.x  | 20  | 17  |  0  | 37  |
    master   | 97  | 162 |  0  | 259 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 15
                 openrc-0.43.3 | 14
               alsa-lib-1.2.10 | 10
             alsa-utils-1.2.10 | 9 
         spirv-tools-1.3.261.1 | 9 
              gcc-final-12.3.0 | 8 
                   bird-2.0.12 | 6 
  gobject-introspection-1.76.1 | 6 
                   linux-6.5.5 | 5 
                  monit-5.33.0 | 5 
                 coreutils-9.3 | 3 
              gcc-final-13.2.0 | 3 
                host-go-1.21.2 | 3 
        host-sentry-cli-2.20.3 | 3 
               mariadb-10.11.4 | 3 
                     squid-6.2 | 3 
               apcupsd-3.14.14 | 2 
              gcc-final-11.4.0 | 2 
google-breakpad-c85eb4a59b6... | 2 
              host-rust-1.71.1 | 2 
                libselinux-3.5 | 2 
                 netsnmp-5.9.4 | 2 
               openblas-0.3.24 | 2 
                   perl-5.36.1 | 2 
                  boost-1.83.0 | 1 
                 c-icap-0.5.10 | 1 
                  conmon-2.1.8 | 1 
           crucible-2023.04.12 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.2.0 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202308 | 1 
                     efivar-38 | 1 
                elfutils-0.189 | 1 
                   ethtool-6.5 | 1 
              fftw-quad-3.3.10 | 1 
                     frr-8.4.2 | 1 
fs/cpio/cpio.mk:128: /home/... | 1 
                     gsl-2.7.1 | 1 
         host-gcc-final-12.3.0 | 1 
               host-runc-1.1.7 | 1 
              hyperfine-1.14.0 | 1 
igh-ethercat-f5dc109176400f... | 1 
              libarchive-3.7.2 | 1 
           libfreeimage-3.18.0 | 1 
            libmemcached-1.1.4 | 1 
              libopenssl-3.1.3 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.5.3 | 1 
              memcached-1.6.21 | 1 
                  motion-4.5.1 | 1 
                 ntpsec-1.2.2a | 1 
              open-iscsi-2.1.9 | 1 
              open62541-v1.3.7 | 1 
                    pixz-1.0.7 | 1 
               poppler-22.12.0 | 1 
           python-orjson-3.9.2 | 1 
                      tar-1.35 | 1 
                tinifier-3.4.0 | 1 
              tinymembench-0.4 | 1 
             util-linux-2.39.2 | 1 
                 wolfssl-5.6.3 | 1 
                xapp_xfd-1.1.4 | 1 
                xenomai-3.0.10 | 1 
                  xmrig-6.20.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/62416488f431fe043a8150805cf94137a8b632f5 |     
  aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/6c48bd1bdf7771b303ee05e122b3a4128dcfbcc9 |     
   mipsel    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a0695ddba87e3e092270cb30759026ae4cae502a |     
  riscv64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/cceb418be00eaabd53856f811ff82f57260d4df1 |     
  powerpc    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/670dc56810732df7ffbdafe6a07d8f3192246924 |     
  riscv64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/63d1228974de5ef2af40e507ffddb1226867516b |     
   mipsel    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/43a2e3e0af89fc2b29855388041008583803b7b6 |     
    arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/1b7d95eefa8a5b3071dae16c38233ea747eafeb9 |     
 microblaze  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b655cb6625be198b6444c2a5a5f283f295facde1 |     
microblazeel |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/35648ea06491bceee9311cb1cf1204ded8c73d13 |     
    arm      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/7c67aa744575377ea725a5e614e0d3785d77a1c1 |     
   arceb     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/f029d7af34b10445f14ee0f2555e52b2abda1b81 |     
    i686     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/2db0d9cefe6268a166a237d11eb530dc908b19e9 |     
  mips64el   |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/54740ff426e1df1637c0a14c2eadec2b15db9779 |     
microblazeel |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/50ecbf3e2c037decdc5884293dad0be5971079da |     
    mips     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/b3be715a598b6cb713bc4805c20b789168393853 |     
 powerpc64   |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/91f588e0b6cf2003dee7fb43b4e3fc33347e7de4 |     
   sh4aeb    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/95535ca66a8e5b83836fb3f245042da50f39de8f |     
  sparc64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/7868f725ceb9d8b64b956b78309e474a952d4b30 |     
   nios2     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/46ae31792837b49524a39ae1f1f2289367014b49 |     
   mipsel    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/03d500f7e4c9ace3eb9e732c8e3ee1bf64d80832 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/5742f51b794e581bc2d4bb88dd7532da8fee931b |     
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b2ecf7b0bb3416427841c5b4bc29bc3223739fb6 |     
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b8643737d5f6a6d643ac43e5f884760b0b74f6dc |     
  riscv64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/763a05e1ebed830fc800970b16454d8ba6c84951 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/00034b16dae183bb1817716c295ab65f7c492654 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/4dbdb9e10b6447bdb28af9d50ad416489466789d |     
    or1k     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/78a7aa6f678f5e6aba5f15db0d13ecda6500503a |     
   x86_64    |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/77db9a2abe42ac4df70d28dc10a73ef0673dc83c | ORPH
    i686     |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/ee461721fe926d67797b1ccf4d6ee3f7329f82c0 |     
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/55c0324f847ec1916752eb5e1bdb1656a9edb9fd | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/12828d707994a2f274e59cdcc6ccffda2932eae9 | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/22062205409b09ebaf9ced9decb2a1ee9c4f3851 | ORPH
powerpc64le  |      crucible-2023.04.12       | NOK | http://autobuild.buildroot.net/results/826c13d4037f2f88b8d4dd5d5f7a85fa53eff259 |     
 powerpc64   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/352d58e3206a3e9f0c47b5010fc289c9170bd48d | ORPH
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/b1fa63ebe3535fc97fd191daca020d73003d299b |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/02a70f1c27229c7fd9618d69ad13a53f5eccd639 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/6f17071bf034d899c153d4787a807a2e3a04ce5f |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/02f54ee4cb78a78430fcf8158811296c7a2dc440 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4e80958bbe5024fedbe1df20efd8e1c1b494c7ad | ORPH
  powerpc    |          ethtool-6.5           | NOK | http://autobuild.buildroot.net/results/3716a8b42db3b59978dcf845ac62415cffb2280f |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/c5d1cc113a37f918d8ca1eca3443ead0149720e8 | ORPH
   arceb     |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/7cce2f74111c7ac88d8203814f6bbf013d3828c5 |     
  riscv64    | fs/cpio/cpio.mk:128: /home/... | NOK | http://autobuild.buildroot.net/results/254290817d343ecb208091c265b3fea4d73c9fc7 |     
 aarch64_be  |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/abe3e78757c0f8c5b02965cb562b807a32103ddb |     
    m68k     |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/d2218955a71d3b7da683206b3b27a639a6171a83 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/8d65db33e5eccfe94afc6070aa3ed442d369b209 |     
  mips64el   |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/e577ed9fd8a27fe155645ad094cdca7bcdbbe53c |     
    i686     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/d741cf20437ebfd0c967e2409ada36c5c063be2a |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/57d4a423756b42766047b0174e8c9cb3322fb3c2 |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/4cad7ef9affc18a30f76990ea05bb0e4ed83db8e |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/e09f4bf0a88a66f38f09121c2ed23a2b12d057cb |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/af5c75e5d62aaf61b30d97e0599e04c0d6bb7daf |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/d06fa1265e678a1b9065235214508fe87b9345c7 |     
    arm      |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/da82ca0103a88c8f2526b5048c7b175cc7f72c29 |     
   arceb     |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/d3c9bebb17fab56d6128b4bfe5c6e24dd23404f7 |     
   mips64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/9657348422577164089735e8f1a95c7d72f45616 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5e74cbe088380525eb1c2e921bb5f47af10488fc | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f4e38687b9777e8d068711e46120b4bf61d87734 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3d2be5808f9097986acf5f3b5b9d57947a79401f | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8ceb42152299dde957635bee5967b512c0b0e125 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d88cf3403a426ca3d0c09806846a11b764caa038 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/175ef23e20a93a4e6b4b12612faaa7ec120958c9 | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/ff81523366002b3fd9b03bdd229b631f3d30137d |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/632ac16fcf5f27d4cde3c842054a663cad746da0 |     
    m68k     |           gsl-2.7.1            | NOK | http://autobuild.buildroot.net/results/9f686b375fa9db4511fbf00a23e99626c35cc0cf | ORPH
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/4b06d68c3e5ae289d74a67fe7a1d3e7cbfd9529c |     
   arceb     |         host-go-1.21.2         | NOK | http://autobuild.buildroot.net/results/a428d8719a4f458e5faf8f5e5ef28840d6debb13 |     
  mips64el   |         host-go-1.21.2         | NOK | http://autobuild.buildroot.net/results/5e730d54350cab9d0ce3fd8cf89e3902d5117f4d |     
   mips64    |         host-go-1.21.2         | NOK | http://autobuild.buildroot.net/results/f03fd08e7903bfb280d16519bce918aa49530104 |     
    arm      |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/43050e8bdf77da8bdf14e88537c4413c56754214 |     
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/31da9322ec64ebd55f7413131a796af61ad6aa95 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4fca4cdb76e9e643ed2527d2d942e7f23cc08bdc |     
    m68k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a62b3282addc9b946a77fdf0d802f5aaee889270 |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/689dc2634fc6dfbe6ed25ed25e079d0e70c24321 |     
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/0bb9fefcecdbf4592b8ccb4ff05ff919c7fddb02 |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/9a51cd4bff9129538d3fad05d19ebd99f835c731 | ORPH
   x86_64    | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/2a952b29961a3d4c8a284e7de11c9240696a5614 |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/f3814d0e14d2486f3d36ed37c89236b717178d4e |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8e41780e6049f632d59d68ff8f5846584d908f83 |     
    arm      |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/202aeec4dda822ac341d8882f84f968a303697c3 | ORPH
    arm      |        libopenssl-3.1.3        | NOK | http://autobuild.buildroot.net/results/824332272233dcf5943c8a3814964e2bd0e51754 | ORPH
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/472dac1e0c858a0c7087ce37fac2583dc779e5fa |     
    m68k     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/6c1444eb1e613091a7f5642f03ecf64ed5293295 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/3a7186072b68b4d5f8cc42a0ab482b7cc0c54b93 | ORPH
powerpc64le  |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/95bbc31902d6db5d8c7a0f3b609d34c6bfd2f552 | ORPH
    m68k     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/8c1f82a3c429fc5b56adcb22cbcebbc16c2c3191 | ORPH
    arc      |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/6661ffee5f2a06d727a24097b8232a9a806ebbcd | ORPH
    m68k     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/66f14fe9441c36023bc4b491e701eae831be41dc | ORPH
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/f596343ae318eef9d1cd8d6bad05da9554724d8c | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/0b65a8a35161fae0bfa68df894a824be275de651 | ORPH
   sparc     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/54902d52880ca234550e2c53a552abbf5dd12a20 | ORPH
 aarch64_be  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/bf4e9924ea8569881c4814e209757a91b3824478 | ORPH
    i686     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/483e10d6e30d7b5d448ba794bcbca332df891d98 | ORPH
    arc      |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/6b74a5d3df687b6d15fb67e4635ee2514af64ccb | ORPH
    i586     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/42cdf7630b5af42cdaf86e9536ff6af84f6d528b |     
   sparc     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/8967362ffac6134252c9d9bcea3d7212c455c980 |     
  powerpc    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/e5c5e09cf537bf1c452c2bace3603c7c4e74a70b |     
  mips64el   |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/ae96f42f9c01a1539aa58fe98dcf768b0d847172 |     
   xtensa    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/cf4072bb4ddddfbf994340541af77d9162e4802a |     
   armeb     |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/ffc74309ea3a9e5dadc96700d6b256737a0dd517 |     
powerpc64le  |         netsnmp-5.9.4          | NOK | http://autobuild.buildroot.net/results/e18aa911a377e8c10fbe4acc8c1e4dd8ba73fcb4 | ORPH
    m68k     |         netsnmp-5.9.4          | NOK | http://autobuild.buildroot.net/results/2493ec05e61e38fdb8c4397db20a774ca3df7aa9 | ORPH
   xtensa    |         ntpsec-1.2.2a          | NOK | http://autobuild.buildroot.net/results/e71842b09a9b6b93e7234e4705d32d827da9d5d6 | ORPH
powerpc64le  |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/a84d308a8227415e51c29aba5c5d6d99451fa8c8 |     
  riscv32    |        open62541-v1.3.7        | NOK | http://autobuild.buildroot.net/results/1fb9eceea17ba98f2ee6ac95519575b30aaccb12 | ORPH
  mips64el   |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/6302d3035741739e3709fc8b8652fac3c9576206 |     
   mips64    |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/a6141fc2e303596de9eb420b7790faf4bbc7aa5f |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/49406123fb67007e55fa3ec97358ea59ca55dfac |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f15cb4805a418748f462f6de3e17f5fd878b5e08 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/dab31b3289f6b650d573c85ba5e5ca810ebc009a |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/3c1fc4ab4f1ffe56dfcbf3f3b2cc96c9a8257d96 |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6b9b649443e688a5ef1b1aff632e06295b2e227b |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/601288233d8d1d13e0f5ff90985e9349bd248359 |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/4a198a72ac366421f6a8785ec54c56595eaab5bb |     
    or1k     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/2fd96066be20f115f651b5442d0a3031b0a21f9e |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6e6e4ca5d9f357c6c451f8e798bbc4c9f5656019 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/510dfb18fd598c6abccc97747009937f973c54b2 |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/31fbdbf0f67fa5209f24b1313afee64c1bb58091 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/908957765d2ea41471050092b7fd909187d06c5e |     
   sh4aeb    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6141621e51d19728d999aeab94cf43053a195a9d |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/54bc97e523849f62f22b62997162e76757d4e9f0 |     
 microblaze  |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/0b321294c26c3b2a63e4eef10a815c96d07699dd |     
    arc      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/1ef7999f12cd11033c5e4eea7d67644bd2e68aba |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/9713ee64d346434a0628a7a16a5eec1fe73f2da8 |     
   xtensa    |        poppler-22.12.0         | NOK | http://autobuild.buildroot.net/results/d254b535f7ffbf00786ac437f4847481ef2e5b2f |     
   mips64    |      python-orjson-3.9.2       | NOK | http://autobuild.buildroot.net/results/218bf2d5647069a42160018407d68369e3e43e7b |     
   x86_64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/cede7916737970f174ee642fd5813cf23e055369 | ORPH
    arm      |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/d0e589accd1db98b273d25e4ff1c793914f45b9b | ORPH
    arm      |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/a049d3c5b507dfe1d596577fdd2843155e15530e | ORPH
    arm      |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/11b691a1f04d25d76f9afa6a2521e1f8cdfe591b | ORPH
  powerpc    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/449034f62f7db35945e8949df53712f89b05affe | ORPH
   s390x     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/9194b1b2c999db6118f93f0ffb9f4f2cec05fe8f | ORPH
   x86_64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/c5aefcf2f2f1e81c68455cf2accd4e305e617eec | ORPH
   sh4aeb    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/7b779845f0ec7a3e0a67cd1d56d3e3750da8af3c | ORPH
   armeb     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/4f312622f5e71dc2a1d838b576f6928ca5a4bf49 | ORPH
  powerpc    |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/e98daf84050eb7aaa214c70c13a42c3c8d93c0f9 | ORPH
   nios2     |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/e7d5f00287a0f2498db536d2b499e8047ed98c64 | ORPH
    sh4      |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/b69e9250a97495d542f16206fddc2c24b5c952e5 | ORPH
powerpc64le  |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/18227c60a80e59c4cc09d92ec70bcba053e1387e | ORPH
   mips64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/4a7206113eb2778dfdc193cee14017758cda98cc |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/16fd7ed116edfcb4f7566b37c25434012e737663 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/50586ea28f8846a5c58a2d61a5a579bdbac6e958 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/a06a5e32565610985d241d723c37a344fbe3e9b1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0458c751a0110cf73c5fc08e8a6517380cd7d68a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4aecd1b3f3e4ab7a08337412942d36d5016b1920 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/800aef02b241aad1f3caa86a4001d2fd40e7cfe5 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2057d3c23b5937cb253997b58ea7d439f02d2095 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/06bd5e010fe1eda65db6ad232d97925897942735 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/68b4ac22c8c2dbfd61abcd5c5a4247aa739fd8b8 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8fa0f2cd7a027d3d8fae56125621b0b814e132da |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/4b8d98fb10c9ebdfb4f3d576f75f2fc351e98bd8 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7ad0fbb41cce85ca60c7369ea056a9642009d08d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f79d9052820e4678be75fb1d0dab4960553628e9 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/4f5cab672831ae94c97841d7866cae2025c106e0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c0921543d6c21431eef4401f3a30abe03fa6a700 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/8b7e847fc3d2e21e605c38c4fe8fb5d860baed80 |     
    sh4      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/cb3b6032238d30a26eb551852fe0fc1f2fe677ad | ORPH
  riscv64    |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/b8133fdc801ece552f0d80f328857f812770ed82 |     
   s390x     |         xapp_xfd-1.1.4         | NOK | http://autobuild.buildroot.net/results/3263e0c7b63b39d56d28e876a53a10aa2aee0c36 | ORPH
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d334a4e2ad35f1359d6d6db5e44494a7f4c76ebf |     
    arm      |          xmrig-6.20.0          | NOK | http://autobuild.buildroot.net/results/7e4947d885a4ee263f8c7f13dbb127929eb0461b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.55 | 2 
                       unknown | 2 
                  boost-1.80.0 | 1 
                 coreutils-9.1 | 1 
                     frr-8.4.2 | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-11.4.0 | 1 
                host-go-1.20.9 | 1 
              libsodium-1.0.18 | 1 
               suricata-6.0.14 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/0714e676ddbfceaad9f3258db4ea66cc3ac48e7a |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/25ed3b36d8788830d68a12407bef298a26bd2c9f | ORPH
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/0ab53f25fffa6e2f57a9f7485a9cbad410c92c56 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/459bc0b706627cf0bb5647cfe59e020965c95217 | ORPH
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5f695f1601dae6ec2d2fb551f7a8681d589546c0 |     
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/8b554085aa6f7bcca346c44ad5cd6d1972e9cf5e |     
   mipsel    |         host-go-1.20.9         | NOK | http://autobuild.buildroot.net/results/7cc3ee4f104b00daa93c27f8530112ebfb1f4ceb |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/b02c95fada962457cc81b9c54b1fbb04268c6ff4 |     
    sh4a     |          linux-6.1.55          | NOK | http://autobuild.buildroot.net/results/bba82818a082a194f95c0185c9b2411eae0d2b3d | ORPH
 powerpc64   |          linux-6.1.55          | NOK | http://autobuild.buildroot.net/results/f0dd1acc57b8e9e64f208db9c096bad89bd2988a | ORPH
    arm      |        suricata-6.0.14         | NOK | http://autobuild.buildroot.net/results/991a9637dcaa03ef530a877d969b55a443c1b269 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/a5027a59eefa35860803edf592c7f75df46fb085 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/79eb994acc1bbb4c2834e857c7e3a21554e00a78 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a70b0f32a970f231fafa44654927e3845e609e3c |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 3 
                elfutils-0.189 | 2 
check-11970a7e112dfe243a2e6... | 1 
                 dc3dd-7.2.641 | 1 
              fftw-quad-3.3.10 | 1 
glibc-2.37-45-gb4e23c75aea7... | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.20.9 | 1 
         host-sentry-cli-2.8.0 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.4.16 | 1 
               linux-pam-1.5.3 | 1 
          lttng-modules-2.13.7 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/62aeba5f46d000760d4f7d01c4b008db7bff3587 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/778d618ee091ac702cd110510daca5b93099f174 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/de38b160c118e95566f0e652c3f1c15c00656eb1 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2da070f05925e7600138e43acf1acf258f013c32 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/15cdbb3487a4617f232734418aa28dc1bc904f7d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2a3c04074cf54ad5b52a7fcad0ebaf273814f0c1 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3fb423272b6187a6e5588adf18050e4a7042d892 | ORPH
 powerpc64   |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/2e8adfc8fe1e0232f7b58c43f75e0e0e24464496 | ORPH
 powerpc64   | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/0b064ab01a32c50609cc9b63f4ad12d3a31d2310 |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f67a2acd7e8ba04f2d97e212faf28dc7f967c695 | ORPH
  mips64el   |         host-go-1.20.9         | NOK | http://autobuild.buildroot.net/results/734814bf69efecda66de757536f2a9c2c8757dbe |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/43cba92c5187b0a64f3ad56e0df1f840b272555e |     
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/25eee23aba4f89b64d7a1311ea058089a6567f72 | ORPH
  powerpc    |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/f59532ec2e4087c68974ba857cfbe33860be1434 | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/bd94cd37aa5ed1290cf88281e5c75b8a74474b97 | ORPH
  sparc64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/ca6d5ed37de56dc536728c0a754cac32f00d9690 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/c6fba47e509f14d28469246762db0b347e4f8116 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
