Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00462C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 07:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4E140998;
	Thu, 10 Feb 2022 07:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFRkR_kQgufo; Thu, 10 Feb 2022 07:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ACF940928;
	Thu, 10 Feb 2022 07:22:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A49AE1BF340
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 07:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A7AB60E79
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 07:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R1wriXc6QEtv for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 07:22:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA61260E77
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 07:22:45 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BCC78E0003
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644477762; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TcaNcTRm8zL37s5GZiXFxvfpuR1BwZIlhIMRSnsQoyI=;
 b=VkOz2hNFQeK4y8Lq9ND4mz+NZn98oXdrthWXYuB2LNszGG07YUGrMoRWt3tzXTUdrg6Fp7
 vEmSxhJzknPHu5oLdsfFVwooq3LA//iIkf6FNxASZK7El+vIZezzzKHeBoVJBqKpKAtBjy
 Uo4GbwLqMQfDLA/uDcphJp1lYj4Kuy+wZAsr+a6zdUhUpgeYXJLIm9bcX2uDawYG9F+1dQ
 B/I9GgNsSeXGZwPDEdLWLPU7NRn+W1uWEPZe4clvLhKJgsq4aAa8gAL4kshfYJxWN5y+tV
 AP97ZM0Yj8IHoExbdvw7Cih6JByu4nQ737IXpT5iYkUDVGaABfo0YjNpJBI5og==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 07:22:42 -0000
Message-Id: <20220210072247.8A7AB60E79@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-09
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

Autobuild statistics for 2022-02-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 47  |  7  |  0  | 54  |
  2021.11.x  | 17  |  0  |  0  | 17  |
    master   | 57  | 49  |  0  | 106 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.63 | 9 
              host-grpc-1.43.0 | 5 
           host-libselinux-3.3 | 5 
                 gerbera-1.9.2 | 4 
   host-python-docutils-0.15.2 | 3 
                       unknown | 3 
               mongrel2-1.13.0 | 2 
      qt5webkit-5.212.0-alpha4 | 2 
                  rygel-0.40.2 | 2 
                sg3_utils-1.47 | 2 
                 wavemon-0.9.4 | 2 
                    bat-0.19.0 | 1 
               belle-sip-4.4.8 | 1 
              cryptsetup-2.4.2 | 1 
                       frr-8.1 | 1 
google-breakpad-7515ab13768... | 1 
               luasyslog-2.2.0 | 1 
        python-docutils-0.15.2 | 1 
               sdl2_ttf-2.0.18 | 1 
               target-finalize | 1 
tovid-87c676f4aadb7303d2cd9... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8018316713099d5463e02d5887bfab38faa4f9af |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/2cf6fa7f585238132353e85c3cf12d8b03aa53e2 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/8f29828d2e5e086e0c38731a1e57e78a03cdcaf9 |     
   nios2     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/2acd2b4213e9daf1c99a5bff6a7fad03ca80ce57 |     
  riscv64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/66bf0da754768aa93c7d5ff9479bf88157300be1 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/3eba47dde018c21537d1636e532f719a0743bd67 |     
    or1k     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/19ff00944d01159cbccfaf3d8ad5d3b92163b957 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/dfb6eb9903441b1fdebeef806983b5c07eb74b55 |     
  sparc64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/17d0cc94c02f77158892cb2084092e12e6c59544 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/13a739a14e04379ffc4d7d232ed9bb03aac7a6f3 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/063bca06fb3c292edc688cfa04bf82ebcc86cead |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/5a20fb24d9f35b89b119b1b7e15b3a76db0da087 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1fee99de78187d70cdc755e8bcfc2a98df8d751d |     
  powerpc    |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/2195632ac503ef69792dfbe497ca5da8749a28c5 |     
    arm      |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/76527c72fb9f88a726afb6af7437d799e8b852c1 |     
    arc      |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/13774bf24f4dc22dc860d921a54829398f7b8a40 |     
   s390x     |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/b9eb00edc7fa3e38df4f05219f7fa40be237489b |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/4bc37008fe12a21007f543a3c4de39a2b709b433 |     
    arm      |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/a4f15d2acf57ab352a89916f2424283d63b8dfc3 |     
    arm      |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/d5430c68b6cea214f8f277a096016b0b2427d803 |     
  riscv64    |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/7171f69f51f85a3e3f92bec65dd6bbbf7806ec11 |     
  mips64el   |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/574bfde8739b9ba3daa928b82556df6818746316 |     
  mips64el   |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/50387c4fb591a12d818fdbf361fe78a17959536c |     
   mipsel    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/b7cdc5da21cde72de06177d8fb03a892fc22661e |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/56821dbcef76c80a7c523fe82586d61fec85c4bb |     
    i586     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/bda8c8084fa268058ecf198cbd5e30513bd10461 |     
    m68k     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/d84ef6090b9c0fbf80a6450367b1873e6e65f583 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/b4b7d70f285f0264c23430b8f413f9e7bcf782d3 |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/48ab2eedf9bf80293e152a095a6d08b7e284f914 |     
  aarch64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/59ad72cecefee98d62b2ca7686d4f905954d3b32 |     
    or1k     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/b65a9974017724a2cb4a0550513398020a72df53 |     
 powerpc64   |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/df2aabcf2ae07cad66b869ec4ac76702d2c32dc5 |     
    arm      |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/dcb2c5cbdd6a703eb9cb3fb44c814bfcb86dbbaa |     
    arm      |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/b9dd4b65444a2cff4cb68844d97bdb40f1681b9d |     
   mipsel    |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/f071f406feef00732f69d998453a3d4472eb82ef |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/ea44b4ca9d851f21f75afbda9f4bc97557cc8a72 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/5d1ecf9585025f3fa7cb0d06bf0a7e0600586dc7 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6696bb7570fd988055088daf0fbff00e1945724e |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c4897e6086036963b3b6ef4cc4d027a6b17d9656 |     
    arm      |        sdl2_ttf-2.0.18         | NOK | http://autobuild.buildroot.net/results/3fecb96a8063b1a28703682e9373714c1c9cfa24 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/db2eef5351bf6f50664a5d9d306c9207257e92cd |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/34c3c48e2574d1684b0621e7fa59ae9a2249c139 |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/5454298ea61c4d59e4936cba084b8159d8e3c91e |     
    arc      | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/e01b393b78c4c81e8dc17fabd61cbee7e6000fba |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/1eb464ddafc85cc24ecf97f646dc6e277e58e280 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf3ddf408b26fa8f86a545588b24882b4a7ac257 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/31dfc54636c76f2b5a13373e9d420f7b01d78cec |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/edec191fc961fff3b5669c464395474cff67af96 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2341cb5c97085d4fe5c065477e9212330d604c4c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                 openal-1.20.1 | 2 
            erlang-jiffy-1.0.6 | 1 
monkey-f54856ce250c4e257354... | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e66956c1179a7f5a9868511c8459429d9091faea |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/17f56c0d4ba7c66003d31886fe2aab17e1a2123f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2ccb85a89c9adf912704f573858425612270abc4 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/9f9f8d470bff55c0a223b9471df95b6eedeb87be |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/7d532a48093aef35eee2293e8049796eb8500823 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/7239e5ebbdf2754fdb955de61a73b6cceef03f4f |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/5155f6513a60c43843b9c2101a1b2c33de06f41c |     


Gitlab CI results for 2022-02-09
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
