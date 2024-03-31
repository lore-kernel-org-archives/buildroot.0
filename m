Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB93CD1284
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 07:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62AA8605DC;
	Sun, 31 Mar 2024 07:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg8iLuadolZX; Sun, 31 Mar 2024 07:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 041C3605EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 041C3605EE;
	Sun, 31 Mar 2024 07:53:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19AD51BF28D
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 07:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0779140166
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 07:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfT8252iaB4c for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 07:53:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 26B9B400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26B9B400AB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26B9B400AB
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 07:53:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93569E0005
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 07:53:42 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 07:53:42 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1711871622; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Lz0vRRK9X92sHGkP6XsNRyHsDkZmop0V5lmXqtNOGUA=;
 b=WmS5qlQuiuQ6FotyFFQzJ4BEZg3/OB/Ikxs9vwJofJUcOqluSvlTFXsnDyv+YQ4MRgGljv
 2LUFrJ0jyY2nwvImC/lUfjV18OUFmdaALvIz1kgnzTWvWkTidH092DipHVu8d0CWqUOSGV
 riaxReZF3D0911BgAgNkoATIePQnkpcQ//z1+heLNOdUPAim1+1JIAnUSjh+l6446q7OLu
 YRnr/ETIYpE2jN0VGjOj38d8p1baIel0Fg+2MOb4yBaVT0Frznnx7tQBNvbKObJta4yHa1
 KX8ZYxW3uhGIx+zFJg7Z7EcZO2zbG9o9FKlGB+Y1zRr4OAYQP1fVgQliQSCzpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WmS5qlQu
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-30
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
Message-ID: <20240331075342.ta7YBiLipaxboZ3qp1QwjyuE6FC_eqBWdDIrmEsIhjo@z>

Hello,

Autobuild statistics for 2024-03-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 11  |  5  |  0  | 16  |
  2023.11.x  | 11  |  8  |  0  | 19  |
  2024.02.x  |  8  |  9  |  0  | 17  |
    master   | 62  | 51  |  1  | 114 |

Classification of failures by reason for master
-----------------------------------------------

check-11970a7e112dfe243a2e6... | 4 
                  davfs2-1.7.0 | 4 
                libressl-3.8.2 | 3 
                   linux-6.8.1 | 3 
                elfutils-0.189 | 2 
  gobject-introspection-1.76.1 | 2 
              libarchive-3.7.2 | 2 
          libcamera-apps-1.2.1 | 2 
               tcf-agent-1.8.0 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
             containerd-1.7.13 | 1 
              cryptsetup-2.7.1 | 1 
             dahdi-linux-3.3.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
                gnu-efi-3.0.18 | 1 
                graphicsmagick | 1 
            host-binutils-2.42 | 1 
   host-flutter-sdk-bin-3.19.4 | 1 
host-heimdal-f4faaeaba371ff... | 1 
        host-sentry-cli-2.20.3 | 1 
             libopenh264-2.4.0 | 1 
              libopenssl-3.2.1 | 1 
                   linux-tools | 1 
                     lxc-5.0.3 | 1 
               mariadb-10.11.6 | 1 
            micropython-1.22.0 | 1 
                 openssh-9.7p1 | 1 
   python-pydantic-core-2.14.6 | 1 
                python3-3.11.8 | 1 
                    qemu-8.1.1 | 1 
                   qpdf-10.5.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
             strongswan-5.9.13 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a8bbb5ced8343e08070361f260050de422144710 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ca3d5be8f8a81db728c1896d9c2d7c8a637c60b0 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/8fd55fdd39a4614d1541ec07307a01f12306e291 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/52f24e358014ee63acd04c6e2b9549c3c3fc40f5 | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/e0b5c8581ad6103dcf9bca2de074d1c1adc02062 | ORPH
  riscv64    |       containerd-1.7.13        | NOK | http://autobuild.buildroot.net/results/dccf05ba57ae366f702889fa9347065043229028 |     
    m68k     |        cryptsetup-2.7.1        | NOK | http://autobuild.buildroot.net/results/a401668d43c3cf05a733c750051c59a5bfee02e1 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/f4c22fd1e07d11dfe665dcdba4c94eeb71e405fa |     
  sparc64    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/fa019635f0ffd9440c43fceec7ed89922d97c040 | ORPH
   nios2     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/1eea9a4b889a16a21b440ae29ff26fffa69fcda7 | ORPH
  powerpc    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/d3c628d2a66cc89621aab0b2f32c8882237dd95b | ORPH
 aarch64_be  |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/3386c44447b09e434c60837ddd7eb08b5ef3d9a3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d0ce4060d555edcfe004b73f9bd5c674a214a735 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/55bb67adbcf90db0e86511de03474357dace5dfb | ORPH
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/7a21a229b1febf203710609d3157fd5e6928decd | ORPH
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/82a695218baac1c509b0bcf6cfb50029d6bb1dd3 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/bf0bc98d5c91e10b56bf748a8495c55a3d6dfa20 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f22783063df1d594dd37aff18e3d1671956baabe | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/362b103af89ccb6702ff7d3f4fce0b3149dca5a0 | ORPH
    arm      |         graphicsmagick         | TIM | http://autobuild.buildroot.net/results/ad68d9a2789dd53ed43baa5e24eab4b3d45801e3 |     
   nios2     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/703fc065bef0e7d86060e8ff85f95fab78a44c79 |     
  sparc64    |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/4c71a75f8e54f9c0ba9fac40087a726ccebfb09d |     
   sh4eb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/eedff63fc5e28063aefe09fad06a5dcdb37f9235 | ORPH
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/02c10d87772b0f2a7709332d8686ec90cb75fc28 |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/abc6824b0912f7d791c82cf66be057d825c6929d |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/86792542086254b5bd255717cdbf8e7e474c2796 |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b6efab42d3b8e2ed11b8737292fbc7c85bc4268a |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/339a070251684da9bef93d6e5b32bb0938e3aa48 |     
   mips64    |       libopenh264-2.4.0        | NOK | http://autobuild.buildroot.net/results/14de75a7c47e2fdc3324b810ee506ec04c50310d |     
  mips64el   |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/8a748a06e384c7571250aba54135ff4fb94c35e0 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3e62788472cd61520f9d547ceef4aa489f7d219c | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c76ec762b25aff63a51438f47d32dc2626850efb | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/38647244e2a70de83406c30474f60d20569b1a89 | ORPH
    sh4a     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/5f446e8eae796e0e4de99f74f5d00995b3cf55cd | ORPH
microblazeel |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/b1674ac399773cffddcab87be36d00e000eabfd2 | ORPH
    arm      |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/5ee359210be2b7647e8ac368e3e5d078823582d7 | ORPH
  riscv64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/33c9da2494b3e53a6c29966a1bdfdcb6d91ede14 | ORPH
    m68k     |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/f40a517eba86838b11b4b1d6a8a05b8233a3394d |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/465366441c32e9e6a3fadb2af63b2397185e3ae2 | ORPH
  aarch64    |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/23b471edc2379c725551ea31cff577073810e385 |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/5c0f23a7503083296c9326a4efe6684debd0c1cc | ORPH
    arm      |  python-pydantic-core-2.14.6   | NOK | http://autobuild.buildroot.net/results/2be718cce260a25b6851f9e28fe4a97e6602da88 |     
   x86_64    |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/470c473ba0a3bffe7dfc4ad116f1f03258ce43fb |     
    mips     |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/f46eab5756aa3b5b1b0d74b78180df91b8f4cb3d |     
   xtensa    |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/02b337e778678e82f369ef33ac26b69344db0069 |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/fd65d02380382bba9279f993c7716d1d5984247e |     
    sh4a     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/136f51e6dd05d2c3877d0298c362ca258334343f |     
  powerpc    |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/c087ee52193d3af5125edfebb7e5f52dce21125a |     
microblazeel |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/ed721bf0c835526171e5494130064845d47e301b |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/54194957f3817b0043ad610b62257a5cdcf23c0f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/741dadfcb41c1aef063fc9429217389b3cc795ec |     
  powerpc    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/2606eb3c971d593964ef5ab1d3963ca864493e21 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  clamav-1.0.5 | 1 
                     efivar-38 | 1 
               gupnp-av-0.14.0 | 1 
                libdrm-2.4.115 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          clamav-1.0.5          | NOK | http://autobuild.buildroot.net/results/2e206094357e287d6c51bf53f4c69905d1f2f9d7 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/b70adfb4a623c42242775e5dde805ceeff124ae8 |     
  aarch64    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/ea4451d33ec638d9e8eec0895d2ba82b42ef8d03 |     
    arm      |         libdrm-2.4.115         | NOK | http://autobuild.buildroot.net/results/8ea7e83b7b3a223f797d41e4c83d1c79c0728040 |     
   xtensa    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/53bd2327a9327a476b0a0d41ce8160cb42d2ea99 | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

android-tools-4.2.2+git2013... | 1 
                  bitcoin-26.0 | 1 
                  boost-1.83.0 | 1 
      gst1-plugins-base-1.22.9 | 1 
             host-delve-1.20.2 | 1 
            micropython-1.22.0 | 1 
                python3-3.11.8 | 1 
                     z3-4.12.2 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/971113d62afc683dbeb36c81b7ecb6d01427e091 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/bf291c60e9082446b3727f9f71f6c857e095639b |     
    or1k     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/eab4b3811ab87ef133ac1354d56a99a54aeaf0c1 |     
   sparc     |    gst1-plugins-base-1.22.9    | NOK | http://autobuild.buildroot.net/results/175a748bac02a33613dff0f48275c303cdab35e1 | ORPH
    arm      |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/59c2fcadf4e9e7301e21cbd14edf65de2803d59c |     
  aarch64    |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/4ec3c3fc48353490411651a70dc5ac452bf6b435 |     
   x86_64    |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/1cc9ec6698f194fcd21ed27b456fc153ce9e2793 |     
   x86_64    |           z3-4.12.2            | NOK | http://autobuild.buildroot.net/results/b57c5bacf78bbcda2fe6b2ee55b58fdb592f3759 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 3 
                     crun-1.12 | 2 
               belle-sip-4.4.8 | 1 
         host-gcc-final-12.3.0 | 1 
                  linux-6.6.22 | 1 
         python-pymupdf-1.22.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/851df7a44df8d7df0f8bb53bb5f7b8ea40c2720f |     
  riscv64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b265e05848917c1aea2a7c75ae6e6d2b40f88578 |     
powerpc64le  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/174ec6250354e46d96339aa56715b19828bf9e4f |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/b1120332d26f1a6cc9f97eabd5d4c0e7ecfb9f6f |     
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/47b6f8c67572045abe19d6043b62eb2e4b8880e0 |     
   x86_64    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/cc76634373208b1c48c7648c2aa24265b44e2817 |     
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/4ca62eed266d239b9c27896f367fff9d37e64c45 |     
   mipsel    |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/ca9b24ee03c179da35e40accd9487ac54fdb2a90 | ORPH
   xtensa    |     python-pymupdf-1.22.0      | NOK | http://autobuild.buildroot.net/results/4cbf824efcccb6269e2ee1524c41eef8143edc3a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
