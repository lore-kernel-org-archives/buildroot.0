Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B52C54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 06:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27502407A0;
	Thu,  7 Mar 2024 06:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYxkXqHOx2D7; Thu,  7 Mar 2024 06:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50CDD40758
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50CDD40758;
	Thu,  7 Mar 2024 06:40:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78D061BF5B4
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 06:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 657F460811
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 06:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2ShlA4a75DJ for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 06:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF52A60607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF52A60607
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF52A60607
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 06:40:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3285240003
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 06:40:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 07 Mar 2024 06:40:51 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1709793651; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0aCJ2tWbqFkfbn8NknemkaAJDQA8ZKHuyfs2dy9UyzE=;
 b=O+LbF87wfSwhZQTLWe7QVA5W3r0fPl0LL0pVCtsZrlzdyTQOHusXXhhwy+xOJ5Sw619j5e
 FMlL89+JbLH1B5HTr8l6zyJxgs5hcabJTKxYjJ9epjsWg0VHD2Bn3D9MfvpRrcY1aZBw5M
 Kzvw6NBbSuuBV87mGYHn3oTLNdnZxswC/UtVTA4vQzasbsTKE6ZvP0qYFU5/nQlgGMXulp
 xr++IxT7VtgeYSwZXRA31NxE8gXKFyjwJN5lcjdaGybd/uC8vod06uajwUrYxlLtoDvH7F
 RYuzuqZBzukafbPtFTRExmiKx/NSErpIx+9AA7yeJiMnjz6gyBCZxAK9f6Qe8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O+LbF87w
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-06
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
Message-ID: <20240307064051.S0U3IxULL3YpV2GZ57OEzTapie1nebtLGQIBWYnUnh4@z>

Hello,

Autobuild statistics for 2024-03-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  6  |  0  | 12  |
  2023.11.x  |  5  |  5  |  1  | 11  |
    master   | 59  | 64  |  0  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 8 
                  linux-6.6.18 | 5 
glibc-2.38-44-gd37c2b20a478... | 4 
                  iozone-3.506 | 3 
             util-linux-2.39.2 | 3 
               asterisk-20.5.2 | 2 
check-11970a7e112dfe243a2e6... | 2 
                gnu-efi-3.0.17 | 2 
host-heimdal-f4faaeaba371ff... | 2 
              libarchive-3.7.2 | 2 
          linux-5.10.162-cip24 | 2 
                       unknown | 2 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                   bullet-3.25 | 1 
                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                elfutils-0.189 | 1 
                    fcft-3.1.6 | 1 
                    flac-1.4.3 | 1 
           flatbuffers-23.5.26 | 1 
            gdk-pixbuf-2.42.10 | 1 
  gobject-introspection-1.76.1 | 1 
            host-binutils-2.42 | 1 
               ipmitool-1_8_19 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
          libcamera-apps-1.2.1 | 1 
        ltp-testsuite-20240129 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                     lxc-5.0.3 | 1 
                 openssh-9.6p1 | 1 
                 powertop-2.15 | 1 
                    pppd-2.5.0 | 1 
    python-cryptography-39.0.2 | 1 
               tcf-agent-1.8.0 | 1 
        util-linux-libs-2.39.2 | 1 
                 wavemon-0.9.5 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/c2b68e10bf4106a360a19c4507bd8a9326dadcc2 |     
  riscv64    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/fed774894891b8122cca0c97ce1651930c2c9552 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/36316cff57f3b8420e28143a0c8d77371e98dc67 |     
    i586     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9b724238f43ed426519934dfbf3beff1a56984be |     
  mips64el   |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/e8cd38fbee458d7e8cb5578be96ba903f48a234d |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/34f97ae9c162b606395ced3567488180178b9072 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/125a80e8cc0906309e047d26dd7b72aa10f21a9a | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1236f28fd678f5eb96af93f3609863371edd81ca | ORPH
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/f9f6fd6901e7995d2fff325e7128b0c67e6ad809 |     
  riscv64    | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/9fbb257a06efe53b5056dd5d85c79ce88f35c99a |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/04da6912443b82c7843a17772e39e7854ae2c0ba | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/530152c36668d0786923c2b529c8f33245fe6fb5 |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/833c5fc7976f57871c2dcfa153df52e696028c38 |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/8de9b8086093f771b66b93a43b81f0d81e1ca264 |     
    arc      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/b3dbfe59635df82e4408b1015cd3e3fff89850cd | ORPH
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/8d2a454e9fcc0e2aa98e23d1024160a3a14a83f0 |     
  powerpc    | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/80742e1b45ad902562bb7976843a52bd4f29fa9a |     
    arc      | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/9be7cb8eeeeaf805d2d38ee97560e4b58aaae9cd |     
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/f0a0ccfee184073c57f0fefc39e9fbeb78396bf5 |     
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/5ce3168474bedcd7147f560bf8c08f30595c517a |     
 aarch64_be  |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/aa613fe4a2c983505ebf8ffa960f7caf5dab891a |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f27059c5711ab77de70226d94e3712f003281fdd | ORPH
    m68k     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/ecf1042a76d89aae90c0979f2201d7a5f21af7ef |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/764c09a262f8592b9e2474fbf4d0aeb6112ef270 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/55d0f8b448f67866fe88ee96fe3e210b230a1a78 | ORPH
   mipsel    |          iozone-3.506          | NOK | http://autobuild.buildroot.net/results/31a4f0ac9eeb71df5d2f40ffe9f1f256cb58e399 |     
    arm      |          iozone-3.506          | NOK | http://autobuild.buildroot.net/results/eef6ea8ca90d8ad9feb101be78bf614121970c85 |     
   x86_64    |          iozone-3.506          | NOK | http://autobuild.buildroot.net/results/13e80e806c94fb1dde048179e414e0f7b6834b55 |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/e71aa95bf3117a85217acc01003f11d962c97ee4 |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.net/results/62b927ed84856df4a6b5fb079acc7c2733ba4ceb |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/6743fd6b6e9b886a5a3af7952a383dc910f5cef2 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/d13222d3197276f5f2d3cb01ea211918cdd87b81 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4ecc56529eba94b6e39b0b607820952a4b584d19 |     
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6b8a6f439c26b95826d050ea9e87b8b5b18acd0e | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8ec7c0429f9450e7d527da7116008005d68c6569 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/420b18823292ad0340a15bef2cc2288125929478 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9944a6e24456ac1de40317a5532730fd05c62e2f | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1efccaf70f5450e96349421bbf78e0354bf42e56 | ORPH
   xtensa    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8044d6a7b69c7216c4a5dd35f5746512dfe997ed | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1721bfd1d3e9ffeb6f6e2f7b0b8025155e73a9b1 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5113a699e3bec8aade26e6db04eaa6fcd995ad35 | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/258a9b0d82191323f911f395e6ac8530f7955692 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/3cb500c7ade9b15b66fcc2e4653072b376e73049 | ORPH
    arm      |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/1c69ad4e8a2b3f9d80ecc4613b2dfff90a729d15 | ORPH
  sparc64    |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/6df81504a6b2a7bc45874e3fbd96a8a7d0796544 | ORPH
  mips64el   |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/6fa77701d8777362ec7c34ea7ce36d8d06a8d58a | ORPH
  mips64el   |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/4174d7c96791ff5e1d3badf5e66e5684b102608a | ORPH
   mips64    |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/37edb56e50104232a225895662047c3c896918be | ORPH
    i686     |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/ac06d56e7e7ed83c263ed056f5c840fef0b2b81e |     
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/6cc1d4de88841a940d49112d01da16492fd1ce4c | ORPH
  aarch64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/01b28a27a1743f7d0f082866ed3bec16b0d6caef |     
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/ea25b99768b33f37dc39232655aa653198a9b9e4 | ORPH
   arceb     |         powertop-2.15          | NOK | http://autobuild.buildroot.net/results/af3974ab606888279c71f165a7d86f9fa6641e0d |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/25a8c8b7926106cdea653bf0edd5880a342adb58 |     
    i686     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/59f3f234f771e953b6df1c3e46a933546abbc5f3 |     
    i686     |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/5236bdca88af09c9851aa731e9458415c64449a8 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/92bdc9b2d00562e5c9bc7bc1457a33f2d3266eef |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/2ce552dfb2f2a40131a6c34de1657a0e12ae6cb4 |     
   mips64    |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/b61fd08c194add48fb5b396d044b80ae7ca26c95 | ORPH
 aarch64_be  |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/ae937c8d0e1fd28148eb2896d1f24eea200f5b99 | ORPH
powerpc64le  |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/64e7292bb04a9a9eec392f55cd1aeb9512fa8f9c | ORPH
  aarch64    |     util-linux-libs-2.39.2     | NOK | http://autobuild.buildroot.net/results/9840e63b04b01c79b1962448f5c4a855895c5bfe | ORPH
  riscv64    |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/c507a3acc2eec9dfc13dd9e321bd325a16a1c736 | ORPH
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/92bf2acde65f9315133028ca1e639eaf57e77f1c |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 2 
                       unknown | 2 
                     frr-8.5.4 | 1 
                    qemu-7.2.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/5ae47ef81afa2d6905e69676183160cfd42ff731 |     
    arc      |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/f3d4d6ebddfd66f788e2bd7773a10e1474e7d6ca |     
    arm      |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/56a2a6daf76d55283aabc305955b9aaee0763a6a |     
    arm      |           qemu-7.2.1           | NOK | http://autobuild.buildroot.net/results/43964a041595dc371bfccef9f047cce122503457 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/300087901dd4fda1560b0dc2dd6aa3b6925db4e3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ff86a0311a91491588c53c614d00a0dd560abad0 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
                  conmon-2.1.8 | 1 
             dahdi-linux-3.3.0 | 1 
                flutter-engine | 1 
            freeswitch-1.10.11 | 1 
          linux-5.10.162-cip24 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7348fc68a7dd3689e6e3f251f8e038181a6c229e | ORPH
    arm      |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/d85252d0dbaf45a8ecc47deec362bfc177a63564 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/438f90517ea76911094705447f2b0ccd6d42977a |     
  aarch64    |         flutter-engine         | TIM | http://autobuild.buildroot.net/results/333be996b5ea4f016f4dd0de58d458b15a7110f0 |     
 aarch64_be  |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/98092972a0d7d65102cfacfeb6622ec5d6eb0bfa |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/5bc175afba59463db3863ab99f6c41f09a25260c | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
