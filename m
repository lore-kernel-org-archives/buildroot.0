Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86896E75428
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 05:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E966641C0A;
	Tue,  3 Oct 2023 05:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E966641C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ekus6sbKim1m; Tue,  3 Oct 2023 05:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B3641C36;
	Tue,  3 Oct 2023 05:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B3641C36
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB3F1BF94D
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 05:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0179C81FEB
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 05:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0179C81FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sdyvr8NGMxQj for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 05:37:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B622781FDE
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 05:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B622781FDE
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0C0B1C0005
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 05:37:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 03 Oct 2023 05:37:03 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231003053710.0179C81FEB@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1696311423; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3P5W/1H4lXn6HTyoHInbYMx7vxMo+LQEJ6moutsfeWg=;
 b=ArGPlnEJn/07PUIRGL/aNg4XavwlhtP+eQSbhg7ZUTilmce//uS87pBR+M8xaR9BHwA8B1
 roa842MUwmGIs5uffX1svZFb8rPNLpSzVs+QJqoayjmTbsx5jtkMjTWjUIrP6MpIb53ZkZ
 2hDNWZLOP2eqr25Wkp69jcLa5+pmcI9+HN1X01sDbFOPqsGfJftCtp9AuRsGQR0VCKjcGL
 QkQVmSvdUroQn4Ec/e00TXELzJ5m+kYzp6dxpigTEpW4PMa2oNq8M6nULRLhUaH8KpQ/oH
 RdwuAo+kKtmtEEYAEF/0OhqZK6DBwRa2nv/RbGL5yzu0MiGGoWWTEtmHxrjX+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ArGPlnEJ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-02
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

Autobuild statistics for 2023-10-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 16  | 12  |  0  | 28  |
  2023.08.x  | 19  | 16  |  0  | 35  |
    master   | 74  | 121 |  2  | 197 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 11
                 openrc-0.43.3 | 10
               alsa-lib-1.2.10 | 8 
             alsa-utils-1.2.10 | 7 
         spirv-tools-1.3.261.1 | 6 
                   bird-2.0.12 | 4 
                elfutils-0.189 | 4 
  gobject-introspection-1.76.1 | 4 
                  conmon-2.1.8 | 3 
glibc-2.38-13-g92201f16cbcf... | 3 
                   linux-6.5.5 | 3 
                    bat-0.23.0 | 2 
                    brltty-6.5 | 2 
              gcc-final-12.3.0 | 2 
                 gnuplot-5.4.9 | 2 
         gobject-introspection | 2 
google-breakpad-c85eb4a59b6... | 2 
        host-sentry-cli-2.20.3 | 2 
              libarchive-3.7.2 | 2 
                   libnvme-1.5 | 2 
                  monit-5.33.0 | 2 
              open-iscsi-2.1.9 | 2 
                 powertop-2.15 | 2 
                 wolfssl-5.6.3 | 2 
                xenomai-3.0.10 | 2 
android-tools-4.2.2+git2013... | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                     dtc-1.6.1 | 1 
                  faad2-2.10.1 | 1 
                    fmt-10.1.1 | 1 
              gcc-final-11.4.0 | 1 
              gcc-final-13.2.0 | 1 
                host-go-1.21.1 | 1 
              host-rust-1.71.1 | 1 
igh-ethercat-f5dc109176400f... | 1 
           janus-gateway-1.1.2 | 1 
              leptonica-1.82.0 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
          linux-5.10.162-cip24 | 1 
               mariadb-10.11.4 | 1 
                  motion-4.5.1 | 1 
                    ncmpc-0.47 | 1 
        network-manager-1.42.0 | 1 
                     pound-4.8 | 1 
                     pv-1.6.20 | 1 
           python-bcrypt-4.0.1 | 1 
    python-cryptography-39.0.2 | 1 
                 reproc-14.2.4 | 1 
rwmem-c8291705c82bb0686be9a... | 1 
                     squid-6.2 | 1 
                      tar-1.35 | 1 
                    volk-3.0.0 | 1 
           xtables-addons-3.22 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/24a2ac2b3cad160b413928f496d7345af2ed4096 |     
  aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/d2a653f43a597e522a41a3365cb54ebca7301fbc |     
 aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a663abfc7c68674c65f22a53b7765c7e17073e8f |     
  powerpc    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/3a4bc61f3d271e217a8747a479018bc1059b7025 |     
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/bb53dd5e8931f88a14603191e96e1e954be13a9a |     
  aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/0f02daed122aa793f73780fd9cf13437efb9d24e |     
    sh4a     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/6b8c5e5b447299f52d9bece52b1ad5abe7307026 |     
 aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/41a0b1b4aa50edd9414441430afe2c6eb6116259 |     
    sh4a     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/3934e2b750bb1af0e6c35f7f7e7116825f157112 |     
   arceb     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/9d0ac33e926b144d1aa76164aa0317e70ce34afa |     
   arceb     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/a0fa5bd395c424acd62d9d9b18e073e80a994dab |     
   sh4aeb    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/6c5bee263b1524231019d1039aab01b3712992bf |     
 aarch64_be  |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/d099d2c9bd356ecf068e2e656249bd63a29b8c3c |     
microblazeel |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/53bdf92a16322068d88cfcc0c0001d97ccfb74cb |     
   mips64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/4d6acc8682bc68d5735036d26cd4774ab1f47e6b |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/afc154c1861824abd7e8248695ab81f4e2393c2f |     
   mipsel    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/8d24fd5747d270817d352b389cf597b5bf28d8d7 |     
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/595752d12541aabfca9d7c29731f890935e23b13 |     
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/014a5caa82412d144f417c61b5e3e19fa4eb93f1 |     
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/76b86eb7c4ede7206c877826f2e9a4ebc8ea6b77 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c7c1a6bb08c89a037a35f295fab31df7989d6fb3 |     
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7b497164095d86a1d4b8dbfb9237fbb8d6dbfc4f |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/8781bce65e549c3fb7d88b6b70596b0bff1e7594 |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2922513fe9e6d759a6a2607648bb892fd3d12163 |     
   sparc     |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/f814744bfd6bf9339334c3639d55d739ebc783b9 |     
    arm      |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/8639d09fac5aa9ebcb7d607aa6524642fd727c4d |     
    arm      |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/1417bbbd18d214dc1bda6705b685bdd605131cca |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2f6929f8f61972cbca9717a4eca07a2fd3a809a6 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/7b21b9e9e1a1c4c2e4b564ed006c2459de9ca6ae | ORPH
    arm      |           dtc-1.6.1            | NOK | http://autobuild.buildroot.net/results/6788d86c10d551b3d617e33c85083b817eb5d0b2 |     
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/32c0ee258d82113cd4a33b4fd58c75877746fb7c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9cace3042284b126c96820333a85af7583e396c5 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f6587e215928952795af838cf0ad2f5b7060ef8d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ddc071671c0117ed922b518921335df1d2431820 | ORPH
   sh4aeb    |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/357077d53aa0d2fc863e46e7cb1f9ecff8bb86ae |     
   mipsel    |           fmt-10.1.1           | NOK | http://autobuild.buildroot.net/results/4445452c641d224cb70a232445810e05d3612a0a |     
    m68k     |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/fc088b487e9cfabae20d7750a509810009ebbda2 |     
   armeb     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/0b9abe6829575e0d9d51fe7d289a85c0c68b8f79 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/a00d2afe37065c2cd796c0cfce7f56ebdffb8894 |     
   armeb     |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/c013b957538721513596737da45413a4514d8764 |     
   arceb     | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/1106e9351544e55315418f15adde76fe87b66cf3 |     
powerpc64le  | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/21fa82cf5dc88b750e0a5c39b1f2d15bdfb887ce |     
powerpc64le  | glibc-2.38-13-g92201f16cbcf... | NOK | http://autobuild.buildroot.net/results/5f34de9371494d3504e9a8c50dc35bbfe9fd092b |     
    arm      |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/6f5259cd0939f4fcd0ae8c5d9b6c92dcf791b264 |     
 powerpc64   |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/adce9fb06c68e468f46a671fe2014ce6a73845e9 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9482d9328685f25bef00ca2cdc96590cce0ec209 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9a4e8b7db4813486498eaadfcf0fa10b69391434 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9fcf78fd360dcfe5900b971f60785facaddcd8a3 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8d764c69b5431ba23ba786da4881fb03d2bdb474 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/79998f0c4378409a6cf83962d2442c497453b87c | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8f3fd45d133146ea6eaa1d46834bc2c4b4232109 | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/dc44675387265076e4c53524c884e2a912c6869d |     
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c8f35d097e86a0753e671826c2d59b308d59bd97 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/2cd2e76dd8a0c54aeccf0dda18befda0b776b1c2 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/5c0d0cc2618c592dc8b73224c7c00214c9a4eacc |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/83cdcaf659e0b50c0947744e99f5f654b8edab70 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/bf44979243dc977449a803169d223e5861beaba2 |     
    i686     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/aac17535b9c466dc0158fd7756ef26f692580d11 |     
    mips     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/a06206c52137a87257791d1755f12b19604ca15c |     
    sh4      |        leptonica-1.82.0        | NOK | http://autobuild.buildroot.net/results/85aa6420cebc2f774e14f6a9839ba6355d92265a |     
   sh4eb     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/055ca94ecd7675c3dcda6f46c87d8228dff614ff |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/128235efb4931a42e83b05858246ac08a3960fc9 |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/cca34f3246f238bbfefc7999bdf709c2b41c3d0a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0fa80027f8f5b8df92f06a2f9c1f9c793ed48941 |     
microblazeel |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/697e2de11b6e8f47ef18d7cef8b7ae479bc6e91f | ORPH
 aarch64_be  |          libnvme-1.5           | NOK | http://autobuild.buildroot.net/results/3cb05b4939eb7d1ce0460088c365402ffcd6b13b |     
  mips64el   |          libnvme-1.5           | NOK | http://autobuild.buildroot.net/results/b5359817ae62f3a1c1206c20747e81d9d4e3e54d |     
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/d1919685340a3d0c437a8ddd4ff68a1759fb6a87 | ORPH
    mips     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/19bfe32a104c1e77cc8ff605a49ebfd6475703c3 | ORPH
microblazeel |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/729623d8e26b9ee6424b979bb560df349c45ffcc | ORPH
    i686     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/547dc3b3eedadd19d2324fbbb41d922515a67006 | ORPH
   mipsel    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/a76fa1c981acb7c1dee591fd4440d4243424f6ef | ORPH
 microblaze  |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/2b989ba012c1eea1a81a3810acf0a38ad312c4e1 |     
  powerpc    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/5402f59476f6d4f6dbe2fbc21402b274d4800d57 |     
   nios2     |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/ff9e61b8d801cabcc599efb99f2cde762b3631ac |     
    or1k     |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/46947abf859b3735a4e8c77d5b67c10809a9971f |     
powerpc64le  |     network-manager-1.42.0     | NOK | http://autobuild.buildroot.net/results/361e4f3f3a6ed5e43704fb75b89474cd2ef8a8ef | ORPH
   x86_64    |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/582a8884e52df47536b7536e697c12c057bbc686 |     
 aarch64_be  |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/b3e79906db04cfd5b275fbc02834297c076e1899 |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/af787327358e9c180c3ab967f64426b8b1a10dd4 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7591af3b537301f69afb3d429fc45567b71455da |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/61e5f9b1eacf79efeac117100c785117ac41abc8 |     
   sh4eb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/cdf2448fe9c8c3a2b52d9083a9f7d74e1f8f1514 |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/0a337eec99c4a5d56d882011cab385545f39d65c |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/fab41ce1ed7b793fa753d024f7d608846aa61d65 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6beae5aa1f196acd695e404283b4260e016ea87b |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a9d148aa7939a91b98715ffe29c045ec06b16648 |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/3dbee9b3bf533e75564f0da4aeb8fdf4b9a89585 |     
 microblaze  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ec2f4628de5868bf671787fca13c2a6cf842c819 |     
powerpc64le  |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/973aa40406e8b800a27517ed60c5427d6b243d1b | ORPH
   nios2     |         powertop-2.15          | NOK | http://autobuild.buildroot.net/results/b4e057c4ef4309332be8c7d3532c6d7883efb6ba |     
powerpc64le  |         powertop-2.15          | NOK | http://autobuild.buildroot.net/results/cf39e3e3681e3ea4c43e6a0ca0c1d892b4f31d2b |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/0396bb9f55ae760e2dfb0b23504dd196c0df8a13 | ORPH
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/28d21448197758f01a719643706e84b66d0e27bc |     
   mipsel    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/3d799d7e009e1face77d95ef359746742039a0fa |     
  riscv64    |         reproc-14.2.4          | NOK | http://autobuild.buildroot.net/results/5ad039f03c958c5b0e007d3d9ae985c561ac77b9 |     
   s390x     | rwmem-c8291705c82bb0686be9a... | NOK | http://autobuild.buildroot.net/results/a3630a00145a1e9f463a030f02a1345235c77e13 | ORPH
  mips64el   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/dc5c9e7be63f43e4584f8fce47fb23bc8c24e3c9 | ORPH
   nios2     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/5178a7a56ceda955dad045622ea841504a9aa900 | ORPH
   armeb     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/cbd381b0d2a7c2d56a51725437cdaa1b7ba7d7a2 | ORPH
   arceb     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/aff5b968342bf05f036c8e1e557c404060345d30 | ORPH
microblazeel |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/ac5dff3e9ff4acd542fb753731a76eadfb18f767 | ORPH
    i686     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/6ae10c106e96a206a462c6f228f1aa51edbce137 | ORPH
   nios2     |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/5d658cc58fda2768611cf9abb3faff8b83aaf75a | ORPH
  mips64el   |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/6826441ee994efd75a16c3b51d691ba64d951c06 | ORPH
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f5df3ae8d83c55b536e37f3482c3113aea2c0c6f |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/df7263c1eb47bcd3199d819e85dc784c100983a4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6814a808d969aa00962b6206fd0012d2e25c6d06 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ae058ba92129e453c3e5d8f7c02c1b0a6858e96b |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/264bf9ec060e9a3d4c4d8b9a849a696f30869b64 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/5d6e0da13f1c8084b180baab3958c914b2d614b7 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c989fc58eab51ae455bb46e874d58d9c086c7a0e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/475ad58563d1f0f0bcd4c26464c11e80999893bb |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/eea900741febdb3a0a3c674642727855e64c1069 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ee535286fd925c57816fc9f96e6bb40d6fed32cf |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/11fa2f74a5a9dcfebf9ed3df4318324af84961d8 |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/ace89dc6e3bcf3833dd2c70851d1f1b66b7f6636 |     
microblazeel |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/6393fb13b7a5625ac93d1690bca0d86523b7b377 |     
  powerpc    |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/6de913935cff60992456b53baf13a4af3ff07118 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/59ea3849163f3c415cfb7d85099f6494c8f93fd1 |     
    sh4a     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/218227e5c427d81ca9aaa5d8b32b50e7b25d249d |     
    arm      |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/df68ea0fab258e4f3a8c5bdaa3dfd5f8613ffcdd | ORPH
    arm      |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/13b104287040cca4ec56f410cf90103f95e500ab |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 2 
                elfutils-0.186 | 1 
             fontconfig-2.13.1 | 1 
  gobject-introspection-1.72.0 | 1 
              host-rust-1.67.1 | 1 
libdill-32d0e8b733416208e04... | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.1.55 | 1 
                rocksdb-6.20.3 | 1 
               valgrind-3.19.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/516f2998641c061f87ec92b844b80e2a2b8b5e84 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9ec29983a0ff5aaa62fa710f77bb655c3f90fe98 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a6afa3f1c330a4b1916d24420c357d9183535ade | ORPH
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/d94f4b08c35a33e8f9b09613fe6743882d294b9a |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/4596e254f538e04249e250635f2563572a7391d7 |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/6f66235afb766c8211dc707ad385344d457bd6b1 | ORPH
   mips64    |          linux-6.1.55          | NOK | http://autobuild.buildroot.net/results/41b47a65ec7ddc12ac4dc2b2f8e8dcee20c6a895 | ORPH
 powerpc64   |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/7a3353fd478f3b9eac8c495833530be96fe638fc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4ebd1c9c114e1f300997571ecb481f557d82dbf3 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/e13c34a9535e3649adc705c1101fecbf09b73d77 |     
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/4b7c407ee9f686d1082e55f9631455033907ddb4 | ORPH
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0e07a4dc7a1a59d000229c2b72ce185c2a8c1db4 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

         host-sentry-cli-2.8.0 | 2 
                       unknown | 2 
             batman-adv-2022.3 | 1 
                  conmon-2.1.8 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.20.8 | 1 
                  linux-6.4.16 | 1 
        ltp-testsuite-20230127 | 1 
                   perl-5.36.1 | 1 
                    php-8.2.11 | 1 
    python-cryptography-39.0.2 | 1 
       python-stack-data-0.6.2 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/c753ab70abe4289df975bba11f0fea5abf8a87d4 |     
  aarch64    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/717a696904546759d5a4c368d5442a1fac73621c |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b0d6b24d1fcd09e9b5461a67f94d6df6f24b6624 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a68a9bbfb23158eda5ba7419d819a43e38fdc342 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/48b594637ffb613b8a3c3a75531ecb1fcc60f92d | ORPH
   mips64    |         host-go-1.20.8         | NOK | http://autobuild.buildroot.net/results/6d95870c1d02fc5bba466535bfcf85fa94eec0a9 |     
   xtensa    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/265f324e3ab9254d47aca5be4a3a3a1f3ce6c56b |     
  mips64el   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b5da017faf209d5b726c380d917b766ee2eb470e |     
    mips     |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/8dc4546ec2f79bd6bd37457adc17279d7f88a5e3 | ORPH
    or1k     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/c406df59d8c6225d77ce7a80d48d8e0386683f43 |     
    arm      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/b9268857d905084eda9bd17e5efd0c69eb07e075 |     
    or1k     |           php-8.2.11           | NOK | http://autobuild.buildroot.net/results/40232d115edffad1da8b781f72004851fa5027ad |     
    mips     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/556476521a89858f91892e65a7ce859efd4c6e01 |     
    arm      |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/f3aecce82feee2f5aa28e81439e433584ee57a8b |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/6d928640ed5583f491c4a75bea51bcee0f90d2d0 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1cc9b4fa681d067e105540cd0ee0efe9e71cae8c |     


Gitlab CI results for 2023-10-02
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302375  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302396  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302413  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302397  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302416  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302575  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302661  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302665  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302843  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302728  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302760  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302774  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302816  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302828  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302832  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302848  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302857  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302860  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302864  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302870  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302877  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302891  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302928  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302966  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302971  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5201302977  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
