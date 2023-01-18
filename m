Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14805C004D4
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 06:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7025C81770;
	Wed, 18 Jan 2023 06:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7025C81770
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pci9lcvM9P_X; Wed, 18 Jan 2023 06:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10DFA8184F;
	Wed, 18 Jan 2023 06:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10DFA8184F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EADA41BF20B
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 06:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFC0C40399
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 06:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFC0C40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ezzkyf8B5n6b for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 06:59:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C45C400AF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C45C400AF
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 06:59:38 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99CD81C000C
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 06:59:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 06:59:35 -0000
Message-Id: <20230118065942.AFC0C40399@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674025175; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4qAjwIZVmZl9oo0kU/kksIdnrQ+0XzUIMbtQAovBAqM=;
 b=QPo16ivQ+hJhgYUvK/8m08D3klhoaRd+vUl63qKrhb8kiUN8Sv1P223vyCxz4TqSlWg0sC
 lgFmwfc24pEt6Zuqx37NHc9B+Y0L9K+SRhJIVNC7kgdlPYVs9ZBA/1a6JJFAbStxxGCrm6
 erx7JU/sWMrg8EMGENK0RK9+Cjj8cab4i4dlr+MgyfD/xXRK5MVHbMfWxd95BwZXd1VVq4
 tGtW19xb3HF5UtVNJ39aphznrjcXDUXfoqwagfYpeeVf9JqZKrhIf5ShZ1y/xpCW1KZ7+v
 pTGCYVdWr3qBJL+w8PMpTwtIA4K+EZUe4Z63p3w3BAZsyAAu65pP00TBecsYrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QPo16ivQ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-17
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

Autobuild statistics for 2023-01-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  0  |  0  |  4  |
  2022.11.x  |  1  |  2  |  0  |  3  |
    master   | 139 | 207 |  1  | 347 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 17
               host-fwup-1.9.1 | 16
                    fwup-1.9.1 | 14
            host-binutils-2.38 | 10
                    opkg-0.4.5 | 9 
                    pixz-1.0.7 | 7 
glibc-2.36-81-g4f4d7a13edfd... | 6 
         host-sentry-cli-2.8.0 | 6 
                   linux-6.1.5 | 6 
                     xz-5.2.10 | 6 
  gobject-introspection-1.72.0 | 5 
                host-go-1.19.5 | 5 
             libgpg-error-1.46 | 4 
          linux-5.10.145-cip17 | 4 
                   perl-5.36.0 | 4 
                   ethtool-6.1 | 3 
                gerbera-1.10.0 | 3 
                   gvfs-1.48.1 | 3 
            host-binutils-2.39 | 3 
               libglib2-2.72.3 | 3 
            ocf-linux-20171122 | 3 
                  zabbix-5.4.9 | 3 
                  cairo-1.16.0 | 2 
             dahdi-linux-3.2.0 | 2 
                    dust-0.8.1 | 2 
                 glibmm-2.68.2 | 2 
            host-binutils-2.37 | 2 
                  jack2-1.9.21 | 2 
                 nerdctl-1.0.0 | 2 
                    norm-1.5.8 | 2 
           python-numpy-1.23.5 | 2 
                    sdl-1.2.15 | 2 
              traceroute-2.1.0 | 2 
                       unknown | 2 
                 wolfssl-5.5.3 | 2 
                  acpid-2.0.34 | 1 
                    attr-2.5.1 | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                    bat-0.19.0 | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.16.33 | 1 
                bpftool-v7.1.0 | 1 
            bridge-utils-1.7.1 | 1 
                 dhcp-4.4.3-P1 | 1 
               ding-libs-0.6.2 | 1 
                 dmalloc-5.6.5 | 1 
                     efivar-38 | 1 
                 fdk-aac-2.0.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                      gdb-12.1 | 1 
         gobject-introspection | 1 
host-gdb-arc-2020.09-releas... | 1 
              host-pahole-1.24 | 1 
                    htop-3.2.1 | 1 
libg7221-dbfc29d4806ecdace5... | 1 
              libgcrypt-1.10.1 | 1 
      linux-5.10.145-cip17-rt7 | 1 
          lttng-modules-2.13.7 | 1 
                  mender-3.4.0 | 1 
                    musl-1.2.3 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_2 | 1 
                   opensbi-0.9 | 1 
         python-greenlet-2.0.1 | 1 
            quickjs-2021-03-27 | 1 
                ramspeed-2.6.0 | 1 
                  sscep-0.10.0 | 1 
                 sudo-1.9.12p1 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/8727a1a5a70efa903da753aa7e85e209c44acd0d | ORPH
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/8d9dcf5d7e260be1a54a1a2f09ae32b02c02b7a3 |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/7cc55a9e53a2bf1e3b195fb12b0926d35a7faf89 |     
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/067106dd0cd772443cab21f288829d5bbe91f83b | ORPH
    i686     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2a489d50877311f95708c1ed1a8bb4c0cad9c031 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/aba1f483076b478be9cf067f0863c4551c9a130f | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/92b809091d0a40505eaa121bc0d04b5b7bc31d62 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a693a90795c85c6add130661148b1e3a1a8f1978 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/efe3f01481c1ec96f5550f1c901ab1b752e721a9 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/29e543a2cde9ef23204fea94f161191968117d92 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3c1dfd6d1272b7ef5abfa8983382b49fca4f9ee1 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/40187b93159191eeb5360d7aedc8f9fe428e8e68 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f600de73881c3eb9f0982ef2b5df1cc7af820739 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bce3d8f68f35cf6daed59707f94f3be785ba6ff8 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4aba6bf51cd49fa1a120e38f59e26eef8970f169 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4ffc6bd56ff605b32b316e037b07cd558ea22a3c | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/cfe67d866a1b698bd45d0f046c424950fafb12da | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4d74bfa7b112dccd62b5a0182f8e93e69346e1d7 | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/cc97f94c82c9c73ff9bdf3cab849f70b64936bce | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e98347d8c3e8c5fd5a1d4fa2685465730ba06d95 | ORPH
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ca7dc440d7e0fe6ba945cfca3faf3bdaccea4743 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/9e617f63c362eb5e5d1b9fcafb2ec3ea93efcc26 | ORPH
    sh4      |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/5a189713e5d5d31fe0b81fbab11c9d4fbdfd1aca | ORPH
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/a821b50fb8736ef38b22d793e058a02f3386cc1c |     
   mips64    |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/767e85898e11888899c5d8a972704d5c8e203190 |     
   armeb     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/7f7002525e9c5c69564803b2ef30a2e1a287020c |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/f6ae2165051147b07a0f823794f2e4444bfea006 |     
    arm      |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f9c4da7f07b255af17b377269b577b592ed57484 |     
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/bced260003d2379f810829c3fa8b4c4ade2ce16e |     
   sh4eb     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/59d2531109c74dfdf9bd6d461f7503aefa168f62 | ORPH
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/e2e99832c039a70a5879def55ba802935e9fc322 |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/1ee019659eff18146e4acc24d438064fc094dc6b | ORPH
  aarch64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/e75f90f0b9564c6a44f354c70ffcfe53e11c2a22 | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/3af4daac8dea4dceda5278a86fc3dbb46b52c5f1 | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/1fe432f113bcccd8ded46a647045b32d4fadda40 |     
    or1k     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/f1a0122aba415ed6a3ae6e111197a191ca23e50f |     
    or1k     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/c09dcd75d6094e83c722f96415093dc557e918c7 |     
   arceb     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/b706b2e32f989173fa191440aba253bc1939a995 |     
   mips64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/b72a8c63ac782ce2191281d338975fc73dd7b6fe |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2c1285078e4512a58ba34f9789c340e00fd0b498 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8fcda56dc116f2de54e60d1423a55538cbf9e3b4 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a2353c2df0635e160e2ecf1c7f87875f272d7eb1 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/83004a6f923fcbf4eea7fe3f11ed35ed51edfa55 |     
  riscv32    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/87ed3002501d44713eb9fd8b27e117036af1a18d |     
  mips64el   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/a9cc2021b71bb5b02558b2314cc8431efb555597 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/218afc24ffcda5300bb3e85678eef42a2c853d05 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8510c6a2669b1b7bf29ecb2751dea075d297c529 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/595545746ef3acf399714ea962230ae12e030650 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f83f2900d5af5269128b62d4f4bde15e8fbfc936 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f2ee274d02296f5a8ac5b932dcf61858c0a555ee |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c13f1da18220cc3df24deb2328fccbea9932a2b3 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c2bdd3cef0ff25bea331f5f048ff835911399fb6 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ff4f2611c21d2a217807cec5a73a1bd99607dec2 |     
   sh4eb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e34e4c30bca7929c08c84740ca7ae03887d78421 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3d7767cdc6957270cd7fac9d607d2c79eba4afb9 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fac96701b0e997f770548e22067a438b7fcffb07 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dd4980e562efb724093ea9887c4779b01a863afd |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3f7b9e7eb15d85d1d95bb9134cc1dd99b0a251e9 |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b2a94464715e14e9f2554c5bddb63406ca99f974 |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/3207bcccd0e88a862cb37c2c71df8bebf30ea526 | ORPH
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/59934c0e42b78779239ce52f05e1bb1a4db3a65d |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c922290962211d87775d17e4f87ba7ef60583ff8 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e5f273c5f5ea89be6a9ec2c2e2abe7f628b64177 |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/df43ed3c542f457c5afdd54b0321fec4b15081cd |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1361fcf489e9125fccfd630a4256008bd7aba135 |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/cbce22afe662cb99529f83425675db9ee414916c |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/22aea6d3a861dc9c70c4a821d85cf4d0d8a3b4db |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/26e17977022fdc83c68a55765ac6c4959082c554 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/493e2afe5ed3e62a8330e13f19b2c2a46680b4a4 |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/20f414b4e0a83ad8822ac58f4504df84c8191889 |     
   nios2     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/dda5f1a326399544232d12454fcacedabcfde001 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c4aafc6ee0c1d06d51b9e333f0bfe474d046d972 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/40d243eb1cf19b05582fe128bbc221871e8a1eab | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6c21d2a5e0b4c45c1f13367ab6a81893229d6033 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c6f291480d964060a2b452b4539b973349fa5455 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/873b60063896c7f552ea263465e6432d3fb3449f | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5c2338caba2b9bda1777869720dfaedbe7858938 | ORPH
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/a7f9da79612dc4411f6dd842c8e93491939d0972 | ORPH
  riscv64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/4623a0f35c28cfbfc9f3d409ba6670a8ef611356 | ORPH
 aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/7db8aeb0a7cb2bc07de79baa42ef31e62507fe08 | ORPH
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/42692343fb5265a095b327184c2947d07c84c253 |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a57845f0d57d6c2576c721f3ccf1fcf94cec57f5 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/288c42aaea6f6b90141450a7f91f86d7ce0dc754 |     
    i586     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2ae43013728dcbfbc94262d26cd22df6e9b6d0f0 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5ac9ec5a3d25339210734af2034e975fa6a5fca7 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7bb57fd6c70d28e6d7b51ed6c92ff3140b74fd38 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/61ccaca6425fafea2e12c412c44c7ad2d92eba12 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e9436424d7b14d2fd5e4a350e484363962f33a4d |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/da5a2d19fe3b81750ec4053860940fbed8de62ae |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e6a226c117537ddd05c76b75f3448ba0565c3417 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/63eae537dd76f9876d5c9ed721ff2e2e06a7e208 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ce12677b2aacf140c0f6752f8206a23ca8b73ff1 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/94c54deb42a736afd38fc80b4aaf1aad35269be8 |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/46e6dd394a1c853dce69f04214dc7998139c1940 |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/95d70fc62e4338198ed36cbd212ed46058c52884 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7cefb1ce9adedc60d4092fb46683d608a37d125d |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6081bc3a4d2b47529cdd4fdc81541b1b0cd92f1d |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d8024b0b7f58b0debe1e770ad619fd93696d275c |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a0fefa872d076ec0fb96905b52abef4b514485dd |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bcc54675667fbd98f1282281912da82d46585679 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b48244ae2fbbf4e00d2cadab9a7d747dd72ca406 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/faaf97270eebd1bf1f616738209b91eb970f5247 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ee779ead56afd3aa58c8e5cd88416c479a79146d |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c42b5a55eb7f314342a67739f5c351e0b38b703b |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cf413bbff3067eaf414d94e8d9a8114146b0cfbb |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b9a82a1bb578caf701968cbad9137350c701d1cd |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/20b6af6e5daaddfb62a27cbb606c6901f2fa9f9b |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5f92fa62117ac3090ef034a5b6b2cec795631957 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/27b1e626bea88b3764c061ad29caaa60a18310be |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e340f04719b3ca3ee2a2cdecb5c5f1b5c0e8de78 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/683ec79655d89afe98146dbcb498fa24a986c79b |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/08bf85db43f75df98a46d22c169f189b4390140e | ORPH
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/093d0cf34e9938b3abf41ec42a031741a0c54574 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/7267e64ce06f68859cb1b2790e99a358cd0770ad |     
    i586     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/4e4f21e9c7e84e817ef1a771807d2bd8e7e3b28c |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a31df6cc964a3f59e6eda5dff9b8ec065ea9a47d |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/6e1c7695c2a717a83f469647c29104015a510c2f |     
  riscv64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d9d88933ad4f2c68037e8a2be5c8f180c46bbe03 |     
  mips64el   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/95e5ce163e9cea2648b12637f11d9ed741399967 |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/13c3c560d05be7313f28920cb7d969e2e664398b |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/ad2cee361b3eb4c0dcca4d2b4d6c1a4a6140bd6e |     
  mips64el   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c21faecae54f800deb34314aaa55b2b8d009166b |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6b65649773de4f9bd937c22a5e03f4df395f88f2 |     
  sparc64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/24e272c282c7de09d210cf0c990fada2fe4b9885 |     
 aarch64_be  |           htop-3.2.1           | NOK | http://autobuild.buildroot.net/results/99e056d9aaa1a2f26e0b72add0e5699188fe6bbc | ORPH
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/fc4214827714881100c340a07d0ee41d69cd07ab |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ea3973c91259c2da3f3d9f33221915b4c050d690 |     
  powerpc    | libg7221-dbfc29d4806ecdace5... | NOK | http://autobuild.buildroot.net/results/77709090862b63a0656cf09bae1bf552d56552a1 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5da5ca017ec466c69b81270a5cf951ad1650b9e9 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/36303b50ea0792a3d08b8d5f454eda9b4123795d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/55316dc40f24824c3a0d1d2c9838d1fe13087b8f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/90cf42e7980f9a1af46d166e35ee6ab15021f732 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/336fff7faabc7ad6aed0c4a9330265d17fc8754f | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/f81ac621f3a03d1499a023dc330ff78156b44913 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/4c0f0abb898baaac37da087ad6ec0b704ded0b51 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/2552ed0027a45d58336d05ff9927808d09ba5a6d | ORPH
  mips64el   |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/1c33058ad4a0e0f185b527b80ea6bbb124c85161 | ORPH
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/4920d3778b54f912764eec358e50a9a4affce842 | ORPH
    m68k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/a9b8490e9d17a8999fe05163a29f15f43c6db66f | ORPH
  powerpc    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/3936a0385f8f6f30847d68e343639b2ffde4ea3b | ORPH
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/1afe649f53980acaabf3c9fca9c1dae413ff1d21 | ORPH
   nios2     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/6c441f5f2031bb7f5f78ab64ec0705653a1c3ef7 | ORPH
  powerpc    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/826cdd5192533ecbd70a82b97d36c9e780c95486 | ORPH
    m68k     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/ec8792de0ee4e84df7aed67d1e16b3fcc2b67000 | ORPH
   mipsel    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/5d38a96b9a7c41154c1ff72fecb92ccf8f032c77 | ORPH
   nios2     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/673fae37b7e95ef4a66532e5aed47254f4b76932 | ORPH
  riscv64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/17828b0fb0b8fcd4973a203ef11b3c8088efecdd | ORPH
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/3209abb55b85b087f135c94c3973cfd83bfebda8 |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/f9ebff91c8d35269a70184dee7cad5a3be4cba79 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/84ffb27953e7aa21d26f8a02dcf51f91fa2c3fb1 |     
   s390x     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/5fbe82e1df5cb57fc2b60e28d92a1e6a13745e26 |     
    i686     |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/d30c667789d3c01a2254341d0c70f150fed1b37b |     
    or1k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/239e78435d6af2e378d634b14665405640e2c0e2 |     
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/410d6b08caf0545ce99ab7b38f41c346a4ec9427 | ORPH
 powerpc64   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3365946022cf125e07a5419b80387cfb0ad9d634 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/154b7a9cb5de341e560b3e12f69e730642502fbd | ORPH
    m68k     |          ntpsec-1_2_2          | NOK | http://autobuild.buildroot.net/results/41288d8644f90b6f4750bdfd963a78ac9f5784a9 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/7866c489601f6e80ef6a61085b9d5e7a098b6024 | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/404a951bffef0265179eff4aaaaf9fc737452a19 | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8e2da1952684420cfdfb5b57b19251bacf54ffe5 | ORPH
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/6ee345fbdaaf9969880997ccbf0e07a54503384e |     
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a1637c2097e1bd4daf7a6942e9ffcf1cf52ed261 | ORPH
  powerpc    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/9cde0cc43d5ade74435aa28cd24b705f2114789e | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/c5100b70f8a6df434c93b91e5781812316ada4d1 | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/0a45ef0c83e1d3a3737d3b35b2eb7479f2cacfbb | ORPH
    sh4      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/cef6bb3dbc739c1a3a5579a77f52c35c34fce387 | ORPH
   s390x     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/9eec6dfb209e75932a6e4276e0b3fd4d2d87cc11 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d571eb87dfcec48db601018f9fb9bd8e8d7a7e54 | ORPH
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/08de21afaf737248ba92b1879c42093652c0b64f | ORPH
   s390x     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/9e9b1de9eb6e1339dfafaf33e8a1c9d4a04dc149 | ORPH
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/a929a9ac67c421b3966773f0a9952bfe48bf1d5c |     
    arm      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/50b5e1ddecdbbd07962a63a06e21d2d9223362e9 |     
    mips     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/2329cd4d2b9f5823e500e08d7e92931a0e812c97 |     
    arm      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/405a97e49e43a2f83eb91dc3d1d25b0d64994f54 |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/f1e8f12fc877a53115bac5519447a5d3daf6e181 |     
   mips64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/7dc26b8628eeeeb1218ec33550cccec6933523b5 |     
    or1k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/3e42a2d676f796e8abd0b9380c3995711e21cc29 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/7cb54bbf568c535784ffb6d4cf7d4f5aaaec8996 |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/04056bd473244f77372736dd3da3c2a0bad220ef |     
    i686     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6f428bc39773c1e9ebb651ad39c0f6b5291de6bb |     
    or1k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/852d0bbaa3abcf1a77f5d62abba5132484974c1d |     
  sparc64    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/6e4e273be79b19dbb8516c1c7bfa44589cdf4cb8 |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/a7808e37488a493a29fe0f043cb45bdb1d932c4d |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/2c3589ab015557ab0321cccffe0475c7b94b4535 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0386a53832139451fc1adabb811c94abfdf20125 |     
    sh4      |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/fc226c5c8825311687655638acb778aa4a66170a | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f0bc8d9b9587cd21f361a872f91128ebec0dc408 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/4d88122e21a46a05404afe1ef17f08137b361a6d | ORPH
  powerpc    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/54cf8729749a738b83199f264a797d5da74d843c |     
   sparc     |         sudo-1.9.12p1          | NOK | http://autobuild.buildroot.net/results/9b40160803ae00e5e03b8bd20c9f9ed85cf1b27a | ORPH
powerpc64le  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/c165318bc3ba52458a5d9682411a013f31ccf964 |     
  powerpc    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/6fc9194ccf1bac8f17d096ba342a9badb8abbf0f |     
   sh4aeb    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/78c0ac8b2dc6ac4e99fa535bcc5f3e5925a5ac02 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/95185ed8d73b70348e7035a8fbc49fd90659d432 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/072c3f48520f702daa1b07776cea49f35b75bb8a |     
microblazeel | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/042fea841945c78d1ab957d721abfcc169d2413c | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/b545834a508b3bd0ad085401f3300b9e96270b13 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ebb331c46a2fe3ae6e6051ba31e911c08ae230b4 |     
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/f2c52238df97cc4c13117d8dc1423235231a094c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/4a560ef6eb214b30f13136b67d35885020ce944e | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/405ae3bdac07bf6c6ba47b7b39e1697d666df468 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ad7ae1f5a86198a17e9fcacffdcbf9efee89409a | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/896cd8809bb70eadb9033690e1d7af22efb03d9d | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/18a72a5d2bf73af6a1dab791a8c3a35c95ff7358 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/fa93d7bbe9fdb4453a4a9e9aeed9bc0f52b21ecf | ORPH
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/a09359984c713be60ec046c5521e1c191a9ed321 |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/258c76dad1ccbb6906c79e06cfbfd7dde2129c16 |     
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/452e3f3797a0f417c1fb5ac5a65335fa34671845 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/03eac71759f3afff742b4dc448269f8491fb7c90 |     
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/364d5211ad02cc597b5d0839e426845bc009b09f |     


Gitlab CI results for 2023-01-17
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965967  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965968  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965969  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966273  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965733  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965735  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965738  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965739  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965740  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965988  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965990  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965991  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965992  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965993  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965994  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965996  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965997  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965998  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965999  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966002  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966003  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966005  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966007  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966009  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966011  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966012  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966013  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966014  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966016  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966017  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966018  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966021  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966022  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966024  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966025  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966027  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966030  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966032  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966033  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966037  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966039  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966042  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966045  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966047  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966049  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966051  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966055  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966059  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966060  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966064  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966065  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966067  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966071  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966074  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966075  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966077  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966078  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966080  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966081  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966082  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966083  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966084  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966085  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966086  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966087  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966088  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966089  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966090  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966091  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966092  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966094  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966095  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966096  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966098  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966099  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966100  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966101  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966104  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966106  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966108  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966110  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966112  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966113  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966114  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966115  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966116  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966117  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966118  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966119  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966120  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966121  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966122  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966123  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966124  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966125  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966127  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966129  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966131  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966134  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966136  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966138  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966140  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966141  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966142  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966143  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966144  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966145  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966146  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966147  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966149  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966151  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966152  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966153  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966154  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966155  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966156  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966157  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966159  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966160  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966161  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966162  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966163  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966164  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966165  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966166  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966167  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966168  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966169  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966170  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966171  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966172  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966174  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966175  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966176  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966177  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966178  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966179  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966180  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966181  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966182  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966183  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966184  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966185  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966186  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966187  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966188  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966189  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966190  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966191  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966192  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966194  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966196  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966198  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966200  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966201  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966203  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966204  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966206  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966207  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966209  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966211  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966212  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966213  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966215  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966216  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966218  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966220  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966221  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966222  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966224  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966225  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966227  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966229  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966232  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966234  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966235  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966237  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966238  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966240  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966241  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966242  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966243  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966245  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966246  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966247  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966248  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966250  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966251  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966252  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966253  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966254  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966255  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966256  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966258  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966260  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966261  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966262  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966263  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966264  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966265  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966266  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966268  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966269  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966270  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966272  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965970  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965971  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965978  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965979  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965980  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965983  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965985  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965986  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965741  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965742  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965743  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965744  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965745  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606966275  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965599  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965746  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965747  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965749  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965750  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965680  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965709  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965722  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965752  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965760  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965774  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965776  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965753  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965756  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965762  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965764  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965766  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965768  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965795  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965797  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965772  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965800  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965780  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965804  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965784  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965807  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965809  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965770  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965802  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965812  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965792  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965778  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965820  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965945  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965788  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965761  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965775  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965777  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965754  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965758  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965763  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965765  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965769  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965796  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965798  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965773  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965801  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965781  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965805  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965786  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965808  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965810  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965771  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965803  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965813  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965793  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965779  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965946  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965957  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965790  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965816  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965818  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965822  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965824  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965829  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965831  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965833  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965835  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965837  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965839  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965841  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965843  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965845  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965846  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965847  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965848  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965849  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965850  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965851  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965852  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965854  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965855  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965856  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965857  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965853  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965858  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965859  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965860  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965861  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965862  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965863  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965864  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965865  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965866  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965867  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965915  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965868  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965869  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965870  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965874  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965877  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965909  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965871  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965872  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965873  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965875  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965876  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965878  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965879  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965880  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965881  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965882  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965883  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965885  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965886  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965887  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965888  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965889  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965890  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965891  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965892  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965893  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965894  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965895  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965896  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965897  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965898  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965899  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965900  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965902  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965903  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965904  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965905  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965906  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965751  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965908  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965910  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965911  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965912  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965914  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965916  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965917  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965919  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965920  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965924  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965923  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965929  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965930  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965933  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965934  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965935  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965937  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965938  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965940  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965941  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965943  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965927  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965913  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965944  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965947  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965948  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965949  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965950  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965951  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965952  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965954  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965955  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965956  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965958  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965960  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965961  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965962  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965964  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3606965966  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
