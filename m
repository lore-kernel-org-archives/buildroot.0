Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49223C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 04:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF4C406DE;
	Wed, 31 Jul 2024 04:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J86-koKC2kyQ; Wed, 31 Jul 2024 04:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F87406CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F87406CF;
	Wed, 31 Jul 2024 04:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 079AF1BF589
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 04:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E959060A7E
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 04:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RF0kr6Kdy7kT for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 04:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 365AC60A7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 365AC60A7A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 365AC60A7A
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 04:43:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C93AFF807
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 04:42:59 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 04:42:59 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722400979; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nX1GAa8AAcb7Vj6215HtN6gm52jdN6KZ/TUc02Puvvc=;
 b=DmruT2YqLrs6uIYrjunHVFMYljHDNcldZgL0hIJREemOKdOX90PuroYVq/j1dB10m1t7Rb
 DSLkgzm2qBAd8lW9O0D0Y3LQacTOHp31q9MvCFqgZxS7QlndTh9xBBgRjezduoVUuRt96B
 yJYThBRRzJLAizw9Q3QQBQaM+b7Xlms6mjHqAhyHBTulnnazjS558GFQb5RQmP63449M4J
 o8BoAiEwrV0iIIWmfhuP7zq+SmOlZ0TFkhwpJUHHJhfxevtlp9yPktBRtosXyulATvKl24
 3r4KyX/+mtj28mMYNuzAf9X+xT5DLVbsCbtJy141e0jVwsaCYPwrXtADu1bQZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DmruT2Yq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-30
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
Message-ID: <20240731044259.1UH5lqPi36S5aXYcYRY93eEAPx2EBoLjR5e3JDxqmvQ@z>

Hello,

Autobuild statistics for 2024-07-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  8  |  0  | 17  |
  2024.05.x  |  4  |  5  |  0  |  9  |
    master   | 20  | 46  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
                  bcusdk-0.0.5 | 3 
                    mpv-0.35.1 | 3 
                  ffmpeg-6.1.1 | 2 
                   host-go-src | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  libffi-3.4.6 | 2 
               mariadb-10.11.6 | 2 
    python-cryptography-39.0.2 | 2 
           python-daemon-3.0.1 | 2 
                    bat-0.24.0 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.0 | 1 
                 chicken-5.3.0 | 1 
                flannel-0.25.5 | 1 
       freeradius-server-3.2.3 | 1 
                gerbera-1.12.1 | 1 
                 glibmm-2.76.0 | 1 
            host-binutils-2.42 | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.79.0 | 1 
                  libsepol-3.6 | 1 
   libtorrent-rasterbar-1.2.19 | 1 
                  linux-6.10.2 | 1 
                  lvm2-2.03.23 | 1 
                  mender-3.4.0 | 1 
                    norm-1.5.8 | 1 
          perl-net-ssleay-1.94 | 1 
               procps-ng-4.0.4 | 1 
      python-autocommand-2.2.2 | 1 
python-unittest-xml-reporti... | 1 
                    volk-3.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/d8c6bdcb92689bf8c2fe06fefec7e1156cc58c25 |     
  riscv64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/aead8ab7f3bdbccd825131f99697ea2b95041bc9 |     
  powerpc    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/874e2e8030b0694fa2f25fd1217b0ee0d53f0c72 |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4c0972103ef27cb4f7a4cd5fcfc9794eb6072d7f |     
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3fe73fabc32aae9bfcad819f5092e682e575f50d | ORPH
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9def964220b50dbde16501657c05ef1e2c7c3f20 |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/662c3e459475c2cd4deeb49cda93257ed5f3addd |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/591051fcc1c9b82d073c113e3d1ebd7582ee78f0 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/15e5d895efa7fa4f114f6da71a64d152b72460da |     
  riscv64    |         flannel-0.25.5         | NOK | http://autobuild.buildroot.net/results/13b2d09ad0c8192cc3591fe80143631182ea3711 |     
powerpc64le  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/eec31ab35db7b57e9ce174c4144a3926c8637731 |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/bbc26bdfc3180f5d5bd8509e8c7594124c412202 |     
    or1k     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/c46df430a3c0b60da761f49e10e13a65773b78d3 |     
 aarch64_be  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/1b710ddbeabd9774c2d9bd28e3a14b93515600f4 |     
   xtensa    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/2bd81a2f82253acc79c0cc2e22a511934de22823 |     
    i686     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/60a3fa6649663aa0f7ad066eee594462764b9c66 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/45cdd5ff1842b0d9e422161f37d011a91dd63643 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/07e0743fc2636b0bcadcdbfca53efb5507caab9a | ORPH
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/d6d6747541b7de8b04598c4c9181693e015ccf44 |     
  aarch64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/7d9303dac68ec3c90fbc7bda4171772fedc24cf2 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/4f2925527fee68473ed8c2b5473e1703ad038cca |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5d14de5999006eb2afa7b0f5206916f97c814845 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/638e652e5248ca2aa9331e9738a7f1bb0502381a |     
   x86_64    |  libtorrent-rasterbar-1.2.19   | NOK | http://autobuild.buildroot.net/results/86014f6e35897b98aee53cb372dec37eb84c85d9 |     
 aarch64_be  |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/a885e0b38d259088abd8a9cf0cde458143da5421 | ORPH
microblazeel |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/70132d0d18457d633c9f92c558e84c2883e65ffd | ORPH
   nios2     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/6e70ec06d92857798b16c5574f2944f3cf59d83c | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/1da10632e060e3079d61f80308ad776f9f20031d | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/33157097b28830ad18befdd23ee414d4c3cd3113 |     
  aarch64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/f53a5f3c2cd40d951d00237e4c14a94b8f855957 |     
    or1k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/6ad0eb865269cad3c857ba16dd4c02ee2d29da8b |     
 powerpc64   |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/8aa100c291292b37f9adad109b073123ca2f461d |     
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1273256161cf3d9beb864b4dd9908ec5b45bcb40 | ORPH
    or1k     |      perl-net-ssleay-1.94      | NOK | http://autobuild.buildroot.net/results/5d6021d263af9ab4a95a51326f7a66cffd8d2ac3 |     
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/c95eab10e88d72ab371179637d4049e88d7f2efd | ORPH
   sparc     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/b8f7d66d686fc1a5aeca2837efedd3eabc975e27 |     
   mipsel    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/06e66f351f1abf5e41b67c7bdbbe1701241e0f72 |     
   mipsel    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/1c840ef2219ad2b0cba604fad740a462a4f9cf67 |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/d9f9bd6e84cb139e0b17ccad232d3232aed7f1e0 |     
    i686     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/0e7b69bbc9f1b4874786837cf5f6d636fc4561e5 |     
  sparc64    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/75c9c1ee8e111c11b22eaf0bbb0d950a2803227b |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/28ada3daf4962743c49310f9f52f5d2d1551beff |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/201d4c70d17519aa7eb19996041b1c393996c963 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c4795c2969f3f7e0c7e20ba84e2e93744c1015c0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/9235cde80905e9070b595ef0e5b156c8b14a4600 |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/b7ec521161ed8388c378a5f458bd34e0c1eca5d7 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bitcoin-26.0 | 1 
                 coreutils-9.3 | 1 
                  fbterm-1.7.0 | 1 
              libarchive-3.7.4 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.37 | 1 
          python-grpcio-1.60.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/31a3310212b23426491f386924fd9d921008671e |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/8be1d77ff849071a9913e03832f3068631ae5a49 | ORPH
   s390x     |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/6a214da0e400a3ab256d242a718393b947300e83 | ORPH
 microblaze  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/2d60c618b0b7b3bda3938f3cb367d99e79f9b61a |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/beac747bce5368f3ded0dc040c455d3543cc3796 |     
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/55683ff9c5b7f8929aa2b57fbe7b08625f4b9034 | ORPH
   x86_64    |          linux-6.6.37          | NOK | http://autobuild.buildroot.net/results/7c8645e71eb2c48731e97187c57f514bc875d84b | ORPH
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/34fae8d9d270361ce4f56e09ba2ee9feee96f863 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

aubio-152d6819b360c2e7b379e... | 1 
          libcamera-apps-1.2.1 | 1 
                  libffi-3.4.6 | 1 
           python-numpy-1.25.0 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/afb7615b72b1d0f01e95adbcefaff81118755667 |     
    or1k     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f333965c03b42e8ea12f06d9ba34c997708721ec |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3c477d90c5a4e47fd6748699cb943e1992ced2c5 |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/f1be770fdf075d9a2c0b3d4907db72aa202eab6f |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/c437c87761b0e16f13a0e0496d86b2bbb53384eb |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
