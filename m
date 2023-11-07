Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB06C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 06:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAFAE61320;
	Tue,  7 Nov 2023 06:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAFAE61320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SC040_AV3ceF; Tue,  7 Nov 2023 06:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B23861347;
	Tue,  7 Nov 2023 06:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B23861347
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB83C1BF370
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 06:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99941822FB
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 06:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99941822FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylFa4nJhdU1N for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 06:36:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27276821B7
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 06:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27276821B7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78181E0010
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 06:36:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 07 Nov 2023 06:36:48 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231107063653.99941822FB@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699339008; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8BpvmdIitTB6Z5u0CX09j1H9nAW5vCSQ4H7MHGqsqJo=;
 b=fiZoBYrSan02h9c53Ejqm0JCGzhAZflndl2RI0fJaTYO3GFkI3HdU6kTy4eOJSNonIzu0y
 h9c2d4Ntkt38f7VAJcVk1N0VT1Bxt2KV4fuN7CvVWnIaH3gRzpJWvl+wVEivnYklHymlTb
 DSGwcqA8wZdbM1Ne/CCNN8iib/bRYVt3lMgiMCdGoaL7c1eAtmj5yLXJ/1BQqUUbA1OvDU
 FuJD5dnQtvKaAtbaNzqgcTw8S+9tGgH567jdLJtPltyuWs0z/aVVsru/RsGF3OyVcdgg+u
 UakpRtPuGMVtN7e+vINeDh3pE2+ZmIon3fG7pRGCAdGBNpp8YefSedd6f8341g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fiZoBYrS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-06
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

Autobuild statistics for 2023-11-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 11  |  8  |  1  | 20  |
  2023.08.x  | 14  | 10  |  0  | 24  |
    master   | 95  | 101 |  0  | 196 |

Classification of failures by reason for master
-----------------------------------------------

              gcc-final-12.3.0 | 9 
       freeradius-server-3.2.3 | 7 
  gobject-introspection-1.76.1 | 7 
package/nodejs/nodejs-src/n... | 5 
        host-sentry-cli-2.20.3 | 4 
package/nodejs/nodejs-bin/n... | 4 
                   bird-2.0.12 | 3 
              host-rust-1.71.1 | 3 
              libarchive-3.7.2 | 3 
                     linux-6.6 | 3 
                   openrc-0.51 | 3 
               apcupsd-3.14.14 | 2 
                 civetweb-1.16 | 2 
                elfutils-0.189 | 2 
                host-go-1.21.3 | 2 
          libpam-tacplus-1.7.0 | 2 
                libressl-3.8.2 | 2 
               libunwind-1.6.2 | 2 
                     nut-2.8.1 | 2 
                       unknown | 2 
                    atop-2.9.0 | 1 
                bpftool-v7.1.0 | 1 
                busybox-1.36.1 | 1 
                 coreutils-9.3 | 1 
                    crun-1.8.4 | 1 
                  delve-1.20.2 | 1 
         docker-compose-2.23.0 | 1 
                   duma-2.5.15 | 1 
                  ffmpeg-4.4.4 | 1 
                flashrom-1.3.0 | 1 
              gcc-final-11.4.0 | 1 
                    gdal-3.6.2 | 1 
glibc-2.38-27-g750a45a78390... | 1 
            host-erlang-26.0.2 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
                   luvi-2.14.0 | 1 
               madplay-0.15.2b | 1 
                  monit-5.33.0 | 1 
                    ncmpc-0.47 | 1 
                nushell-0.85.0 | 1 
              open62541-v1.3.7 | 1 
                    qemu-8.1.1 | 1 
          refpolicy-2.20231002 | 1 
                 samba4-4.19.2 | 1 
              skalibs-2.12.0.1 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
                tinifier-3.4.0 | 1 
           uboot-tools-2021.07 | 1 
             util-linux-2.39.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3662a01b178b228502a7356f500e01ce267b5cb0 |     
    or1k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5c153a609dba04aec22ca8e9e4ce97cde2db7328 |     
    i686     |           atop-2.9.0           | NOK | http://autobuild.buildroot.net/results/2f0aa4d5d10c9e2b803e6a630709eded43420829 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8d4fe2264f4561ad096280a83f03b75ea228fadb |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2eab0a8078680d2ad421595c63e797b33c4fe0bf |     
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/80c711b5e8bafbf6c2ae7a0a9fc370ef5035fd28 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/a6844de987db6ff39db9c89ee100fc16baa4e099 |     
 aarch64_be  |         busybox-1.36.1         | NOK | http://autobuild.buildroot.net/results/302f796f01a0925a3324a5353bda66735d86338c | ORPH
    i686     |         civetweb-1.16          | NOK | http://autobuild.buildroot.net/results/277d23bf78e5b27f263496d661f0a547a1d835ad | ORPH
    sh4      |         civetweb-1.16          | NOK | http://autobuild.buildroot.net/results/7459b504e52f473c5830c0f3c7bffd037f6e1770 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4d6eafbae5e29040e3ad744d4d051930cc0e3c0c | ORPH
powerpc64le  |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/9e5bbb0ece3fdeded3c5be399e0042e27cdb054f |     
   x86_64    |          delve-1.20.2          | NOK | http://autobuild.buildroot.net/results/656bd84607519c8558abe8fbaf610b8b81d29526 |     
powerpc64le  |     docker-compose-2.23.0      | NOK | http://autobuild.buildroot.net/results/d0ec53e9c48b3d9e6c7560f255551f279bb4cd0b |     
  aarch64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/57ecd11014966ecc4e436a9168946f41a497987b | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d4bc70c1f50fa1bb6fa89ccc45db445957cd779a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f3c00f2da7f25336776662b17e6f180cef4416c2 | ORPH
   arceb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/5bc932c017bde12f48600ec6e2abb51dfd591de1 |     
    arc      |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/a4faf2c7a80710ef9a22d5925ba7ce60a49cd47f |     
    mips     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/4bb5e82960dae52a2635f4dbec20c8f1da1e9ebc |     
 microblaze  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/7798ed44b64c5aa85244cb9502c1c45cf72745ed |     
   nios2     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/3b9b31e79fd10f07af8ff4cbe64339d3232a15d6 |     
    mips     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/33a3147af727527ad8c18ad1c7f1e45b73e93e0c |     
 microblaze  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/21483826221e01eabb54da1efeed6c8ab4052305 |     
   s390x     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/17a78387fbaf76a12528364bff591991d8cc243c |     
   armeb     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/109c9e8f6d3a4bc18361bcfe581a496372c649a6 |     
   mips64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/12efd0b6d2c3b24657848b28fc4c19a1679b0886 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/a9b0dd06026fc6389f4818104e9bb76e2577374d |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/9954f4772c95dc6908ff3ad1e267b74501a36d57 |     
   xtensa    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/88e7ffb85a47388460c0987b25cff6cf7e979605 |     
   sh4eb     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/96e68fd076025ffd26fed23eb2414644d3fc5e5e |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/77965a5af6e162be510aba44f84c943bb56ac499 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/c53cc34c1d206fbb8868c87e614af7b1ac35f13d |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/3877e5a4416133cb5701a67439b904973e9d4ece |     
  aarch64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/98fedf4969c260f73a01b937b9625e66dcd86b3c |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/38844bc07f70abf25a1615bc19c9c3962d6cc611 |     
    sh4      |           gdal-3.6.2           | NOK | http://autobuild.buildroot.net/results/5bffeeecbbd90caaaca507c68b1bb4b238a5eb5f |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/8bb8d210a56f76af8ace4c5ca14a6ef97c16cbf9 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6bb4c39fd60193fd4a8400b1effe676ac8e6df2f | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2325bfa5e4b7dbcd67b80f8f2eeb9b9db5fae242 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cbc73bbc40b804d1254fae9c1cc03eaeecfa447b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c513a5e546c8764a485e97da543c60ebc7343923 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0de922171e714891b61cbc24c2504bca87631227 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d8899eb1ac733c725f78d9bc90d5810afe5c68a6 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/52d16c0351c3f5e3ab40563bc0be3a2a4b75ac8d | ORPH
   mipsel    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/9a86b9b5f689e7d951b5375db40d99cb4fca1dc4 |     
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/cfea5884e4ceadf976251342e3ce89d37011c89d |     
   mips64    |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/fed4989aa0cc2eabb45f3c4ef47ba3182e3744ea |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a2c47d2bd9723ef5c4adce6523b6a2608d8dac32 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f8d1cd22d5b1fea57c62d3ba9f0fb3d1d9695a24 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/bc20eb69caa1ee458fb77b332b9dee5226ef2f3c |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d7c6eb691d8b22feb9f0e9c32197f243b97518d3 |     
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/8935a8c57da298879d3359b39c674d78d59d624c |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/46cfe757672e2469f928c2cc541164b740df56fe |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9783fb69dc3088783c2c9941c0ddca8b0a8189c8 |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/6561ab78fedf2efafc2494c112f2f0f5a9dea8cc |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/be5bc049ef0d998401104a3ea506a05b15467cb3 |     
    arc      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/3fafca1adaed6db854e78f5f1612f3f0b4f95052 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0b987a13ad87a8e4a73e7da47341654fcd6d708e |     
powerpc64le  |      libpam-tacplus-1.7.0      | NOK | http://autobuild.buildroot.net/results/2df734de458b35a309cd73fd48e55da12e7f9f52 | ORPH
    mips     |      libpam-tacplus-1.7.0      | NOK | http://autobuild.buildroot.net/results/9b5ece5d01eac8a760ed9ca331a902d1c47387a7 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9c3840f908312d141b5c2c6e00d31c1db6d04907 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/238286d19761ef75e2b94a344b8eee98f6e07f91 | ORPH
  mips64el   |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/3caa3687d596eb10fe5a037491d61bfeaeb0fc52 | ORPH
   armeb     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/5df35a407448b8e96642df057470e3e7e2af11d3 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/24324e276706c8756fd45dec13b2f8f8776bd627 | ORPH
  powerpc    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/01c8ff46a0e763b4f827a3c3428cc09977d24e84 | ORPH
    sh4a     |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/5088b886678bc370b814842418a87321d0d7bcc4 | ORPH
  powerpc    |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/4808fb984bd2b143f647e55259a9d8436cd33837 | ORPH
  riscv32    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/29523854f1cbd637a511aba14959c1c553360402 | ORPH
 aarch64_be  |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/a69aac9e1dec8cfbdd0d0e9b0ce158bbe0242a34 | ORPH
    arm      |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/d0befaff0771e5cabcb7b3468a491bff9e90c0fe | ORPH
   mipsel    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/ec857cc6aefc4ca6804676b6557a7a6ba1af9f5f |     
powerpc64le  |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/976cd6937150aea3cf131201e378edc7d2df9c73 |     
   mipsel    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/a47dc042b423774516f58c520d278d804d9c8207 |     
 microblaze  |           nut-2.8.1            | NOK | http://autobuild.buildroot.net/results/a2069884d511b157472cbb90e3c74b22018667c2 |     
powerpc64le  |           nut-2.8.1            | NOK | http://autobuild.buildroot.net/results/042367dc39a15e2edfbe61caa3a6c3e5d6850a5a |     
   nios2     |        open62541-v1.3.7        | NOK | http://autobuild.buildroot.net/results/6a0bbfdb57cc883a0b9dbc150071f7215bd7652c | ORPH
 aarch64_be  |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/4db82f1e7de866a146466ff9c9bd8816f315dad0 |     
   xtensa    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/b4359fcb5d6373e84037a3a5759ad240bbd04fa7 |     
   mipsel    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/cf04d8d74c02ad5156dfbbba9fb77d6fa67a6f82 |     
powerpc64le  | package/nodejs/nodejs-bin/n... | NOK | http://autobuild.buildroot.net/results/4c9ea39f942afaf5fef58c7ad5d359c17beb742b |     
    i586     | package/nodejs/nodejs-bin/n... | NOK | http://autobuild.buildroot.net/results/f7a14e6cde1f373d75078404c812b396c12ece8c |     
    mips     | package/nodejs/nodejs-bin/n... | NOK | http://autobuild.buildroot.net/results/b6cf8010a049f818888040356d9ca1422742ec89 |     
 powerpc64   | package/nodejs/nodejs-bin/n... | NOK | http://autobuild.buildroot.net/results/c2b65ea1b8c3c2c7d5b8c9ebbc0f7f5f49025261 |     
  mips64el   | package/nodejs/nodejs-src/n... | NOK | http://autobuild.buildroot.net/results/98e14e251d0e025e6bbd7e9bf9e7e93d069f4b94 |     
  powerpc    | package/nodejs/nodejs-src/n... | NOK | http://autobuild.buildroot.net/results/06e3ae136b08db92fb15209eaab076ed1217494d |     
   xtensa    | package/nodejs/nodejs-src/n... | NOK | http://autobuild.buildroot.net/results/55c80b94a237d2e7352749f960970c9bf2d5b93f |     
    arm      | package/nodejs/nodejs-src/n... | NOK | http://autobuild.buildroot.net/results/c3295b25eba709d67a984c5b9d85c508d14ad15c |     
 aarch64_be  | package/nodejs/nodejs-src/n... | NOK | http://autobuild.buildroot.net/results/1b015a0a3b06a22d07d4807b767e8a7a334368b8 |     
   mipsel    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/3f04c0a6b4680931e57548dc6c073a328e3a49f0 |     
  aarch64    |      refpolicy-2.20231002      | NOK | http://autobuild.buildroot.net/results/849050b00a2ee5983c2324cb955cd533189a0460 |     
    arm      |         samba4-4.19.2          | NOK | http://autobuild.buildroot.net/results/6d197b0b22918975421d0a2ddc8587b239025d5f |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/1822225e4bb8e21fe2ca94a2646ed6862224c2a4 |     
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/294daad0311040741fa98487b8aac85e4e0eff73 |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/f61a9f90af5e8687e527a47e995cd1d0b392a564 |     
  mips64el   |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/edfa8d91466e80e1a4f31cca9e5cd563da4f006a | ORPH
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/8b6d538b6d84c19d23287cebc9fa6e45e0b99c9f |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/dafa669d9934eb11a0de07603d490b69830e7dd4 |     
    mips     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/7c9b8508345ffaba167c08521fb865d76555be1d | ORPH
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a1f61b3210e2059916923cef3e369b8b7e692f63 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

         gobject-introspection | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
                libzlib-1.2.13 | 1 
                  linux-6.1.60 | 1 
                   luvi-2.13.0 | 1 
              skalibs-2.12.0.1 | 1 
uclibc-ng-test-6790eafe897b... | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5cc970bc27d0dcc7706a27bdb00fb6cc8872276a |     
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/829bca038338df10cb7f5b9dc9d32410525f2044 | ORPH
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/478aee0c7c21e50f12f757f9661b33623b5af618 |     
  mips64el   |         libzlib-1.2.13         | NOK | http://autobuild.buildroot.net/results/3cb38533383b424c3dcbb5d8a5783579e9b52b09 | ORPH
    mips     |          linux-6.1.60          | NOK | http://autobuild.buildroot.net/results/39aed89f1f9bd1b268b326adcee9eeb48dd3b957 | ORPH
   mipsel    |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/966c93f503c63547039678539314d56a2d4ebdee | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/ce487ca7ac315df2d517b0852bec59f9d57b1f86 |     
   arceb     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/9929d2f5e9dcd89cb9d1e44c4522f0df4b0000c6 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/47aeda8c278588dc443e18de988c171e4feca497 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

             dahdi-linux-3.2.0 | 1 
               ding-libs-0.6.2 | 1 
                  ffmpeg-4.4.4 | 1 
glibc-2.37-45-gb4e23c75aea7... | 1 
             gstreamer1-1.22.6 | 1 
               host-go-1.20.10 | 1 
      libabseil-cpp-20220623.1 | 1 
               libglib2-2.76.1 | 1 
              libsndfile-1.2.0 | 1 
                    sdl-1.2.15 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/42e56803994492efe9a0b909f4e1d6341250de61 |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/42d44249cb351d1353c31d919658838c866874f6 |     
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/54eab4084c26b17f40a8f09ae80f5775ba241079 |     
powerpc64le  | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/b83253cf670254196d3efe6ce6d055237ae541cb |     
   sparc     |       gstreamer1-1.22.6        | NOK | http://autobuild.buildroot.net/results/228b97820673ef245c5360dbe9137dce175ebbbb | ORPH
  aarch64    |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/97b5b201d977fcb693f684c0a179969ddbeb5f25 |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/860bfca20bbb3af54d806ae291c8248da06a22ae |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0b4850cb9a7af57bc91217a7bbe8f62b33da3d95 |     
   mips64    |        libsndfile-1.2.0        | NOK | http://autobuild.buildroot.net/results/1b484af3f5e76211261c5fa7956a3c1580d341fa |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/9855644ec3ffbfd0ee5b3cb9301db2cb8537a6bf | ORPH


Gitlab CI results for 2023-11-06
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929720  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929721  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929722  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929724  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929726  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929729  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929856  | ORPH 
           TestFluidsynth | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929866  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929903  | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929805  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929925  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929948  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929927  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929950  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930066  | ORPH 
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930067  | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930068  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930075  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930142  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930143  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930231  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930182  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930187  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930193  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930207  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930222  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930224  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930235  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930242  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930246  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930254  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930259  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930264  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930269  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930298  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930316  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930318  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930322  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
