Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB636CD128A
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 04:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1FA8400FB;
	Sat,  6 Apr 2024 04:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhFFsf4SX5Zn; Sat,  6 Apr 2024 04:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5A024036F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5A024036F;
	Sat,  6 Apr 2024 04:11:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20E151BF5DB
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 04:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF46360AB0
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 04:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVaXCJ9ppk5t for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 04:11:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E24A60A76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E24A60A76
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E24A60A76
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 04:11:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED8601BF20A
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 04:11:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 06 Apr 2024 04:11:17 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712376678; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WGyTYpjKZ49Tcr9kA492j5QHPKVDeWDMcVUFJM2D3iU=;
 b=LxK27Yf4lfVLDf7P70X+Dyk7mXJyUKkEOULpDeo4KwKauk3V6pFSSmH69U8hRwrn4KKjlK
 sb1+DvZqgAwEKGmL6gE1GQZ3cyrRGklfvE24gI/ygoiYFfI0mmZguRVxT1Kl+PcoaGeha4
 w6HN2iLkTTnEdBzDSrIkQ8szchz8rELfo6r15xDmp3EZQCZq+le7Vbnwm8ULyTsGHkx5pa
 gXhki5HRPhTr2kNtcpVWumpjyYwr3BlPD6r3RG+ds2X12afI5/kkpV9AyKHourRKg3TVpw
 ue8M88Vwk+D1pTXFjLoy8ZYONaZvN9za++DtwWXAj5qizXYP9jHWkcOaVxpBIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LxK27Yf4
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-05
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
Message-ID: <20240406041117.oUx6a_C3w_jzi-yXjJBNVHp9hu6Ie9PHlJbj4mJdTg8@z>

Hello,

Autobuild statistics for 2024-04-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  7  |  0  | 14  |
    master   | 67  | 106 |  0  | 173 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 6 
                   libnpth-1.7 | 5 
             util-linux-2.39.3 | 5 
                fail2ban-1.0.2 | 4 
       freeradius-client-1.1.7 | 3 
          libcamera-apps-1.2.1 | 3 
                   linux-6.8.1 | 3 
                 openssh-9.7p1 | 3 
android-tools-4.2.2+git2013... | 2 
                    bat-0.24.0 | 2 
                   bird-2.0.12 | 2 
                   dante-1.4.3 | 2 
                   duma-2.5.21 | 2 
            gdk-pixbuf-2.42.10 | 2 
glibc-2.39-5-ge0910f1d3278f... | 2 
host-heimdal-f4faaeaba371ff... | 2 
        host-sentry-cli-2.20.3 | 2 
                libressl-3.8.4 | 2 
                  nginx-1.24.0 | 2 
          python-grpcio-1.60.0 | 2 
                       unknown | 2 
                  whois-5.5.14 | 2 
                  acpid-2.0.34 | 1 
               apcupsd-3.14.14 | 1 
               asterisk-20.5.2 | 1 
                    bcc-0.29.1 | 1 
                   botan-3.2.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
               freeipmi-1.6.14 | 1 
       freeradius-server-3.2.3 | 1 
                     frr-8.5.4 | 1 
              gcc-final-13.2.0 | 1 
                    gdal-3.8.2 | 1 
                gnu-efi-3.0.18 | 1 
google-breakpad-f49c2f1a202... | 1 
   host-flutter-sdk-bin-3.19.4 | 1 
                       inih-57 | 1 
               ipmitool-1_8_19 | 1 
                 libcli-1.10.7 | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
                   libnss-3.99 | 1 
               linux-pam-1.6.0 | 1 
                   llvm-15.0.3 | 1 
         lttng-modules-2.13.10 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
                mongodb-4.2.18 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/crucible/crucible.m... | 1 
       perl-net-ssleay-1.93_01 | 1 
              php-xdebug-3.2.2 | 1 
           policycoreutils-3.5 | 1 
                    polkit-123 | 1 
                proftpd-1.3.8b | 1 
    python-cryptography-39.0.2 | 1 
        python-ml-dtypes-0.3.2 | 1 
                  quagga-1.2.4 | 1 
                    rtty-8.1.0 | 1 
                 systemd-254.9 | 1 
               tcf-agent-1.8.0 | 1 
                xenomai-3.0.10 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/4cadba899eabe1046a4fc200765bc5d8d31530ca | ORPH
 aarch64_be  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ab7c1ff0649bec21584654431e722efe2dc88c3d |     
    sh4      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/18e6da358614bf6aa86fb6a6503aa5becc575ddd |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b5683a83c9b6275b9e06d3cd687054b28971c139 |     
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/592915c762b89d36c030d4d88cb6e4c36a6ad447 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/b624fc000a8dc83aaeece62b21eaa805de47b64c |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/03e689d79c2f719b958e49ffbe9a097dcc82abdf |     
  aarch64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/94542484e5be5b2143cb4b1c60b19d940316dda6 |     
  riscv64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/d300e27960edec3662ab30c50ebf71d845e9dcf5 |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/96d6fc3947112238bb74247529fc94d297fa79cd |     
   sparc     |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/e9f8aed4c11b71e7266de032e9a4f1e5454c3544 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/82d7acd31d09153de466c56a0b43eddc8c1e93f6 | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f8604159802e4b68c7f8202839efa45df6d91538 | ORPH
  riscv64    |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/ca31a2825fd1d10c91ed523c55d58cf0b7980757 |     
   nios2     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/15976b7aaf39bd4cf44378bfdcc59cbced1d35d4 | ORPH
    m68k     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/74012ee3dfe0e8a0c319af43f4ae7d4eee83862f | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/1fca061ab10b6bf91e022a64c9d9faebe195030d | ORPH
   xtensa    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/b5ce61666c0bbccd6d769396c30750a04b2a9d4b | ORPH
   xtensa    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/ace2f0fd19467da1430f35ebef6cbe6764864aea | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7a5106e9a78eb5b38c5fc93b1d199263e31e5242 | ORPH
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6b332c4d3881970e2df9b5de0b245a5569991096 |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f8c7e9d477d816c347842ad47342f929a4eff5c9 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b0a9f344f013de0133e282a6160cfba2df65c43b |     
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c9f09ded693be69d9c543ecb165fbff9ab8cce7b |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/329cff38b953396d8ecd3ff07b5c627cbdcec65a |     
    sh4      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/80fa200a046897e36349df7970955bcdfe0c0737 |     
   nios2     |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/fc3ed956e998fef250bb7da72a51a76220b97224 |     
    or1k     |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/33b7bffc972ad7d03dd7561a96932f0fb49183eb |     
  riscv32    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/207bba3df700108839382007020be56c4629ef75 |     
   mipsel    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/dc45f1291245a0dadd382cea2ad41573ad976d60 |     
    i686     |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/668da3829cacbe883e6cf97ce6191a8180441db6 |     
  powerpc    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/d7e6b6c439b0acdb696b10d46ef4e73b5afd5139 |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/68eccd1204791e61973f226aa4c62976b2a592c2 |     
   mips64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/850ab6346a4f7fb10aa57cf50d3c3294a7ad0096 | ORPH
  aarch64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/d770398e6049051a348d060729e59d39ba14d8ca | ORPH
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/d62a605ec8bd14977a127e05a2ef7f9d0f42210a |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/62ac00ae05a7d095d21afe99a068ba44197ae6c3 |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a442fcc905e07a4f6353ac256f778625eb5f4eb8 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/69651a3f462f73688883f4148564d6d77b40d8ed | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c371dbd1f54f5476a40892c1b481fb21ae12bc61 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/438e1be7b831feee60f8b4b98bc2ea7bc6362067 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/27466d34844717c0170ecc823778d1306bc435f3 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2637983930c1cbc78ed0071c05b716cb4d198728 | ORPH
    sh4a     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/41ab634db577ebab52fbb1c80cdc34a588aca95e | ORPH
    arm      | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/51a881e679625a52c4a3d0988d21eb161d9e492a |     
microblazeel |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/0de1d3c029887339a178b299ca35fe37da085807 |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/85f3cdfba6725e14a7d8c21c1b76ba3cd8ff2113 | ORPH
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8d9235d850303620c88fecaaf702f54cb21b540f | ORPH
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ec89c161f8d2add27b9da53d0cd82a0755d7f147 |     
microblazeel |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/09aa5f846a321efe02d92a361e1ad046266f4c8b |     
  mips64el   |            inih-57             | NOK | http://autobuild.buildroot.net/results/7a5ba516cde536e103669a0422d336dd8a3b1dbc | ORPH
 microblaze  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/65a72d528920774b88bb10bb7c23f9a3dbed271a |     
    mips     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e7a5d13b5f389e569e104fe6482df23f3729228b |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/1b38c4d3d77c793dc0f35da8bcf301566651b41b |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3f9499efe55c30f62ea64f9789c644ef44b46256 |     
  riscv32    |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/1edd779d9288a8f39f28825062ac743e0344fa97 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/82394224797a90424e7fcab1b2c4d6492f1cffc1 |     
    or1k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/94840f188f6208c0d914ddce4c046e3ed6b9081e | ORPH
  aarch64    |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/1b87b07d94a0cce09505e387b547fd127e31914b |     
    i586     |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/e787cbcd735e239a58ca81c14d33208c8690a1d9 |     
  mips64el   |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/76f8bb8aac7f4c6ca947175f5acec5683deec750 |     
powerpc64le  |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/a1be4781e6cbb743bbe9661a661a7dc4813ff6c9 |     
    i686     |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/dfad94312b44602e6b7f541c25d7a32196ba93e7 |     
  mips64el   |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/a6c604e247205756e3c82141418eae056d0a4e61 |     
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/68d7030a62848b3fbb63a75161ca152ec871cfcf | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f8a819e50eaba6b043957e03ee3099b6b28a417d | ORPH
    mips     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/57a3d3af474d5aa95aa8b6b1039a9b9747a01fd3 | ORPH
   nios2     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/128f1f0f096c7eb0190e3f727d67abe5f11e8787 | ORPH
   nios2     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/da5329a096271692c2317bd174d9de30acac7962 | ORPH
    arm      |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/f72f8b2d6a0bf048b414464833f2a5a1d4704071 | ORPH
   armeb     |          llvm-15.0.3           | NOK | http://autobuild.buildroot.net/results/9ca4e7c49eebce61c4736cef81aa8d583116b145 |     
  mips64el   |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/1166889af2d53f82b3b2ab9a612458b87d3d3461 |     
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/83ff473be784d9eb18e019ce097762d6ae5b3c2c | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/33f38ee2d602099c6ea1ec403965de9a485f2faa |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/07b2a8a71e13984496b1946cd85d1be4e6435ef0 |     
   x86_64    |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/958cc691328b335498002a95b541b20a280dd2b6 |     
   armeb     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/a186fffc468f9c901626c47c4ce216ae501085b8 |     
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/1462c7ae7115cbab4c08b48e2b8be6f906d5d755 | ORPH
 aarch64_be  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/472b9ef601c4efbe5b9ccc497a27a5936bf6d170 | ORPH
    arm      |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/87c597abf6e1640f440c5c4b9d7bedf0ede3a703 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/93fb31cee9108d7fce123cae8c5dca6b1e1e7add |     
   s390x     | package/crucible/crucible.m... | NOK | http://autobuild.buildroot.net/results/68085f1a33cea58dcd9bca7682c85f84dc251bdb |     
    i686     |    perl-net-ssleay-1.93_01     | NOK | http://autobuild.buildroot.net/results/974b7cdd275249c888fc6205f6ca31a3cf28b18f |     
   nios2     |        php-xdebug-3.2.2        | NOK | http://autobuild.buildroot.net/results/8197b9e0732eea347961b68050f1e93af2cb2d75 |     
  powerpc    |      policycoreutils-3.5       | NOK | http://autobuild.buildroot.net/results/74c9775e5da7846b8dcff10e3966789458592450 |     
   nios2     |           polkit-123           | NOK | http://autobuild.buildroot.net/results/59926191d274b25e32e6bbd708f5aadb346d3171 |     
   s390x     |         proftpd-1.3.8b         | NOK | http://autobuild.buildroot.net/results/4d39666854a0395e96c7b0c8339b6ac1b41c4348 | ORPH
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/f726482eecc7c542f9089abad3c8d8ced4765654 |     
   x86_64    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/cba9fcce84e518c6de767da9828e9989d820e4d3 |     
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/0006c1bccb94bc0e32e5f94f1498253f91ef7914 |     
  aarch64    |     python-ml-dtypes-0.3.2     | NOK | http://autobuild.buildroot.net/results/421c01f73672c45c9e81ced48e64d118dae6b9c9 |     
   sh4eb     |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/45a1e8800907746dadb124e858dcb1bb36474ea6 | ORPH
    arm      |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/6c57899db6af63fd6f00ed9a4ae475cedb90fc1a |     
  powerpc    |         systemd-254.9          | NOK | http://autobuild.buildroot.net/results/e0d6b7d41fefec539a17a3ef5c89c192ce29fd04 |     
  powerpc    |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/b4939869a3811a3a665f38b3d6b0cbcbc44d37d7 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/79465efa9af5f574aef879ba7d69716c9ad84dd8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/51911fe25efa8f34c556c029cc30d3e6eb62d750 |     
    sh4a     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/07794a4f175c50bf84a9f4391d8311b031ab8c27 | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/cb7e85efc138b2d482ecd727abbe39bafc02a769 | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/d1861d8494c957751eb115822cbfbe6612943297 | ORPH
   s390x     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/6ac71ea4f01577113f23f43dce91fb799a700850 | ORPH
    or1k     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/230f2260e9577f67db84b8d39274191fd363422b | ORPH
    or1k     |          whois-5.5.14          | NOK | http://autobuild.buildroot.net/results/1405732e6690b54dfa97ca01dee77689ec59cfb0 |     
   x86_64    |          whois-5.5.14          | NOK | http://autobuild.buildroot.net/results/8846fb5aefa3ed213e775e1c39e995058505363b |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/55f17d723d8a937501e7d91b8f309131b7b9fabc |     
microblazeel |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/345a4c1f0a86ba0b1d0d0eb72f52cba7dc90f39c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               asterisk-20.5.2 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
            gdk-pixbuf-2.42.10 | 1 
                libressl-3.8.2 | 1 
               poppler-22.12.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/edc3a9f251e7b5de403999c0fbdb4f333fa232af |     
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/31497ae91a9becb9377de6a40271ebe887e1b342 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/682c1c1dbdc86e06ac117ca8a342903ad2bbe8e8 | ORPH
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/e6c612317540b0be92986a7a6df380a9436cf0b7 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/48147a90633ce1293736d45d0e221173b6dc4007 | ORPH
   xtensa    |        poppler-22.12.0         | NOK | http://autobuild.buildroot.net/results/e213eae10803b2f104a7fa96d21cb593ae4a91a6 |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/6ae27b238e3d99b242bf5c8a4b9854479827fcd7 |     


Gitlab CI results for 2024-04-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544500963  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544500975  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544500981  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544500987  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501017  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501022  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501027  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501039  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501041  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501042  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501046  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501050  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501054  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501059  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501062  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501085  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501099  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501111  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501115  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501117  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501122  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501129  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501131  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501140  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501142  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501148  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501150  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501151  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501155  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501157  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501159  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501164  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501231  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501255  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501309  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501320  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501328  |      
                  mangopi_mq1rdw2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501339  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501384  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501395  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501431  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501435  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501441  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501460  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501470  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501478  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501475  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501480  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501487  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501497  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501527  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501533  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501685  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501699  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501703  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501708  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501711  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501714  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501728  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501734  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501736  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554660569  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554660621  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554660764  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554660799  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554661128  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554661181  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554661276  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554661414  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554661513  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6554661723  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
