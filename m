Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2D8C6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 05:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3C1740153;
	Wed,  3 Apr 2024 05:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfq4l4Bx6AIj; Wed,  3 Apr 2024 05:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9240F40BDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9240F40BDC;
	Wed,  3 Apr 2024 05:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 862501BF591
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 05:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72DE14064D
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 05:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tD7J2YMrVKVd for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 05:38:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8625240643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8625240643
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8625240643
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 05:38:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4E841BF20B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 05:38:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 03 Apr 2024 05:38:45 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712122725; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4cQYC+38ksaqhxuUH/ENE/Zh0VL+QX2y2Mow5lhDlmI=;
 b=L6nNOhcsEN8DWaGYmctUo+N3/jEUcaiOxCym79VeGbtD5EVOTAs3QGHkAsiCd3RWnm/0I9
 LCxHoY8h6Xpr8YAbiXmGl5rOxqY5UpmZt0a97naR8lkX/Cz+qU0GOZaSaYF1vneFV3QtLL
 bsIjyBGvzIxri4p5d9BaapZ8s51KPK8Po9vinuucItrjE+BfXwXXAIZrZlwsqNkiBM9mq1
 L6LWTLz1ST2omZQqSsfhvKY/01bF1pnc7DfJmyLYDOFI2zSkby/BjKRZd+dctBM9r22A4R
 vh1M47DQJ2wav/XDkPCRq6ZbD41TunnmkpIYO1T1vk0q2/VDqqFI6LN70jK2Xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L6nNOhcs
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-02
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
Message-ID: <20240403053845.-dJSLiJjssuFTYor3hxgMBlpI97IrrwdJcbtVh1TK7I@z>

Hello,

Autobuild statistics for 2024-04-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  | 11  |  0  | 18  |
  2023.11.x  |  3  |  7  |  0  | 10  |
  2024.02.x  |  9  |  5  |  0  | 14  |
    master   | 38  | 145 |  1  | 184 |

Classification of failures by reason for master
-----------------------------------------------

               linux-pam-1.6.0 | 11
              host-scons-4.5.2 | 10
             util-linux-2.39.3 | 10
                   dante-1.4.3 | 9 
                 sysvinit-3.04 | 7 
                    apg-2.3.0b | 6 
          libcamera-apps-1.2.1 | 4 
               asterisk-20.5.2 | 3 
             dahdi-linux-3.3.0 | 3 
dmenu-wayland-a380201dff5bf... | 3 
                libressl-3.8.2 | 3 
               lighttpd-1.4.73 | 3 
                   linux-6.8.1 | 3 
                 systemd-254.9 | 3 
                       unknown | 3 
android-tools-4.2.2+git2013... | 2 
                 apache-2.4.58 | 2 
                   bird-2.0.12 | 2 
check-11970a7e112dfe243a2e6... | 2 
                dovecot-2.3.21 | 2 
       freeradius-client-1.1.7 | 2 
        host-sentry-cli-2.20.3 | 2 
leafnode2-ce7d3b13fb285c9fb... | 2 
                 libcli-1.10.7 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  monit-5.33.0 | 2 
                  nginx-1.24.0 | 2 
                    pppd-2.5.0 | 2 
                   thttpd-2.29 | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.4.8 | 1 
                   botan-3.2.0 | 1 
                    brltty-6.6 | 1 
             containerd-1.7.14 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
                   exim-4.97.1 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
         gobject-introspection | 1 
       gst1-plugins-bad-1.22.9 | 1 
 host-binutils-bare-metal-2.42 | 1 
   host-flutter-sdk-bin-3.19.4 | 1 
               ipmitool-1_8_19 | 1 
      libabseil-cpp-20230802.1 | 1 
              libarchive-3.7.2 | 1 
                libglvnd-1.4.0 | 1 
                   libnss-3.99 | 1 
              libopenssl-3.2.1 | 1 
              libudfread-1.1.2 | 1 
          linux-5.10.162-cip24 | 1 
                  ntpsec-1.2.3 | 1 
                  octave-8.4.0 | 1 
                    ola-0.10.9 | 1 
                 openrc-0.52.1 | 1 
                 openssh-9.7p1 | 1 
                privoxy-3.0.34 | 1 
                proftpd-1.3.8b | 1 
              pure-ftpd-1.0.51 | 1 
            python-pudb-2023.1 | 1 
                  quagga-1.2.4 | 1 
                    rtty-8.1.0 | 1 
                 shadow-4.14.5 | 1 
               tcf-agent-1.8.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                  vsftpd-3.0.5 | 1 
                  whois-5.5.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fef490072a5cd6e17ccb7ed3245770498a91831e |     
microblazeel | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/376558d4f5434f31129a680cbf234d866bc79b97 |     
 powerpc64   |         apache-2.4.58          | NOK | http://autobuild.buildroot.net/results/11ccf857a70ae9f44e8d3ae39fc01db68632ca64 |     
  aarch64    |         apache-2.4.58          | NOK | http://autobuild.buildroot.net/results/072afe03988e285adccd58f3240e33785c8ef663 |     
   s390x     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f1f08becbc1d46ec90d4efb1e51dcdf2f6b7f8f6 |     
  riscv32    |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/3df84ae300bb648492cffc21e4481fc5abf02aeb |     
    sh4a     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/9827bcb4b60d955b9d8ef82fa428996e58eb1f7d |     
  mips64el   |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/d812059d861dc0729c1a6d4189ce12cfa94c9306 |     
    m68k     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/c2555933aa1555e3f62d75477b3210ada7423bcd |     
   armeb     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/df486aca497d0a5837bef959f8e337229d5cd18d |     
  powerpc    |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/006e7fa1210ee8fd21705b45a1080a5b70411375 |     
    arm      |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/41f2af925a5f95a6c6ff5c9dba9af38e74be3b5a |     
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/bc6be415000895fed4ca9ee61e4c0b1b802c7097 |     
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/dc981f4a3f837c9407054d7fd8ea5dcd1b942a54 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/864172a5b823af11a1fc274f6bc255b19168af29 |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/92e2d27429ec2ba6d7120a8228b0428f04c032d0 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/98d46e798f95786ff98572a3e175ce54669bfcf1 |     
   sparc     |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/a1dbb7c96b5529981b96b1d22a679a29a3e91a26 | ORPH
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/84426dd0df0dca45b7535f41ecc1693df8224489 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ddee53538dc6df421ea4f94353182dfe4b6c5d1f | ORPH
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/e17b3d82d0ce3f2b414643f13eb3414d9cdc5863 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/cf0320c303888bb4082debd69207abbf2eb957c0 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/3c44450ac4a6942bbff1879c372e4d1da4187ed0 |     
microblazeel |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/87012a5fedfe1cb1b26e9cf6c7f13e380a8c93c1 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/3f9d48ea5841b1e6d9ba550d8aed80cdbf8a259c |     
   armeb     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/933f37e4b5668028e1c762337e8183a6b6339ed3 | ORPH
  riscv32    |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/a5736266d54d64da88b80725ba3b15b2a9e6f42f | ORPH
    or1k     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/181f550bcd35b2630177bb080d396c387834dc8b | ORPH
  aarch64    |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/269982098097157296b3b19b391e9eb7fb9083dd | ORPH
    or1k     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/8817709bceb2b629f53d3ef7a8f568a216b57f47 | ORPH
    sh4      |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/6c8542efc23f9aacae82c3064b67e60ae059c873 | ORPH
   mips64    |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/0b6445a31e78c29007a1b57bea87a95e830ebc0a | ORPH
  riscv64    |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/cc68ce25b20578da2efedf3d68149bebea526269 | ORPH
   x86_64    |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/221bca318a1c53e5cfea42ee80c7fb5df858af69 | ORPH
  powerpc    | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/6f00c92524fba3fb678648d9c17c5c82466051c1 |     
   xtensa    | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/db20f5886bec8631cfc741e356887919aa2aed14 |     
    or1k     | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/6aa1cba0f90c154a34a28d106d2193cc5ebcc261 |     
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/83ec391a20f63468cd4b40ca87e4f38f7b2282be | ORPH
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/99d816fb7a033ec73a958200041f0dcd728e0e87 |     
   x86_64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/129bde8f795133b034a28a0303150c8d5859a098 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5ba2940353c1cafdbeb9de16979bdcfd57793358 | ORPH
    or1k     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/004eb0a0ca1b55c9fe6fc88b92754c92ce7c9a24 |     
  powerpc    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/ce983100adfae32e9596d347d02b2e2c32685f6f |     
  sparc64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/4443f3e1c60c2cb6c7fa91d3c8e066479f8acb71 |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/6baa9cfa2d64f0ae7a74126f0644c843087fda74 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/272e7d9b8f564fd3c1e573cb351f4594eaaf4c8c |     
   x86_64    |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.net/results/7cd14d8c379812d135bb5440fa10b38138512dee | ORPH
  aarch64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/80b9fe68768d653a3f9b79f727e1129d65c12196 |     
  aarch64    |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/854021dbc22118c33ec01849199c036399b12021 |     
 aarch64_be  |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/20bd170da0f2db16d391b8dd7c3925b1d82f4601 |     
  powerpc    |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/99dd69413aadcccd9c1a36b91453bdbb53762add |     
powerpc64le  |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/23a76bbd37e9e2d8d4061d9dbb6c2fa662a15a4e |     
 powerpc64   |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/e3faae1043f80b5f1646e47476c48623f7d0af84 |     
  mips64el   |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/e1a47e4efd8670e5b012fbcd93480009a3be19ae |     
    arm      |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/fe064721250e034503df540b86e02518412452cf |     
  riscv64    |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/6428d9d58b451e46d6e55710565e787a81ca103f |     
   armeb     |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/d015d5c5d272aaf35ebed21567220fa97868e808 |     
 aarch64_be  |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/643eb202970bea3219520e59c99d45dd279bb5dd |     
   x86_64    |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/0b15579edb877042fc640c602f178f79a9e272fb |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a9860f54f2b077b1dbe14e5c01b96ade9b3e820e |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/005c2ed5195e60bfebb61e377f5bdad82a7e00a8 |     
   mipsel    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/0016cfbf71bfadf4c6a51113d3da4406a7a0334a |     
  aarch64    | leafnode2-ce7d3b13fb285c9fb... | NOK | http://autobuild.buildroot.net/results/08f86ce128623105087cda0c5b32a1d0d0cfa166 |     
    or1k     | leafnode2-ce7d3b13fb285c9fb... | NOK | http://autobuild.buildroot.net/results/bebb26a0fac06eb542ad55ea85726a6cb3a3a8c5 |     
  mips64el   |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/6c04f7af11b22a7b74cd5adaeb746b498c5d440b |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/da47c97e5e38df5ddb7ca808c7370c3af65c46a0 |     
    or1k     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/776194138d7874b8e75cb7aff347e5c78dd0a850 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d11edc5d7e7528ef8877c72b44a01d12bc0f9965 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ce3a0f6ccedc116e3bdebc48322b5fdc02d9e17f |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3734810ae7fd06ce53bba21bd28331756147b464 |     
   x86_64    |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/e54587733b3b10b67b751ae2f6319ca71dbdf2c0 |     
 aarch64_be  |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/f16750d07ddc1a5de1a83b960fe6fe20d125e91f |     
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/7e480e5963ccb78f76fc6d2c779fe69a1022a590 | ORPH
   sh4eb     |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/ea8000ef3eb07d900fd42c7773b83929f75981fb |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/72836e59c7799ad73bcc6a2b201163aecd84cd51 | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b635628259a969b057d7b07aa3a73786de6cc2a3 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/85480625db6a1f8a21dcf1acf3ca60640bc414b2 | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/746ddc80248b7111994100dfffd6b2164441ce96 | ORPH
   armeb     |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/f417c79a9e6d25d58af059419b8da71419f8f596 |     
   mips64    |        lighttpd-1.4.73         | NOK | http://autobuild.buildroot.net/results/da902f722cce202f0eb694043fe690577bccd6b5 | ORPH
   s390x     |        lighttpd-1.4.73         | NOK | http://autobuild.buildroot.net/results/6e091a7c946fac7699c5ccf80007215c34a4ccdd | ORPH
   mipsel    |        lighttpd-1.4.73         | NOK | http://autobuild.buildroot.net/results/498f6a225594bc74429c8c135fd4980f2604db1b | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/3f04d6da3e39b098644697e5e27022a9ee9637e5 | ORPH
   sh4eb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/83bfc56717f6cf3e0c5e9403727b752f70912127 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/dfa2978a8e3a0175bb75cda441951a36e0321aa2 | ORPH
   armeb     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/6d7f43a7159860b97b65cf6718f77d0e48ef6de4 | ORPH
   sh4eb     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/a2aadcf240c3999f2c37fd35c09fe2010c85ccef | ORPH
   xtensa    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/a8a05a6a28a6191fc0cacaa883602fe9656745ff | ORPH
   mips64    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/db38bc667609b030875f473fe0842ba6eeaf231c | ORPH
   mipsel    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/299fd77e57735b8977b6e10f43aafb4b1e572f2a | ORPH
  mips64el   |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/92cf2c9a6e93e7becf10789502268e21b89574ac | ORPH
   mips64    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/cfb9fae5612932319a68538cdc05205492541536 | ORPH
   x86_64    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/75d826b97d1d3477220a546abb3913c667c7663d | ORPH
microblazeel |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/8cc519489a923a3db39bd169dcddc3574d3ff90e | ORPH
powerpc64le  |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/c37dde190b722782a553a3434752e0c1573f8e01 | ORPH
  sparc64    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/c8510bd1b06121a47d9012cef8da512061c985f7 | ORPH
   nios2     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/25d1d6ac1563b6c8804f40d33b0893b072a7e2fa | ORPH
    or1k     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/7c61881a44aaff908a2e145f26f033a05cd9c8d5 | ORPH
  sparc64    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/98abc06951b89176a5c7959f844f08653d2838fd | ORPH
    or1k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/e37c3678bfbda66206f56bf5660434ae82e6d5df |     
  powerpc    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/12b2c6665280dcb813a58d9b025038bacc3b8d51 |     
   armeb     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/a81af3696c780dd3dac5ffb726e66b0d765b2a5c |     
   nios2     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/95e1a74cad83856a5050d553a11139e8828b09fb |     
    m68k     |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/d0bed741506be443c1b0a6de92b40fab9d90ec09 | ORPH
powerpc64le  |          octave-8.4.0          | NOK | http://autobuild.buildroot.net/results/4ef786b4988c99e13a4c54faa5cc321093e22a57 |     
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/2de53b696a4c61a961639d5a1d78dad471e403a0 |     
    sh4a     |         openrc-0.52.1          | NOK | http://autobuild.buildroot.net/results/52187a593d3da39051e635a9cb5a19d5bfe2bef6 |     
  aarch64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/7f6d6787669751b510221a877131a82e0711efcf | ORPH
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/51563570934097e8a85fdc8816b2f0af00bee09b |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/a1a0ff11ca5546dec86028f8a24ec8552a63fc1b |     
   x86_64    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/7663d19bd4c4c79a99a03033f0b68ca0a84131c5 |     
 microblaze  |         proftpd-1.3.8b         | NOK | http://autobuild.buildroot.net/results/dba9d5560503ed5da5493f84e0b7780c1f9df767 | ORPH
 powerpc64   |        pure-ftpd-1.0.51        | NOK | http://autobuild.buildroot.net/results/2a62f48973b30873f4da842e75176633398bef86 |     
   mips64    |       python-pudb-2023.1       | NOK | http://autobuild.buildroot.net/results/09adbbe47c3b9acdb4d5fc61d8a9a0b2b11215b1 |     
   s390x     |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/40fd9f8825fd7cc1fc5748a0233f08afa2ba79cd | ORPH
   mips64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/d3cae5b798c6e4eb6589cb6ab070d5c4a9abe800 |     
   nios2     |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/cd97aa4ee49c3052b762deccb5aa28cd23c54f5f |     
   mips64    |         systemd-254.9          | NOK | http://autobuild.buildroot.net/results/f0bf2538d61e7d94ebd8d58440b75f3e0ed1e47e |     
   mipsel    |         systemd-254.9          | NOK | http://autobuild.buildroot.net/results/dcd51a4cbd7026fb44ac84fdcb85cc6901190b75 |     
  sparc64    |         systemd-254.9          | NOK | http://autobuild.buildroot.net/results/036d2e764c206e38eea1d24376e323190ccac2cc |     
  aarch64    |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/cc07bc857d964b47a278a0e0a45c1e29c79ea500 | ORPH
   nios2     |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/1bd677938104b34cc855a5db991587af8e6a7f47 | ORPH
   s390x     |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/58dc9fca5ae6fd2832e82450110d929e5e91f9a1 | ORPH
    i686     |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/eae827c76f83e3632577b26eb2c185f7e71fb23e | ORPH
  aarch64    |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/66111c7996f4870b7df0b449a52cad41cb93e1d4 | ORPH
    or1k     |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/66cf4f8051b8cc5384817b7fb0a74b185c5e3287 | ORPH
    m68k     |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/05187d79a0706fa3bbaac1b7bd163451bbf5fe29 | ORPH
  aarch64    |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/a631a1af594b50819210d7cc86006e451961e5c2 |     
    i586     |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/7186e045319a02a0b8fda748f6cbd195c5232171 | ORPH
    arm      |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/bfb8a115edf71b1852cc8585c00eb9f0e801a955 | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | http://autobuild.buildroot.net/results/2fa54180107b4338f5c57d5bc305e1606f6e6806 | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/970b800382fe0a50bb58da89d07107b9f83ca045 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/86084f19b17ecd93ca541dcefd06f2ccc2541112 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/05371f12477c5187792b2d5ffc31564d2d782db9 |     
    sh4      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/e938ab422e264f88d21c80b143643a722742634f | ORPH
   nios2     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/34c994d32737a769596c5b7ce738f133d9a036cc | ORPH
 microblaze  |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/32f38f486e69ad488c51bef4a9e3062aefa5041f | ORPH
   mipsel    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b7fefbf00746484a45c2ac2099cdc7316fd23c57 | ORPH
    m68k     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/eedf31fe52d669a5332f0be429a3981f06b0887c | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/7120257f5a5dc8f1d00dfa32d54482a5ce238e8c | ORPH
  aarch64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b5f201e4c894923e3499b2c540ec9f697ef59d39 | ORPH
   x86_64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/ceaaf55fa7dc6b12994019fb86c40377e288101a | ORPH
  sparc64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/011a3b34a2c41b0c7f1bc6e9188f361d978ed283 | ORPH
    sh4      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/4d422364aeae673f703d3405c4200b3369ad94fd | ORPH
   mipsel    |          vsftpd-3.0.5          | NOK | http://autobuild.buildroot.net/results/062dbadf1f2f8e25747f7689974a693163932113 | ORPH
  powerpc    |          whois-5.5.14          | NOK | http://autobuild.buildroot.net/results/877e6717f0a13382b170eb92e5b9ab2574126ede |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
             fluent-bit-2.0.10 | 1 
            freeswitch-1.10.11 | 1 
google-breakpad-c85eb4a59b6... | 1 
               gupnp-av-0.14.0 | 1 
            host-binutils-2.37 | 1 
        liblog4c-localtime-1.0 | 1 
        ltp-testsuite-20220930 | 1 
                   perl-5.36.3 | 1 
                privoxy-3.0.33 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/cc01e0d50e2c86779c112d9e839d91b8acaa005c | ORPH
    i686     |       fluent-bit-2.0.10        | NOK | http://autobuild.buildroot.net/results/ac720654faa4cac2940962fa6db973caca126a53 |     
powerpc64le  |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/5f879ca5909ced97a2ea53e44294192743a93bb9 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/3537655b54ee3bd208be6da560ccac691ca07d9d |     
   mipsel    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/737b21ebb1a3627c3edf665c7fa01e57be2fbb00 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/da3cafa6854bacacbe8c7409bf740acfb19acfbc |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/255b9c84473fce6d260bbd6731b8eed0b9edfca4 |     
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/5df3a0b940860c5a690352457b7419e94a48f614 |     
    arc      |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/190e97a90d3a97371b05e988c4b5c74e2bb8b1bc |     
 powerpc64   |         privoxy-3.0.33         | NOK | http://autobuild.buildroot.net/results/83e0f1339ca4ea7369c5839c9a6bc811a8e0910f |     
    sh4      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/a008c09f45b1eb843b89d3059790e29cb61249a8 | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

  binutils-arc-2020.09-release | 1 
            freeswitch-1.10.11 | 1 
                     frr-8.5.4 | 1 
              libarchive-3.7.2 | 1 
          libcamera-apps-1.2.1 | 1 
               libglib2-2.76.1 | 1 
                mongodb-4.2.18 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/4a7e41b69f78f549c76c15367a4780c78c590075 |     
  aarch64    |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/2c7b9f5167c0d12be04449e2a9c6693237b808e7 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/bfe423f1bda364a2b2add5679f6999a07bd8429e |     
    or1k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/913fc2bab51e0880fd7bd3ab4612cf911889ba79 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5d42cd75aca43ec1d8e1e85f9c92bc323f1bef3c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4dfba9a40a6a1e1ea8f627ffd922837dd35c0fb6 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/cb8bd9d355bf2b84a4c2a8c0eb2bcc1ee3629036 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                  boost-1.83.0 | 1 
   host-flutter-sdk-bin-3.16.8 | 1 
                       inih-57 | 1 
              libtracefs-1.8.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/964c9dd654e4c76aa3e7814543b1459384d92a5d |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/d3941ec1122f27767a1f723ab2987b45fae883b8 |     
    arm      |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/c12314a25ddb5eed361f2e73bd132e60971e47c6 |     
  mips64el   |            inih-57             | NOK | http://autobuild.buildroot.net/results/51f97fb3d52f4c217991fa1e13b94a0b8b9f3c7e | ORPH
    i586     |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/1cab14b8f976ded4d7e473b36c71debaa9b91e4c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
