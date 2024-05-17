Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4E1C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 04:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE3E6086F;
	Fri, 17 May 2024 04:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6h3TWQ6xxIxa; Fri, 17 May 2024 04:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 532C760746
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 532C760746;
	Fri, 17 May 2024 04:10:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6258F1BF31A
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 04:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473D060746
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 04:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KO-XZUF2mrGs for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 04:10:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6373660635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6373660635
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6373660635
 for <buildroot@buildroot.org>; Fri, 17 May 2024 04:10:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FAAF20009
 for <buildroot@buildroot.org>; Fri, 17 May 2024 04:10:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 04:10:36 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715919036; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Uzvwl6uTm+/fP5Un3ECsIaZMKJdwARAhB4NAdvP0GMU=;
 b=TGVbm+YqKTHagdMoTrPSyCnNE5RssS0XOpEfw1Crd8BqAYi+M+d69PNa10yX0VC+V5VvJA
 Y68NsTxjhRe6kixUKG5fMab3ws1aIKUIgYTmOMBznQg3M0UATAB2c5cCkeqL+De7+0OMbQ
 0y/5SNE3oWRqYArzpbBHoD/LsiqoqVBJKGTh/RUb10W6JrZu/ABjHp66W8KhZqOxskJEJZ
 GkSgImJLtOjKnNIP+KZikWo5xaG1wb46Dvk0HqNpChMlzv6WqduE1CW0bjU5Za8tp2MVy3
 5JXarrwQ7OJJNn7/aNh54hA3CIOv0dGmoefLFY0fzi+g87zfE5qtcHjOoEbz4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TGVbm+Yq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-16
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
Message-ID: <20240517041036.018SmhfQWfu3lgkB9HiCqh3PlfOH6byVtt3_OZeNCM8@z>

Hello,

Autobuild statistics for 2024-05-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 12  |  3  |  1  | 16  |
    master   | 42  | 60  |  1  | 103 |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 5 
                fail2ban-1.0.2 | 4 
                  ffmpeg-6.1.1 | 3 
          libcamera-apps-1.2.1 | 3 
                libressl-3.8.4 | 3 
                 uclibc-1.0.48 | 3 
check-11970a7e112dfe243a2e6... | 2 
                elfutils-0.189 | 2 
host-heimdal-f4faaeaba371ff... | 2 
              libopenssl-3.3.0 | 2 
         python-remi-2022.7.27 | 2 
                     apr-1.7.2 | 1 
                   atftp-0.8.0 | 1 
                    attr-2.5.2 | 1 
                    bcc-0.29.1 | 1 
  binutils-arc-2023.09-release | 1 
             containerd-1.7.14 | 1 
                 coreutils-9.3 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                    fcft-3.1.6 | 1 
                   foot-1.16.2 | 1 
                    frotz-2.54 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-f49c2f1a202... | 1 
            host-fakeroot-1.34 | 1 
         host-libxcrypt-4.4.36 | 1 
                  jack2-1.9.22 | 1 
                  libffi-3.4.6 | 1 
               libglib2-2.76.1 | 1 
                  libsepol-3.6 | 1 
           libzenoh-c-0.11.0.2 | 1 
               lighttpd-1.4.76 | 1 
                   lmdb-0.9.31 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
          python-grpcio-1.60.0 | 1 
        python-ml-dtypes-0.3.2 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/e786f09835d42d51016d34c08a0317f0568e138b |     
   mipsel    |          atftp-0.8.0           | NOK | http://autobuild.buildroot.net/results/85e69042575b41872a1fb7c6116b1ef6264cf245 | ORPH
    m68k     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/4937606c9b35fe0db2355c18eacc0bbbf28f6879 |     
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/9e56559236a77ac08ceb55734bd65cef40c643dd |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/3d5372333966470a71d94c5b33841d705d9dbd0d |     
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4b49b32308fd90b486b871d4de1a52296cad6d4a | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ca2de9b3f86e7e04db165f3d00a28a7912070e13 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/680c7f2579c2d3e37716569b4b9c9fd9817ce9b1 |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1a967f48e595ae4ab24d90db0b29233220faa82e | ORPH
   armeb     | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/cd232f0cf0a58078a9206a7001fb236a8bca001a |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fe5103021593860dcfa2fb410616878d82548afd | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/42f943db2c548edbaae6b3761c5702bcad78d358 | ORPH
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cabb8637dd487520d3815d7cf2a59aca12814bed |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2c6d3949e0f7852a8684d2fb4a1ee32cd94c60d0 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/21f309a3e7c02801b1cf7d83b6fc4d550b1cead4 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e64959ca190e2e80aa43ff9015c6b818f4345e86 |     
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/ee60b2e5ce69204011709cf39bb2b28dd6924e53 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f3c8a55f032029a9c707056e1e99839a926dcddd |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2c1e1dbaa91573c03e38516a575c63cc23686050 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/35f8a0fc690c3c7c31fb825cd3eb0ae482886de9 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/25e3dece446a257d8fe71c0dd56ee1b4a925b037 |     
 powerpc64   |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/df3b3b98265ec3a75578614746b2d1426c90e125 |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/6331c9a4aadea9717edee4cc558cc7b84931a048 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1cfbdedfbaa2a4cfe5f57266a98b678894a81bdc |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/77f5d7b53e66a2630f902cbdaa688de850365576 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/0698a6241cb16244e946639db0cef2a96305d7a1 |     
 powerpc64   |       host-fakeroot-1.34       | NOK | http://autobuild.buildroot.net/results/05c147fdcfb1e289b58a9f96029d66ba63549dda | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f179d9a04c7dbafe0ffb07127695e6bcc6e9c222 | ORPH
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/bdbaf48acd6096e9175e8581dee9a884a3350930 | ORPH
 microblaze  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/143c1cc922f74efd73c0cf083a9ff53c4df7a913 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5bccb37415366f91a18b2e17068c93dfe6139168 |     
    sh4      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/40fb799b809bbb78d7593ae35eb3258456034e50 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dd533736658b192b261646717d0816d337dcfd43 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ab36266240dcfb414aaf991c9ce78ba03e73de8f |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/db2cecb5aee1eea0ada3e7dbdbf47b95e95985a3 |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/637c833054eff5cb9d2c1f1a86dbfdc0e2d2ea5a |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/aeb4ad28cb9afa32366fa9cbf7e807a31038c454 |     
   nios2     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/fa250f553a909c51676fbb78fb09c0a58559222d |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/6bbee2a3085cfd734fd9eab2e820f7101169dbfd |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/64b54c77a6a7d447215f7cc57e4d3d10ca9d5a42 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b784c6efa64ef3e8bbf9e145551bc5f4c09ed3b9 |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/c81c16457ce94c2b0714fa686885fa71217e32e6 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/fd1ba2d6d32f16e24f56787a044027d07ef3347b | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eb3b1c27d668cd8dc1b3a6695d088d52662f49e0 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d5f581e6de14ad8b7ed15f4c0f7fa76339f9cf99 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d7ba3cc7ca46154229662e0547f48452ef564df2 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/a98fc78ee627640ccab6bc29d369db1908b5c7e0 |     
  sparc64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/b603bc339bc98b668660b2d373203c7bb2fc8708 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/e55c1d8f1fe3cf41f45276a03f0728061a39c3dc | ORPH
 aarch64_be  |          lmdb-0.9.31           | NOK | http://autobuild.buildroot.net/results/f7968dc64acabb6c590b9bf044dc019931ceafe0 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/219f1c40166dd2565f57ac1a7ce10e2d8e8004cb |     
    arm      |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/f03c60e7d53b7dd2f8e2bff1bdd4f06caf9c57a1 |     
    arm      |     python-ml-dtypes-0.3.2     | NOK | http://autobuild.buildroot.net/results/5f257e845d628a9ae413eb2214e43a949d7bf50a |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e1a76f36539ad03810bf6043dd36eb06b97d926d |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/2ea048cf9c352b6e9586d9b8e3e5316ea5180675 |     
   xtensa    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/e041904250f0caaf1406615128900df9e735074f |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/6740038faaedef4f51a278adf604633c2618d2c7 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/0802ce57f9c6f0bab3c0c65e582a23d6707e8fcf |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/97bb411091a74d8f05eb15d70e65a56b9bbe0b2c |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/14963cc3f41a2cc426555ad474cb6c2b51d4fdc4 | ORPH
  riscv64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/90002a1bfdc0de651539f9c12e19b92f93e9af8e |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                flutter-engine | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/e517fc67ac48e3f54cfcb181c32cc5038b35e620 | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6cda7102d54c9d17bb9dc2cba42f136e71a46beb | ORPH
  aarch64    |         flutter-engine         | TIM | http://autobuild.buildroot.net/results/c2715f788576324c718826ba3c69cd153b905248 |     
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/52369f7e37502e15c0a6ba774602089ac3902125 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
