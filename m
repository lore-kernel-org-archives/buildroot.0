Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE280C32771
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 05:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C7782C7D;
	Wed, 21 Sep 2022 05:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C7782C7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQH1Oaf5Pb8S; Wed, 21 Sep 2022 05:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF1A82846;
	Wed, 21 Sep 2022 05:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF1A82846
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52E151BF963
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 05:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EA2441825
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 05:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA2441825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-Zi2j23qMUq for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 05:44:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A033E410E3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A033E410E3
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 05:44:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E29B5E0003
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 05:44:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 05:44:08 -0000
Message-Id: <20220921054415.1EA2441825@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1663739049; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y85Zr1qsfFMrlhyex7EwSVvofKGv9AytpDgCgOpAll8=;
 b=YQoAW03H/xg0XthyrTTBp5i9OiQNW2ofHUT/qr2rNmeUz5pwyDFISX+53XPmQw69pqHPiI
 trvUiKYkx+18S1gT/5DaDtJAnaaOs7wNKElw14bipcwAkkQPtbrdWauLtmrQ/Bl35LvAHJ
 /tQQ7aMbO/h4Xba3NACaodkwmhH8yiitd6ry2XNkV6DNr1a68APVk93osLy4wcqFRHaf30
 qQf1LYtNVfndZbWMouX1mUNvhFSXNluvwTBYtFHkgcYF5numOTkGUPgAlfizVEP+Mvww9e
 K7e6R6xbWSybVDkVoEsLTYGu+pTSU7hXqbWSB67ETc6t6r2LZYNtUfSjua2qkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YQoAW03H
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-20
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

Autobuild statistics for 2022-09-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 13  |  6  |  0  | 19  |
  2022.05.x  | 39  | 25  |  0  | 64  |
    master   | 208 | 166 |  2  | 376 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.35-134-gb6aade18a7e... | 10
            host-binutils-2.38 | 8 
  gobject-introspection-1.72.0 | 7 
                 linux-5.17.15 | 7 
                gerbera-1.10.0 | 6 
                host-go-1.19.1 | 6 
                       unknown | 6 
             libgpg-error-1.45 | 5 
host-pahole-73383b3a39afe86... | 4 
              host-rust-1.62.0 | 4 
                 dash-0.5.11.5 | 3 
                elfutils-0.186 | 3 
                  exempi-2.6.1 | 3 
                 wolfssl-5.5.0 | 3 
                    zeek-4.1.1 | 3 
               fftw-quad-3.3.8 | 2 
             fontconfig-2.13.1 | 2 
                  gensio-2.5.2 | 2 
          gitlab-runner-14.5.1 | 2 
         gobject-introspection | 2 
host-spirv-llvm-translator-... | 2 
                libcurl-7.84.0 | 2 
                   libiio-0.24 | 2 
       linux-5.10.109-cip5-rt4 | 2 
           linux-5.10.115-cip7 | 2 
                  matio-1.5.22 | 2 
                  ntp-4.2.8p15 | 2 
            python-ujson-5.2.0 | 2 
                tealdeer-1.5.0 | 2 
toolchain-external-arm-aarc... | 2 
                wtfutil-0.41.0 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
               acpica-20200717 | 1 
                    brltty-6.4 | 1 
dahdi-linux-5c840cf43838e06... | 1 
              e2fsprogs-1.46.5 | 1 
                 fdk-aac-2.0.2 | 1 
                     frr-8.2.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              fstrcmp-0.7.D001 | 1 
                     gmp-6.2.1 | 1 
hawktracer-e53b07bc812c4cfe... | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.3.0 | 1 
            igh-ethercat-1.5.2 | 1 
                ipmiutil-3.1.8 | 1 
      libabseil-cpp-20220623.0 | 1 
               libdeflate-1.12 | 1 
                  libftdi1-1.5 | 1 
              libgcrypt-1.10.1 | 1 
                 libglfw-3.3.6 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
                libmad-0.15.1b | 1 
               libmdbx-0.11.11 | 1 
libpam-nfc-64a8b30ba2cfd634... | 1 
                   libqb-2.0.6 | 1 
              libsodium-1.0.18 | 1 
              libuhttpd-3.14.1 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.5.2 | 1 
        lttng-babeltrace-1.5.7 | 1 
            lttng-tools-2.13.2 | 1 
                   luvi-2.13.0 | 1 
            makedumpfile-1.7.0 | 1 
              memcached-1.6.16 | 1 
                    musl-1.2.3 | 1 
                nodejs-16.16.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
               poppler-21.12.0 | 1 
                proftpd-1.3.6e | 1 
                 protobuf-21.5 | 1 
                     pv-1.6.20 | 1 
         python-greenlet-1.1.2 | 1 
           python-numpy-1.21.2 | 1 
            quickjs-2021-03-27 | 1 
rtl8723ds-76146e85847beb242... | 1 
               snort3-3.1.18.0 | 1 
toolchain-external-arm-aarc... | 1 
                   uacme-1.7.2 | 1 
                 uclibc-1.0.42 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wavemon-0.9.4 | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/9a537df7f06078c976835d893634aa8d417f778f |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/6ea50d5f1c59230e165c7000540756434fc1fd41 |     
  mips64el   |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/c8bc7ea6ec0fc7f712ac42c528db4b556a5ca9aa |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/fee59eb89483e4a996f6135c50d545a67fd47c8e |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/a52afc4bda7dd21ba00b97d22dfd8464a0ac618c |     
    m68k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/20c86d7400814db16e9cfbd041cb724ec5ecd540 | ORPH
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/217a71c2b389442604dd517aec8f464598206a6c | ORPH
  powerpc    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/83da80f23d337fd67000604770a247212b9d8f96 | ORPH
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/f447fb6491f5dad3299a3bb1c2300e27e34fe496 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/28fb7ab0f7b7c60834034e010dda81e0cc56037a | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7341ddc7052d2d8dfa77552dd758d6c37f8c73b5 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/987824a067cb8ff8d90adedeacf933b56462c94d | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/b423cecde1023474c56ffbb2855a1f6041f94592 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8ce62f3abd81dd57380377e08625db6458c97451 |     
   armeb     |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/90aee5607b4a71fad82a61743481fe6013a83fc4 |     
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/4c2d9c9eca8352547601bfe7ebbb1c8916265b02 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/1cb13f13076e148e29966cb3d606f3d4c49dccb6 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/1f81a27c6d44fe63178c69ee2e0328762b1f3b6a | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/a65020a3a5730cb55b91dfc9ed3a268da580701b | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/903c2ffe0844b328333191ee156a8758b3f27f22 | ORPH
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/20786a82f7c306bf9d25159c4ac6212841f4b321 |     
    arc      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/74fa211ce47d7bcb7fc432dcdd02833ca2f6a88c |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d3447623f41bf4fea4ef4aa39499379a0237cba6 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3fdc122f8cb039d937670adf43142941da90c078 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/be0aa028b6357a4d9768d3c11443e1ca57176b02 |     
 aarch64_be  |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/69ec8b7a557053fc2bb417a7fe898d8397d8f035 |     
    or1k     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/f629ee195d82629438d45fce41520803dd619127 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5758df8a2cfc584a7aa56c40ab5fccae6563e273 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/998930bb530982f2ea556cdc035991d85b23719d |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6150be93aa47344c50bce77d3b0913e13f9476e2 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e1344d0b60721bafa80fb8b8d063ae25a3141846 |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a1aa4cccad3d831a092526eeb313ad4b622586ff |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e9a7a890ed8f88ca0e8b27ef9ae56de156a3d8ce |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/8ac5c50ff78fe2c12e3170b2e5c1185b6753f06a |     
   x86_64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/eeac9cbb3896f6fa3763be9031a053dd9690c11d |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/74449c4fbeae8836a82447accbef9bf4384ea44c |     
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/7da5fd4f9d6b7660b9c3e44e69f6b2d90b46ea07 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/01d53f7bc4b6a4e6da4bef95cae1482f405c5e34 |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/6af6f27303f8d2423749efeca55a46ca55a33290 |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/62622435375e596b510f8197b418deba9de67439 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/c11e8a6f883dad31e98966622e962590549cc5be |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/8d1d5785cb227e4125e22a51f2ddb8455be69dbb |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/2a5501055f281280e135d6b840532364716cb41d |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/d5e2affe7289ca33f5556f4b0c50c9525a1e6094 |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/9ed8d4dfff0e2e7ab514073d882ae70b3b63a487 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/4cf45351c2e1a5e909e96ba89ca105b816be1ce9 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0072d41af40201014d296038bbdd8eaed7db6bd0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/bd6ec3d1278c57181a76ace201edd87a7efbfd02 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e5bdab4654c9b23f77030ab1cf97c06926927d52 | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7e6f603434a8b0aeff854dafa198d9d3716e5d2c | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3cd6be64427c31610d3ef8ac9f7e2bfb08960526 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/388242636d1243ebe094ea7ea5a2be83aac09cac | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/af3bc1c7c6f84e94b74474e0d71fe843fb08ae1e | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/332b44a04c9f4ee981432db171235ce77fb4e53c | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3113c27adaeced6771eb10ab6f03322168061535 | ORPH
    mips     | hawktracer-e53b07bc812c4cfe... | NOK | http://autobuild.buildroot.net/results/fc6d41a2f44ce19a132c4245423770a2f7c87aec |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bc8d87a8eeea75e5f9188e0a5aaa508a1f724086 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/959f501dbacd03020b3e633174f89bf0511149fc |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/81c63e1030e5e406919e39f7ee074ab80ee3000d |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1124a74cd2f53657e98ec90269335fb6d13ac012 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a3056697bc26b2615caefcc9a8dddfabe9398816 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f7e61562ad219f6ae3231541cc6f026c77228369 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b44aa1275af52d241a4ffa2b49d8f5021b58fdeb |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ea0ce06e195da2b01dbb18709aff160977e6e1e9 |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d04d8d5f66c82827f27584a29c023de41f312d00 |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/9dba2dc125e477ff417bd8ef9e6a3a87cd1a9c31 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/9ecab5698674cdf23d4d7c62273aad45bff3ca9a |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/053058b45736cee77334cd6a1fa84241651133e5 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/8d0cf03835d97771f796a2868d60a4dc2db99404 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/89303658e917c614edd16db16619076bf9661c33 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/970fd04bdb202cb7e31f881f9ab4ffa5e8ac37a2 |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/065584c5bafae3ac1cb5fe906566fe25a0ac9ccc |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/da1a777ae0a81d1ab889d24c6f000d978e983066 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/cb013b386f32819bda1b3de38af13ccae084c719 |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/61ebf5936cf1f3b3487123018a2b4b649e158055 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/694fa81e9448afc5b9f89fe06ac1a9940f3a2bd9 |     
 powerpc64   |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e9dac7557bf45d44deaa9b10ad72f2e5aa18ba00 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/686747fc3028ce06b1e68c880e96c160a9268702 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/c9dfcc98530cfdfb3edf70ecccf3489da2aa7620 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/d0b95472166e78216ce27c0a8d9849378ec5ebc3 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/027654de7c498ea8d13023930f7e6318171d965e | ORPH
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/cd153168e1e919ec52f2be5f9cb5a9426920bd13 | ORPH
   arceb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/c1f2fb8395d3980aeb63eb727b2fab34cdf75632 |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/bad8eb3db6874b0ea1add1a6b252adfd0573e236 |     
  mips64el   |    libabseil-cpp-20220623.0    | NOK | http://autobuild.buildroot.net/results/a2647222a1952f58e9507adf59527e4c620742a8 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dc29d2dff6cb179365818ca39037dd13437e9176 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c7461d48a98d84f7449c4cd789d811f956cd217c |     
microblazeel |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/5c26e2e9ba8b66a598553d36e10313e2fbea2e39 |     
   sparc     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/5085cf78f859a1f825beeb25e7ba1dcbe5fe26ea |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7d51d267b195fd22366c37087894ba9e5a408334 | ORPH
  aarch64    |         libglfw-3.3.6          | NOK | http://autobuild.buildroot.net/results/9b53e2f74ba4085618e21c9382d612393850689a |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cad9652faacb2d6991d20f11d1d22acffb6c479f |     
   mips64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/eeb5347990682570e303010f83ac3a38ac66ca87 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4e47e27e7237687d7e2d1e7fe65b9c91ab714bb1 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/8401c7fe4c754184d904b8adda723c71d9f3e536 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/15ce4b72d4ee4b6e540ae01227e45bd175c29aed | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/793aa961213039b6412d897584c2c4f1a43f0089 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c153fee1d996f981aa27ef6169b32e91aad6a90b | ORPH
  sparc64    |          libiio-0.24           | NOK | http://autobuild.buildroot.net/results/d17fddd9413258440dfe5e4a65304c8287035bf1 |     
   sparc     |          libiio-0.24           | NOK | http://autobuild.buildroot.net/results/708f26a343cb57d899607461ae6ccc24d8b00e19 |     
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/c2f0409620b3e84b27af0e313c4f3c1b3aee0cfe | ORPH
 microblaze  |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/877bc75a3da49dc2081b7ddeb873c1403ad5f723 |     
   x86_64    | libpam-nfc-64a8b30ba2cfd634... | NOK | http://autobuild.buildroot.net/results/71c2efed205eea6bf211a205a2dd2b99fc9f115d |     
    arc      |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/81d681b01cb18b551919ea0072f318ce55b6e96b |     
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/b8e62ed1c8a5d103f790482d94d7e10e38ea3172 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/051e6a7d314adae873fd9ba14b55d665a202f933 |     
    mips     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/c07bd6a62defb61b65dbd38d0c1033b031bfc17a | ORPH
   mipsel    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/e4d84cb5978d5851559c0d52456231865a5f1820 | ORPH
   mips64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/312aeeba339300a9ff1c70affb6532703c7ce3d0 | ORPH
   xtensa    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/1b5bad25e524b22bfe35787cbbfe204bf48d422c | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6d3fd669068dfbca3909c23c01c655209911eee0 | ORPH
    sh4a     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/47176a04fe0c7a41085c0e4c33464fe51c16b296 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8dc31e0ca1e4fb999662785f8de903ddd5982472 | ORPH
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3289bf96f1dcecdb77a0882f19ad88fcb628e67f | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f6774462b58c7d6cf87ff9a34ac4e1c98cfd83f5 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d1056b970cd3db62ca6f8ac34977ed7effbc98a1 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e8d4bb819a8951c8d7b01799e01cdd47f5ce40ae | ORPH
    arc      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/b475e5ae8a740692c68f572dc2f700d2ab33a185 | ORPH
   sparc     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/eb254a62f50af233282d91fe5bf4b830be29a57c | ORPH
    i586     |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/5c441e7186b87431742b4da1cc395f2d1f1e3862 |     
  powerpc    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/872ca5da5d76b025f4d0e4d8bc4b779de18378a9 |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/609d1c44c204fc99cb8e5dec6b3a16b0da748f60 |     
  mips64el   |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/f34850f0ce415003be74139ceaab40f689e33d53 |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/d70855ede2cf877cea368eb5929bb7f38f589b83 |     
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/c5727334c77deeedb8ae347e5f8b80cf373d9f82 |     
    or1k     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/fade0b4928e1aa07bbeeeaafb5a62f6d0c822230 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/1ca2856459dd21bdbe5a7241ccd1dd9c7ca1995d |     
   mipsel    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/0d97c6056a475a29dcb0e53da9b0f04ee70886ae |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6de1aabf4e769ea711b0665c1a1af04abfad7ce2 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/2b1fb9a196c6a4f62293ab22ff03b350a306abce | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/42f703f48a7ca2857c9080c8bd43e6ee968cf439 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/3813bfd0f95cf361f102518098a916872aa3a187 |     
  sparc64    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/f71d38ebab55f37ee64bd721bf48d29d6c26927b |     
    m68k     |         protobuf-21.5          | NOK | http://autobuild.buildroot.net/results/22fe4aae62a14b95cf4bb73caa986d581c480d13 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/db51ff2c80295beb22ffc870068ddd2fc1e4bc06 | ORPH
 powerpc64   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/a99c9dfffcc8e2b5bae7bd255b31e8f850d0470c |     
    arm      |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/36f7ded0b4d0dfaf14609a3ad265ab55bafb38f4 |     
    or1k     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/a768a4fdce5da92fbbffce63db08e27a9ca8db55 |     
microblazeel |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/91d47d27d2fe57b40afb527c7088dbfccda0aa7f |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5095de119f6a3a2e0ecbfb373299cdc4d3cd1070 |     
  sparc64    | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/ba57f3cb210a93688af682cb75c9f1917baa266c |     
   x86_64    |        snort3-3.1.18.0         | NOK | http://autobuild.buildroot.net/results/92e888bb9af7474647f57e2a9a77c58826cb552a |     
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/217fea817e2cd1f1ab5e6d811e3115cce0f48abb |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/05d48e4dc5a413ba264456af953c0902d4d74ed2 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/a846192df7970be6db801925fee38d47875a39b7 | ORPH
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/a4d0c1e3a725cf36dcad09aab40f580f669fa444 | ORPH
 aarch64_be  | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/89fefb16995409bf31c2fefc421cf1cc02f2da36 | ORPH
  mips64el   |          uacme-1.7.2           | NOK | http://autobuild.buildroot.net/results/ee4c4b4b8f6dba0c2cc166dd48350b1b7672e641 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/fba2e7f241d72c42cc1eef9f8716e9e2929ad248 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ecda3a881b749a48a378765a2def5d48d8b5502b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f0fc7e58457ea8512b23a5eb9a7ae3bf9f1a1511 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/84da787af89ab6353f6be8fd7ccab6889be58ef7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c367de7d1851e609e9a57cd9f9517f86cc1a9be9 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c2e735c07f96a5b8db374a5793001777c27c5c92 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c4fa50d846d2ca428feaa7da515164366be3efb2 |     
   nios2     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/fb5e23dcdb244de169c5e5a083b866cd31772620 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/61739a92e6173b9614434df097d4f3cacd8dcf5f |     
   armeb     |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/829f44cb19340d1f8bdaf7e7ab5ff9651551936e |     
    mips     |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/ea8b5150d7412b5a52d46848efaccc4ebf1a94bf |     
  riscv32    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/234de7cd8986cfdc5dea83597c226c6780e0067c |     
    arm      |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/b58b71e25ba1b0bbc77a2d2dacf8ef90276d90c1 |     
powerpc64le  |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/6a35641eb992dc1086bd28ddce2f991486c01e3f |     
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/04627e3e6a88a1223b27694458241325a3e1fd4e |     
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/3d5d795dc1b380eb6547f06900488140c09579cc |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/4cc528744480426dc2dd53e1d6398e8d1457dc20 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/c278832fc9214e55523d4bacf2724aa3c2f0f8e5 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3e5e79570dd3b27ab1ef21d13bffae54863327ea | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/fb005b6aa7bf3acbd46dbc6bc60b96ae11375ba0 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 2 
                  exempi-2.6.1 | 1 
               gocryptfs-2.2.1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/cab465ceea2e84ba606e7c04980d1331ad5b84cb |     
    arm      |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/3db9a4f331526783bec79498d4e75bfdc675bd7b |     
  mips64el   |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/ee290a526e1dc3d00e07a128e13bfe616383d29f |     
   s390x     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/e6de55f599e1c6b66f248e934543234f50165de0 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/a069d8c661524ec56eb68a8c609c109fd9eb4c37 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6df1f04ab5f50a8b7cfe23d8a36e3831953b34ac |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 4 
                host-go-1.18.6 | 2 
               protobuf-3.20.1 | 2 
               apcupsd-3.14.14 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
                     gmp-6.2.1 | 1 
       host-gcc-initial-10.4.0 | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.60.0 | 1 
                 linux-5.17.15 | 1 
                     lz4-1.9.3 | 1 
                    php-8.0.20 | 1 
                 pixman-0.40.0 | 1 
                proftpd-1.3.6e | 1 
                     refpolicy | 1 
                  sudo-1.9.8p2 | 1 
                 uclibc-1.0.41 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
                xenomai-custom | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9a41d2ce2521267d8d12b7585b3fdf83d482a237 |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/cdd2bb0e95147b44c84e356e1112e2d91180ae25 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/f3f2547664af4b186734652e41eefd7ad9d5858a | ORPH
    arm      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/2502ceb86d8389f225204b30bf4d092eb5b8de0a |     
   x86_64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/2bd99e49c3cd7cb57a8b2a6aa956b43d5b9a78f9 |     
    arc      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/eea6cff3451b7def789d6294500ab20701684217 |     
  mips64el   |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/1684e63e04e3aa304d846cea431884b3aeaf0bf0 |     
   armeb     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/af31f9953733a6a918b7bcb8ac53277048a3e796 |     
    i586     |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/2917c7e84bb14a22e638ae2e4dfdb48d3ae83199 |     
    i686     |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/d2cfcd8b4625bd0ce8192cf772427874c4917919 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9a5ca8225b0e06e8e487168d2baefa9830b8380e |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/473d82057325ee58964b986fe0c9b26d924de788 |     
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8a52db68c61f0924204fa62f1ec75dadc884e81d | ORPH
microblazeel |           lz4-1.9.3            | NOK | http://autobuild.buildroot.net/results/e162dd789b77e42a1514d6aada912898feb23c67 | ORPH
 aarch64_be  |           php-8.0.20           | NOK | http://autobuild.buildroot.net/results/54f24406a2a83916e83e8f1f3ed9dece9e316058 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8d14fc5e0c3c6e909c568749482cbc8cccc3a296 |     
   mipsel    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/747fda965717b3ebf52d1287b2c3e2d8356c4659 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/451689ac1da0896538e99872d731516313c3139b |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e4f35d720530d4ab09286b80587953a04880f327 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/a660f5f429718c5fc8b2bdffb931929b06d43e3b |     
  mips64el   |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/7dd77b8ad139857974914717f63021ef30fc97f8 | ORPH
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9b06d842a7bae525c51a8b8ca6e418ec0e8dd465 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/357d18440f74018e72a5b8f2042da311fd319fdc |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4046dd46cd4afb116fe9c2cf60bbec0d818b92ec |     
   s390x     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/e4a1fd4d4960bbdd10859ad4b064d926974dacf3 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
