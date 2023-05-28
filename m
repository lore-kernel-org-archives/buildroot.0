Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD6DC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 05:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1194414D1;
	Sun, 28 May 2023 05:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1194414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFtOufKvz0aT; Sun, 28 May 2023 05:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38DBE40997;
	Sun, 28 May 2023 05:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38DBE40997
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1AF1BF2CA
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 05:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36B0E40997
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 05:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B0E40997
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjamO_kqv8nR for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 05:33:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF47040315
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF47040315
 for <buildroot@buildroot.org>; Sun, 28 May 2023 05:33:20 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5EAAE0007
 for <buildroot@buildroot.org>; Sun, 28 May 2023 05:33:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 05:33:17 -0000
Message-Id: <20230528053323.36B0E40997@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1685251997; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JshAPHFTNBRiGuTBAhNHdJf01t/XD1h8cZdL3aYeajM=;
 b=G9KH9cQbWCVKcNpkoxibnzEaaaO6e5e16EsVFjLTDT0djAG3Ify7fiyjG7lIt/lM0fF7h0
 JgbeInQ6cdeB695hp6PXEQMQL77k9XBROOyPyyStcIz9I4kKACqzeeJqualBCPuKZiuHf/
 17SFBUmJ4VvVv+pkgk5VuQQMv9080IOMvpEnb7ldapQ1uKlfA2KWtpmgmnj0hgNliEdELJ
 1EJSy/KoAGdTZERZC5ZZ02LYzYcZ+/UAFOrUx02scMqboUr16BlCQnfPqiAi3hTQp276ER
 JhOls18q6DC4/CXCrzZai8LbbbLzKsbUyiqx5GDNkb/gCMVuUmq+qkm9bgs2pA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G9KH9cQb
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-27
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

Autobuild statistics for 2023-05-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  2  |  0  |  4  |
  2023.02.x  |  5  |  4  |  0  |  9  |
    master   | 59  | 41  |  1  | 101 |

Classification of failures by reason for master
-----------------------------------------------

package/sdl2_net/sdl2_net.m... | 7 
            host-binutils-2.38 | 2 
               libglib2-2.76.1 | 2 
                    mpv-0.35.1 | 2 
                  ntp-4.2.8p15 | 2 
                     php-8.2.6 | 2 
           at-spi2-core-2.48.2 | 1 
             batman-adv-2022.3 | 1 
                 coreutils-9.3 | 1 
                     efivar-38 | 1 
               fftw-quad-3.3.8 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.74.0 | 1 
            host-binutils-2.39 | 1 
                host-go-1.19.9 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               host-runc-1.1.7 | 1 
              host-rust-1.68.2 | 1 
               libcap-ng-0.8.3 | 1 
                         linux | 1 
                   linux-6.3.2 | 1 
        ltp-testsuite-20230127 | 1 
                mongodb-4.2.18 | 1 
    python-cryptography-39.0.1 | 1 
               syslog-ng-4.1.1 | 1 
                   trinity-1.9 | 1 
                     znc-1.8.2 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/f37c55bf51c0309cb286e75540c35644b7489b02 |     
    or1k     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/3ef0c37144be867485ceea654b31064259d070e8 |     
   sh4eb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/5294f893abc65e48fe624bff4f21b5f0470de33b | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/70fee75cf97553aee0f91e0ec36f09d0cfd891cd |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/ae021edd358ce5a5f5fbe54c4ad3623e3eca62b1 | ORPH
    or1k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/394733daa32a0cea62485232299608b4115e0dd0 |     
powerpc64le  | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/86eb42c8d756cfe103906f2217d34ec874930751 |     
   armeb     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/5c38c470aef5f80c30a46a86abf0a46ecd94039c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/a30d7bda0c1ff2d4df601d07d192abd40936fa09 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/1b162cd628f7054bc8f3d40d308ce03fa4475958 | ORPH
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a24086c9feb78bb421f05a6866a290aed58097d1 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/68f653d2771e4bb773ce8359960a3dda8a377653 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3e9c75af278dedac8e77814241e986b412656746 |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/ff4f9a4cb768cd7515c3be05f1a64fd8f5adc659 |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/cc2be1d9e88450749e04417913667c106b563910 | ORPH
    or1k     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/19b210660f8cc9d6d24ca4d562be0f84130e47aa |     
powerpc64le  |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/e86aa33b23f2fdab008c19f05037572cd92d8948 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6690d3bbeeff7abddd65886e902905e903dab2eb |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3cb5627736eb35eb66ebdbb7f4678c7752a95c52 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b7eaf21f4441d9f7a15f19f4acca99e8e37576cf |     
   s390x     |             linux              | TIM | http://autobuild.buildroot.net/results/9cdd506e77c37fe63fb75be8db661ad4226cc7e6 |     
   mips64    |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/4ed149523a226e2b4597d0c39eca0764b7af21a4 | ORPH
    i586     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/46b7b01a7a40ce1ec8d9256654b0a06e2a3e8950 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ac8dae81aa730560ad1516c6c8c3113fa486154c |     
   x86_64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/41ccefd1543ec505837f9891b811c425bd356129 |     
    i686     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/212fb510cb9b43d7bcd8f402573cb935d35edfbf |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/fa4b9013608e185f691a92e38c388a9903f56b41 | ORPH
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/95baa9b02619a360c1f59b55a4ff03d642eb7ac7 | ORPH
   mips64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/18cf0ebab300391312733a45fc4f072a158b07f4 |     
microblazeel | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/b3576d479c74a716d13237bf5b7249e36c93d2c0 |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/7368520791ba38c215213e83e2485f1fb96a49d2 |     
   mipsel    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/6ab93e62f61793986b4f011259b7a71af30a41c6 |     
  sparc64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/77819092d43e89856e075aa5dbe83fe124f3f306 |     
 aarch64_be  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/a636deef57b15e6443f8ab65864e41749ab8980a |     
 powerpc64   | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/abf5eca06dcee2b3d29d7e14a2a188a1347b408f |     
   sh4aeb    |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/5fcf14ae4a687872c437d459f52a7d1fbe7f6efd |     
microblazeel |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/686c85445a9f5b15512e5ae943c47204a10faa79 |     
   mipsel    |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/db8f835b6dd0a7be838b06019ee3126eb66c85ac |     
 microblaze  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/bf0493db7001821ef4d378d29af864105e2767d5 |     
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/6e8b45f067a102a58fcfe8872ff716cf2b6b5bd4 | ORPH
   x86_64    |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/f0b16196666241cc55497bf20eb9edc0ce1a600c |     
microblazeel |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/db0225626a7a9b7b8100a2c126efdcdfc8e5e920 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/33b12fd387d8d923f8e8fc31f58355f031fe54bc |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/42505e640934f0c6dd8d6bc7213a6d3da53ed695 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 2 
              libgcrypt-1.10.1 | 1 
                python3-3.11.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/73d8259fb432b4ac327a56c5acb14298245f56e3 |     
   s390x     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f8c52474fd8918d9a7b9dd5676b6b4374c122de0 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/a0485b11bbaae56f3ed31db63433ce479f05adba | ORPH
   x86_64    |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/944114ad71c90b04e4fd4fd37797b608f8e89590 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
