Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC88C3271E
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 05:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02AA36061E;
	Thu, 11 Jul 2024 05:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg0KLfok2314; Thu, 11 Jul 2024 05:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D38B6061F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D38B6061F;
	Thu, 11 Jul 2024 05:23:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 149421BF863
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 05:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB49540493
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 05:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y64XpH5tueB5 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 05:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9F60402A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F60402A0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9F60402A0
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 05:23:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF4714000B
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 05:23:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 05:23:35 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720675415; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8ylSFj8NgVpldYNMdXkAdq8VqeZyiOQSC+LWDOwP/EQ=;
 b=Y/abaodQSS1qa79UBHP68C5yvGZP6Sa+lMqD7V2Ve0WxaMrfBaUm8gFD5zahNgvF770uDT
 NL/jAK0AD6RxAv1I5tDQn83gAQB1mxpk/bVG08OdDjtddd8Fa3nnYFIWBXDKWI14XWrWMh
 R85yknA3dZL4eHjxmUyYPigifu8UP0NFVDmriFgLnOcTJ0D9M9lioa19yJWoh1ZwOrysip
 PddRp8YVvQtRoS45EE+h9lLvF6emqAD7DrPqh8gK8MEoFrvWs8v+N3RbtLYWmIAxiwihEn
 XF0SWikzLhiMNJ1yz9XUCeNQva01QGAP7PSxbNiLN0DWlu0DwXEIHjyn1mMKUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y/abaodQ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-10
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
Message-ID: <20240711052335.0loQv96o50NWDgwqcJPfGqDJGg_Qm1Gzl-L70y_HKS8@z>

Hello,

Autobuild statistics for 2024-07-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  7  |  0  | 10  |
  2024.05.x  |  3  |  5  |  0  |  8  |
    master   | 61  | 281 |  0  | 342 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 37
            host-cdrkit-1.1.11 | 33
host-prelink-cross-a853a5d7... | 25
                libressl-3.8.4 | 14
               cracklib-2.9.11 | 10
                host-odb-2.4.0 | 8 
                    mpir-3.0.0 | 8 
libsvgtiny-ea9d99fc8b231c22... | 7 
aer-inject-9bd5e2c7886fca72... | 6 
                 dc3dd-7.2.641 | 6 
                   host-go-src | 6 
                   httping-2.5 | 6 
                       unknown | 5 
                  bcusdk-0.0.5 | 4 
check-11970a7e112dfe243a2e6... | 4 
                  ffmpeg-6.1.1 | 4 
              host-rust-1.79.0 | 4 
ibm-sw-tpm2-5452af422edeff7... | 4 
                elfutils-0.189 | 3 
                  jack2-1.9.22 | 3 
              libarchive-3.7.4 | 3 
                  libffi-3.4.6 | 3 
                  boinc-7.20.2 | 2 
                fail2ban-1.0.2 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
                gnu-efi-3.0.18 | 2 
host-android-tools-4.2.2+gi... | 2 
host-heimdal-f4faaeaba371ff... | 2 
         host-libxcrypt-4.4.36 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
               libglib2-2.76.1 | 2 
             rabbitmq-c-0.13.0 | 2 
              udpcast-20230924 | 2 
android-tools-4.2.2+git2013... | 1 
                apr-util-1.6.3 | 1 
                  assimp-5.3.1 | 1 
                    attr-2.5.2 | 1 
                     avahi-0.8 | 1 
                  cairo-1.17.4 | 1 
             can-utils-2023.03 | 1 
           crucible-2023.11.02 | 1 
                   cvs-1.12.13 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
edid-decode-6f117a8f8c0e76e... | 1 
                   evemu-2.7.0 | 1 
                   foot-1.16.2 | 1 
                gerbera-1.12.1 | 1 
                 gnuplot-6.0.0 | 1 
             gnuradio-3.10.7.0 | 1 
  gobject-introspection-1.76.1 | 1 
         host-gcc-final-13.3.0 | 1 
         host-gcc-final-14.1.0 | 1 
 host-softether-4.30-9700-beta | 1 
                    htop-3.3.0 | 1 
igh-ethercat-f5dc109176400f... | 1 
               ipmitool-1_8_19 | 1 
                iproute2-6.9.0 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  ledmon-1.0.0 | 1 
                libcuefile-475 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
                libxml2-2.12.6 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.9.8 | 1 
       linux-firmware-20240410 | 1 
make: *** Waiting for unfin... | 1 
               mariadb-10.11.6 | 1 
                  mender-3.4.0 | 1 
                  nginx-1.24.0 | 1 
                  ntpsec-1.2.3 | 1 
                 openssh-9.8p1 | 1 
                 opusfile-0.12 | 1 
               pcsc-lite-2.1.0 | 1 
         python-remi-2022.7.27 | 1 
python-unittest-xml-reporti... | 1 
           python-zlmdb-22.6.1 | 1 
                python3-3.12.4 | 1 
rtl8188eu-306f3e62cf7cddf8c... | 1 
             strongswan-5.9.13 | 1 
                 uclibc-1.0.49 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                ustreamer-6.11 | 1 
             util-linux-2.39.3 | 1 
                      xz-5.6.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/5b5ce28ed331f42446930c4b134820fb815fa834 | ORPH
powerpc64le  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c32ed3de876b2eb29c29fdcc55bd9152a1624317 | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d380dff5cf80189acc17e670bfccfbbafa01648c | ORPH
    or1k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/85297e0556f4af0e7c6d0c84f1a76d226a564fbf | ORPH
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/89aed6391d512faa0d907490e0f039c0a1f515eb | ORPH
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/cc3d46acafa3a6209ef644011c8d3cb702ebc51f | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1b3db4d3487f3f9100c98f308b7f4afe7be8d8b3 |     
   arceb     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/d81911326c43abdde9114d4803957fcb4218d0ad |     
    mips     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/4db27f20ea8e799f87510d7ee97862c2869067e6 | ORPH
    m68k     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/9fc40e5fdd6ceccf5089682f90325bd12d6bbf0e |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/356756a8f23b88fcdf5f63a2c9ff2dcf2a05a65d | ORPH
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/59a1ac4712e834749ab7ae11a81e1996be113393 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/73d0c94a97076e891a5c5dac6e4b79d98cedb9b0 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1ea62334c2de7c79a3b14591e9eea70e1b95cfe6 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/aa528430a707e4bf5b81c4c1fae38af75fd762cb |     
    m68k     |          boinc-7.20.2          | NOK | http://autobuild.buildroot.net/results/db3ca50427e23c3fbffef2d71e6f0b351a5898ca |     
    or1k     |          boinc-7.20.2          | NOK | http://autobuild.buildroot.net/results/318fc8cec06708d0e777cdeb3b4e362c43d1600b |     
   mips64    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/bd1327c834c4da134b71bdd8f70736eb1827023c |     
   arceb     |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/b660e05a492835d70e01bd965e4a7502e1da1b12 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c35827f0742eaf89695b71bd4c32133384f66ec9 | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a1e93bc4c88e91f839e55b4a6b9a3e1c0e82849c | ORPH
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/61ec57a05f4681375e1e93f63b6ca0a189d166a4 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/360d594f2d6327e75703c81e0145ced04e6c2cd2 | ORPH
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/062e5deac5279073cd16bfbff3b884e48d30ea32 |     
    or1k     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/f7e08038bad5c0d06289da6b7ae5322b98976184 |     
    arc      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c29080badab44dedb8f7e04fac69629b2de3a6f6 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c0e0e32bf37133d5b5a7e81aa1664a436784f522 |     
powerpc64le  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0bfa37b16137f032e3474442ba39173cf0ff4768 |     
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/9dfa6f4dde1b8ae252be21b1a6c2e068ca3765b7 |     
  powerpc    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/a248bd79b5fd131d73f8557692fdc0da8a38957a |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/32a365df039c1b1f6bdf858277a82f3fea960d99 |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/f6bdd0d327c20a18d60821da4a4a5abbed20f150 |     
microblazeel |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/d2e5035eea30cd91a932f82a4a7832573c28ba3c |     
  mips64el   |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/771600c539e28301f408067b95e92b6af4c03598 |     
  mips64el   |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/9e6272568d93c0573775b979aefa33df704ac821 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b219065bddf5f9a724a5c70a8ffd221e598d521c | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2bf55c68a6fb4a5785bbc1539a209cd90c9bf277 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4d5d4d99f91f5d4b56108ecdea81ac3f00d95442 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e85957ff9bd968bffaa5eb6c2181ad6bacc94c8d | ORPH
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7660e7b9d34145479a96f1bd69510faccb3f85fd | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bfd923c4215401e205926c6ad67b60ddf6faa382 | ORPH
   nios2     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/399617a03eb1eebedc6c9ccafa761e60909857f7 |     
  aarch64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/3866cd6f1eb47ec963b9e65df55276b8215876de | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9fcab3e6899a34d7ad9a5ebac021eae5f5baf6e3 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f673249b79e2b5e5b754ff7d4c6afcebfab71b52 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1de0b9c51ac190291878e8d1701088dff4931f35 | ORPH
   mipsel    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/8d9eb5c3615631a78e39a139fada9dfc0acb9519 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/74ce2c3335508ac8ed6f08bdb0a3990a8eba4177 |     
   sh4eb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8cba01c4cead71ebec8ee06ac81c9a68f25e5171 |     
  sparc64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/0192f7d28b3ea2b39d13d730b3564b524b781449 |     
   mips64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9d94afe01f1d870780be842bd9eaaa65572cd7e9 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ac96193d910ea1dc6d180b422920647b961da251 |     
  sparc64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/78cb1f3e75a702e1f3d6b3822964ca7593dc2ace |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/40abe7dcf8d4d745203c2ec1be70fd44bb727899 |     
 aarch64_be  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/1d6e0af7d78c74707e3eefcb0ae3cd68d3efd232 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/21cea0254a7fcba0410cfcc4945050834ac01f24 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/24c65776ecb90629e05ceb182b7a3688673a928a |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/acd7f544ce65c17829b2a917996b875d1b12141e |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/20aab5900a72d85684ec31609f07e8e743f0d089 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/982ec6ecaf2f5587727eacbec92f64ce89b860b2 |     
    i686     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/17d7ec3b5b788a5a0e45e9cf43dc86ac8a682bb1 |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8a989532cd46a8679f1ccd50601293379e9eafc6 | ORPH
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/fe64e3a2816be65312efe0fe8f6b536afb36bdf6 |     
   mips64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7a53def0692ea0bd946430afecb46af94e0f09e5 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d8d85d271e5f54c7e95603c07fc6955a0b30e219 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aee085f41c031acceed6b5171cc8f47cbbf5093c |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/267dc4b0a7fe97d9b173b43cb836fb76c8da2fe3 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/55d398fe35ecbf693826e708363c6decfc4ca51f |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4c10bcd43cbee973c7551c542406d9d6dc79d5ec |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4d1126aed0b7b4e6088a37e5f1394b61b5c6f37a |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/51750bd3f4fe54d690e590228877c005246ccb2e |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7eaf5dde857a7b09b119a11550dac92b2d9db08c |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1f9523197e97f0f2dedc1e5879a85875fe905e51 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f438bb2fb74fd0ec28f7829879f3aceb2caa64c2 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/28b95f5b75487066b4170d051c8a3c5709bdfd6b |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/301d9b8f46b6277becbfc7ed42b0939d0517698b |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/495b22c240bb9156db5b295ce7e2bda016d82916 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e537711a4d6a2cf699ee871045babba0b510cb27 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6f5924df1ccc8f1cffdd950248ef197ec7d5cde0 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c9c6de8050f698f01e84e15049d5b86f5f2502fa |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ebdc0f344abe2eaa481ad49cc1847e16658034a9 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b271c543bc1151170787c1d0703bdbb48a9f1fbe |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ac98a845c4b4258d7b07cb34597c495dccc20ee9 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8d2e5383489f15136bb2810db4d918ec358f57fd |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/66ec7b543aaf4dacd814781f7d70ce35245701e6 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/68911b3ac9862dc05ebc48c5bc52a4bcf5741efc |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1145558b097618245ec06507afb59ba469094c1d |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c5859d2e1d1c9cb850c72558f684ab2cbf94cf72 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/735c4248cbb185b76b4a8c380e71c94a67bac41a |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ec0ecf0a822d8439f56d27bff73d92a32b15433d |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/de717144fa1440268940a52c314ec8240a87b89f |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fdd1dc1492c539fb2c1a690fd6d0e898cd253f0e |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a96fe2bcf3b15cfc5726bb95d481695c8d3ff037 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4c64ea883eaa36f9c7373797de6d4d103ae91fc8 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6efafb076e5f63b89a3ff913f814e2977fbc3897 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/664c2da317df7c0a2752457bfcf193569e7917f6 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c98f9bf1a81f4cadb79e92825b3815414faf1972 |     
   armeb     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/e53c630c4f3091311321244ab7130ccbd3387fa9 |     
   armeb     |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/d9ce1540166a5fd9d6da38d23e65c7d78b0dada3 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/3ef79497f893921a44299ff7dfd20d31eebfb792 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/998a321d519845c6265c2572e9e5fcad88d10704 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/0172e5f58e3886236571874856c75b1eddd6ce31 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/bd07a5ae1bd78cf05ca3aadd9b32809bdad6c364 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/0744ff65a5ad4caa8bf86fab981339be326ef6bf |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/0139eb23d947c27da09f7d38b30fa241525c57dc |     
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b4c12bc05381c0415b78ff42eb5535351989843c | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/356f0fb0024d276cc35ccd2801e5edd5d28dec3b | ORPH
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b419eb56349746812d60ea35be74f637b158994b |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/21ef3a8dca8219dcad11e19779f2d802cf5ba528 |     
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/92a6ddf292930d99aa291cbdcaf6140dd8f09b9a | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3ae9dc67e89f96188b8b0ef887ee03136146579a | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/99014da97e9f1d18bd412358dd1398ffdb8ee925 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8172f7a1188046561b7d8a0b0456ac276ed8404b | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9a1dea1c78cd79038b76c7e9522346f2e4a7ab08 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f62ec9511540a7bf3a6d91ed6566f4938f7397cf | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4182a0ba7c09d2a790e75ee45df71c4247b93872 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/30ab0c2fbd7ebdaf3d1335abaccdb42dd3627f18 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fe44196f1249d3d5bc13060eb437c67efe386d36 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/495076793be920629b64d97edd5b5323c422d663 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/73e9bae53de0e427b816aa84cfcce3f1316444a5 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b651313f2e2834bbf3c866efe4c3c245afd4a0d2 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2a67b5562f60c9d7a7538b01fa6fc7754395e4ec | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d91fb2df012494114b7388270c816adbba8fa3e0 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/df2cec22ba696547bc5b24e176e8301f0c016283 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d7b9032ad6b4644dc5946e1d2ece28a094deffbe | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/24a2beded46d415ec1c25e19f73c0220cd54a35e | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/668c52141935f8ca6619ac050ee5bd9d44f109cc | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bdab5fa657df8b2675a054c349d63081abbcaf08 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9290c19c6dc40307cadd28e3d98c8489efbc248a | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/58641cc4bcfa8e83c4e62b44ed5098f0c88404df | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1d1bdd2cb0df182465bc36ec18204cdafdeb8a5c | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ebdd0dfd05cfb10778fa8fe1183c082be34b49fd | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0b68a3508499af73dae3c16bad0d26faae331238 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/045575b8a4c8737f5d4cee310c7931dd408b808f | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/37077cac5fcbf24a06cf845652948372b18fdc9d | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7630caabc40540680b16eec81a15390701b95dea | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e37260ca14602cb75af1171194be2c9e10061821 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/197ecab7b3f94668551343069369330647457aab | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8230912cc870ce7cf6c93c3b9424705710464eae | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0aa3567979ad70b2d6f1576f9fb9c8d1890fabef | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d4646bb039c42044863484352b0ebd8782af38f2 | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9edef5022698dc8c4c0d9fa9e7c1a2b84227e6a4 | ORPH
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/f9f2c01aaed874f641397f881fe93967710455af |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/fc139aaca7bc49717346a462f2895f328faa2dca |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/d2ae6bf1863c9cc0c3bc741ad2785f3df688f4d5 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/7ad857f89823223bd9ec011eb7909e24183bd54b |     
    arm      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/75aa58a873f21a0e9de9923ecf74dd94a12273a9 | ORPH
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a52eb55675cdb11e20ad451c557061da408abdb3 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/664ed67b6cfa4f3218dcc1bd5d08adf63376adde |     
   sparc     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/f257c5d1362009e08f6a2acb738eb849c6eca378 | ORPH
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/98a5dc23619d2c3d43db44fe3bad71150c836104 |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/16139982f2d87ec1165f2cec939dc3936981cc19 |     
   s390x     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/611af9c645850b9049d5e206dd25594f22e216c4 |     
    mips     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/20b375fdaa3249863fbe1ff04db97e343dfaff93 |     
   mipsel    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/df77c93cf6a9b9eaedc7ad2b54a35e0c2cb81892 |     
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/aa039a8e9524cc0d5d87f5f0255af8fdd611f506 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/91b74b4d5255e2e8fd9befe642d2b1f536179445 |     
    sh4      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/21dd6463b3fddf9e74fb5cd240c2bbbee75c9a59 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/174cd7e13213095051e7b9c50c47ca582133106c |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/65e8d078e29fa65a886e663d20ba7dc5cc68d611 |     
   s390x     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/7514dfea0b90f2b02d77b3857cbdd33890d3e55b |     
    arc      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b110e110d88eae2604af5a13ce413ec6e259a1ff |     
   armeb     |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/e858225a15e332cf5b8c972f494fb5d72242d650 |     
   mipsel    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/f0308119f0e0149ca08331f7bb70b7f06e85faee |     
    arc      |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/e5067bfec69043e2ef6241782458faa2e230951b |     
   x86_64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/0e6cfbe8fb0b07fa0a7c1d0bf55b123b0338a5ea |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.net/results/c04f300167504ecda0d22d57a5e18eac099dbc5d |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/ea8a7cbdb08ea74199b5a9844097309c82d1c420 | ORPH
 microblaze  |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/9f810d4b2a23fa3de5c386e6159179c0de7c4e66 |     
  aarch64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/790c4d8a5687a4f4deee0609a9a3a8551e6f3bd6 |     
microblazeel |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/f7f7085867265b299c4ec8ebeb725a5f6f627ab4 |     
microblazeel |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/9c9f164c2b166a56db618ccd6160d3baca27a848 |     
    arm      |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/1a290da2ccfa5e19bb30ae36bf9a66d7485d795c | ORPH
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/8a6ba0e10f1ae0cee8d1b5c426e5093ccc023fee |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3a35df63047ed1b1b1d2b011bb890ed3793b64e4 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/aa87399fb50db098eee5f4bd87f42ede6757e395 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e34c9b6c8ea31ee8917f8855748ec3d3d29e7bfa |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7df985f83dff76e64b2b10ce608a39d6fe3496eb |     
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/99603385a265b7e556ac514d46175dda932b505a | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4de61ec8efa8bb961ba62e519811f39298532564 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d241ce80f25933fbb8a843d2dbc56648c62a9795 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/07aabde9dc31bcaeab718d663291a4d04c493a88 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2902ff1de004e7a2bca81d3bc8561b2d607b189f | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b53c1f5642615169ac4de231726e186d7aadf6e3 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b0185d6748192516e72642e38a24a298648d5b6e | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d88f4a96b885f6c9fcc529924762875f5aa530c2 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fb2a72a5944c657fa135475b310218551ca7456c | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eb7171ab4b10315b6fc7abc595a7eded0aa474b9 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bc0acf4287299cd132edcbe613b4979cda3db1a0 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/558920e36642a2192890baa2e2dac8182d6c689a | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/71cee2d311266b4d53d631e81b713d6ecb2aa44f | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/44b0bd48ea92ef9796696d00b02bb718fd16b9d9 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d57d6661787a7e9b6157fecc2d1ee386736b958d | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/85ff1ca8697dfb455f27ccc7bed5d56d178d88b0 |     
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/a1983c35c161811b58668dfce8ce53e8cdef00c2 | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/a3ff838b0232fcf135f07af68747bdad7b232421 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9a647186885cde351be8f5121118fa8514ffcba8 | ORPH
 aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/2caad2f0356fa69187da84a6b60a0f6787774de5 | ORPH
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/6d0bf3e5a9f3cac16664ba815df657fa2a2aeb0f | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/4d03c53a84ad304a319df5cd21ecb98fde85ff74 | ORPH
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/34cba552b312c89782cfb45301d06d2b1dcfe6d1 | ORPH
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/f1d9c2e01e6db4f2e5792927aae41d9aad3bcbc5 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/f9149e474d4ec7e4b974e3baefb43eea4f3ec095 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/6bd5436e696490d8d66648915e7dea228758bfa6 | ORPH
    sh4      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2cf029651962b1b6f717eb3ea6882ec645696fd0 | ORPH
   arceb     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/cc9e19e90c4768205b4992ccd73281adb8508a55 | ORPH
   xtensa    |    linux-firmware-20240410     | NOK | http://autobuild.buildroot.net/results/b940ba0add2ae74cd723bb90fb1195f03d290469 |     
    i586     | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/518382fd88948a7b1eebc9e8db522ba64b0cd00d |     
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/1d2ecef41426041ece3fb15f867de37d14e9d729 | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/26a8fe56ecf4097244ddaeef2bb5a391df3bdfdb |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/119dd0f5f9856ab7efee396a3e57b51e92ec6c88 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e217604ce20721fe56a6770b85f78ed26cabeca5 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0aef7b3a65277f48469cbbc00bc96bd1626c19e0 |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d000dc831c2a5a38d5badb8bed0179474476d1ab |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1fbfd043f82a1fa10cb4ba3c9980071b90b7634a |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/30ce2193bceac97ff141a893767fc9de1e5ea601 |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/465cc4fe4bc9c404461331c3087461176861fb76 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/97213e15ce1b9e18c7e67c86626fe89ec42e2d00 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/0058e969ea56582a17e57a95b7ce05c5032a1852 |     
    i686     |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/9bc3f1130e8c5b612d5eb0287978b314129b4758 | ORPH
 powerpc64   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/a6a4b17c90a05d1bea8a4ce92c9ae62d7a4bb0be | ORPH
microblazeel |         opusfile-0.12          | NOK | http://autobuild.buildroot.net/results/2d6b36516879cb33714da3207c372859f0e9afc0 |     
 microblaze  |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/40f4a776c832c445cfa3fb34ad3d4caca6a6aad4 | ORPH
    i686     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/22c15dfd84cd29aa9247a944accf0ebe9ddce03f |     
 aarch64_be  | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/c54c3b5692440573a7139d0ea39f0a75ae836456 |     
    arm      |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/7b66c764d3b42a159c64fac9e036e2f6c4ebef50 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/304b110c9f4e74dd1d33cd1da7d3efa61978ebe6 |     
    mips     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/0e4a053d3cfd83dee58d528bfb387302db75eba3 |     
   x86_64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/8bb09da4b5a39eb6537e6572a6afec85a60513a2 |     
   sparc     | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/a310699f67a3677129c67c06290b43d0c0d1d725 |     
   mips64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/c31907c08d00c01dc696edd0046ffe00b5879a8c |     
  riscv32    |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/728021d8f85de8aa3886fb1906e8ccf267603c0e |     
   mipsel    | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/5aee3b56c070df6adf1ef8d0d85e29c837f2eac6 |     
  mips64el   |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/34a0bda60415cb0c03fe1186b27b4909685e6df9 | ORPH
    mips     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/67c8bfeed9669e7998fc1110af4510f225dd922e | ORPH
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f75af0486592026ba17ac233d111a7a1b9bf9c7f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/2ed91a113d7485a9c1fa62a2c06b5b0c4a3e1493 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/265e52fab278438d3c8ad4af5ac4200f858b6e5d |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/721f9c640eba737239f03c32abe9b93e967b5d7c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5cd79c17624589c7a51ae67ee67d0d9b0d3f2989 |     
   armeb     |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/fead03cfaceb550a36d1ee0599d3f674c8d6b554 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/242bc9e05f72423e65a4626277f1f5381ab8542e | ORPH
    mips     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/417bc95472e1f140e2d0c2e03284e67b3ed6118b | ORPH
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/78c7cbcb250cac38df25c107a8bf04d4aeafe07a |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cdced21d614f08abbb3daee14353d462e8e85f96 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2e3d81c5167ac4edd3161dd8084f614c73bc5b33 |     
   sh4aeb    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/576f8650d6a87697861aab87178a71faa1dad743 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f34af8c8cc54cf446b6180c7e5383f096ac7fe9f |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bb22dfb396178e5efeef2932ee2e4efb8222270d |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9914902d9b06734e8da7d125484da0689916914d |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8f3f1458c9791c3fb5837f3eb1d9e8f8b1eb0cac |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5e9a1e807d06a77605fc3c0498512885ad234146 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/20e2073ea424a028ea9abc21b675ed36274c807b |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/acd2a53aec0bcc8ab6953d6f7aa715cb042ffe2e |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/176e1aa07f180e15a744f4eded34376d54fdc913 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f588898920b9f38ad6af9d1ac1a71a484648184d |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4f850a183a17b6a1e2f6b245a27e2ae0151f3d2d |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/593ecac87303f386a81a7be5f1e4c863c45282af |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/aa4b446e620e80ad48ad5559460c2ff108403293 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3fc65c87777b4e7c096f237ab0112afad32a131f |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cde83165d1fbe1ad7832d0ccad667fba2d867693 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/235de4c76c4aa1cad0ffad4747124110f1331312 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/192e1b75caf447a7d953c5c072f77667c5a1a243 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/67a1f4faf4ba8d84876c0983476b9a6763898206 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3fab8aa34432aa47023be493ed7dbfe77a8f4185 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ed53340a2cc9bfd7fd1eed4269b779b0cc3ad102 |     
   xtensa    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/be72db7a1ca712c06174cc0f759fa0762fa8560b |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2756c2b7f24890fae4cedcd4489e5b15635c7962 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f3fdf2eaa3cab45a9353e858b2f838cd100b349c |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8cabafaeed9e11bf6c39a3eb4d627dba62f6322d |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1dc934c60981f48393e2ce830b29d1db374ba92a |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/97ef882dd56f5788a3b6f772ddfd396492a95b49 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/37f1db3e0d5ace57df462dee7a9ebf237069a618 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bafe8ea8bd0d7034a21a8478910f958f87cf579a |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e66c75ed6632839dce6a6b5d79d5a708b2069e19 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f8cfaf6ed0fa819349fd9c7b77b6c824cf7844f7 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/59b629bc2ef3de643cb52a953ac0a4651adb6a9a |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9a7cfa29dafb0242b399264ed9d1b1b4977340f3 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a9e5dd5fa826384af0f8748800c31b458d35d26c |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/787d56c15866267f0a29fd565d14e137c6dd193f |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8d92923b55ae49b0ac0179f18de44f3a07db1edb |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bat-0.24.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                dovecot-2.3.21 | 1 
                    fcft-3.1.6 | 1 
                gnu-efi-3.0.17 | 1 
                libressl-3.8.4 | 1 
                   rauc-1.11.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/d828615a494f1f92806aa525a1a5b61ed82be85c |     
  mips64el   | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/67859ece61c3b764680a7d52eb335901a92521ed | ORPH
  sparc64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/063bbca27f6abc3a67647681a573815034b96dbb |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/806834b62387905a7e0a366bb1b8aa83611115eb |     
   armeb     |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/cc5dbcd268918006dc7a5d6ef11e8570ddb679a2 |     
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c0e75eaba2ee10dbeaf1880de1ccbfb8bb22608d | ORPH
  sparc64    |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/991681bbe0200c652c6d77e5abd9966ef6ca2739 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

              fmlib-LSDK-21.08 | 1 
host-heimdal-f4faaeaba371ff... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                libcuefile-475 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        fmlib-LSDK-21.08        | NOK | http://autobuild.buildroot.net/results/e0282a0376e0e324f15e64ec8691f79754756e88 | ORPH
  riscv32    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a83ea4e0f569dbe0660e19eb44a7164ab3db0bc7 | ORPH
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/7d52d9224c005c293cd5e564606344497832b9dd | ORPH
   sh4eb     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/6baa761e3e5aa38086d118919398f5cf4a73b610 | ORPH
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/448b75540aa52d271e74e5e1d61678421a8bbe08 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
