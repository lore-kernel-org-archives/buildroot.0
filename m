Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25903C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 03:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B454068B;
	Tue, 16 Apr 2024 03:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qfs_jAEklBHT; Tue, 16 Apr 2024 03:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 850D34068F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 850D34068F;
	Tue, 16 Apr 2024 03:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8C71BF487
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 03:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 465134068F
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 03:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqlkG_3VGd-V for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 03:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C812D4068B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C812D4068B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C812D4068B
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 03:57:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80A20E0002
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 03:57:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 03:57:19 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1713239839; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WR+6PFW7unnF5AVWWi6IfREKPT++VQMgu53gTcShAVg=;
 b=SOq7Pdaofp2wuOmfF4w/qLskDPaH1Ii4xTA3JlK/wNNZLm8tH+sltDgHZfOty21y0V4Be9
 H404XDglcWm/u5LfeANlexXEKN34qA1HmBRu1GEpPrks/JMZ/qQeKfKnH5Qj9r+QM0ZKjA
 JE+ttQe18elGUfEq56Ij3Np3V7HQTDoOoM9nsn6V8yO87WFot59lZuR1cJ5rJAkwDo57s1
 vE1nqn1M3g1NKe3E9D2FZ1Pu0utMxiBZHxc71qbnMGXxDny8CkZzf3H+oPXS4bFOFnS+US
 zS7pNv+dOI/oXhWZYEBEBcjd02dT5+S7OYMCFhI6ZowQgFLU01pw5ccXbqRiWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SOq7Pdao
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-15
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
Message-ID: <20240416035719.wXFBG8rMXIqGldsjZIx38so58710QnrqJtnfPpWhD1M@z>

Hello,

Autobuild statistics for 2024-04-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  6  |  0  |  9  |
    master   | 68  | 81  |  2  | 151 |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 6 
                gnu-efi-3.0.18 | 4 
        host-sentry-cli-2.20.3 | 4 
                 coreutils-9.3 | 3 
                     crun-1.12 | 3 
                elfutils-0.189 | 3 
          libcamera-apps-1.2.1 | 3 
                libressl-3.8.4 | 3 
                     mdadm-4.3 | 3 
                 dc3dd-7.2.641 | 2 
           dmraid-1.0.0.rc16-3 | 2 
                   foot-1.16.2 | 2 
         gobject-introspection | 2 
                privoxy-3.0.34 | 2 
                    proj-9.3.0 | 2 
               apcupsd-3.14.14 | 1 
               asterisk-20.5.2 | 1 
                    bat-0.24.0 | 1 
                  boost-1.83.0 | 1 
                    flac-1.4.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  gnupg2-2.4.5 | 1 
  gobject-introspection-1.76.1 | 1 
                 hiawatha-11.2 | 1 
            host-binutils-2.42 | 1 
              host-rust-1.74.1 | 1 
                    htop-3.3.0 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.2 | 1 
                  libffi-3.4.6 | 1 
              libopenssl-3.2.1 | 1 
       libzenoh-pico-0.10.1-rc | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.8.1 | 1 
                   linux-tools | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
                 openssh-9.7p1 | 1 
                    pppd-2.5.0 | 1 
               pulseaudio-17.0 | 1 
          python-grpcio-1.60.0 | 1 
         python-pymupdf-1.22.0 | 1 
         python-remi-2022.7.27 | 1 
python-unittest-xml-reporti... | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                rocksdb-6.20.3 | 1 
                    ruby-3.3.0 | 1 
             sofia-sip-1.13.17 | 1 
             stress-ng-0.17.07 | 1 
             strongswan-5.9.13 | 1 
                       unknown | 1 
                 wolfssl-5.7.0 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6eac46efec5b387a5b2ba46fdb5c82af34a28110 |     
 aarch64_be  |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/674ca4a654893b02b7654e2e91439e7b2f7b59cd |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/e4fc19c7dce5d0e59b5a8e5b1afa013f6f56a885 |     
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/85e587fb2e5dd1b32e41b6a8b51ee2e2109280c3 |     
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/718814d50ff1be1be4c1a64cffe18fac7a406bb7 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e0a7c1300e432cd02a55a7e4120ef3b778c5b987 | ORPH
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7c2d504645149eaeb052301e4885c45dec2d3920 | ORPH
   sparc     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/b77fc7fb26efb03d3fdac8bc52cfc786f53f5880 |     
   xtensa    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/e5d6bd1e6b57d4bd641c2f9921565e6a5a96c4a5 |     
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/4b0fa4a0583e36637da85501092acf4b5476a0b3 |     
    m68k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2d8eeccc8e1d26e48349f426f206725333fc8687 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c86f70722077af1ed08d875640aaa37017da64da | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/478d6ad4e9327c966158a69c1512d27c1cbd7d66 | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/11d5a02548f4c307561c4706c2d98b8a0f298eac | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cc30ec230b749da9182fb54ca48aeb6eaa017f21 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0eee79971b899e0716237d3d392eb0b6e938d1e4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/46a0eea4e356e686ae005b76b33cb29a3e303bf1 | ORPH
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/36ac5278d19195a21c3d02d087965e08f49228ef |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a8ec222002356206a472bd76f9649f7e3f9c4be2 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5449550ac83205c6832cb80db382338c78ad11ba |     
   sparc     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/797a0100b3dc255abdf260779af7e1fed17678a1 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4753ba43c32ca3530827796f3c86ff766bc87f52 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b304ac3948784cb1ecd11a1d4c45e4a63877d883 |     
    sh4a     |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/a4536e8ac3c01139256f4181ded8bab396075ef8 |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/6151c3ef438067a92da6babac865576f93945218 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/6593b219da4a9adf6e4e1b8fc01b12131962c2c9 |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/44b9963ad39e762733d00147a863b43e69e02426 | ORPH
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ef3293acd8bb7f46e8b7c0739e16b1ba90a3ec1e |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/486f1d9e20c5fba97ec5a316ec45834d8e740396 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/fe7e782a1ba6a013f4535f8e1dfb96c05734bf63 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/90bc318056a3ef403d93f561a9287e9687b24a21 |     
   mips64    |          gnupg2-2.4.5          | NOK | http://autobuild.buildroot.net/results/a2e8368b612b428ffa70a99fa2c901b09404b778 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/51b3e3a9b02117e9d329b86f962b13d30d1ede6e |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/fd49d09147f926eab220c5c4dbe05dc212d3fea3 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9446b56ab7d15a48e468bebc33911151d61a05b0 | ORPH
    mips     |         hiawatha-11.2          | NOK | http://autobuild.buildroot.net/results/f6b65d30f26bf0ea1f5d1973a57a59f54cc05cf5 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/7495e8332ff52c705fe66e655b2f37fdfd68e5ce |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/0edbc60eca75e33f6127589d3bc333c458b39d2b |     
microblazeel |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/f69d1c004ba839b36f1f232f92eac9c4872bf32e |     
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/538a6761470c18ab74b165b99a03ef7c2ec5639c |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/712ec4b9bb15f716673e0710ca437d433b58028b |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/645ff972f6b90cea4415f1f9a3fd9e99ce9e6b78 |     
powerpc64le  |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/96de7e3418a8f720078b1353c7575902e5d52849 | ORPH
    arc      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/1ba33fadd552b839461f449fbdc15d90c530ce4d |     
   sh4aeb    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e4982b8b228ec5959c6695b8af25a3caf59d189a |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4fde2e769cb5a5ae2ad826f603d77dc4fe9d10a4 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/dda42195d68279856113ebf2589d70adc8162af3 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/1a594b1de3fe258127e86d6a7da4d8ed3b590aca |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/56cd6267b39f0ff8c3990f29bec8ff6a9b211ae9 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/17f065ff8929061f18f1fbd9bf5ae959abe3f5a8 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/246a6add6944d1b14935e9a67d139bdc349bfdc3 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/948d76f3444c7d1d1be75c80603144b2385bbd49 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/de2cccca91ec839445c902719f89e22e25f5eaf5 | ORPH
    mips     |    libzenoh-pico-0.10.1-rc     | NOK | http://autobuild.buildroot.net/results/1fced4cd2a28167dc5416c2532d564d9db51648c |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/afd7c591daa8b0a1e3fd4da5ef73d59583d15b74 | ORPH
    mips     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/2f59bc8fb678022a8888be964de3b84b4c7164c9 | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/fccfd975c45ceaf3ca6f49d964cc82a16b3b2490 | ORPH
  powerpc    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/49e79d0aa88faf16be133907b971b22bbcad9920 | ORPH
  powerpc    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/0d195e941e0bab369a596c7c678726d963dcb316 | ORPH
   x86_64    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/932f45548ce9b392a00c0437128a62812063432a | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/487f5b42e38c76db14860a7c03ddb410caea3905 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/715d90dc64cd39ec22b901f1957faff0ab009db4 |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/836fda3003a050cca09bd12cedca6b13b89660f2 | ORPH
    mips     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/3c7e806ba5403c43fb9bcddb32e26022dd15c6e9 |     
  sparc64    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/95d5737932be21bf5aad52ec68cce49ed80f2458 |     
powerpc64le  |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/f5c02ccf0561c819f20978bd10ae0f3287750bd7 |     
 aarch64_be  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/631b5da8c9d7b86de949388765b7f4f61adef5ea |     
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/01c5b2cecaff36cfc3e49597e82a1f99842c8c99 |     
 microblaze  |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/cc73d7488367ba509c504ebd4ff9b063eaeed47e | ORPH
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/69234c4ef5d774f1f72d19cd92b6f53cb1d45a4b |     
   xtensa    |     python-pymupdf-1.22.0      | NOK | http://autobuild.buildroot.net/results/9a5587c631d2683aedef61df18265c202f2931de |     
   xtensa    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/b888ecc3f7731ea753dc22b2e90d14a110cec7aa |     
   nios2     | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/6596c5f0693f7daecaab62a0ea1d5256926a2a4e |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/4197e6fa73249318e798a64b74e20c8d8fe3e140 |     
   x86_64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/b33658fca697eae37e76ae112d1cd71a7c860b61 |     
  riscv64    |           ruby-3.3.0           | NOK | http://autobuild.buildroot.net/results/b5a1bc4d63fb304611b67b6138900d35993c2b0a |     
    or1k     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/b8cca58b7285e15852345e9462f452d99e1b43ae |     
   x86_64    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/7d6615c6b3601abe022d7d6adca83a38ac282ac9 |     
 aarch64_be  |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/6cf2bccdb7681ef8ca0c960a678fad65c41089e9 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d1a2d2f4d403baa539f420fc840a16c411396b92 |     
  mips64el   |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/44ec0f2ba1ee16baed2de074774806ebd4360a09 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/4e941ffcbdcc94ad4685cbde13e1b4c86177ca2d |     
  riscv64    |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/bbc4a112f9f0b44afabbd40c9df14b86abefcfa7 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               ipmitool-1_8_19 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/crucible/crucible.m... | 1 
               pipewire-0.3.81 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/f3ae0c23692dc35a7f8c22b94099b3b146e28589 |     
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/21693a36a7fa79f368aa22ba307765704128c6c0 |     
  aarch64    | package/crucible/crucible.m... | NOK | http://autobuild.buildroot.net/results/7bd603f524f5e739f100ca9270e025ddf1fa307c |     
    arc      |        pipewire-0.3.81         | NOK | http://autobuild.buildroot.net/results/622cd9a7ee8c6d15b219fb18c1816e6abfc06798 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5ecdb39bd6e96f67213229b19f1e82d9dbed0688 |     
    i686     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/10d6ae8846c60211f9273ccdc048d5c3cfc736f7 | ORPH


Gitlab CI results for 2024-04-15
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623401044  | ORPH 
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623401659  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623401679  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623403418  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623403421  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623401447  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402083  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623401512  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402147  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402165  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402316  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402338  | ORPH 
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402400  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402449  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402603  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
