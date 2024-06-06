Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5524AC25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 04:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9874940217;
	Thu,  6 Jun 2024 04:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDNJU1rClpEZ; Thu,  6 Jun 2024 04:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743A8401C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743A8401C3;
	Thu,  6 Jun 2024 04:04:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D485A1BF2EB
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 04:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B791D401C2
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 04:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kc5pMzBAXyxE for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 04:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7E48401B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7E48401B8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7E48401B8
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 04:04:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2CEEFF807
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 04:04:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 06 Jun 2024 04:04:03 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717646644; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=08gskeUiUeYl4E8gFplbuxXRdGFLDl4bJP+R+Yqu6Do=;
 b=R/a6CA/zUlC6/zftiGm0j0hJXO7gUvIbyV89NFfPXbBqaTQOG3p56Wp1NncSNkLH3JzFmR
 KGso5RqY1g696MzJ1mpGbmpd18LUsKGMzP7fQc0gW4/ylc9dub07UEJuN01hmObknChm4y
 Ok0P9KVM7dy0xI6y53oGCn1Z401poIBAJVhOFP8jQypYLUFwoKdjGij9VFRvXsp+alb3CY
 amN7xjcOkuTPLp7k4YSNdE0gvW4aFex6ctW8Rio6qDqcfAEiiy17IZF7SFRFNAik+Jn63H
 OhXruuY0ydPkhvXDLjV/JPxPOCdH67sNlAZaQDRmdBOYo3mAtpWrDman/jxCsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R/a6CA/z
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-05
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
Message-ID: <20240606040403.FY0Pnq_RTQcwg25S1Vw3wntgJYizvXXDpQbTVaYY_os@z>

Hello,

Autobuild statistics for 2024-06-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 10  |  5  |  0  | 15  |
    master   | 79  | 264 |  0  | 343 |

Classification of failures by reason for master
-----------------------------------------------

            host-cdrkit-1.1.11 | 28
host-prelink-cross-a853a5d7... | 26
                host-odb-2.4.0 | 12
                libressl-3.8.4 | 12
      host-riscv-isa-sim-1.1.0 | 11
ibm-sw-tpm2-5452af422edeff7... | 10
                    mpir-3.0.0 | 10
                elfutils-0.189 | 9 
        host-python-lxml-5.1.0 | 9 
                fail2ban-1.0.2 | 7 
                  ffmpeg-6.1.1 | 5 
glibc-2.39-5-ge0910f1d3278f... | 5 
host-android-tools-4.2.2+gi... | 5 
                       unknown | 5 
host-heimdal-f4faaeaba371ff... | 4 
host-vboot-utils-bbdd62f9b0... | 4 
                  libffi-3.4.6 | 4 
check-11970a7e112dfe243a2e6... | 3 
                 coreutils-9.3 | 3 
                gnu-efi-3.0.18 | 3 
          libcamera-apps-1.2.1 | 3 
              libopenssl-3.3.0 | 3 
                 openssh-9.7p1 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
android-tools-4.2.2+git2013... | 2 
                    attr-2.5.2 | 2 
brcm-patchram-plus-95b7b691... | 2 
                 cdrkit-1.1.11 | 2 
                 dc3dd-7.2.641 | 2 
         host-libxcrypt-4.4.36 | 2 
 host-softether-4.30-9700-beta | 2 
               lightning-2.2.3 | 2 
               lighttpd-1.4.76 | 2 
                memtest86-6.20 | 2 
                opencv3-3.4.19 | 2 
               pulseaudio-17.0 | 2 
             sofia-sip-1.13.17 | 2 
             strongswan-5.9.13 | 2 
                 uclibc-1.0.48 | 2 
          alsa-plugins-1.2.7.1 | 1 
                  assimp-5.3.1 | 1 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
                     crun-1.12 | 1 
             docker-cli-26.0.2 | 1 
                   duma-2.5.21 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                     faifa-0.1 | 1 
                flannel-0.25.2 | 1 
                   foot-1.16.2 | 1 
               freeipmi-1.6.14 | 1 
                    frotz-2.54 | 1 
                     frr-8.5.4 | 1 
                    gdal-3.8.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
                 gnuplot-6.0.0 | 1 
google-breakpad-f49c2f1a202... | 1 
             host-delve-1.22.1 | 1 
         host-gcc-final-13.3.0 | 1 
         host-gcc-final-14.1.0 | 1 
                host-go-1.22.4 | 1 
igt-gpu-tools-0ee4074685c1e... | 1 
               ipmitool-1_8_19 | 1 
ivi-homescreen-5ab78a19e95c... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
              libarchive-3.7.4 | 1 
                libdrm-2.4.120 | 1 
                libgeos-3.12.1 | 1 
               libglib2-2.76.1 | 1 
               libsigsegv-2.14 | 1 
               libunwind-1.8.1 | 1 
               libvorbis-1.3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.8.12 | 1 
                   linux-tools | 1 
                 logsurfer-1.8 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                    ncmpc-0.49 | 1 
   openvmtools-11.3.5-18557794 | 1 
                     php-8.3.7 | 1 
                  prboom-2.5.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
               syslog-ng-4.7.1 | 1 
ulog-0389d243352255f6182326... | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/26c47a16267ea3d11e0c59e545693ad419f4d2f6 | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/985593e5ffec62e76c5d776f49022c5b2cbbdfda | ORPH
   sh4eb     |      alsa-plugins-1.2.7.1      | NOK | http://autobuild.buildroot.net/results/7a40dc37f454419bb690c94b03a5a2e7513e950d |     
  powerpc    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b880f13787593bb250017badf2da27a7e58b4514 |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/18853637c2fb6f607d1c81860d0fe96fdbd3907d |     
microblazeel |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/59ff82547fbf5811f7fcf8ecc8e4953d52facdbe | ORPH
   mipsel    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/7c30d137f0b7e17c30db01be40c1cd0ce96666c2 |     
   x86_64    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/bb8912d00aa3f9e3b59bba9975f7332b41a5f5b6 |     
   armeb     |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/9f3a5a2682b2ab7ee56b356ebdeba6500c8a5ef9 | ORPH
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/397d84c24dea724dca92a82be60ef905d8622d26 | ORPH
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b4f94055631384ba4f1bee23be62041967897ef1 |     
    sh4      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/9b8a0049382789ea1735cf18f91ea01f2e53ed39 |     
 powerpc64   | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/2aa229be6c587004fed5029a3e4b72ba83718496 |     
 microblaze  | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/267972187e530de0183df91fead0e12c7c16073c |     
 aarch64_be  |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/68c33e07afe841b9cc9b450c2538958e24095dd0 |     
   mipsel    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/793e6efcb603d4579f6346a0d520b72946dc8a22 |     
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/423e3e9696c9fab9e2d43981c47af2edaa2435de | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3d582ef66d610e9e7970aebcb6858722cd2fbb70 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7854bea3a3b8edc6576df2eb1848cdb7abd142c8 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/aa87ac864775160e5a055924d04f04e2055ab45a | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/190814783dadc96621bb9a48e4910c4f635bacd7 | ORPH
 aarch64_be  |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e3bf3f506a171e0db6125e764a871d70e1330e6c | ORPH
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/1231765847e28c2b3882c577f4c97e62402ef0f0 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b7481df62f70d2eeb03357e6f70ef43e505af0bd | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3869f185efbe54106f556855ca5b4e24f1b83c6b | ORPH
    arm      |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/32e3dfcdb0cbdb0f8fbb789cf858635586b09da5 |     
 aarch64_be  |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/681095626154b39ebf6415937a83be67e9116895 | ORPH
   x86_64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/5dd5546ba4d3088a9ce0c8dde8eba893d95643f6 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/649e1656187494c2de3f39d8e80c79827f2e51c9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3184cd95f9dfea68d61124bf091118a9f724addc | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3efb26569bafa17c92aeddbaae1b13cd62963999 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a3a0a8b8df159a672daac4c599dbe15d791a2068 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0ed917f36051689022d0981e805ef3aafff1c39e | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/330e9a6ebf94d07cf887d9dc24ddac166fd6cf48 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f0105e2047a6cc90aa8783da7cb21ece74e3e735 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e4311941f986a2620dad8f79fce4ef90143fcf5b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d696291912e3e25301bc76d9c10b797ade473712 | ORPH
  sparc64    |           faifa-0.1            | NOK | http://autobuild.buildroot.net/results/17dbc23a3c81a92aa59a86452a2c0247b58b6224 | ORPH
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/61fcc9602bd3b784ca23a549865cb80640bac158 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/548f27f2788d991e55ff3b755ebf74a18a135c63 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4f7ddf60e280587ec4b5e2cc64f704c4d7c27557 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8c99788b022db091b93eb0772beeca97f98c9c63 |     
    sh4      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ec0b701f4b9e9f8e07a2b4c4d00af946722aca33 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f170b97ce1f487f6ba2c30a7c1217f41e11eda4d |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/256ccd9934f3bf1d897bf53904fb4f6fb559a822 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c584c3808efcd7ac3c0abe5ebd0d5dd2809b05f0 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5e4fa9b3673b4c7c742d145a2779831b899cae2e |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5770d2c4af2b060d28d42a634d06e2c8068de7e3 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/05603adf0fa010c6b7ed4d4ed228475680e5c531 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e7bfc3d9f2b1ff61605314c18295aa5c1f43d105 |     
  aarch64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/099aa8a2534b27cf975651e781bd4a43a0fee9d6 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/46aeae1d8e88ad4268d909e9964fba420f705015 |     
   sparc     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/80dd2153f0bbb5089b718b940c81b59287403439 |     
   armeb     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/cbafaeb418adf5dabdf93ad6d34b34dbf3ed55f5 |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/812ef2d1d47a010aa2101fc6a24f14972959421b |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/ac313d849077fc1262c53c8b9ab15ff62d3ab7dd |     
    or1k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/bda1f8e04f5bc6b62db8b8278a9f342fa69d464d | ORPH
   x86_64    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/93fba8d8edfcded5b4e9fb4252685a3c57065757 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/dc94dd7b44b3ad3a96534cc8f3518086058848ef |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/dfb650daeb331fe74c4c491c7febf4ffffd7b32b |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/95a6e49da4672051f6ecda504de71a1f6f8e923c |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/3a0b28e1e962b4a378cfb52a2e4f9d55241a320e |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a8e72304861237f8f3995e13d772cea56c40fcab |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2ca1f1ddb72039dbe4dff33ac01cc5fed00065de |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/23bc9ed3552c616cec7980bbd96769d9c1af8841 |     
   mips64    |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/afa07fcb6c6c61885843d93259120c24ec536256 |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/ebe9ebe4da11916ad4bb2da1544093ed2d240d1e |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/fb4142e3fdaa965b54798e1f0a35b7c74926708d |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7e97d5940f35dbb9884610cfc1804334ef175756 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/2a24901142b189a40af20e3963d5a9675d2a47e8 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3858160b1cceb09fb59ba3cdd7c5d1b33a2f4de9 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/547c41aebdf22568cbe7232a1fb4f906d36f1f3f |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fce2f7e35872b72a3be333363892579f2813561a |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/df7fe9c28f0783334598def95d19e83096598ea9 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3a657ce6949f17ed3a2dd23e07e46431872e2504 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ce8d26b407ad95a48bfefed92f82e42e0fa041ef |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7d142a1159ec02e73ff89c008c42567459b27d71 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/db86777915c4b8d030dc4f27e0822c491f27433a |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d4f946bef5adcd83a4a36ee5621fb4109e63ff27 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aeb1cba73b278798771ee2a97968bd5099debf85 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/81a1b761439fd0804c193ba4ec73d128401becf4 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/38ed317a68cbd197fc493a9ebe9df98d87a2009f |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/84b085d3d88ba76fd6b8b902f6b986988b2fb1c0 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/215f57d97ff0b2479e6fd8ecab973ed8c5073cef |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a2d8ba8295ff9337db97dcac4498735b53c0366c |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f2a071a4b5dc48f23d60eae7fbd3b8f0184ded09 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/41f2dd37291a402aeceea62d9eede86cc1fce9f1 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f1f84928ca1b52c6647233096a12f12700105676 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b990fe8c9ac5a33891e6161dfd6e4385a0ba4f94 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cdaf59adb02138bea0b69ecfc920cf5e277f9e73 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4f6dbd5c9e1b3685a3a57244a761689f412c30f8 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a31149f982502054bb5c1ba63f50e2aae2afebef |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4a07cdf79f5688efc937815d996ddb4668e2102e |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b6396ed61473f095d14896368c118221a4292386 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b1569fcbb700dea574e1e510ceacd33fe51f4d0d |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e4578f26931637994bcff5cecd96947b16880714 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/914ede316ee54a50ca3b2d5e5a6b787e8029559a |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3b17ac9bde544d4da44ee9cf04fff93abfe1c47f |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/487878f3ae9f9a40b43a286513014e09f5c9e6b6 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c354db5e5cd7ce432232cdb6d03729bc3ec5caea |     
    arm      |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/f8c5b04927f5579908eabbf835a42d356e2f4f96 |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/6d672b16f59f5a34351bc50521ef9004edd837d8 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/d7a695cfbf5a14602a10dfe5426599aeadb3419f |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/e326428e9a21033eaca54f4d5646b91fb776ba67 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2891119a24af043ab99a31bb1c700e5ac8ec5d1b | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ff6c6aafc0f0d64d42c9cc49995f677ed34ba6cb | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b19fbafc63073a756a7b6422e537c84db604755c | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f2d73e1790727ed0840fbb666a880dffd76b4737 | ORPH
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b6852901714d0cf07f536df48b9fbba1559a4b00 |     
microblazeel |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/e2b015642a6a7e04dbf110ff3e330c5d17a5f0b7 |     
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cfaa8c1ee8fdbc6e26428b077cc5ba7ac98288b7 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/518bfafcbcc308ee727e4909fa5d0233bdbcbae1 | ORPH
    sh4      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5398213883296831df7c4a71067c98f1e5b2e0d1 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a3c7cb52d4a9f62db5d3d3bc4c71e24164db36cd | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/574fce10acf82d64d5eeac54689163fe219d5ab2 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f658ae522a31086628c5d8c6b4f7d7e71030cd72 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/05116eb0321dbc7f9692fd8d1c0412e64dd4c447 | ORPH
    sh4      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/098df3028abc2949ecc438d41a7bbeeae94e2eba | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/12ee742a852d9a231bd771094558d60266f9390f | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5cc7d3f2a83c21e9c7ff416832ba368c12901852 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/07f3ec21c5261460d1fe128134ef160f3649a4fb | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/25c539d24ad5a44ba8ae5b426c5f91cac1dac5a3 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c46bc1d518073da1ac4b1cecd678b2c7167ea287 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/80b7a9824cb942b002b50b2ae5e3053c10c4e599 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d960b6dfc377ed364ecc62f59bda4a37c5f9aabb | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1ceabc05875d90a3cb1735d658d78470c36d1273 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2486cc3fb3ac01a0883ccc358f4f44b212eb91d2 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1c12159505748898b50ae51acb0d35821bcdd67c | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/797ae86fc49f814a59ffb0ed745397a63a15e001 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/12e6e59288f9e9a1373c02c3be8a1e8943d749b7 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/be5d3f668b337ec6bc37886d8db5492f88c06c8e | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/550c049b2015e75b768a4579c5e94bcaa11d98cc | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/84035b12dfec4223e04055ce062710dbe481a633 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/05709a293c59a08cb4eeca75f871b4d82c9863f7 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/69b7e5d093a85d48d7bd0faa29f420f010fc2d95 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a840cb8ea39ea6697d1178eae1004393246473f3 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6a3e2309a3a384339f080aecb4e3628690171971 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fefb465fe07c1cb577be3c3186a6b93ca2888cea | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7436dbc07a76e9bea95c21ef2130e4d2923cf8d1 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e359adfe475cb2b22b5f55f46698acbbb03ac43a | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2a927c12ddb90333c1a844c3f29b31197b6e3648 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/66a69bf338e9f98eefd903d60ee443d334efe09a | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4a12418e556d0f55ebebfe5c9b481216a980fe42 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f5e3e476ebb6e4abe331f1b18b32d7ac648d98bd | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3f9eedf643a59baf8cca0227aca2368db43354dc | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/421cf9834d9e549ebf642f8b8c55bca831167636 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/552bb2fb0059c5fbb06a52a0fc528d8ea4f43461 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/541474dce2e542f003e36491ff2a814344ab5130 | ORPH
    or1k     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/2f4116365db169a942a475d037a362bf2ad042a2 |     
    or1k     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/cb1e848e555a3a48fd10e6e9a65a7bd2cc1e8d5c |     
    i686     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/d3b3cd3aaced0a7cd246d864f3519d7b75838c87 |     
powerpc64le  |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/6d4cf2f684351ebec390d7b8e8b15957c664ec59 |     
    mips     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/4584e5b3f43d966644f7b2f398cd9a9f023b630d |     
  mips64el   |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/99c28a0b0bf0fd20b02289d7a73c5c2f7664778e |     
 microblaze  |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/e539e155014959578637e377761dce59355ef9ee |     
    mips     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/6b471a704c3d2539e22e825fd5840bdeca792ce2 |     
   xtensa    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/4257a95d552c66ba2e08e99ba882940042208ab6 |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/12e8ffb4c15ba7457a6e93fc78a6448900401b0a |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8f7af728f31128f805048fa66166c8b5b0344a3f |     
powerpc64le  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8bfe7afb33028429ca289754d06f7a31a3779dc7 |     
    i686     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4a4e36d71ebbf2b3d73843487e569502352df649 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/90bd8636c4abab967b11e45d16d30926f46c1d04 |     
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/3ab2c0f94eacc6e3dcbd7a5d96dfd66cb58feee1 |     
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/aa4e61c23a757ebdb055164d345df2e4d6a6f718 |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/3edaab2b05d997d819e26727d387746eef03c47d |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e4ef60bbb497bf184c0bbd49facb823db2f3e470 |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5f9d08cbc37d8eeaf8040acce3290d30145a3718 |     
    mips     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6bd9135fecfffd9d702fc0a50955cef98ab4a2eb |     
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/b1f8dd99a594e456925cfb1ba0875e0573e9ae81 | ORPH
   mips64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/fc590c6a7039cc1fb4ba7be4d69a9596eeebd6a1 | ORPH
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3cc483439d943eddd94bc0497f2a03419a19947b |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/10f2fdc7df616250464e3076629cfb0ca73172d2 |     
   sh4eb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ddddea9f5577b5b23ed8e9d54b20c6dc196e0404 |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/26b5c638897d70ae330b4b9d9b4e09b801ad5659 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5c47086b86b6a93858ed2bf1bca2c1d3cb881a7a |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4ed6067780fa79c5f71bc6b01f822330973dc971 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ebf73664dabb109598cc772ffe9ecec1c2593069 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1d75a53346c140c8e73609a1bf1f00ecd8fb2b72 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f2f40aa87f8959e8d46db9f49432271345f5eba7 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/fa3e1c8fe0e9eb854ad9c15a5d12b2ef4014a796 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/758fb3887eff1890de1c9d398ebfe05d95bae773 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b0983897a7665cf1f416b3668df792e7d73feea7 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b637676fd66bbe405a7150c28a5b4d5910904264 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/16228cfcf82193b642e4ed5caab55bdf9b536f1d |     
   armeb     | igt-gpu-tools-0ee4074685c1e... | NOK | http://autobuild.buildroot.net/results/682d99aceaf3da79ee83fcc9f3f50afb4c83de93 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/5e54c7f547c7c0d445b5b8cd58af62e57d98e2d6 |     
    arm      | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/f4661202af659d1ec95e9459718ba317bdd0e88d |     
  riscv64    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/fbc1097d0ee2c0463fcff03f22ecc817794c8d08 | ORPH
  aarch64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/403b3d12f20c7ccec723878460e4d7aba920c1e1 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/c464541c1cc41093ea1c3750ebee70e359159161 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e9ced5389067767d17558d99fa94c4e3c43b63f2 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3d5bcbad295c5922511f41f6b9397be749c5422c |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.net/results/d7e5648c68a19050a363e580b6d26f6d0e2269c5 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/92f15dcb65eead5570296172b5d80ceffc301f6a |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6f2cff9d2b637b6a0c7da51db765de17449a430d |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e55b6fb9b0e79fb914f20a997e998da65fa0b4d8 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/4ba5edbc944839e11d2743a1898459873d12dfa3 |     
    or1k     |         libgeos-3.12.1         | NOK | http://autobuild.buildroot.net/results/16073efdf8f9221342622b2e2e4107a3821c00cd |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/586758dff5200357dc5a45c6b95d5f6c866884e4 |     
microblazeel |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/eb2af59b935982048d809f7c3f96c196e86f9c1c | ORPH
 microblaze  |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/db41ede67191ea253b5e80e4a72b63ca2fbc96c6 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/8feac78ccb492d9ef14b239cd84044db54473d37 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0e1bac3792351bdeeb8df68b8048ea3ec7e22d3d | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d21326c8f14167eb7f1eb2e4a7e9089f9ec54ae9 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3478b78ec3918df2b805c472e99f8912c35a03a7 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ee6021416f08d62fe8356fd05c6c693df9d6e1c6 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cc7f8f31946214bedd6d65ec1a747612a12aabb8 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ba4a1d1e4640f5ce37d52897874ba1afcd1ff24d | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cc3b112a4227a6d7a053ba781b74b5dc07b90d3d | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d1fb78e0785599ba7923b9bee3f3828146a1ccbc | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8a9d2d74979dd20e074f98e41a43e426a9cee520 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7ee1839042d5e538440a9217abd86e7cf7521b4d | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2ca22b1540d8a7839ba12c2a4cc6bf52de74492f | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/db27e3059fb5f674237c514c17c556218dbd23d8 | ORPH
   arceb     |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/c98be2a2baf2ea2b2d3689827885eb9f896c03be |     
   mipsel    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/164cacbfb864feef38a493786363f9921c653bff | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/2f0af12a81950a6992f770d0a6a3b9ef12a524e2 |     
  mips64el   |        lightning-2.2.3         | NOK | http://autobuild.buildroot.net/results/177fc01857a6860cef1c1d0179c86b301492ee82 |     
  mips64el   |        lightning-2.2.3         | NOK | http://autobuild.buildroot.net/results/dcf67debdda2b82d72866b4d1556af7ad11843c1 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/02227cd30151e13bf0bbacb5eea69d6c9f4f72c0 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/3f739830b07de46fb7de2bdac0119c8537926f9d | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/87e4c8fe9251b019727555e9d4db09f67c184895 | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/657e49a9323abcc421b3fc657c4b54ad85956871 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/b0250e9aaba634a78513a89c0441d49aeb850dcd | ORPH
   nios2     |         logsurfer-1.8          | NOK | http://autobuild.buildroot.net/results/2567004559ca434ade5496d1b209c259089dedec |     
  aarch64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/15f739403293c4143253f7e4345a44d99b082093 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/964214aaf8224a3a03f28cbfb3bf3adcb8ac5543 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/cdd71dad291194687533ecc2ca2f7a7a2125a522 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/206d5aa5ca4bfa494b313470e1de851aaa877e6e |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9a17c089994737b9c11a37ab50267a2afaf522ec |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d8f65eb6c724fbaad872b711017c5f1dd11e4d26 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a2f89c86f53169c165bce35eff1e4bc84880e74b |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1d88395de4906f61dc26061470288c988df9f0af |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7e4028c38816b90fde268be510fca28bfac984bf |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c744e3a602807ae90b9243b74b076576ee2007f8 |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5619571c85cdbceec6e15261b6bcd04a0d72e6fd |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4a424e908ebfdc9670fa885ba73b39a03f1f5c2b |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/969b1e5cf818f24cb1d64bfa7c32d064a49b3fe3 |     
    sh4      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/19bed3421793dba0fc3091a144ccb027713d3c0b |     
    sh4      |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/fe99a3bd7002ec13d9392b28b0cfdc590ea3f351 |     
    or1k     |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/6c53fcc1d863da4e853d531988dc1f8e8bec9b8c |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/9df17bef8674ee77941f387e529e314053dcaa22 | ORPH
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/87420f46a02004e309dd5a80907ebe49da9d2651 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/7ea0c50271ecdb58e8aa6bc48f8f78bfee86cc37 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/231c54db0fbf21cd9cea165bacb3b39989b1df97 |     
    i686     |           php-8.3.7            | NOK | http://autobuild.buildroot.net/results/94644abed4b2f271e3914a0bbdfb64c090dc0b0e |     
  riscv64    |          prboom-2.5.0          | NOK | http://autobuild.buildroot.net/results/ae1a6730a03dd5e3a2f2ecae4ad4f954c92f4aeb | ORPH
    i686     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/39e4118cb715c9910a4b3c663eac2ec1d16c29b6 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/0ab560c5821c3b17bc4b17f01a9deb7d94ad19f9 | ORPH
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/4bc1829ca5d878508dfecd71f517ad6a9887c928 |     
 microblaze  |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/b8c94bbed2c201716dda1844854ae8bd2a7d8340 |     
   mipsel    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/33b85b0754e3e78fb632211340302292b31bbb7c |     
    i686     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/a4a7b5e4f288df21eaf8ad5d7f37125546a0707d |     
  aarch64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/03cf6dfaae46a185bc225be423ed1e838e70a8f8 |     
 powerpc64   |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/4340ca3ebb64d39674831695dd6488acc758ba76 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/7ff99c2f9fd655b4818ac9a1dd6f10dae9b7da90 |     
   xtensa    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/aed0fd627631a15584e43e203a61842f1e3a0e8d |     
   armeb     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/03e3714cce0fa8a6fb37c93a28ac08e24206f0b2 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d6e3566890540bef9c788be5a56ba8e5203ba9bf |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/d27ef56918777502f4ee60e7cdda8c865b544292 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5ed1e85a6c84bd0a7f44ce568634aef84d76c329 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/55f802dede88291b32dcf7f58e6a6529624a1024 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/eb2eedf6a93b6d5be0bf3761f706dddb7c61ed13 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b88aa38c3acbac3debc960fe910c453bae2d87e1 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
  gobject-introspection-1.76.1 | 1 
                 highway-1.1.0 | 1 
                   libnss-3.97 | 1 
          python-grpcio-1.60.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f0a4d5c564e6a81c8a64aa6cfa1a0c19ab5ba082 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/694d757395d28f6e0afa15dace408e4edb4d9e56 | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/dfcf7bc4226c729ded29f2c1fdf9089a4ea577a4 |     
  aarch64    |          libnss-3.97           | NOK | http://autobuild.buildroot.net/results/ed2fbe60afb9833054c7a2283d40511f14066ccf |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/fc28924b83ebb9eb585d67c0c89a188ce1f52f1c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
