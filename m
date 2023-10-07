Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621C1E81E1F
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 05:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE0734057B;
	Sat,  7 Oct 2023 05:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE0734057B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9X0adKlM_Sh; Sat,  7 Oct 2023 05:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 451DF40580;
	Sat,  7 Oct 2023 05:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 451DF40580
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2051BF3CB
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 05:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB6DB42D3B
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 05:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB6DB42D3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDqDKYwbDWXH for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 05:47:06 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1554F42D3C
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 05:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1554F42D3C
Received: by mail.gandi.net (Postfix) with ESMTPSA id E431A6000B
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 05:47:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 07 Oct 2023 05:47:02 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231007054708.BB6DB42D3B@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1696657623; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jL0eFumhlGKvPpOAP64LVPYXEd1T1QD2ZVJ6NYsvn/k=;
 b=jT9LehRQ8QUqwdEGqyUVgfw7sBPdM9so24HSYvwOyUtyjYb3WO7+t52fP3M3D6tKvc/HuZ
 LfEAlnsl2WXj62okdoNGuqpiaJihzDFAcKSCEPw7UvNzfadLvnserpbetaAmwZtScqAaaN
 sEUm1IAYk3ca7X6adEniJN/K761qRXBDaSHHXvG2XE8T++AajJQWBA5p3dvdLCDAJvubXh
 1vEgT1gH0iQXaqlbGKxJn35w1LNIL1+5pDZikWaTkPAjW4hoo98GF4/+b+pgTvKrFTO1VX
 1ehJFxk+SAqWSDKWKB7kzPfzVhR51c05IdkMue881GhnK6zepYoRu27Yi6T1LA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jT9LehRQ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-06
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

Autobuild statistics for 2023-10-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 18  | 11  |  0  | 29  |
  2023.08.x  | 17  |  8  |  1  | 26  |
    master   | 72  | 107 |  0  | 179 |

Classification of failures by reason for master
-----------------------------------------------

               alsa-lib-1.2.10 | 12
                 openrc-0.43.3 | 11
                       unknown | 7 
                   bird-2.0.12 | 6 
              gcc-final-12.3.0 | 5 
glibc-2.38-27-g750a45a78390... | 5 
             alsa-utils-1.2.10 | 4 
              host-rust-1.71.1 | 4 
                   linux-6.5.5 | 4 
                host-go-1.21.1 | 3 
              libarchive-3.7.2 | 3 
         spirv-tools-1.3.261.1 | 3 
                 coreutils-9.3 | 2 
  gobject-introspection-1.76.1 | 2 
                libselinux-3.5 | 2 
               lightning-2.2.2 | 2 
                  monit-5.33.0 | 2 
                    ncmpc-0.47 | 2 
                  acpid-2.0.34 | 1 
               apcupsd-3.14.14 | 1 
           at-spi2-core-2.48.3 | 1 
  binutils-arc-2020.09-release | 1 
                    brltty-6.5 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cryptodev-linux-1.13 | 1 
                elfutils-0.189 | 1 
                   ethtool-6.5 | 1 
                  ffmpeg-4.4.4 | 1 
           flatbuffers-23.5.26 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
              gcc-final-11.4.0 | 1 
              gcc-final-13.2.0 | 1 
                    gdal-3.6.2 | 1 
       host-python-sip-4.19.25 | 1 
              libostree-2023.6 | 1 
          linux-5.10.162-cip24 | 1 
luajit-41fb94defa8f830ce69a... | 1 
               mariadb-10.11.4 | 1 
                mongodb-4.2.18 | 1 
                    ola-0.10.9 | 1 
                   perl-5.36.1 | 1 
          python-rpds-py-0.9.2 | 1 
                     squid-6.2 | 1 
                xenomai-3.0.10 | 1 
           xtables-addons-3.22 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/c15343b7fca75f9c96ca0aa65900b0d0c012a8fe | ORPH
  aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/e8a77b6e4d0b3615ca0905d6824e246fa0413e94 |     
   mips64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/c25e9f1fe890ce5682f7f5c89372f9e5877ec786 |     
microblazeel |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/3a058022b430d7a88e395dc633cda45724dcf182 |     
    m68k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/04fd04e191eaa434b6dda2aefa8e974fd1e9d19a |     
    i686     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/c34e9bde866c2fa620f79414be7405582f761f06 |     
    i586     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/cf19be21355958f716da9f5dfa1ff4fd43bbbfa2 |     
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/526a7dc6c83f8e9cff279caf34b241bf33990f40 |     
   mips64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/8526213370991dbd78884f34ff79d755ffa1a647 |     
    or1k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/f48c73b95cc02ed5425ffccbb20d654cc881ee02 |     
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/3a402e82adeb59ebedd123da190bb61f9043ecb1 |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/e4f7fdf0c0555152f5d16f6a4c1fc703692d55b9 |     
   mips64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/fee7392110009943dccbb3d19c019925e3ce7985 |     
 powerpc64   |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/42f7b0fa05151284a36f83ecaf07a0e52e1298f6 |     
    i686     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/e9458a8b911094508e2eeba4cb76a20f7071b677 |     
   s390x     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/377cbef707e73d5a7235b60e23564516b7c1a4f3 |     
    mips     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/5ebcc6cf664b6e273efc863dcbfda332d4d626bd |     
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/bd26c81f691f9c53516fbd1fc2a60b3832376fe6 |     
   sparc     |      at-spi2-core-2.48.3       | NOK | http://autobuild.buildroot.net/results/236292a11bd316902ced95ebe2112cd2e70aba8b |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/6727830619df0eed669a4693814b0f84db063a94 |     
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/39e02d4bc9ca5e93cbc31adfbd558751ae258e60 |     
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/333f481fe1b6df601dbdb69e16975d0cde2b7bd6 |     
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/acf5342d2336dc5a66dd7b132f57b6320a352e37 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ca8967264052867e4bdac53f1c6612f48eb38124 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/83621cdf93fe3812da7dfaf7dee66b7d53022ab6 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c1e62df0c6170e35e5a8f61f5f5b013a5ac211c4 |     
   arceb     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d4a7ab002f094d3cd2554dd126cfcefd026bfe78 |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/07a7620bacefa136e4cde496486bd403c3157953 | ORPH
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e125b33fc24ceb454367f44355ceb27dce19a677 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/eed692a580536d348dda8fe492d74dbd4dd2c50f | ORPH
    or1k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/f7524afb93340ebf63953dc9407baef6197bf592 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c264a7b04c9c19dc16784033a398122fc2509570 | ORPH
  mips64el   |          ethtool-6.5           | NOK | http://autobuild.buildroot.net/results/ecf828c4110155f47ca003bc3d2932cb4b987034 |     
microblazeel |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/a5b0ece3d27ce2ef5d7578a8fd1b1421949f6b26 |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/0357ccd0db165c22663f115d810f62ef6403b346 |     
   armeb     | fs/axfs/axfs.mk:32: /home/b... | NOK | http://autobuild.buildroot.net/results/812d047f4139497fe2c360130af7ce0c63046d6e |     
  riscv64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/694528da174d3b6d144e9d8d11594dff37ed70b2 |     
    m68k     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/f74febe7e7a3910420f63bdf4ca772fa7842ab31 |     
  aarch64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/7eaf92a78aca7de91c18a62ab0c972b095b8c3c3 |     
  mips64el   |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/9334f235b48f5774a7a659585b10ac97c24ad114 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/e7dfdd9e0c2ddb574d464deac05c7d5cdf12c195 |     
 aarch64_be  |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/e3c99d4dd8038c9f85b9e936814be74ce468aa4e |     
  riscv64    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/2ca2789bff1bafdc41b8e8cd916d59ce21c79506 |     
 microblaze  |           gdal-3.6.2           | NOK | http://autobuild.buildroot.net/results/7e8edf849723a8b6ab50d0416c928ea65c42a9ee |     
    arc      | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/81b4b1ad6fde041707611b3ef6d856463dd70b10 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/504be4ddccd5eec26f3759b7ea3e28c8d0aa203d |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/f88dcbc00025c269ba27c27b6c8853201c91526f |     
    arc      | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/db53b91853cfcd6c2c8c250efa771d873cf2715e |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/7651af18f5b99b3fc0a99c4efac72980412629d8 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3ccfa77dc22ab550ab7d6202d802a7c3650753bb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/033fb1e701b4ac21d4614c8d2feadbef96aae59b | ORPH
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/53cd8a952ae10061f2fb2c1c069d0c069007b2b8 |     
    i686     |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/0b418dab880fe5d23ca7eedbe2a44faae277b0f8 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/e20105ba53c51813a3b2a04facef1a46c7b5ee2f |     
 powerpc64   |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/20484a3a04635df4749aa86568783b28bfe76844 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/fb893573af7d15089ae67e029310217d470408f7 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/10e38d88cec32c352d0576c006e1decabe5c04bc |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c792e4b02fd4760003a4a48f620aaed76dcfa4cd |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f8ccd75d7a0b05040e27fb6dc66883424b2d8edb |     
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/c5956cf4dc3d3899ed971cb31d250a36921a60bd |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/7f806800f3d21727847ff064c748f419b6a0a71a |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/5efdfc101a2b502934f07e14a15f0238521d3a56 |     
    or1k     |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/0db0d777013ee9b8b5eb377bc67573269bd61f85 |     
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/87e67270d284793eca0d5dd5f277aff392123016 |     
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/331ff614b8ecf483a5888a0021fdcb35eb088996 |     
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/37e2e1c58a8ea5b855acf56be28b5ae76522d657 |     
  mips64el   |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/f0f549705ed69892d7256d8b3f99d22d2d584fb4 |     
  aarch64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/7bbfd43f27698bf9604cd6e04155db5d706ee05d | ORPH
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/9114f6856c7f0fcfef241ccd9942dccedc930587 | ORPH
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/f66523b69eac6af82385949f4733bd627ecae771 | ORPH
   mips64    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/8403f5ae6d24fcd251d473a66c491a59bfbd787c | ORPH
   mipsel    |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/ca078772f3c835327bcbf53b93d4f620663bd638 | ORPH
  powerpc    | luajit-41fb94defa8f830ce69a... | NOK | http://autobuild.buildroot.net/results/e77787e0c18bfb2bd8d38c891cdcebc137b43c3c |     
  sparc64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/7bec7868c3188a1a0c35def8f270696fd4dae8ae | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/bb1fc908a2b015affdadac5d8a962ecb21c5ce59 |     
   sh4eb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/fc79907d5ea983b140704eafac9e29d892e72f82 |     
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/5f27a210031598ee931eb8207f51e62362b73aa5 |     
    or1k     |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/c151f7fc14f6f8c72e24e14bce5a5e028f0bd32d |     
  sparc64    |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/ec77e7ae1280acf845cdf6b1cda44b70925e46b9 |     
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/0a8f924bca3e08cbc7c2c6e126bf6cc5d88aaf14 |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ea43289a073dc81f6adee0e345d47d42c18ce86f |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/2fdcd574b394eba1438a138fb22db35243aebf69 |     
 microblaze  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/d07ba6ef03922d9aa42095eb710ab9eb2240756e |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0a8cfcbb74597112db444b294f3f0745af6c33b6 |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/3a8a87199031d9f17b9fbbd41530a9ca6bbf02ba |     
  aarch64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e85655effeaa5fa2d7dd6508d5ac6c3193493b65 |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/cab5d987220b183753ee1e4f2a14087b2f7ecee5 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/33de6295d1ef055b2b1cb08cd54d65c5e30af68e |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/18d5b8a5fb4ee9b3919eb8a90b3ac83e383b4fe6 |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/9fb3434f1740bf883e723c5b543612aeaf854178 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/768a8bf4a90175aa399c8ca6d9fe817b4c6db24c |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/5c94b6e2fb7eddb8171ca770e77dbe7d7424bd9a |     
   mips64    |      python-rpds-py-0.9.2      | NOK | http://autobuild.buildroot.net/results/c1304b70dbd71eada982431f933ddaf6888b1073 |     
  powerpc    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/23c3d0159dfd03e13bf1b5325fc995b62fd9d8e2 | ORPH
   s390x     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/5ba8c7c2cec07e43750d518a5174d81effe3e74f | ORPH
   mips64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/60724a29d8c668e7c7e15e19828e7c81e0e451fa | ORPH
   nios2     |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/58dff88341da816bea8eefdec68d8c365e42b282 | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/a6facb33879d80156315eb8b53b41a676c855a0c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/aec6eb5f7de0de96fbbb9270d5fd2133d3e63926 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/1291f518a96b6b6da4f267c076237a6b8c2da7a9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/09a8211ffde4862fbf2dcbf6cb16020aba1e7328 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4791f5cb2b69f089508c57a27b0c4c4a373be10f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/433217555c0f41f8bff1eee97e3263c9716867fb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bd92468de0fe3ac33cd6acc165d017968a540898 |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8027e91d8e6a40d238cb2e6e039d55489296fc6f |     
  aarch64    |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/876bd4913b057cf671ce3d4dc46509cc24254dcb | ORPH
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/fd92faaf2747bd40186be0900b8f56fdc9c2dcd3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 2 
                  check-0.15.2 | 1 
             cni-plugins-1.2.0 | 1 
              erlang-22.3.4.22 | 1 
            host-binutils-2.38 | 1 
               host-go-1.19.13 | 1 
                  jack2-1.9.21 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              skalibs-2.12.0.1 | 1 
               suricata-6.0.14 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/1a28ef4eec2f0267e75365f669dd0aed3bbcb5d2 | ORPH
   s390x     |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/c1249b84039917a5bc3776c10310264007bbf314 |     
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/dd043faf7f168054143eef48b8b56d02ba6296b5 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a6002e4f69b997aade24adafc58ee6984e9ff471 |     
    i586     |        host-go-1.19.13         | NOK | http://autobuild.buildroot.net/results/4e49ea10284b0a9b7102a975f1249a0d51c36395 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e83af05df06e1851ef02556e38366661bd3d7877 |     
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2acc10f2647b80ce9098036659c4103bd4dadf76 | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/c70f6e4051988083f6b5c771eb87bb95ade5c3d4 |     
    i586     |        suricata-6.0.14         | NOK | http://autobuild.buildroot.net/results/776cb60419f60760ebf21d6bc22bf78af7931ac5 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb523b75664696d1316b11e8c4e281d8f4c0ac38 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/a4c2201c21bfd78a2e955a3b3e6d92d52ccff4a4 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 2 
                host-go-1.20.8 | 2 
         gobject-introspection | 1 
              host-rust-1.71.1 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.4.16 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/90e3904cb055b6b42d72ef60adfb8ca7deb10354 |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7e42d230c4c84b92b0828b67af349b71b6614acc |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/768470c4c269146a0469531dc4846e38390210d2 |     
  mips64el   |         host-go-1.20.8         | NOK | http://autobuild.buildroot.net/results/ccdf45c94fbc7bd93e749725304f0527792d7a55 |     
   x86_64    |         host-go-1.20.8         | NOK | http://autobuild.buildroot.net/results/9a9d300f327d4bac8bb95db7afb6c689e3282054 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/61b9b8082316370d39a3751185a82a9e94f2c94c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c9286252417647a080f31b00f49298dc8f3a75fd |     
   s390x     |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/dce708b584c4e537051fb1d3b664b12ad44aeae6 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/2ca88c7cce1b61d5fcb8208a3ea20e289fad8c14 |     


Gitlab CI results for 2023-10-06
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592198  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592211  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592215  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592294  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592308  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592317  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592382  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592460  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592469  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592474  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592492  |      
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592512  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592607  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592610  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592679  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592694  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592772  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5227592862  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236767766  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236768237  | ORPH 
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236770179  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236770203  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236770213  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236770290  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236770353  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236770420  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236770819  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236770958  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236771147  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236771309  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236771652  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236772737  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236772806  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236773048  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5236773113  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
