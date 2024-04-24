Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542BFC4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 04:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C16540757;
	Wed, 24 Apr 2024 04:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oh8jY63b0AS7; Wed, 24 Apr 2024 04:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5546F40747
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5546F40747;
	Wed, 24 Apr 2024 04:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4851BF363
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 04:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6567040747
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 04:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgASp-TLQKap for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 04:01:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C8F740746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8F740746
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C8F740746
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 04:01:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DFBC1C0007
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 04:01:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 04:01:29 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1713931289; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sCSUzG6fJjS2s2HV19z5Jqerpq7fg/h63AIbw+hID2o=;
 b=cKCP5m6CEMr8N4VVimrLs8vHwFBCa6tJGn6oIIQCDaae7+4rUn5nqZ6mwZzdklNTiO+ovS
 CILk3f0EKurjFEGgVNrq0x2cdBrE75gVfWFXYHGFRwBHJR1BCGZIOk7oP2mtXLPmYhaIkp
 5JeP4Nwasf5lQUrXNjyg+jYk9jx7SPa9oHv3zsQkcATwbRw6oxurPC5pJsoj/2ebsR9iG8
 1FArbU/3qCqpl3qBG6pmPn16xra8WBBvk87nFhi45v1EM31T1u8istAPQRHBxVsEA7X/Aa
 5Y6Sq6lrtR8JoGUGGBBGcQIhcldoVTXrp9t2wCrcMiWoIURtG4DN+chuUY79nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cKCP5m6C
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-23
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
Message-ID: <20240424040129.0WbSjXsDsjVdUJTCr5p9l4iUDcdIuEVmJ8UWqyzpuog@z>

Hello,

Autobuild statistics for 2024-04-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  8  |  1  | 14  |
    master   | 31  | 48  |  1  | 80  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
               apcupsd-3.14.14 | 4 
                fail2ban-1.0.2 | 3 
                libressl-3.8.4 | 3 
                mongodb-4.2.18 | 3 
check-11970a7e112dfe243a2e6... | 2 
           dmraid-1.0.0.rc16-3 | 2 
                elfutils-0.189 | 2 
             stress-ng-0.17.07 | 2 
               asterisk-20.5.2 | 1 
                  boost-1.83.0 | 1 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-f49c2f1a202... | 1 
   host-flutter-sdk-bin-3.19.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
        host-sentry-cli-2.20.3 | 1 
                  jack2-1.9.22 | 1 
          libcamera-apps-1.2.1 | 1 
                  libsepol-3.5 | 1 
               mariadb-10.11.6 | 1 
                    ncmpc-0.49 | 1 
                 openssh-9.7p1 | 1 
    python-cryptography-39.0.2 | 1 
   python-pydantic-core-2.14.6 | 1 
                    rtty-8.1.0 | 1 
             sofia-sip-1.13.17 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4b7556d277ca30bbbf981564e8f54d4a6b185042 |     
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7569a31d5656a2c4a65202112a5385fcfa7e3679 |     
 powerpc64   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8d10a34eb793107906e0452cb4a8b44798ed5d5c |     
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8af4dfed0a7ff223b801f4bea9899d4f1268f82d |     
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/79f2d9c052647733136e93ffbfb4b476441d67a5 |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/b0d912a66e920eda5320879dde343d9ab837939f |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7aafc052e649851a49faa0c7cf80eba4b0fe8b80 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dd277c30f09bfbb69f9ed67b4f285d353e6de485 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/5f02677c891907107f8e0f37a20b6badfddc1662 | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/9c7ec93d77c07c10d276ec9ca5aa6d0d8e866b28 |     
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/544e780d557583f4e0db1d073de2ccc52dfd8f4b | ORPH
    mips     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/37f74202924784c64feb7a5b32080e8d57d51b95 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d45b1b281554b5b2edba15064d61add69f88f368 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c69616945c47b83c078142f9094737ce40128fd8 | ORPH
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b6300b0273e8dcc76ab1b21c8693d82b120ef3d8 |     
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6984f9d426226148ac72ab66217c5d018d8e5bc4 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/afe33ed831e5de9f32829e5e17dba0077969e40b |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/be44d7026c0f0aa49639ee3fa4023ce9b254071f |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1eb62637813c8949afc88445fc891489e23f7de2 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8fe4bef80c8dbc281358e0997c61d6c22d20b708 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d2ecf54d1a7a8476370ebfc007dfe4c2ccd1dec6 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/7ae170afa1badcf3ab35366f0b3318bd7a7d8435 |     
    arm      |  host-flutter-sdk-bin-3.19.5   | NOK | http://autobuild.buildroot.net/results/3f511631c0fd5e109ef74853850fd0654824a234 |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7f5187726c368974fccecbbd3af72c7c7f14f832 | ORPH
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/3d46b733612260018dab92de7c44e741d29d6d82 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/a0f53c98888bdb6c36eabe059f4eb1720e49454f |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/15be15e63444186c23187d9422fb6ca5e208c9aa |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f2381ee2e60ab94fb2937688f764b38de0683cb8 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1204a935f614880ff3ffa3341e5e0cc51e87129c | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/86add8522bc5f7b28b7aff3b86a2c7aa5081caad | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/c0f657498414cb16f61f5693f98e97d84a84cf5b |     
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/0721e68e2cbc304a5edc5748d36e93a5b1e5cc55 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/5118f2eb956bcd7276f8a4322e24224c74e79ba5 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3a34a43adfdce1cceace9e0a77940130af081237 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b743bc4257f41097858a9fa09006fd8cff4d58d8 |     
    arm      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/88f1c8c70f5e9f864a1f6a8052f0083d73c33843 |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/cf465531ac49bd88d887d3440e3d92e9034ca9e4 | ORPH
  sparc64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/ac41b251d66d2595cf0b544d9d2c9b01e9fe04d5 |     
  powerpc    |  python-pydantic-core-2.14.6   | NOK | http://autobuild.buildroot.net/results/258bcb8a20622789f86a9429bf3ccc861cd8ca6f |     
    mips     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/4642ab906d7139eee0f315232aaab8882899664a |     
 microblaze  |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/4c65bbb6b3fc5295f34166b053d9ff73d78c2866 |     
 microblaze  |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/6b461cd77e6343e052d5f3af11b3e70498511f56 |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/3407a313ea52b6de79e125d3b4297857c8fcb985 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d2275859e7c254478222ecdd9dece04e1fc44286 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/3da6a22c539333818ac9f61c4ddc4cf639b11bec |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d0a4cba62ce3d8613a409f3212252bac29937300 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/ecb089bcb7ecbc7f92e5bb8b1a3d84855697f9dc |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b95a89cda7a76cf2a7820cc95c965b1e36f1ccba |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4fb9d601ac49a4ff320ab0faadb56ed6a4f5d5ed |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    ncmpc-0.49 | 2 
                       unknown | 2 
         gobject-introspection | 1 
               libglib2-2.76.1 | 1 
                libressl-3.8.2 | 1 
               mariadb-10.11.6 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/cad00c752771b3ce3f42ec91dc2d2e7fe355e19d |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/dc754a356d2d4b845608dc7e3c9f98498f1c5253 |     
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/baf910e66c1452d4830e2962d9f7f5f37c5527ea | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/79f5c01d480d9454f2469576e4c399d03d40d89f | ORPH
  riscv64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/b6d6baf39184959a16470426a2fc64f6c37d0858 |     
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/cc08179a50f42ba6194a8d5eeb720dc119f97a09 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/da61e38fbe382603781332f716065efba1109b19 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/667a292e2c4c9ba304ae87f27de48444631e8c48 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4cef1a31f5a54f4db0a3c33ac49a1fc6cc6df08f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
