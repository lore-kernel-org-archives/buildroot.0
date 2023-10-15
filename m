Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3D2CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 05:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 512A54067F;
	Sun, 15 Oct 2023 05:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 512A54067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMENLg77MXZG; Sun, 15 Oct 2023 05:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0BA4175C;
	Sun, 15 Oct 2023 05:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0BA4175C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 550851BF34C
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 05:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 232F440B6E
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 05:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 232F440B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmAWL2x7TMbE for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 05:39:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EACC40423
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 05:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EACC40423
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CFAEFF809
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 05:39:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 05:39:20 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231015053926.232F440B6E@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1697348360; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I8WUeQGI8e1sgqrSZpVdIA7IKAA8NHv7fV35/CA4ZhM=;
 b=N5AcmCxkXZHgOGEk9FWizViLMdWvWIJl4q7jOMDHMa40z+QyumGJXx//gZsaj95OvejZJI
 SduJxHcoUhKlWSxBKy3cL3h+B4+E4ozPzRhbT0YXMYD3+aNUz3mPABHfzxDuwI3I/2uax4
 UqkZ8u5kzxJ97P+1551k3AKWJXHy4jslFHgy+/sbKj9lFvKxZvpk5xlwyCPKYu94IJTnBB
 H9TJOGbC9cZqd09oMt8s5WEh3RWGv+HhRHyzenJER8eBW8/FdV89/DMIO+pw0q6kXHEDS4
 9TU7AHChNno6c6zZWAbrBhfcpFOY8oEbjkjdos6Dz6/PP9NG73pbAu9WVTI+Zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N5AcmCxk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-14
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

Autobuild statistics for 2023-10-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 21  | 10  |  0  | 31  |
  2023.08.x  | 11  | 12  |  0  | 23  |
    master   | 56  | 74  |  1  | 131 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 8 
              gcc-final-12.3.0 | 5 
              host-rust-1.71.1 | 5 
               alsa-lib-1.2.10 | 4 
                       unknown | 4 
                   bird-2.0.12 | 3 
                  monit-5.33.0 | 3 
                   duma-2.5.15 | 2 
                elfutils-0.189 | 2 
              gcc-final-11.4.0 | 2 
  gobject-introspection-1.76.1 | 2 
                host-go-1.21.3 | 2 
                   linux-6.5.7 | 2 
         spirv-tools-1.3.261.1 | 2 
                   systemd-254 | 2 
             alsa-utils-1.2.10 | 1 
                apparmor-3.1.2 | 1 
  binutils-arc-2020.09-release | 1 
                    brltty-6.5 | 1 
          cryptodev-linux-1.13 | 1 
             docker-cli-24.0.6 | 1 
                   ethtool-6.5 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
glibc-2.38-27-g750a45a78390... | 1 
         gobject-introspection | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
                   libnvme-1.5 | 1 
                libressl-3.7.3 | 1 
                libselinux-3.5 | 1 
              liquid-dsp-1.5.0 | 1 
              memcached-1.6.21 | 1 
                  motion-4.5.1 | 1 
                 netsnmp-5.9.4 | 1 
                    ola-0.10.9 | 1 
                    php-8.2.11 | 1 
                rdma-core-47.0 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.2 | 1 
               valgrind-3.21.0 | 1 
                xenomai-3.0.10 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/359021a25a9ddc9242c25037023b4c27ad6594e6 |     
    i686     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/38f0508b169944f8253694cc0f2048d1962b3360 |     
 microblaze  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a1d9395c5f9633780383297a61ecb7ac7170deb0 |     
   mipsel    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/da397c058137e42f5aaa91bed827e9a1e45dabd2 |     
  mips64el   |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/59811267bc51037175c388c47f5e2479f608107d |     
    arc      |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/ee70f60d74bc1b1ba11d65fd0c567eb1ad50869b |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/712d6d81a01a35ed115d22eb97b119268e41e409 |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/765e5dbb92685272e62987e1a619667f77f1e0b3 |     
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b1380a675b88e6b3535c31e926af1a0897e2534b |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/09cb8097664f60fadeea0818296cb59d504309ca |     
   x86_64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4df5304281ba1a825ed0b91f8128e3c077326942 |     
 powerpc64   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/5b058683496a421c692f6019ff591962328b8c53 | ORPH
   x86_64    |       docker-cli-24.0.6        | NOK | http://autobuild.buildroot.net/results/fecaf8d037b61ff05ea3a9114b19d12ba5e3b82d |     
  sparc64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/009558e053bc7428dc3613a47fea9c5f8bb84515 | ORPH
  sparc64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/aae3d90264b1964b5f0f11a72b8e2785004ae374 | ORPH
   mipsel    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/763ce9cb9c0c415da7f11169832c31620c7d267f | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e06729aaa6fe23fcbba8581e177471e2d2ab4d52 | ORPH
 aarch64_be  |          ethtool-6.5           | NOK | http://autobuild.buildroot.net/results/69e01b7f370920630d132fc43a40104fa5b3959f |     
  aarch64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/ef3e711fc4806c9efa5fa0dd9ac641cf8da15651 |     
   xtensa    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/aa0b9254d4e9ca8720ead9c25a3fa966d1f23554 |     
   x86_64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/bd83c37054dee9514cddcb602e45a456e12e0240 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/a7a6433e99c7b23c4b254eb1f60ee6261c089763 |     
   mips64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/1207a535ce4947ed1e44cd6a42a6bd6bb04202ec |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/38cba25bdbd5c0d4ef8272f4331493b8fcbda500 |     
   armeb     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/322fb85e62db09e9b078e607ae251e7c028e738c |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/60e2896a57ac0f3ac510aa153594681f3f0cef4c |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/3bd297214c3ef33fe0f65ad4fd145549f728a486 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/453858e184f4d93836da101ce2094e80e7371c85 |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ef27714b84927da8e2b22256dd77d40ef78854d4 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2b1b27cae0f56c7207942b79e09f744d461486d0 | ORPH
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/54a61b4dcd7f55ed17f7c2dd2ebb53dfc4cae86d |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/37f79e47056e144995cee0e2d821c665da665173 |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/e733b8aae4628c7bea258f51e42ee4ba2c695fad |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/1c6d86432f2508a1172086c300550ed6aa86036d |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4fa75af0fa7afe1daca68b3d7236ad607ef6e24d |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/1eeace1b3b6deb900a7228243ff23639aa2ed503 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/18405add345587d82cb9eab401b768bcd15bebc1 |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/64657132d1f60f2aacffd838a2699f1a31deacfb |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9fba7d1f7eb62eb31ee1151c75f7ee94446fd481 |     
    i686     |          libnvme-1.5           | NOK | http://autobuild.buildroot.net/results/eb31150f2aaa824d65210a66e198ce1561ce9145 |     
   armeb     |         libressl-3.7.3         | NOK | http://autobuild.buildroot.net/results/ed98f049a5ea2695f4497b72c72261355b8ee3ee | ORPH
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/f030cbbc0f828e04974a7fa027711267f492350f |     
  mips64el   |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/6a02a195d29caf4e40043fafa8f7bc7f60b3f05f | ORPH
   mips64    |          linux-6.5.7           | NOK | http://autobuild.buildroot.net/results/0d6a9d76ecdb8717e1946a2ec5b8c176a554913b | ORPH
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/1a807f6cdd1b13da6361ca2adedc13e40e7fef5b |     
   x86_64    |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/22b193afe3d19ba195b55c30f0af3ff8728acc67 | ORPH
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/369dca6155df0224b9f35bc6ace6b6071fe08866 |     
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/8b33256a32bfaaa5e9ee09bd1c4ed2dbed591d43 |     
microblazeel |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/b0af09edd63dbef5e2206b3f3be96aa2752531fc |     
   nios2     |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/6f1b56b4479f181afbf180e1a2cbb24575a0ec9b |     
   armeb     |         netsnmp-5.9.4          | NOK | http://autobuild.buildroot.net/results/9688fe44b99b898ea0ad0212a4dc2516c54fda9a | ORPH
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/a69efa83ec857fd0a6207efebe52236f680fe6b9 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/148dc55f385ef93d520bc62bac32990f8e109221 |     
   sh4aeb    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/8a8c712a67bce658965358b65a58a15df8d767ed |     
   sh4eb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7509b2c137aa78268a1ded3fd9455526071fc2ce |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/3763ee3a0962fcd557521e0a9997d0214aa53981 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/18b17dee11f5c4f1a5d84bdaa1f82104d557d8cf |     
 microblaze  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e66aa6881b85a8c7311b4e8349e44ff67c7b3403 |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c7294bbe829ef5e8ab919c578274928dc1383bc4 |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/14c7f9b2f226220c96ca38d6eeace63ac8378e16 |     
 microblaze  |           php-8.2.11           | NOK | http://autobuild.buildroot.net/results/9baadc07fad24f3a4ae502b09690b865d14d7a04 |     
  mips64el   |         rdma-core-47.0         | NOK | http://autobuild.buildroot.net/results/2df58f9b98aacf00960932f53510b29199393461 |     
    arm      |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/ca8c741bc3deb3880dbcda9a90a2429b1159f555 | ORPH
    i686     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/8ce88457b8ec394657ce734710f30b812c77e32f | ORPH
   s390x     |          systemd-254           | NOK | http://autobuild.buildroot.net/results/42b1ca386145133ecf812af70cfbf374d2d7dcaa |     
  mips64el   |          systemd-254           | NOK | http://autobuild.buildroot.net/results/7eb96da563cd26ba232038d11ccb585c5c6aa655 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b7a1dfe8e1ea5c16c4dfb018647608e1632c4d0b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/44d9e1dd2855fceb91b4a7f75f38063a1f54ec49 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/af90c767bb83ccaf472aceed2cbb1a2b2498f1b2 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/4930078b1f4116b53535a4e0d20945cbfbda6ed0 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/efd966327eab54bfc31d260e1640f99e6c892b92 |     
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/f76437b621f760a4f485d560fbcd1d945ee518e4 | ORPH
  powerpc    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/ad1f00e582a2c3f9fbe76c39aefb3627b77eb323 | ORPH
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8011fd036ea3562990dcd30fd157415a360d6bbf |     
   s390x     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/ab403b45761c82f49a9380564bf10d3e7ae935f2 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 2 
gcnano-binaries-0ac1a89d7a5... | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mariadb-10.3.36 | 1 
         nftables-python-1.0.7 | 1 
               openblas-0.3.21 | 1 
                   perl-5.36.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | gcnano-binaries-0ac1a89d7a5... | NOK | http://autobuild.buildroot.net/results/1aea1bcf972b526f5e8d408a07583e7fa1349a01 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d257cec272c40422ab6ae0a079e4fe3ee844b9c2 | ORPH
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bb792cbf1d1b766d6f3bd5fd822c2fdfe32571ea |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e88cd6e817d42e927cab4a550f98793fa54e6f37 | ORPH
powerpc64le  |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/13ba4dcff58abc41b8670f07384e108ccd308684 | ORPH
   armeb     |     nftables-python-1.0.7      | NOK | http://autobuild.buildroot.net/results/f697a2e87372bf743288f5f0f0dc001e133d4da8 |     
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/83d08f325744f64033e3e6b8cb50862b6c253dd8 |     
powerpc64le  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/753d06d8ef38deae2a318ee8adfce181244660f7 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9da03072f680a4387f22ed5f454e9f31e17b6f93 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bbc55714a41c48f66aaa38e95d082bc1fc846da1 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 3 
                    bat-0.23.0 | 1 
                   bird-2.0.12 | 1 
                elfutils-0.189 | 1 
                 highway-1.0.3 | 1 
               host-go-1.20.10 | 1 
                     mc-4.8.29 | 1 
             util-linux-2.39.1 | 1 
               valgrind-3.21.0 | 1 
                 wolfssl-5.6.3 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/0d351054dfa531e4110d0371b843d6140e20d700 |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/57226d30be99de2ed8d52d22f435bc535c3fcec1 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e7bb1cfe9d30f23cdef79f3ed154fefb9f7924c9 | ORPH
 aarch64_be  |         highway-1.0.3          | NOK | http://autobuild.buildroot.net/results/2b149819501c7e145e4e18909dbd865aabf1da1b |     
    i686     |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/711c2620208e711f2c3be38d0f603fcd61f52953 |     
    arc      |           mc-4.8.29            | NOK | http://autobuild.buildroot.net/results/a57bf9bf6db3b427833cf02cb5211f388b692555 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8aedabbc0a0f885d95cb0f7d825a877478cf2fa7 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ef83e23995a3346325fee29fca25c7c9af1807af |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8a15c2c1c781d5ce22be742b76c8af3c7b1439ac |     
   arceb     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/114da31496349ac5c84d5bbe1d8dcefd71d9c021 | ORPH
   mips64    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/e9205878607772f8e8a32900527654e9b8772a43 | ORPH
    mips     |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/7ade02277cf222f231333fdd75ae0803753470ba |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
