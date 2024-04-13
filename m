Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A80C4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 03:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD07400E5;
	Sat, 13 Apr 2024 03:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StG3pECT5bzB; Sat, 13 Apr 2024 03:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C6544015F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C6544015F;
	Sat, 13 Apr 2024 03:55:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8831BF45A
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 03:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75E664015F
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 03:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BZelro1Dc1I for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 03:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38B69400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38B69400E5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38B69400E5
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 03:55:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C3F640004
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 03:55:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 03:55:46 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712980546; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7hNHFYoOm16MRn7rg/bPNt61c0A8ZxSVD6DJ+jDBYlQ=;
 b=DR2Qqvb6vYtMfmiEoD4jkBnzFdvAUpRn/uAF0wqT2QXKBhi6zv/om8lj/Ht+whUt7WhTdj
 P4vXYIb/YBZSlpU3KHfDkbHU0QrpJZXEsJuoS/4yrOcEkMiQUQG3y67AkzgIhsyaVzoro9
 PKbECir2vqp5TEwHNoObTBkV5zDur8twdn8KuoN7JGfgb86rNdYWxbiwkqpBxpi0l3ptqa
 pm7nc8JfdxCFEKNSWdDWfPLw2xf8sIOvehY9ot4t4iP68hpnbab5ouy03ECDUijGe8v6VX
 8hIPxluXJnZBPMjJ2JsDecwENZhv/TakOkZJaUzZKPPOI7KCaNZCDhE69LhNfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DR2Qqvb6
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-12
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
Message-ID: <20240413035546._hzLatR97AoZUzp-jX5d8eGyxQhbjK3bb5FkCr0wibk@z>

Hello,

Autobuild statistics for 2024-04-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  | 15  |  0  | 21  |
    master   | 70  | 101 |  1  | 172 |

Classification of failures by reason for master
-----------------------------------------------

                     mdadm-4.3 | 7 
                   linux-6.8.1 | 6 
                fail2ban-1.0.2 | 4 
host-heimdal-f4faaeaba371ff... | 4 
                       unknown | 4 
  gobject-introspection-1.76.1 | 3 
                libressl-3.8.4 | 3 
          linux-5.10.162-cip24 | 3 
         python-remi-2022.7.27 | 3 
               apcupsd-3.14.14 | 2 
check-11970a7e112dfe243a2e6... | 2 
                 coreutils-9.3 | 2 
                   foot-1.16.2 | 2 
                gnu-efi-3.0.18 | 2 
               ipmitool-1_8_19 | 2 
                  libffi-3.4.6 | 2 
                    ncmpc-0.49 | 2 
           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
                   botan-3.3.0 | 1 
                    brltty-6.6 | 1 
                 c-icap-0.5.10 | 1 
          chocolate-doom-3.0.1 | 1 
             containerd-1.7.14 | 1 
             dahdi-linux-3.3.0 | 1 
                 dhcp-4.4.3-P1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
        edk2-edk2-stable202308 | 1 
           flatbuffers-23.5.26 | 1 
                    gdal-3.8.2 | 1 
                      gdb-13.2 | 1 
           ghostscript-10.02.1 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                  gnupg2-2.4.5 | 1 
         gobject-introspection | 1 
                   gvfs-1.48.1 | 1 
                haproxy-2.6.15 | 1 
                 highway-1.1.0 | 1 
 host-binutils-bare-metal-2.42 | 1 
             host-delve-1.22.1 | 1 
       host-gcc-initial-12.3.0 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-runc-1.1.12 | 1 
                  kexec-2.0.28 | 1 
      libabseil-cpp-20230802.1 | 1 
          libcamera-apps-1.2.1 | 1 
                   libnss-3.99 | 1 
              libopenssl-3.2.1 | 1 
                  libsepol-3.5 | 1 
             libutempter-1.2.1 | 1 
                   linux-tools | 1 
make: *** wait: No child pr... | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
                  octave-9.1.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                privoxy-3.0.34 | 1 
            quickjs-2024-01-13 | 1 
                    rtty-8.1.0 | 1 
              sdl2_mixer-2.6.3 | 1 
             stress-ng-0.17.07 | 1 
             strongswan-5.9.13 | 1 
                sysrepo-2.2.36 | 1 
             util-linux-2.39.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6756bc58daf89349b7b32dd17574fb95da7d364a |     
 powerpc64   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/91b2035c8435bec1ece684803acc458d65a038ae |     
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/8a3313e87f1aac7619b8f22086214f1b6dfa801b |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/c3e0a3f01abd8695ef57ddcf557708035d73d972 |     
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/44c211b3ad80db603309f7bc5bb9c6dfa57c5caf | ORPH
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/9273d3ce6f3cab8bbeb379b1e532c5e7b1018403 |     
  riscv32    |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/4bfb52ccb2e8cf0ea496cbbb57e65d885874f52a | ORPH
  aarch64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/fa07e895061fb3b5e56ea520c7ef0f16b17171f2 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b8e8be385c6152ff7bc8ae365ae02201c252c835 | ORPH
   sh4eb     |      chocolate-doom-3.0.1      | NOK | http://autobuild.buildroot.net/results/48e98d267ffa48ef5547fc810bf62dc23042e906 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/545366ef15fb2d6001f94ead8d4578c009d19451 |     
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4d98ee3079664e526c33021b9b37eb2e4c296805 | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/68c6eae24114ae518b2911a6a260967f7f247a3f | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/f1d875c993c5b96afc16f23dd062ed3f64a6d547 |     
    sh4      |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/7c27cc5fdd1dbd49ea44b9b9e6b4be84f568d8fa | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/770343c24c88398e1bc90126effc667f04e47a7d | ORPH
    i586     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/7d3358230af87aec32913a6133cc9ed06f3dcdda |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b32262147af31b1944fb2a904e73a9d24731b0f9 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/281945e0a2a81ef0decec1a84f9859451bb332ea |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/382d35dc848a2b175331007f41bca22c783c7d81 |     
  riscv64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ab78846e4c2abc07528b746735902833ac5b0d86 |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/0552499f3adb0ad5b0b8f944050cf81e16aae740 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/88a4b82074b7525de48b0124598abe63a329c4aa |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/31db80b36cd9353e58e4e32db4164f81b8cffb38 |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/838382734b6e76b3c63c636a2be2e592cd954e51 |     
   nios2     |            gdb-13.2            | NOK | http://autobuild.buildroot.net/results/3255dfbf66ea3735f3079a0abf1654cba0bc5bbd | ORPH
    arm      |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/2662bce1974fede3aa735d27b8c4613fc6ef12f1 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/c1e66415cc970f965a9643aa229de6ec7a1d0933 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/5b74519a468e82b866ee7d594dd2f28fd6ddbabd |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/64bcaec4d9a9237536fccadf93fb8e10e75e2f20 |     
   mips64    |          gnupg2-2.4.5          | NOK | http://autobuild.buildroot.net/results/e0b6d39b97b9aab14a36e1a1ea3424618f874578 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/13ffdb4e3211e2aacac426d3699d8845684fded6 |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3706915d9c9c75007b01ce4e44c6040b590079ba | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/588bd3e22507f3ed78f4889deaf073173c0c114d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0bc38bcefc035c6111eedc8a81071045f61b9c4a | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/1a10abdbd3cf51d58815f0329a7c01e51c5779b2 | ORPH
   x86_64    |         haproxy-2.6.15         | NOK | http://autobuild.buildroot.net/results/5fa2e8709ebb9944579a9bd7f363276ad779ebd4 |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/2d0f68299f4ade24a8a9ef83754cfb1a9a946aee |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/5599ae7321b780914a75b2ccd73f64ab4d36d136 |     
    arm      |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/2155f0edeb47513512b06eb27ad0fa505836ec38 |     
    arm      |    host-gcc-initial-12.3.0     | NOK | http://autobuild.buildroot.net/results/7b9a49fa0ad5210549fa7435b7a8ea9a9efd39e2 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/aac7f5baef7c08d0204e502413462f7d024120b9 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2bf5683951b15a2b1ab275833ad754c891bc7d96 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c3232c17851f9d0989187c1aa3852a29b4f2e6a6 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3d485cb8bddb98356ee56aa6b391cf9949f24bf5 | ORPH
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3cd273601e7cbf6a5c74793df4bfffff1ccdccf0 |     
    arm      |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/8f5d368700705e9f51a30796eca6348626eaeee8 |     
powerpc64le  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/12366c3f197546eedfb323e2e880957114ba65af |     
   nios2     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/0950e6b8883e33cb76be030c413bcfd01a5d3a46 |     
   x86_64    |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/f56265b1c99e9e1b0abcf7c88e7e3cd47c17f788 |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/fa8fb21c9916e4e08fd1226b1d0b17bdc1b32603 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4917d81a60c2300862249ea9c244e75ec0713aff |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0e2ab7cf500ed575892a99cf09fd578b00b29fe9 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ee0a769888860cc8cca891ea839609467b3c5138 |     
    arm      |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/5be8898d901ae897320bdd7258fd2071132b1c6c |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/c42110518cc9a89150eb7fe0a10d553205fe4ce5 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4b464f3db96db63af7526213221d2b59d334144f | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/52ec478a0d9caadc07b4a5fe40107f8282188adf | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e6f59b959b6b072c380ef8dbec860a55e125b49b | ORPH
    arm      |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/5edc7921d8138fe73493c10c8eeb065ee7daf40c |     
    m68k     |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/717044b8eba0c6eae45de99be8b0587c5b46e76c |     
  sparc64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/fbcb583ee63f7bb4e80ffffba3363e4d12b1d4b6 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/0faf34fedc9908665cf8ea8799d0f83c7ef48c1d | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/70b13851a61d288e9e93c80443ec8aff089e9e4b | ORPH
  powerpc    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/d5e5b34c2b329fb1567f5ee1795f2cdbf469b9c2 | ORPH
 microblaze  |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/40984dd62f50e06031beaa0c7c8aaa50873e3d36 | ORPH
  mips64el   |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/a816d1facc97cbdcfeb2adb6a7062e74cb290135 | ORPH
   armeb     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/21525298d49abee401afddb427039763b421bafb | ORPH
  mips64el   |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/331881c3a4a7947c62ea3e846b15ec8019db4c9b | ORPH
  sparc64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/a4b1e34e048347fe8994fec8208dbc7cb3c2c613 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ed85974a85675e5e52528431e7d3f756984e5231 | ORPH
   nios2     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/5cbb8b559e15d5e6d7c91df306e2b31e4e8fe6d6 |     
    or1k     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/0e04bcdb591ca5642053e1f7e31384f06581e989 | ORPH
    m68k     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/d98b22987d37d76c3848064232416c75e9159c9c | ORPH
   s390x     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/5453f0fdf121e7caa96867b0f1aa53247d465bf4 | ORPH
 aarch64_be  |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/457010f0add443facf742aff2a950e0a02f8e539 | ORPH
   mips64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/b552f62feb1ab9c890a81c8329021950778202d1 | ORPH
 aarch64_be  |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/a1b170cbd384a9ae2e04aef7f0f118eaf700541c | ORPH
  riscv64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/58c06f1b5a1cb644583aae56e25a04c337e02c10 | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/d8a8389fe3f558f91b64a206e8ebb2acaf8c92af |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/8d88fbd39d851ecb8d7a70f0692cf17c36ee4f83 |     
  riscv32    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/31929b754c344b9e5de95019e772daf7f7303b13 |     
  riscv32    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/d98cc526e94e9afaaf055a60d84996e8064f8ea1 |     
powerpc64le  |          octave-9.1.0          | NOK | http://autobuild.buildroot.net/results/a581db68bd9741ec1736e29b405ef75507da1936 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/e7983ac55e7feda0b85d74ce3dede0e0ebd128f9 |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/a04a549aad0e9b011dd56c5f42d9755d68135323 | ORPH
   s390x     |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/d6bc5196c9386d1ab5c52c8327efd59c2ee3ba2b |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/703990d5864eddf733d6771c53c33fd14b5f1f35 |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/7552227070d83fc4ca4aac7f4e13c8718604e7fa |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/26588e85c03b2cc2cddce62494dd1be8ffd46e29 |     
    mips     |       quickjs-2024-01-13       | NOK | http://autobuild.buildroot.net/results/da1ac5d7c7070df248424326f32fed16d448d517 |     
    arm      |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/411946f0ef49471a38a94dce4b7bea2609019f5d |     
  powerpc    |        sdl2_mixer-2.6.3        | NOK | http://autobuild.buildroot.net/results/58c942db3800ae2b112eae49346ee5dfa445f88e | ORPH
    m68k     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/ff08716fa0c0290c58d61f0d87fd63c786fb4df9 |     
    or1k     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/3079af3ed0b0d498414451c8e6fcba77b54f7545 |     
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/811357afa90c1f893e1a4834dda73c9b4f2824b9 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/81eb65f85a215838038225c9f70e516c8d836539 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e0b353fb823dcd905c9551b72eaa290f903b1790 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/182843de3d27608bc2be46f12ce4a1b61baa9ee4 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/4f2e9a87a5164e6b99e7977504f3d77879f85cff |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b7bf55baf4ea1f4e34d39eedd600b42fd3096cfb | ORPH
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/173f11a32d5df344eaf04318c10cbc440bf393a1 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                libressl-3.8.2 | 5 
               apcupsd-3.14.14 | 2 
           crucible-legal-info | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-4.4.4 | 1 
                gnu-efi-3.0.17 | 1 
   host-flutter-sdk-bin-3.16.8 | 1 
                  linux-6.6.22 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ecc539be2305e4a977acf953d5eee21369caf02f |     
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/add45691713cc3041cb23b834d397491c283a046 |     
    arm      |      crucible-legal-info       | NOK | http://autobuild.buildroot.net/results/28b6d7002d7df80abb794da5de107409731008f9 |     
  powerpc    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/5e45439d9d1f351cfe47f3da9a1bae66800870c9 | ORPH
    i686     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/b7a85a5e5c3a953a278ac690afb0576922ff95be |     
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/847b56532abf0ab5166e37645cfafcba5f39740e |     
    arm      |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/39787c4efbd99322da17fbae470d05cdf8309cc3 |     
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/fcd88b8c0808e8873c3d23b3b429762da6486adf | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7ad060e37cf4672ca3c184a847c7140fe4095fc5 | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/239cb049423f532b73eb4bdf33908ace7054e313 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f3ded207febd900cac80bb16919acd468807677e | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2331fd315e6c0e303c97aa11dff0988b9c1d55a3 | ORPH
  powerpc    |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/76dd1cf2b0b62af145045017e0875a42c796c7dc | ORPH
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/46671d8f1821fd866078a9c52382d7841e9db2be | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b78886c6cc0cffa8296d053d11abf04a637d5b31 | ORPH


Gitlab CI results for 2024-04-12
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766684  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766686  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766696  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766700  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766732  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766756  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766850  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766965  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766971  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766973  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766982  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599766988  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767000  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767007  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767012  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767076  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767110  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767138  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767144  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767158  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767172  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767204  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767222  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767231  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767241  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767248  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767250  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767259  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767265  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767274  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767355  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767382  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767424  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767436  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767447  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767516  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767535  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767584  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767588  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767593  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767621  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767630  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767640  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767635  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767645  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767652  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767660  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767698  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767706  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767719  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767721  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767771  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767773  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767781  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767787  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767805  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767858  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767875  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767878  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767884  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767890  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767894  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767908  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767915  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767919  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6599767942  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609465161  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609465341  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609465491  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466272  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466307  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466353  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466481  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466641  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466749  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
