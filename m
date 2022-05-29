Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20811C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 04:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B81583E6C;
	Sun, 29 May 2022 04:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kL-pAlq6CUnr; Sun, 29 May 2022 04:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A298C8344C;
	Sun, 29 May 2022 04:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A77831BF417
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 04:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9567F424B9
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 04:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iC-DsoMb_9H3 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 04:45:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9DA541CEF
 for <buildroot@buildroot.org>; Sun, 29 May 2022 04:45:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 24B091BF207
 for <buildroot@buildroot.org>; Sun, 29 May 2022 04:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653799500; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8U4wivr90r6t1g1+ChgvrWQ+ITjYJlqEClS/kjLysZA=;
 b=ZG+8+Q2v4R7xj8s7h0Gek+nRAfSSTDIybRq7se2JOCSxnuB3DKtiV4F7NplRKZhnx3mFmN
 NIFX9QkUgWN05jzu7EpeH6SYG/5qk2yg6hFICiGh9kdYIReLeN+PODTSWoJ5QvsZAgm55v
 Uo2zekSjdYBNaN9f9XB7/8+TCECjQ1YPlRxA/SIqL3MvLW8jWPg8RBB0zKNPF9USmBD1Wb
 OG6Y+Zjt+9RPaRVgQ3JCejX0u9/yoxyxOicPnufeVKQS7Br5ZBVQTzhHSVZ6SLVVGyl8R1
 qPqE+kTYIhxIuPGmYC4RLxFgyzRA8xT0Z9LhPpTCdm9SDgaDpCgAjuylupYVMw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 04:45:00 -0000
Message-Id: <20220529044508.9567F424B9@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-28
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

Autobuild statistics for 2022-05-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 21  |  4  |  0  | 25  |
    master   | 128 | 160 |  0  | 288 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 19
           optee-client-3.17.0 | 18
               protobuf-3.20.1 | 9 
             libopenssl-1.1.1o | 5 
               pipewire-0.3.51 | 5 
                 uclibc-1.0.40 | 5 
                  linux-5.17.7 | 4 
                busybox-1.35.0 | 3 
          host-gcc-final-9.4.0 | 3 
host-pahole-73383b3a39afe86... | 3 
            qpid-proton-0.35.0 | 3 
              swupdate-2022.05 | 3 
    toolchain-external-bootlin | 3 
                       unknown | 3 
                    bat-0.19.0 | 2 
                 dash-0.5.11.5 | 2 
                     file-5.41 | 2 
              host-delve-1.8.0 | 2 
         host-gcc-final-11.3.0 | 2 
host-google-breakpad-c85eb4... | 2 
                   libnss-3.78 | 2 
                libressl-3.5.2 | 2 
                mongodb-4.2.18 | 2 
                nodejs-16.15.0 | 2 
               poppler-21.12.0 | 2 
                    ruby-3.1.0 | 2 
                       xenomai | 2 
                     ace-7.0.6 | 1 
               acpica-20200717 | 1 
                  acpid-2.0.33 | 1 
              alsa-lib-1.2.6.1 | 1 
                apparmor-3.0.4 | 1 
                     aufs-util | 1 
             batman-adv-2021.4 | 1 
                     bc-1.07.1 | 1 
                    bird-2.0.8 | 1 
                  boost-1.79.0 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                elfutils-0.186 | 1 
               erofs-utils-1.4 | 1 
                  exempi-2.6.1 | 1 
                     frr-8.2.2 | 1 
fs/squashfs/squashfs.mk:56:... | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
google-breakpad-c85eb4a59b6... | 1 
                   gstd-0.14.0 | 1 
          host-elf2flt-2021.08 | 1 
                host-go-1.18.2 | 1 
              host-rust-1.60.0 | 1 
                   hwloc-2.7.0 | 1 
     kvm-unit-tests-2022-03-08 | 1 
               libcap-ng-0.8.3 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.70.4 | 1 
              libsodium-1.0.18 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
               libvorbis-1.3.7 | 1 
           libwebsockets-4.3.1 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.104-cip3-rt3 | 1 
          moby-buildkit-0.10.0 | 1 
                  ndisc6-1.0.5 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20120127 | 1 
                   perl-5.34.1 | 1 
           python-orjson-3.6.7 | 1 
                      rauc-1.6 | 1 
       shadowsocks-libev-3.3.5 | 1 
toolchain-external-bootlin-... | 1 
                   uacme-1.7.1 | 1 
ulog-0389d243352255f6182326... | 1 
                  vlc-3.0.17.4 | 1 
               xfsprogs-5.14.2 | 1 
          xml-security-c-2.0.4 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/a44cd72ba5738310082b9fd96de7dc3aea222e3f |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/2fdde828fcf4cc3ffb0035b021744f970a137648 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/54ea62eeb53503a134e29c3149f7118516008b6e | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/baf0c4f82e0faabd857ecbda092281d1379e2a33 |     
   x86_64    |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/c85809bde1385c43b893f5b6a0175611a7cebd69 |     
    i686     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/a1fd7b15dfc3ae5d2493caf94238bcdf2bb34113 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4114e37d45bb410fd231b7eb869189a5787b66ab |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/0be944fea37b7b651e27e6ec7ae2e6cd042b1024 |     
   mipsel    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/d586bf364b595fcdd58d1b6c69bbf13e26af763c |     
  riscv64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/476e45260c31e5c682cf97cada12f60319657465 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/7d9dfe75712ea6d56d0bb67b86c629ba8c0e3320 |     
    or1k     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/679a4771e35dd12ba7de380376e2e39bfb585d34 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/9896108a7c99c1ea05ae3153476b3702d2f99301 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a25328f2cde7056e762818008f2396d374554766 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a781f17393e87fbd8a374ab9f3978e9c40d8b380 | ORPH
    mips     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/938663a81c4901a9d93f5653bf6eeccedf0d5e4e |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1a4c376c21512ef45c1cacf2ccb10b6cb19c56d4 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/de3e76bacfa58e8a2a06874e53ee65d5aee1a96f | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e75f0ec39e66af6d041f354716ab15ddd3bc13fd | ORPH
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/f281e8afc43e8dcf94feea0db2cf91fd5cea518c |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/c61df5261467916c63c052e0e78977cc2008fe4a |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/bf0e3070bebddcb65aa9b20c289933d88291cd75 | ORPH
    i686     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/4eb7027fab0d137c168e25ccc622ceeb4a7e1146 | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/c27da1653c9fb6b205300c8af3a12c789eb6e3c9 |     
 aarch64_be  | fs/squashfs/squashfs.mk:56:... | NOK | http://autobuild.buildroot.net/results/c56c4de4455171d9706209b3a27877ab53109983 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/db7366c6cc2fdb4e490b55a43d06511c89dddb47 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/abf47b0f01bf1c8841f70e3233f9c46c34f93c28 |     
  mips64el   |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/09d199305fd1503c3ea58b11c622b6e2e7282859 | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/443aeaf24ea1e7be54c81bc20dc1385542bc4875 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/0c7d6741a79a0fe75067fecbf224827b68220c47 |     
   armeb     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/1d8716fff88f76398718cb1d990e0f46b54d451e | ORPH
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/12b777515821861b210851c24e702cf249dc8df3 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5f7e25e5c1dde4da1702514ab711aa0270d4c213 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7455a67510535f53016e58f19d3278d697b4dcca |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a782a8eb9af9164ed75c6d552c48b383a9f22020 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/aaf60f240caad0b4d1cd83da7e62362b0aebac91 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/07c86a4b154e6f2835ec8ae504cb4eae92fd5d5f |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2f22bdf4bc68814a62771ba031a5db072ce072dc |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9217bf80b335d9d9401e78e323daca85f6063dc2 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8aede5189a36d77c950d5aa89992816a85cae759 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b9b368299a5baa3c5d81f5f4affea34be977b7d7 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e02648f8844f86b99244ae89fae2c0cedc7134cf |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a54c7d665faf8f00f7e9d9c491aed58b8606ad85 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d1d55c4708111c71ad2b1089bf926800db21c25e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f922ab66239b96926c3aafd21215410fcea0b678 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0aa7011d32edb196afc06d2e2464f78021495c4f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/14b0c0e71db192ae8d278e510949acb4d4d8d819 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e893e08f721f54fd15200fa630b50606f7f563fe |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a324f7ad24315c758a564ea003ead9abeead12e0 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a59ca149ae014354274cd95c3a806186494d5489 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a9fba00fab3dfd371a91cdad5715a06202e749a5 |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/19cb043df73aadaad821ff8a3869963f845bd4ad |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/09c29aad13802718689d236583612ff4b079a16b |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/6d9112e95e76f577cbc75d6c82a5cfe2d449a423 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/336ee8f8f7cb05a807009ac2cc5bc9d0a834adea |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/f96c15d9ca92b26c85db8cebd1fd19ef73824f93 |     
    i686     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/c9b07af6593cdcdd4fd279a589840a17f2ef6f9d |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/73b67253ac6f2e69f044acc7ad09a3fb704e0dd1 |     
  nds32le    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5a509ef74dd44fc93241a029cbf178e2987b5e4d |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/95cc1d1ddfc47723aa898db5062bb4ca5a2fe4f4 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d36db5ce88ce624611a76e416f7c06f79976e1cc |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/bfcbf36a60eaae5411439b9de19f2424dc0e6bd4 |     
   x86_64    |          hwloc-2.7.0           | NOK | http://autobuild.buildroot.net/results/fa7b321f0b3d53e4b82240f25bc9f829d7f73309 |     
 aarch64_be  |   kvm-unit-tests-2022-03-08    | NOK | http://autobuild.buildroot.net/results/760f43a2780b78c753e6b5d631cb744db896f575 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/59cf1c49d3746b9b4b1b2f45b8a732184a66f7b6 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/296e98b794746973fa820ba6ea05991f82955f0f |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/2512d5a6aba2a833198917475150cd3d2618f3be |     
   x86_64    |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/a19e16f35381126f29511389d2c1c7612f9f647b |     
   armeb     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/c499708d3c2607a2605394b93d199bc4136b4f26 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/31baefaf6870a669a866e555e7eb68b167417976 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/07e2f7fbd4ef343aad05eea57f71bc154abb8ca4 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/579d9285333eb21500800444bac10cc5cfa73bf4 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7ab7de0a63e18568bfc944574dd75db52e0ba2f9 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/38e957462bdf5c80c75765702a64b87f958b83d1 |     
    arc      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/8ff8f5dc3a4a7db7fe6047b112f71ac5ce828feb | ORPH
    arc      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/60e5397a6b4927dc56f5add5c6c5a117b1621d29 | ORPH
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/c67f27e35e2ac158a5964f54412fc1912d18f546 |     
   sparc     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/65bbd46fcbc961d77acccd90f8d1fda3db44730f |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/fea44e7c468336d145508fdb2ac098da17571371 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/75ddbd2e0b058b69a99a2a2f01c62dedad1199c0 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/17928d9086c3272e7ea220c6262c07c239ae59c1 | ORPH
  mips64el   |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/13720be660c4446de1bdd29746972a5f950becb9 | ORPH
   sh4aeb    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/9ce8068ca7a8d9d2dea7b0df444734c419e74d1a | ORPH
 powerpc64   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/6389de5fc6f8961a97bd41d0935cf42f0f34dcea | ORPH
   mips64    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/c078ecfad17a460eedcf617ff50c0843af69d501 | ORPH
   mipsel    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/6679aff2b3e56ac222d1d82afabc972bac8c874d | ORPH
   x86_64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/7de5238cb5460aae8ba6279ddfb2f76f7f778e17 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/39017b79894f079fc62c125d66b022067cb37f81 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/d3dd5c23e73d8fbf0d2f7919c5875eb590780fca |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/25c2c5a7eeecbfbbe60c6a1fc6f4cc1e9f3eba59 | ORPH
   armeb     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/32fac97f8020591624a617e8eee74a22f867f91b |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/d65b956482878e07fc14bbae27b13cf03b4648d0 |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/59ba2ab63c8f99f11edfe6d6fb4261279f5b5449 |     
   x86_64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/fb5fc154f0ebffed719bb21f17c4f3e3ded9d79c | ORPH
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f9755d3425b0697174da894d00123c0780f473b9 |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f205aabb05703cb689d2f5656fb9f98ae4675e9a |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ef2f72279385909b20f0d32d1cf1ebfc95ca30ff |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ff26578f7782dead7fd26ec5a671c84f15a4df2a |     
  aarch64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/09ebeeb3b1e41f928da015818b1ad7485c9b6a07 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/78488138ef561b443e1a171d82f7cfaefbe2eb46 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/dcb0c4e238ec7570e6f54a366ac60bf287e4142c |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3d4655aad825a4e3348dbe8b984ba58839f19758 |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2a990360dbe37e111d4d7f4f9ac0377cdfcfde4e |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f2aa5e77ace0232997a751f897fa8e0172121fbc |     
   armeb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/5bd647ec5506eae1f0e2dd0255bbe42c449f90e1 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fcca38ce97f03164706375c4d44606c8d2a4968d |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/2bdb35e3a516e7663d6be8950bb43f87cb026f9c |     
 aarch64_be  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/feaae10bc73f48dc62a80d1efd18897ddb2e4abe |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c237e05dc94c89b958249aaecf773ba878539f98 |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ba0740799ed4e4723546c66c738c3f9867999b38 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/33eefcea326d5113ebbef3428fb8a3975ac79858 |     
   nios2     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ebe86b42d3c28e27cbd77d70499602697cd55576 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2132215bd2264fbbc80d4f31b3d9990b351c9ee4 |     
microblazeel |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/f16e1995022232034c9b4c6eaf10cf1593a6ab91 |     
    mips     |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/6b24898631c9eee8b2f9a84c6725e17b49c0f181 |     
   mipsel    |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/b74002ca65994b7040bed126d94d1b205cf298d2 |     
    arm      |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/aa91f2637ae5909fcb276404cdff966dd19c54e6 |     
  mips64el   |        pipewire-0.3.51         | NOK | http://autobuild.buildroot.net/results/f0fe8f3e724e37cbdf51cde1b5c3b920c5fa9f51 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/a7de8b7811084c1c3c63ee979e3e996b1c8e6f70 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/14acd9123072d871d11a33133c7a207d0f7147b7 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f4bae1e4fa46685e6921b5649297d8102efa2ec7 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0d5b5aceab52857ddb33f31350dbdd1ada87b2e8 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/39089256b7f977327dabd7c4b6ac5b50f42929ba |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e27965ad1d3b1a999a96aadc8338d87bc8630130 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8e8881caba96e93e386249c88030b1b72fe58dc5 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/81ca872726befadd265f2d32ea61bd4259d5f856 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/83a372ceac8efe095bfa26f5070a1d3d94c5bc76 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/bfb6137d56b4945c965949a5139153454f140f76 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/c46b51a9d67c903b1608f2051f19136c9f103c0c |     
    i686     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/20487bea3d0bfc8bda8dc1be0194f84692a82b50 |     
   mips64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/d8e4ab02ea4ba38d25bde797d2a76355cd86c591 |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/98b8781a06a9965ab56ffa80c729d86dd5d62623 |     
    mips     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/03f0882b564965db3092e3a4a1c340692353e7d8 |     
  mips64el   |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/a1999c4b661e4fc0d17f1ea0b1f2e7d8c917a7cb |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/144e1caa58c737cb3e04370328e05e7bb3ef262d |     
 powerpc64   |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/d574f74cdcf37394cf7d4b57aa27c3f9647adf86 |     
 aarch64_be  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/fc554efe5d3cf310ced6f14f5f31fb817010d4f1 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/34d1cf35cf3e9bb9c5ab6aed33bdcaaa312851aa |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/5bbc5d531040d34b76b59b5f1948d9cb53f64caa |     
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/ad43018a1d65eaaed013885c9da72bc7c7525037 |     
   s390x     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/b450e63b8288301e5b8b3d516e5c125f5c43c20f |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c967611788a657de7ebb9ec55f737e455f1c7548 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/aa7eb10d960b5ed82b56d0fc74fe6402bcf85036 |     
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/c699711a9a6958408a0bf1ab4d8960d24893f799 | ORPH
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/546c021d492eb6b41cb60fba49a17030bef3194b |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f7917d4e429a8b2e8ceeb39bfefb5eeaa277e913 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d844c6e6f124ea10b0e218aaf8adcae31505c8a6 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f9a55f2559bffa9ee49ce7ead3ad55eaa8771460 |     
   armeb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/328ca15c30efbaee410d9a6e316b530bd2deaa76 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e299de1d185cffefa5e5d8b4e7d7f4d4efb36987 |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/54889c3c96d667a1596fd201b6ac93f05eb422e1 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/2031aa9eee0adfe087a3590160e4be8be39c2a73 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ee09c64cc805e15fb76c13adc0beb71c7bcd54d9 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5799c87ec54d14ff38d465e8603e7e83667097ff |     
  aarch64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/2ffd8a507dbb4eb6f64c7d93f00a962fefc3a111 |     
    mips     |            xenomai             | NOK | http://autobuild.buildroot.net/results/e9294013832fe2620f7b5de8db1f66c0743eb912 |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/29c158dff75f9b91f028b40cc78036afc560fbf2 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/d63273954fcd1151bd454cb607395c0317221482 | ORPH
    mips     |      xml-security-c-2.0.4      | NOK | http://autobuild.buildroot.net/results/f5ba96310330763e490865aa4616b20dc5e4c93f |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/daa785cf1b816e4b15a09a558aac3be2ee2cd794 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

 Makefile:734: target-finalize | 1 
                nodejs-14.18.3 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | Makefile:734: target-finalize  | NOK | http://autobuild.buildroot.net/results/2aad1cc3f182f71db7ce77ff449b022bddd836c7 |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/e6c640ecf86c29aa6870b14ccc89bb94d341547e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/68eca36859120c72d31228c6477f774ca9c701cb |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d5cebe62af103ce04de95413830cc115d0078ed2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
