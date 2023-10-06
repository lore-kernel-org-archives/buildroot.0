Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D709DE92FE4
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 05:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 350A7400F3;
	Fri,  6 Oct 2023 05:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 350A7400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2gX_KGD0SRw; Fri,  6 Oct 2023 05:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B017340328;
	Fri,  6 Oct 2023 05:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B017340328
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE621BF36B
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 05:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C135D834DE
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 05:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C135D834DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyG8FQeUsHQ3 for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 05:43:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C03982112
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 05:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C03982112
Received: by mail.gandi.net (Postfix) with ESMTPSA id 556F32000E
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 05:43:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 06 Oct 2023 05:43:37 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231006054342.C135D834DE@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1696571017; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fdrPpuCVrgYK0N32U0lLGVas9Jca/86bjq22ld8+JMI=;
 b=Zv4svZSidqtYeqPaROnAs9t7tf32YOzv9v8mKo29boIdU0wLhIremmVcDVK23YRM6GtnPU
 C1mR9492r5UZV5KTfFAcMEVjiaU9eTR1p8+w3KxI40guR36O0LMx0PwUSSIvk8k65FwfdH
 SO7audcbU3SaOKzhiBRR6LaPSP2PvkhYmU9CH3Y37LWq8E6DGyDC4lKBVBCci5FubNGzb1
 r/YKpd3dGqlJejmbS7kElEU/OSs8r6sv5Z8FaWdksavzDFKmdLnCwGdebBvKDxCCIYy6UE
 rlRWZ0jetyMqnDSpXT/eGWLaLYA0UrFtvbWcmLD/NZjSbgVlaEw1gFM+FZDHog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zv4svZSi
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-05
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

Autobuild statistics for 2023-10-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 17  | 10  |  1  | 28  |
  2023.08.x  | 15  | 10  |  0  | 25  |
    master   | 81  | 137 |  0  | 218 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 18
               alsa-lib-1.2.10 | 11
             alsa-utils-1.2.10 | 10
                       unknown | 9 
              gcc-final-12.3.0 | 8 
              gcc-final-11.4.0 | 5 
                libselinux-3.5 | 4 
                   linux-6.5.5 | 4 
                  monit-5.33.0 | 4 
         spirv-tools-1.3.261.1 | 4 
glibc-2.38-13-g92201f16cbcf... | 3 
  gobject-introspection-1.76.1 | 3 
                    brltty-6.5 | 2 
check-11970a7e112dfe243a2e6... | 2 
                 coreutils-9.3 | 2 
              gcc-final-13.2.0 | 2 
                host-go-1.21.1 | 2 
              host-rust-1.71.1 | 2 
              libarchive-3.7.2 | 2 
               openblas-0.3.24 | 2 
                  acpid-2.0.34 | 1 
                  boost-1.83.0 | 1 
          cryptodev-linux-1.13 | 1 
                 dhcp-4.4.3-P1 | 1 
                     efivar-38 | 1 
            freeswitch-1.10.10 | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-erlang-26.0.2 | 1 
         host-gcc-final-13.2.0 | 1 
     host-moby-buildkit-0.11.6 | 1 
        host-sentry-cli-2.20.3 | 1 
                       iw-5.19 | 1 
              libcamera-v0.1.0 | 1 
                libsoup-2.74.2 | 1 
               lightning-2.2.2 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.5.3 | 1 
        ltp-testsuite-20230929 | 1 
               madplay-0.15.2b | 1 
               mariadb-10.11.4 | 1 
              memcached-1.6.21 | 1 
               nfs-utils-2.6.3 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                    pppd-2.5.0 | 1 
            python-sip-4.19.25 | 1 
                python3-3.11.5 | 1 
            quickjs-2021-03-27 | 1 
rwmem-c8291705c82bb0686be9a... | 1 
       spirv-headers-1.3.261.1 | 1 
                   systemd-254 | 1 
                 tbb-2021.10.0 | 1 
                 uclibc-1.0.44 | 1 
                   uhd-4.3.0.0 | 1 
                usbguard-1.1.2 | 1 
             util-linux-2.39.2 | 1 
                 wolfssl-5.6.3 | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/cc7f40fd78850b267786a7aa41b3be75966b5085 | ORPH
    m68k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/83d079d4d88dff9bff4dc28b1642c13e04ce42c6 |     
    arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/577e22668cbb88ea6ffa9c6136f9767e19af160d |     
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/66f59aef666a32a61491f037eb90369357da1de1 |     
 aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a3ee4298ef4a34c71cb631d3356f8087c3d3996c |     
    arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/5cf125e57e55aa854b601c38a1f962f4e8c59183 |     
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/1ad4b9833379873d4c4cc1654c3cf6a1b3298be2 |     
    arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/5565e7aaa497c0ce038a09a853fb45884203a4ff |     
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/c575952edd06384db23319db578d2923d128a94c |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/294f07cfcfecc5c28bc04f4a00fb4d9b0d26aa17 |     
  powerpc    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/4b5fbf360d08c58d21cc906d983ec0160f183d40 |     
 aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/bb90548400cc15fb8bcab2803ef93c989e1f1fb0 |     
    i686     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/6947cd4833934d94cb068b3cd121bd4b47b3c0e0 |     
 aarch64_be  |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/21e69c542cd6e7c2869a7d594127eb59d1b15b2c |     
   arceb     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/7c7433043b3df5db57ceffafeae6df5d02caaf13 |     
  aarch64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/dd1f552d89996dcae2bbf3feadfa0dabdb0ad85f |     
 microblaze  |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/3a6b0dd476fb2eb68485e698c80eb85f122c0a19 |     
   xtensa    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/bbcf557a99fb28619034c85daa0d07b5306fa9a9 |     
    or1k     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/84c134a66a8a3734ea66e9608b202c6b2a86696c |     
    mips     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/f1adf1ff2f1c91ccfcd80f330b9656f75cf0810a |     
   mipsel    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/f0910e8d719d2f47ab5c9b570b843b1fb2572ac2 |     
 powerpc64   |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/48c9140b7365c1270c87bcc3fee443153b112c3b |     
    arm      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/c755ad05edd1597d1d4623652062da8a69492b06 |     
    m68k     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/fb6c7cd4166c0970cefde93fc5bff185f67f41fb |     
   mips64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/f8218a8425f7e6910cb17f289a13936097a16452 |     
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/183bbcbf6aa5de2b53939391a635c7089cef6054 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3bcec7cad5236f4b8831cfeec44bd033b1dfbcb3 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cfe6774566d3edc4430d6f41e3b4f4f20baaa7fa | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7bdbee9a01262577b34596b60f082962c42c86a0 | ORPH
    i686     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/c3e071938028cea5810aee8ce1a8bdaf6555ce83 | ORPH
  aarch64    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/962c74b043d5e7a0dbccdee0d69cf76a5a8792aa | ORPH
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/e899ac69bd0e4bce833997a8b827c812bcfa87b2 |     
    or1k     |       freeswitch-1.10.10       | NOK | http://autobuild.buildroot.net/results/178da0d217d6137867c59ac4fa0e037d4fabf158 |     
    arm      |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/b9ac0347d3b37ecae04d17cfb96f36938606be57 |     
  riscv64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/0bfc402d1724347b1b9df31e7bce4c741a768317 |     
  aarch64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/7cd15d9e1d443010206523a45c1105f4d1e9cef8 |     
  riscv64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/8b61ad5c8e88f0f33e5122d35dac8dad5caf5951 |     
   xtensa    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/e202b266d874464ffa0ff6e7bba134c750c0ffa1 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f219fab61e20a0ef959c143922281e533523f449 |     
   armeb     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/6ebbc6d1efe2ebaae7fb1bb9f41524f037f7560d |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f79259d51469c443c9e65a32e91d764433668038 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/7a9d43359947c11c5fe6446395f7c9a7550d807c |     
   armeb     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/fd68f4fb6231d709d4fc181b48378bf7f2c265fb |     
    m68k     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/68c338735fadaa2ef879eb401eab0b68d2889857 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/770921bdbaa95c2dfa5aa43698b376e826b68fbb |     
 aarch64_be  |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/654e8580a4183125b2b939105a6639f2953a2ea7 |     
    arm      |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/095552ea3a636d41de4df21b0b8c11dd19b4b590 |     
  riscv64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/394f271393ccbe31ef6b35f102f14c1308be8efc |     
 powerpc64   | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/c168b6063c7e718a4946091c63bb111cac229c3a |     
    arc      | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/a676160da51e5c2f55ffd510fd95869352af7f85 |     
  powerpc    | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/180b1e1e6310682b8a43c2efaca0cfe44405dd42 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/79d2434679cbc18c3565f255b813e4e4008db030 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8085e3558acfb0cabcf1aaea9aea26c83232aa34 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fc1b3a9c491214fc34e136d8a3bbdc8ccff69bac | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/308627cb1841783fb27ae3ebdf90899ab3d3a392 |     
   mipsel    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/530d3587be84d4e55e09cd6be0f75b89b3f3c504 |     
   arceb     |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/7b7c75cbe5bfc7f39322cc814e776190ed9f6166 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/494d11d1fafecf927e7da79959b10b31eac57950 |     
   mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/1399c1204c821eec54a0d1e2500007c8e621d237 |     
    arm      |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/4cf0c18ab96ca125490add9dd4406d66b6c4bc54 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/d92a22e8cdc45bf1bc14e95816a6f363b5f44e21 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/e299dac9967a176053ea7389c6384ad34f4dd4eb |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ceb60c673db986d537434645bd49bb966adc9a1b |     
    arm      |            iw-5.19             | NOK | http://autobuild.buildroot.net/results/30dc81bb4021c32de9f8ed8dee0f86cff508f080 | ORPH
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/473632627e1e05a1b0a5ec12f57d99f6d9c2482b |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ff0a7394e293b0446f32fb400b8baa79eee03c50 |     
  aarch64    |        libcamera-v0.1.0        | NOK | http://autobuild.buildroot.net/results/0a2b06f7be5e02e32f3ea50c86be6087a3ff8314 |     
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/c0aa5bec6aa9f19b80bf5585072cb914196bbf6d |     
   sh4aeb    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/0497fbe693c6751b50160b34135341bcbd4cc8c7 |     
   armeb     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/2593165c50e779dfafe5f1bb4e085b87b6977ceb |     
microblazeel |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/9d5ad44312cfc20b5a8612f4d2c2078e8c71a06f |     
   sparc     |         libsoup-2.74.2         | NOK | http://autobuild.buildroot.net/results/5eb054a70e3cb806e4806319d0ecb8799e148e93 |     
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/9f45e4776f93b60eb11a732d7344be9e0bc55172 |     
 microblaze  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/481d3fe2f8341adc1c04158e90c7958e5235946a | ORPH
  powerpc    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/eef509dc309a47ccf2a1bd8f9dc63109e9c9ed2c | ORPH
   mipsel    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/3489682caa8a822e45f22d10536c9509f6fb7ce6 | ORPH
   mips64    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/9eb3ce5dff9b761402592c32e3e973e002ca81fb | ORPH
  mips64el   |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/1e2ea2e9c5702e4521317f8d32585229e367121d | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/502681b8b090e7a9b7e7c0c1898104bb35464573 | ORPH
   x86_64    |     ltp-testsuite-20230929     | NOK | http://autobuild.buildroot.net/results/c9abd74429d34234dc764dc59c50301982a4b589 |     
    arm      |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/77b398aff554871f1c0fb9608f0eeb2cfbfc193c | ORPH
microblazeel |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/fd0ff82697e9d62c24fb476182c012159ac99c40 | ORPH
   arceb     |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/a8d1445a84170e9561405f29d3d5375bcf29e709 | ORPH
    arm      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/1cd652438a5677eefeb675655a0dc58e0d4e2450 |     
    mips     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/8f53882637a393979d45180fe8c820afe3fa59a7 |     
    or1k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/1f9c98511d4f39d78d688214a7010e5368a1051d |     
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/02f90b50d0ca774dccbbaa01e978ef08e67742a8 |     
    mips     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/672cfa7a93735567439d2953e22a1814f4ea40ea |     
   mips64    |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/6dedef7f2bba1995cb40605c67101521c3578a04 |     
  mips64el   |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/6d46959655de5358485cc74aaff474fc9ff58d4d |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/d3e1a1a5fcd13c4f05699c3464d84f1997444a0a |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/63fa0dab911385b8c453d84cd3df1419c64cb823 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/82edcf2b6122cf58b88a36d71929776c15848e8d |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/548d057b00b75065dc84818b918385dd1ee4c677 |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/cf95dcb380e6c18ed68ad1c78adbab5f8794b912 |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/fb0761787e4282eb878e8dabc8b802e7f9a76f5e |     
    or1k     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f63ef4ec5abee42e9eb0c8223aab50a885f765d7 |     
    i686     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/938039d38ab047ac754b98e2a7f9dadd90a7b2bd |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f73b8c6405f423092ecb3855c52c89c97f6b9b9e |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c58dac93acfbd2a231a91102a840e70321c24a74 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f7dfa6712462d835be9948f59aaf7f325946ff4d |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7b2d404bbe1e5ee46c6cac0f4b18b7853f0c08a7 |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7c9b64e5cc8b04d6093f677e0370ba4a9ee8414b |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/825b3465d449e4225ad96280eef805338fdbeffb |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ec415e9d7ed00872986dc9b327cc5fd26cf6c776 |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7a83c1b28aa6dc5e3136a14d90f49811a6836ab6 |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/2f722250c7dd71d99daecfa8bd46fad3a59db5c3 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ee381f4550d20f101b69f392cde22e79e30aab4a |     
powerpc64le  | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/f54aaa19e0fe4140116a2de2daca925208870274 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/9f3f7d71bd24f5c3dd28682ac28ef2c80a89d1dd |     
powerpc64le  |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/dd27fbf5fa4204cf0bfdca0fe30b3ad0275759e0 |     
    sh4a     |         python3-3.11.5         | NOK | http://autobuild.buildroot.net/results/986276c92b82b26a09877a16bbdec8e5b45f93e7 |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/80402926ecd4014cd0f84d36d87b7a48b05619ef |     
    m68k     | rwmem-c8291705c82bb0686be9a... | NOK | http://autobuild.buildroot.net/results/2d3b20b20a42ad7dd53fdd3f768b94ec90976ab2 | ORPH
powerpc64le  |    spirv-headers-1.3.261.1     | NOK | http://autobuild.buildroot.net/results/6a387441759b10eb38301c1dafec3506c72446e9 |     
  riscv32    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/47da3f56158fba3c1aa78c6768fef889b03470e0 | ORPH
  sparc64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/dd2f3d24061367f2da3152a62b1e673d7c3b8c99 | ORPH
    m68k     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/a885e6b28c06d5d96db893143f1e1da67b539d42 | ORPH
powerpc64le  |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/efb5f4c1ae9595ffa6ae505448e1ee336d18f0f2 | ORPH
   mips64    |          systemd-254           | NOK | http://autobuild.buildroot.net/results/0bdd9f47f5fef47aaec674df604a1be0a187e3d2 |     
   s390x     |         tbb-2021.10.0          | NOK | http://autobuild.buildroot.net/results/8f0a2ea99940d96f6d88c08eb84e0da495e22d58 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/472c4051a84d9b6da534e05cb56f1e709eab0e63 |     
   s390x     |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/93381d9fd9e3da0b70895810d898e10833fc5c79 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0b9da6ab6cad83382411afc3fb759fab7f68fc27 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/6416ad6a10b7b3f768ce061f08dd39843d1d0a45 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/24d6818790290371afe171063ffadcf409de10b8 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/0b4bc50a913d6e2aa7cb9df06672dbf87d681d05 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/dcf90dad7b9525f1b09f1323c1aac811c5936862 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/beb24715673e00529c7b1b5eef311eb5f0684ed7 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/1a4db540dabb1cf7b476f58ba8d4785f23405a07 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/57c6b3d0483ae8d56f366c113a7f44c78359ee2d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fb2fc91536cc931a553dff24e96333ea2981ad2d |     
microblazeel |         usbguard-1.1.2         | NOK | http://autobuild.buildroot.net/results/1a08823020c37a73f4e4a40f47b02fca3f159748 |     
    i686     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/aef2f73ffeadb7c6d8c7acf91d37bbafa1f3da85 | ORPH
   s390x     |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/d7997a74c4c6a0745e51aa7a3e0cb4d939adc549 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6a56fb98e3492ce115ec61dbbe7cde0793089878 |     
  riscv32    |          xvisor-0.3.2          | NOK | http://autobuild.buildroot.net/results/844c64d894221155645d2640d8e6cd4b5a20af35 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 3 
                   btrfs-progs | 1 
                  check-0.15.2 | 1 
                elfutils-0.186 | 1 
               host-go-1.19.13 | 1 
                  motion-4.5.1 | 1 
            ocf-linux-20171122 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/04d7e4c3798a3d416c2a6ed8b44d5696ee66ad27 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/4681da1856db567ca5a616d12730234351581fbd |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/1a36b64ede75dcb047efc10674836e3222328c42 |     
  mips64el   |          btrfs-progs           | TIM | http://autobuild.buildroot.net/results/72af1dafe03bbbe1019c7f3333cb2d66759a95a5 |     
    arm      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/96c9020f28b836ff720cd70175708d2d9144fee9 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e8d0d884fcb672457f21d421cec5e805857ddc91 | ORPH
  mips64el   |        host-go-1.19.13         | NOK | http://autobuild.buildroot.net/results/bfcec8a7ad2acd9d8b2e2ce254e3a59a75fecf4e |     
   mipsel    |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/7fc090138ec20d545e0c75131707d3675b01a371 |     
    i686     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/9226bc3f762b671dee65a77835698facb761d02b |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/5d99f13abde9d6b0069823eb5c1688db9d59f824 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/21e2dedaabf87caf073fcda287eaa6e2a58ecbca |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
                elfutils-0.189 | 1 
                   ethtool-6.3 | 1 
                     frr-8.4.2 | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.20.8 | 1 
              host-rust-1.71.1 | 1 
                libgeos-3.12.0 | 1 
               pipewire-0.3.74 | 1 
                speechd-0.11.4 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/025a79b9f53867b8a8edf250c300921993ab250d | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/752d6c0aacdd6980917bf1148685bd054181cf7a | ORPH
    arm      |          ethtool-6.3           | NOK | http://autobuild.buildroot.net/results/1080b35f0bc809347a76ea54d40cdfbf0bcfd372 |     
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/3242f1674e4fe007f36810d0a34d2815f5769ed4 |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a7594202901567c02c43f1513c2c4aae282f1372 | ORPH
   armeb     |         host-go-1.20.8         | NOK | http://autobuild.buildroot.net/results/16afd3bf590895bcfa7e143c752712be8699702a |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/eefb0cab17ddce079b2ded8dc1f48f8c4a9a32bd |     
    or1k     |         libgeos-3.12.0         | NOK | http://autobuild.buildroot.net/results/72361949e1204db4de860f1ed6f0cc42b6e6cad1 |     
    mips     |        pipewire-0.3.74         | NOK | http://autobuild.buildroot.net/results/53be2788f3fd65595e50d024e6c2c9b5ea06eb19 |     
    arm      |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/8ab13cf474d732c95a1da65592d950b24b3d474b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
