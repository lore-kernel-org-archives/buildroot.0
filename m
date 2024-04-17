Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8FAC4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 04:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6C1405CE;
	Wed, 17 Apr 2024 04:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdNMiTavnfpl; Wed, 17 Apr 2024 04:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3D94405E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3D94405E6;
	Wed, 17 Apr 2024 04:06:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4ED1BF592
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 04:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7469A6084D
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 04:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gj07M1xFVmB for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 04:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF19A60844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF19A60844
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF19A60844
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 04:06:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A92F20004
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 04:06:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 04:06:18 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1713326778; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cqakTbfmv8mPojQYgKoJP842YjwZyVYQiTihGf71i7c=;
 b=H09k3x1p/vWC4whSzvyBB35m/kTX1eQRdiUPcddpLKD4f1Px/CiVoqWyIsBFWGcCOW2WsU
 CJSU5QS2gYT4Ovgh7/3WJZySbV8JVETFy1bMnOed9ZBF/SvhS4GJMSeTXN2LjLNcCTs2ol
 oO7j1EkmElqMRictBCINPRBnvuDUdFQB43aFWQ0V0sW8qoMk0r++mVSfhuDhd4Hzm/jepi
 oSMPkX6caZgMZffna+whSIQxNtEj8uvGYhvOlb1/iMkSsQeK7RjFcZwxPmGs9xJ4I8WgWk
 w5rY9ZuJ79CZJuvAdxo6gy9OQsGkbWPmYCAs/BvAcMCEdbQCyi43NCnrAektvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H09k3x1p
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-16
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
Message-ID: <20240417040618.IW3FPNXpwOjz9a6XAHNCmhh7OzPVMx2hCEIbWFSrVeI@z>

Hello,

Autobuild statistics for 2024-04-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  8  |  1  | 14  |
    master   | 80  | 73  |  0  | 153 |

Classification of failures by reason for master
-----------------------------------------------

               apcupsd-3.14.14 | 5 
                 coreutils-9.3 | 4 
                fail2ban-1.0.2 | 4 
                libressl-3.8.4 | 4 
                       unknown | 4 
   host-flutter-sdk-bin-3.19.5 | 3 
host-heimdal-f4faaeaba371ff... | 3 
          libcamera-apps-1.2.1 | 3 
                     mdadm-4.3 | 3 
glibc-2.39-5-ge0910f1d3278f... | 2 
               ipmitool-1_8_19 | 2 
                   linux-6.8.1 | 2 
         python-remi-2022.7.27 | 2 
                  assimp-5.3.1 | 1 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
             cni-plugins-1.3.0 | 1 
                     crun-1.12 | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             docker-cli-26.0.0 | 1 
                gnu-efi-3.0.18 | 1 
  gobject-introspection-1.76.1 | 1 
         host-libxcrypt-4.4.36 | 1 
              libarchive-3.7.2 | 1 
                  libffi-3.4.6 | 1 
              libopenssl-3.2.1 | 1 
                  libsepol-3.5 | 1 
       libzenoh-pico-0.10.1-rc | 1 
                     lxc-5.0.3 | 1 
              mosquitto-2.0.18 | 1 
                    ola-0.10.9 | 1 
               postgresql-16.1 | 1 
                    proj-9.3.0 | 1 
               pulseaudio-17.0 | 1 
            python-sip-4.19.25 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                    rtty-8.1.0 | 1 
             stress-ng-0.17.07 | 1 
                   trinity-1.9 | 1 
                   uhd-4.3.0.0 | 1 
ulog-0389d243352255f6182326... | 1 
                 wolfssl-5.7.0 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/eefda3662cf822bd96d9597269a546051ed08581 |     
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a9f79418db0b5ae4097dae83475883ebe7a3b195 |     
  powerpc    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3c4cbceef5c13ddac91c0c80e246d5c37ced7b04 |     
   mipsel    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e809fabc2d28cd2393a75257dfaae651d4ab4581 |     
    sh4      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3379a27c077bf0a07e459b57137a7f5060eb8891 |     
   nios2     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/a2d953d260510b0f5d33bbdf53cfd96bc6b4d46a | ORPH
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/048d68c46cca168060c3fe818fe84d593106e3f3 |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0ed4eed3b1457b9f55940c75507221075b0e74f2 | ORPH
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/154f2b9a0c303ee8d7d86e4920eba04453a6f0e7 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/0bbd96f448f55f64dfd7f052990455707156070f | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2b3256aa4e2bad7ec6520907ad6dcd36f2331951 | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/8c341895100f94f32ea691bb0f26f24bb7210f27 | ORPH
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/0a4df9faf357970ad8833e3c9ee0eb8788f7f421 | ORPH
  aarch64    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/a4ede7471b4b2636e0b0cccb705811e6609f2cf9 |     
 microblaze  |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a4903c4346358a4ea01de5561c0ce972669f4407 | ORPH
    mips     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/1ffabf265c9c633d3cce76859fb46d5c68fa6d18 | ORPH
  riscv64    |       docker-cli-26.0.0        | NOK | http://autobuild.buildroot.net/results/f3c745fc94140f69935d812289e3abb5d93eb47c |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2cbb72a43b41fcaa79c2343ad4fe20a2863db800 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f8f77b7b38d47c960d4a28dc7a0b0333c814c4d2 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/362280058466c31bcbd7433b700fa4652d96da9c |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/320cfa0b1f61462e38c2961bf3ee6cd0a3660f59 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/280fff38b86940ffe152ceb419898ef773a12cb7 |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/eea0d53a578b1105d29c817703526c519fd6bf40 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/b6069b50b621c51271b0cedaadea79e6ee2ce276 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/db7657bfc0c435e8cffa2a4aca23c8d877150272 | ORPH
   mipsel    |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/a7b4b7919d32e55dc02d8049d94aafee97351185 |     
  aarch64    |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/d35ed6962275aa7ea3d41e377ff1fc9679dfb048 |     
   s390x     |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/44f1410f03fa6356233116b119163cf96a0d25ec |     
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d1ce346591a4ed52281d5fe2b43428b3331e7ce4 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1cddaffdea09b54d7e29e9ac14e0e1c3c806b5d4 | ORPH
   armeb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b76baf9d6546cac9903f39c9a32a6f125de8e83d | ORPH
  powerpc    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/dae467d81b088b7dc3d678f9caa348f99a2f4bfb |     
  sparc64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/d2fd4262a429228867f5a71f0cf37e5f48fd1921 |     
  powerpc    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/8d2aad2d02871b12c386630bdc79f5a7c33f9e57 |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/921c905d45216dbe0f2a5d783eedd25b5c16a13b |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ee9610f59c7ed5f03e496fbdd884d8cbcd86c41a |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0a2f5ac19934f3d222f02761335684551049beb4 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/a3f3d7c45972aa9924a09c14d74a5c312028c547 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d699b87350bab1aceaa70951588e96ea724178b7 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/fe20b7468ef447ac5dea093a8a9d6b4d275d3caa | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/42c85bc8dc2b2a647da4255055da25ec8c34c88d | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7c117ccd62602c291fe62be2455478669687b221 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f0eb80fe8e246de809fc228fa4e4d827a6099b23 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/64190ba9d118f43ff2a1365c6ba11b5b98474098 | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/50387935abb865e0a3255fef7ed99a42339c8ae1 |     
  mips64el   |    libzenoh-pico-0.10.1-rc     | NOK | http://autobuild.buildroot.net/results/c495306da0eb29d2fd52d12cc51cf0e25e539115 |     
    i686     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/011714ed26605aa8d9fb2039171638aece41a8a0 | ORPH
    mips     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/af28b79c878aa2881ab129844608dd5742771329 | ORPH
  aarch64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/21987151303528bff8dd8073ef9faa4794a06ed4 |     
    arm      |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/99c19ac59517cae4546400cfc07d33b51ebd035c | ORPH
   mipsel    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/614529f7d5c52b2bbba83558e3cf43f2ef4c5b65 | ORPH
    mips     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/9a8ffa7f0bd1ced86c368fa245874a850b66a50f | ORPH
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.net/results/b31c1c813a11e78e71980ee529411db1a1536e50 |     
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/5ea62e24244c8465bdd6ad734a08a346fa57a226 |     
   arceb     |        postgresql-16.1         | NOK | http://autobuild.buildroot.net/results/fa4385769579fd85aa008794d9508d81b59cdd99 |     
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/07fb36d71f1e9d0a0235e19a454f87b58b83fc3e |     
    i686     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/d38f9919a5ffc5a38fb21d3444ea8fafbd3633a6 | ORPH
 powerpc64   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/06f9fb638a67aea4ad20e158a80fa7654c3a823c |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/dce5c94ac6e35663b71ed7d5305e44f2e2ce13fa |     
  mips64el   |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/100cd0d6c50a8884a104ed4b175c2f04413b6b57 |     
   x86_64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/c2e79f203bc089d222cfd00027bf1f2b4875efa3 |     
    i686     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/1dace6ee9e6f20871f4989cd9d7fa89059dadf9f |     
    m68k     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/40dad1193c8c29420aefd8022ea7d1736b343319 |     
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/40b14211d326f36d6411d75d67143fd88d3912cd | ORPH
    arc      |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/f0a0889198971ac19e5de4ace43ee26d802fd5e2 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/f0f22163b10122984489ee7978f656b045a94b98 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/acae5b1706aca979348120172215fb936c565fa5 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f4de8b9fa665da2e0fa6cb9ac501fa273bc13ffa |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0396754ab7463616703112d0f04c4ea052534046 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/da5190f443349e4ea8d978c97176a6533ab730c8 |     
   mipsel    |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/352197cdb184766b4f5a51fae5de26ae3d522333 |     
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/be2f648a3358a7b7c3cd2c77c1260a8f7613b235 |     
  riscv64    |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/6b60517e32eedca3ea08ae0d48e1bd75f4fff719 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   duma-2.5.21 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
         gobject-introspection | 1 
                host-go-1.21.8 | 1 
                       inih-57 | 1 
              libgeotiff-1.7.1 | 1 
               libglib2-2.76.1 | 1 
             libutempter-1.2.1 | 1 
               mariadb-10.11.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/c273130c23d789c8d7d0cfbadfd2b594910fbe58 | ORPH
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/2dd73c909ef36585d996038118e52935e9fcd431 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5edb9481927bea227485887a61d73bb61815c934 |     
  mips64el   |         host-go-1.21.8         | NOK | http://autobuild.buildroot.net/results/203addbd5594972e3a189614b7011b2ec21c25cd |     
  mips64el   |            inih-57             | NOK | http://autobuild.buildroot.net/results/b9566749ca19007aaf74f9b6b75ccd9439c17b8c | ORPH
    arm      |        libgeotiff-1.7.1        | NOK | http://autobuild.buildroot.net/results/c5e714063862401adf749426d3b39d46b785140b |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ec7d694869d6a060ef6c4d3b4d4e663d12c8522c |     
 microblaze  |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/0185e3bf64afd375016072b4768c06cdd8e827d7 |     
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/c60d215b55b89add3dc320bcaf7f1dc89b4d89c5 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
