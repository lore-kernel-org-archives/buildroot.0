Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9098DC05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 07:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6F981E00;
	Mon, 23 Jan 2023 07:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F6F981E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DF6FfAKB-2Z1; Mon, 23 Jan 2023 07:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2BC481E2A;
	Mon, 23 Jan 2023 07:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2BC481E2A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67DC11BF5A9
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 06:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3728C4168E
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 06:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3728C4168E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IojbRF-G3fe7 for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 06:39:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A554168A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31A554168A
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 06:39:43 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B92B1BF204
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 06:39:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 06:39:41 -0000
Message-Id: <20230123063949.3728C4168E@smtp4.osuosl.org>
X-Mailman-Approved-At: Mon, 23 Jan 2023 07:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674455981; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=61VS8QfQSngyk/LS3TD+j2dCQ0UX8xgco6mpnqRSH8w=;
 b=Zn0VX5ZDA8ZK4JT27tc2+tqTOs7wUF4AT0hH1yn8CIFPLHlxrCzhuB+F4cSw2EB5bfJNGj
 8t+kbRgigazwv+ICF/PKJc0v/FlbBlpxaZ6xhzE1uIhumOlh1v/NQXWCkAnipXKiWnCE9j
 OxiseWNYblkLSXo79e9t/ptD41MMLUv85gmpu/o5TBZaShQuV6eeSaAwk8FxMnZakg4jAH
 IoUqW9wihq4xob84HmxH9mRVdqef0mUGwfXnmrCC0XIJiCIUvg9Yff/ePLZ3Scomor2EXd
 SN/98JbFhpbzvjsMWVOVXPUvtCvo7g0gZLzFr37j/aHCIO7v9vchTlVMv98fzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zn0VX5ZD
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-22
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

Autobuild statistics for 2023-01-22
===================================

      branch |  OK | NOK | TIM | TOT |
    master   | 101 | 185 |  0  | 286 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 16
                    fwup-1.9.1 | 15
                   bash-5.2.15 | 14
                     xz-5.2.10 | 8 
                   gvfs-1.48.1 | 6 
            host-binutils-2.38 | 6 
         host-sentry-cli-2.8.0 | 6 
             dahdi-linux-3.2.0 | 5 
                    opkg-0.4.5 | 5 
                    dust-0.8.1 | 4 
                host-go-1.19.5 | 4 
               libglib2-2.72.3 | 4 
                    bat-0.19.0 | 3 
  gobject-introspection-1.72.0 | 3 
gummiboot-2bcd919c681c952eb... | 3 
            host-binutils-2.39 | 3 
                    pixz-1.0.7 | 3 
                  xxhash-0.8.1 | 3 
                  zabbix-5.4.9 | 3 
           crucible-2022.05.25 | 2 
                   ethtool-6.1 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
                     gmp-6.2.1 | 2 
              host-rust-1.66.1 | 2 
                   linux-6.1.5 | 2 
            ocf-linux-20171122 | 2 
            python-bunch-1.0.1 | 2 
              traceroute-2.1.0 | 2 
                 wolfssl-5.5.3 | 2 
                alsa-lib-1.2.8 | 1 
             batman-adv-2022.3 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                bpftool-v7.1.0 | 1 
                 dash-0.5.11.5 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
                 fdk-aac-2.0.2 | 1 
               fftw-quad-3.3.8 | 1 
             flatbuffers-2.0.8 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                  gensio-2.5.5 | 1 
                gerbera-1.10.0 | 1 
            host-binutils-2.37 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-runc-1.1.4 | 1 
                  jack2-1.9.21 | 1 
                   json-c-0.16 | 1 
               libdeflate-1.15 | 1 
              libgcrypt-1.10.1 | 1 
             libgpg-error-1.46 | 1 
                   libnss-3.87 | 1 
                 libpqxx-6.4.5 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
             lirc-tools-0.10.2 | 1 
          modem-manager-1.20.4 | 1 
                    norm-1.5.8 | 1 
           openjdk-11.0.14.1+1 | 1 
                   pcre2-10.42 | 1 
                    php-8.1.14 | 1 
               pipewire-0.3.62 | 1 
                 pixman-0.42.2 | 1 
           python-bcrypt-4.0.1 | 1 
    python-cryptography-39.0.0 | 1 
         python-greenlet-2.0.1 | 1 
           python-numpy-1.23.5 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
        s6-linux-utils-2.6.0.0 | 1 
              strongswan-5.9.8 | 1 
                 sudo-1.9.12p2 | 1 
                  tbb-2021.5.0 | 1 
toolchain-external-codescap... | 1 
                 uclibc-1.0.42 | 1 
                   ulogd-2.0.8 | 1 
                       unknown | 1 
                  xvisor-0.3.1 | 1 
                     z3-4.12.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/1d1a0b6b72a4849ca1446dab6cd0d1ea809636bc |     
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/74b8ed702ffe27d25c38c5f167c7f6d9c2c06fab | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9bac21d6e20de5e43dc405f05ea2dcad034ca891 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/05389055f198753f80d1a705bcb1f32e03e32348 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/534187de744a2b649776b921d3f97d146f7be4e2 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ca114801545a5494124f06b78757524a52dbe715 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ae75b1ff7e435c60b3ddcce29e3c59a6827d10c9 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/08209efa8e8df57fc964710b3b362e7e0341fe7d | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9ead4a3f7b23bdb51db9c52cae42e1b17ade8e04 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/436d32748171557d187244b9f657c78e8e7b3ec7 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/19565c62c07abaec5e7e8c094733664065967dc6 | ORPH
powerpc64le  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0256c3888b9ed4620f7dea58faa4f4867a19da64 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b612c8345a823588b031f13efe13ec96d9f94b5c | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bf3ec47c5ff7760d827931928a25000ee6b1f50c | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/55f31c3e4c86c0560d9e247f378c0ce43251c617 | ORPH
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/da68b8764f62e12aee6d61c1a7267ab300c8adbc |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6f02a600f55d8293f6ea7fa4fc7addf41e422ff5 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e561ec5fabd4dcf7527c0855eef6d977dd2a066d |     
  mips64el   |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/88c63398f2fae1b240a146540db7f2ecca3faedf |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/fd83941ab9eaa94ca6fb90facd6f0d4071b73548 |     
  sparc64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/a250c79e8f643c0592846e66c69da79f35aca7d5 |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/3217c212459eda4364fab5e7482f670ce8741d68 |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/6f9927c3eca508bca6cdc8dc4d225ebdfd489ffa |     
 microblaze  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/44496204a439446946b9ca5c3d321cd74da2844e |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/dfff341ffb074498bacc1fd7725ec8377f1c2511 |     
powerpc64le  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/3909f730e60375016631231a13ca9bb3c5d093d3 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/ce3f755334052f4b1bd6ea93922f07fe11a77a58 |     
   armeb     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/1a017d078fd5f1cb712ff36fdc1cef367f9b6cc3 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/73b626c172058dd9fb2bbfbae6fd4c70c2a10ed3 | ORPH
    arm      |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/8482bfb3fe30c81d573d0336b8fd6d707a07d1e1 | ORPH
  aarch64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/582367e4c84edd3c01210eaf39315da1c0d85dbf | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/c17aecb92ee4d3df27225e6aeace0da9bffd7c7c | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2a72e1aa8572de7ef083bba02af2719ad8b91639 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/11a6b95c2948a9d3640845e221e76a72fef30eee |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d122f5ac585d345e3b82ada61048c2cafd71977b | ORPH
    i686     |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/e69886deb6ff466db96043388b5dac7271a5ec58 |     
   mips64    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/e2ac3cc56c70ed3fbb38770a18c65a20ebfc582a |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/15400e1fe13a129df046f4a805e2ad93b3fe9383 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/e8bf27a7409b944169bc7fc1cb51852a8dd217af | ORPH
  riscv64    |       flatbuffers-2.0.8        | NOK | http://autobuild.buildroot.net/results/7f2e7c0f5a1c53a0917eacb00b44808077ae845d |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/8073369989fe0947a55f627dca84a734ff049b17 | ORPH
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0f92793af0bed972b7316909f8689349e29e2015 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6228bdb898fe8154c2665dfe73d685353e8fbd37 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b5e14385fd9276c750834b6b5800453cf868f66f |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7ba1cef8070bdb063a92fa907160f3c766b35f54 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/636708f5d421a204f7576e2ee3685bdef3d0cf25 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bf5841604c3234793cc34772b3f71fbdf491e880 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/cc184dfc2a1718f8c76ad59b4a0986bbf72703e8 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ae6a9e15829c06b51150fcfdb89d112ff36c7875 |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/aa37fc33e13a3e7c99fbdae3e7108021619f08cd |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7036137d6d5926d1caba16c0108fc2e285aa56d0 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/892888bc3f7765e77195c0c2181815eea59a4360 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e4584d484983883bf474c1c1b9348c196c78e8cb |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1f440749341aaadc4994f37c6b07475f4f1e6e74 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bdd4ef9985ea8f158ca905f6d12cfe31e5a7f7e1 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7065f30fb00fa7d3d989af03029b5923eec1cbf5 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/cca258c044778b8bb9f2e91c02cd9bbd0156e8d6 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f90fb25f337dc7f89d334785fc2074f801a299c7 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/98c9fe5119fc41bd44081808789c3755d395d795 |     
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/85cda60a89428912ae63c7e56fc8a18209fa108d |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/95f7fc2a18ca46d34e40a6a681fc042910a215af |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/c099132408579f0e9388f9ba94090196ffebed17 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/041f15a3f551ce68a07a49c4ad1d8ebacd9805f5 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/b6739097cc998573e657da0ce95a9303174a8f7f | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/b21c9098d3b900c899969e9e4c749d2e0c931590 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/11c25170e02c64a862ff102407d5485d99b8d0af | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f1488734bf6ce9dc7203b529b9f3d55986cff758 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7d52627725080a88702eba86fdebabaf37b93ae3 | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/15e7c5da93c8c92c9ccda66674a3987985c21f87 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/1d10a23e706e8b3a4d04d3460ef49ed0ffc01cd0 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/c7966c7847bdd1061f87eb776a90beb367418e63 |     
  sparc64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/57586a59082b5d2b017a97ecfc381fb1052d117f | ORPH
   nios2     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/f926fc18c9363a80fd8024659d4af7d05ee0415f | ORPH
   armeb     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/6cd7fc83ada7cadac83338f1a25a24dc987ddda1 | ORPH
    i686     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/b72170e64f7ef869a67f0f0dafbb712ecad194de | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/f4468f0165c32a16463d368e748d50eb8757cfe9 | ORPH
 microblaze  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/aeb8472edd1a0c50f3c1e7843785a32908020d91 | ORPH
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8a20b4f5a8254f789a55bb07b350dbe7c2a9d239 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/81c6c31cfbbdead980e02565fc006626c0e5c678 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/056745edc72fdd372857233835861aa461762567 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/acda838c84766458d5798c68b063c7e87b5ec521 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e0febb028ac344f48fcb9e6a318b934587738e00 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a6eeecca4c82a34c79adc965597950b5b6826be2 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5f6195182bdc38b4e56ef656d427c0a54a8150e4 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a6c6eefa5b9948e1d4efe07b1f10153b7054f938 |     
 aarch64_be  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ab6c5e37443c01b2b647a0a7e2005b78d7b0bc47 |     
  riscv64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5d5621bd05061763cb25f172b1c91e2031c0dc5f |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ed19788283edd493e96914bb9db1d3c0f06f941c |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/82a4ab2189915826693d1026e580f168e4172bc7 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6fedf9f14022937faf2cd9fe5a8f21900e41bb5b |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/eeaf1f78b1e42bb45a13f6b0b8bbb5aacbc468e4 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e89689874b1545c7ab3c1d32d5fd10893606d5ae |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3e14f39695137dec9eba791199f43b24fa320b0f |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/33b03444145f04f0efad1bacef1e986251ca3db5 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d6df1b3ea7aca0317f0583923b0170735659f533 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/60ae520e4c7d265c1848d88d82720118bf75353a |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/61a7a8b6a4e9abbb92ea763dc38f81a44ef72d77 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b76fa83d8f7614e15b82eb2ae5fa47ac30c6ca46 |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/26fdca45360592bc9e76a8fbe50d80cff77e3c8e |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2c3d779a5428c4df20ea4c2124c85016eec32691 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/07b908c54053b7e52ee080950cb60141fcab9ecd |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a673c19989f90ee560f2c800f88d9ca601d991a6 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/63aab9cd9761c71955fe06bb1114d3c9c544ed44 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/415d814431fe2b9e553e3f6ea3876ed2bf607aa7 | ORPH
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/600a3e3023659de38f08bd91e1d162a5b6aaed08 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/6e2b1dc6e61642f0a7f4e731e4e04b2c4a33d2c0 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f50b346113c62bb01bcaab8ab94872ad021b51ea |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/51fd6074463c1efbfe9cbced4f3c68f23a9c6201 |     
  aarch64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/81d1ea75ad8575b929f39c18d2eba5e1534468d0 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/1dba5d398c8cd8020c1bf61277645070e8dd1753 |     
   armeb     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/b38ee4042fff84e7698e27c9ca202abf3e2f66fa |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/ade0c9f85ed828e46d1714dfa1a8dba74354e4a8 |     
microblazeel |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/5a9028e5986628f498e31c4e39a116c5e6f90ded |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/9c7f14138f2a09ec6c88844e647f8d7c70559d1d |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e6d3186f9697e12f3088d80c79180342c74cc42b |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/67faebb4a3c24d0ab696f5c9a8c08f7bca3d4714 |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/49b1217f2f433c13bdd4310f586bc1f3e9a093ca |     
    sh4a     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/46502a82aa8234eccee381c29aa4fea589c10a5c |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/a03de0b6a34fb1aa944a76f064e0da4befcf77fb |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/c23c6195cf187048c463749a4a185a0eeffaece7 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5b45d5a9ee0e59c0493dc7de71a69310065839d1 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/433633bd094824ee556f5588b4a541023977fc90 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a178fc92ecf6e4cfdf2c8e80518b8a4f049704ba |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6c96857c9852c8d461409a05257115e8b6305323 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/de7c0f1cacfcbb4678b36a807e82a3889b190ac4 |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d127a4205a6d36f3a43e1c5c4614c08e74e3fa43 | ORPH
    i686     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/da4dcaf565fdbfbb9007c1ad48f74dc20691efcf |     
  sparc64    |         libpqxx-6.4.5          | NOK | http://autobuild.buildroot.net/results/100b2f1dd1353ceba6eff5fb113b5e10260979f5 |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/982403df2b8df3d69303a0abaced10b3e5514db0 | ORPH
  powerpc    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/26815db0335cfa1e86018c76542557b5e9dfabb6 | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/b58b2f4ec4c4f24c5c9556113d5808575b6306da | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/ffbc5c511e31685a154fbd8d7c4d71b42d308f7e | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/e86f42e737a3617700ecfd19703767dc9cfe7b43 | ORPH
    m68k     |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/4ace16ef33ead85968eabe8916ff1d23c3b8ee60 |     
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/81b37b62c9ae89524971911c081b4f6f9bafd404 | ORPH
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d6f2aacf94dac78a8af05ee85b9debaa5ce39bb5 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/4886f1119b5131d7e978b2e41f77a8bd4cbcba9e | ORPH
    sh4      |      openjdk-11.0.14.1+1       | NOK | http://autobuild.buildroot.net/results/941970837219261b213e5f7fc7017f679d4f9080 |     
   armeb     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2261870945bc16d8f77c9fbbd627446b0340ad54 | ORPH
    i686     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d7f96451fc64c55875b0e8ed9e1ebe7b350a2b81 | ORPH
   sh4aeb    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5a2d74376ca2847e1aebbb6e460986f9234dea4d | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/cfe0fc9e8193e69f33a9ae5466e20d3e93d6d9ff | ORPH
   s390x     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a797143e984451ed92076c0db207bbd5d9022194 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/ba6ac238c4d7cec24396f2726188189aa5020bd9 | ORPH
    arm      |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/0b73ab8e3f2bcdf102e01d3f6e7ceb61d3832c14 |     
  aarch64    |        pipewire-0.3.62         | NOK | http://autobuild.buildroot.net/results/f2adbff647d6e4f3db80d8cb7be8e309067f2f38 |     
    arm      |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/917c9c26416c7552d47b3343be34e777e375601c |     
   s390x     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c1e3a0599a03a9c715d9a9bfab741394348f0bf7 |     
    or1k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/77e5802d3c4c2df73c93d562b07ef6c877bcb74a |     
 microblaze  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/3a1d9f4f921e7bc455180895d6fd7d02e6dc132f |     
  mips64el   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/792d2ed5c9b467a60e07fa5d6dc4987bc4fc2e0b |     
  powerpc    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/d2b31c3b533685becbca7f79681cb5dc75df526b |     
  riscv32    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/626838d3b3650f36253adebaad68f5f8dd768407 |     
    arm      |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/8d79d1126ee24c54f157de99a16089bb90ef6735 |     
 powerpc64   |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/7ec4ea5f863be3fb23f4538fed3078fc10f8da78 |     
   sh4aeb    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/a2256ea40a20091e1509e84313e42f1008df172b |     
  sparc64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/e440bec9111e0adb1dc05b90891f0838c21ad433 |     
   mips64    |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/9fe5291a772ef768eed7f1d0075268803b852438 |     
microblazeel |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/387502fff1b6efd100b7bc72525d79275d37072f |     
   sparc     |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/a0a4635b318840857ba4cb0fff9e951fdca4815e | ORPH
    sh4      |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/291351d6a9f9e807751c275876bf7596bf0b09af |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/0aa6a18e5a152550fbd3f7337f85f19eff4328df | ORPH
microblazeel |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/59c9bb7784c4ce4da2a79115fb0357c2e96bac44 |     
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/f089192a78b83428690d602c00af1ef5f785f48d |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/9f88032bc9aed7e56da4e99b3fbe0187a312f1ae |     
   x86_64    |          ulogd-2.0.8           | NOK | http://autobuild.buildroot.net/results/17885c7a7597e0c3e6afc1f3695363ac20fa3de1 | ORPH
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/2d19643adaf3c2dfceeb9833ad75f83120fdad93 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/d841aceb8e6081a390cbd19b383731d93d48704c |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/d0c492e7d6b84d2b8dc4bc2a6bda1fb9ba7213fe |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/c0099c6407bcde2f0c0fb51d751133026c023717 |     
    arc      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/3baf306d63de86fad1b9309fce9839aebc3e03a9 | ORPH
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/b0581459229a45ad23373050908df23b1713de9f | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/cc08cea9bfc8ae632f09a45556664d00f3798458 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e75b47f9fa5e01c2e560d37ef3f36224705cc1da | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/82a96d57fed61b1ea70897ac4dc4af5572833828 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/99983fd15badda2df72844117d55459512751462 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a3c22c2fe85d7b20180e629e941cf16b06493c25 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e5a3c302b53e8fbccdcb22ebb496231310fde5c6 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/264ed940651bd261408df1ef5389bfce3dba95ed | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c861907f0e6ec6cd494cc5a70cf5a13fd19514df | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a3d4e4f42470bd2c0a23d47de84c3ed78376e86f | ORPH
    or1k     |           z3-4.12.0            | NOK | http://autobuild.buildroot.net/results/fa874bdced3ce2c2ad6c5df3794a5a0109729e2b |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/8f683c9b1c7612e99fe6dac5e4ec54120bddab5a |     
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/8f18cb431d1230ba0824b22a4080908b5ca4cd5d |     
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/bf6f5954a4c501d22b19c3dbfc9e281995728e97 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.0.6        | 7.0.11       |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20220331     | 20222010
    |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 43           |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.4        | 4.6.0        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2022.3       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 13.0.0_r24   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.1         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.4        | 3.1.2        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.4.3       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.29.1      | 20.1.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.46.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.36.1       | 2.36.2       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.8.0        | 2.8.1        |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.9        |     
                       avocado |  DISTRO  | https://release-monitoring.org/project/13385 | 98.0         | 100.1        |     
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 6.4          | 7.0          |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_07_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.12.1       | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.21     | 20.10.26     |     
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.22.1       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.3       |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.2.16       | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.2.16       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.2.16       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.33      | 9.18.10      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.38         | 2.40         |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 24.0.1       |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.65         | 5.66         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.65         | 5.66         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.80.0       | 1.81.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.2.3        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 6.1.2        | ORPH
                    bubblewrap |  DISTRO  | https://release-monitoring.org/project/10937 | 0.6.2        | 0.7.0        |     
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.24         |     
                       busybox |  DISTRO  | https://release-monitoring.org/project/00230 | 1.35.0       | 1.36.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.10       | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.16.1       | 1.16.2       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.7.4        | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.5.0        | 1.5.1        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 3.9.1        | 4.2.0        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.7      | 1.0.0        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 11.1.0       | 15.0.7       |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.3     | 3.14.1.3+... |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.22.3       | 3.25.2       |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/96794 | 1.1.1        | 1.2.0        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.6        |     
                   compiler-rt |  GUESS   | https://release-monitoring.org/project/17705 | 11.1.0       | 900          |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.6.12       | 1.6.15       |     
                      crucible |  DISTRO  | https://release-monitoring.org/project/267616 | 2022.05.25   | 2022.12.06   |     
                       crudini |  DISTRO  | https://release-monitoring.org/project/21669 | 0.9.3        | 0.9.4        |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.6.0        | 8.7.0        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.7.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.1.0-1      |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.10       |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.11.5     | 0.5.12       | ORPH
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.1       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.3        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.1        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.24      | 1.14.4       | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.20.0       | 1.20.1       |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20221229 | ORPH
                     diffutils |  DISTRO  | https://release-monitoring.org/project/00436 | 3.8          | 3.9          | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 20.10.22     | 20.10.23     |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 2.14.0       | 2.15.1       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 20.10.22     | 20.10.23     |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/10627 | 057          | 059          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.21.4       | 9.22.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.8.1        | 0.8.3        | ORPH
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.1.1        | 3.1.2        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.18         | 1.19         | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202211       |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 21.12        | 23.01        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.186        | 0.188        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.14.3       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.53         | 0.55         | ORPH
                         empty |  DISTRO  | https://release-monitoring.org/project/20564 | 0.6.22b      | 0.6.23c      | ORPH
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.4       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 25.2.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.21       | 1.0.22       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.1       | 1.11.5       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.9.1        | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.16       | 1.0.22       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.29       | 1.0.30       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.14       | 1.0.15       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.10       | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.8        | 1.0.9        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.47       | 1.0.49       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.27       | 1.0.29       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.47       | 1.2.7        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.13       | 1.1.16       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.23       | 1.0.25       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.5.6        | 1.6.1        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.32       | 1.0.36       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.12       | 1.0.15       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.10       | 1.0.12       |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.9.0.1      | 2.9.1.0      |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.5       | 0.27.6       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.9.1        |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.3        | 5.1.2        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.43         | 5.44         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.33         |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 2.0.8        | 23.1.4       |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.4        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | LSDK-21.08   | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.2.1        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.1       | ORPH
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/00853 | 3.2.0        | 3.2.1        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 22.09.00     | 23.01.00     |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/00868 | 5.2.0        | 5.2.1        | ORPH
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.0.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.5.1        | 3.6.2        |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.5.5        | 2.6.2        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.10.0       | 1.12.1       |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21.1       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.56.1       | 10.0.0       |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 15.5.0       | 15.8.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.74.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.74.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.3.8        | 2.4.0        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.10.4.0     | 3.10.5.0     |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.72.0       | 1.74.0       | ORPH
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.24         | 3.25         |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 7.1.0        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.2.0        | 5.3.1        |     
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.38       | 1.3.40       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 43.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.6.2        |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.20.4       | 1.21.90      | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.20.4       | 1.21.90      | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.1.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.20.4       | 1.20.5       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.20.4       | 1.21.90      | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.20.4       | 1.21.90      | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.20.4       | 1.21.90      | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.20.4       | 1.20.5       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.20.4       | 1.20.5       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.20.4       | 1.21.90      | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.7.5       | 0.8.0        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.20.4       | 1.20.5       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.14.0       | 0.15.0       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.20.4       | 1.20.5       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.20.4       | 1.20.5       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.12.1       | 1.13.0       |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.22.0       | 3.24.7       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.6.2        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.6.3        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/01282 | 0.14.0       | 0.14.1       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.10.3       | 0.12.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.3       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.5        | 2.7.2        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 5.3.1        | 6.0.0        |     
                       heimdal |  DISTRO  | https://release-monitoring.org/project/01307 | 7.7.1        | 7.8.0        | ORPH
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 11.2         | 11.3         |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.13.1       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.10      | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.365        | 0.366        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.8.0        | 2.9.0        |     
                     hyperfine |  DISTRO  | https://release-monitoring.org/project/18526 | 1.14.0       | 1.15.0       | ORPH
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.43.0       | 2.45.1       |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1661         | 1682         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 72-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.40       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-51     | 7.1.0-57     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.10.0       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.6.0     | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 22.6.6       | 23.1.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 22.6.5       | 23.1.0       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3.493        | 3.494        |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.16         | 7.17         |     
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.8        | 1.8.9        | ORPH
                       iputils |  DISTRO  | https://release-monitoring.org/project/01395 | 20211215     | 20221126     |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.0        | 1.9.2        |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.4.2        | 1.4.3        |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.30         | 2.1          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.25.0       | 1.26.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.1.1        | 1.1.2        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 4.0.0        |     
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.6          | 1.9          |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.13.1       | 1.13.2       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.2       |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.10.0       | 3.10.1       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.25       | 2.0.26       | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.102.0      |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.102.0      |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.102.0      |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.102.0      |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 19.5-Matrix  | 20.0-Nexus   |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.7-Ma... | 20.3.2-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.3-Ma... | 20.5.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.3.0-Nexus |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 19.5-Matrix  | 20.0-Nexus   |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.3-Ma... | 20.1.3-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.4-Ma... | 20.1.3-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.5.0-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.3.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.1.0-Ma... | 20.4.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.3.0-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.4.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.6.0-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.2.2-Ma... | 20.6.1-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.3.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.11-M... | 20.3.0-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.6-Ma... | 20.3.1-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.3.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.4.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.3.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.4-Ma... | 20.3.1-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.3.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.5-Ma... | 20.4.0-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.4.1-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.3.1-Ma... | 20.6.0-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.3.0-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.16-M... | 20.3.3-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 19.5-Matrix  | 20.0-Nexus   |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.2.0-Ma... | 20.2.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.2.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.2-Ma... | 20.1.1-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.2.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.3.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.2-Ma... | 20.2.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.3-Ma... | 20.2.1-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 2.1.0        | 2.2.0        |     
                kvm-unit-tests |  DISTRO  | https://release-monitoring.org/project/242797 | 2022-03-08   | 2023-01-05   |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.1       | 3.11.0       |     
                       leafpad |  DISTRO  | https://release-monitoring.org/project/01544 | 0.8.18.1     | 0.8.19       | ORPH
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.3        | 0.3.95       |     
                     leptonica |  DISTRO  | https://release-monitoring.org/project/01549 | 1.82.0       | 1.83.0       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 590          | 608          | ORPH
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.4        | 3.1.2        |     
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.16.0       | 0.17.0       |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.28-1       | ORPH
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.7       |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.65         | 2.66         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 3.0.0        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.15         | 1.17         |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.16.1       | 1.16.3       | ORPH
                       libebml |  DISTRO  | https://release-monitoring.org/project/07879 | 1.4.2        | 1.4.4        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20210910-3.1 | 20221030-3.1 |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.12.1       | 1.13.0       |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.13.0       | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.11.0       | 3.13.0       |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.5.0        | 1.5.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.72.3       | 2.74.5       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.6.0        | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.17.1       | 1.18.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.30       | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.2.0        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.19       | 1.0.22       |     
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.8.3        |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.35      | 3.24.36      |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/01632 | 0.5.40       | 0.5.42       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.40         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.16       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.2        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.20.1       | 1.22.1       |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 1.8.0        | 1.8.2        |     
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/01657 | 1.6.3        | 1.7.1        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.11.13      | 0.12.3       |     
                     libmodbus |  DISTRO  | https://release-monitoring.org/project/09728 | 3.1.8        | 3.1.10       |     
                    libmodplug |  DISTRO  | https://release-monitoring.org/project/05669 | d1b97ed      | 0.8.9.0      | ORPH
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/68638 | 3.0.7        | 3.0.8        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.25       | 2.1.28       |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.2.3        | 1.2.4        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.19       | 0.1.21       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 5.0.0        |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.14       |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/20333 | 1.1.1q       | 1.1.1s       |     
                     libosmium |  DISTRO  | https://release-monitoring.org/project/07023 | 2.18.0       | 2.19.0       |     
                libpam-tacplus |  DISTRO  | https://release-monitoring.org/project/20537 | 1.6.1        | 1.7.0        | ORPH
                       libpcap |  DISTRO  | https://release-monitoring.org/project/01702 | 1.10.2       | 1.10.3       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 1.34.0       | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.4        |     
                        libpsl |  DISTRO  | https://release-monitoring.org/project/07305 | 0.21.1       | 0.21.2       |     
                  libqrtr-glib |  DISTRO  | https://release-monitoring.org/project/192056 | 1.0.0        | 1.2.2        |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/01709 | 0.21.0       | 0.21.1       |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/01713 | 1.10.0       | 1.11.0       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.5       |     
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.2       | 3.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21.1       | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.8        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/21371 | 0.8.1        | 0.8.2        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.13      | 1.14.15      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.22.4       | ORPH
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.2          | 2.3          |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.16.0       | 2.17.0       |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.16.0       | 2.17.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.14.1       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/13830 | 7.10.0       | 9.0.0        |     
                     libxcrypt |  DISTRO  | https://release-monitoring.org/project/16436 | 4.4.29       | 4.4.33       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.5.0        |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.06      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.1.4        | 2.1.30       |     
                      lighttpd |  DISTRO  | https://release-monitoring.org/project/01817 | 1.4.67       | 1.4.68       |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.20      |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.26         | 2.28         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.63       | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20221214     | 20230117     |     
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/14535 | 1.4.0        | 1.5.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2023.01.19   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 15.0.7       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.15       | 1.0.16       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 15.0.7       |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.13.0       | 1.0.0        |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.20.1       | 3.21.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.96.5       | 4.97.0       | ORPH
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.5       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.7       | 2.13.8       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.8       | 2.13.9       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/01856 | 3.9.1        | 3.9.2        |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.44.2-1     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.13.0       | 2.14.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.18      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 5.0.1        | 5.0.2        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2201         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.4          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.36      | 10.11.1      | ORPH
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.2       | 3.3.0        |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.28       | 4.8.29       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 189          | 191          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.6.0      | 0.1.6.1      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.2.16       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.17       | 1.6.18       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 6.01         |     
                  mesa3d-demos |  DISTRO  | https://release-monitoring.org/project/16781 | 8.4.0        | 8.5.0        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.46.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 3.0.7        | 3.0.8        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2022.07      | 2022.12      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20221107     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.10.6       | 0.11.1       |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.20.4       | 1.21.2       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 6.2.0        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.8          | 7.9          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.190   |     
                           mpc |  DISTRO  | https://release-monitoring.org/project/01667 | 1.2.1        | 1.3.1        | ORPH
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.23.11      | 0.23.12      |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.1.1        | 4.2.0        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.31.2       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.35.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 5.0.0        |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.42       |     
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/00424 | 0.9.3        | 0.9.4        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 7.1          | 7.2          | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.18         | 2.2.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.3-20221224 | 6.4-20230121 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.32.4       | 0.32.5       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.0.0        | 1.1.0        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | 1.218        | 1.219        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.37.1       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.42       | 2.1.49       |     
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.21      | 0.52.23      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.5        | 1.0.6        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.51.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.23.3       |     
             nginx-modsecurity |  DISTRO  | https://release-monitoring.org/project/68639 | 1.0.2        | 1.0.3        |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.11.1.g9... | 1.11.1       |     
                          nmap |  DISTRO  | https://release-monitoring.org/project/02096 | 7.92         | 7.93         | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 16.18.1      | 19.4.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 525.85.05    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.2.1        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 1.34         | 2.0          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.6.0       |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.22.2       |     
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2.0.16       | 2022.09.30   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.7.0        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/06615 | 4.6.0        | 4.7.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.10.0       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.32       | 2.0.33       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.14.1+1  | 21+6         |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 7.1.0        | 7.2.2        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.4        | ORPH
                       openocd |  DISTRO  | https://release-monitoring.org/project/02557 | 0.11.0       | 0.12.0       | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.46         |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/02559 | 0.22.0       | 0.23.0       |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.1.5       |     
                       openvpn |  DISTRO  | https://release-monitoring.org/project/02567 | 2.5.7        | 2.5.8        | ORPH
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.6.1        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.19.0       | 3.20.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.19.0       | 3.20.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.19.0       | 3.20.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.19.0       | 3.20.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.32       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.2.16       | ORPH
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/21375 | 1.3.11       | 1.3.12       |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.17.2       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.6        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.8.0        | 3.9.0        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202212       | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
   perl-class-method-modifiers |  DISTRO  | https://release-monitoring.org/project/06735 | 2.13         | 2.14         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
             perl-data-optlist |  DISTRO  | https://release-monitoring.org/project/02769 | 0.112        | 0.113        |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.89         | 6.90         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
            perl-exporter-tiny |  DISTRO  | https://release-monitoring.org/project/11846 | 1.002002     | 1.006000     |     
    perl-file-sharedir-install |  DISTRO  | https://release-monitoring.org/project/11851 | 0.13         | 0.14         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/06175 | 12.50        | 12.55        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.075        | 2.080        |     
             perl-json-maybexs |  DISTRO  | https://release-monitoring.org/project/11953 | 1.004003     | 1.004004     |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220520   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.510        |     
             perl-module-build |  DISTRO  | https://release-monitoring.org/project/03077 | 0.4231       | 0.4232       |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.26         | 9.31         |     
perl-mojolicious-plugin-aut... |  DISTRO  | https://release-monitoring.org/project/21729 | 1.37         | 1.39         |     
                      perl-moo |  DISTRO  | https://release-monitoring.org/project/03123 | 2.005004     | 2.005005     |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/03136 | 20211001     | 20221114     |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.93_01      | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.124        | 0.144        |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/06578 | 1.0048       | 1.0050       |     
              perl-sub-install |  DISTRO  | https://release-monitoring.org/project/03345 | 0.928        | 0.929        |     
                perl-sub-quote |  DISTRO  | https://release-monitoring.org/project/12678 | 2.006006     | 2.006008     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.012004     | 2.002001     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0208       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.1.14       | 8.2.1        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.22       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.2.0        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.62       | 0.3.64       |     
        pipewire-media-session |  DISTRO  | https://release-monitoring.org/project/236416 | 0.4.1        | 0.4.2        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.9.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.12.2       | 1.12.4       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 22.10.0      | 23.01.0      |     
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.15         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.2        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.1.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.14      | 0.12.2       |     
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.5         | 23.6         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                         putty |  DISTRO  | https://release-monitoring.org/project/05749 | 0.76         | 0.78         |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/03766 | 1.9.1        | 1.9.2        |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 22.12.1      | 23.1.1       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.26.45      | 1.26.54      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.29.45      | 1.29.54      |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.6.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.33      | 3.0.0a11     |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 4.1.5        | 4.2a1        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.2.1        | 2.3.0        |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 2.0.0        | 3.0.0        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 1.0.1        | 1.1.1        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 2.0.7        | 23.1.21      |     
                 python-future |  DISTRO  | https://release-monitoring.org/project/26845 | 0.18.2       | 0.18.3       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.30       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.10       |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/12002 | 2.0.0        | 2.1.1        |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 1.0.0        | 1.0.1        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.6        | 2.4.7        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.1.1        | 2.1.2        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.6.3        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/42653 | 0.14.9       | 0.14.10      |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.23.5       | 1.24.1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.8.4        | 3.8.5        |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/11718 | 22.0         | 23.0         |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.12.0       | 3.0.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.11.0       | 5.11.1       |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 3.0.2        | 3.1.0        |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 0.9.0        | 0.10.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.7       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.9        | 1.2.9.1      |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 7.2.0        | 7.2.1        |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/21140 | 0.12.0       | 0.12.1       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2022.7       | 2022.7.1     |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 24.0.1       | 25.0.0b1     |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 4.4.0        | 4.4.2        |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.28.1       | 2.28.2       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/62048 | 0.8.0        | 0.9.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.8.1        | 1.10.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.12.1       | 1.13.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 65.6.3       | 66.1.1       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 6.7.5        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.4.42       | 2.0.0b4      |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/07314 | 234          | 235          |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 5.2.0        | 5.2.1        |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.8.0        | 5.8.1        |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 22.2.1       | 23.1.1       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/38819 | 2.13.3       | 3.0.0b2      |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.26.13      | 1.26.14      |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.2.5        | 0.2.6        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.32         | 0.33         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.6        | 3.0.7        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.39.4       | 0.47.1       |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/66674 | 22.6.1       | 23.1.1       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/21737 | 2.4.7        | 2.4.8        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.38.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.2        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.2        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.2        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.2        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.8       | 6.4.2        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.0        | 6.4.2        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.0        | 6.4.2        |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
           raspberrypi-usbboot |  DISTRO  | https://release-monitoring.org/project/115700 | 2021.07.01   | 20221215-... | ORPH
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 7.0.7        | 7.0.8        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20220106   | 2.20221101   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 6.15         | 6.16         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.9.2        |     
                       rrdtool |  DISTRO  | https://release-monitoring.org/project/04214 | 1.7.2        | 1.8.0        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2204.1     | 8.2212.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 2.4          | 2.5          |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.1.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.1.3        | 3.2.0        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.42.0       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.23.0       | 2.25.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.11.1.2     | 2.11.2.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.4      | 2.3.5.5      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.8.0      | 1.0.8.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.6.0.0      | 2.6.0.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.5.1.1      | 2.5.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.5.0      | 2.2.5.1      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.3.2      | 0.5.3.3      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.12      | 4.17.4       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.4.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.24.2       | 2.26.2       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.4        | 2.6.2        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/04783 | 2.0.1        | 2.2.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.8.0        | 2.11.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.5.3        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.8        | 4.3.11       |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.30.16      |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.9        | 4.1.1        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.7         |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.9          | 4.10         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.12.0.1     | 2.13.0.0     |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.10       | 3.5.0        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.1.52.0     |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.9       | 1.13.12      |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.14      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/05388 | 1.6.4        | 1.6.5        | ORPH
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.1       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.1        | 4.5.3        |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.18      | ORPH
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.5        | 1.0.7        |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.13.05      | 0.15.03      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.8        | 5.9.9        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.65         | 5.67         |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.5        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.6        | 6.0.9        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.3       | 0.30.2       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.38.1       | 4.0.1        |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.46.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.2.12       | 2.2.36       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.6.1       | 12.7.1       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.18       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 250.8        | 252          |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.04         | ORPH
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.5.0     | 2021.7.0     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.12       | 8.6.13       | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.20         | 1.21         |     
                       tcpdump |  DISTRO  | https://release-monitoring.org/project/04947 | 4.99.2       | 4.99.3       |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.4.2        | 4.4.3        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.12.1       | 1.13.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.3.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5          | 2.5.1        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.17.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.9.0        | 2.9.1        |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.0.1        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20220801     | 20230101     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.47         | 2.5          |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.12       | 8.6.13       |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.3a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 3.0.0        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 5.2          | 5.4          | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 4.0.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.1.6        |     
                    traceroute |  DISTRO  | https://release-monitoring.org/project/14877 | 2.1.0        | 2.1.1        |     
                          tree |  DISTRO  | https://release-monitoring.org/project/05006 | 2.0.2        | 2.1.0        |     
                          ttyd |  DISTRO  | https://release-monitoring.org/project/13890 | 1.7.2        | 1.7.3        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2022f        | 2022g        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2023.01      |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.12         | 0.13         |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.2          |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 6.1.7        | 6.2.3        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.7.1        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 0.99.20      |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.38         | 2.38.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.38         | 2.38.1       | ORPH
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.3       | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.19.0       | 3.20.0       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.7          | 1.0          |     
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.2        |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 2.5.2        | 3.0.0        |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.70.2       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.239      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.0.24       | 2.0.25       |     
                       wavpack |  DISTRO  | https://release-monitoring.org/project/05121 | 5.5.0        | 5.6.0        | ORPH
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 1.0.0        |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.38.3       | 2.39.5       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.2.4        | 1.3.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 10.0.1       | 11.0.1       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.14       | 5.5.15       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 7.0          | 7.22         |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.08.12   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.13       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 4.0.2        | 4.0.3        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.15.1       | 0.16.1       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 2.6.0        | 2.7.0        |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.38.3       | 2.39.5       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.42.0       |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.19       | 1.4.21       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20221028     |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.5       | 4.17.0       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 6.1.1        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.06.1       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.22         | 3.23         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 376          | 378          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.3.1        | 0.3.2        |     
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.10       | 5.4.1        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 12.3         |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/07812 | 4.12.0       | 4.12.1       |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.2.6        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.2.2        | 1.2.3        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 5.1.1        |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.1.7        | 2.1.8        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2022f        | 2022g        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                        assimp | CVE-2022-38528   | https://security-tracker.debian.org/tracker/CVE-2022-38528  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-3662    | https://security-tracker.debian.org/tracker/CVE-2022-3662   
                        bento4 | CVE-2022-3663    | https://security-tracker.debian.org/tracker/CVE-2022-3663   
                        bento4 | CVE-2022-3664    | https://security-tracker.debian.org/tracker/CVE-2022-3664   
                        bento4 | CVE-2022-3665    | https://security-tracker.debian.org/tracker/CVE-2022-3665   
                        bento4 | CVE-2022-3666    | https://security-tracker.debian.org/tracker/CVE-2022-3666   
                        bento4 | CVE-2022-3667    | https://security-tracker.debian.org/tracker/CVE-2022-3667   
                        bento4 | CVE-2022-3668    | https://security-tracker.debian.org/tracker/CVE-2022-3668   
                        bento4 | CVE-2022-3669    | https://security-tracker.debian.org/tracker/CVE-2022-3669   
                        bento4 | CVE-2022-3670    | https://security-tracker.debian.org/tracker/CVE-2022-3670   
                        bento4 | CVE-2022-3784    | https://security-tracker.debian.org/tracker/CVE-2022-3784   
                        bento4 | CVE-2022-3785    | https://security-tracker.debian.org/tracker/CVE-2022-3785   
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                        bento4 | CVE-2022-3809    | https://security-tracker.debian.org/tracker/CVE-2022-3809   
                        bento4 | CVE-2022-3810    | https://security-tracker.debian.org/tracker/CVE-2022-3810   
                        bento4 | CVE-2022-3812    | https://security-tracker.debian.org/tracker/CVE-2022-3812   
                        bento4 | CVE-2022-3813    | https://security-tracker.debian.org/tracker/CVE-2022-3813   
                        bento4 | CVE-2022-3814    | https://security-tracker.debian.org/tracker/CVE-2022-3814   
                        bento4 | CVE-2022-3815    | https://security-tracker.debian.org/tracker/CVE-2022-3815   
                        bento4 | CVE-2022-3816    | https://security-tracker.debian.org/tracker/CVE-2022-3816   
                        bento4 | CVE-2022-3817    | https://security-tracker.debian.org/tracker/CVE-2022-3817   
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-40885   | https://security-tracker.debian.org/tracker/CVE-2022-40885  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                        bento4 | CVE-2022-43032   | https://security-tracker.debian.org/tracker/CVE-2022-43032  
                        bento4 | CVE-2022-43033   | https://security-tracker.debian.org/tracker/CVE-2022-43033  
                        bento4 | CVE-2022-43034   | https://security-tracker.debian.org/tracker/CVE-2022-43034  
                        bento4 | CVE-2022-43035   | https://security-tracker.debian.org/tracker/CVE-2022-43035  
                        bento4 | CVE-2022-43037   | https://security-tracker.debian.org/tracker/CVE-2022-43037  
                        bento4 | CVE-2022-43038   | https://security-tracker.debian.org/tracker/CVE-2022-43038  
                        bento4 | CVE-2022-4584    | https://security-tracker.debian.org/tracker/CVE-2022-4584   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                 enlightenment | CVE-2022-37706   | https://security-tracker.debian.org/tracker/CVE-2022-37706  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                   exfat-utils | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-3965    | https://security-tracker.debian.org/tracker/CVE-2022-3965   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3515    | https://security-tracker.debian.org/tracker/CVE-2022-3515   
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2022-2601    | https://security-tracker.debian.org/tracker/CVE-2022-2601   
                         grub2 | CVE-2022-3775    | https://security-tracker.debian.org/tracker/CVE-2022-3775   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2022-41751   | https://security-tracker.debian.org/tracker/CVE-2022-41751  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libpjsip | CVE-2022-23537   | https://security-tracker.debian.org/tracker/CVE-2022-23537  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2022-47952   | https://security-tracker.debian.org/tracker/CVE-2022-47952  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                          nasm | CVE-2022-46457   | https://security-tracker.debian.org/tracker/CVE-2022-46457  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3067    | https://security-tracker.debian.org/tracker/CVE-2018-3067   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2018-3073    | https://security-tracker.debian.org/tracker/CVE-2018-3073   
                  oracle-mysql | CVE-2018-3074    | https://security-tracker.debian.org/tracker/CVE-2018-3074   
                  oracle-mysql | CVE-2018-3075    | https://security-tracker.debian.org/tracker/CVE-2018-3075   
                  oracle-mysql | CVE-2018-3078    | https://security-tracker.debian.org/tracker/CVE-2018-3078   
                  oracle-mysql | CVE-2018-3079    | https://security-tracker.debian.org/tracker/CVE-2018-3079   
                  oracle-mysql | CVE-2018-3080    | https://security-tracker.debian.org/tracker/CVE-2018-3080   
                  oracle-mysql | CVE-2018-3082    | https://security-tracker.debian.org/tracker/CVE-2018-3082   
                  oracle-mysql | CVE-2018-3084    | https://security-tracker.debian.org/tracker/CVE-2018-3084   
                  oracle-mysql | CVE-2018-3137    | https://security-tracker.debian.org/tracker/CVE-2018-3137   
                  oracle-mysql | CVE-2018-3145    | https://security-tracker.debian.org/tracker/CVE-2018-3145   
                  oracle-mysql | CVE-2018-3170    | https://security-tracker.debian.org/tracker/CVE-2018-3170   
                  oracle-mysql | CVE-2018-3182    | https://security-tracker.debian.org/tracker/CVE-2018-3182   
                  oracle-mysql | CVE-2018-3186    | https://security-tracker.debian.org/tracker/CVE-2018-3186   
                  oracle-mysql | CVE-2018-3195    | https://security-tracker.debian.org/tracker/CVE-2018-3195   
                  oracle-mysql | CVE-2018-3203    | https://security-tracker.debian.org/tracker/CVE-2018-3203   
                  oracle-mysql | CVE-2018-3212    | https://security-tracker.debian.org/tracker/CVE-2018-3212   
                  oracle-mysql | CVE-2018-3279    | https://security-tracker.debian.org/tracker/CVE-2018-3279   
                  oracle-mysql | CVE-2018-3280    | https://security-tracker.debian.org/tracker/CVE-2018-3280   
                  oracle-mysql | CVE-2018-3285    | https://security-tracker.debian.org/tracker/CVE-2018-3285   
                  oracle-mysql | CVE-2018-3286    | https://security-tracker.debian.org/tracker/CVE-2018-3286   
                  oracle-mysql | CVE-2019-2436    | https://security-tracker.debian.org/tracker/CVE-2019-2436   
                  oracle-mysql | CVE-2019-2494    | https://security-tracker.debian.org/tracker/CVE-2019-2494   
                  oracle-mysql | CVE-2019-2495    | https://security-tracker.debian.org/tracker/CVE-2019-2495   
                  oracle-mysql | CVE-2019-2502    | https://security-tracker.debian.org/tracker/CVE-2019-2502   
                  oracle-mysql | CVE-2019-2513    | https://security-tracker.debian.org/tracker/CVE-2019-2513   
                  oracle-mysql | CVE-2019-2530    | https://security-tracker.debian.org/tracker/CVE-2019-2530   
                  oracle-mysql | CVE-2019-2533    | https://security-tracker.debian.org/tracker/CVE-2019-2533   
                  oracle-mysql | CVE-2019-2535    | https://security-tracker.debian.org/tracker/CVE-2019-2535   
                  oracle-mysql | CVE-2019-2536    | https://security-tracker.debian.org/tracker/CVE-2019-2536   
                  oracle-mysql | CVE-2019-2539    | https://security-tracker.debian.org/tracker/CVE-2019-2539   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2743    | https://security-tracker.debian.org/tracker/CVE-2019-2743   
                  oracle-mysql | CVE-2019-2746    | https://security-tracker.debian.org/tracker/CVE-2019-2746   
                  oracle-mysql | CVE-2019-2747    | https://security-tracker.debian.org/tracker/CVE-2019-2747   
                  oracle-mysql | CVE-2019-2752    | https://security-tracker.debian.org/tracker/CVE-2019-2752   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-2780    | https://security-tracker.debian.org/tracker/CVE-2019-2780   
                  oracle-mysql | CVE-2019-2784    | https://security-tracker.debian.org/tracker/CVE-2019-2784   
                  oracle-mysql | CVE-2019-2785    | https://security-tracker.debian.org/tracker/CVE-2019-2785   
                  oracle-mysql | CVE-2019-2789    | https://security-tracker.debian.org/tracker/CVE-2019-2789   
                  oracle-mysql | CVE-2019-2795    | https://security-tracker.debian.org/tracker/CVE-2019-2795   
                  oracle-mysql | CVE-2019-2796    | https://security-tracker.debian.org/tracker/CVE-2019-2796   
                  oracle-mysql | CVE-2019-2798    | https://security-tracker.debian.org/tracker/CVE-2019-2798   
                  oracle-mysql | CVE-2019-2800    | https://security-tracker.debian.org/tracker/CVE-2019-2800   
                  oracle-mysql | CVE-2019-2801    | https://security-tracker.debian.org/tracker/CVE-2019-2801   
                  oracle-mysql | CVE-2019-2802    | https://security-tracker.debian.org/tracker/CVE-2019-2802   
                  oracle-mysql | CVE-2019-2803    | https://security-tracker.debian.org/tracker/CVE-2019-2803   
                  oracle-mysql | CVE-2019-2808    | https://security-tracker.debian.org/tracker/CVE-2019-2808   
                  oracle-mysql | CVE-2019-2810    | https://security-tracker.debian.org/tracker/CVE-2019-2810   
                  oracle-mysql | CVE-2019-2811    | https://security-tracker.debian.org/tracker/CVE-2019-2811   
                  oracle-mysql | CVE-2019-2812    | https://security-tracker.debian.org/tracker/CVE-2019-2812   
                  oracle-mysql | CVE-2019-2814    | https://security-tracker.debian.org/tracker/CVE-2019-2814   
                  oracle-mysql | CVE-2019-2815    | https://security-tracker.debian.org/tracker/CVE-2019-2815   
                  oracle-mysql | CVE-2019-2822    | https://security-tracker.debian.org/tracker/CVE-2019-2822   
                  oracle-mysql | CVE-2019-2826    | https://security-tracker.debian.org/tracker/CVE-2019-2826   
                  oracle-mysql | CVE-2019-2830    | https://security-tracker.debian.org/tracker/CVE-2019-2830   
                  oracle-mysql | CVE-2019-2834    | https://security-tracker.debian.org/tracker/CVE-2019-2834   
                  oracle-mysql | CVE-2019-2879    | https://security-tracker.debian.org/tracker/CVE-2019-2879   
                  oracle-mysql | CVE-2019-3004    | https://security-tracker.debian.org/tracker/CVE-2019-3004   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14575   | https://security-tracker.debian.org/tracker/CVE-2020-14575  
                  oracle-mysql | CVE-2020-14597   | https://security-tracker.debian.org/tracker/CVE-2020-14597  
                  oracle-mysql | CVE-2020-14614   | https://security-tracker.debian.org/tracker/CVE-2020-14614  
                  oracle-mysql | CVE-2020-14619   | https://security-tracker.debian.org/tracker/CVE-2020-14619  
                  oracle-mysql | CVE-2020-14620   | https://security-tracker.debian.org/tracker/CVE-2020-14620  
                  oracle-mysql | CVE-2020-14623   | https://security-tracker.debian.org/tracker/CVE-2020-14623  
                  oracle-mysql | CVE-2020-14624   | https://security-tracker.debian.org/tracker/CVE-2020-14624  
                  oracle-mysql | CVE-2020-14631   | https://security-tracker.debian.org/tracker/CVE-2020-14631  
                  oracle-mysql | CVE-2020-14643   | https://security-tracker.debian.org/tracker/CVE-2020-14643  
                  oracle-mysql | CVE-2020-14651   | https://security-tracker.debian.org/tracker/CVE-2020-14651  
                  oracle-mysql | CVE-2020-14654   | https://security-tracker.debian.org/tracker/CVE-2020-14654  
                  oracle-mysql | CVE-2020-14656   | https://security-tracker.debian.org/tracker/CVE-2020-14656  
                  oracle-mysql | CVE-2020-14663   | https://security-tracker.debian.org/tracker/CVE-2020-14663  
                  oracle-mysql | CVE-2020-14678   | https://security-tracker.debian.org/tracker/CVE-2020-14678  
                  oracle-mysql | CVE-2020-14680   | https://security-tracker.debian.org/tracker/CVE-2020-14680  
                  oracle-mysql | CVE-2020-14697   | https://security-tracker.debian.org/tracker/CVE-2020-14697  
                  oracle-mysql | CVE-2020-14702   | https://security-tracker.debian.org/tracker/CVE-2020-14702  
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                 python-future | CVE-2022-40899   | https://security-tracker.debian.org/tracker/CVE-2022-40899  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                          sudo | CVE-2022-43995   | https://security-tracker.debian.org/tracker/CVE-2022-43995  
                       systemd | CVE-2022-3821    | https://security-tracker.debian.org/tracker/CVE-2022-3821   
                       systemd | CVE-2022-45873   | https://security-tracker.debian.org/tracker/CVE-2022-45873  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2023-0049    | https://security-tracker.debian.org/tracker/CVE-2023-0049   
                           vim | CVE-2023-0051    | https://security-tracker.debian.org/tracker/CVE-2023-0051   
                           vim | CVE-2023-0054    | https://security-tracker.debian.org/tracker/CVE-2023-0054   
                           vim | CVE-2023-0288    | https://security-tracker.debian.org/tracker/CVE-2023-0288   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-3662    | https://security-tracker.debian.org/tracker/CVE-2022-3662   
                        bento4 | CVE-2022-3663    | https://security-tracker.debian.org/tracker/CVE-2022-3663   
                        bento4 | CVE-2022-3664    | https://security-tracker.debian.org/tracker/CVE-2022-3664   
                        bento4 | CVE-2022-3665    | https://security-tracker.debian.org/tracker/CVE-2022-3665   
                        bento4 | CVE-2022-3666    | https://security-tracker.debian.org/tracker/CVE-2022-3666   
                        bento4 | CVE-2022-3667    | https://security-tracker.debian.org/tracker/CVE-2022-3667   
                        bento4 | CVE-2022-3668    | https://security-tracker.debian.org/tracker/CVE-2022-3668   
                        bento4 | CVE-2022-3669    | https://security-tracker.debian.org/tracker/CVE-2022-3669   
                        bento4 | CVE-2022-3670    | https://security-tracker.debian.org/tracker/CVE-2022-3670   
                        bento4 | CVE-2022-3784    | https://security-tracker.debian.org/tracker/CVE-2022-3784   
                        bento4 | CVE-2022-3785    | https://security-tracker.debian.org/tracker/CVE-2022-3785   
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                        bento4 | CVE-2022-3809    | https://security-tracker.debian.org/tracker/CVE-2022-3809   
                        bento4 | CVE-2022-3810    | https://security-tracker.debian.org/tracker/CVE-2022-3810   
                        bento4 | CVE-2022-3812    | https://security-tracker.debian.org/tracker/CVE-2022-3812   
                        bento4 | CVE-2022-3813    | https://security-tracker.debian.org/tracker/CVE-2022-3813   
                        bento4 | CVE-2022-3814    | https://security-tracker.debian.org/tracker/CVE-2022-3814   
                        bento4 | CVE-2022-3815    | https://security-tracker.debian.org/tracker/CVE-2022-3815   
                        bento4 | CVE-2022-3816    | https://security-tracker.debian.org/tracker/CVE-2022-3816   
                        bento4 | CVE-2022-3817    | https://security-tracker.debian.org/tracker/CVE-2022-3817   
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-40885   | https://security-tracker.debian.org/tracker/CVE-2022-40885  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                        bento4 | CVE-2022-43032   | https://security-tracker.debian.org/tracker/CVE-2022-43032  
                        bento4 | CVE-2022-43033   | https://security-tracker.debian.org/tracker/CVE-2022-43033  
                        bento4 | CVE-2022-43034   | https://security-tracker.debian.org/tracker/CVE-2022-43034  
                        bento4 | CVE-2022-43035   | https://security-tracker.debian.org/tracker/CVE-2022-43035  
                        bento4 | CVE-2022-43037   | https://security-tracker.debian.org/tracker/CVE-2022-43037  
                        bento4 | CVE-2022-43038   | https://security-tracker.debian.org/tracker/CVE-2022-43038  
                        bento4 | CVE-2022-4584    | https://security-tracker.debian.org/tracker/CVE-2022-4584   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                      dropbear | CVE-2021-36369   | https://security-tracker.debian.org/tracker/CVE-2021-36369  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                 enlightenment | CVE-2022-37706   | https://security-tracker.debian.org/tracker/CVE-2022-37706  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                   exfat-utils | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-3965    | https://security-tracker.debian.org/tracker/CVE-2022-3965   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-3998    | https://security-tracker.debian.org/tracker/CVE-2021-3998   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3515    | https://security-tracker.debian.org/tracker/CVE-2022-3515   
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2022-2601    | https://security-tracker.debian.org/tracker/CVE-2022-2601   
                         grub2 | CVE-2022-3775    | https://security-tracker.debian.org/tracker/CVE-2022-3775   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2022-41751   | https://security-tracker.debian.org/tracker/CVE-2022-41751  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libpjsip | CVE-2022-23537   | https://security-tracker.debian.org/tracker/CVE-2022-23537  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                      lighttpd | CVE-2022-41556   | https://security-tracker.debian.org/tracker/CVE-2022-41556  
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2022-47952   | https://security-tracker.debian.org/tracker/CVE-2022-47952  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                        mender | CVE-2022-29555   | https://security-tracker.debian.org/tracker/CVE-2022-29555  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                        nodejs | CVE-2022-35256   | https://security-tracker.debian.org/tracker/CVE-2022-35256  
                        nodejs | CVE-2022-43548   | https://security-tracker.debian.org/tracker/CVE-2022-43548  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3067    | https://security-tracker.debian.org/tracker/CVE-2018-3067   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2018-3073    | https://security-tracker.debian.org/tracker/CVE-2018-3073   
                  oracle-mysql | CVE-2018-3074    | https://security-tracker.debian.org/tracker/CVE-2018-3074   
                  oracle-mysql | CVE-2018-3075    | https://security-tracker.debian.org/tracker/CVE-2018-3075   
                  oracle-mysql | CVE-2018-3078    | https://security-tracker.debian.org/tracker/CVE-2018-3078   
                  oracle-mysql | CVE-2018-3079    | https://security-tracker.debian.org/tracker/CVE-2018-3079   
                  oracle-mysql | CVE-2018-3080    | https://security-tracker.debian.org/tracker/CVE-2018-3080   
                  oracle-mysql | CVE-2018-3082    | https://security-tracker.debian.org/tracker/CVE-2018-3082   
                  oracle-mysql | CVE-2018-3084    | https://security-tracker.debian.org/tracker/CVE-2018-3084   
                  oracle-mysql | CVE-2018-3137    | https://security-tracker.debian.org/tracker/CVE-2018-3137   
                  oracle-mysql | CVE-2018-3145    | https://security-tracker.debian.org/tracker/CVE-2018-3145   
                  oracle-mysql | CVE-2018-3170    | https://security-tracker.debian.org/tracker/CVE-2018-3170   
                  oracle-mysql | CVE-2018-3182    | https://security-tracker.debian.org/tracker/CVE-2018-3182   
                  oracle-mysql | CVE-2018-3186    | https://security-tracker.debian.org/tracker/CVE-2018-3186   
                  oracle-mysql | CVE-2018-3195    | https://security-tracker.debian.org/tracker/CVE-2018-3195   
                  oracle-mysql | CVE-2018-3203    | https://security-tracker.debian.org/tracker/CVE-2018-3203   
                  oracle-mysql | CVE-2018-3212    | https://security-tracker.debian.org/tracker/CVE-2018-3212   
                  oracle-mysql | CVE-2018-3279    | https://security-tracker.debian.org/tracker/CVE-2018-3279   
                  oracle-mysql | CVE-2018-3280    | https://security-tracker.debian.org/tracker/CVE-2018-3280   
                  oracle-mysql | CVE-2018-3285    | https://security-tracker.debian.org/tracker/CVE-2018-3285   
                  oracle-mysql | CVE-2018-3286    | https://security-tracker.debian.org/tracker/CVE-2018-3286   
                  oracle-mysql | CVE-2019-2436    | https://security-tracker.debian.org/tracker/CVE-2019-2436   
                  oracle-mysql | CVE-2019-2494    | https://security-tracker.debian.org/tracker/CVE-2019-2494   
                  oracle-mysql | CVE-2019-2495    | https://security-tracker.debian.org/tracker/CVE-2019-2495   
                  oracle-mysql | CVE-2019-2502    | https://security-tracker.debian.org/tracker/CVE-2019-2502   
                  oracle-mysql | CVE-2019-2513    | https://security-tracker.debian.org/tracker/CVE-2019-2513   
                  oracle-mysql | CVE-2019-2530    | https://security-tracker.debian.org/tracker/CVE-2019-2530   
                  oracle-mysql | CVE-2019-2533    | https://security-tracker.debian.org/tracker/CVE-2019-2533   
                  oracle-mysql | CVE-2019-2535    | https://security-tracker.debian.org/tracker/CVE-2019-2535   
                  oracle-mysql | CVE-2019-2536    | https://security-tracker.debian.org/tracker/CVE-2019-2536   
                  oracle-mysql | CVE-2019-2539    | https://security-tracker.debian.org/tracker/CVE-2019-2539   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2743    | https://security-tracker.debian.org/tracker/CVE-2019-2743   
                  oracle-mysql | CVE-2019-2746    | https://security-tracker.debian.org/tracker/CVE-2019-2746   
                  oracle-mysql | CVE-2019-2747    | https://security-tracker.debian.org/tracker/CVE-2019-2747   
                  oracle-mysql | CVE-2019-2752    | https://security-tracker.debian.org/tracker/CVE-2019-2752   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-2780    | https://security-tracker.debian.org/tracker/CVE-2019-2780   
                  oracle-mysql | CVE-2019-2784    | https://security-tracker.debian.org/tracker/CVE-2019-2784   
                  oracle-mysql | CVE-2019-2785    | https://security-tracker.debian.org/tracker/CVE-2019-2785   
                  oracle-mysql | CVE-2019-2789    | https://security-tracker.debian.org/tracker/CVE-2019-2789   
                  oracle-mysql | CVE-2019-2795    | https://security-tracker.debian.org/tracker/CVE-2019-2795   
                  oracle-mysql | CVE-2019-2796    | https://security-tracker.debian.org/tracker/CVE-2019-2796   
                  oracle-mysql | CVE-2019-2798    | https://security-tracker.debian.org/tracker/CVE-2019-2798   
                  oracle-mysql | CVE-2019-2800    | https://security-tracker.debian.org/tracker/CVE-2019-2800   
                  oracle-mysql | CVE-2019-2801    | https://security-tracker.debian.org/tracker/CVE-2019-2801   
                  oracle-mysql | CVE-2019-2802    | https://security-tracker.debian.org/tracker/CVE-2019-2802   
                  oracle-mysql | CVE-2019-2803    | https://security-tracker.debian.org/tracker/CVE-2019-2803   
                  oracle-mysql | CVE-2019-2808    | https://security-tracker.debian.org/tracker/CVE-2019-2808   
                  oracle-mysql | CVE-2019-2810    | https://security-tracker.debian.org/tracker/CVE-2019-2810   
                  oracle-mysql | CVE-2019-2811    | https://security-tracker.debian.org/tracker/CVE-2019-2811   
                  oracle-mysql | CVE-2019-2812    | https://security-tracker.debian.org/tracker/CVE-2019-2812   
                  oracle-mysql | CVE-2019-2814    | https://security-tracker.debian.org/tracker/CVE-2019-2814   
                  oracle-mysql | CVE-2019-2815    | https://security-tracker.debian.org/tracker/CVE-2019-2815   
                  oracle-mysql | CVE-2019-2822    | https://security-tracker.debian.org/tracker/CVE-2019-2822   
                  oracle-mysql | CVE-2019-2826    | https://security-tracker.debian.org/tracker/CVE-2019-2826   
                  oracle-mysql | CVE-2019-2830    | https://security-tracker.debian.org/tracker/CVE-2019-2830   
                  oracle-mysql | CVE-2019-2834    | https://security-tracker.debian.org/tracker/CVE-2019-2834   
                  oracle-mysql | CVE-2019-2879    | https://security-tracker.debian.org/tracker/CVE-2019-2879   
                  oracle-mysql | CVE-2019-3004    | https://security-tracker.debian.org/tracker/CVE-2019-3004   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14575   | https://security-tracker.debian.org/tracker/CVE-2020-14575  
                  oracle-mysql | CVE-2020-14597   | https://security-tracker.debian.org/tracker/CVE-2020-14597  
                  oracle-mysql | CVE-2020-14614   | https://security-tracker.debian.org/tracker/CVE-2020-14614  
                  oracle-mysql | CVE-2020-14619   | https://security-tracker.debian.org/tracker/CVE-2020-14619  
                  oracle-mysql | CVE-2020-14620   | https://security-tracker.debian.org/tracker/CVE-2020-14620  
                  oracle-mysql | CVE-2020-14623   | https://security-tracker.debian.org/tracker/CVE-2020-14623  
                  oracle-mysql | CVE-2020-14624   | https://security-tracker.debian.org/tracker/CVE-2020-14624  
                  oracle-mysql | CVE-2020-14631   | https://security-tracker.debian.org/tracker/CVE-2020-14631  
                  oracle-mysql | CVE-2020-14643   | https://security-tracker.debian.org/tracker/CVE-2020-14643  
                  oracle-mysql | CVE-2020-14651   | https://security-tracker.debian.org/tracker/CVE-2020-14651  
                  oracle-mysql | CVE-2020-14654   | https://security-tracker.debian.org/tracker/CVE-2020-14654  
                  oracle-mysql | CVE-2020-14656   | https://security-tracker.debian.org/tracker/CVE-2020-14656  
                  oracle-mysql | CVE-2020-14663   | https://security-tracker.debian.org/tracker/CVE-2020-14663  
                  oracle-mysql | CVE-2020-14678   | https://security-tracker.debian.org/tracker/CVE-2020-14678  
                  oracle-mysql | CVE-2020-14680   | https://security-tracker.debian.org/tracker/CVE-2020-14680  
                  oracle-mysql | CVE-2020-14697   | https://security-tracker.debian.org/tracker/CVE-2020-14697  
                  oracle-mysql | CVE-2020-14702   | https://security-tracker.debian.org/tracker/CVE-2020-14702  
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                      patchelf | CVE-2022-44940   | https://security-tracker.debian.org/tracker/CVE-2022-44940  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                       proftpd | CVE-2021-46854   | https://security-tracker.debian.org/tracker/CVE-2021-46854  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-future | CVE-2022-40899   | https://security-tracker.debian.org/tracker/CVE-2022-40899  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2022-45198   | https://security-tracker.debian.org/tracker/CVE-2022-45198  
                 python-pillow | CVE-2022-45199   | https://security-tracker.debian.org/tracker/CVE-2022-45199  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2022-29217   | https://security-tracker.debian.org/tracker/CVE-2022-29217  
             python-setuptools | CVE-2022-40897   | https://security-tracker.debian.org/tracker/CVE-2022-40897  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                python-twisted | CVE-2022-39348   | https://security-tracker.debian.org/tracker/CVE-2022-39348  
                 python-web2py | CVE-2022-33146   | https://security-tracker.debian.org/tracker/CVE-2022-33146  
               python-werkzeug | CVE-2022-29361   | https://security-tracker.debian.org/tracker/CVE-2022-29361  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3611    | https://security-tracker.debian.org/tracker/CVE-2021-3611   
                          qemu | CVE-2021-3750    | https://security-tracker.debian.org/tracker/CVE-2021-3750   
                          qemu | CVE-2021-3929    | https://security-tracker.debian.org/tracker/CVE-2021-3929   
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2021-4158    | https://security-tracker.debian.org/tracker/CVE-2021-4158   
                          qemu | CVE-2021-4206    | https://security-tracker.debian.org/tracker/CVE-2021-4206   
                          qemu | CVE-2021-4207    | https://security-tracker.debian.org/tracker/CVE-2021-4207   
                          qemu | CVE-2022-0358    | https://security-tracker.debian.org/tracker/CVE-2022-0358   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                          qemu | CVE-2022-2962    | https://security-tracker.debian.org/tracker/CVE-2022-2962   
                          qemu | CVE-2022-3165    | https://security-tracker.debian.org/tracker/CVE-2022-3165   
                          qemu | CVE-2022-35414   | https://security-tracker.debian.org/tracker/CVE-2022-35414  
                          qemu | CVE-2022-3872    | https://security-tracker.debian.org/tracker/CVE-2022-3872   
                          qemu | CVE-2022-4144    | https://security-tracker.debian.org/tracker/CVE-2022-4144   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
               rabbitmq-server | CVE-2022-31008   | https://security-tracker.debian.org/tracker/CVE-2022-31008  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                           rpm | CVE-2021-3521    | https://security-tracker.debian.org/tracker/CVE-2021-3521   
                           rpm | CVE-2021-35937   | https://security-tracker.debian.org/tracker/CVE-2021-35937  
                           rpm | CVE-2021-35938   | https://security-tracker.debian.org/tracker/CVE-2021-35938  
                           rpm | CVE-2021-35939   | https://security-tracker.debian.org/tracker/CVE-2021-35939  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                       systemd | CVE-2022-3821    | https://security-tracker.debian.org/tracker/CVE-2022-3821   
                       systemd | CVE-2022-45873   | https://security-tracker.debian.org/tracker/CVE-2022-45873  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                       unbound | CVE-2022-30698   | https://security-tracker.debian.org/tracker/CVE-2022-30698  
                       unbound | CVE-2022-30699   | https://security-tracker.debian.org/tracker/CVE-2022-30699  
                       unbound | CVE-2022-3204    | https://security-tracker.debian.org/tracker/CVE-2022-3204   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                           vim | CVE-2023-0049    | https://security-tracker.debian.org/tracker/CVE-2023-0049   
                           vim | CVE-2023-0051    | https://security-tracker.debian.org/tracker/CVE-2023-0051   
                           vim | CVE-2023-0054    | https://security-tracker.debian.org/tracker/CVE-2023-0054   
                           vim | CVE-2023-0288    | https://security-tracker.debian.org/tracker/CVE-2023-0288   
                       wavpack | CVE-2022-2476    | https://security-tracker.debian.org/tracker/CVE-2022-2476   
                     wireshark | CVE-2022-4344    | https://security-tracker.debian.org/tracker/CVE-2022-4344   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.11.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                        assimp | CVE-2022-38528   | https://security-tracker.debian.org/tracker/CVE-2022-38528  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-3662    | https://security-tracker.debian.org/tracker/CVE-2022-3662   
                        bento4 | CVE-2022-3663    | https://security-tracker.debian.org/tracker/CVE-2022-3663   
                        bento4 | CVE-2022-3664    | https://security-tracker.debian.org/tracker/CVE-2022-3664   
                        bento4 | CVE-2022-3665    | https://security-tracker.debian.org/tracker/CVE-2022-3665   
                        bento4 | CVE-2022-3666    | https://security-tracker.debian.org/tracker/CVE-2022-3666   
                        bento4 | CVE-2022-3667    | https://security-tracker.debian.org/tracker/CVE-2022-3667   
                        bento4 | CVE-2022-3668    | https://security-tracker.debian.org/tracker/CVE-2022-3668   
                        bento4 | CVE-2022-3669    | https://security-tracker.debian.org/tracker/CVE-2022-3669   
                        bento4 | CVE-2022-3670    | https://security-tracker.debian.org/tracker/CVE-2022-3670   
                        bento4 | CVE-2022-3784    | https://security-tracker.debian.org/tracker/CVE-2022-3784   
                        bento4 | CVE-2022-3785    | https://security-tracker.debian.org/tracker/CVE-2022-3785   
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                        bento4 | CVE-2022-3809    | https://security-tracker.debian.org/tracker/CVE-2022-3809   
                        bento4 | CVE-2022-3810    | https://security-tracker.debian.org/tracker/CVE-2022-3810   
                        bento4 | CVE-2022-3812    | https://security-tracker.debian.org/tracker/CVE-2022-3812   
                        bento4 | CVE-2022-3813    | https://security-tracker.debian.org/tracker/CVE-2022-3813   
                        bento4 | CVE-2022-3814    | https://security-tracker.debian.org/tracker/CVE-2022-3814   
                        bento4 | CVE-2022-3815    | https://security-tracker.debian.org/tracker/CVE-2022-3815   
                        bento4 | CVE-2022-3816    | https://security-tracker.debian.org/tracker/CVE-2022-3816   
                        bento4 | CVE-2022-3817    | https://security-tracker.debian.org/tracker/CVE-2022-3817   
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-40885   | https://security-tracker.debian.org/tracker/CVE-2022-40885  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                        bento4 | CVE-2022-43032   | https://security-tracker.debian.org/tracker/CVE-2022-43032  
                        bento4 | CVE-2022-43033   | https://security-tracker.debian.org/tracker/CVE-2022-43033  
                        bento4 | CVE-2022-43034   | https://security-tracker.debian.org/tracker/CVE-2022-43034  
                        bento4 | CVE-2022-43035   | https://security-tracker.debian.org/tracker/CVE-2022-43035  
                        bento4 | CVE-2022-43037   | https://security-tracker.debian.org/tracker/CVE-2022-43037  
                        bento4 | CVE-2022-43038   | https://security-tracker.debian.org/tracker/CVE-2022-43038  
                        bento4 | CVE-2022-4584    | https://security-tracker.debian.org/tracker/CVE-2022-4584   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                 enlightenment | CVE-2022-37706   | https://security-tracker.debian.org/tracker/CVE-2022-37706  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                   exfat-utils | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-3965    | https://security-tracker.debian.org/tracker/CVE-2022-3965   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3515    | https://security-tracker.debian.org/tracker/CVE-2022-3515   
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2022-2601    | https://security-tracker.debian.org/tracker/CVE-2022-2601   
                         grub2 | CVE-2022-3775    | https://security-tracker.debian.org/tracker/CVE-2022-3775   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2022-41751   | https://security-tracker.debian.org/tracker/CVE-2022-41751  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libpjsip | CVE-2022-23537   | https://security-tracker.debian.org/tracker/CVE-2022-23537  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2022-47952   | https://security-tracker.debian.org/tracker/CVE-2022-47952  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3067    | https://security-tracker.debian.org/tracker/CVE-2018-3067   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2018-3073    | https://security-tracker.debian.org/tracker/CVE-2018-3073   
                  oracle-mysql | CVE-2018-3074    | https://security-tracker.debian.org/tracker/CVE-2018-3074   
                  oracle-mysql | CVE-2018-3075    | https://security-tracker.debian.org/tracker/CVE-2018-3075   
                  oracle-mysql | CVE-2018-3078    | https://security-tracker.debian.org/tracker/CVE-2018-3078   
                  oracle-mysql | CVE-2018-3079    | https://security-tracker.debian.org/tracker/CVE-2018-3079   
                  oracle-mysql | CVE-2018-3080    | https://security-tracker.debian.org/tracker/CVE-2018-3080   
                  oracle-mysql | CVE-2018-3082    | https://security-tracker.debian.org/tracker/CVE-2018-3082   
                  oracle-mysql | CVE-2018-3084    | https://security-tracker.debian.org/tracker/CVE-2018-3084   
                  oracle-mysql | CVE-2018-3137    | https://security-tracker.debian.org/tracker/CVE-2018-3137   
                  oracle-mysql | CVE-2018-3145    | https://security-tracker.debian.org/tracker/CVE-2018-3145   
                  oracle-mysql | CVE-2018-3170    | https://security-tracker.debian.org/tracker/CVE-2018-3170   
                  oracle-mysql | CVE-2018-3182    | https://security-tracker.debian.org/tracker/CVE-2018-3182   
                  oracle-mysql | CVE-2018-3186    | https://security-tracker.debian.org/tracker/CVE-2018-3186   
                  oracle-mysql | CVE-2018-3195    | https://security-tracker.debian.org/tracker/CVE-2018-3195   
                  oracle-mysql | CVE-2018-3203    | https://security-tracker.debian.org/tracker/CVE-2018-3203   
                  oracle-mysql | CVE-2018-3212    | https://security-tracker.debian.org/tracker/CVE-2018-3212   
                  oracle-mysql | CVE-2018-3279    | https://security-tracker.debian.org/tracker/CVE-2018-3279   
                  oracle-mysql | CVE-2018-3280    | https://security-tracker.debian.org/tracker/CVE-2018-3280   
                  oracle-mysql | CVE-2018-3285    | https://security-tracker.debian.org/tracker/CVE-2018-3285   
                  oracle-mysql | CVE-2018-3286    | https://security-tracker.debian.org/tracker/CVE-2018-3286   
                  oracle-mysql | CVE-2019-2436    | https://security-tracker.debian.org/tracker/CVE-2019-2436   
                  oracle-mysql | CVE-2019-2494    | https://security-tracker.debian.org/tracker/CVE-2019-2494   
                  oracle-mysql | CVE-2019-2495    | https://security-tracker.debian.org/tracker/CVE-2019-2495   
                  oracle-mysql | CVE-2019-2502    | https://security-tracker.debian.org/tracker/CVE-2019-2502   
                  oracle-mysql | CVE-2019-2513    | https://security-tracker.debian.org/tracker/CVE-2019-2513   
                  oracle-mysql | CVE-2019-2530    | https://security-tracker.debian.org/tracker/CVE-2019-2530   
                  oracle-mysql | CVE-2019-2533    | https://security-tracker.debian.org/tracker/CVE-2019-2533   
                  oracle-mysql | CVE-2019-2535    | https://security-tracker.debian.org/tracker/CVE-2019-2535   
                  oracle-mysql | CVE-2019-2536    | https://security-tracker.debian.org/tracker/CVE-2019-2536   
                  oracle-mysql | CVE-2019-2539    | https://security-tracker.debian.org/tracker/CVE-2019-2539   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2743    | https://security-tracker.debian.org/tracker/CVE-2019-2743   
                  oracle-mysql | CVE-2019-2746    | https://security-tracker.debian.org/tracker/CVE-2019-2746   
                  oracle-mysql | CVE-2019-2747    | https://security-tracker.debian.org/tracker/CVE-2019-2747   
                  oracle-mysql | CVE-2019-2752    | https://security-tracker.debian.org/tracker/CVE-2019-2752   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-2780    | https://security-tracker.debian.org/tracker/CVE-2019-2780   
                  oracle-mysql | CVE-2019-2784    | https://security-tracker.debian.org/tracker/CVE-2019-2784   
                  oracle-mysql | CVE-2019-2785    | https://security-tracker.debian.org/tracker/CVE-2019-2785   
                  oracle-mysql | CVE-2019-2789    | https://security-tracker.debian.org/tracker/CVE-2019-2789   
                  oracle-mysql | CVE-2019-2795    | https://security-tracker.debian.org/tracker/CVE-2019-2795   
                  oracle-mysql | CVE-2019-2796    | https://security-tracker.debian.org/tracker/CVE-2019-2796   
                  oracle-mysql | CVE-2019-2798    | https://security-tracker.debian.org/tracker/CVE-2019-2798   
                  oracle-mysql | CVE-2019-2800    | https://security-tracker.debian.org/tracker/CVE-2019-2800   
                  oracle-mysql | CVE-2019-2801    | https://security-tracker.debian.org/tracker/CVE-2019-2801   
                  oracle-mysql | CVE-2019-2802    | https://security-tracker.debian.org/tracker/CVE-2019-2802   
                  oracle-mysql | CVE-2019-2803    | https://security-tracker.debian.org/tracker/CVE-2019-2803   
                  oracle-mysql | CVE-2019-2808    | https://security-tracker.debian.org/tracker/CVE-2019-2808   
                  oracle-mysql | CVE-2019-2810    | https://security-tracker.debian.org/tracker/CVE-2019-2810   
                  oracle-mysql | CVE-2019-2811    | https://security-tracker.debian.org/tracker/CVE-2019-2811   
                  oracle-mysql | CVE-2019-2812    | https://security-tracker.debian.org/tracker/CVE-2019-2812   
                  oracle-mysql | CVE-2019-2814    | https://security-tracker.debian.org/tracker/CVE-2019-2814   
                  oracle-mysql | CVE-2019-2815    | https://security-tracker.debian.org/tracker/CVE-2019-2815   
                  oracle-mysql | CVE-2019-2822    | https://security-tracker.debian.org/tracker/CVE-2019-2822   
                  oracle-mysql | CVE-2019-2826    | https://security-tracker.debian.org/tracker/CVE-2019-2826   
                  oracle-mysql | CVE-2019-2830    | https://security-tracker.debian.org/tracker/CVE-2019-2830   
                  oracle-mysql | CVE-2019-2834    | https://security-tracker.debian.org/tracker/CVE-2019-2834   
                  oracle-mysql | CVE-2019-2879    | https://security-tracker.debian.org/tracker/CVE-2019-2879   
                  oracle-mysql | CVE-2019-3004    | https://security-tracker.debian.org/tracker/CVE-2019-3004   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14575   | https://security-tracker.debian.org/tracker/CVE-2020-14575  
                  oracle-mysql | CVE-2020-14597   | https://security-tracker.debian.org/tracker/CVE-2020-14597  
                  oracle-mysql | CVE-2020-14614   | https://security-tracker.debian.org/tracker/CVE-2020-14614  
                  oracle-mysql | CVE-2020-14619   | https://security-tracker.debian.org/tracker/CVE-2020-14619  
                  oracle-mysql | CVE-2020-14620   | https://security-tracker.debian.org/tracker/CVE-2020-14620  
                  oracle-mysql | CVE-2020-14623   | https://security-tracker.debian.org/tracker/CVE-2020-14623  
                  oracle-mysql | CVE-2020-14624   | https://security-tracker.debian.org/tracker/CVE-2020-14624  
                  oracle-mysql | CVE-2020-14631   | https://security-tracker.debian.org/tracker/CVE-2020-14631  
                  oracle-mysql | CVE-2020-14643   | https://security-tracker.debian.org/tracker/CVE-2020-14643  
                  oracle-mysql | CVE-2020-14651   | https://security-tracker.debian.org/tracker/CVE-2020-14651  
                  oracle-mysql | CVE-2020-14654   | https://security-tracker.debian.org/tracker/CVE-2020-14654  
                  oracle-mysql | CVE-2020-14656   | https://security-tracker.debian.org/tracker/CVE-2020-14656  
                  oracle-mysql | CVE-2020-14663   | https://security-tracker.debian.org/tracker/CVE-2020-14663  
                  oracle-mysql | CVE-2020-14678   | https://security-tracker.debian.org/tracker/CVE-2020-14678  
                  oracle-mysql | CVE-2020-14680   | https://security-tracker.debian.org/tracker/CVE-2020-14680  
                  oracle-mysql | CVE-2020-14697   | https://security-tracker.debian.org/tracker/CVE-2020-14697  
                  oracle-mysql | CVE-2020-14702   | https://security-tracker.debian.org/tracker/CVE-2020-14702  
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                       proftpd | CVE-2021-46854   | https://security-tracker.debian.org/tracker/CVE-2021-46854  
                 python-future | CVE-2022-40899   | https://security-tracker.debian.org/tracker/CVE-2022-40899  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
             python-setuptools | CVE-2022-40897   | https://security-tracker.debian.org/tracker/CVE-2022-40897  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                python-twisted | CVE-2022-39348   | https://security-tracker.debian.org/tracker/CVE-2022-39348  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2022-2962    | https://security-tracker.debian.org/tracker/CVE-2022-2962   
                          qemu | CVE-2022-3165    | https://security-tracker.debian.org/tracker/CVE-2022-3165   
                          qemu | CVE-2022-3872    | https://security-tracker.debian.org/tracker/CVE-2022-3872   
                          qemu | CVE-2022-4144    | https://security-tracker.debian.org/tracker/CVE-2022-4144   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                       systemd | CVE-2022-3821    | https://security-tracker.debian.org/tracker/CVE-2022-3821   
                       systemd | CVE-2022-45873   | https://security-tracker.debian.org/tracker/CVE-2022-45873  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           vim | CVE-2023-0049    | https://security-tracker.debian.org/tracker/CVE-2023-0049   
                           vim | CVE-2023-0051    | https://security-tracker.debian.org/tracker/CVE-2023-0051   
                           vim | CVE-2023-0054    | https://security-tracker.debian.org/tracker/CVE-2023-0054   
                           vim | CVE-2023-0288    | https://security-tracker.debian.org/tracker/CVE-2023-0288   
                     wireshark | CVE-2022-4344    | https://security-tracker.debian.org/tracker/CVE-2022-4344   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
