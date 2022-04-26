Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4BDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 04:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78E381B99;
	Tue, 26 Apr 2022 04:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvJ13cSQtZYI; Tue, 26 Apr 2022 04:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59BCA81419;
	Tue, 26 Apr 2022 04:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4E81BF332
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 04:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5009160888
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 04:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhrj2l4qX4Vm for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 04:45:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71F3760625
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 04:45:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9488260007
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 04:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650948309; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D3oA69jBEhsXGxK6qc51BJs40YgQ/hnr/BuR6kHPjrE=;
 b=lQN1/9h9vJ0bFTL+CNeAx+IJO3bL+mpIbjB3wfSC8bcgoN+W0xZp6hXf+i1Xf4rTIBdo5A
 KaK+5HGeYEbjwAuUdv0td3mN+7huF3BN+jDalRUey4CaJ8mAqPZWVhrpEmNlxMdzivEC4E
 Gp/4UkZCllVWM000gtT4Gg8nszUqTbGRUbtLyYESSuWZzBNbS6tl1oPdncbRZoZDCso0iP
 gtDsBh2h6BOb5zJutXFOpF9OHVDvEhSEdl+R2hdtoH34J+eod1RIxN1bxem1ptaQEmdSvb
 5eQCjYop2ozxo7PGaUH/dXOSD1FclEQsIrzbF3iNyjy0woTtDxLXnUL+Mqoqdw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 04:45:09 -0000
Message-Id: <20220426044514.5009160888@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-25
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

Autobuild statistics for 2022-04-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 18  |  2  |  1  | 21  |
    master   | 93  | 249 |  0  | 342 |

Classification of failures by reason for master
-----------------------------------------------

package/pcre2/pcre2.mk:33: ... | 38
              pcre2-legal-info | 30
           host-wayland-1.20.0 | 14
         host-gcc-final-10.3.0 | 12
                  zchunk-1.2.2 | 9 
                    git-2.31.2 | 8 
             libopenssl-1.1.1n | 8 
                 uclibc-1.0.40 | 8 
         argp-standalone-1.4.1 | 6 
                python3-3.10.2 | 6 
                 zlib-ng-2.0.6 | 6 
         host-gcc-final-11.2.0 | 4 
package/pcre2/pcre2.mk:34: ... | 4 
                     refpolicy | 4 
                       unknown | 4 
             host-pahole-v1.23 | 3 
                libressl-3.5.2 | 3 
                 linux-5.15.33 | 3 
         linux-headers-5.15.33 | 3 
                   perl-5.34.1 | 3 
              containerd-1.6.2 | 2 
              cryptsetup-2.4.3 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
          host-gcc-final-9.4.0 | 2 
         host-pcre2-legal-info | 2 
                   libnss-3.77 | 2 
                libressl-3.4.3 | 2 
               pipewire-0.3.50 | 2 
                  sudo-1.9.8p2 | 2 
                   uacme-1.7.1 | 2 
ulog-0389d243352255f6182326... | 2 
                 wavemon-0.9.4 | 2 
                   aubio-0.4.9 | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
                    bird-2.0.8 | 1 
                bitcoin-0.21.2 | 1 
            btrfs-progs-5.16.2 | 1 
          cryptodev-linux-1.12 | 1 
                 dash-0.5.11.5 | 1 
                  exempi-2.6.1 | 1 
                     frr-8.2.2 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-21.11.00 | 1 
glibc-2.34-109-gd64b08d5ba7... | 1 
                     gmp-6.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
host-gdb-arc-2020.09-releas... | 1 
host-google-breakpad-c85eb4... | 1 
             host-gtest-1.11.0 | 1 
           host-nodejs-14.18.3 | 1 
              host-rust-1.60.0 | 1 
                   httping-2.5 | 1 
            igh-ethercat-1.5.2 | 1 
                  jack2-1.9.20 | 1 
              libeXosip2-5.3.0 | 1 
              libgcrypt-1.10.0 | 1 
               libglib2-2.70.4 | 1 
             libgpg-error-1.42 | 1 
                  libpri-1.5.0 | 1 
           libwebsockets-4.3.1 | 1 
   linux-headers-5.10.104-cip3 | 1 
linux-headers-5.10.104-cip3... | 1 
               linux-pam-1.5.2 | 1 
            lttng-tools-2.13.2 | 1 
                   neon-0.32.2 | 1 
               netatalk-3.1.13 | 1 
                  netsurf-3.10 | 1 
                 pixman-0.40.0 | 1 
               poppler-21.12.0 | 1 
rtl8189es-39c17661136da48f8... | 1 
                sg3_utils-1.47 | 1 
               valgrind-3.18.1 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/07ef6b7c5fab04314712d7ad91e98afa904ec396 |     
    arm      |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/0a0fd092a8a0047eabfb3d0da730f3f9dcf7f378 |     
   mipsel    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/f772c691e05d25883447a5859fdbfb01c91cf88f |     
microblazeel |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/e53a49d046ddfc394353e56c4b0fd7a96b0cb591 |     
   xtensa    |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/dfdef9d530aa8b0bada83ded3a39d6e54c3808fd |     
   sparc     |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/268093a8be35ebdaaa7efc8ae3002b36162defbf |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0fb63dc574f19855b967634aab8af46c49f943f2 |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/0d375d5a6c5f83138eeb84ca8bc4ace8bb0361d2 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/e153335f05d00f59b33a8fb963307c9776cf418a |     
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/108b625b2121368efd536ec06976423a1b16ca85 |     
  mips64el   |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/aa6524c859927bfacfd9eebac9c4d1957153a1e6 |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/f95d35b314dc2b84ce9aec0a2a3ed464780e2aa4 | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/d09ca343a704cb1d42ed68b05f804f73615f0a37 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/b4643b5848f7eb81639db8efbf09b7b02c112e9e |     
    arc      |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/b6af70618ee63952d88dc92e2e1535ec3752b3a9 | ORPH
    sh4      |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/bffebe32305d483e7841566dc6b47fc88f1dd029 |     
    sh4      |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/911c358e87c61bdd42cdd14f49c9ae7894ad644f |     
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c005f28284bbb1c5f5048b3c9d37cbafba5444b2 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/e453907e7ff0e9b7e32829ac9149b399eaa9ba02 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/260270dfef157d1eb2b279a304e03aec43f7b66e |     
   mips64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/da7837ba4f7f53bb35e640be8ac30f88687a2ea4 |     
 powerpc64   | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/ea6e1929dba212c8baf45eaf781cb4760b4e03d2 |     
    or1k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/9152a9cb44b199f3edc72819db529e2d53a118a9 |     
    mips     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/afda363adf329db2fe557e199fc294154e532b4e |     
    mips     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/390aac508042a748effdbec4038b68722f43d6a5 |     
    m68k     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a3899855cdc23cec6e0ff415376e6298df65c73c |     
  riscv32    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c1dbb939ca9811e8ee8e3451916261d457db8886 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/de70d8edc54e6cd5e6a156917525c1a1b0cf7e17 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c5be2082a4c7339b01412b2be54b604daab60115 |     
   x86_64    |         fwts-21.11.00          | NOK | http://autobuild.buildroot.net/results/64e320ebd19b271a6b73f6bb264749cc4974f2a4 |     
   mips64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/03ff9587a4415e0ce8a79190cca5314102b01895 |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/293d863bbac9e77522330b831ed07c022ddb646e |     
   x86_64    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/c0d68fe00cc5977a4afc0fb06eab49071feb6326 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/59bb0ddeebb8500005477d3ad7e72b28090aff89 |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/cdc16241fb1f554601ad68a14e6e5bb0d8d71a44 |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/f45895044c8e2c9b335deabc7ffd1dbff4f5a1d6 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b0a3f616dcbed263bd68efdd32fd2caf4dcdfbf8 |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/985aa3fbb57c83655a71e8f7b7bcc74feaf7e33b |     
   mipsel    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/c42717fc074f334ac4c39f2f84b5965ab9c5e461 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/43f1a9cf60d5dd3e25178642ec6b04a5f3c04aec | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/d1ba0fa3865a67e1665d3a35ce6166e377c8ddbd |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/60bdf0a9a1ee013074bb088bbf1f6d150a9f95d6 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a1573c614b29abcdbb775c283f42a18cc9349670 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6c62a4056d1cbfcae224f6f4cf4b34a32df9c720 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/741ba76114581d7a24444faca9b2521aac0df7fc |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/03a5eac3f585325a2a6cc5684c42922b92508cdb |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/914defca96a82b7c91775d13a3eb1061e21c03a4 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1f506e4b37cec40323826569f8cf67289f2d26d3 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dd593101034b581bb0e81402303cb56513d1b97e |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5577055ca471d156b89ddaf8756f819d1839c3af |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/63ad9b869953b90ea2aeaca342b4c832b2ca0b00 |     
    i586     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/79471e93f1647d52043b369c51b7af41bb58014c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b02b1446b3ed997c3239b60005d49d23cca44ffc |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0717c5d58537779ae68ac63044b355678577e52d |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/12c75b40228403f319d3abc6040dc0807a4e7bfa |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/9cf3ba8fbab3d00f05a6095ff8f72b40f6696237 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/c8f395d3755fae9fd3de9c67ad8780124ad1c38c |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/637caccff42c4ffead15d589e5330f1be9ae2d49 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b020a345b9f3170b09a8fea8e194edfe4d1cb6ef |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e22838db6690f3e832ba397829c3093bb0d8d03e |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ff4a1e07be0b440c404d965f97d796bb2d2de06e | ORPH
   x86_64    | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/0c2c7171d40647daa15c563747525dadec75217c |     
   mipsel    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/e2f12226b77976db6ff15a9a3833a9e2d69ac281 |     
  riscv64    |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/4dc577d90fd3dfde94d119dc80c51cb14a61f794 |     
    i586     |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/1c6027d9f5542578f1a668e0d2fa6fe55e8a26e0 |     
  mips64el   |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/282d447e093ab1f8cbe6efd55402c39fc6ee39a1 |     
microblazeel |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/4e7b0b133683e8332bfa011e0444a4bf175a545b |     
    arm      |     host-pcre2-legal-info      | NOK | http://autobuild.buildroot.net/results/ecf790b334c73dad6d485cacf9509a02528b2296 | ORPH
    arm      |     host-pcre2-legal-info      | NOK | http://autobuild.buildroot.net/results/a02540e899eb42ade9d8ce0919f559e5239d1b89 | ORPH
powerpc64le  |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/5ee1bfb03acfd68817a19ac04e7a6d46af3d519c |     
  mips64el   |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/bb19152276576b333d362020e8cd55553d1c3f55 |     
    arc      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/5677827bd429f5af09246dc4f544fa9312d3191a |     
 aarch64_be  |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/0952a091ac8b91c337f8ea1c6c88377cb10a0f5f |     
   s390x     |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/c0257ee04c2e209afad38e106580717f256628aa |     
   mipsel    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/3f1bfdcb2d0a14660bc99338e07fd9d8043b0e14 |     
   mipsel    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/2e62797e46426500717ce3fe864ec5e9dfcecf10 |     
    mips     |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/5c3f9d62c1b6c7824881be0c0bd9446ada3675c3 |     
powerpc64le  |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/97a5aa5f9e7b3e42bb3a4341cd623975ab569c23 |     
  powerpc    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/0160cb9efc599b5c2f88f60b3fa86c80a0121461 |     
  aarch64    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/67652ebdd13199d60778d5361f6223e3398cb575 |     
    arm      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/a99bb6ff7b007045705ed5b0de8ec1682a8de745 |     
  powerpc    |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/1e0a71fbff63ad22eb3cbc97a95554b547ec7e1a |     
    or1k     |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/774be482a06f409f077d07427350a5edb715fd32 |     
    or1k     |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/e4120bb2b984fac4dafc4ed21a1adaf1b6e0ad2b |     
    arc      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/6dd47b475e371abd656f950bb0b9f71990f02a36 |     
   armeb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/7a7f3bc7c1015da317d3dd904cb227713299d1a1 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/632ee71fff53355142e083d3772777a03a299713 |     
 microblaze  |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/4638dd1c09326b608e24b3a2d2a52b89103ec7fa |     
powerpc64le  |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/9f576f172f7f28edad4ec0f24d33c38a69aed28a | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/e44a087e05b06e5da05a19af95ce5682227ee9ba |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/ad061b82ca92ec540b55d357151dd0ec4a316d38 | ORPH
powerpc64le  |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/f4204755540e2b2a4e9422fe98def76fff306d5a |     
powerpc64le  |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/d865100c1abdb1e4ac22320b8ac23c11b9a73674 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/8beaf34b961a3c80ffdf11cd6b44a7195e16a4ab |     
   sh4eb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e8c17a8aa9641b0ea29b29f765a334231ad94309 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/90d8f7be3ab3039aab71a9338368bdb7bbf764cd |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/cb935aca4895a3dbc85994551d06e2a717c07a8a |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/dd5ffe61543756dae26b991900e17d7dd9b13b1f |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/e3224643a0c183a808e987886ae3e3041295d38c |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/b6a0fc1c9fa69154d13974acd8ba6d1a1b3bfe4b |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/271bd295b8815e576e74e5e6432375bbe7ff76dc |     
 aarch64_be  |          libpri-1.5.0          | NOK | http://autobuild.buildroot.net/results/1217922af3a72646ae242c2c4dec22ead7883b91 |     
   mipsel    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/82b4702b7e0a721e8b592c1603271fa1e05ed4c9 | ORPH
   x86_64    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/fe3a2600299afc76a58fb8b11285e4fd7e9045a2 | ORPH
    m68k     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/c598aafdf3acf219d973e4680d0da3fc3b4a79db | ORPH
   mips64    |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/3125f7bae5666d3ca483dd388dcc9e83ea18af80 | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/c8a0d87dca957db07393c8400a4cc919cb7da324 | ORPH
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/f3d1535590bf26292a9256f985542cfa82c5bc06 |     
    arm      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/e46cab5d9638324d9976095fdf31d39e53c8d5be | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/a421edda89a7411263bb04384566abc3e2e88d56 | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/f454f964f0820a8d75d1783e4e0fbb63ec0526e1 | ORPH
 aarch64_be  |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/f6397350c604f373b97c58bc427f35c773c2dfc9 | ORPH
   sparc     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/4ee90f59ef4518aca1b1d9418238e1ddff0dc78b | ORPH
   xtensa    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/6ce51e4b30b38cf3cb4b96fafabc235230a0a1a7 | ORPH
    mips     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/292f04c650e28e568627cf1eae94c5e44dc827c4 | ORPH
powerpc64le  |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/b793b07c85b61448cf61700e28c45ae3c9d598f4 | ORPH
    arm      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/d951bb7218e95b2d66b0d10137f471e424075b82 | ORPH
  powerpc    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/ee62a6670360cd0e5bf107d8017d0e22f5530f9b |     
  riscv64    |          neon-0.32.2           | NOK | http://autobuild.buildroot.net/results/b763022d7625d950a04599f4fc7e06a2774ebb0f | ORPH
   s390x     |        netatalk-3.1.13         | NOK | http://autobuild.buildroot.net/results/45bcc9538467678aef245b6a7e0e4c1901cb076b | ORPH
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/bcbe8b4cc1de94e2743c178433b4da9cb4385cb2 |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/f4c7a3820a6dc7ad2100c11275516511eb8b0764 |     
   nios2     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/4d6e169159ebf3c4851369dcac26b7f0b57b8ea6 |     
   mipsel    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/99a8a0e590893cbc82c5c7dd4b01a4825620e70e |     
  riscv64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/ff84f6fd90e784fdbdc5e49438bb4058d1ce2738 |     
   mips64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/6d79a74ef127b17310a77235c990ce451ba0159e |     
   mipsel    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/66ab96490d9f0cc604e3fb3de741176193d5109e |     
   xtensa    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/abe1e67618747e832e94e60efbf382e58b65ca81 |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/54b7ad24c126d83c2679cdc6686ceb951cd13a40 |     
   arceb     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/86216f69a0b23895fb178abdd8945a2e0d3573a9 |     
  powerpc    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/c1362dad4fc1ff5808feeed9fa6d0162f4a1d3f4 |     
   nios2     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/5d2f364877f9441dc4aab0b3780c4ec0d0d43be4 |     
  mips64el   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/73cda570a4c935574f648dd69dff4f19efedf498 |     
  riscv64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/baa986beb3a48e4f6869e2e6a3e3b6ea57ea06a8 |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/3b4a92d957052169213c6dcfd0526f2cabd7559e |     
  aarch64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/dfa8b3d197a87812fcd405fe8942f03fffbf96bd |     
  mips64el   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/1522897dba362acae306d1773fef3d5783d17718 |     
    arm      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/28659c0c4d6bac86b4bbce8d54b139ca4147615d |     
 microblaze  | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/a72f89b420d8f72f971f43807c3fec030f32c357 |     
    or1k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/587cd7fd56ec22021320b46278532ace1cc229f3 |     
  powerpc    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/28d9a918d9d5fd3d07372fc8123ff0ca5d1232fb |     
    arm      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/1a0a90d73804fc2a655756696b3b2c0f2dc5979d |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/6ed2f767f792bfb968a84a528ab30895a664387a |     
    arc      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/2367687ac354e3ac82d06b43821b49224f4f96cd |     
    sh4      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/2d64d06ede6a3b00c289e023745fb7e64315edce |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/af74b8487a09493563340fad4519828147f04f7d |     
  riscv64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/f7956830b4ebce6363f395561533d0a460581330 |     
  riscv64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/173d77c725f2407a1ffa7f83289ca9a6d4c53897 |     
 aarch64_be  | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/311667f70b280d4a81df13732bcfbab0f5208904 |     
   s390x     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/63bdf41acfa4d92a966f1f288a7dcb0a221706d6 |     
   x86_64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/f46cf8c6010c4f8abdd06b02da5eb85fcd6aa0d6 |     
  mips64el   | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/b90da3a761d9ab2a554075cd5767534638e48347 |     
  riscv32    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/e88b0945fd58ed38f3d30b2631a4d78396b3fda5 |     
   sparc     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/4b0dba7ccbbeaa7d5de21a40332ae9a75958b9b6 |     
   arceb     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/d58da5099a0ba89c272bf1c5484254e0c0ebf81a |     
    arc      | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/e983182fefa7e7a5efdfa9b87d81938e50a99820 |     
    m68k     | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/f5ef307c896c1161d99a4b868e0fa948ba3fe79f |     
microblazeel | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/de923181db32aef2f0b1d88abfd728df92479fc2 |     
  riscv64    | package/pcre2/pcre2.mk:33: ... | NOK | http://autobuild.buildroot.net/results/bc305ba2e913c7b3bf9c39466cf2ef2b4425fa97 |     
    sh4      | package/pcre2/pcre2.mk:34: ... | NOK | http://autobuild.buildroot.net/results/7e5a264c32cf3a5b0e3e3219efcc62b5fb92d1b1 |     
   armeb     | package/pcre2/pcre2.mk:34: ... | NOK | http://autobuild.buildroot.net/results/0b85e8d3044af00083146b427d31881efaa229e6 |     
microblazeel | package/pcre2/pcre2.mk:34: ... | NOK | http://autobuild.buildroot.net/results/3bfc8109b7e73028027f6b4303ed97e78fd6b4ea |     
   mipsel    | package/pcre2/pcre2.mk:34: ... | NOK | http://autobuild.buildroot.net/results/ab19c2c24429eedb0f20d4eeae87bd87d74c5da0 |     
    arc      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/fb8e8c43e6522f1da75304c8c514f19722b4a720 | ORPH
  riscv32    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/0845ddd8aec8d006a32874547d3b9a6c6510f96b | ORPH
  aarch64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/75076640ed780ad04b757389ac77257dbce075de | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/92d03eee9c66932535f5420ef3488eadca013e81 | ORPH
   mipsel    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/974bcd3e339b298127792df8447c8c2eb5fd4da5 | ORPH
    m68k     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/4e372b6a01ba17c91124cdea40921e16b5af3b7a | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/85c5df647517000ff57168310e9cf3c18057ec95 | ORPH
    arc      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/c55c2d386229c2a34d5c76353e7a520b19a861f3 | ORPH
    arc      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/33a8a85dfcf0d152bc83fcf3b4475f0051c553fe | ORPH
  riscv32    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/b38bc5051072a0366d700415905931089e2e5eae | ORPH
    arc      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/0ec247bb2298408d6df118ef7fa4c5fb758608c6 | ORPH
    i586     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/359bb2256d90ddb6e40691a12f3fc3b707c111ab | ORPH
  powerpc    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/270ab01bdc1c039f9d9dd375ab5d40fc5f3ed9f9 | ORPH
   nios2     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/a3e6f778340088b87f087403566a32b5b61b18ef | ORPH
  mips64el   |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/3d7ae528d4212e47c9933f92e65dcc7d75302998 | ORPH
    or1k     |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/5610577acdd698810aaaf6d9bb8b89c799426c36 | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/b31a8d340f2712f591574b6ecba3dce3c39747e2 | ORPH
  riscv64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/8a663aea42a282c83955afb9ee407f01d6da17a0 | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/da0384077d96307d0f71c24aa998ec2c71abf8a9 | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/703ab60bc1aa79cdf2b509d3d90b728673dd00e7 | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/7a2731e59377110817c69f6935fef0aa2150ef95 | ORPH
  powerpc    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/fb8433544d658010cc3fff4f43cd29f9d6270a66 | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/6f46ad1019d0520dfe044840e5121ad403d37426 | ORPH
   x86_64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/14953e61e6e2a2c8f3e00d3194609beb8f889cb5 | ORPH
  riscv64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/14475c3c6e039b563445752d365b9b46041cb37a | ORPH
    arm      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/f187febf0687f5136c06c58bcb90371c1afbfead | ORPH
   mipsel    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/aebe40cab7b86927c8fcd2f839145a60ab6aafaa | ORPH
   mipsel    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/a8fd8098f267cb3f2a5f80be5a6365e7fc393324 | ORPH
    arc      |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/d3250a0a65ff8f40e7825d8219764c6a4b2334be | ORPH
   x86_64    |        pcre2-legal-info        | NOK | http://autobuild.buildroot.net/results/0453c9572b7f46105ea4877cc43bfa43e6160be3 | ORPH
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a0f72a5da469c4042deab3eb83538ba065bdd303 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7759525f16cc280222034ef808e8799834f8be87 |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ca4d3aa3a16d65f51bb9d55e4a5b740006574fd3 |     
microblazeel |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/332b1358eaa06e4796ee72051563856f0542e13d |     
  powerpc    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/c2e0efa9d50aa0b801b5ee1251fbb75c768f32d7 |     
   sh4aeb    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9254f76969d40eb5ae3e2dcc402ae5a718ab39b4 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/1e8b3f2db95a8019e09f71de14318fac643ef6a5 |     
   mipsel    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/239a77711594efef66734d61f00dfed22204c282 |     
   nios2     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/3f73457070f9eb6ee8beecc9fbd5a3a7463679b3 |     
microblazeel |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/d07fad36875ef9cfcb34c68ff04f3db81af39eb1 |     
powerpc64le  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/c926e9f419ebcb17cfcf21aedad35ed22d6b6f3a |     
  aarch64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/dbaca9603b44373e1b59606e5d03fac6e3db3148 |     
   s390x     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/42161ec3c355e9aaa645059d9b6b2f651fab0954 |     
   s390x     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/6fd6c1c1d007cb78c3763d5e5bc185140042671d |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/6bc9a8b5428b0f73c57ce462faee38d38cd6babe |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/50e29f614140d07a8190aaf2d038de1adbd71ad9 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/4aaa3b28a320c775a0e37b764bcc9b9b27ed2c3e |     
   arceb     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/415ae1934091833b23d5d342ad815c6d927da0e0 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/3699a2457b7a2565fd8452b1e2a13c727b0aeecb |     
  mips64el   |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/b13630c860e1df3e1bdd0712c4b232f6ed7a17b1 | ORPH
  mips64el   |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/fcf85b3838c6c58d2cdaa8a8dbbac5d495e3597d | ORPH
   xtensa    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/c63137c11589a18ee2df8a77b9bcfbce05732f68 |     
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/b09f3be064349f971af8c35cc5926066e512a8d6 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/08cf3bb9a969275df0c694a4a42fcdeed714b7e0 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/26f306f1efcaf9a8f617e83d2bbd263eaf9702e3 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/aad0984d6feac9a63ee4d4dcab359f27ee0a79c7 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1c0ef90c5247255a553ccad278fdb1a31b9392ba |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a716cfa1795d83e4e1298feff3edba40b75b1c81 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0cc1df1963441222a47175a1c6c2dd15c6fb8603 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/66ed3d2144bff57bcfb1b3ee1309eab2775593b5 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ad452abb4d30c2969a26cc0be3a972490f007faf |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/12f9b7d1c58db5872d23565bfb9c2306ef05c7dc |     
  riscv32    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/933a7b70b6b70bea726de24c935a2f6d1702643c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9520854ef3eff56918030d9db7e92366bf4ddf4a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8b2249f21093249d9bb949ec4ee4d77d2b9af087 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/78811dc782777e27542c6528adb9d62abbbae114 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1302db080c8b994e56d42606097b4139d6a933aa |     
  powerpc    |        valgrind-3.18.1         | NOK | http://autobuild.buildroot.net/results/792a32456c53fd8b546655db4dee35ce73fc7e81 | ORPH
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ed67d4a73de0d9860d711785c1f5ad4211bd960e |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e430c18de6aad077bea29516bb266ee6cae38371 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/bc8fd1ce9c345d3edb83010950bb1ce9734591ec |     
    i686     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b45018863e87da560bf2cf81884ed52ee1f6ae0e |     
  riscv64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/9bdaa579cc583fe8572b63bf6c26491b17221a2c |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/9e16adb42cefc10132b1fea2423e218492b023ec |     
   x86_64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b15dd571fe61a83f3a2780b2352904446b1f223c |     
   armeb     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/e884c3c46cdb57c5c18a75f16828d0c11418b599 |     
    mips     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/26aa8eebc4264d24d8dfd36214f3fa021b614e30 |     
   mipsel    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/7121387555767f32f18a51633cdc2916aeaf7a70 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/b46ce4ffca38e59ede32f40bf3dd33e00031dfc7 |     
  riscv64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/9b0b3d7616f14a5985f0db4626ff8d730d66c184 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8d1f4e0042e9302fd187b84147a4a21ba2b2135a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b7e774d88af5baf8b98de6a7931abfab03ae68db | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1f4b0cdf8ca7eedd2683f9b67e82a8224ba49862 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e41df7b9c1728f487e21672a1218a624c063e173 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d1785889736a7630b17f5e28b60709080e5da6d2 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/537d2aba0263a15e63b0398fe6e9a8dba196a02d | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           host-harfbuzz-3.3.2 | 1 
                       libuwsc | 1 
tvheadend-1295dd2be863f5beb... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      host-harfbuzz-3.3.2       | NOK | http://autobuild.buildroot.net/results/d6b04acc98b596a0f591e0dbd7fc7d068072cad1 |     
    arc      |            libuwsc             | TIM | http://autobuild.buildroot.net/results/e1680bc985f318ef03203b55e97fc2ea1b0e4340 |     
   x86_64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/b7a1f04c641469020e77231736984cda76ded126 |     


Gitlab CI results for 2022-04-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370858810  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370858749  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370858944  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859087  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859192  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859200  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859204  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859207  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859230  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859293  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859311  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/2370859330  | ORPH 



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

