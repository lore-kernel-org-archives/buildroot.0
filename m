Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBE0CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 05:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F0B040184;
	Tue,  2 Apr 2024 05:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiSbOCDWCt6Q; Tue,  2 Apr 2024 05:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FD4A401DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FD4A401DF;
	Tue,  2 Apr 2024 05:46:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98E861BF362
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 05:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F0F881E86
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 05:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aj_7g5aX_0rp for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 05:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49EBA81E82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49EBA81E82
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49EBA81E82
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 05:46:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CAD3240002
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 05:46:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 02 Apr 2024 05:46:45 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712036805; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ojrRM3rjoAzTNl4SzkZRirH2jUR1CKTBbwT/zbIFvSI=;
 b=hJHhK2glDD971tv2bKOlhah2FkZaBznevoKUhUyAdJf6XmFfwJ0hWS7WxmjeaIbb6BHYiI
 DQV0tbFc+rZe7EkzjYhJN4/rAwQ3FHsHR6XP/ZZqzZLcrDFmeavo4HOQmDHb9MjYdrdHIJ
 iup3n5TKaJpb8sHwgqvZPTdGXssx243SMIGXeenTg2IsskfsGYYW1XOdko9q2RmocE91kP
 mmZ+1BbNwNCR6LEFxZHHhvGRy0M5ILgmzjOSyRBO9gDOb2OgNW87nHaxD4abIg6xNRqnju
 xp/SkvKGLcopJX3dt8mBSCmPsgyUUIv9DinIt/FjoZHraeAk/h8/XCk4E99NgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hJHhK2gl
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-01
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
Message-ID: <20240402054645.qDc-_iaz68VcFjBv2ldlf7P6J8Yeoq9zAww00IVBF4o@z>

Hello,

Autobuild statistics for 2024-04-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 10  |  7  |  0  | 17  |
  2023.11.x  |  5  |  7  |  0  | 12  |
  2024.02.x  |  7  |  6  |  0  | 13  |
    master   | 63  | 93  |  2  | 158 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 9 
             util-linux-2.39.3 | 8 
               linux-pam-1.6.0 | 6 
                 coreutils-9.3 | 4 
host-heimdal-f4faaeaba371ff... | 4 
   host-flutter-sdk-bin-3.19.4 | 3 
leafnode2-ce7d3b13fb285c9fb... | 3 
              libarchive-3.7.2 | 3 
android-tools-4.2.2+git2013... | 2 
                    apg-2.3.0b | 2 
                    eza-0.18.3 | 2 
       freeradius-client-1.1.7 | 2 
                gnu-efi-3.0.18 | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
        host-sentry-cli-2.20.3 | 2 
                    ncmpc-0.49 | 2 
                 openssh-9.7p1 | 2 
                 sysvinit-3.04 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.4.8 | 1 
                  boinc-7.20.2 | 1 
                    cups-2.4.7 | 1 
             dahdi-linux-3.3.0 | 1 
                  davfs2-1.7.0 | 1 
                 dc3dd-7.2.641 | 1 
                    dust-0.9.0 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
               gocryptfs-2.3.2 | 1 
google-breakpad-f49c2f1a202... | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-12.3.0 | 1 
              host-rust-1.74.1 | 1 
              host-scons-4.5.2 | 1 
               ipmitool-1_8_19 | 1 
          libcamera-apps-1.2.1 | 1 
              libgeotiff-1.7.1 | 1 
             libutempter-1.2.1 | 1 
                   linux-6.8.1 | 1 
               mariadb-10.11.6 | 1 
                  nginx-1.24.0 | 1 
                    pppd-2.5.0 | 1 
                privoxy-3.0.34 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
                   rauc-1.11.3 | 1 
                 systemd-254.9 | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0d81f95cafd16dfa0c92e78e5aa8737b3282904f |     
microblazeel | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0888109b7caf817695a4b3d1a2fb395fa085719c |     
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/384e0b29924330944bd9b0e9ca7f7a4fea5eba1f |     
powerpc64le  |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/d59fac3ad984f25199c95b7ead4a714faa2965c4 |     
 powerpc64   |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/35bb51be7cbab0523143105d30a7a5a122612fd6 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/5e3ad90301335d6cd658c809a59ac5045737a1f1 |     
   nios2     |          boinc-7.20.2          | NOK | http://autobuild.buildroot.net/results/7b515ad2e8b153e7a9ebd50ead9cb96235d9969f |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c81b100429bd993e2e7586eb6734f0694955bcfb | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2fb8b9c80d37f0a80d8ad53b534e7d25f8bf9053 | ORPH
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2dffb272507039d26683e2429f4d54ef6bddd29d | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b4542ed5ad6c95f3e491748295c875257d360f07 | ORPH
    arc      |           cups-2.4.7           | NOK | http://autobuild.buildroot.net/results/39b72d4e14895f901590d7e3404f69b4573d2cd2 |     
  riscv32    |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/1bdf90bf654c6f1fdf8a8df83d9949e33503f633 |     
  sparc64    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/a0300c974a3a144d38c4236eb7d7f421788172f7 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3be028989e25234b960275eb214cb3503dfd6f70 | ORPH
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/76e8e8cfdbac5ffe39dce825a7c54319f7b89b11 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b6967bcb167d701c6c7c523e5ec3801b88ff1f8d | ORPH
    i586     |           eza-0.18.3           | NOK | http://autobuild.buildroot.net/results/349904cdd09b2a9a5ef8152e16ffcc1a6102a6cd |     
   x86_64    |           eza-0.18.3           | NOK | http://autobuild.buildroot.net/results/eead93e865ee71d5a01f9966c21238787d14d21a |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/8bbe463f672f4e0e63317c4867701018b7b83b32 |     
 powerpc64   |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/9792c6696c69348c26c25f826da1c751c4ab6b6a |     
  mips64el   |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/c85a98f01c5b758029934b337fb8bf55a7bc893a |     
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/c48d760bbdd9fbf52eab5c18dc8d6bae7f929108 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/907388c3467a52a0da8bf5d95fc510fe4d42d668 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ef25ef8b7f0b43a24af81e3f0ec81569610f016c |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/089b0ff095210d91d48802a8d151ec2f2e79884c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/03f372f4e739219751f5374b7739dce2975d1377 |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2567e5847ba4fed442d33d4aff3d3f2577c1cdac | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0166bea790726b63986994b5fd0fc507338113d8 | ORPH
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/f16b4b99b93821970413b15c9736f4c57c503c1f |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/3147ac55d49ae653e5e847eb3a8d4b69b91a6f10 |     
powerpc64le  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/f9a83ebedcad91e11238ef008675119dae0c994e |     
 powerpc64   |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/7c57aa774964aefb697ed1b9e11f032677620d37 |     
   xtensa    |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/d8df09e12dfaa867adc2177d38c5a3358c7b25ea |     
 aarch64_be  |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/54c98cd2a0fce0ae67cd09134df3a22a1b8abcec |     
   armeb     |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/91c9203a499c97b8db38d2828244830c6496d3e1 |     
   sh4eb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/394ead720fc11435894d2c70a18ed736d2c616c4 | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2e0d3c88aacaacd52725b352d6e30eb71d3ffdc5 | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/30b7c6a6ae7146ed32b7dd4ba43f95eca40abc0f | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/de25864bbd9078f77447bbee6910546ab9c1ca04 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4bf48e1f0af9893d50da614f58c9b071918e529d |     
  sparc64    |        host-scons-4.5.2        | NOK | http://autobuild.buildroot.net/results/7aa4964ee14ee278171316c435053736c2e46a6d |     
    sh4      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/deb6fd311dc80ec03e7d917d889b15d3694aa715 |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7dbc377ff1c2968670c9f404a4b84c1d8d19840e |     
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b91afd6a332ca0fa74ad3d2c4514e5e147ca3477 |     
   mips64    | leafnode2-ce7d3b13fb285c9fb... | NOK | http://autobuild.buildroot.net/results/c0c72b1e7d865401403a04b63a2ab1e5e30439f0 |     
   x86_64    | leafnode2-ce7d3b13fb285c9fb... | NOK | http://autobuild.buildroot.net/results/09bc07407e47a5f0ba55656c434e3229ebac5560 |     
   x86_64    | leafnode2-ce7d3b13fb285c9fb... | NOK | http://autobuild.buildroot.net/results/afabf50d1dbf03de1a69944749bda519f8f2a37f |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/b614d82cdc23c1ce42947f86fd942b2bebc9aa29 |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/724799f96a31f39b3aadf86db486ecf19e78ca1c |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/6bf9c99ef30a3571f428d910506e4affc526ce24 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5c249130c1102526e50c4e37e750ef657f18cbc7 |     
    arm      |        libgeotiff-1.7.1        | NOK | http://autobuild.buildroot.net/results/8af173449d06090a4808a59a1af6dcc6559a2088 |     
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8c4f112aeaa1e4c7da7adac975083e9aec9ff8a8 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/efaaf210fd3a15cd59625e982b0f3186650bd64a | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6c9f666f3fcaebb3bccccf4a0a2b111c2b344812 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2d63d12150d99a5cb941fe3bfd4fc7029bc28f0b | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5945110f2c3ee1a6fab8625d2a10bac4d6306b32 | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3c65068edb18d07d4b5792759eac4f34bc312d44 | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7db30eac1e3e89db202eb2e3756f149023208981 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ea833be33e0d65d6ece5393fa875cf3a8d970f4a | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2f3b3ce8a5e16337f0c35894ca14bd9a6a0b8e8c | ORPH
microblazeel |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/14597730892c767efd72fb0a7a8483ec35fa3be3 |     
   nios2     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/771acb7a85b671b5e88bfe6fb752e87c9a9bae6d | ORPH
    arm      |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/d603197b8a2143f7e22dfb37beed5330d8ef782b | ORPH
   armeb     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/5547f19cc1ae35a495e19eb70ca78185d425c99c | ORPH
   nios2     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/a42e8ece1fb0195051e1f0c14e0cef9138af5395 | ORPH
    arc      |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/607b762cabcceb0bba2f98eb93cdb3366e5c2f62 | ORPH
    arc      |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/34ce32a3d75c992746b856b869edd217b691bdb6 | ORPH
powerpc64le  |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/ecbc22d18a6ca1056f1346ce74b8e14e909cc66a | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/1482db3eb81efb5ea476274cf2a979757be7fc2a | ORPH
   s390x     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/d2c203f1e52d0bef7fa3bece6b21bea6c7a6a6d6 |     
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/e6ff539bf258c706170dd10d55fb6fba10deabd8 |     
    m68k     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/9f1f41c0c6275aeccbaeef0dd1d3180989d565b8 |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/bf895280f61d67b00be82755c934c7b2dd4a9ed6 | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/887f2c871324a4c6514e189d7814ee3bb419ef9d | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/a88145fa08177c07f7c0ecb541e2dca3e6b5868e |     
  aarch64    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/2f02d0a3f13235b83066615fc69821c6fdb87df0 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/86f927668e7bbd8a2ce0dc4f894eff638f8ac367 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/bb2d8ff156814fc8ff13ed7363b45453fe72ea88 |     
    i586     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/02b97a440ee74a7563cdc41ad36ce73418a0c501 |     
   sh4eb     |         systemd-254.9          | NOK | http://autobuild.buildroot.net/results/36efcfc76c015c9b4c955c13afa0f81a98b529f4 |     
   nios2     |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/aec4b112e40935b7cc6fd2c9aeedd9f909c42f54 | ORPH
  aarch64    |         sysvinit-3.04          | NOK | http://autobuild.buildroot.net/results/0dad7119a8c7ea1b576193ac36d0decaa8733b42 | ORPH
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/fcae5c6f0e31e9bcde6147d46356ecb39194083f | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/35b0b93b4abe1013d9c61af518f282967a160e7d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/79fa6fcec6cbe0e630a0f67633b37a6532831dd0 |     
  powerpc    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/5a0933d6a2ef9904ae9a662275e99095fc0e4f67 | ORPH
    arc      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/f572f01eb82e6210cd4d6bf0427005a2037b9432 | ORPH
   mips64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/d764de8f6542e7b292b29b087e850bb051306a19 | ORPH
  aarch64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/6a1f968df272826e059be9023c3430d564f4a9bc | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/4037a98a21d78bdb65b7bf76a9726d7864699ab3 | ORPH
  powerpc    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/6816ac9a78de94bea4dd9997ffef27fc3be2abf4 | ORPH
  aarch64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/51c9ce553717b105fa8261b53665770ed3938228 | ORPH
   sh4eb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/451347a6a4d02a271b9a3ac29d06581ce0358268 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

       freeradius-server-3.2.3 | 2 
             dahdi-linux-3.2.0 | 1 
            freeswitch-1.10.11 | 1 
  gobject-introspection-1.72.0 | 1 
      host-oracle-mysql-5.1.73 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/2b5e4f5797babe27d7b22a8a4aa545c3680fb9af |     
   x86_64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/191d01fd8f4926516550ccab2c59f4970c7f7d40 |     
    arm      |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/06d54106ad01793e126758bdc6f624eb8b8ec31e |     
    i686     |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/b95b250a2aa34fb93156f1a61461de9189f85f77 |     
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2b1e1b4aa4bd334a5cfe9fbc60aac16ea01f7e4a | ORPH
  mips64el   |    host-oracle-mysql-5.1.73    | NOK | http://autobuild.buildroot.net/results/8809378afc8d3106a2b1142a8c1ccbf2e0a22a36 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/3a1b63078ef8e755accdd937fa9eb140ba4662d2 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                       unknown | 2 
                flashrom-1.3.0 | 1 
            freeswitch-1.10.11 | 1 
  gobject-introspection-1.76.1 | 1 
               trace-cmd-2.9.7 | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/b1067b0ecf50cf7b08f707965884b8ad5f1cd67f |     
  mips64el   |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/c98432f49dfa8a5285f056ca466f7d0363512532 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0f5638c0beb400478693746446bbbd34636677ac | ORPH
  riscv64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/1ef5309e52869e663308af206be08e97270204ff |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/89a82174b8b71a79d5653c60884729990c1c01e5 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/9355f282c8e401121022f3de883817d2f93406cb |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/4b907e17d7032b39285d0c9f99c066d2d4271cf7 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                 dhcpcd-10.0.5 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  jack2-1.9.22 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/acea501c0f79baeacc54b64ac9c51632b1e1c06c |     
    mips     |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/79bbd7da05fb9ec1c6f9e1da41cbac8ae13def88 |     
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/9d2e68dc07dca16c62754401d774b8c95749e816 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/95aee43c8f051c92206155a3ea4babae7b7587f6 | ORPH
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/738ae4dd8130bf8a61f544d0cae2463c64b30bc1 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5774c344b58b90bff7addf18fa0973025ac80299 |     


Gitlab CI results for 2024-04-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518823814  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518823979  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518823835  | ORPH 
               TestIperf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824020  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824132  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518823898  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824170  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824248  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824254  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824272  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824305  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824314  | ORPH 
       TestPythonPy3Segno | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824316  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/6518824317  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
