Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4A3C83F11
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 05:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D121D60D4C;
	Sun, 27 Aug 2023 05:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D121D60D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yf5J1TjBT1MN; Sun, 27 Aug 2023 05:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9BA60D5F;
	Sun, 27 Aug 2023 05:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9BA60D5F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02BBB1BF2A7
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 05:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD41181916
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 05:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD41181916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRBkgN29xCw0 for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 05:35:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5894818C2
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 05:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5894818C2
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC5A31C0005
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 05:35:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 05:35:18 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230827053523.DD41181916@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1693114519; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wM/xph+YgmVgMN8l+cKPhkrcaPrykgCjNTCZMvmA8bg=;
 b=GolqISXfYeBQRk3iXTOE7qLn1TKc1edWJBSilbHXaIW1/MPmYZ0bz0OvbtDfcs0ekbRCaI
 las6K1u/7iGMkFgj/tlbVs7PcGPKmlUhVJUwRgPABCRz3zvRmqeoMMyRbN6IaxIhlr8lcU
 km1pmFfBI7UG4hgcYNFdByiP0gwZWlIST3V7jjUBtYpoosT784qlEI14wWNh24XCAZDVQd
 KnT3NcZ4xwcWxgJ6P3WBQlRdqjiIy3jiXuKmCAS0Uj19CZu6C7ThD/jQ2QY0cFjc5VRWmS
 M2/RkWpr6YJ5xRiCUfVbQZ+yWnUA4KlBNmkpgG6Vx+CvhNlxtxWhqz9XAcolUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GolqISXf
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-26
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

Autobuild statistics for 2023-08-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  1  |  0  |  7  |
  2023.05.x  |  6  |  4  |  0  | 10  |
    master   | 101 | 77  |  4  | 182 |

Classification of failures by reason for master
-----------------------------------------------

              libxcrypt-4.4.33 | 12
glibc-2.37-2-g9f8513dc64119... | 4 
         gobject-introspection | 4 
              host-rust-1.71.0 | 4 
                  linux-6.4.12 | 4 
              open62541-v1.3.6 | 4 
check-11970a7e112dfe243a2e6... | 3 
                host-go-1.20.7 | 3 
                bpftool-v7.1.0 | 2 
                elfutils-0.189 | 2 
             f2fs-tools-1.16.0 | 2 
               linux-pam-1.5.3 | 2 
                     lxc-5.0.2 | 2 
                  zeromq-4.3.4 | 2 
                 augeas-1.12.0 | 1 
                    bat-0.23.0 | 1 
             batman-adv-2022.3 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
                  conmon-2.1.7 | 1 
                 fdk-aac-2.0.2 | 1 
                     file-5.43 | 1 
  gobject-introspection-1.76.1 | 1 
             gstreamer1-1.22.2 | 1 
          host-fakeroot-1.32.1 | 1 
               host-runc-1.1.7 | 1 
         host-sentry-cli-2.8.0 | 1 
           janus-gateway-1.1.2 | 1 
           libatomic_ops-7.8.0 | 1 
           libfreeimage-3.18.0 | 1 
             libopenssl-3.0.10 | 1 
                libsoup-2.74.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              mosquitto-2.0.17 | 1 
                    olsr-0.9.8 | 1 
                oprofile-1.4.0 | 1 
                     pound-4.8 | 1 
                  reaver-1.6.6 | 1 
                   systemd-254 | 1 
               trace-cmd-2.9.7 | 1 
uclibc-ng-test-6790eafe897b... | 1 
             util-linux-2.39.1 | 1 
        util-linux-libs-2.39.1 | 1 
wireguard-linux-compat-1.0.... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/2d2cb7e87e8fb4cad3867f2a309b149666757beb | ORPH
    mips     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/5f68540030484ec2bde2a25474cdb8c90d705820 |     
  aarch64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/52fb7d51d65f673eed4d9befe5f19143b1c40be9 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/50372bd491dc6297dbd8003e9c585df08ce4cf25 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/4445fcaa09a69d2f5fbc8e1b630102109f4d33a7 |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/e1be7f2942c25889e36a1c651b31bcefa227dcff |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/9f6d7a910a80d08c0396e635c158165afacd858d |     
   armeb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/58337214ec88fe815073bb886a6c8d268f4d57ee | ORPH
 aarch64_be  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3eeb6e6ab24845f88f12537e270b03ab89aa57af | ORPH
  mips64el   | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/639f18fef8b569a65e7d52145ee78e4060450357 | ORPH
    i586     |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/e24f90b3be75139e09a2a15630b48909c16c199b |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9f7ecbce0c81b7170c2749803535aa8fd8cee326 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/276545cd738a95a47577cd7552165505fd5168fc | ORPH
    mips     |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/44c8f5abab650a359a1328233de26c8d9423b00d |     
  mips64el   |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/9a9e7fddbc13f5db81322176b509c226969b8040 |     
    sh4      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/924b81b3706bc283013ebcf0a602388ef8198e4e |     
   armeb     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/236e0e04325f5f978e67d9ce6686c92dbe15db27 | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/c53539c3db65ad239ec76fb088e9aa0639873516 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/01051cee492a9eb85b09f5a37a17fc3245f50a37 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/b2ac686a85e9a85d2ee4ff320a73bdc39dc125fa |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/4d91606cfaf213b64edc05e5bd5c48e59916bf24 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9a5f01cfba9c1f845aa51b1a5f10e55da6fcdb35 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e4ceab75fb74236983dd55271725bca5e0e66242 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/7ea032d1b3ce0fa5ddd9b8122fcaa84f1072e615 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e7ef88812f365e49ec5fc8f00a6944310a7c26ba |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/453397d70e3bdd2db22be6b5e66957a9b2595a39 | ORPH
    arm      |       gstreamer1-1.22.2        | NOK | http://autobuild.buildroot.net/results/257635c2d5fec4548bad5638eb0bace59c18e14b | ORPH
  powerpc    |      host-fakeroot-1.32.1      | NOK | http://autobuild.buildroot.net/results/fb7c766d8058621cfd7f1967fdb88e0822d544a1 | ORPH
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/80e220fee7a91e1f1fc8f45127110a1521a4930f |     
   mips64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/4b4f5148d3e1503c982dd5d3860e86755d13fa6c |     
powerpc64le  |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/560f6aa17aa15a328fd9ff3cd10128b96bbb3bad |     
  riscv64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/ac65a112cf6177f8a368ee40cbdf150305bae67d |     
  aarch64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/9699a0a33cb9b5c5807c01f08160a87e904d88f3 |     
  sparc64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/4f904ac3c7edcf91077d4ea48af550e710b33296 |     
powerpc64le  |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/1b2536e0175729792572bc37736c5e3f66de4bfc |     
   mipsel    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/84fadcb4984a27802b7dc6610b54e87fc4089886 |     
    i586     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f27c6ebcce8b8a7c194cc353f3106cc9a97bb7e2 |     
   mips64    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/a8e2a5d6108e5409d4782e95e74b3bd7803d7387 |     
  riscv64    |      libatomic_ops-7.8.0       | NOK | http://autobuild.buildroot.net/results/58f0de241c605c2df696843fc37ac1b2e2813676 | ORPH
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0804e2ded72b0028b69185a956ab8ccb8d45eedc |     
    arm      |       libopenssl-3.0.10        | NOK | http://autobuild.buildroot.net/results/e37ed5ad6ba41d610bffe9c234f699e203ef5069 | ORPH
   sparc     |         libsoup-2.74.2         | NOK | http://autobuild.buildroot.net/results/3d16d2c514182d22495fc31832bd47cba55e75b3 |     
   x86_64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/9dc5be78e1a80e35ca7d86ce8da89478cb53d443 |     
   armeb     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/cb07ed043c634fa8ae4a8cb047a209f09e055c12 |     
    sh4a     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/9ab51fd0f939a7e87452e5c2c833aede46ff66a3 |     
powerpc64le  |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/63fd4a207309008ab0ad7737e06d4358e9670951 |     
 microblaze  |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/1af1b25dcdf9fc3d3aba428b08aa8756f0ba93bb |     
    arm      |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/04cf8d79fe8a58c3438e7be95ae781c9b2bef8a0 |     
   s390x     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/eb5f392788f862d2c01c8ddd5d1f4cef793a64d9 |     
  mips64el   |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/5e203f8ed04cdec95bbeaa77e21b49c2a1489fa1 |     
    i686     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/9d07c4a5b3fda690725f85184de17000f59f77b4 |     
 microblaze  |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/8c079d5d459ea2ddd19ee413623f8c51f742af05 |     
   s390x     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/db03b786179bb26f0592ea42458d8451ee6f4aa3 |     
  riscv64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/0128c5759303abaae4c3c114c1fbfaae0ad0ffb3 |     
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0993244eb67452b0a54b579dc7732254f5e4d841 | ORPH
   s390x     |          linux-6.4.12          | NOK | http://autobuild.buildroot.net/results/3b8e1d08b665eed83d08b1a00290ba92cb70a4aa | ORPH
 microblaze  |          linux-6.4.12          | NOK | http://autobuild.buildroot.net/results/3ba4b5db4829ab55869305dffbb205098d815caa | ORPH
   mips64    |          linux-6.4.12          | NOK | http://autobuild.buildroot.net/results/79c26d9e5dda687ce495051ee50df7e522974141 | ORPH
    arm      |          linux-6.4.12          | NOK | http://autobuild.buildroot.net/results/ba82790bbdf0413c865ea11fe7578ddea37a4401 | ORPH
microblazeel |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/eff3c8a10672d6d19679c0bae700b9b205c40dce | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/47333cdc82bdd3907ffe685fe4b1c2ab5f51598a | ORPH
   x86_64    |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/62eab4260e3dc260dc56adfcd1f4af7d22f7d492 |     
  sparc64    |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/ffb9312d86903d0509b9a56f11da59f4c82abd68 |     
    or1k     |        mosquitto-2.0.17        | NOK | http://autobuild.buildroot.net/results/f171ea273e767a1b03efca66900db407a9e5bc51 |     
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/412793e103cb6984d3aad25de984585bd9ae9ad8 | ORPH
   armeb     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/b2b9cd8b6040b93971cef67764d7d459ced4ed4f | ORPH
 microblaze  |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/21967cf9108ded0c6c736c90f0a89629b5cf370f | ORPH
powerpc64le  |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/0cea1d129c9539d55176cfaee88b548d844ac4ae | ORPH
    arc      |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/24282cbe0163f3268fb13833e297b8f65c278ca7 | ORPH
  aarch64    |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/b2116354a4d71c0338d14e7023c28b1863a7adb9 |     
   s390x     |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/ce12a127b958ce8ba6e261d27135514de2bd8d63 | ORPH
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/7cb3e4cd62fb0473cb27792a565b8afa5cf82177 |     
 powerpc64   |          systemd-254           | NOK | http://autobuild.buildroot.net/results/34e6d395ae5431f1c2e12badc2ec92bc0bd22c8a |     
    or1k     |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/a62f08469df1996b5a4f09bfa37599eaf6f3b589 |     
    arm      | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/347e41f5de665112f7a5599e94e14612d5586a2f |     
 microblaze  |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/5a2c40103bd64fd23017491f3d0428bb96cbc316 | ORPH
    i686     |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/724c222bc141622c22d53dfd5ef2bf0ddb28391f | ORPH
microblazeel | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/5d575465023184a4a7b8e24d88b2c534f54a3286 |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a6b05abd628878f6d9fa2bc41d26572dddd50bfc |     
  sparc64    |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b26b3147729756bc337e7988fb29736e64971fe6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e601a5aa6f7d1f805fad7c713b1f43d6ae5d4927 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/2331ae0d79e26e0fc668cee9b38efb6878e2553e |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                elfutils-0.186 | 1 
              host-rust-1.68.2 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.3.13 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7ea4f02d2c40b007ab30cb9a83d08ecd1d4e1d77 | ORPH
   mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/37a28464a14c90fb4353c8e1e3a1eb763d5e25e6 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/40e9c578f88fa82e22c5c54e120a79b65dc36e03 |     
 powerpc64   |          linux-6.3.13          | NOK | http://autobuild.buildroot.net/results/9718ad9e731054182b2192c033d4d9428de64797 | ORPH


Gitlab CI results for 2023-08-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4959210522  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936947997  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948042  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948094  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948118  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948120  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948126  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948135  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948137  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948141  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4959214372  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948236  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948281  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948303  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948307  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948417  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948453  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948618  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948627  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948746  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936948766  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4959213616  | ORPH 
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949329  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949340  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949349  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949378  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949426  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949430  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949446  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4959205724  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
