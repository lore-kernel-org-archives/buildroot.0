Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA9DCD11C2
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 03:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B98A082181;
	Fri,  5 Apr 2024 03:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpVsHBQlR2k9; Fri,  5 Apr 2024 03:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDFF82174
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEDFF82174;
	Fri,  5 Apr 2024 03:56:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FA6E1BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 03:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1067440130
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 03:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooq0LsSdW0Hh for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 03:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2AD340129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2AD340129
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2AD340129
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 03:56:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C561C0007
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 03:56:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 05 Apr 2024 03:56:48 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712289408; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F7X5d5cAO1jeUmEJsn1oeF7aoDeblue7Os4QX3BervY=;
 b=gQwdItQxLWPxjl+flfseclrxTBgTxVXx3sbUTjW5MzaGwS5MxN2CPJ2VGxyVP8quoVXNKm
 pwlnobZQAN5GnOF0r3DMzSVavR4GwH2UO6tCG9z0O3ahjc6rJDobd7a867/ls2B74wbLA6
 unngbV8vTnANqeNaWlXzwI7RLdanxpQgunruUSDKQxYUYx/t44FRPxlhQRwUi9vDjy3MWq
 icRJCN6WW33vdma95vt48BOqNbTW2a80sijg6FANQH4rMiXkPcgZaZrZtAVE7eryC5OeFS
 syASJVAFXch/6Rhod5jwUvRCVVqeXJu0D9YDx6wlFgNDv+Rv2EB5ICe2bhRH8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gQwdItQx
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-04
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
Message-ID: <20240405035648.CJFlaZsqNxBFPpXgwacsxSkZsFsRYSwUUcVOFMPLNT0@z>

Hello,

Autobuild statistics for 2024-04-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  9  |  0  | 17  |
    master   | 70  | 108 |  1  | 179 |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 6 
               linux-pam-1.6.0 | 6 
             util-linux-2.39.3 | 6 
              libarchive-3.7.2 | 5 
                libressl-3.8.4 | 5 
android-tools-4.2.2+git2013... | 4 
                 coreutils-9.3 | 4 
host-heimdal-f4faaeaba371ff... | 4 
               asterisk-20.5.2 | 2 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.3 | 2 
                elfutils-0.189 | 2 
                   exim-4.97.1 | 2 
                     frr-8.5.4 | 2 
            gdk-pixbuf-2.42.10 | 2 
          gitlab-runner-15.5.0 | 2 
                gnu-efi-3.0.18 | 2 
              host-scons-4.5.2 | 2 
               ipmitool-1_8_19 | 2 
                  libffi-3.4.6 | 2 
               mariadb-10.11.6 | 2 
                memtest86-6.20 | 2 
                privoxy-3.0.34 | 2 
         python-remi-2022.7.27 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
                  whois-5.5.14 | 2 
               apcupsd-3.14.14 | 1 
                   bird-2.0.12 | 1 
                   botan-3.2.0 | 1 
          cryptodev-linux-1.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                     efivar-39 | 1 
       freeradius-client-1.1.7 | 1 
                    gdal-3.8.2 | 1 
         gobject-introspection | 1 
       gst1-plugins-bad-1.22.9 | 1 
                 hiawatha-11.2 | 1 
                 highway-1.1.0 | 1 
   host-flutter-sdk-bin-3.19.4 | 1 
         host-libxcrypt-4.4.36 | 1 
        host-sentry-cli-2.20.3 | 1 
                    htop-3.3.0 | 1 
                  libbpf-1.1.0 | 1 
          libcamera-apps-1.2.1 | 1 
                   libnpth-1.7 | 1 
                libressl-3.8.2 | 1 
              libuhttpd-3.14.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.8.1 | 1 
                  nginx-1.24.0 | 1 
              open62541-v1.3.9 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    pppd-2.5.0 | 1 
          python-grpcio-1.60.0 | 1 
rtl8821au-0cab870ff635ba038... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/914dc162a196e33c26c3f466aef4afeff6390878 |     
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/56262fe4d244be00de94b1de605450a5d1709eae |     
    or1k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/bf70479e9bac142c67128790edc8e5461b9a4e4a |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/9f5d42665a7c2d70241382ad7cd9da3f14edc648 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0590cf5fa16c1664a7b375f5ff8678b09a7ecd4d |     
    arm      |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/8856f0975b99391ccdb568d70e5d8db6d7e5b6b6 |     
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/e0ca5bed177c02075b7c121dca8c4bc61add5bcd |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7df2c1a89e2150d6cb5629b874b1d11ffa6ad11c |     
  riscv64    |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/e6241dbb5df285be8220dcf40f4bab616ca70f29 | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/873697f6d49f5b3b0aa581e9adf0c9e2e2d18b1a | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/8e97b808e07a2cdbc13323e613f914e6ac2b0773 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f7d8a80b936f61db7c059cb7683d8b8e91ed7820 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6dc11d89e872fd9e8f0e0602b11b997165651f6f | ORPH
   x86_64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/9a81d7c7996550ab0a56fc12469fc0302f655e2e | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/56c4e3870ef951be1ca257262f120e4716ae42bb |     
 powerpc64   |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/44ca49a25b37e00375d815aab62a55943f35798c |     
microblazeel |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/e85beb0988f5d2d6e68e84192181a4f2ea86a24e | ORPH
  sparc64    |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/c817caa1e9ad91a1c0f61d92f24d35612cc3a5d5 | ORPH
  riscv64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/907d41e44aaa5e29e9254f39e024de8bd4e7b753 | ORPH
    i586     |           efivar-39            | NOK | http://autobuild.buildroot.net/results/269df38dfa832632acc5bcb4bacde6250e094f89 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/13cf4a3de616be41d2019ba242f8c105267dbb03 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/956af88078866b8e17e1d9422dc6f2cef1f13ed7 | ORPH
 microblaze  |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/540d14fe9bc458a9bb2cb75e7c940f2a0a910fe1 |     
 microblaze  |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/3c846c763a05f2569db7a019af8b91b0563c8f42 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/703e313f7488b416b82b4700f3f5a4f22bca2671 |     
    i586     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ef990738a9b2d6f393764be671c99f8fa5cf5f77 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/78a13c2b26630f05cc32d2b5c229c1c244cf2f09 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5a645dbc76a10aa4ad154c386a6512801afea448 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/10636e98e349854b0e97408d5743a973577873e7 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b6ff4293ef5c67054beedb662257316fc97aeaab |     
microblazeel |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/96142357285f362d8394c68ae7b7dcd69e02668c |     
   mipsel    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/f611c449ce6826c0d0ceda065768d17bfe3ed8b8 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/0535fada83d32325c1dadf774f78be3de467eb88 |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/09915ca968aafac8a722abcdf6b9f25c4571d4cd |     
   xtensa    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/e68280aa7354064181bc6bf81075e38b982997dc | ORPH
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/83f942db8c05a76970cc9298d106a1eb02b9fe65 | ORPH
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/6a7d8ca3175a975c2ff01dee60898ba1a95d9f7d |     
  riscv64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/16bb48fa50de450aab2cf541bcfde661cc5c8ce1 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/93307e7381658acd175d85eb33c95cf341b1c0a7 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/f91bb2f33e61740d293fb132c1116e05675ba682 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/02354f63b58f0203d054c53b2f42a30373935318 |     
  riscv32    |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.net/results/4f3066043297825e26f0856488ba76c848775910 | ORPH
    mips     |         hiawatha-11.2          | NOK | http://autobuild.buildroot.net/results/8054bd47edf613a12b09a9958f78abd5f355f17b |     
  powerpc    |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/1a4801dfe1e2afc510a9166bfee332cffacc5291 |     
  sparc64    |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/fbd0a9f11e9e0f850560abcf965b3de7c926a031 |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1ad067950f1ebebfc9d8cd310f804c6f7fd45a3f | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/93686a0c701c8c5937eca0442c42aee1d87556b4 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4b3b73bbbbac81c504458ae3088414a04d7ce448 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7b1f6fcf9720b0c2bdbe29d5966c9fd3eec3e9ef | ORPH
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/6c37245ed594ca75db0772e98ebd9fc33bb25e5f |     
   s390x     |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/d1c309c4ec7e470586a1597b111a65ff81db24f0 |     
    i586     |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/8a77d09e3d4c8e61bdda1b6988d2c50a5f7a680d |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/5c982c347e8f299d98eeb5956b3bfa7a0cb4e99f |     
    arc      |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/cc9c04b6ac6c8291f5f1fb781925b2601f22b7f7 | ORPH
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/58967fa9310e9659e3252ed72cce407a29f66293 |     
  mips64el   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a09ab9fce2ae68c9eef678f134ab3c3f0e5e99ac |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/37614fa423bbf5f71fd7009c13128456300c9740 |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/9ca679d9c96702492047c8a90e2ca251e5a0c9f6 |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/995c20221c3edbfb6e83ea8ef00cbd353b8fd56d |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/4762a3beaa7662b4ae15129518038cab21e50d58 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e84f6fc5072a51fabf924a035436c540bb2a58e5 |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/7db97895a2c2e7506eaacd28c2aae89372b74153 |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/1b5109ab3c1b8150276552fdcfa9f222f84bde66 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e14265f7fee10e4009ff26bdbd808963408dc606 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e93f2096eec2d4d6bebaf41e8d37bc7042e15e43 |     
   mips64    |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/72b5b1c6a17aa201c51356282719ad1d6a48c523 |     
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2136ea2581e6135364f4cbf26430bbb14e4744ae | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/913b92a3bee94957c0d257048dc3bc00ed0cf33a | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9cb334d41132778a8984f132dd55c2edf3016824 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/598f2329fa7192a761042206277001b4aa1d566b | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a4223eabd71942f9ab4613b3be47903fa72d257f | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/818a680433f150ce40ec2aaa8ecc4db4e4214abd | ORPH
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/49dde47ec9a3c7a3b2eac57c4e3c2e94ef9b1786 |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/7c5db1b41f4521d56ed968a03f95516e24ea594d | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/a0d5bf5b0b80b66a0e2006b997199c784c70e15b | ORPH
 powerpc64   |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/cf8b00f7c0e1447224aad74d82d0b22c453b59a8 | ORPH
   s390x     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/2d5d8f0c5edf30b58c8a41378c68b1372be95338 | ORPH
   mipsel    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/09189a55fe1384ea182018fe1f057f74276e29c3 | ORPH
  sparc64    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/75e7883dbc5ed56b5a3403bef3a1247d0a093bd6 | ORPH
microblazeel |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/8181377b25d05f765cce8ef7d4413f53f1e040ab | ORPH
    or1k     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/e17911978febb7b25112940a7c40037b3f98d491 | ORPH
 powerpc64   |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/7de24fb7061610b1a00d023cfec61196fca13d95 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/a9545a008d3ac5130cee5a64b00bd7b8218260f3 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/528de509fe621c4a53afb235b998a4aed1fbc0f1 | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/256cef3f0da64e1f52fb4d348323c75f50a572ec |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/f88973b75ca39d4b7323cd7e5fdff9e989b85263 |     
   x86_64    |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/f71000b710aadbf636fad820263f8be6ccf9b62b |     
   nios2     |        open62541-v1.3.9        | NOK | http://autobuild.buildroot.net/results/276361f25bd02c1d2f06245ef605515fe9ae2414 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/4d19b6cce1cb376564e2a3719cce9c5c8983955d | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/71456ab1a85333106aa4cdaecc191253a5bd39dc |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/32709d25c95c6e4fb324d6fc4927206d66e1c37e |     
   s390x     |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/1e42da36378404c993781909e240dcfd708cc8ff |     
    arm      |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/3d549e8a94ce989aefaf3d27354fd4748cbc05b1 |     
   x86_64    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/a8ddf376cc373c26a02264ccc7f17160e68035f1 |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/bdab61a6ac3be326bb2c131b61408e731bf7ccf7 |     
    mips     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c1faac9749755c924d7c3453a3ca210590d424bb |     
  riscv64    | rtl8821au-0cab870ff635ba038... | NOK | http://autobuild.buildroot.net/results/3b451b427a8dbe39ed275f91e38e76c2cae9a43a |     
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | http://autobuild.buildroot.net/results/ccd789b301b6ddcca1b29e26d5cc48d54427a001 | ORPH
   sh4eb     | uhttpd-15346de8d3ba42200249... | NOK | http://autobuild.buildroot.net/results/3ed7cc4fdb9d16dd9b867ec90f40f4f9550533fb | ORPH
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a908a5b6e3f364176e81233a49f7f5467e0be5c4 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/b60b055c1b0f5c49ebda71a6f468b7395db8aa7d |     
    m68k     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/9d9ce7fea198e50b022c53ba72a5df1a20308875 | ORPH
 aarch64_be  |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/ad4bf099890c7272dffef8416a1ddec31c54aef5 | ORPH
    sh4      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/6e315215399bf3a149c01628ad620f60075c47c1 | ORPH
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/875a8d9ad76e844149d9a1c0c1983696e7313eff | ORPH
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/8ff7d36d5a5c3c93879b089a7d8d61b393a4c4f8 | ORPH
   x86_64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/961cd1221adf9ef8bfaff25b212351d10769c369 | ORPH
   mips64    |          whois-5.5.14          | NOK | http://autobuild.buildroot.net/results/6df2844d66237e9b2a2713a2edb67d738f52a1fa |     
  riscv32    |          whois-5.5.14          | NOK | http://autobuild.buildroot.net/results/a43dd1754f6d9a3af891e7abf33b4488685f6322 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               asterisk-20.5.2 | 1 
                    bat-0.24.0 | 1 
                    flac-1.4.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  jack2-1.9.22 | 1 
               libglib2-2.76.1 | 1 
                privoxy-3.0.34 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/16b0967d97d0a6443da4bc613c7900c8e08ff1d5 |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/5a90aa2be66b3f7049336367b434bda407ed1581 |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/27914fee592aaea465c38d1ce31557959b635a3b |     
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5a2f2aa75de9719773b3c64f944f80cccaceaadb | ORPH
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/8771155c5b8c8cf9ba418283e7acd4ffa302602a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/830b32947a17a8affd6b8859fea049b2018f608f |     
  mips64el   |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/6dda347bf867727e69fa7a810f8954d65199d79f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/6db427e0aa738a25d9721bfad824860118c387af |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/7ff3d6a09bd4911ff78e01c14f2bfb7da3d43d60 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
