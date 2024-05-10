Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BC1C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 04:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E896D614C4;
	Fri, 10 May 2024 04:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lemKyErZIiFi; Fri, 10 May 2024 04:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A76DF614C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A76DF614C5;
	Fri, 10 May 2024 04:03:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4298B1BF995
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 04:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56A2542286
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 04:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymZMt217e5tb for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 04:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF85B42285
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF85B42285
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF85B42285
 for <buildroot@buildroot.org>; Fri, 10 May 2024 04:02:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 876D9FF807
 for <buildroot@buildroot.org>; Fri, 10 May 2024 04:02:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 04:02:54 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715313774; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t+MdZR0LOIin+nLM5X88kI80W/0KY1RL9xDCloH5yGI=;
 b=aRTqnqag4m4QJlLB/DdWMz4vRLmYx/HcMSyL3feVziUWYMYyAW/YNom9OiP1hIJzXCGKy2
 JWU1HLf54xRkNoSD3IzM88yvozpBEA7khuR8zEdecIWMYm5QGw05jkG+oYty/2pbfbJLo8
 D5n6RPwQfOo+xkX11JogrtOg4LwMOnX2n86XfpicP1QrREitexiSVuGMGS8zQoETeDuVcc
 6GMYPoU8XLohMuJsXSLs3eNdjxr0UApdAtUJq9FplJra71vHxy3TLPQWtDAk7eNxxqtEUh
 nSGxVE6D4I2k7oS49rR4ede4bRYIEpsdxOg/Mvn+zxQfpK36cHjNvXN1GHyJJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aRTqnqag
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-09
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
Message-ID: <20240510040254.mVI7Ck3Z8xH6cpMHxewbI0haSahtQrmj_YRAXUYy1ok@z>

Hello,

Autobuild statistics for 2024-05-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 13  |  4  |  0  | 17  |
    master   | 71  | 78  |  1  | 150 |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 6 
ibm-sw-tpm2-5452af422edeff7... | 5 
          libcamera-apps-1.2.1 | 4 
                   linux-6.8.6 | 4 
             containerd-1.7.14 | 3 
           dmraid-1.0.0.rc16-3 | 3 
            host-binutils-2.42 | 3 
host-heimdal-f4faaeaba371ff... | 3 
                libressl-3.8.4 | 3 
                elfutils-0.189 | 2 
                    fcft-3.1.6 | 2 
glibc-2.39-5-ge0910f1d3278f... | 2 
        host-sentry-cli-2.20.3 | 2 
                       unknown | 2 
                    bat-0.24.0 | 1 
                  boost-1.83.0 | 1 
                    brltty-6.6 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cryptodev-linux-1.13 | 1 
                 dc3dd-7.2.641 | 1 
                      ell-0.65 | 1 
                    eza-0.18.8 | 1 
firmware-utils-86739f2b3ae9... | 1 
                   foot-1.16.2 | 1 
fs/cpio/cpio.mk:129: /home/... | 1 
fs/erofs/erofs.mk:47: /home... | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
               gocryptfs-2.3.2 | 1 
                host-go-1.22.3 | 1 
         host-libxcrypt-4.4.36 | 1 
               ipmitool-1_8_19 | 1 
                  ledmon-1.0.0 | 1 
                libglvnd-1.4.0 | 1 
                   libiio-0.25 | 1 
                   libnss-3.99 | 1 
              libopenssl-3.3.0 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.5 | 1 
                   linux-tools | 1 
         lttng-modules-2.13.10 | 1 
                    ncmpc-0.49 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
             stress-ng-0.17.07 | 1 
           uboot-tools-2021.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/16f8bdf9c1bfea0755d5b9ca6c8befd2e86da857 |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/bcffe4a84d9b4e47f2662219080d78840a97b9f4 |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/f6252959c13d473940f645242ebdb398d160a8c8 |     
  riscv32    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1721d3afcf0cf8b5c8fa831878b3502a85660bd1 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/8dc10fdf173621d0959bbef93454671ca30e376b |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/64e524591c9de71d5dc769453e0931d82943136d |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/b46a07325acc199bd0ceed626fefbdda2cae928c |     
 aarch64_be  |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/ae11d32f6f544b7e71b98fb036b9b741378ac423 | ORPH
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/378544a78e40f18e04e8f061cc264d455ce24c5e | ORPH
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/75e2e5b98548d6e1a9f79cb926576c3cba8ccdba | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/8a95c281ac7cb66c50f0e00761b5fce7a675f26d | ORPH
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/4ada781e7ed5fbf58cb87b0fc3aff91e55180ab9 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/80153acf66d0efa77c74d2e6e45b03005c06d41c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/385a7c301c2f159525766bfc26c73bce191a1b86 | ORPH
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.net/results/5edb2ae5fce2f373abdbc2aa862122558959daa2 | ORPH
    i686     |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/06d70e6f542b814234e820a835c4fa72ecad7c29 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/88c7a7a95d74a15245739513a089a59249308494 |     
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5e570d7e397a73f53bd49fe54bbbb21e652f1c67 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/715eb0e724973f81a5a9448f440b976c24a90082 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e46109b5b9fae2a9f38ebbe91bea7fb8577697aa |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8606616f9111e0d02f8fe12ff6aa032545de89f5 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ca1326feb8d97714672bbba516337a14627d4b94 |     
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/1521abe2fb4e6696e605c7f63c3468be6a525d5b |     
  mips64el   |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/957c68d142590e87abe11b4d1ee27f72142babda |     
   mipsel    | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/49efd450a1cc57a6ebbcfca77c1cc838b98dc395 |     
    arc      |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/02eef680f3a0130bf61707b79fa828053f295e58 |     
    arm      | fs/cpio/cpio.mk:129: /home/... | NOK | http://autobuild.buildroot.net/results/f6b617a040e224e4938fd5ab17f5a364aa4b29d1 |     
  sparc64    | fs/erofs/erofs.mk:47: /home... | NOK | http://autobuild.buildroot.net/results/f6a6a297870db12059d34b5d151b687add5b61f7 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/3d5510d8e932f4d5600a3dd0616f8f6e62cf88de |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/f2ed5950fbb9743bbab0c68c4e026a16a13e0f55 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/edba3b46d559199c16524c8f43c8f930455f449b |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/42fefdfbf5db349135b59df6b6734771800fd289 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/755fa96b56250d0467b2d5057eb165a17f5ccba2 | ORPH
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/02a9e2effabef3096ecfee3a4406a72a16101a7a |     
  mips64el   |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/be2684c9b920f7165a6fc3d5a3714880fd485d7d |     
  powerpc    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/7465e71478ae5f1a61aca0a5497b0dbfc8757bbe |     
   nios2     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/314ec027ead706d466e6d7c6dcf72ddd5f0a3b0a |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/28cb52adf9d2fa539591d917fbf72ab19c6285aa |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/728a1c17a95a5839647c0be340bf05a151d591de | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6d72fd3144ed977c45bc8e49b2ebdeb54e927b0c | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/79046a705db375c510678d8c18d36a9a80add0da | ORPH
   arceb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/da20243642ef120ab5e943b3004b91cabe57cca2 |     
  aarch64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/191544a38d3b72f3d02dac266dd278e140f4b99d |     
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/efa0a547cff95623be85c49f01243e334e66834e |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/089ad6464638d779f471cdc925da480642507c7c |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b252cb2248d9d379d137a02f426b9b996737bfc9 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ab0318b64e3efad86a992fff7c414a407c977bb7 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4ef745de5f7f588ff17f0ea05ffa12e6ed7de143 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/07678efe3fa2395413fc7c90652d0f9fa2c74219 |     
    i686     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/e7739f256dbc996f9eaa95da71c73c44c485d5c0 |     
    arm      |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/d535e03f6ee0f43ecea34fb29ea148a4cdc01169 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/1d622124ae4937fd011c6dd25cbd1a2c57ba3397 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4b739ce8c9b139cfea02234d7e787fda04bd3f28 |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/08f55ab42e137ccb7a887374db324ca19cb6af3d |     
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e558900e77b45037c11aaca2c8b4d1195561f49d |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/bcf185fc50282575a524c7e762a442265745f930 | ORPH
    arm      |          libiio-0.25           | NOK | http://autobuild.buildroot.net/results/f0ea07fe48d1592962c3d1b3afda7c658f2d194b |     
   mips64    |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/a5cec8541562b7070f93c9833e761d86d509c5da |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/ae6bcc1e48a4d1187c2663d7b288c5367200275c | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/74579b7432db79657c93d70d86e333dc1a74a8aa | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/140a4e7e4045bdd31beceba12d47e0d780762fd0 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9e67702c4ed8222964365503d3e83e4dd8b955d4 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fe0b2c2165d0b6c4c2c2204824157ba59acc0bf1 | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/7cfe30fc67e456099f82b6649f03ee44c0f8956d |     
   armeb     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/8399e32d15a07db6a4a11b4e1ce932e3ff209156 | ORPH
    sh4a     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/0b65a21cd38b422fe2039cc3a3858999225af084 | ORPH
    arc      |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/8b949852b795feb4dbfb044e768abe9b95bdafc6 | ORPH
   nios2     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/15d86b849194f89b260637eb88e0f0f41f63e29f | ORPH
  riscv64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9a06b2c1d96b0aabf435e86374ee6c382190ccb5 | ORPH
   sparc     |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/932098c8278f1087a949d0523eb8e6854504c586 |     
    arm      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/a4e3d2395e1ffe92db4aeaa41c8b19283f1e2794 |     
  powerpc    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/eb3e2ca9d015450af682f1ae8fb76f9f1c2c7d2b | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/30b67a6fea0601fada42f58e35fa9f312d565826 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/2475ec7a7eec5dce45ca769055e03cec42d595da |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/99cd19836279c5b1b29c2131f79340b6b2cc3cc5 |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/cb54a9dc0024dc8c565009af1e5dff62d16ba0fd |     
  powerpc    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/7088ee185e13d4a4113a8ec8d5272486a1f1dbf0 | ORPH
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/538b9e50e020c8906542328d2807cb29902270ed |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/2c513bb6f1300f676def499559b8e373c9829910 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  clang-15.0.3 | 1 
                 highway-1.1.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                    mpv-0.35.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/5635532699ac7009bbead71f05c4052d887cab94 |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/3392bb70ab801d17a363f6998c4d1fe6e95ebd9e |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/28e1d9036ce756e1962017cdeda51971337a9db1 | ORPH
  aarch64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/b1a4d2a92a734c8233e4da9fc7f6dbfa147251d4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
