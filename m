Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0FC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 05:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BD0840359;
	Mon,  4 Jul 2022 05:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BD0840359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYNczxINRwf5; Mon,  4 Jul 2022 05:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D491A40114;
	Mon,  4 Jul 2022 05:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D491A40114
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A223B1BF3C0
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AE9560BE1
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 05:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AE9560BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnKmyzBBfJyZ for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 05:38:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8846F60773
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8846F60773
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 05:38:34 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 16F6F1C0004
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 05:38:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 04 Jul 2022 05:38:30 -0000
Message-Id: <20220704053838.6AE9560BE1@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1656913111; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cOQlPP5EmzzKlHSmz8qIFPgH9dctkbujsc0Yv3r1xns=;
 b=LnGmyBWeargVXO//E3VkxrSW6Tdvw6Q4xCfABx8XELHf6koNVVoBbeEAeUYWvgnt+fh4B1
 cJwev4SoUd37Nx66n/DHv1qoR8EmM3kJ+oCTF26f9t0U1+FWyZvEgpm3JcFRPcsEobgY0b
 F/i+hw7Po+YCu4Wa9XS6Ekc8SNPZ7eXAIeNcMOU4I0bd9aLqMalgxMAaH8AbcTBMn20n43
 RPTLgfL3wgp/5jnjB+DuMUF5/wEltmQ3O+LJiN2tl9eN4fJR4OJaCrETPXfP+PAYei74HU
 u3bbFu4otYcNwZK13CujNi8H6gjjkf321z4JC5xJ7f12Lrzp5ZqJ758qpshnXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LnGmyBWe
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-03
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

Autobuild statistics for 2022-07-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 25  |  8  |  0  | 33  |
  2022.05.x  | 30  | 25  |  1  | 56  |
    master   | 84  | 289 |  0  | 373 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-7.84.0 | 135
              alsa-utils-1.2.7 | 23
                 uclibc-1.0.41 | 10
                   speex-1.2.1 | 8 
                       unknown | 8 
glibc-2.35-96-g2c4fc8e5ca74... | 7 
                iptables-1.8.8 | 7 
                speexdsp-1.2.1 | 7 
                 linux-5.17.13 | 6 
host-pahole-73383b3a39afe86... | 5 
             libopenssl-1.1.1o | 5 
                busybox-1.35.0 | 3 
               erofs-utils-1.4 | 3 
                host-go-1.18.3 | 3 
                 pixman-0.40.0 | 3 
python-argon2-cffi-bindings... | 3 
                       sbc-1.5 | 3 
                 zlib-ng-2.0.6 | 3 
                apparmor-3.0.4 | 2 
                     aufs-util | 2 
dahdi-linux-5c840cf43838e06... | 2 
            igh-ethercat-1.5.2 | 2 
           libfreeimage-3.18.0 | 2 
                libressl-3.5.3 | 2 
/home/buildroot/autobuild/i... | 1 
                    bat-0.19.0 | 1 
               belle-sip-4.4.8 | 1 
               binutils-2.36.1 | 1 
                    bird-2.0.8 | 1 
                    dhcp-4.4.3 | 1 
docker-proxy-339b972b464ee3... | 1 
                  faad2-2.10.0 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
                gnu-efi-3.0.10 | 1 
  gobject-introspection-1.70.0 | 1 
          host-gcc-final-9.4.0 | 1 
host-python-setuptools-scm-... | 1 
              host-rust-1.60.0 | 1 
host-spirv-llvm-translator-... | 1 
                jailhouse-0.12 | 1 
                  janet-1.22.0 | 1 
              jpeg-turbo-2.1.3 | 1 
               libcap-ng-0.8.3 | 1 
                    libev-4.33 | 1 
              libgcrypt-1.10.1 | 1 
           libwebsockets-4.3.1 | 1 
                libzlib-1.2.12 | 1 
           linux-5.10.115-cip7 | 1 
                   linux-tools | 1 
                ljsyscall-0.12 | 1 
                nodejs-16.15.0 | 1 
                    pppd-2.4.9 | 1 
               protobuf-3.20.1 | 1 
                     refpolicy | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8723ds-76146e85847beb242... | 1 
              strongswan-5.9.5 | 1 
              swupdate-2022.05 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/6449dc6e0e6c983338fa24d1d1cb88c597c271f8 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5910093f739810fd71e184d05b033054e64a6482 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/cf7fcce0f423e50bf167d9e8fd756a886041972b |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1e059f5fdc9996d631bcc5b97ff6379b2dff9ace |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/baeffbb746bcf8e639f61e42a7a06c4244d2c421 |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/baff39836a1e4ec2e644f34d91b219418a073ed9 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b8ca16842740465b8f3be8b271ad204d3b3536ce |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9c96c646dbf6379d532f5d546993a5b691d5f1e5 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d5d9334ff14a8c36684836ae38f858111e28a3fe |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1c3f4c1d8ac3459a87fa57c48fecd2e59285c159 |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ae4c692e6fe634dea00b1d03e0d461890e709fe3 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d32f7e7725872b2965a1a429c946233253a8af09 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/722db0d0b4587e49ba21fc4fe6caeafb8aece864 |     
   nios2     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a90f4da62bf1b07f5621c0f8fbe493296aea660d |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4775858bdfcc780da18595d772cfdc53c2ae7333 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/46173e39b57b8568ed87264a72556664fbdb3eb4 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/80460119dd56cf71811e306ff92a537a9d04aa9f |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0ac6f29489c3819b2da710b3f4089c715a888dfc |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b3e27f89fd9a954f1de350fee100dfe853d0bf46 |     
    i586     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/992c9850bfb6597709c01e4f52da9d0a98fcd3ac |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e9f801a2b678030610cc3f154988890a49cf10d5 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3029312f4b2966cf4d71a9f4411d33cbb49f7209 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/794de2e6e5ec2be1a1042a0021fef496afb42016 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/20c100236a2d9d7eeccc1604ceeebe2c4b062781 |     
    i686     |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/c213f614c57f6fd5c25ed65445c081aed124f833 |     
   x86_64    |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/25c70433f75017a26b0b285a6d8b3322c4e7d845 |     
powerpc64le  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/894cfa23af1ca3671dff39342e2ccd02593a8d8a |     
    i686     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/13b6d2f0d75401376ab6343f128b4ae5275c4d96 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/9ee3b35c83330efefdcda3ba7d4404de4e0c0a04 |     
  riscv32    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/05031105b7f19df06cb91dd78175af94b41dd00a |     
  riscv64    |        binutils-2.36.1         | NOK | http://autobuild.buildroot.net/results/7d4df52f8af261f4847746d657d2a60e1be1dd6c |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/41c0adf2051abc6975a8365790f41368d6241075 |     
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/75d81cbeee269082a13aab193d5a46a4af92504a | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/5b18e3695d34a5e068a258d47153c807afc38dfc | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/367ff6dc155b4e2c2e0745f978831a1016eac7b8 | ORPH
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/9f991803a6223a838da000da8994f8a09e1020c2 |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/cd1ab68bc8f71948fc9e3a247785218ddb9d1599 |     
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/6c0d347dd72c5c652c32556961576139100b38f8 | ORPH
   x86_64    | docker-proxy-339b972b464ee3... | NOK | http://autobuild.buildroot.net/results/f7e6ed683d4f295d156f7208112c298a27ecc55b |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/e534bb85f6b05a0847e167a4137b9262a0ab7476 |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/755f8d736b8ad96b213bb3975b26f1143e60e5b5 |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/5f1380c811885844f399545d4a386b3e6a6147fc |     
    sh4      |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/8a792e91b12d6bb005f75093948e771d2bb98555 |     
 aarch64_be  | fs/btrfs/btrfs.mk:55: /home... | NOK | http://autobuild.buildroot.net/results/87677338bf7c4c3dd1bd4fcf015aa238ca463d0f |     
   mipsel    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b7b107efd3bd85358ffd14cfba2c9ca498187aa7 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/88d264a84a30ef8a797887eed0b2f04699c48379 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/12235510d7e86202ebaa6f85bbef87f53dca570d |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b31c35c21a73bbe5c98c5651f1347739196eb9a8 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/f7ef51f0be0f51c7d6d447e7bd66148dbb9461a0 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/13d730a702a2d2f07fbe09f6d03c614f5fbafb35 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b92a9b70c3f37346a16b77821e9a5c17ead046e6 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/c7ec7d6f9cf99677d9c9c9b794eb90e7a2798437 |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/842adcdda001772e81c6233ff75f28bb698454dc | ORPH
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/a9f4eb0784c39f27c3f7ebe45b2ef8c207358335 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/e805f2b4a4a7a0945d026d5a82f8019c33af46d5 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/9c8c48b55938faec8c331eac71884d1568f5c44f |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/54bc5090484eb15f114795c46cf53e7958f86033 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/53006ae44fb0553a2b13d420fe1d62d184af26a0 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a7d21fb9d3220f5a5b0780685fdaf45dac1812f1 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b9bbce85ea215e150569136287b154ea6780aa45 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a8312a917a19e1e8ba30b40062ccc89a20c64be6 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/333b6dcac35254d55b720f597162432b9bdaab5d |     
  sparc64    | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/2b381cd32671db4aa0b281ece5569667bae0f923 |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/443e00126830a257763b2a3d605e2a10d800d3b0 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/20506dd87e9d5f5ef1e1c9c3c0fda48d4ad0527b | ORPH
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/f603b55c9f4213471fa1f7b3cbfb9396ba0f993d |     
    or1k     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/5c367a559fd02f9f87f2dcf0bdfd06b7aa38b79e |     
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/e1eabbb81079fed5c7f6434559cccfc6278693b5 | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/fc94b75263b9697fc7ab1efef07406cedba33bc4 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/592cafcc67621e07962a5d89145b7cd6264d2c8e | ORPH
   x86_64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/4c1dd30c74ad59e5a9e7b4b8b4157ca4072d7f9c | ORPH
   mipsel    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/398f50fde7e163c59bd8a378620f18c31d8eb206 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/fd7e9f1e0f0c0d1ed2e7e2e885be4b4a7b3baf45 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/d14a63d222d9d27d9bc62fdf085621a5c5bc2035 | ORPH
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/0d96de49b740242ae91866634b603c1580ce16ae |     
 microblaze  |          janet-1.22.0          | NOK | http://autobuild.buildroot.net/results/1256098ad9f261ac2cccb25c411757771ffc89ac |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/107acf0301fd7cd214719e4b94a0b12e9bf201df |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d86c0da75d7199a0ceb1b1c3e38c059b198e6ef7 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/272c19695f7766efeea547dfaf475345fbfa37b8 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1bc48f6fad02388bc9e23bc0c386f207ee2bcaf2 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9a3cd81d7cb6dc2277c8fed06a14358a2ac171fa |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3e63283d18bf9a8b497150436c0ba06ab0ff2306 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a63add183a11b5685fc2d173a9bf326d8c8598f1 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/512a25c65755711cb2f92ba6832f825a88ee978d |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f074bfaba0329459ec4bb35891a915b97886ae66 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3bfc2ec1b7d2037c3efb081b3f8027c1691503e5 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5f8bd2b5306988e44ae0aecdbb76c21b3daa3e51 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/15b17e5202166b091b174c673d766d7855f6d19e |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/577816aef2059d6926ac64d05dbd70511906ef1a |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e5dd90777a1ff988a87e4eb30bc9bcd05dda0855 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a8f85e1334bfd3fe50191f5a6a490224acbfc4f6 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fc6be56e9e8de3d44ccec738540d071377f4c857 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2187f8a7fb4ee9b6e2c0c34e78e1dbb55e707c13 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4b42f5475d9734c81813873a0e3effd1ebd34df8 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/32266a7e5cbb7020863d03cc943a1e07e2a6507a |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/29b44d9291a6f01f7037ec4107bd899f15590fef |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d4844fd00e3112b36080a486615ee5bda40a3e8c |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ab93197e251a7b28e6d3bc6c00841a32e6473bba |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f5ae2fc90e0e1908113a0495575f6b5072c2eee7 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7737cd3352f91bb9deb9347e3f5ab051735a8849 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a420b623352c7c706705c40973f869f1236dee6b |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/17bbfe589734121d46c08c1813533fd25a76abfa |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/25dfbd18f2af765adaa11eec991d5953c9dabf48 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/64e434d5c699fc80da43b153249ce622e97c5a1f |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7bd7a72ca4b753affc3c68f09c93b9a97b2431a6 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6b25075e1b37b408cf344b8779c6fb3af743691a |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/922f91a1759ac1d99c901e9fb3e97d7f447198c7 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d83abb513050103ba9b3fa77ba8287562d7912ea |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a1d7f9564a01f4b729983c0f02f61d8148093478 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/636920cedd8a301ab39812954459879a2a778bb6 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9e44c389f365953e5aa008374807002a61e4308b |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/db05adbb92932c907635af83e2226b24e2706eaa |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e7e581dc3c56484290595fd8901dbbe696c77f95 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5da134c0dc3622877555813b62c7e9b338bc140e |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/654ecc2c57c3e257e5d54814e4562d46517471e0 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/88c5230899ef36022e70c41b83779936268c8b44 |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4bce9916e51b71a8439e15b3702cba9b4a59b85a |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/de3312ec815aaee1def69147944776fd2f9e88d4 |     
   sh4eb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/280c7201ff7ff4e5bcaf68b84486f7f00a604899 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4ab8b6928df080428819f1a960a9ac1ff851c69b |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ab81d48621c78ac4cd05a54e1dfd27f1dd0eefa1 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c93f2f4f190c1212d1fc14df496c2eeed1e440c7 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6add5a85bf40430acd68467fa06c3920f030ae78 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5003caee9a129f281227c20e00600be2388d9086 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1bbe3a9a1f1757cf2c173cfb7033683ca101071b |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d098fba6b1f585bb07bf4fc23755e2a17ca45a99 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/649e332f0e3d5661b367c7582aa167680ace77a9 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dc70b5da87126cde2022c5cb663ffb37771f7e97 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/501747dccde7f2ef0a6d4d25362ba4d3d0b81bfb |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f479c9533e7edbde64f136f808d294a2f7d7cd8a |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/08f820aad80ace684889668682074ccd30fa1ca6 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/873307388dc629ef5f88c70dfb429ed40378488f |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/45a0043241bf7c5ef2e24004b6a74fef9dea0507 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4a4c52965a5300dc6dec8c0f8e732ea25a5a9704 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cf70a4fff1e3ea1acf9f22e3685952e90d28bff6 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9b05bd374d9ce83c0f1f215b6f0621e5e212646d |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/184f7427aa361471b83104e6b87a8deadc00c6de |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c814991be7c8022b427eef876dbe76bfa6729e5a |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a5f9c9f7c514e483f39e8a9dacd8b9788bdd44ea |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7b7ace8f7ea300b9877a6af4f19189aa815e702f |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/674ea0a930da76727cb78907f30da84d99e82111 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2897e5eba00ae4496cabe1303ead426b396209b8 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1e47707d3bea40639ecc157c48f507c565cdbb09 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0018735fb9f5a9f2927c1a6d36899cb89a6d226c |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1407c1659c107361f1da855802344b609ee90a20 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8152ca85ede2d8719da15aae1a03ff0dc033e747 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/04b30f6ddaf941c0584cf5217747b3376d6bb93b |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/40741b732a3dbc0abae7b7aabb5831cd091a049d |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/34e9ba1882e6bf8b3b3266beb5ae32922af7ee91 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b013e6927a0f3b163c5b8245e9faabb37cb33391 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ee61945f5a24e2300ebe4114d9526f8398294889 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/48723091e661e9786315e02341b763b0aa572733 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a2c7bfcc1bcd17bb77da0ae664466b7ea93c36ab |     
   sh4eb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7c5073f08a9447e2f5d796b3660fea20523f218c |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cd1e0b6733141c5732d9aae5f91c80431b58e79f |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c99bef149a3eceb9072cb6265dd3bf784185ade4 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9a1fef0726e4baa68f673977cf436e06e33f8ec5 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3cadf8c7e19e5e2b45d960550cc1fa6f298d9331 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/04651124d8744c724ddf2a9b8de6f765aa787a3c |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b9a4d2bad52b5882fa6ab7d7fc27b308352c48ad |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/13f5c1d68a867967c77a48b9df5a8d4569bd2c1a |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bb59af244fc6283b14c71162397cf7ba7e9f749d |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1eb9c8e77277935e555b8e76ec22a4383ca98086 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ee8e6ee7b26dc9078f86f0beee95a30dc3a67c5b |     
   sh4aeb    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d8eff9efb747c7b5724bc20b59e42df533d024ef |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/90555dfbcb0228daf6f2b835c688f218be082a1a |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/aa4a8832d9bf2e47b09bd982c28f6c9440e5169e |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dd737167c1d9cc67ffe01781f17b2d706f21c170 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bc2237dc9e115fa982949013bb7bc86ef4230af5 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/56a3ca93932c40c8763fe5eb5f7d8fb79520422b |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/736e18b845ff0edf44355b17a77d61b77f6a0332 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4741e1912e50314aeda1011416d7e4a905cf0f34 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d43d3bf7c4661a081f098b3710a0ae29cbb795b8 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a2d3977a1bf56c0ed6a66313ea330c01eb6cc7e6 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3bfb7a84b4bb24dd45cbb13ff9af10759f12c081 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5f7af34d57dc89e938699db11284b0acd8c61894 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/df4be7006863d0977b41da9c4ecb55aa67dd741e |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fbc80a0002d640210c81a4c518856c02669059b7 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/590cd85e1e7a1ca8652a7dcd44a7e2febb38c51b |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/abb4a10daf53298723f72ef687e9173b165f7787 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0ecdba861a01a5b8f1304a02fc6c0f1fb886d346 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7b5956075ceb1a8a20452524fddb23c89c56ac63 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/83807e62b1ad318ce6f423d0a1f13b9e1857c2ac |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e56e701c246cd50abd0a580332c8038b594d4130 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e4c9c6b238fb2af425496730212697cada6c693d |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1b3e75e3335c00046a7110db89fb6ddb95b6c4dd |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/88fdeb4f62637031b081fabd5c324b654ebd2780 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bd9c759ab0fd69bf2d739a2b9ac9e5e6bac907b0 |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/54cf2aca4d2e13264f0d373a392531fe180d1748 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ed24fda68b48c3bba69267211a3cfae4264cd26a |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/53c0368a0035732f1214fb60d119d2b60860727b |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/38f2f534500f6ae34335e5439101101714d1b01e |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/002905578dc625bce42fcfed83be333cdb731ab0 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/437ad3370bb888df1b7ee12d3f9062cd9f814a31 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7e95bb1daa6d376407e9e4997ffeb3f6cecf186c |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/689232836fe6e2bf3e8c4b87487847049dcf292a |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d6698aa384a02cda12179c51945b7d08f407cdb8 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ab1b237e6e1fdf8cf3931c101aaa3c53fbed21dd |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/40f219af793298f65d831f98f85eba194b31e43f |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0aba6cd002cefd3e0d02c56107b510b7e4e3dbae |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/459c0ad920052d93cf80d7c126719f7c4ab60c7a |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/211c27f4c67feff4052c9c604f54bc7891627b9b |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b087b13da3d43ab97bd10d6771d270e318effbe6 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/10717ff362d9e10a437de486e0dda5b5d042cda1 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/67d67e2c32ca43221ea862f061ba6b570039577b |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/aa9fd389ec210f10a105441aaf57c098831d9eb7 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/533e9c2fd511d877c46288259e52251239d09cec |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6d126b0ac7245faed7586b3f934edc9ceb18ad67 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1fe6c0207313894bc9302109123c8ea3d814a20b |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4211fd61c891f233a454408f36923a3b18c0e423 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bc1c07231f75860dc80534f664b77d495c69890d |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3d4249898f1b64a45f269e5cc213b50a87946ccb |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a117ac221904a17bb4f6d06b9bada7e1f227bc59 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/5faf7563ea3a5d5e1ce82374e1a08f0d0daf5383 | ORPH
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/64ddc4dc89f772345f860c80904eeb4a6c27b7f1 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/46a45a9cf733fcef9483660a9bfb9b91e22d7601 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/be0455e4f96461306bc98a5b138d2f0f04dbca61 | ORPH
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/5c96aded114194293e4dccd7e453a84df31ee655 |     
    sh4      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f0f901b07267dfa40a28e7eb58e6868e3d3aa778 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e636b7e701622d6c9ddb826dea6166c50cdbeb45 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/af70e5130e79c9be49f2190620c4632bd04c7063 |     
  aarch64    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7600bf93090e12b33f2a70dc997130d944815704 |     
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/3f9f50f3ffaa879c687bc2fafc72596f8bc205c0 | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/5ec02a376541b56d196f55e249007f4f54632998 | ORPH
  aarch64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/3c3bee7b52584a8888d1d065a8b1985cdf62b9d1 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/216bd9f2eb0d624f13c741e1eae7015a11522f5a | ORPH
    mips     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/82f17a25e76c56dcc53d8b726d04a170d28ac1a6 | ORPH
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/4fb316cbc09a1640c0b242ff08eb28a753455295 | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/84f967fa3754ee5795e21e572dba9223d514069f | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/81dffe8b4293958f544a7f03339ed8c7addbba7c | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b177b002824f25ed18d78e3c5111750f89c734f3 | ORPH
 aarch64_be  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/01ad5aa82ed396ed799cc65d3bf5d59afe8a8cda | ORPH
    sh4a     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/0fda7b6f257444a6292eb28cd990d7f6b3890b36 | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/0f57aeba201857ac501ee0786169c546325ba482 | ORPH
 aarch64_be  |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/a49b979ad7e79051dc20706964173e2b9e0e706c |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/8a2a82f101468a3af05eff4348cbe6ce300f4d60 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2e5f085adc7402d83c139d40c081637fae14e7d7 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5b737722d4bf1b6304ae84471c68b9451d057c31 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/babe14265c515ba7301870ca27fab89f8137096c |     
microblazeel |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/393ec647343253df4de745779c762edd3c2ccadb | ORPH
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/801a79aa575cd4b93ddbfc920f4757fcbd190acc |     
   x86_64    | python-argon2-cffi-bindings... | NOK | http://autobuild.buildroot.net/results/5f5f373c92784979539bf97e1e672bbbc739903c |     
 aarch64_be  | python-argon2-cffi-bindings... | NOK | http://autobuild.buildroot.net/results/5e15e4af0db0d811f4bac778ff22f1230f388de2 |     
 aarch64_be  | python-argon2-cffi-bindings... | NOK | http://autobuild.buildroot.net/results/3e0b4ad4b1b0714ef0fc877ab61933f32c0d47a0 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/709d1ca088210b9ca86f51bdfafb11019a2d1046 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/0a522d5be06e6af9541f74759ffe57c1eeeb42ab |     
 aarch64_be  | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/a689d4d99ed506b257b898138526e272b47133ff |     
    m68k     |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/e93c1aa20d0fca0b789b7eb0abe7fd8f3a8e1d03 |     
   sparc     |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/8f999efa2b2faedaf72f33e1494f9bb95df2120e |     
powerpc64le  |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/863c312e2a4e6b6c4750e1aff03b67c0665fec6f |     
   nios2     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/1bd36266c6199eb12fe63c77d7ac0abdbd6093b2 | ORPH
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a9530da45cc7249c6c7aa7c16808a9c2628c8e1f | ORPH
    i586     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/a51230addb2a35a4d5e7b1eddb3118224f6cdfd9 | ORPH
 microblaze  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c0d0c50d44c0b8bdd9356125117d2bfd3403ca53 | ORPH
   mipsel    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/5bd182ee8c717eb39831adc95415bc6e125cbcd1 | ORPH
    arc      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/0a5bc38ecb7aa371a8cae7ddd67a1f0ea1e4e12a | ORPH
   mipsel    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e1937f24de96e1be472f18e1274963849ae832b4 | ORPH
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c1f4d25741415ef39657dbf6cdcd54b14551036e | ORPH
microblazeel |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/0c0b99cc9f59ab81bfb313a3de13d61182bd2527 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a80241dcc6cfb10ae81079a040b20d4f51fd6bc5 | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/d25d3047bb31721fa329b9302dadffb0f3b25f59 | ORPH
   sparc     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/c5920403bdbadb8d40cef3fd14577626d073060d | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/113ac52d1aca59c875e0d38572dc301856f16b29 | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b6cf3fbfc8173714494edccfcd8bef51899f9e7e | ORPH
   armeb     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/7aa76b523f3a9f1dae2400b675ab2d215ff61ed8 | ORPH
  mips64el   |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/919dbdca0144309ec01e9d3b36e2d098550cd92a |     
 aarch64_be  |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/21607956260b16e1ba349d08dd83240e0e5660dc |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0f0ba88231a35a8bbca77f9a702e4bf304b2f926 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e9531fb23aea3ac663659cb0626abdcff24447ac |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e0fc35b2def4987a174e2fe09ee90f005533caf0 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3eb6140826828dcf54ca2c6c7b959b554a253d22 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/40496235b8fcbb07b216ddfd8b41ff5b218adac1 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/102fdfc55e8d2382e3d4a2a6c79b7232ca58bc01 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d0e3138709ae54ab863aaabe0f6e2bb1010a1965 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e08e944edbd634fd6537f27e91d3ecc07be424f9 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b7875a54456def4a202c49000d2e52e833dd183b |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1fb3d7dcb6d189e9f637b618f01c1adcea3a3caa |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/57cf1ef2253e5350c940adeea1d6e5ca9a98ace0 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/1d0d3b9c09ca0d7ce0ea4474a06dfe0e8d04a9d4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/105a64c1405434ffb530f3ff1c474394aac42995 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/21d53ff4a4d2277b2d86ad1a49d007671658f34f |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/4a65afc33bc87d710570fb692464f20c667ff57f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/dd600a27a88569936d1a6ff1d448987abbeeebc8 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/9b0a825d23339c7f816fb985e5a7d4c797137b04 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/cb63a883c14f36bf28dbc6ed9c4818d1bb9c172a |     
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/55d227dac901d9f8a0a341ee5016d8e11c53278a |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/19a9d503ce9dee9804a5178e5e16f6ba6bc53447 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b879fe0790400db2b2c50955d2510af072806d9a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9d2a2568e3d935323747dab267de56ba46e4d422 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 2 
rpi-userland-14b90ff9d9f031... | 2 
           libfreeimage-3.18.0 | 1 
         rabbitmq-server-3.8.2 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/a42d37bb16cfc401ec3d8ffbdfc2ed7b7610c8bb |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/c9ccf15438f73089eada8e0527c84d1284599d31 |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9e5b724fd1ae7f3931427f571cc9a74ecccda01a |     
   mipsel    |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/2a4753473f120ba9d04cf517ddcd8d33f5c4e204 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/ea927f8e17ef8b3f8cdb8ff3ee6833a4293f7ab7 |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/e46eba16c6bdc8ecff2790e8e380673465c82281 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e3920d508f625b44dbbfbd6a42601acb3bfe622d |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/370b5c26c116426d321e03058ba0a82d34076a47 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

           libfreeimage-3.18.0 | 5 
host-pahole-73383b3a39afe86... | 3 
glibc-2.35-96-g2c4fc8e5ca74... | 2 
                 pixman-0.40.0 | 2 
                       unknown | 2 
/home/buildroot/autobuild/i... | 1 
                 dash-0.5.11.5 | 1 
           docker-cli-20.10.14 | 1 
              jpeg-turbo-2.1.3 | 1 
                  libnfc-1.8.0 | 1 
             libopenssl-1.1.1o | 1 
                 linux-5.17.13 | 1 
                    musl-1.2.3 | 1 
                   perl-5.34.1 | 1 
           python-orjson-3.6.7 | 1 
                     qt5webkit | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/0a627243385b07e9a91225614c2d2e7db2c81f3a |     
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9f416ee4beb978feecfbff1c4429e3b5e6cd6782 | ORPH
    arm      |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/d3aca949f6ff0ac26bbcf62134c7eff594168be0 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/749421c59803a01e3a3e3ee01dd3bf91433948bd |     
    mips     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/f9bb985e5f8ae3143517c5f68d44a380fc61a285 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/93607119279b2084f3bf27e732d62f8941b7978e |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/022ba6c06daa357672cd9fd55c4fe3be61c0abaa |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2b56e8f4a9a2cbf33868c7f12947c4ce93d834b9 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/1893927ad72a053ebdb80986801eccc848dd6367 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0f8c8f375ce06c720ea6ec103f9ebbf8f58f7e4e |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ea7638cbbce48009b8343ecd09d38f8f12980e83 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8025bc97176ae7f258f73dd7ced169ac50dddc83 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e8abf50e4c55a2a0b2501578e80a706bb3cbe845 |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/eeb45971bb936a8c68718e0a2ed87b6058b8acbe |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/4d61da2c3ebe9cccd7a7d160039275771e110667 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e746e26846e4f91174188480211620aede7089a2 |     
  aarch64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/65de64d2c020974a5030a56dce58f5123c2cd7dc | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/a5a0c9741f7df771ebf82ee90a59ebc2362d02b4 |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c0490d7f708a9e0a34232895b89345caba9419fb |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3ceccda85c15219dec19a24f300692438397df7a |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/edfa53a192be757e9b36778e7cb47552ea67ecb5 |     
   mipsel    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/31a3a4c58b47c19fde780b18cac224dbedc329f0 |     
    arm      |           qt5webkit            | TIM | http://autobuild.buildroot.net/results/32edab1a1b8623eefb9f8fa8a73d3f24fb787586 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ea8a436edccd98ef2faaa7905649291898a32fd7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e43f57c882cd0972a22a80d1812ea9ef0870203b |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/193971286cc7f0f7d36328b2ec31d484502b8031 | ORPH


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           4th |  DISTRO  | https://release-monitoring.org/project/20471 | 3.64.0       | 3.64.1       |     
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.0.6        | 7.0.8        |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20220331     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 42.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.3        | 4.5.4        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.7        | 1.2.7.1      |     
                  alsa-plugins |  DISTRO  | https://release-monitoring.org/project/00041 | 1.2.6        | 1.2.7.1      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 12.1.0_r8    |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.1         |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.2.1       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.2.1        | 5.2.4        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.25.2      | 19.5.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.45.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.8        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2021.02.19   | 2022.02.11   |     
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 6.4          | 7.0          |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.12.1       | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.12     | 20.10.18     | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.21.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.4       | 2022.1       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.7.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.45       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.6        | 8.2.0        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.45       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.45       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.27      | 9.18.4       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.37         | 2.38         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.8        | 2.0.10       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 23.0         |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 3.1.0        | 4.0.0        |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.18.1       | 7.20.1       |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.1.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.19.1       | 2.19.2       | ORPH
                        brltty |  DISTRO  | https://release-monitoring.org/project/00220 | 6.4          | 6.5          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 5.18.1       | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.24         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.9.1        | 0.10.2       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.6.1        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.8.0        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.5.0        | 2.6.0        |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.6      | 0.105.0      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 11.1.0       | 14.0.6       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.22.3       | 3.23.2       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.12.4       | 0.13.90      |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.3        |     
                   compiler-rt |  GUESS   | https://release-monitoring.org/project/17705 | 11.1.0       | 900          |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.6.2        | 1.6.6        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.4.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.5        | 3.0.9        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.12.1       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.2.3        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.1.0        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.3.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.22      | 1.14.0       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.8.0        | 1.8.3        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20220526 | ORPH
                     dmidecode |  DISTRO  | https://release-monitoring.org/project/00443 | 3.3          | 3.4          |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 20.10.14     | 20.10.17     |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 2.6.1        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 20.10.14     | 20.10.17     |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.19.0       | 9.21.3       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6.2        | 1.7          |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.0.8        | 3.1.0        |     
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202205       |     
                        efivar |  DISTRO  | https://release-monitoring.org/project/00664 | 37           | 38           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.2       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 21.12        | 22.05        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.186        | 0.187        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.13.4       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.49         | 0.51         |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.3       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 25.0.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.21       | 1.0.22       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.1       | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.9.1        | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.16       | 1.0.19       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.29       | 1.0.30       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.14       | 1.0.15       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.10       | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.8        | 1.0.9        |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.27       | 1.0.28       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.47       | 1.2.2        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.13       | 1.1.15       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.23       | 1.0.25       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.5.6        | 1.5.8        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.32       | 1.0.33       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.12       | 1.0.13       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.10       | 1.0.12       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/63188 | 1.4          | 1.5          |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.17         | 5.18         |     
                        evtest |  DISTRO  | https://release-monitoring.org/project/21347 | 1.34         | 1.35         | ORPH
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.9.0.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.1        | 2.6.2        |     
                          exim |  DISTRO  | https://release-monitoring.org/project/00768 | 4.95         | 4.96         |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | 1.14.0       | 1.15.0       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.26         | 1.29         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.9          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.29       | 6.4.30       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.2        | 5.0.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.41         | 5.42         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.30         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.18.1       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.13.04      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.13.04      |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 2.0.0        | 2.0.6        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.1.1        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.0       | ORPH
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.9          |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.11.00     | 22.05.00     |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.12       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 3.41.0       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.8       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.9        | 2.4.2        |     
                  gesftpserver |  DISTRO  | https://release-monitoring.org/project/59393 | 1            | 2            | ORPH
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.2       | 2.37.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.72.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.72.1       |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.14       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.32       | 2.3.6        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.10.3.0     |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.70.0       | 1.72.0       | ORPH
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.23.1       | 3.24         |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 7.0.0        | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.45.2       | 1.47.0       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 42.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.5.1        |     
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.12.0       | 1.12.1       |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.6.1        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.4.2        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.5.2        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/01282 | 0.14.0       | 0.14.1       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.10.2       | 0.10.3       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.2       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.0        | 2.6.1        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 4.3.0        | 4.4.1        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.18       |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.12.0       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.6       | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.358        | 0.360        | ORPH
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.40.0       | 2.42.1       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 71-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.37       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-19     | 7.1.0-39     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.9.0        |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 53           | 55           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.6.0     | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 22.4.3       | 22.4.4       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 22.4.3       | 22.4.4       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20220510     | ORPH
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.1.6        | 2.1.7        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.10.1       | 3.11         |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.17.0       | 5.18.0       |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.2.3        | 1.4.1        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.25         | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.16         | 5.19         |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.25         | 1.28         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.20       | 1.9.21       |     
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.22.0       | 1.23.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.11.6       | 1.0.3        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 3.0.5        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.3.1        | 3.4.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.13.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.19.3       | 1.19.5       | ORPH
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.10.0       |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.4.0        | 2.5.1        | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.95.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.95.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.95.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.95.0       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 29           | 30           |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 19.4-Matrix  | 20.0a1-Nexus |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.7-Ma... | 20.2.3-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.3-Ma... | 20.2.3-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 19.4-Matrix  | 20.0a1-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.3-Ma... | 20.1.2-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.3-Ma... | 20.1.1-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.4.1-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.2.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.2.1-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.3.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.3.0-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.1.1-Ma... | 20.3.1-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.11-M... | 20.2.7-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.3-Ma... | 20.2.3-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.2.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.2.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.1.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.3-Ma... | 20.2.2-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.2.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.5-Ma... | 20.3.1-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.3.1-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.2.1-Ma... | 20.4.2-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.2.1-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.15-M... | 20.2.1-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 19.4-Matrix  | 20.0a1-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.2.0-Ma... | 20.2.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.2-Ma... | 20.1.0-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.1.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.0       | 3.10.1       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20211102.0   | 20220623.0   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.15.2       | 0.16.0       |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.27-1       | ORPH
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.6       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.6          | 2.7          | ORPH
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0.2        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.0.1        | 1.03         |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.14         | 1.16.1       | ORPH
                    libdvdread |  DISTRO  | https://release-monitoring.org/project/05614 | 6.1.2        | 6.1.3        |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.11.0       | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/13493 | 3.10.3       | 3.11.0       |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.6        | 3.3.7        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.70.4       | 2.72.3       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.3.2        | 1.4.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.42         | 1.45         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.16.0       | 1.17.1       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.30       | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.0.0        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.19       | 1.0.20       |     
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.6.6        |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 236          | 237          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.38         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.14       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/01639 | 1.38         | 1.41         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.1        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.20.1       | 1.21.0       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.4.0        | ORPH
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.26.2       | 1.26.4       |     
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/68638 | 3.0.6        | 3.0.7        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.7        | 2.1.11       |     
                  libnfnetlink |  DISTRO  | https://release-monitoring.org/project/01682 | 1.0.1        | 1.0.2        | ORPH
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.1        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.2.1        | 1.2.2        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.18       | 0.1.19       |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.79         | 3.80         |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.12       |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/20333 | 1.1.1o       | 1.1.1p       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2022.3       | 2022.4       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.30.0       | 1.32.0       | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.3        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.3        | 2.0.6        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.30.4       | 1.30.8       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.4       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.2        | 2.0.3        | ORPH
                 libsamplerate |  DISTRO  | https://release-monitoring.org/project/01716 | 0.1.9        | 0.2.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.5.3        | 2.5.4        |     
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.5        | 2.4.6        | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.0.7        | 3.2.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.2       | 3.1.1        |     
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/01733 | 2.3.3        | 2.3.4        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.6        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.5.0        | 1.6.2        | ORPH
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.1          | 2.2          |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.43.0       | 1.44.1       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.14.0       | 2.15.0       |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.14.0       | 2.15.0       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.4          | 1.5          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.12.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.5.0        |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.11.0       | 1.12.0       |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.3.1        | 4.3.2        |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.4.1        |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.0.164      | 2.0.194      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.8.0        | 1.9.2        |     
                      lighttpd |  DISTRO  | https://release-monitoring.org/project/01817 | 1.4.64       | 1.4.65       |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.14      |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.26         | 2.27         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.46       | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20220310     | 20220610     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.06.16   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 14.0.6       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.14       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 14.0.6       |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.12.1       | 0.13.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/01842 | 0.641        | 0.651        |     
                 ltp-testsuite |  DISTRO  | https://release-monitoring.org/project/21502 | 20220121     | 20220527     |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.5        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.3       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.1       | 2.13.4       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.2       | 2.13.7       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/01856 | 3.9.0        | 3.9.1        |     
                           lv2 |  DISTRO  | https://release-monitoring.org/project/230934 | 1.18.2       | 1.18.4       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.16      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.12       | 5.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2200         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.35      | 10.9.1       | ORPH
             matchbox-keyboard |  DISTRO  | https://release-monitoring.org/project/230595 | 0.1          | 0.1.1        |     
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.22       | 1.5.23       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.0       | 3.1.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20211018     | 20220418     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 180          | 184          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.5.2      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.45       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.12       | 1.6.15       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.1.3       |     
                  mesa3d-demos |  DISTRO  | https://release-monitoring.org/project/16781 | 8.4.0        | 8.5.0        |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.1.3       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.44.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.19         | 1.19.1       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 3.0.5        | 3.0.6        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2022.04      | 2022.06      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20220511     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.10.0       | 0.10.3       |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.18.6       | 1.18.10      |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 5.3.2        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.7          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.182   |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.30.0       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.1       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.20       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.3        | 2.1.4        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.40       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.94         | 0.95         | ORPH
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.20.0       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.2.5        | 2.2.6        |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.17         | 2.1.2        |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.46         | 0.47         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20220703 | ORPH
                        netcat |  DISTRO  | https://release-monitoring.org/project/21534 | 0.7.1        | 1.218        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.35.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.16       | 2.1.23       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.2        | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.36.4       | 1.38.2       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.18       |     
           networkd-dispatcher |  DISTRO  | https://release-monitoring.org/project/242008 | 2.1          | 2.2.2        |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.1        | 1.0.4        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.48.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.23.0       |     
             nginx-modsecurity |  DISTRO  | https://release-monitoring.org/project/68639 | 1.0.2        | 1.0.3        |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.10.2.g5... | 1.11.0       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 16.15.0      | 18.4.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.132      | 390.151      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 515.57       | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.0          | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ocrad |  DISTRO  | https://release-monitoring.org/project/02526 | 0.27         | 0.28         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.4.1       |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.2.4       | 1.3.2        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.21.1       | 1.22.2       |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.6.0        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/06615 | 4.5.5        | 4.6.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.8.0        |     
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.14.1+1  | 20+4         |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.4        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.45.1       |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 12.0.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.6.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.29       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.45       | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.50.7       | 1.90         | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.0       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.4          | 3.5          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.14.5       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.4        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202205       | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.34.1       | 5.36.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/02748 | 0.31         | 0.32         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.86         | 6.88         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.14         | 6.15         |     
    perl-file-sharedir-install |  DISTRO  | https://release-monitoring.org/project/11851 | 0.13         | 0.14         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.76         | 3.78         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.14         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.36         | 6.37         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.62         | 6.67         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220520   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.24         | 9.26         |     
perl-mojolicious-plugin-aut... |  DISTRO  | https://release-monitoring.org/project/21729 | 1.37         | 1.39         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.33         | 1.34         |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/03152 | 6.21         | 6.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.012004     | 1.014000     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.21       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.5        |     
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                          pigz |  DISTRO  | https://release-monitoring.org/project/03642 | 2.6          | 2.7          |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.0        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.52       | 0.3.53       |     
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/91990 | 1.28         | 1.29.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.8.0        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 2.1          | 2.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 21.12.0      | 22.06.0      |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.3.10       | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.0        | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7d       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.0.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.13      | 0.12.1       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.20.1       | 21.2         |     
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.4         | 23.5         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 16.1         |     
                         putty |  DISTRO  | https://release-monitoring.org/project/05749 | 0.76         | 0.77         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.1        | 0.4.3        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.0.0        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/03766 | 1.7.7        | 1.8.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.2        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.2        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.5.2        |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 22.3.2       | 22.5.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.9.1        | 2.10.3       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.2.0        | 3.2.2        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.10.0       | 4.11.1       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.14.3       |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/21929 | 0.6.0        | 0.7.0        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.19.2       | 1.24.22      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.22.2       | 1.27.22      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.19      | 0.12.21      |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 2.0.0b1      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2021.10.8    | 2022.6.15    |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.15.0       | 1.15.1       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.5        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 4.0.0b1      |     
                python-chardet |  DISTRO  | https://release-monitoring.org/project/03798 | 4.0.0        | 5.0.0        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/55366 | 2.0.12       | 2.1.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.6.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.1       |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.4        | 0.4.5        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.6.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.5.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 37.0.2       | 37.0.3       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.27      | 3.0.0a10     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.54.2       | 0.55.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 5.1.0        | 5.1.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.3        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 4.0.4        | 4.1b1        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.1.0        | 2.2.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.3        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0b2     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.2        |     
            python-entrypoints |  DISTRO  | https://release-monitoring.org/project/12081 | 0.3          | 0.4          |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 4.0          | 4.1          |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.7.1        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 2.2.1        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.27       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
                  python-gnupg |  DISTRO  | https://release-monitoring.org/project/15157 | 0.4.8        | 0.4.9        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.4       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 4.0.0        |     
                 python-ifaddr |  DISTRO  | https://release-monitoring.org/project/19908 | 0.1.7        | 0.2.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.31.1       | 8.4.0        |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.2        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.5.0        |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 0.10.0       | 1.0.1        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.6.1        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.6.0       |     
                 python-kflash |  DISTRO  | https://release-monitoring.org/project/92817 | 1.1.5        | 1.1.6        |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.4.3        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 2.0.1        | 3.0.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.5        | 1.2.1        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.3.4        | 3.3.7        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.1        | 2.4.3        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.0.1        | 2.1.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.5.2        |     
        python-memory-profiler |  DISTRO  | https://release-monitoring.org/project/38508 | 0.58.0       | 0.60.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.3        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.13.0       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.3        | 1.0.4        |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.6.3        | 2.8.4        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.21.2       | 1.23.0       |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.1        | 3.2.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.6.7        | 3.7.6        |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.6.1        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.10.3       | 2.11.0       |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.9.0        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 9.1.1        | 9.2.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 22.1.2       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.1.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.30       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.20.1       | 21.2         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.8.0        | 5.9.1        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.3        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2022.1.1     |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/03767 | 1.2.6        | 1.2.7        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.9.0        | 2.9.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.21.0       |     
                python-pycares |  DISTRO  | https://release-monitoring.org/project/19900 | 4.1.2        | 4.2.1        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20220213.2   | 20220609.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.8.2        | 1.9.1        |     
                  python-pydyf |  DISTRO  | https://release-monitoring.org/project/179112 | 0.1.2        | 0.2.0        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.27         | 0.28         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.12.0       |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 2.0.2        | 2.0.3        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.9          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.20.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.20.1       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.12.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.7       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.13       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.7        | 1.2.8        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.3       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.2       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.2.5        | 7.1.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.15.1       | 0.18.3       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2021.3       | 2022.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.22.0       | 0.23.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 23.2.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.3.4        |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.2        | 1.3.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2022.6.2     |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2021.3.2     | 2022.3.7     |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.27.1       | 2.28.1       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.0        | 1.3.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.7.0        | 0.7.1        |     
                    python-rsa |  DISTRO  | https://release-monitoring.org/project/08808 | 4.7.2        | 4.8          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.5.0        | 0.6.0        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.2        |     
       python-semantic-version |  DISTRO  | https://release-monitoring.org/project/06514 | 2.8.5        | 2.10.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.4.3        | 1.6.0        |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.2.2        | 1.2.3        |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 7.0.3        | 7.0.4        |     
python-setuptools-scm-git-a... |  DISTRO  | https://release-monitoring.org/project/28329 | 1.1          | 1.4          |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 4.0.0        | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.6.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.2.post1  |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.39       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.1        | 1.3.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.2        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 5.0.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.16.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.2          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.64.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.3.0        |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.2.0       | 22.4.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 21.1.0       | 22.0.0       |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 4.2.0        | 4.3.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.2.0        | 5.4.0        |     
 python-unittest-xml-reporting |  DISTRO  | https://release-monitoring.org/project/72281 | 3.0.4        | 3.2.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.20.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.1.6        | 2.1.9        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 55.0         | 56.0b1       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.3.3        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.3         |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.14.1       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.1        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.3        |     
              python-xmltodict |  DISTRO  | https://release-monitoring.org/project/15109 | 0.12.0       | 0.13.0       |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.7.2        | 1.8.0        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.38.7       |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.10.4       | 3.10.5       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 10.6.3       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.37.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.1        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.1        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.1        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.1        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.8       | 6.3.1        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.2          | 1.3          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.10.5       |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2022-04-01   | 2022-06-01   |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 7.0.0        | 7.0.2        |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.4.2        | 1.4.3        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.3.1        |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.2.3        | 3.2.4        | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.0.1        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.1.2        | 1.1.3        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.60.0       | 1.62.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.60.0       | 1.62.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.41.1       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.21.0       | 2.22.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.1.2     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.4      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.8.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.6.0.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.1.1      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.5.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.3.2      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.7       | 4.16.2       |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/16338 | 1.5          | 2.0          |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.59.0       | 2.3.0        |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.18       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.4        | 4.3.6        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.10      | 0.30.12      |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.6         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.12.0.1     |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.2          | 7.3          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.5.0        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.9        | 3.4.10       |     
                         snort |  DISTRO  | https://release-monitoring.org/project/212335 | 2.9.19       | 2.9.20       |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.18.0     | 3.1.32.0     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.8       | 0.16.10      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/04879 | 4.5          | 4.5.1        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.3          | 5.6          | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/14903 | 0.6.8        | 0.6.10       |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.9       | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.6          | 6.7          |     
                    stm32flash |  DISTRO  | https://release-monitoring.org/project/227276 | 0.6          | 0.7          |     
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.4        | 1.0.5        |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.5        | 5.9.6        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.60         | 5.64         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.11p2     | 1.9.11p3     | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.2       | 0.29.3       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.44.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.1.42       | 2.1.64       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.6.0       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.16       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 250.4        | 251          |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.04         | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.20         | 1.21         |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.1.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.4.8        | 2.4.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.16.0       | ORPH
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 3.5.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20210601     | 20220311     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.3a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.1        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/18777 | 1.7.0        | 1.8.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.1.1        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2021e        | 2022a        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.04      |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.12         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.2.0.0      |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 2.2          |     
                      unixodbc |  DISTRO  | https://release-monitoring.org/project/07344 | 2.3.9        | 2.3.11       |     
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.5.19       |     
                           uuu |  DISTRO  | https://release-monitoring.org/project/259328 | 1.4.193      | 1.4.224      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.11.0_li... | 2.12.1_li... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.1       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.0.0008     | 9.0.0009     | ORPH
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.8          | 2.9          |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.68.0       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.2.33       | 3.2.37       |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.219      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.0.23       | 2.0.24       |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.20.0       | 1.21.0       |     
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 1.0.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.11       | 5.5.13       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 7.12         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20211208 | 1.0.20220627 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.06.06   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.10       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.12       | 3.7.1        | ORPH
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 2.3.1        | 2.4.0        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20220111     |     
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/13646 | 1.15         | 1.15.2       |     
                xdg-dbus-proxy |  DISTRO  | https://release-monitoring.org/project/58434 | 0.1.3        | 0.1.4        |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.4       | 4.16.1       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 5.18.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.34         | 2.36         |     
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.8          | 1.8.1        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.04         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.21         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 371          | 372          | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 12.0         |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.0.6        |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.1.4        | 2.1.5        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2021e        | 2022a        |     
                           zsh |  DISTRO  | https://release-monitoring.org/project/05307 | 5.8.1        | 5.9          |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                       busybox | CVE-2022-30065   | https://security-tracker.debian.org/tracker/CVE-2022-30065  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                    containerd | CVE-2022-31030   | https://security-tracker.debian.org/tracker/CVE-2022-31030  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-1475    | https://security-tracker.debian.org/tracker/CVE-2022-1475   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                      harfbuzz | CVE-2022-33068   | https://security-tracker.debian.org/tracker/CVE-2022-33068  
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2022-1114    | https://security-tracker.debian.org/tracker/CVE-2022-1114   
                   imagemagick | CVE-2022-32545   | https://security-tracker.debian.org/tracker/CVE-2022-32545  
                   imagemagick | CVE-2022-32546   | https://security-tracker.debian.org/tracker/CVE-2022-32546  
                   imagemagick | CVE-2022-32547   | https://security-tracker.debian.org/tracker/CVE-2022-32547  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
             jquery-validation | CVE-2021-43306   | https://security-tracker.debian.org/tracker/CVE-2021-43306  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                    libopenssl | CVE-2022-2068    | https://security-tracker.debian.org/tracker/CVE-2022-2068   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                        mender | CVE-2022-29555   | https://security-tracker.debian.org/tracker/CVE-2022-29555  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                    protobuf-c | CVE-2022-33070   | https://security-tracker.debian.org/tracker/CVE-2022-33070  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-bottle | CVE-2022-31799   | https://security-tracker.debian.org/tracker/CVE-2022-31799  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     tcpreplay | CVE-2022-25484   | https://security-tracker.debian.org/tracker/CVE-2022-25484  
                     tcpreplay | CVE-2022-27416   | https://security-tracker.debian.org/tracker/CVE-2022-27416  
                     tcpreplay | CVE-2022-27418   | https://security-tracker.debian.org/tracker/CVE-2022-27418  
                     tcpreplay | CVE-2022-27939   | https://security-tracker.debian.org/tracker/CVE-2022-27939  
                     tcpreplay | CVE-2022-27940   | https://security-tracker.debian.org/tracker/CVE-2022-27940  
                     tcpreplay | CVE-2022-27941   | https://security-tracker.debian.org/tracker/CVE-2022-27941  
                     tcpreplay | CVE-2022-27942   | https://security-tracker.debian.org/tracker/CVE-2022-27942  
                     tcpreplay | CVE-2022-28487   | https://security-tracker.debian.org/tracker/CVE-2022-28487  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                        apache | CVE-2022-26377   | https://security-tracker.debian.org/tracker/CVE-2022-26377  
                        apache | CVE-2022-28330   | https://security-tracker.debian.org/tracker/CVE-2022-28330  
                        apache | CVE-2022-28614   | https://security-tracker.debian.org/tracker/CVE-2022-28614  
                        apache | CVE-2022-28615   | https://security-tracker.debian.org/tracker/CVE-2022-28615  
                        apache | CVE-2022-29404   | https://security-tracker.debian.org/tracker/CVE-2022-29404  
                        apache | CVE-2022-30522   | https://security-tracker.debian.org/tracker/CVE-2022-30522  
                        apache | CVE-2022-30556   | https://security-tracker.debian.org/tracker/CVE-2022-30556  
                        apache | CVE-2022-31813   | https://security-tracker.debian.org/tracker/CVE-2022-31813  
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                       busybox | CVE-2022-30065   | https://security-tracker.debian.org/tracker/CVE-2022-30065  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                    containerd | CVE-2022-31030   | https://security-tracker.debian.org/tracker/CVE-2022-31030  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-1475    | https://security-tracker.debian.org/tracker/CVE-2022-1475   
                      freetype | CVE-2022-27404   | https://security-tracker.debian.org/tracker/CVE-2022-27404  
                      freetype | CVE-2022-27405   | https://security-tracker.debian.org/tracker/CVE-2022-27405  
                      freetype | CVE-2022-27406   | https://security-tracker.debian.org/tracker/CVE-2022-27406  
                   ghostscript | CVE-2022-2085    | https://security-tracker.debian.org/tracker/CVE-2022-2085   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2022-1114    | https://security-tracker.debian.org/tracker/CVE-2022-1114   
                   imagemagick | CVE-2022-32545   | https://security-tracker.debian.org/tracker/CVE-2022-32545  
                   imagemagick | CVE-2022-32546   | https://security-tracker.debian.org/tracker/CVE-2022-32546  
                   imagemagick | CVE-2022-32547   | https://security-tracker.debian.org/tracker/CVE-2022-32547  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
             jquery-validation | CVE-2021-43306   | https://security-tracker.debian.org/tracker/CVE-2021-43306  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                    libopenssl | CVE-2022-2068    | https://security-tracker.debian.org/tracker/CVE-2022-2068   
                      libpjsip | CVE-2022-31031   | https://security-tracker.debian.org/tracker/CVE-2022-31031  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                     logrotate | CVE-2022-1348    | https://security-tracker.debian.org/tracker/CVE-2022-1348   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                        mender | CVE-2022-29555   | https://security-tracker.debian.org/tracker/CVE-2022-29555  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-31625   | https://security-tracker.debian.org/tracker/CVE-2022-31625  
                           php | CVE-2022-31626   | https://security-tracker.debian.org/tracker/CVE-2022-31626  
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                    protobuf-c | CVE-2022-33070   | https://security-tracker.debian.org/tracker/CVE-2022-33070  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-bottle | CVE-2022-31799   | https://security-tracker.debian.org/tracker/CVE-2022-31799  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                  python-pyjwt | CVE-2022-29217   | https://security-tracker.debian.org/tracker/CVE-2022-29217  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
               python-werkzeug | CVE-2022-29361   | https://security-tracker.debian.org/tracker/CVE-2022-29361  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                      qdecoder | CVE-2022-32265   | https://security-tracker.debian.org/tracker/CVE-2022-32265  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3611    | https://security-tracker.debian.org/tracker/CVE-2021-3611   
                          qemu | CVE-2021-3750    | https://security-tracker.debian.org/tracker/CVE-2021-3750   
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2021-4206    | https://security-tracker.debian.org/tracker/CVE-2021-4206   
                          qemu | CVE-2021-4207    | https://security-tracker.debian.org/tracker/CVE-2021-4207   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                     sofia-sip | CVE-2022-31001   | https://security-tracker.debian.org/tracker/CVE-2022-31001  
                     sofia-sip | CVE-2022-31002   | https://security-tracker.debian.org/tracker/CVE-2022-31002  
                     sofia-sip | CVE-2022-31003   | https://security-tracker.debian.org/tracker/CVE-2022-31003  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                           vim | CVE-2022-2124    | https://security-tracker.debian.org/tracker/CVE-2022-2124   
                           vim | CVE-2022-2125    | https://security-tracker.debian.org/tracker/CVE-2022-2125   
                           vim | CVE-2022-2126    | https://security-tracker.debian.org/tracker/CVE-2022-2126   
                           vim | CVE-2022-2129    | https://security-tracker.debian.org/tracker/CVE-2022-2129   
                           vim | CVE-2022-2175    | https://security-tracker.debian.org/tracker/CVE-2022-2175   
                           vim | CVE-2022-2182    | https://security-tracker.debian.org/tracker/CVE-2022-2182   
                           vim | CVE-2022-2183    | https://security-tracker.debian.org/tracker/CVE-2022-2183   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                        apache | CVE-2022-26377   | https://security-tracker.debian.org/tracker/CVE-2022-26377  
                        apache | CVE-2022-28330   | https://security-tracker.debian.org/tracker/CVE-2022-28330  
                        apache | CVE-2022-28614   | https://security-tracker.debian.org/tracker/CVE-2022-28614  
                        apache | CVE-2022-28615   | https://security-tracker.debian.org/tracker/CVE-2022-28615  
                        apache | CVE-2022-29404   | https://security-tracker.debian.org/tracker/CVE-2022-29404  
                        apache | CVE-2022-30522   | https://security-tracker.debian.org/tracker/CVE-2022-30522  
                        apache | CVE-2022-30556   | https://security-tracker.debian.org/tracker/CVE-2022-30556  
                        apache | CVE-2022-31813   | https://security-tracker.debian.org/tracker/CVE-2022-31813  
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                       busybox | CVE-2022-30065   | https://security-tracker.debian.org/tracker/CVE-2022-30065  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                    containerd | CVE-2022-31030   | https://security-tracker.debian.org/tracker/CVE-2022-31030  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-1475    | https://security-tracker.debian.org/tracker/CVE-2022-1475   
                   ghostscript | CVE-2022-2085    | https://security-tracker.debian.org/tracker/CVE-2022-2085   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2022-1114    | https://security-tracker.debian.org/tracker/CVE-2022-1114   
                   imagemagick | CVE-2022-32545   | https://security-tracker.debian.org/tracker/CVE-2022-32545  
                   imagemagick | CVE-2022-32546   | https://security-tracker.debian.org/tracker/CVE-2022-32546  
                   imagemagick | CVE-2022-32547   | https://security-tracker.debian.org/tracker/CVE-2022-32547  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
             jquery-validation | CVE-2021-43306   | https://security-tracker.debian.org/tracker/CVE-2021-43306  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                    libopenssl | CVE-2022-2068    | https://security-tracker.debian.org/tracker/CVE-2022-2068   
                      libpjsip | CVE-2022-31031   | https://security-tracker.debian.org/tracker/CVE-2022-31031  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                     logrotate | CVE-2022-1348    | https://security-tracker.debian.org/tracker/CVE-2022-1348   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                        mender | CVE-2022-29555   | https://security-tracker.debian.org/tracker/CVE-2022-29555  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-31625   | https://security-tracker.debian.org/tracker/CVE-2022-31625  
                           php | CVE-2022-31626   | https://security-tracker.debian.org/tracker/CVE-2022-31626  
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                    protobuf-c | CVE-2022-33070   | https://security-tracker.debian.org/tracker/CVE-2022-33070  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
                 python-bottle | CVE-2022-31799   | https://security-tracker.debian.org/tracker/CVE-2022-31799  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2022-30595   | https://security-tracker.debian.org/tracker/CVE-2022-30595  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                  python-pyjwt | CVE-2022-29217   | https://security-tracker.debian.org/tracker/CVE-2022-29217  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                      qdecoder | CVE-2022-32265   | https://security-tracker.debian.org/tracker/CVE-2022-32265  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                     sofia-sip | CVE-2022-31001   | https://security-tracker.debian.org/tracker/CVE-2022-31001  
                     sofia-sip | CVE-2022-31002   | https://security-tracker.debian.org/tracker/CVE-2022-31002  
                     sofia-sip | CVE-2022-31003   | https://security-tracker.debian.org/tracker/CVE-2022-31003  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                           vim | CVE-2022-2124    | https://security-tracker.debian.org/tracker/CVE-2022-2124   
                           vim | CVE-2022-2125    | https://security-tracker.debian.org/tracker/CVE-2022-2125   
                           vim | CVE-2022-2126    | https://security-tracker.debian.org/tracker/CVE-2022-2126   
                           vim | CVE-2022-2129    | https://security-tracker.debian.org/tracker/CVE-2022-2129   
                           vim | CVE-2022-2175    | https://security-tracker.debian.org/tracker/CVE-2022-2175   
                           vim | CVE-2022-2182    | https://security-tracker.debian.org/tracker/CVE-2022-2182   
                           vim | CVE-2022-2183    | https://security-tracker.debian.org/tracker/CVE-2022-2183   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
