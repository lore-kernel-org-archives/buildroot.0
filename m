Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B336EE57D1
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 06:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B038A81FAD;
	Fri,  8 Sep 2023 06:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B038A81FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vCut9sVbAz_6; Fri,  8 Sep 2023 06:31:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9897F822AB;
	Fri,  8 Sep 2023 06:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9897F822AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4B171BF397
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 06:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6552560F88
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 06:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6552560F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVZ2SfE5OkNE for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 06:31:20 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FD8660F74
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 06:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FD8660F74
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8528520008
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 06:31:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 08 Sep 2023 06:31:16 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230908063122.6552560F88@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694154676; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eabFqcpp9GCX+eaEmqJJeBiAHvADqfom6YQdezJOaAU=;
 b=ZTkzM4ghQWYWqJvTaC1rEz1sZKD0u4PWeh8HG4222VCSVJIYVbAjNZusgPj8dZgkXtM1+V
 /Zt7ERfRTRgxVLvO3Jc+0iYnfHJ6J+4nxIpy3toh5CqITKQ7BFnAuaQP/n3GuRJSSscKqr
 uo245o78wE08WI6i0EzemiGeZg5ujKrtibWNanDuHCwdVRRPOYg7rsycKXhwl8DqKebRQ6
 V7ANXCewPhYE3osDv9cpjzMFSZuCOnd3olVANZWo4ymmLy8yR/HBpYWWw9htPvJ62gfgIF
 kGRbQauqsS5xqGi771Yo0gl9YB37sYjnlM2pK4x6GsUjFDP1rmFwlpGVGb2K4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZTkzM4gh
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-07
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

Hello,

Autobuild statistics for 2023-09-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  |  2  |  0  | 10  |
  2023.05.x  |  7  |  4  |  0  | 11  |
    master   | 78  | 57  |  1  | 136 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.39.1 | 6 
              host-rust-1.71.1 | 5 
                  linux-6.4.14 | 5 
                elfutils-0.189 | 4 
                  cairo-1.16.0 | 3 
glibc-2.37-2-g9f8513dc64119... | 3 
         host-sentry-cli-2.8.0 | 3 
                       unknown | 3 
                host-go-1.20.7 | 2 
              libxcrypt-4.4.36 | 2 
               linux-pam-1.5.3 | 2 
                 agentpp-4.6.0 | 1 
                    brltty-6.5 | 1 
check-11970a7e112dfe243a2e6... | 1 
                  conmon-2.1.7 | 1 
           dmraid-1.0.0.rc16-3 | 1 
        edk2-edk2-stable202305 | 1 
                  eudev-3.2.12 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
               host-runc-1.1.7 | 1 
            libmemcached-1.1.4 | 1 
             libopenssl-3.0.10 | 1 
              libopenssl-3.1.2 | 1 
          linux-5.10.162-cip24 | 1 
                  netsurf-3.10 | 1 
                    ruby-3.1.3 | 1 
                 uclibc-1.0.44 | 1 
                 wolfssl-5.6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/2cbfc74f18044956ef2a9dc16352d7f9eb339602 |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/5d6790d5f9b8c2c7553824ba9bd41a9eb9cd39a5 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b111ee598d4276f99b8684a8f2ca3197a31b75da |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/add75de0f130a2e3e59f6864db9a715519db7afa |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/cd62ca913465aba1c14df269d934b9a7c4463ab7 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/36f50553f16c859cc67cd6d096e22a9a93c02d13 | ORPH
   s390x     |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/b2b1c1c8604cd2ff2df7078d358b14f7dd46b004 |     
  mips64el   |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2519f54bfb6c85769a26d21e5ff751a0d6722895 | ORPH
   x86_64    |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/256d9bf5e254f05d4a39a196d75bfc1b7c7b46c1 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/917ee5ef73f9bf2f1b5d5968df53ce061820dc23 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cf6a51436f3d6420f6dbec4f2d3160ff199a0cee | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b819e1f93f4c8b2980d1ed3e66f3a06fe10e67d7 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9fca77741441033981296bcf75bd714bf0152b71 | ORPH
    arm      |          eudev-3.2.12          | NOK | http://autobuild.buildroot.net/results/036a4f0f5a4be43e0094a3bad3e58be08d5b52be |     
    i686     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/b929ab71320c2a0083261232ecb0e51272b5931c |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/1a262cb03196c98fc17c66f52c9d767cce2a6a96 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/68e33701522e8aed4bc5c1de7e923c25da0b8d33 |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/29c54bcec3289dd32d6f186ca45cb72aaaf5bec1 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ff5bcc3051a869ce678b74f5d6bdfa6846fff3f1 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/136861816cf7f1ccc4ad16bd4ee42a78af93a742 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/27b5f994d4f9bd366f2fc6e4abe3f77a8180d05c |     
microblazeel |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/1c37e61bca533ed0b349395fb89992e06a060919 |     
  riscv64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/4a17a1abbf5251d743f66e56f43367ad40f0623d |     
  powerpc    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/5a5aae8650113bfca6cb8e97374a309a4f569af4 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/81e3a76a93f59cded4e78b40896731e756db44ab |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/fab06b07115879c580e5851855fc3392bf4e88ad |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/2c7845ac67921932821e6721c79f017842913250 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/467664c73601ed3770f1cf5ee88a82b932f46f75 |     
    arm      |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f97ae3d50b277616457ac05ff385fe9b8af4d41e |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0e967470d90b88e440785f8ee31df2c57c9fcd30 |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c23f5064a1918bb28954a1cf984e18bc3ab32d30 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6af9371ad214f7a480ee27015fd15525e62cfc9b |     
    arm      |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/44bb743e422b3c98492151abd380251651494418 | ORPH
    arm      |       libopenssl-3.0.10        | NOK | http://autobuild.buildroot.net/results/7b576d3386920fc6615da34dcc2dec10fd9ed8d6 | ORPH
    arm      |        libopenssl-3.1.2        | NOK | http://autobuild.buildroot.net/results/5f1bb33bd0616327f6a008f98885cfc4efb72681 | ORPH
  sparc64    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/8931688b81bf3945692a91cdd0a23e2589f8f1d1 |     
  riscv32    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/393c71842d859c9a0af07274303d3cad84a58497 |     
   sh4aeb    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ad9aea65100b0b91adfe150b2a4e21ffb64caede | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/abbd12005d97a5b3c7abd73809626cb55453d534 | ORPH
    m68k     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/6eb4b03a5b25e1671f586e132279022ae3a7f1a5 | ORPH
  mips64el   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/744e2e03bb1214f9769d74d164ca4bc5ae53c717 | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/5b7b1611a84890b090b33cc63472d712ba8b3120 | ORPH
powerpc64le  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/ebb5eb260061beff4a001a0078e32a9e974dbac1 | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/d244964e29b630460f1ec82011e41024732364ee | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/cbf470cf0fe8e779aca563bda567e50689304879 | ORPH
 microblaze  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/db775446ee21f26053d8f45eb7c2e671c63b9d7e |     
  riscv64    |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/c900f7e91e208cce0f58cbdc5f9ae8723fc1e029 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/925f92686ccba4fc42d397187a44d5746c038a8e |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b048ac2d03a0b4ebe485b560e81cbde0bb62f9f3 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d051bf2d577b5e622adee40809cf19fe93aa4712 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/b212d97bebfb997130c236cb6ebbd0e19c2bbaa7 |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/3fc911ee19d371f6cfe1bb779620b15b54f5ec36 | ORPH
  powerpc    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/3aa1f0fc4e581cb136986bd964e8c56c6ba7cabe | ORPH
   x86_64    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/5b5027e92f2a7a4ea0e0514fd1824df01af130d3 | ORPH
microblazeel |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/d01079fb1603f837810ec1d8a63fc0f4e5a728cb | ORPH
   xtensa    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/6ab5ea6eb77f23405cdc714e63ba3bd2d1b5c299 | ORPH
    sh4      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/437d86adff033d1a941102801b71137dbc91f0df | ORPH
    arc      |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/f25ec657f5cdc6536d4b611dc076d54da6c3a3da |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/c7e6acffb779d39d3cf3921b353644547e21714a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c5c1ca23c5d175073d2f425df161eca51fa6b763 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                    bat-0.23.0 | 1 
            host-binutils-2.38 | 1 
                    olsr-0.9.8 | 1 
               poppler-22.10.0 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/dbe23f9c7f77e99a9b2d3f25604555e4774910a6 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/242a180804f4c6a7fafb7e52c9c2a95edea0cc57 |     
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b6d7a75e683fb3024211418af57c7b24fe149108 | ORPH
   xtensa    |        poppler-22.10.0         | NOK | http://autobuild.buildroot.net/results/1e4a81c4def2a9b7006661a5494ba983cab2c52a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
