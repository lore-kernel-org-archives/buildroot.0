Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247D4C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 06:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FAA483B3E;
	Fri,  5 Jan 2024 06:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FAA483B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MoI3HXHkw21T; Fri,  5 Jan 2024 06:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48B683B41;
	Fri,  5 Jan 2024 06:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B48B683B41
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98AE91BF31B
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 06:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E83D4015F
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 06:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E83D4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRzNuFmX3Y0Z for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 06:47:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9A5C4011C
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 06:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A5C4011C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 320B5240008
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 06:46:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 05 Jan 2024 06:46:58 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240105064703.6E83D4015F@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704437218; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tVkaPwrexTrbTvIsniU6usPfqLgSvSbO6QqgJFm5Sh4=;
 b=DmixTU5mfPOfRnkwNseQKXfUxpWqzKAp+jS/LGuAiX15sEU1DQaS8YA8+BFxaCUmOkNFPh
 B4Uln6mDwLAf05VJiH2Z4dDwPzaYsvjSiTAb9MmmKFqHvNfTwnbH8lttCr4o2Sgvyxnf5E
 sIAruLXwCMQjIXQGyBg6R1Zu2GU74nkSYYH1yvGIkz05QCHkjqjs5V1G6JK214NJv6four
 /bgSgGGJdLp9nh7v0bNreeolD9jVp5/w6jH3PxxJ9Ubf/I6XWf3VfALJZ1uvFtwu4ASWPt
 +CHin2VLu8doKciNu/Nj3ShH1CnctheA/xIG1WvY3My592DQH1ltVDhzpgv6rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DmixTU5m
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-04
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

Autobuild statistics for 2024-01-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  3  |  0  |  8  |
  2023.08.x  |  2  |  0  |  0  |  2  |
    master   | 60  | 46  |  0  | 106 |

Classification of failures by reason for master
-----------------------------------------------

                     exim-4.97 | 7 
  gobject-introspection-1.76.1 | 5 
                   linux-6.6.8 | 4 
                 openssh-9.6p1 | 3 
        host-sentry-cli-2.20.3 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
               ipmitool-1_8_19 | 2 
            optee-client-4.0.0 | 2 
                    brltty-6.6 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.2.0 | 1 
                elfutils-0.189 | 1 
                    fcft-3.1.6 | 1 
glibc-2.38-27-g750a45a78390... | 1 
host-go-bootstrap-stage2-1.... | 1 
              host-rust-1.74.1 | 1 
              libarchive-3.7.2 | 1 
                 libnss-3.96.1 | 1 
               openblas-0.3.25 | 1 
                    pixz-1.0.7 | 1 
          python-grpcio-1.60.0 | 1 
         python-rpds-py-0.12.0 | 1 
                python3-3.11.6 | 1 
                rocksdb-6.20.3 | 1 
               trace-cmd-2.9.7 | 1 
                       unknown | 1 
          xdg-dbus-proxy-0.1.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/2649398beb0b0078a4a430d498c0850cc71313ec |     
 powerpc64   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/ecbf426f6b0ff920a51c1674b080c35edf5db859 | ORPH
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/042dbf342c3b36afb1146b748a635ca87de41dcb |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b1b8aa43d4a33528bf32378c6110ca9bcecfc5a3 | ORPH
  sparc64    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/b58dc5f7b43a8fb48558e7b973ccfc5946af1510 |     
 powerpc64   |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/3d8b6e0ed7bd817ff5b2bdbcf0853400634ee3b4 |     
  powerpc    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/3960500b7c2f87222964f1993fddb60020d01195 |     
 microblaze  |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/5b8f1f0127e27f1ec28a11a97eabf0c74c892651 |     
  aarch64    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/00883d929d454c57001f5edded59715eb9d81da7 |     
    i586     |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/03c17472b8eb072c403ebe20de6117947427e445 |     
  powerpc    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/448b7fd74cc1ae74edf6c4f29680ef1c4ad5c399 |     
   xtensa    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/f99713c83e057ebb00034ec82d62357dfdcd6fb7 |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/29063fc4dff2f0cd78f10a730d6eb8e190a382d3 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/73678374649ccb562d517cc33329a6fe2ce726f0 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0586bc38fa801c6a35faa48179f61b91222c0f6a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/79b49055ebddd713af3e9b0a7741d096c92eff87 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/22d395add9d3d074f9e2708a958df7baebd09bb3 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d11e8839545bce484a12bf23ccb9c0101078a8b5 | ORPH
powerpc64le  | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/398e0c263f7189ed1795f5dffcd59544491d309f |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/a599f6a6b45d049f8a497b1ced91b97dda79f626 |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ae497082c3846d6aca7e14b986a02bb4bbb55643 |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/4398bf699d1910f15c22accb55c0253e8e0bc8b4 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f5859a7bf3f26f887f43d9ea1a4f87fb9e08a09a |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1e85c8a93bbbe088992ba00dac94667300c25a47 |     
 aarch64_be  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/751fce591df7966cd322236c381e30eb37cfa8dd |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/8451fc5ac132631c075ce0a3bbc00ebb5a4db272 |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a3ba5a489a70eb0354539b7cad629029a3d50b95 |     
   armeb     |         libnss-3.96.1          | NOK | http://autobuild.buildroot.net/results/1bbc07c77ff2d21f37a2f169882b3f1f6cfbe204 |     
   mips64    |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/d262d8c70053c6110a90f36d68a9203d614cf605 | ORPH
 powerpc64   |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/b9b7f442da0f20cc74ca8f8f7ee2957fb0981768 | ORPH
    mips     |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/672588167b376b7948c7cf664f18e4085b0f9435 | ORPH
   mipsel    |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/7114aae49c595db9a3c176e76da81eeafb268346 | ORPH
  mips64el   |        openblas-0.3.25         | NOK | http://autobuild.buildroot.net/results/69afae9dc37573ec8acea631852ac7baaee6466b |     
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/445ae27cfcd33c03a3f29bb91e3daff9d6cf27c8 | ORPH
   mipsel    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/9d38aba707b08b288f60aca0660fbdd1b4931076 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/d41659bfc91a7ef8180f541a7b9e3509e65bab83 | ORPH
    m68k     |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/03797d419e9e7497a1f52503d4f22f5e501dd5ad |     
   nios2     |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/d63eb7c8574366377760f5ab2eaec02f46173975 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/edf4575b7207d342c715cb6f54794adf4574d2cf |     
    m68k     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/273935f79c3b948b5a7f0dc634757030b6d9a85e |     
  powerpc    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/57d84ad9ef90b192ad45eee4b3c0f3fafc2fbba4 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/c0266675f192e386d0945ee2e0cd6a5047322923 |     
powerpc64le  |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/7c3cf7b25309fc937cde8a33c804d92d10a3453d |     
   mipsel    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/631600a75f51e3b08e9e87ecccaf47998abde980 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/2ca2556c63adb7d99439132da08bd8cb73c663bc |     
   sparc     |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/80d50615a99c1871266248f38ad1d9c6ee882118 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 1 
                  jack2-1.9.21 | 1 
               tcf-agent-1.7.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/0ee611de61a666ab0a37461f1de1a8b57c5704a4 |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/2e1aaaea2c914111ceef42313a5a6c096645b459 |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/644934448d1d5a6a3099bc3d6e43af708877c0a8 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
