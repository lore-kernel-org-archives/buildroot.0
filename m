Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6953C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 04:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E44C410A3;
	Tue,  7 Jun 2022 04:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSo04gV7a62j; Tue,  7 Jun 2022 04:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD564109E;
	Tue,  7 Jun 2022 04:48:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C994D1BF301
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 04:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B88824092E
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 04:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uc6VNyzvxLSd for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 04:48:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56A454091C
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 04:48:36 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 24F51100003
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 04:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654577313; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cv9qHcTcHQMtqodf3Vf5FR9fzyMLgICuCXmdFCQms/w=;
 b=DJ+MaKCs8JKt6CJ3hCo2tW7H9Y0fdRgz6AtBwVgI9GqTBzVlWmfOzPB/zm0gazBdfDzVCM
 uw9hu+budOS5qhcl+3E7TIDf37jFLQ2nrZyvEmLDf7iH3djSjK+gl/BYBLa1CeaTVTXZrR
 ulwWoImo1dy3oOAghAb6s5uc+3nqfeOIiIWxa3dZV5tPA9Ixv2+WmaTziZlmAf4iWSvZYp
 gmpppqJdwf7eERbQd+lucQ+JcQSWEOCNBs0PrZp3BT5cb1P7AxuToM/XVTX45OrmJRAszs
 mMKkRtVwZShhJB9YVPxGYEfoaFp4G9mvh7bop8PZqWTi1iAIAZvxFUFkcOicuQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 07 Jun 2022 04:48:33 -0000
Message-Id: <20220607044839.B88824092E@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-06
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

Autobuild statistics for 2022-06-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 19  |  6  |  0  | 25  |
    master   | 150 | 172 |  0  | 322 |

Classification of failures by reason for master
-----------------------------------------------

               protobuf-3.20.1 | 10
              swupdate-2022.05 | 9 
                 zlib-ng-2.0.6 | 8 
         host-gcc-final-10.3.0 | 6 
             libopenssl-1.1.1o | 6 
                 uclibc-1.0.41 | 6 
                host-go-1.18.3 | 5 
                busybox-1.35.0 | 4 
dahdi-linux-5c840cf43838e06... | 4 
                 dash-0.5.11.5 | 4 
                libressl-3.5.2 | 4 
                   perl-5.34.1 | 4 
                     refpolicy | 4 
               acpica-20200717 | 3 
               gocryptfs-2.2.1 | 3 
         host-gcc-final-11.3.0 | 3 
                 linux-5.17.13 | 3 
                 wavemon-0.9.4 | 3 
                     aufs-util | 2 
                     frr-8.2.2 | 2 
fs/cramfs/cramfs.mk:46: /nv... | 2 
glibc-2.35-96-g2c4fc8e5ca74... | 2 
          host-gcc-final-9.4.0 | 2 
               host-qemu-7.0.0 | 2 
              jpeg-turbo-2.1.3 | 2 
           libfreeimage-3.18.0 | 2 
               libglib2-2.70.4 | 2 
                   linux-tools | 2 
                 pixman-0.40.0 | 2 
           python-orjson-3.6.7 | 2 
rtl8189es-39c17661136da48f8... | 2 
toolchain-external-bootlin-... | 2 
                       unknown | 2 
                       xenomai | 2 
              alsa-lib-1.2.6.1 | 1 
                apparmor-3.0.4 | 1 
                bitcoin-0.21.2 | 1 
            bridge-utils-1.7.1 | 1 
                    brltty-6.4 | 1 
                       cfm-0.3 | 1 
                   eigen-3.4.0 | 1 
                  exempi-2.6.1 | 1 
                 fdk-aac-2.0.2 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                gnu-efi-3.0.10 | 1 
  gobject-introspection-1.70.0 | 1 
                   guile-3.0.8 | 1 
              host-delve-1.8.0 | 1 
host-google-breakpad-c85eb4... | 1 
              host-rust-1.60.0 | 1 
                   jimtcl-0.81 | 1 
       jquery-ui-themes-1.10.4 | 1 
     kvm-unit-tests-2022-03-08 | 1 
                 libbsd-0.11.3 | 1 
                    libev-4.33 | 1 
             libgpg-error-1.42 | 1 
                 libpng-1.6.37 | 1 
           linux-5.10.104-cip3 | 1 
                  linux-5.17.7 | 1 
          lua-cqueues-20200726 | 1 
luajit-f2b37f51f69ba7e9f8de... | 1 
                 mesa3d-21.3.8 | 1 
               mono-6.12.0.122 | 1 
                  netsurf-3.10 | 1 
                    pimd-2.3.2 | 1 
               poppler-21.12.0 | 1 
                proftpd-1.3.6e | 1 
                     pv-1.6.20 | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                    ruby-3.1.2 | 1 
       shadowsocks-libev-3.3.5 | 1 
                 systemd-250.4 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-bootlin-... | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-custom | 1 
          xml-security-c-2.0.4 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/26624498da2425051a6f03c489be7804c189ba7b |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/8bb3f7e2f2172c18c96a8e9cef0512535787980f |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/b83bc5aa3b3d07ccc28f87ae4e274df024f7694a |     
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/dca140c7f572e6285506a5a44b62276949a7974f |     
    i686     |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/0eeafa87c68a3a800d4fe6f208c0f6a6b73dca29 |     
    or1k     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/58f1dc7d4673c627d7e7ac38c4c75bb5402dc5b6 |     
   xtensa    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/0c3f5ac72e119d4067136b7f0d42a4a645faad7a |     
   x86_64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/1a7b627f326d8829386f88861c4e3358fc69999e |     
    m68k     |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/c46328d024cf410a90eb52c9bc021429cba4994c |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/8ce556c601b1478b10c42b9901c4a16d5661c668 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/016274801897d6fb01ea08c0452aa16c5d943dec | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/4c8dbb9aa7e49a1a0e5078a1a08565c76537b4ee | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a12f9429fe06bad849bc3f4b8a9be73e0360a40b | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a1674eda8558a072210690976b2ecda1b186616d | ORPH
   x86_64    |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/a0d602bbb1ecabe4f9707b9c552b50b587b521d1 |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/32d4464977e75de32d99ef32eda9f028ddeb2b6b |     
   sh4eb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c2b2ebd9db692f31c155d4bd265237dd91806ab3 |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/1efb4356394fc2dd93e66a715ca4abb5040e80dd |     
   sh4eb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/df8721bacf40d19406b8a3bdd2f181c19a88ebf3 |     
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/29c8947c736882ab10256c63afd313b62c8800a3 | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b92c42e69e88afd4b7d81389e251be236b2d0ec4 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0f37f1ed80976d67f5000603bcb4190c0a548552 | ORPH
  riscv64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/81c1fd2f64e927d700aa3b2853f3553152778801 | ORPH
    m68k     |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/37f3f40ee39739b5e557d634b71a448762107a4b |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/1548b89f6e7a1e8d0b1c4ef222eb308836b07e56 |     
    i686     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/b3be8379ad2ca3715cc94e22121215410cea162f |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/7793e8c98451ecc0d5afb27b09dee161389891e4 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/fd532eb157e0ffc0237d6dc2eca8892f151b96f6 |     
    or1k     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/040706c4365a5fa43da66041e53b6d9220c4553f |     
   s390x     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/7d69060deeaebc6c78d42deef321f6f47ad10ef1 |     
microblazeel | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/e7a904523b3fc6b9d533d485e7bb353fc8638c2c |     
   nios2     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/83ba6c490c9318588d9b83703b21aedc9b5d46f3 |     
    arc      | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/9bd26ada5b13b3d954a8aeeec0115a0a17cc66c0 |     
    sh4a     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/04fae0696c43d400031d5f1e288fdac97e4f6dd2 |     
    mips     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/3bd65f12d3fef54a478fe9f5da6df221a4a2c8dd |     
    sh4      | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/37fdfeecf16528cd97c7deeaeb3114c0a51b4fda |     
    arm      | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/d4710bae959df5c83c12786834cd6daa440301d0 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/e9cf96a1283dd374f8f1070db45dc9e793196fa8 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/f8653f9ff3f73a1e88caf79145e546c07fd77749 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/31b42eba947a266325e3203f28b248e65e5494da |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/1cc60561fa61c2f74e90151c08648495f4c19dfd | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/a430419cccd3df0db505acb1b2b69cb575e5479f |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/e852dcfa911f5a8ee9ae99601b066585d059cb6e |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/2b98d36ec19195a0dd38e63fcca80f3d5a417828 |     
    mips     |          guile-3.0.8           | NOK | http://autobuild.buildroot.net/results/011adc46475daf031f42c7a89f5143d3cc92658c |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/7038f339755cb200160811b32f8f3f9fc3aa54da |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/68d3e23728ca5da0aa3b427a1452ea4f6a30fe83 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0c7873c935f713df923d9c30886189a010b34e90 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/699fa7d9d07ed7833ff2d83e771577c8fca10aac |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c0942bd544cec62bd016c130661aea4b5d427ac9 |     
 microblaze  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/08a1391644ca4f98ac9a0eeda7e11cde47a9cf51 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4079b5ff32a7fe30428c498405c27059f1de7481 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3e4844dbddf3942447da43156e0e12011e00a141 |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1bfde1b690f08e1dbdfb6d803995a750ee7725da |     
   nios2     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/142a1acef6589c426760e43bf623ab645b1cb940 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/4f3af8a3b544e9b5f15ee663bfd90b68810778ae |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/a2cf3918c430d065fe9f96fe318f9c725a787f08 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/4d8582ced3b3bcb3393ae64951c376d8e48e4491 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/0e1f664df41253a3b4b5b054bfe895c6801692da |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/91102ec6316273395c744f6fc64fa03763259ad7 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/cb8340b818b1c06befe605a420df4e2cc91fe333 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/87021272ac4d9738386fb578edd050898a575f6f |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/ab71728e7a0581ab387c8bd4b1444bd99349ae69 |     
   armeb     |        host-qemu-7.0.0         | NOK | http://autobuild.buildroot.net/results/288409bbfc7d1e869a3b997b57919286ee3d5103 |     
   armeb     |        host-qemu-7.0.0         | NOK | http://autobuild.buildroot.net/results/dbd1417fb638ad41e9f23941141bbeb9c999fb05 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/7b204b2ebb80958a1fea5d585911a4626828700a |     
  riscv64    |          jimtcl-0.81           | NOK | http://autobuild.buildroot.net/results/3ac0f9b1980d5eded504166dff99015e23fafc45 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/1bbd6bfe7d237e75e114ab56ff92e1924c3b45c5 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/e1e4b88b81942f0d27344774155a27dcce97fd58 |     
 aarch64_be  |    jquery-ui-themes-1.10.4     | NOK | http://autobuild.buildroot.net/results/13b038a7ac88b6583ac2cd714acd48815bf11552 |     
   armeb     |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/0f52e42af730ad6cc794a1c51fb052076962bcb5 |     
   sh4aeb    |         libbsd-0.11.3          | NOK | http://autobuild.buildroot.net/results/271a8b697d2a2c75081729b65f31e4573740d79e |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/495366ddbc708ce97221ac561119866551986e7d | ORPH
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8eeffc074735e543e742795c7ab1e2acadcca3db |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/af28dc5f7958d353962bd77af113dd14a5d9cfd7 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/163fd557aecc4b186746194c8c83b45b82adabdb |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/1a3ed4930ba8a9d426433375688b4ab517a91015 |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/3b9d325b02cfd553a6088f3aad30b566963d2be4 | ORPH
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/d41b2e69559a8a9faf860de049627e19521096f5 |     
  aarch64    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/cd4812a76c135f2eb67bfc2031c8a57fa50eb911 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539 |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/b361a9896af5726f5b583aed119dc75b28867378 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/fdf8cd0e1cddd1c45c0a4a48255a6dbf0befeabe |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9ca1735257dc9d1ee018a9141075773bb8e30d2b |     
  riscv64    |         libpng-1.6.37          | NOK | http://autobuild.buildroot.net/results/9aa7dd767a9c85ff6921b21854d67e2a5dc8a1db |     
  powerpc    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/56409b16dd313d9a335049abb7238b705b4f0f62 | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/080b994f8dac5f3e08c876d92f39bc591b1a5a60 | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/57c60922a4752d402847c88b6bb49c83a81db0c1 | ORPH
    or1k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/c7322ba0dff24f7b44584361e456165bae2caeaf | ORPH
  mips64el   |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/a217a055c6a283f62adee9b6809d4d0238d53bfb | ORPH
   arceb     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5fab20844c74bf42694fe3add28e6df3114ba063 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/be3d31fe2c3e79168b9885ab20c01fcba7f578ba | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/8e2a8246fffe4ab1aabd465f324c9004bbf3322f | ORPH
    sh4      |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/762b8b5f1f26c012ec2e49dd0efd2a1bab6c1755 | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/da257766bf4539f33039885965fb0a695bc8a33c | ORPH
    sh4a     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/53417fb8713514ff193489459389ca92b4db220e | ORPH
 microblaze  |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/823c9e27cdb8e01a048cb751287c01c5dc70f860 |     
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/3751096941ae16184b835fd6879b4904f28c6432 |     
    arm      |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/1ce87c63426e66b0c52cf8708afdba51c447fb0b |     
    i686     |        mono-6.12.0.122         | NOK | http://autobuild.buildroot.net/results/6534ee4ae699c17ee98f6f89a8a1212936e04481 |     
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/bb8c1a442fe13e492c35abd5759f1c4eefdba463 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/8b11711e415a01f31a9bfd354f4eaa18474ad8c3 |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cab672a60b9b6b49e04140dec335134ccd4ee8e0 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2ff2cdadc39bc3a28478c5e7afb709f96ddebe07 |     
   armeb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/8c0ddd70f6d6ab0238e26536c51ea1d28c7396f5 |     
    m68k     |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/671b6227a5502e817a6cd4ad64b0c5e47b5a9671 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c33872468c7c71dac0eb22c87e5af27f3f6cd644 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a527a612b50ca800a5bcac1c3678dbe0a0eeca9c |     
  riscv32    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/fa332c9ff27bab57a5ba90ecaf828dac3f8a5b48 |     
    sh4      |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/b96f19994e6b15f89bb515ca40a186848a473b75 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e42a6d861bcfc39b78eb75c4d91d932a9bb532f9 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/af1c716b4e641067d999d82522cc628bd7f9b5ea |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1f979c722c84eebbef1dabb733645e8d80479957 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d7cab2d5a42c270c8f7ea804a2175bef3242cc23 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/90205c4765a1183a3b10947ed6c19b2c796e0399 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f95d7d74cdb67f8d13b7932ce58133eff9325278 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d1d85ad279852be69d9198bebd369e2654140ab5 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8a999500db89427651a96afef968666ccbc21a79 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/1c526f4fd1e0b77e76ebdddfab78f77c5b400022 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e6c3b44a758057ef4729076def09bb8e15167c26 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/b35e16e4805f044a1aafb145d2bd934f48758c1e | ORPH
    arm      |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/399384e59ae8809f848506783d8681781a8b6d15 |     
   s390x     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/abaaef59b1d34ef849a32d72c1f359b6a8f94e67 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1a23ac272b267edfd745df1a1c0ef692a156f6aa |     
    arm      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/74f46ee60b3fc24652b3e7cca99d1a68f5da530e |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/af75054a420cd4c984f0333c949f3e461b69575f |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/f1b91c1997cf981f902000457ab9df5539d657f4 |     
 aarch64_be  | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/d2bdef9d506637bd428f2d9415cc6628eed4376e |     
   xtensa    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/9b82b6e3d5ccb2f3178ddc79dd139992184299a8 |     
   xtensa    | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/bd1df41d0070ee5dd8b5c565a5576237bde315c3 |     
    or1k     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/1f29bd8778076cb5f4fe3ff55661bf374fc7ee82 |     
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/764cc5bdb855206332ee0f42a80bc00c96ecf35b |     
 aarch64_be  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/3cac0a427609815daf6548b6bcc2b5da87fcb009 |     
    sh4      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/7759e35f725c68ea0c68349451824a316c0e92da |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/404ec971422c6434aa5209562f70dad5183ab3ca |     
   x86_64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/66d7f87bb3818f991d772897072b2b733dd0e5ec |     
  mips64el   |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/509437f48f76c319be179b29e827c38f58b34133 |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/500f958ea2ab8f5a5eda83df520c9847a246cf6f |     
    sh4      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c44d14279c1800129197500d68a4cb8b9de09ddd |     
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/56173a35ee9b9924395bfbd233ea8fe5f5548bb3 |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/d4edf115aa1d70cc9ecd06dd52e004a6e66ddafc |     
  riscv64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/21e2f1ba677a09eb73fe85ab6405501dd8f3856a |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/914c2e3acd463f68c0a4552dea27a94b6b653946 |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/7f89d9d66548b1ff8014812d0715879bcfebd68c |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6e145f1367dacbb7660148ac1e8b952ee15b1c8b | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d6aee9b275b1ec399aea59758ac8f69fdc5691fc | ORPH
    or1k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7ad407673d6e0170c76de72d020cac776b4173aa | ORPH
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/631e4aa532619468ad42d1512b1bf5d10e41d65c |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ad4f81a4b847ea8b7142c8ceeeecf77343c71d2a |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b41a9074d6d52abf3f224311e2fcaf725ac1943e |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f3e895348178b9ee06da551a75c906b7d3dd21ba |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/631f0b294de13c3a23d4765a5333edc4eac69f2c |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3b1aaca10cecc29c15b08f9fcb4023d2f3aecabb |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3a596561217e9c95609cf63c90d668c909137b78 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/60ab723ec83704530eaefc57036fda38c65c92bb |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/02ac7f5f45e546db827354fd17d642a57f5fcb44 |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/954dc44e911c167a2173c6b00fd5c34acada992d |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e10e0149d1fa2f0ab8fe0ef0a6e3afb694be64e7 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ba15215b4ec202fca739ace197c5b1fed3cba23f |     
   x86_64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/a5c3299d5281e430d9a85432378d6901f3571594 |     
   sh4aeb    |            xenomai             | NOK | http://autobuild.buildroot.net/results/fb75cef3fb392e575bb4bef6644c40dc4859274a |     
   nios2     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/c5cdc5a85ae444ff4385e2dfb8b07648eb417acf |     
   nios2     |      xml-security-c-2.0.4      | NOK | http://autobuild.buildroot.net/results/e908e59ec5b8e1ac505c44900dcb39527f0ec1d3 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ebffb96639a545232ac9da444b470ced5eee2fb8 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5ab25df34c04a2e09950307cfa1027d54af977e2 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7f5da5d07c5c17f5993ca307db0b75c71206b8e6 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b497581a848860646431e1e7db6a49b5e3353e71 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f30ceb94a8cf5ed5b3349d42532f0c5c38381dd1 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7664ca0264f36790df3ac4134d0b804728d1c8a3 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1f53082454705fcf94a5cebad671b19b294fa81e | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2f4bd10a5239f95bd6dff52baad189201f789895 | ORPH
    m68k     |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/493f79fc79d6aef4f01f83cf3e7f464558fa3368 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 2 
                 wavemon-0.9.4 | 2 
                    vlc-3.0.16 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/dd092347a1ee4477e5f4907bb45d36f3581145c7 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/273f7e4c0b5bb305824f48c97c22345b7f73c9fd |     
    arm      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/72682c8ff4b2a3332e3ae0db7e9d4e0be88ee822 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/247ae620425252f82dbde888fcd91e1e2d3fdd78 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/eb42d4656169f61cb3ffc8f51e4e5a8603374d9b |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/dd1775a9fa180c93a255d482e72af92f07492100 |     


Gitlab CI results for 2022-06-06
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
