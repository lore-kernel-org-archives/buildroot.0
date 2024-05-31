Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE71FC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 03:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF7F610FC;
	Fri, 31 May 2024 03:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUU5DMPoELrD; Fri, 31 May 2024 03:59:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BD4D61040
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD4D61040;
	Fri, 31 May 2024 03:59:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB8211BF39A
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 03:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A73AF415F1
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 03:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI-0j5Vy2FKf for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 03:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA75E402E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA75E402E4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA75E402E4
 for <buildroot@buildroot.org>; Fri, 31 May 2024 03:59:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC7AD40005
 for <buildroot@buildroot.org>; Fri, 31 May 2024 03:59:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 03:59:37 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717127977; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e2f8m1+5IUkW8uLE6a0kR7txUhfbizXIZ79F4jYd0Fo=;
 b=mlzK15SrZiAO/tSW0NBsaYP3eu4yEFByUWEtIxlS6IKGdNe7jSUiWuS37oygHn4l3+wxYa
 iD1mANBRgpA6RF40eS8n+UMEXHTUYKOo8n/bDlf5+whZ8prQoesxSDf/0eJI9dxjrRNKCK
 09v0K9XHE+1ub9VXdr80foK8axGPSyhZ0R+YbPBo/+bv+uP2jt/Kgt1LnOQZssCMfxj2TC
 N0Z1qi5c/GpDVGhZTdCJVpl8hNt05ae4DjK4O1PEL31OqGYaS7L8KP+ETiO+djlq+Zy7e3
 8uM9qXm92Xnzta3tbM8Klz5xlr6BFb7ZNao7wQ3jUNlHEkFU/TUD2gUwpjsD1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mlzK15Sr
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-30
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
Message-ID: <20240531035937.W4qkVsWcLgwrECqyiq4JIMez8EPZ5J1mL6bkhIst6zI@z>

Hello,

Autobuild statistics for 2024-05-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  7  |  0  | 15  |
    master   | 34  | 56  |  1  | 91  |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 4 
                       unknown | 4 
                 coreutils-9.3 | 3 
        host-sentry-cli-2.20.3 | 3 
          libcamera-apps-1.2.1 | 3 
android-tools-4.2.2+git2013... | 2 
                elfutils-0.189 | 2 
                fail2ban-1.0.2 | 2 
                  ffmpeg-6.1.1 | 2 
  gobject-introspection-1.76.1 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  libffi-3.4.6 | 2 
              libopenssl-3.3.0 | 2 
                libressl-3.8.4 | 2 
           libzenoh-c-0.11.0.2 | 2 
                     bc-1.07.1 | 1 
                    bcc-0.29.1 | 1 
  binutils-arc-2023.09-release | 1 
                   exim-4.97.1 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
         gobject-introspection | 1 
               libglib2-2.76.1 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
          moby-buildkit-0.11.6 | 1 
                 openal-1.22.0 | 1 
                   pcre2-10.43 | 1 
                    proj-9.3.0 | 1 
         python-remi-2022.7.27 | 1 
            qbee-agent-2024.09 | 1 
                 shadow-4.14.5 | 1 
      softether-4.30-9700-beta | 1 
             util-linux-2.39.3 | 1 
                    volk-3.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8f27dd18bfc0f0b5beb40a294011bb871023341d |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f262176e59e44e557c7d8e0a0d6dea10d5633661 |     
 powerpc64   |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/372e3bef857396495046e5a243fc2530e7ed0416 | ORPH
    arm      |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/e384a79281375e3b715a9c2ee23bdf993b96bca6 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/6f2f88bdfc9638232a327310de16a41e6d15f4e4 |     
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7bd473f4500d60bc55bec5834aa64da9e049b0ed | ORPH
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2e5b984c82d9af6877be8f69a309d344e8e67c18 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fdd49f55af765f75a3834d6c6f9a576b109d7b5d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c85c210f0e93227b8f975905d3919b3ee3d63672 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7d514430c9ef74ffe7ca6ff7e972ec5706ccb1bc | ORPH
   armeb     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/db20886440170d2ae2e1fdf899a1ef73f39328b5 |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/78996c02e87acb9d8966de02a10f65952c7cef28 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a3d1039d0c7824166071da367cbff0853ec3f53a |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/df68e3c66bd434bb273af8d33928468acf93d526 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d668bffb3953d362c1eb2636350a7cb445085e6c |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/397f719239e1d427cce62ad3d54dcf89f86de846 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3e7bc4057e0891c679f73c8585b7f9bc272442c1 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c6fe7cae7826ee77e389f57bd20de19f94b8a57d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1da20d5cb9caf7698256a64742e5a7db8e75cf43 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/72f65fdc0d54dd5dc4c3e78f779ef7bc5f360ac4 | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/efd837481513a2e8739bb253f227bd3b784ee0d3 | ORPH
  aarch64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/328fc99e8f6b849df08231752aa5c68774b0e70d |     
    sh4a     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7735e69d360226c2bc0afb2d5b0b37ac15d33f99 |     
  sparc64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7442334031bfdd43518999a8c63db64633517c5b |     
   sh4eb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/36dfc37643c24c436544d21c1287fbde23523724 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1a894861b702a8f738763c2cc84a44cf4433ae69 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/19e80d5178983ef088ca10a5cae5b745b730e652 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7002907baf15dd1b1217028a39d0a2c59d469398 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/53d58423bb6d5345c25d135de2307b6cb326a266 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3eb9655d3b990b94c8d30a3fd11f5a0184014d44 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/6aee4a0e809e87bc94a0d311e1f6907b5aad5fb4 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/12bfde19138425073b88b710e88cb1af853d0c30 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/92e8ce773b464b052cd985924532cd149cefbdea |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7c0d653f5fbd1cded3339dc289c3c63a3fb5e90a |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/76d6fa4a7867c6ab18998daf220cd55053d4fcde | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/b11ee149de6911744912db5bb17f66084b57f06f | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/38641226902279eefad4dd0cbab09163b0c69bc3 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9b91a3db812cc54e8d979a8eb8eb02efea181264 | ORPH
  sparc64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/7e93ebb8d1c85d2de383d255bd148847b625f2a4 |     
    arm      |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/6e7ad53d44b417f6aa62acd8b2396720f5a14e82 |     
   mipsel    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/201d20acc25fc013cb900b14af5cfd49dcf098e8 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/7712a477487df80f71ea154f54b68f0bdd78bd82 | ORPH
   s390x     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/b8c00fbebbe297b3c220f1624d49bd8e500e1e03 | ORPH
  riscv64    |      moby-buildkit-0.11.6      | NOK | http://autobuild.buildroot.net/results/103e18eafad999b337313ac7d835c7454f466af2 |     
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/9659eebf820473a34aed4af05445334f45341e53 | ORPH
   mips64    |          pcre2-10.43           | NOK | http://autobuild.buildroot.net/results/c79ed9d4adf8cf31b770134165da266d8d8917ba | ORPH
powerpc64le  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/e44cca59c186b997a906187168d10eae3f035271 |     
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/1a63101c5c07863f07bb06d06c313a74cda56fe4 |     
  riscv64    |       qbee-agent-2024.09       | NOK | http://autobuild.buildroot.net/results/87306a0334aea2c0a39be3154a31b3a45265781b |     
    arm      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/a2cf83f2996840693e5b1ba1df0774f7f03fa4af |     
    i686     |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/73f06ef66fd0e74949a3a22ee3ccda1bba4af03b | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/aa19cad091cce983742561b41052a1f9c816fd14 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/050c5ee1c3f01693f616178b100516503588bd44 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8b7a1022cd9665dbd9864c2d6d2abaa772f5665d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6a1141fd31dde8ec9ad7b0ab6368fd43f39d3aac |     
    arc      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/4a816211a10d0f94fec41fb6a3408b3e56923217 | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/e2311331fafb3c2cf0b6c031b88cf08efbd47906 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                gnu-efi-3.0.17 | 1 
  gobject-introspection-1.76.1 | 1 
                  jack2-1.9.22 | 1 
                librsvg-2.50.9 | 1 
                 openssh-9.7p1 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/5e17647866cc993ecf9ef0a06891e5a52df82591 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/621e3f060a5520075f96538a5c103a9d2a466140 | ORPH
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/e76d9bdb8c3fe97fa190f42826da405d1958f1a8 |     
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/1317c0fbf2cb0f1f6e0ac6802b207ce74a8454eb |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/2d8866b9413045f47ac25e696be9fefad76999ed | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/55e160f30fa10ad3bfa95f80768ab0012080fcb5 |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/67c2041b6bc839aa6a620acd49cbe1205291b005 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
