Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DD2C43219
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 07:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BD89414C4;
	Tue, 22 Nov 2022 07:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD89414C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4NmN0Thyg4k; Tue, 22 Nov 2022 07:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41BDB414CE;
	Tue, 22 Nov 2022 07:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41BDB414CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA6F61BF31A
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 07:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F28D40439
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 07:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F28D40439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rL9lpeTmlwc2 for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 07:39:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92948402E8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92948402E8
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 07:39:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B3F0F1C0014
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 07:39:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 07:39:16 -0000
Message-Id: <20221122073922.6F28D40439@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669102756; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=19+tdRBMEjqoyTiOX7xhDUR+gpC8JNtRXIwuqJIdPvI=;
 b=R7ju0M85mSiiRhYp4Qty+rlsENjP+5954mirFWiLEKMQ+w44qDOZ4XMLlznGATbsCqxyT5
 QiI6tqthm7IY66E1GkIxepK2hEmjgMgAGsn4iN2RLZ6R4Dmxu+s0rrebffogj6lJSb5Hou
 D8MDvUvCdwwd0lUAVgpScef/l3smvYCSAW9wnt2NavqP2uMeKZzeVapd3sVxfsX/UJtsQ/
 IWbqggRlphlsUHV1RadU4H23Kyejk6dHSTjlpqqgJ3diwxhK/wn1kz41I6W2cA3tVcBnvp
 jiDndk1pyJsCnmhw0gQegnfn7TDA5PgO6q3N40L840SlqLqrd7HjQ105V0EyBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R7ju0M85
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-21
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

Autobuild statistics for 2022-11-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  1  |  0  |  6  |
  2022.08.x  | 13  | 11  |  0  | 24  |
    master   | 192 | 213 |  0  | 405 |
     next    |  5  | 12  |  0  | 17  |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 28
glibc-2.36-66-ga1dc0be03c9d... | 15
                      xz-5.2.7 | 11
              host-rust-1.64.0 | 8 
                   linux-6.0.1 | 8 
                 dash-0.5.11.5 | 7 
  gobject-introspection-1.72.0 | 7 
             lirc-tools-0.10.2 | 7 
                      crun-1.5 | 6 
                host-go-1.19.3 | 6 
            host-binutils-2.38 | 5 
               libglib2-2.72.3 | 4 
                elfutils-0.186 | 3 
                     gmp-6.2.1 | 3 
              host-pahole-1.24 | 3 
                linuxptp-3.1.1 | 3 
                tealdeer-1.6.1 | 3 
                gerbera-1.10.0 | 2 
            host-binutils-2.37 | 2 
            igh-ethercat-1.5.2 | 2 
      linux-5.10.145-cip17-rt7 | 2 
                     lxc-5.0.1 | 2 
           python-numpy-1.23.4 | 2 
                       unknown | 2 
                 wolfssl-5.5.3 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
               acpica-20220331 | 1 
afboot-stm32-3566acd582e553... | 1 
                alsa-lib-1.2.8 | 1 
                   aoetools-37 | 1 
                  assimp-5.2.5 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                 coremark-1.01 | 1 
              dieharder-3.31.1 | 1 
        edk2-edk2-stable202102 | 1 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
             f2fs-tools-1.15.0 | 1 
       freeradius-server-3.2.0 | 1 
                     frr-8.3.1 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
             gdk-pixbuf-2.42.9 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-10.4.0 | 1 
              libblockdev-2.26 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
              libgcrypt-1.10.1 | 1 
             libgpg-error-1.45 | 1 
                libkcapi-1.4.0 | 1 
        liblog4c-localtime-1.0 | 1 
                    libndp-1.8 | 1 
               libsigrok-0.5.2 | 1 
          linux-5.10.145-cip17 | 1 
                   linux-tools | 1 
        ltp-testsuite-20220930 | 1 
            lttng-tools-2.13.2 | 1 
               mariadb-10.3.36 | 1 
                  mender-3.4.0 | 1 
                mongodb-4.2.18 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20171122 | 1 
               openblas-0.3.21 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.3.1 | 1 
                    putty-0.76 | 1 
    python-cryptography-38.0.1 | 1 
rtl8723ds-76146e85847beb242... | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.12.0.1 | 1 
                    stella-6.7 | 1 
                 sudo-1.9.11p2 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 
                     zfs-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7a3a60224579561b1cf9330eacca4a6631979c7c |     
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a424517fac810db2c62b01e870ae10712d47fa42 |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/17b2cbdc14affbba0f125a95f766a46e3da0bec3 |     
powerpc64le  |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/5d135973e1737c516929c17bdea44985e5680e28 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/cfada02aa3432c4ed000e2de2bb51bc659b2c0ee |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/91f0416f3d3c625ecc6b833a00e5a57e07875b02 |     
  mips64el   |          aoetools-37           | NOK | http://autobuild.buildroot.net/results/276344c906f81a9d892436c1b120fe602cacc635 |     
   mipsel    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/ca6652e6e250eb3f32afcd3b6f9033e7e3a6b3c3 | ORPH
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/f5286aa19913b372484787e380befa195b866453 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/d1ed0e9e4c2949d633dac18411fee82bf888c5e3 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c9bbbf47974ce3c2a159de57291ec07c42c78a78 |     
    mips     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/5dde65d555057e2055a06b62e33a90e997cdbc00 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3a189df344c72e051cf9627c58f5eead8074f5e1 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/615f9dbb58bdfd23c67a03e15d50481bc35e4183 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5149c11a58ed511ac42328e833c064ba22bba0fe |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/156bd51908e35a266ba550c47e79fa6e75c54976 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/abe6ad8efb1575f4ef245c3f5a6391c9dd9b719e |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7d47733480a3f9776939d42757ed1ca775b8866b |     
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2779a2d9cbbca69722f1c9455d931557646940f2 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1fc821e47a92d43724500bc45d8f19b3e014b727 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f039f81dfbacce964990d7c2697a54c10f644dee | ORPH
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/dc2787f1ff130e2fccc36a3adf5c585b323a152d | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/16ef93ddfe2ef586ac79feb4b53e03b40f4a331f | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e2c3432514e05658a59c3abbd3a0c004a320c234 | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a0ddc38f3ee1aa18df15f1af7641d52f889df2bd | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/e8d3f6c1042caad03cda551e5f4a25b7ff6fbb97 |     
    i686     |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/de41b903c0ca3c5219e3f26a2effbdd95a4de73e |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a9f914da2ae646732b4b1ef3ebe30c10f255c5d8 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6c8f2df2ca9f3defc4d57edd034272c852b4ab27 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6f54d4a066b572c764c9172de9c3133b32347b82 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/73d065aad91b2443e2314ca061a90f7b522ad33f | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/e0f6ccfbdacc592a9c213aa5f335819aa67798eb |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/8ac9ca70a8c80aa3b1376414472c565ab7ed9852 |     
microblazeel |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/042d542ffc811b5184e4c2f6595981fd12249edb |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/d38479a753d918b45c439d2975f8a188b5243411 |     
  powerpc    | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/6a8949c516c1f41dc6c16244103ec9a0232b53f6 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0537105a5fea174bbe457986f99154f8855ed16b |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9716e6e508591a4d38efc9a3b923d1a001215db3 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9648175c7fa6f857ff1b4ab0177aafe2272e13bd |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/35ffbf84901d938980ba99f7f528a7a12d4923b0 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/8e879f0b6de06f531ff611a83e1ded7114289b6d |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0b95fc8f982b8f4344362228114ba8f7cb847f7d |     
    arc      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/467cd3790044838922d99cb446dd55352ae1253d |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/854fddb66ef16596fe4c9f57405469e66454f44c |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/dfe2c7089c66e4a4f14c88a29d5737c2a1113966 |     
   mips64    |       gdk-pixbuf-2.42.9        | NOK | http://autobuild.buildroot.net/results/78afc41cfc6ec154674a685649cde5a9480a36b1 | ORPH
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5a25b0075b1f89f4f5a6bc5274b8fbab4d928456 |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6cae15c4a7328e31b526e87a9725af480a801bff |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/c25d714521c5a84acbf4c02292daa85f7527171f |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1924995ec33fd79dc69779ca5b723e1e6e545b43 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7f13771925ba726a706c2333abd6d0e71b90ed84 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/441e6f29526a435b66f8eac3f328f2a6958962e1 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d922fff162d69f71e8e476366330068f80acc2ac |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d039bedf45031f2766786abf89fae1d152f135f4 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1ad7303f9813c2d0e6be492f606cdc9cd39b0b3c |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d76921f85652a14d261a3bb40d885011d9bea352 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/893cea32fb82388b9cc50deb590e4af91050fdd1 |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/31e8a84d7f76bbdc104531604a6dfd2c580a4ee5 |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f129aad70767098f39d77073b8e8460cee05f87d |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7634512b09eee3b8eae5b07be6eb4f9b24131cd8 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/de41edb80815f53b3260ebd046b7171c7069a90d |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e241bd35d3c1eda82fb0312575af160d142096d5 |     
    sh4      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3fb3c9983d2b71735b006f4103bf11903316a58e |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/08bb30986aaf218a6721e0e0c33632db0f68fdcc | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/da1b69bb2a5a8c246a3288e18fc454afdd7143df | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/18cc855763b56cfc362b33411021b9bb35d1a84a | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a6e08d153a27dc941f7b3f28e55345eb417a4a54 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/37824d2b1be0cc83f55dcec8ce861b1912ca936e | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6f1f29df0fefc823db004b952adc4b19757d5bc9 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6f6acfb628b01a134edd9a2ec8783377f4117754 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9c980bcd773ba4ff529b10e3c329bc42699db6f5 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a27ca1b9a867014afadaa20c03228123e845f3d6 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/886438f070caf2b0f98c175d3e1b8e665c025d9e | ORPH
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4fc50066614cb8acfa10325b151804894ef5e19a |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9a8b7da33f3ec5a093394a9414775d90f61103b4 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6b29b099aa95ea0b9322bbe3737c9af0bf8bc7b5 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8a9d2dc8753a1d1dde11c92dc557083a9900d333 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e63418be2e622e7e5d7cb5835e2fbfdcc6a5c9de |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9ce7de0184524e7a529ea1ee804acc19742145b2 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b0b29dffe68f5f95e2b8bb2e4151094945c97091 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/8bacf0e68d6f07f165ee1f5d85346e8cf97349ce |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d8216a0f29a878c7e4b05662496dc77db7f02226 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/37baad1a82f878bf1ce70a448ccfd1cec554409b |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/247c253171f0df93bae58c57fc4eec32185cfb81 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/28269d036fef74aacedf2a2a9ae4c5864ea094bb |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/08014ef646fb067687cee0a025a3e8bad78eb04f |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ed9bce8160ff6ba084c265fa0dde4a254117a414 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7127185c14e9954a31189a5f37e54e8dc50eeab3 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/57a49ad9a067ff12f4951822ae1409a13daca614 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b969ddd31c8ca8c4e355e178392f4fa131853186 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/91ff5bcc14c3f255d89ff5ba5114ccd8e0b38efa |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/1da671703804f5a8733760263c3e55d70d8e7cab |     
  mips64el   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2a97cd518e91f803939bccf1db518fd86e53a65b |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/fa05ec7fbab485342bc758cae88222b5fbdb87a5 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/099e6d28642328579d237c72fd79ef7a8cf6e003 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ff68fa3250369b1d711c14fda7374e616ffb5eef |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/fee28673e5dc50930bb54687b175eaf905c4e68e |     
  powerpc    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c6388c8d9584d9aff2d3b44d64e8d6714d54b673 |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/cb1b884ced18415b86be61d3fb11aa446f6b7497 |     
    sh4      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/94095e2055fe076bc6b6fd003948954f7480c1d6 |     
   arceb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/421853264d68b98952096eb5bf9a4cdf08e7af79 |     
   arceb     |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/942af2b2d371c756553a4b0ed7d009557b35bb93 | ORPH
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/24dc3d8c6b4452920fe58c2450b3b2a89cf443aa |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/15e4d9f718f7952bca9303ef192c2919fa9eff24 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b994d8c4b127a54a6d807365631aad350d02b5b6 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/04ed67f6d12e3cf28f5255014c0653cf81176c22 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f9db7886f0f9ad1aacffb3608823fe36ba4358e6 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/dcd5d8faa5262fb94555d5ab9eedf2d33ca372d0 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2742a98a9bba2abdd5d377b2e1ffcda6af5ac23a |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/dcb33fb6ede6a399860ae0048c904db5ed21596d | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/dfadb47d3311765dec951ed2a87402aa9d3e4132 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/ee63e3a54c8de15eb2481133ddf3092d1fd9f718 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/752de7a9d11e50662958d9b7fef9c0b889e092b0 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1233ef68f3e0493431a23ffe46ce9583954ac4bc |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4f93f575513feb6fa9a9a29df84f95c192f3ec81 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/de30d057df839b59429831ab67a583bda324344d |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2ea1fa8cd205b46d36bde9aa7f1cc430f7509047 |     
    i586     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7813de12cfdc3f72911594d8ff20be9424ae9754 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/aef5c92ea0791607909de2d7ef17cfc2213664b3 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4912d15205f4b6f200fcd27474e30c29ae817b1b |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/74f19259813692ca7055767710abf44c4d7d4e57 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1bf5b17bdabc18f6ed9dcaf29b158e5fb820df54 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/edf6c1c75998c812c76ae23fda415f6b0945ea04 |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/033cc93f1d966f3e03459a6bc4f24e2e51d0ef36 |     
   xtensa    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f173c1d91965c9ccf71ee5636196b1b16e8d736f |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/15496ed84f9f13dd4b0fc82f834f248c12259d76 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/aeb9bb5c0d4c78357515f87180c30cb53c017ac8 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b2ad58678acb1442bec479bd412d680aeaee5444 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/76a3bb6bcdd74826e080f5b30420426640010a6a |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2884cc4bf92cd833773c9956e5a43857042a89c7 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/37bc7879f7a50fa1d578808dbc1a34ba87e8d219 |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3b0e29f9cf90771dfa0a33185e6507406979582c |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c23115330ade0ceb7146a143f18328ac3be67201 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ffdd74b6839bc79d1a529833919c1139efd5b8bf |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/428d6c51a107730ca57410fe5067b7154753c2f5 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/77951ceb0b6c6f4a737df43623c45c9b6c886a12 |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/aa04c632917c691a855a211ddbb6a5c309226d41 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ec7f26242ec69f6a93e331d3dd40ac6092c170fc |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e0f9f30fd287cf129004e31e2c50758aeff238b8 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3fcbdb7c0979edec2c9e8fdd84246deb5c14f38e |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/bc8a9d45797de964cf57c1a693a0ecf1525697a5 |     
   arceb     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/1bc47f05c414116ae10249014fb144e7ff506ac5 |     
    mips     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/abc9d769ef5ce60a7a48ddaa72066dc240f35785 | ORPH
    or1k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/a7a491e88c14f0886e49db1576d9767956109e52 | ORPH
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/28cf190896b90906de49a7ccefedb58443d1e545 | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/110174dce32fd94f62bf7a41f6e088a6bf146023 | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e8b39b994bfc9b0d4ea81ecde4adfc7c0187bbd5 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/eb01ad414e3bb17f80ee761b9ad515acb2c0e1ab | ORPH
    sh4a     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/782e89d72725b0af5b3cfa539c854e771944e753 | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/dfd1f5e59e7bf2b6737839bfddf5af3082741cd0 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/2593d6d57d6abcc23afebf402ed9ffe7f0be4bd7 | ORPH
 powerpc64   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/98e21ea03bd7c7d0647aa7297dc555be387b3d86 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7f42001cbe5d3acdd6d9f0445710a18b63bfbcbe | ORPH
   arceb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5ca9bd306470bc5b6101542cc2b256a320817437 | ORPH
    arm      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/b9cee433f7f4996c7333a1eb63b25dbf12b7c706 |     
    sh4      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/f4322fefa7cba04a0669132d469cece3fb60524e |     
    or1k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/c5a084110c267fc4e8048bca0e5b9270fc9dc7ed |     
  riscv32    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/bc4ce97e3a045f15d2d8b1da019b75a192e84012 | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/d01866bbef952e07a3584629f767733f68b25fac | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/7f288957b9b2a4633368e652ec86a12e93bd1563 | ORPH
   xtensa    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c8c73aa39718f31b4d338d99aa9689a75f4ee28d | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/ed88f6407cbcb4a4a8a144f286e5490cdfc5e7fc | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/ed36070767d1af96805ef1f1693681d5dd575b37 | ORPH
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/1c74c65c23eb5ecf55002b3a61bf475957871421 | ORPH
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/7da21d371a4ce7f5f10832fe7e68079ca426041d |     
   mipsel    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/aff84677f725744e16c97ceecb2b275e149795ae |     
   mipsel    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/851d852315e6237169675b6183e5d538c0c02824 |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/1c76c7f83f61431ea307a2a4bde33e1c81ae42bb |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/eb791b764a8b4bbf6ac237c7d7589a68310aa990 | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/9d092d2132e9d4fc83716b1bf8adce6d266646b5 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/541280f84f0259f94390ee264095c07c4674724d |     
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/e75ba8ad144e2b55c3843afbc31ec0a73d585cef | ORPH
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/47c50bad76b328a090ff04393492a15f41c95c07 | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/644cb315b0d16d03f2b30e6a2f3cd7bdceee5755 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/f16d8d6457d10da9f75da334017d79cd1d64d605 |     
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/50c6174adf29565f8e1022633a19c01f5ee3e50e | ORPH
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/11b2ff07305de94f414f8274fc5fe1fc062251fc |     
    mips     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/8b37c3b61da9015f0fd7ab693f0842faf405bdeb |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/e4cbfa28c5dc5bab40e6d92257678975f907fbab |     
  powerpc    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/42b49933ff984f3605359eadd851b30185165d73 |     
   arceb     | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/cdf42d708fd5dddb386422667cdc54d95cd1072e |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/36b96a1cffb2168b1acec3e1541aaa5c36a5526e | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/86a5c9b5d3fefa50d887ea374ec09d61e5ff41a4 |     
    sh4      |           stella-6.7           | NOK | http://autobuild.buildroot.net/results/820c29ad296433e869d56144d4a1831aeb37761d |     
   armeb     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/93a355976c7149ad5ce7bdc408d944b526ec29d2 | ORPH
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/207066d2517b396587e2288a65a35e0bbcbe787f |     
 powerpc64   |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/4f3706d14b3be6660e7e26967770d1b62187eddd |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/1cf0fd26ad14482b68ffb7a9d378165f304b50dc |     
   sparc     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/00c7da5e9372409fbda44b7c7631ef77ba43a2cb |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6c0f2006b16ba9c176fca67776f4acac23e36917 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e1415f467e6c9294d6ae5e27f1324535afd01887 |     
   nios2     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/20ecbf5acb34d45d8cc0634779f0833d768de333 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/62d83f776b7fbc294caaba4b634e81bed3d05eb5 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/51f4a2b75f77166b513acded8d028fd42d03b493 |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/19d136b707ae6fcf4a13e00dafcd9f582958869d | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/07b4b36ef6676a084828c40ca0eaa44f571574e9 |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/2a2d7408d0e9462844b2c2dbe4b3236630e0bf39 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/097799d7685e9b6cf3de97d070ef65310e008186 |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/78037bb191188d55d5c7adfff5729699365b8b24 | ORPH
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/b8ec03529731f60415213ffb7ea993e042b6df9a |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f14f0b2bc1cc820aa3a6c19564e5a9dadba22e5e | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/51d2c08641ec7598b56e4c0291d3f7ef93a9100b | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4e04d58b031f86d7974b447946a0d8c10fe1229e | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bc39400e27b510474e3cc017bc650eb89699bb44 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/de2f23b07f450c84414f68d736b111623d7e4bfe | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b3de82e9e1b5b50d8b859677b43883267cdafafa | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/45bdddc71340f2fedf47e9fc0d76e66598d9c23b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4a005fe0bc7b4cc12347d479a14a2365b4a5ccb6 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7e730be7e6416a04fb1546d0be68a73052f2f462 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/03f6011348b63fa35e09a6c728286dd31deb7384 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6df2251b368c40261895d4fab44c4cbefe64ae5a | ORPH
  powerpc    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/220c38f779e5df25f0ada973170cfc5b00fc727c |     
 aarch64_be  |           zfs-2.1.6            | NOK | http://autobuild.buildroot.net/results/7e2d3277e26fa5b0c8073a0e8b9e82f47ade9697 |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 4 
  binutils-arc-2020.09-release | 1 
gummiboot-2bcd919c681c952eb... | 1 
    host-python-greenlet-2.0.0 | 1 
            igh-ethercat-1.5.2 | 1 
                    lxc-4.0.12 | 1 
              open62541-v1.3.3 | 1 
         s6-linux-init-1.0.6.3 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4d5af2791364c0ba02a601ba041e787cbe7c0d80 |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a594d769d2076d9780607ddccd1bc87fccefa2d6 |     
  riscv32    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5e10236c4dfd1491d34ad59dc378e28918474cc6 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/dbfeb14417aebe0fedd0d5b6692d81d25d85cacc |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/d764419a266ab119e9500e688d2558edcb68c179 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/40a5cf7c166a56751726fb1fe2b21a020d0d7824 |     
    arc      |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/ccb122fd19e9da7eb653ad57d1c1b4878e3e8bea |     
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/8029e2d5ac93574a52c3300c31517e74a5325130 |     
powerpc64le  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/2ec2cc6a12dc68bcbc7f23cf34620223dd82751c |     
  mips64el   |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/2730f1e8f6c621b8ffc50f6020aa6449f5e8ecaf | ORPH
  powerpc    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/501d57e642c97447eacaa5ffcffd63e477aa9bd2 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/02989162e232419f496088f75c85eac597e4052e |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

              host-delve-1.8.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/1c2ed4e686da26e42182095e95627de29cb6f400 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
       freeradius-client-1.1.7 | 1 
                gerbera-1.10.0 | 1 
     host-moby-buildkit-0.10.0 | 1 
host-spirv-llvm-translator-... | 1 
                 linux-5.17.15 | 1 
                   qpdf-10.5.0 | 1 
sconeserver-8d1935919a20133... | 1 
                 uclibc-1.0.42 | 1 
                       unknown | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/48716793ae7735ae076ad8aff245d3860b11c549 |     
    i586     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c3329724b576a86049e9528a831f5a4a0bbc3cdf |     
   x86_64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/b389616b496598ae052bc7755c8e14bfd857a936 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/964a5b3f6666efa0cdf6824e31a389fb2adb2064 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3d05f7004d16de512de1c55347430651d60f5d38 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/ee46be4b8a2089d021405fc035f81b1e34487669 | ORPH
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/04366eb03486875ba18912a595fe44aad74bdcbb | ORPH
   xtensa    |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/877a87c8076a22d37f821eaa834c80eb49a66c35 |     
 powerpc64   | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/c6146cc01201ab5e398297ccd20591fce089f238 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/a92b76c019c2bd3547fcc200b75e18fc6d7df1f1 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/39d1b4336d4ca770e16cd6c946c73ba57ffe2cfd |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

