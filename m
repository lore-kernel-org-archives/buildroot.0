Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE636C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 03:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385F26058D;
	Tue, 21 May 2024 03:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWMXNomH9cVh; Tue, 21 May 2024 03:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C89CF605B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C89CF605B3;
	Tue, 21 May 2024 03:59:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7271C4F11
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 03:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 956AE401D5
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 03:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trw_Marey8j6 for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 03:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C422840106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C422840106
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C422840106
 for <buildroot@buildroot.org>; Tue, 21 May 2024 03:58:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7354F1BF205
 for <buildroot@buildroot.org>; Tue, 21 May 2024 03:58:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 03:58:54 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716263934; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t2NWmXOZhyK1a3gdub9UT9H+kJ+0vihdzJEY0qPbdQg=;
 b=X+CBGJlhtrA5YiQqHp5Qr8Mwf0jdJxptazKr8TBhEgDAjQ/y/3DDYesYyczARgfvQ2Ac0n
 lW8e65gOngnQQEwY0bBUVMbaY2ozmsDTKqq6h6GIt7TwbSkw170EvLO/CDEXf+oZvonf6u
 p6xMGg7TK7vOZVq5qaGVN9uJbt6ge0jOIVUF0SteYCg2DI7csBx4rDvFnTno6H+SiYceg6
 vwHhdLgjbbp1wk4LB20xFqpYYBXxpR4+y5D7RIAJzNST4RPRMw1S6Lei+m7aGnvPU1W0tV
 yroYRqApHRAnhm1NjQewIdKwsRKCf4RkVXrETZx2UcesyXCfXvnu3rWBTUZYbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X+CBGJlh
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-20
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
Message-ID: <20240521035854.kePT0X47i1y0NBL-StqVmYwI-pMVY5FGwOr3fjuQGPM@z>

Hello,

Autobuild statistics for 2024-05-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  9  |  0  | 17  |
    master   | 26  | 51  |  1  | 78  |

Classification of failures by reason for master
-----------------------------------------------

                 coreutils-9.3 | 5 
                  ffmpeg-6.1.1 | 4 
          libcamera-apps-1.2.1 | 4 
                       unknown | 3 
                    bcc-0.29.1 | 2 
             containerd-1.7.14 | 2 
                    fcft-3.1.6 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
                  jack2-1.9.22 | 2 
                 openssh-9.7p1 | 2 
                    bat-0.24.0 | 1 
             cni-plugins-1.3.0 | 1 
                    eza-0.18.8 | 1 
                fail2ban-1.0.2 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
         gobject-introspection | 1 
      gst1-plugins-base-1.22.9 | 1 
                 highway-1.1.0 | 1 
        host-sentry-cli-2.20.3 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
              libopenssl-3.3.0 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
           libzenoh-c-0.11.0.2 | 1 
               lighttpd-1.4.76 | 1 
                   lmdb-0.9.31 | 1 
                     lxc-5.0.3 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                    proj-9.3.0 | 1 
         python-remi-2022.7.27 | 1 
                 shadow-4.14.5 | 1 
ulog-0389d243352255f6182326... | 1 
                ustreamer-6.11 | 1 
                 wolfssl-5.7.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/ac18704153f78b057fd95b8626d034d8c59a203d |     
    arm      |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/dd74efe84ee0651f50fc583b602803cea1c6e0bb |     
    arm      |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/3cf51d81510ba7c2112cb70ae15f9f8dbcd7fe52 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/49617b6ed28bed464f3963b1d04a3a1d34567065 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/bd829d3bde595064e7254de6d3ab2d2295ccf4b5 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/fbd39a95d5fea7cb652b29648fd494e924b1d264 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4c28d5d88132f03fc4a9e004aee4821b91629f39 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fce1c4b2b0ed64d6226b8e495f9667f79f90d1c2 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b823340007198f4185ac9ded665f48f81fb9e2b3 | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6f1ed4b00423059c46a9b8e0ad8fdc2c922d2af1 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/86d7dfc854d9dfa2b48ca6d9514a5c6543d3b481 | ORPH
   x86_64    |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/cee1ea223bb7e43a79ac6e616d3332c53d958d79 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2a1fc78930422cf61ec6af89c08a1eade3f13a0a |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/8066ad736b8c08fe52c3dda0dd21972bb360c775 |     
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/f3bcce52fb35c3897866c9535f9f15f5c3241fac |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a354db9042d3fe86cadbeb7b9492adb2f796ba75 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c7d1de888fe66097f71787912c3e2fbf7f5f11f7 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8be4056e57c9f89211309ab2ce4311b3d0c4a010 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9d77525c09200e35a97e2a282d60df2eb6238bdf |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/9451bd8a75cbf4339326916a9cd02021f1dd404a |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1196ac0bf1636d46d020f8b98b3ac561c147abe5 |     
   sparc     |    gst1-plugins-base-1.22.9    | NOK | http://autobuild.buildroot.net/results/331ca25ec34669f788deec3126ab792aa906d309 | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/c550e1b61ef4ef909c4d9192b06540dbfbabbbfd |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1c0b4d5cdfe76fcc8fd42f50a7a44870aadf21d2 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9cdddca1e561a943d10b187e5468eb45533d3f6b |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/34eb42f0a8b3336885b4e7c0355f5086df12906d |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/09908bd07ea11e3c4728f080b37011e253fe495a |     
   xtensa    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/c2e193fb9ae3c64b8e6293319e52e35f4a1dc044 |     
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/6db833326f2afd15d5f348fdf1bbc1fcde3af98a | ORPH
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/314c8d7c8a62e0c60851e30cf0c57a44ebabaf01 |     
   nios2     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3eb80fcab7c0b01adf246529d50a6779df325fb1 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/49925284dae22b9049dc6a7f0c33bdc7686b4d73 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/a797a028627d8845bbaca67805fbedc314528e00 |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/6160f9180ca62ad10b30ed4f100461c476bf8574 | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/580cf5cd95055dc0cacab2b8cf8e7d7ae1cdc2ff | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/6bab97ab29fd471b120353461261446083ffd4a7 |     
  sparc64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/c0f10097667263988d846bedd53609f89fbb2595 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/5bbf62a1aef1489341191d434ff4325fe10b3dff | ORPH
 powerpc64   |          lmdb-0.9.31           | NOK | http://autobuild.buildroot.net/results/d67c5a99b7d58826e544f1210fa36bb3bc180739 |     
  aarch64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/94d0fef4e4d6f2792363d6fd868af27efdca73e7 |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/24853c71dff8cd66e46531b94c5b206f26a83e39 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/8285af1a4dabd7cd31bed76b6bc753971b883531 | ORPH
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/ca62bd7707409928f7d571f732f46ff94a4fb339 | ORPH
   nios2     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/eb36e27c90e6f1177a6b2feec4601451d0538f56 |     
   x86_64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/81c67b9b648eb2c02983884b0478f11e32c445e8 |     
    arm      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/fef633380f161ba663af881afb50d2f94437b56a |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1d626a36f94b0a7beb10b98358f5f4510d3a61d7 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2570f72808bbe18818fb0d6877a2000cbee3dc2e |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/3d3db7dd923910d0c0ce53dba72d63c6c75dd777 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ea8dc04a51ac758d79fc92a0d14ed21cb51fec8c |     
 aarch64_be  |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/f7827a3c30d578dd870783526c125fc6ff17d172 |     
  mips64el   |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/32937e436fa19aad03d0f660042ac887b7fe2267 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                 coreutils-9.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
ivi-homescreen-5ab78a19e95c... | 1 
          libcamera-apps-1.2.1 | 1 
                    mpv-0.35.1 | 1 
           python-numpy-1.25.0 | 1 
                       unknown | 1 
                 wavemon-0.9.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/10e67f3ea3df26c59204c6bbbde162b56170d932 |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/dc5475500be78d604483ac36782d2bb152ff3cd0 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/9e432a58849e89175c8d62152484fb45f170a70c | ORPH
  aarch64    | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/5eeccb7a2857029fd891ecad2b812eb2ba5debb9 |     
    arc      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/aa698bef21462f939c1056fd17d84a6eeb7ee385 |     
  aarch64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/139526612c413a472b0fe62aaad9de07849f3bc7 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/35c581381132fff29e5e4220382d9c97f73a223f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1c2ab977f9541312bcb64c852c7c51e62321a309 |     
   nios2     |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/fc78ca9cc233982b8838809f4a97b7eb63eb5f89 | ORPH


Gitlab CI results for 2024-05-20
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691109  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888693932  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888693944  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691219  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691508  | ORPH 
    TestPythonPy3MlDtypes | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691520  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691573  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691840  | ORPH 
        TestRustVendoring | https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691849  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
