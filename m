Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CD5C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 04:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ABA260807;
	Sun, 23 Jun 2024 04:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQRpzAfk0D4N; Sun, 23 Jun 2024 04:58:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D4D607E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D4D607E0;
	Sun, 23 Jun 2024 04:58:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4661BF86B
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 04:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 088AE401D8
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 04:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EJGfy46DmZp for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 04:58:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1DEC40158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1DEC40158
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1DEC40158
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 04:58:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9E7C24000A
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 04:58:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 04:58:17 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1719118697; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pj8PC99cEp8Sl3L4qOFaBIzsugO9Wi3EAwpQ6opZkyM=;
 b=N6jwnzQd5tQPpi23cSTLtmjf72VfXvyNYtxILLLeXmof9NMrpAk7HsjE1CC20CQlZdVT9D
 F8llk5Aap+QfZKhhshb2Tf363ngkaVFKC8cjxc2iOSm8NONHuvlM9TM6RE1fmlxh5Jo78N
 T5gtgy3pTPKN/0vD2ZBzQIGAtQ8a7m8BAyIAhKaPkxfVg2oNITgg2ZNuRQ449v0cn0V2aa
 8fxGfDPz6WQBWtXQm+iVCNE8qEKbjGUfIqHS0Odb+XNg8Jh9+Bmlu8XnoYMU3sjVxxyuOC
 zCchVA6U28Og16dFgdzBSLKYLwhovW3T50MNu5BI2YMT/PSNE2pOunqPqgHfOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N6jwnzQd
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-22
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
Message-ID: <20240623045817.qxLuZ1XxgqXxg9PIPZy78RFxLv8MFA4ypnSrZpbLuLc@z>

Hello,

Autobuild statistics for 2024-06-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  8  |  0  | 14  |
  2024.05.x  |  8  | 16  |  0  | 24  |
    master   | 57  | 179 |  0  | 236 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 37
            host-cdrkit-1.1.11 | 13
host-prelink-cross-a853a5d7... | 13
               cracklib-2.9.11 | 9 
ibm-sw-tpm2-5452af422edeff7... | 8 
                libressl-3.8.4 | 6 
                       unknown | 6 
                host-odb-2.4.0 | 4 
                 coreutils-9.3 | 3 
                   evemu-2.7.0 | 3 
      host-riscv-isa-sim-1.1.0 | 3 
                  jack2-1.9.22 | 3 
          libcamera-apps-1.2.1 | 3 
                  libffi-3.4.6 | 3 
                    mpir-3.0.0 | 3 
                s6-dns-2.3.7.1 | 3 
                 uclibc-1.0.48 | 3 
             util-linux-2.39.3 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
android-tools-4.2.2+git2013... | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
  gobject-introspection-1.76.1 | 2 
                 highway-1.1.0 | 2 
         host-libxcrypt-4.4.36 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
                   linux-6.9.4 | 2 
             sofia-sip-1.13.17 | 2 
                   trinity-1.9 | 2 
                 apache-2.4.59 | 1 
                     apr-1.7.2 | 1 
             can-utils-2023.03 | 1 
check-11970a7e112dfe243a2e6... | 1 
                   cpuload-0.3 | 1 
                     crun-1.12 | 1 
                fail2ban-1.0.2 | 1 
                gnu-efi-3.0.18 | 1 
host-android-tools-4.2.2+gi... | 1 
            host-fakeroot-1.34 | 1 
                   host-go-src | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-librsvg-2.50.9 | 1 
 host-softether-4.30-9700-beta | 1 
               ipmitool-1_8_19 | 1 
                  libnss-3.100 | 1 
              libopenssl-3.3.1 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               lighttpd-1.4.76 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                openswan-3.0.0 | 1 
               pcsc-lite-2.1.0 | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
                python3-3.12.4 | 1 
               quotatool-1.6.2 | 1 
                    sslh-2.0.1 | 1 
           v4l2loopback-0.12.7 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/425791046952fcc9515e5090028697838ef9d1e6 | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/904b9eda081f3a86f3b285d98ab56a141afd5c3b | ORPH
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/2a9eb9f7dd05afd33ac4df147c6e4f1a2c5521a6 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/77f1c15f14ed1ef594cc63020a8431fbd1101d20 |     
    i686     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/96287bbe8b8305a6f2dcb5dd13f030c54fcd43f7 |     
  mips64el   |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/0b1f1d3f3d4a0e6129fe9c76cf4f96149a55cce4 |     
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/27641c80f3ab728fe85ff735ffe166396b7a2ba0 |     
   s390x     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/2759d99b1336cae18287622112fd18f2c1c90025 |     
   x86_64    |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/3baa91f29026cfc702bf21e1236da1ab7805def3 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/91b4b2fa5850df95d528cefc69830cad22804eab | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/05775dd2224ef1445bc2324c3f7fa865ac49ff4a | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a008d56fd1d5885bf5bdbb7e20eaa2b5db4ec8ec | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4c9622af199e91b75aa6e6d49eb6c9e52c7a59dc | ORPH
   xtensa    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/b34ca8a0e3a4afcf0d928fb50685ac736bacdd1c |     
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/bc2c6d2a0cfeacd428994b2360f09e1662352f29 |     
microblazeel |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/04ab218e0e1bc10272681ab3e72f04eaa5a1e2c4 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/e245e969d9304c7ce245d86302c1f5221f768a10 |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/37b3f53b678b5852ff63ebbc6d654a54fcea8c7c |     
  aarch64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1e7d0bb4897f43559dd7481ea8a26260ca0eb0d3 |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/812184d483ae534b07453737912c603ad6266e0e |     
    sh4      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/5adb811c688a23db05b2abacac9cb82880a58475 |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/d42aff54584a3845f2ff4fa172722515b97e973f |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/ac5d09d965328026a32a4e97c43c8ce7f86a66d6 |     
    sh4      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/b7d9115f16d0d1ed6411902d2e063ef897a6dc33 |     
    arm      |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/f1a8373395311cd72891d2802588c19df21adb25 |     
   x86_64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/1dd622c045d973ae0d88be0baeb8edf659968060 |     
    i686     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/720e09a85e0336dd37fc74fd24f356296b5f5d4e |     
  riscv32    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/96bb595646f0e6a5a9c40e6df8775effb00d5333 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a053df719bd83068f7c95ef531fad0534f92332c |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0797c4e7564fcae558d1ecb908e0f01dd6828846 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/67f2b1303ed95df162df5ee24dc75ebc87bb5ffa |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b5a8c834418b73c5d2a0086d3ef1d6e002afee26 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e9b943512ce96d4aff22eb9d4965597ef98e1088 | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/0da55d193db4460fcb6e7e0bc6ebaea304d80b3c |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/59712d7ca50cb36d40908fb19f0b6045206ef3b9 |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ed583af554b946d44aa2889bf458928681e63915 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c2e0c412321c851f629ce0ceb3ad4cac47e487e9 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/094e7cf88e8563ed21fcae51ae1d2b977c7b0d21 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b4dc8db0bcd701712dfb9544713a93eac8e3bfc9 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/39bf9a0985eb4d9cbb60f1091ab4ecfd008f14ae |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0109c8987ef4d413051d44f0c4016380dc8a0fc5 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bc7f2b5a84a8dd9d98802ad085739166061536ee |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4a11e2514ff98917ff9fd6ccab0a256f12243362 |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8795fe486d12f446fb748a708ef66a204ed5cb3d |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/67cf6f0b2b8347fe4b3d0e68be50c5d77486a497 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4ff01dc944176646c758b61ec227a5b6ed51ca7c |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/20cee98677525a71a06ba9b205bc516aa416ec08 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3919a924af8df5ea98a5a338ccea90284b2e7c70 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e937a04105f3c86c9752e85713d57ef3ddab3e90 |     
   x86_64    |       host-fakeroot-1.34       | NOK | http://autobuild.buildroot.net/results/617243ebb9946389b8fc138fa0fd8beb9e872615 | ORPH
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/0163a1d08b346a6de9fc07bba6107ded69904de8 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8a346e908ee48fba75afd2a53f4ba82903bf09f5 | ORPH
   mips64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.net/results/6e9d918696bb3d8a8220a29e66d5d8c9679160b7 |     
   arceb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/0ecdb36fccb8dab2a381bfc59810843ee44de19f |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/74710f7958898905637cea08fb91f4f664e49b60 |     
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/24d7ae8aa67b31bf3558926f9b52df5507ff7cd7 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/920cd63007996b91455b996186f8cf91c7803add | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3a8c20f52ec2355eb7113ecfc17cab6c1c153c6f | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/95cdaffd795009686a2b9621812514129e708750 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fb15735484a87ab3af68af43ad90204c74f1f4b1 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/535d9249d31264e737e8864899f05e245c6f92b0 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a9d9d9088d201a33f4118c41221eb2579c857918 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fe1352821603755d88c2cca76f3e244fcdb81885 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/117eb47bd17871758c85a5e50ea7065247d2a2b5 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bb44bb9a562bd755ba60844dcffc05ab5b5a7312 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3b8aa810767e63e3717812df328c64ce82369c9d | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b0319cd0d3b3868087ba6eb1d2b8d8e25115d9ee | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3dd51d23c4922e2b1c11ed35598d8c054600488f | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/61671a763bc3ad011ff96b152bd24d0b795e345e | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bb9e131fe6faca9b073ae0d1b0d194de667dd262 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/13e0d60ee747ce4e5ed5e25805df418a01679b49 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/069aa96de6cfff04da58c0c6c8848d4125b1498a | ORPH
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/bdac478e436933458a09133b70eca37544ae045c |     
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/012f2a3d94805f47ed641ee86b81e475b7d2cc36 |     
    mips     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/fd990bfd77d4e245a31848d8116dd5f8365cc82d |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/39d3297fb5bdd3fb41ac78f6172a3b7ab8dfda3a | ORPH
 microblaze  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/60cded58b3ef8dacced1e5e6ff4241d1bf7eb65d |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/213396708f6da1847d706a76ac23fac9ef992bd0 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e3ea4f52612c781e28b7fb74e5f534d8a5dac2a1 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5c690a2ffb70fe28e6671715eed73dc5581a4ac1 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8072c8af2e6489474b527f865e0eb0e7aed29405 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d2b47373f2efeda5127166d8daa13c077a2ad983 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/577e6f7e94023d1d5bd3dea840913a499f73a00c |     
    sh4a     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/42676632f0f5708fb7aaff330c275b53b1bec22f |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7ee32d382fb06fed0f242c4b774e2784f86ab7c5 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7162a347e0b2c37b757b829d1f5f1999f241e65b |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a430974757b104f17b5a5fe6c60070d49ce74133 |     
  aarch64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/a06eff7c99dbbd4ba2e854bfa98dca1b02436c30 |     
   x86_64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/41e1f8ab31d0e1eddc3817379f0aa3511830eb73 |     
 powerpc64   |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/8f8b94da2cc7badc1e255037ff7b80fddffc309c |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e735bd9ea06352deb432ac22263e1908498138ae |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/28b174eca8ab7e643b7a6b576542e1e93b47e15f |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d17ff690d69fcf23ef45d35de3792a689a73b1cc |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b88ea898134e1efef5da496ac7d566ae9fd583f7 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/cab9361d1c69107aa5de9b8bce224e7540630288 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/24291099f87cdab7e01ebc13030208df0a7707a5 |     
 aarch64_be  |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/0fef55d0eab246371d77a972d4133ed597807b9e |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/8397d9c11663b69f44b0442cb6737de9cb4a69b0 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/814c1268e584b7d2c607ee4d1695e44dfb4c0802 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d3daacf51c41e111ca3f20d9d7ee3eeb3a8e2bd5 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2ebfe34d31ef56cdcfebf5693cc696bc6212c155 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/22537f447f0b6cc6687401cc4e829fc163b8bdc7 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/015828b70b064346de9f2454d2edd0fc34c16eab | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3c427504edafe9e74af9a9de13c736af27138f7e | ORPH
    arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/3482a797e8f50ecacd7b2006a80661f33da7d5b9 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/97bdd1aaa92a9ac84fe6b0dff852a2964bc9d389 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/3c916ae7a4806219cec1388afeee1389d3e1f050 | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/ca3758742ff88f9c2ac925302a124e6b9c829aab | ORPH
    m68k     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/4d496ea1c6419b4b77af86559082896fe7b6fbdc | ORPH
   armeb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/66ed8839ec2c8b87963ceb8b62b3d3317a9eba90 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d555095e50f3270c685984afaee83c85071ba666 | ORPH
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e1fd67f521ce550205353f2195e447d3f38ad19a |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9bdc01615d1b71a7ec312edaf4a71f7c7bdbafe2 |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/790685c26dee22e166b8e49f80cafe890d671f3e |     
    sh4      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/267c7ab7ac2a945f2b43e756f800bf4b7f43a793 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/80a0b3a4bf5e5e5f3b0e1e5e13395e458a722434 | ORPH
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/77d9a64022093afeda2f5eeff8a59f3cc05e1e7e |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/9ddb2944923b73c3e48b1028a74e267b88182129 |     
 microblaze  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/00942658d6fd7590af4cfcf61721bfbd78c5e738 |     
  sparc64    |        quotatool-1.6.2         | NOK | http://autobuild.buildroot.net/results/4b32aeccc8a62f1847142d6dd65ef9cb75556d04 | ORPH
microblazeel |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/ee49ccfd01e8eafbee7350ac5f61d36b7a889c4b |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/60c6d1e37839c41bb9dde8808e1fc0da3d506d5c |     
    m68k     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/3372b3cc9afa48af42ae57e74d7c83ff2f6770f9 |     
microblazeel |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/2848d7e44767d2d06e53c061d42c4789c3eff870 |     
    mips     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/45d33ec20c8759dd56421c7d543f8b3390637eb9 |     
  aarch64    |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/b5cad8b8ad7818a08f4c450044d559f70715e9fe | ORPH
    i686     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/e00d9ee2781990df462dcc013ac669f43ec2f81a | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/ce8e4bab6aca50337e3ecd215a797c60abab8c9c | ORPH
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/6b5c030008f56b8ed403b613773b1e80931fe344 |     
   xtensa    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/9591b8eb8e1c38d7f230a17c809037f8ae6d441c |     
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/aadd943be4e965e6de8306020c480d71a875053c |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/cc4b068eec514b99b73ea505099ea3307bf15b0e |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/de911d6b36cb9abee8f1ee3d7a2ea9fc21a70f87 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/e907a658e954d2d74656e304ea0fe138311a1368 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/de75644bc0c7f58e2166c5a29f6cb8af1c6e757e |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3a18b58dfb5ab62c82eab9f7ca97335fb56a7c16 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6ef66b4a42e0cf18d127c30c467ba961f09b7cbd |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/eb0d82430e2a1975b9971a99e63b23a4116e618a | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/a75241aa64dece2eb55af9fe914e4f905295cebe | ORPH
  riscv32    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b425e966f544fe5905146189e2e2e7688b8f228d | ORPH
   armeb     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/5e31191c421e23b264b51c80dbb790c31ffa36fe |     
powerpc64le  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/801265a428ac172e1a724026d3d6a211301af7d0 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/615dd92ca5616eab25526343f8ed638448faeb41 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dbed9a93d856983112fd013b490226ee3c64b0c2 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4c258b11fbc68b3817e5076b8dcba65d5ed54309 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/17e7a206350bd2cc887ce0a5b71e31054a1bbc15 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/176405595206b2ff4904a74785dcb3765645ed13 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/dccff9b6e879e72b35f1a2282e5d2f26c9b5a4db |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/83c707386c972ac30646944f54a8b6d453d4f0b6 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8b71881d48f5a8856a1cfbf5bc50af1016e50eb4 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7c14777a875cc69bb6a1fecbaad03c06cef80fd8 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4740f43160cb40f561dfecf2000a092a05a059dd |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9b37f29e3cd7076d3f4a4ee78b4c6a296f66cc6c |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b9b8bd19d0c9b563bfb5179afe2bd4e724cf2b1f |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8eee438d3689f1b6e3b9dde27d5f16b2814f2e11 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bc961b76950d6cff110968fc76f2b97471364bb4 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f2fb4e29eae35538eb8c66b2999383dd2ea34586 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/792ef6743c427ba177e6f28e50547b7ef864bb3c |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e33549cc1a5b8c27eba27b39b4ff530ade40728e |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4b690d6d603fd6fb00c4f79274267ad5cb7dfae2 |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0045fc3622541f98f09301c2875aa3aeaa07b6a2 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/af55e98bc0c21722e177986b040583437da2e07a |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3d406dc0440c1061ea01ec6fadaa26a2e4ebdfb9 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d1d4db3cbeacceac84629063073acc7850dd97c0 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cd16112bf50e1462ef3bfbaebc598ec27bafebd8 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/46becd317c67ff581735b3fdd3d1f15e91b0eade |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/30abbc7a07bbdc77167a3fa08bf29f849aa7f8f9 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0b9b7cecb46d7fa781930a7055b1b582272ceb74 |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fe90e0661acb6513a59c89de32db1b88bc78dc58 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f55506ed480a5dc88bd524d7c63cc00016e73afd |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c1c6963970257c3f9adcf02079af93b8ebd08161 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0067a2774cd411fe5d669387e85248380e1ede0a |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/36ee71da31c69197df641c87e9be38b16c8839d0 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4500a95a0f9c9ed46034534c3f2ba7321aa53ebb |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/401d6b7f64e9f816ea78bfbf324716015bb46199 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/608b62c32987baa3639cabfb08393efabbb37c49 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/40ad5f002ef19ed15c0c09d9e7dc89713922880c |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/825aa71eea0f56ebafb4c88a205c3ad33039296d |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a9d247bbe9bdc6d8114b4cd2010183f5af8049e5 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 2 
                     frr-8.5.4 | 1 
  gobject-introspection-1.76.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                libressl-3.8.4 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c4d5acf1df8242a3e2a18ae43cabab9bf7b5aaee | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/84e5781116a6dbf7db83f78bca8a15159982fb69 | ORPH
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/69824ea5836c892a32721acde42145586a7cecd6 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ac82fb15e74dae662d5857b3cfde3ee5a4d60a55 | ORPH
   mipsel    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/702c6083430c233cd0bf4059c0bbba28b83f6797 |     
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4e1e0e3eb7a5c1d11fd93f83003def66cda69a46 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/da164b2e3e03769cf4a63a47b3ecf653819702d6 | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/45c408c6d9d0c3fad9588905aa5b6069966f6838 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 3 
                fail2ban-1.0.2 | 2 
                       unknown | 2 
              cache-calibrator | 1 
             containerd-1.7.14 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.0 | 1 
            nodejs-src-20.11.1 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                 uclibc-1.0.48 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/61517ab3e9af98d4ee13085a68196f6e208c52cd |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/7faf1cebc53f3827cd1f30b2140742c17ce545f8 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/062c07620d2acc5a3dc3ea2a51ac52d690a4cd5c |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4dd9049eaf7f528d74625c0fdad13c7c8cd5aec9 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/66537528ed1598a4431c6ada863b402d60fa927f |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/7791028b98bfffdf47a853c58e451ecfaeee09ad |     
    mips     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/54ba3ee08b1ca54d2c793ee7477c276975f2509c |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/376085b8aa165a0c9f94718e15200025e8988353 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/88975cfc3a7157e729156a8feba013a735a63031 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/eb5afa301d7658a0a5dfa220f80fac4e5d35e8ff |     
   x86_64    |       nodejs-src-20.11.1       | NOK | http://autobuild.buildroot.net/results/921f6e23b9bda3a4d9372d3260c756c7b6298b08 |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/0b0c0b3c7589b88264441fe2f39f6636d5c57aea |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/226a50aaccc74b1f0f20b7d45865d0339ad80502 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/ad822d14a5df8fee66a84daf18cdd2868ddd5de0 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/df6a6b86805b5b6d00f4f6707de3ba90c3a4a773 |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b5bcf713a5c1bfef5ae0afe9ab449dae8b6f74ac |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
