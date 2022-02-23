Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBC0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 07:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80345825C7;
	Wed, 23 Feb 2022 07:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJgLSZV7EyzV; Wed, 23 Feb 2022 07:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B86E813C1;
	Wed, 23 Feb 2022 07:09:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 047A71BF85D
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 07:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00DB281379
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 07:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwV0JQAKydrR for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 07:09:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EC1D825C6
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 07:09:34 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 861EA240011
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 07:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645600171; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MUpetTs5Lk+CPBOGLAUqWm36LItjJxc1uJv3heNli8Q=;
 b=N2FwCohm6ecXQbODBbmt23JmFVqwCnOHptYVEYtZX80ARFsjGIIF538uwN9hnwh02yURAU
 gTSwsQr7aJki1ZAv3E9Aa2W+UUBbYa5vzfzSCcojwK91mpD5qgHqThCQO2E70dPRqAftU3
 yBT7HOPHSSR/xJbPxm7urHQppYsOA8AL8GT5tl1FXYoFB+WR+IBHBRxiQK/NHIXpPTFw8u
 //G8hMmMRo9fLkEpGsl17wGJ9TkwlkgCDoe74GxJcX++xN6N8QAinoGGZBh05NxbdUUeM8
 GmUuqHXHlS9tgpcVtVk6xGoTl6Zj83TweE3UnnGgMF1cp0Do0NDrGtuzY9/eZw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 07:09:31 -0000
Message-Id: <20220223070936.00DB281379@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-22
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

Autobuild statistics for 2022-02-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 51  |  5  |  0  | 56  |
  2021.11.x  | 21  |  1  |  0  | 22  |
    master   | 48  | 38  |  0  | 86  |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 9 
                       frr-8.1 | 6 
bpftool-a7f0e7f057283ae8af3... | 3 
         python-greenlet-1.1.2 | 2 
    python-pygame-d61ea8eabd56 | 2 
android-tools-4.2.2+git2013... | 1 
                    bat-0.19.0 | 1 
             bluez5_utils-5.63 | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-7515ab13768... | 1 
                   gstd-0.13.0 | 1 
                  hostapd-2.10 | 1 
 Makefile:733: target-finalize | 1 
                  ndisc6-1.0.5 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                safeclib-3.7.1 | 1 
sconeserver-6b932d7d8dbb700... | 1 
               target-finalize | 1 
tovid-87c676f4aadb7303d2cd9... | 1 
                    vlc-3.0.16 | 1 
           wpa_supplicant-2.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/401cd7b23542ada9964967223e691497909acb8e |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/6b2885d31972e3dbaab19a44261fb39dd0f74ae9 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/d323cbea5acdf95b2d1fab2f3e8c288fc240247d |     
  mips64el   | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/c5ad46e33e59cb44c717591ead71228b9316dd7f |     
  sparc64    | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/9333c1adad2a092c5ebf2114f89d65c8d888b867 |     
powerpc64le  | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/70457d39dfcdc098c35b8371fb13ed6a015ba85f |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/121ac2cd087dd09e12538e444556d35f77e5e5fc |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/013afc7bdadef2b7a8e8a17fac30e5c930afe3ee |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/6a02d29db5d53c52a529f6ee85872d40b5aaf6a8 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/4ea830db8c9c0c891db342c3e363afd98ee3808c |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1da1bc313eb6df3fcb35f17673a3cf6db8e1b310 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/2f998c586df820c0388e82d7462403108380ed1b |     
    i586     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/5a75b1613f4ae528d901acef723b184a46a5a963 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/976266955282494bc032ec4de0cecaf953e2f0a1 |     
  mips64el   |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/196b102d0b8bbd72bfd584ac201687ca44e78c3a | ORPH
   s390x     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c7e702d27480c75100063690e74cbb7c1aa48e05 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8f29d20c39431c4a957465396820653d5d363cee |     
   sparc     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/f2a91b5751c2dc47169640f33fc1d41180b4b499 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0a5f4ec1bb0d7f5f37d11ed10c1f12b41b817c82 |     
   x86_64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/f98cb35628ebb0dbfc33d1e8c9b2683e326a0e56 |     
    or1k     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/f01ade768a188bea472efbc93caf7fa6ec3f8971 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/17d99d58e5ba33f3a3c4ab2fa329471532f8a041 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/61b7f18372e8a350a9fe2e48cce05b412930fbbb |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/677a90d49cd14af1032e2bab200ae949840ee714 |     
  nds32le    |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/b33dc422fe3d775ee88753af1fe9016c38aa71ea |     
    arm      | Makefile:733: target-finalize  | NOK | http://autobuild.buildroot.net/results/6112e1830ce608abcea4a26b659c10e5ff09a66a |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/1bb5eda1985ce51da9dac5be008fc588b0f2efaa | ORPH
  aarch64    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/9856fb75e08fdda0a08e47f0326df97000a11547 |     
    arm      |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/5b9b5f55e57d6f5de6bb88488dd229975c649c8d |     
    arc      |   python-pygame-d61ea8eabd56   | NOK | http://autobuild.buildroot.net/results/7c50a40db75709af4e7ab8033e02ab1e7f831e71 |     
  riscv64    |   python-pygame-d61ea8eabd56   | NOK | http://autobuild.buildroot.net/results/fd4d8de9849df2baf47864b2dec7037ce286005c |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/5191600b463cda078203eeffae880ed989f8ac0f |     
  sparc64    |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/af24e1541c01261343c5fe0c7369ce9020dde09b |     
    arm      | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/83ecf772965b4586eaea2682871a85732df7d62f |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/fc82ccf1fdbdd9a3cd51ab9c06c57c01a88955a8 |     
   xtensa    | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/67f3a0263870558ae1ff3f5c66db248d5c1bf3d7 |     
  riscv64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/0a757c5ffb8af9d6d2589c72956f7d65bc40693d |     
    arm      |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/318f9ecd4060d34cc8385891b56d0a0e6275f2c9 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                haproxy-2.2.17 | 1 
                    rauc-1.5.1 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         haproxy-2.2.17         | NOK | http://autobuild.buildroot.net/results/47acc25a1f47ce4f3570b8b54730120420267286 |     
  riscv32    |           rauc-1.5.1           | NOK | http://autobuild.buildroot.net/results/04d5b7f8d86cbb7fe3946269a7d9145dcd1a6a5e |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/5e0b1bdecdf8009344eedec86bd382c65de9fb34 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5260cd671d0ec0a8e1440b84959f1187321e2060 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f8f4a9d6d1de4f7b2f482a29c1f7e13feae76a57 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8a6e751bdde880037f53f312f7fdcff413810a92 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
