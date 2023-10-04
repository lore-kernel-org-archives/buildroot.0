Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDF7E8FDCA
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 05:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A7D960BBC;
	Wed,  4 Oct 2023 05:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A7D960BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0P6GajwXShQc; Wed,  4 Oct 2023 05:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B9A760E44;
	Wed,  4 Oct 2023 05:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B9A760E44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C499F1BF29D
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 05:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAAB941479
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 05:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAAB941479
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tmg_soxuS9Dv for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 05:39:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E44424016B
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 05:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E44424016B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D9BA240002
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 05:39:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 04 Oct 2023 05:39:27 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231004053933.AAAB941479@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1696397968; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D4G02pCWd+A2SOBs8AJCfyp3kXi8kKohLEsJWRXJAyM=;
 b=DomyvJkHOsG/JWt8xuZeJA1iwesijFIBOm+aj5BmdufQvNguF8ymVrkm+EyNVB5CtqBNAp
 EXFJZhEvjxXw9fWqdnbfSdK6jO9Tk/Sq66z6wk1bDU298ald6Sfvu9/wQK6WPrMV2gWS16
 CEOQPsynSa9mqRiKwnqyM01lGNuVsKbirUsRGTLO+66S6iV5nLsUbC4+5QxvZ83zM/iER8
 ZXBc2LqJ/SSki/h4h1+0puLIGaT0NDWCXlMBxkfGl7wzt+9pz8UAvbnlhBcC/AL3cX9SD1
 R75FKhVoLFGnmvU2nuaFsGS8LN98MrTvtus2pyHOZrmr1tJ5HXGpCQgOFQay3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DomyvJkH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-03
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

Autobuild statistics for 2023-10-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 19  | 13  |  0  | 32  |
  2023.08.x  | 11  | 13  |  0  | 24  |
    master   | 84  | 115 |  1  | 200 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 12
              gcc-final-12.3.0 | 9 
               alsa-lib-1.2.10 | 7 
             alsa-utils-1.2.10 | 7 
                       unknown | 6 
glibc-2.38-13-g92201f16cbcf... | 5 
         spirv-tools-1.3.261.1 | 5 
                   bird-2.0.12 | 3 
  gobject-introspection-1.76.1 | 3 
        host-sentry-cli-2.20.3 | 3 
                   linux-6.5.5 | 3 
               linux-pam-1.5.3 | 3 
check-11970a7e112dfe243a2e6... | 2 
                elfutils-0.189 | 2 
google-breakpad-c85eb4a59b6... | 2 
              libarchive-3.7.2 | 2 
                   libnvme-1.5 | 2 
               mariadb-10.11.4 | 2 
                  monit-5.33.0 | 2 
         openfpgaloader-0.10.0 | 2 
             s390-tools-2.29.0 | 2 
             util-linux-2.39.2 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.57 | 1 
               apcupsd-3.14.14 | 1 
  binutils-arc-2020.09-release | 1 
                    brltty-6.5 | 1 
                    crun-1.8.4 | 1 
             dahdi-linux-3.2.0 | 1 
                 dc3dd-7.2.641 | 1 
                 erlang-26.0.2 | 1 
                        ffmpeg | 1 
              gcc-final-11.4.0 | 1 
 gcc-final-arc-2020.09-release | 1 
              host-rust-1.71.1 | 1 
                 lapack-3.10.1 | 1 
               libglib2-2.76.1 | 1 
                libselinux-3.5 | 1 
                libsoup3-3.4.2 | 1 
              liquid-dsp-1.5.0 | 1 
                 openal-1.22.0 | 1 
                   perl-5.36.1 | 1 
                     pound-4.8 | 1 
rtl8822cs-758d861bfa4d18d39... | 1 
             stress-ng-0.15.07 | 1 
                   systemd-254 | 1 
               trace-cmd-2.9.7 | 1 
                 uclibc-1.0.44 | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.2 | 1 
                  zabbix-6.2.7 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/5084c27031302b6d736cb287fe5e9f2a48f21e6c |     
  powerpc    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/2744128687ac42cd29b38715765e7b8d98e5fa5e |     
microblazeel |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/71272b1f5e8ce6c5b83d7fb7e951376c76c679cb |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/2d5ec8eee29b1af41d0a0e66acdca5d8434af8a1 |     
   mipsel    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/fe49d8ec944e4af9ddbe19bef72f90ee74f5d3c4 |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/7422536935268f8d6d1910d1a1e53b252c3c4975 |     
   mips64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/37548748006710e5d2a96936919829e5b21c4a9e |     
 powerpc64   |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/d120ebcf4e275493f732ca6d67ee4d2b854cb7a7 |     
   s390x     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/25533ce6191661a83e05a49c68e14fde8554cc20 |     
microblazeel |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/f56979acd7c54180ed5a77c637006abda870e8cb |     
    arm      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/bb6c9d2fbc5d26ef8be52599bed7579443d329ff |     
    arc      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/61a8ee243d7e6718d5510e977f067ae0b3635612 |     
    arc      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/5e6573c878adfae8cbdd000be3eeae844442a52a |     
    mips     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/0d34e277e83dc5d84ae990e5669a5913f72e7023 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d7c814784d77cdeabb954164001027d1e09a290d |     
    or1k     |         apache-2.4.57          | NOK | http://autobuild.buildroot.net/results/54b729e390fb312632e9dfc9dc69e8db65f51c9c |     
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3566244f4ecd1849b31f568551009be5a0fec86f |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/51e925dee2a240a9d257133827755127743bc9cd |     
    sh4a     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/58bf48a08ec0c9cd2d49a668bd5f6acdab552014 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/55f52467129c6e6d4802d403f03b0c18b9f05a8f |     
    i586     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/666823155b4711f1ccd7c1d15f44e99c15d6272d |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d237bd56f01c5658f21a79fda41ed2f3421fde3e |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f0b60edd69b2ae751bd28469b0aa07228cd7c180 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/537cbfdb44ffb7f8cb7e255a1575f64e72fb5c7d | ORPH
  powerpc    |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/0de8d766dcf11399e4525666c72908c3bcc056dd |     
   mips64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/4e7f12cf1c546d041fc2b12638b53db89952bdd3 |     
    arm      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3720fca1120595f4a4019c92354227aff1c8d6db | ORPH
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9f272fef29ead73b0da375d9cf7735d6449744d1 | ORPH
    i686     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7bd6490bbeaec8853205aef5044ef32fb2a7e095 | ORPH
  aarch64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/11416d81d5b27fc0627b335a971154c088d5754a |     
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/8bb2e47b1c44662c4221e9c92c1b6e677631afa0 |     
  riscv64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/1999efdadc6a0e53e064ad9f5b67318bac337ed6 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/42638ba9c666ae08db4a9045c50f48a5f7cefc3d |     
   mips64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/3b32e117609e27f4545424b86e7cc3dc5e09d858 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/23cb7f23749868050c814dd7d49081c85e494a92 |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/6887e2566302a427dad2bd99217ab6fd4847b475 |     
    arm      |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/fdb143b103908a4f235515e48e0f47a4b0649ca9 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/a4c3c5c9a9da191a75874660dbb332054aaaa87d |     
    arm      |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/54ae6c9c76ebaa643bbf3b9973db1e8f0093105e |     
    arm      |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/948068a890f9ba310cb7359004a24f5240fe797e |     
    arm      |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/2c78f19fb9bffcb48aacf36f00b78d3a2f61da0e |     
   arceb     | gcc-final-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/2e1bd6ff1634ef48e87dcb21aa65449c5a415ec0 |     
    arc      | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/dafd3f371e7315d2ff025731e42483ee8db8b349 |     
powerpc64le  | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/409d70fedb25937591c994a1e93a15a6dfffec9e |     
  powerpc    | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/c766f00f46772beba47b9d774ddf58ad05825c30 |     
powerpc64le  | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/dc08134c133abe0f0729f8cf5f4cdd8aee0d6e6b |     
  powerpc    | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/605c8226bbcbc864638910a1985e0a957ac81bb2 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8a36d7b3a34266a54e2b10e4bfeecc642211aa77 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/dba268bae09aa463104fb6c18646a48ce0cfc523 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/de2cbd904243e5dfd9ef41b6a8d82c5ef69aba9b | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/a3dac512cd35feff647cfac77d456029a9fdc035 |     
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/94e42083c0dc8fe647c3412a97ed8be7e7487c43 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ef607282f270f82f3ac5496c39adb4120bb37443 |     
  aarch64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/eb146d53ba0a0f79fb2eb876f9d6e6d03d09d669 |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/67c51de13e77248b608ce76db65578d459af8f78 |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/51d72948f4772bad1c7cb7f40e665a7df5580106 |     
    sh4      |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/a7f43ec38c3c173174e2a2ae0fc10966aa65a59e |     
 aarch64_be  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/40f3cc1e8a4494f058ea866e215dd63fdb312e71 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e8b78be63cd93dbf0b042fed36085c9a5142e05c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8cf1a815c3647663b6e9bba2c270aca58bd56056 |     
    arc      |          libnvme-1.5           | NOK | http://autobuild.buildroot.net/results/b10625ce859ad1ffa6d340b831653af839bc5935 |     
 powerpc64   |          libnvme-1.5           | NOK | http://autobuild.buildroot.net/results/1b215c0c4f27df278856160ba21bad2f3f6bb807 |     
    mips     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/71a9feb57123165917b893641be6ec52a7ae396a |     
   sparc     |         libsoup3-3.4.2         | NOK | http://autobuild.buildroot.net/results/113ab714fce41687778ce984c7e2498840f57e3a |     
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/6b056ccb6060fb0a7de0fc9292624572795a1a3b | ORPH
   sh4aeb    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/47d0bd8ddb7c1494d15c790fce9165ea35573519 | ORPH
   mipsel    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/f800ef7cc0398611bd760abcf2b0144a8f808728 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/053a0bc2bdd052500f73fe5777a295e8176e3cc9 | ORPH
    arc      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/fd32a70a37d27c4de201702100bac98f44feb6d6 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/7a84d5ec5337f671ca884abf64ee85ad39558049 | ORPH
    arm      |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/0df772f8c3508f3593c764d7a9e3c1afdb49982f |     
    or1k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/60215b985137f524352326da3f054f6bbc5ae1f2 | ORPH
   s390x     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/1a022da81024fa56e71c0203ad58dcf15de57c8b | ORPH
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/3f3cf42c9b7665a44a8751703365fc05c8452f11 |     
    i586     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/ac56cce97613ac5a66b3826a62df2488cbe50545 |     
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/52406ba98be7b205d47846c4c3dc0532f906d2ae | ORPH
 microblaze  |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/570042111f137cf9c8b352734f73635dbed3e0c7 |     
  riscv64    |     openfpgaloader-0.10.0      | NOK | http://autobuild.buildroot.net/results/e7f04cf486546238e973195f5fea263535861de8 |     
    i686     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/159dcac966ba87ec2b85d8cf481155be8ca2c9eb |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a97089b3474431c84a7c3cb9d8502846d9ca78a1 |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c0b22705373b2f4546738e697dd851593c1e72da |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/8ca3b486ee44648ccf716c2c5181f1c86c0ac6b5 |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/af96c703c16320feb856da2c37cf72abd185878f |     
    arm      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ebad068a18cf0fd9bbedf21bd5a90f3b5659e8ca |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/4b0e089c033f31cceebf57a8de5fa9b6f2d624b8 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a15f131a81c688b82e7bf34ba077a44b93a518de |     
    m68k     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/dc34c458b985576f5b5709511ef318bca6af224d |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e878fd6b45123cd2fad57b4a5e1c1ed34a162241 |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/403fcc69443b073933f31aac6a6e5eab4d321986 |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/8695a8fa194c6f60a3dabde66f318279977381ca |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/b364c1201137f67a558d7ac44b172009e0b6a2fe |     
    sh4a     |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/849be4fc3686a57257f6611a13fbd349396e01da | ORPH
 powerpc64   | rtl8822cs-758d861bfa4d18d39... | NOK | http://autobuild.buildroot.net/results/3600153fa9d7bb267c835ef896e35cd11458163e |     
   s390x     |       s390-tools-2.29.0        | NOK | http://autobuild.buildroot.net/results/05f5cfffea55a9cb1c2ee7eca3941427cc03eca0 |     
   s390x     |       s390-tools-2.29.0        | NOK | http://autobuild.buildroot.net/results/3e4a888d37b46d11495cc73bc41fbdfb52416c6e |     
    arm      |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/914c78cd31c25c858d6f4debae57e7eada35cbf3 | ORPH
  riscv32    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/e17f00b58ff8fa6c30bb147a112ef910c51206d1 | ORPH
   nios2     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/4675b118d0776d00ee9b9c2a1b90f1cae855c049 | ORPH
 powerpc64   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/7454f257522e63d7593d0d3872462d30b7654bab | ORPH
  riscv32    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/4c5e95784cc82b3a1f25cb929263a6637cd0246e | ORPH
 aarch64_be  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/c47e425d7bbb240e9b59898e88815a8ebad279fc |     
   mipsel    |          systemd-254           | NOK | http://autobuild.buildroot.net/results/f2c194906a0bb77e087f8c36469fecca07c6ec4d |     
  riscv64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/1c74f2a10b0121e99cb4d17323261c3c525f4900 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/68bc2f560ff88d8f0c5eb22d367e9e342ec59138 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/511781eafa3bb616935710ae1191622f0585ffb6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0df80904d22740a7f5fb666345c504aac7129221 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/c2363a82f354a13aba0caf26dc3a07e0763039e1 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f04b6dfb18dbef9232b5f91e5ca09fa7f02274a6 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/8454f9b9a21819c333562f2b29776d6b91282480 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/a42e5423e699606a83c47bf541e17bdea0e4325b |     
   mips64    |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/ca9f27ed058eda855ad107ec21896a16dbe26885 | ORPH
  powerpc    |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/dbb71479c221d25bafbb10bdb4c8f220538a7302 | ORPH
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8f583268d06eecc58bb692f6c4905aaa56463514 |     
   x86_64    |          xvisor-0.3.2          | NOK | http://autobuild.buildroot.net/results/798aea4e7e2d35ee60b503a3b6b61d6c9ac7a8c2 |     
   s390x     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/b494e94feffc06c92e9643503163613b0f9970d6 |     
  powerpc    |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/f47a36a91cb86d4b51ce53aee909ba6829facc3e | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
                xenomai-3.0.10 | 2 
                   bird-2.0.12 | 1 
              host-rust-1.67.1 | 1 
          lttng-modules-2.13.7 | 1 
                      poke-3.0 | 1 
   python-pycryptodomex-3.16.0 | 1 
                  reaver-1.6.6 | 1 
               suricata-6.0.14 | 1 
                       unknown | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/bb8a8798fdbe434bd8e4e942f6030e6d22feb96a |     
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/70b9a117b225111e4408dacf046f73432ebe9b8f |     
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/bd9adea5bf301db0ca0fc72670efa40d28802060 |     
  sparc64    |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/efb53678d2b45c8f4d418fa1d1e8d8b98952bdfc | ORPH
    arm      |  python-pycryptodomex-3.16.0   | NOK | http://autobuild.buildroot.net/results/cc1adc4890e4e667773e5f95717d3d43f7dfdb36 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/a9f931ee4f58f18fda0330228b6a13dc32527918 |     
  aarch64    |        suricata-6.0.14         | NOK | http://autobuild.buildroot.net/results/ae8265d8c2bb754f682e3a1eda72844896f54645 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/7e2b72076d2b1c535a78f51f26748ddef4b45b20 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9cde125ccee9073b79cdeb19699fe0ba4b0c29ae | ORPH
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/30716304a3d5d2a75d422e015f60aa9058887d16 | ORPH
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/149bb05cd384c0cc3848fdaa6d6bbba5d817d7d5 |     
 aarch64_be  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f513841dc711ac5198d0a8cd1dbc298808360dd7 |     
    arm      |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/1e5cadb01fe8dd0326cbfde1a2eadf046d0dab57 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 3 
             util-linux-2.39.1 | 3 
             batman-adv-2022.3 | 1 
                host-go-1.20.8 | 1 
              host-rust-1.71.1 | 1 
         host-sentry-cli-2.8.0 | 1 
                mongodb-4.2.18 | 1 
                   perl-5.36.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/c1a7a57b76952b22df343810982903befed25796 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/f2d53af8d935cd75bd4e49201c24764d6966b17a |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7ffe9d26000dbb1189409bf642be4e0935535512 |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8d421857d2a45caec215e6f4ae745332625d9376 |     
  mips64el   |         host-go-1.20.8         | NOK | http://autobuild.buildroot.net/results/578206def12e7645d443d5f38a28d4b045956672 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f6826415ba18f1162dca4b06ad9a7d3a68e53712 |     
   mipsel    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/efc6eb9d63e1cef24154967e31f7c3ac0705b881 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/8227f4ca55d8cc2c1872e2658feb60645e86cfab |     
    arm      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/d0a39e4e5787a19e2c3f1b73bedd1bc027d81c6a |     
    mips     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/662b3886dfc53d94e99577511c4a2d2a8c74428f | ORPH
   arceb     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/47879811b223a7f4a50875c82718432e6cd4a8fe | ORPH
    mips     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/532ebd6c1a0dbcf83c6d82f689139220200d129a | ORPH
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4a2eedf13a357b638df2244bdf1fa43365742b34 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
