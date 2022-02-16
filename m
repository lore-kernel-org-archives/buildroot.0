Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E909C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 07:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA3AF4160F;
	Wed, 16 Feb 2022 07:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fE4y0Q0jDH7o; Wed, 16 Feb 2022 07:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0AA3415FB;
	Wed, 16 Feb 2022 07:32:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B58211BF578
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 07:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A30B360B4D
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 07:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAdpcHQUF3GD for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 07:32:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9B5D60B1C
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 07:32:09 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4DDA20000D
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644996727; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B6ONoUR8ZJKk555OwKNi30GHvkY4qlhu6QYJsBHsUOg=;
 b=fZjY9dNGeE6LyIHsO9SrpgrM0iCaG8s+bi5JClOMuPPAouSEz0ZaNR+Nt3VJOsPAVWvJ1m
 t+5ORtFoQAqZ1a8mIJkHXOpCGG3EjjkD/e+QQdkGEaIMM6jli4njMxwQXbezcRbNuhBp3w
 gj3MmrS+TzQd9nwZ32ba32TvwWOqUIxZcOGelGJmlvvX9v2WvBWTyWPyACqWQf90VuYCNV
 ccCst4G/PLUdMfw/V/aM3RGx3gpG/uwbAFnj7eKGp6IMoYaL+XXojttvdfGjDnvILP13SI
 QQjszA7h073kaHdwp1wjpwkP4gy7tGhxllD+qixpA47eiy5if4WU6QRhsPsQoQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 07:32:06 -0000
Message-Id: <20220216073211.A30B360B4D@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-15
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

Autobuild statistics for 2022-02-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  | 11  |  1  | 53  |
  2021.11.x  | 21  |  1  |  0  | 22  |
    master   | 54  | 27  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

bpftool-a7f0e7f057283ae8af3... | 4 
                       frr-8.1 | 4 
              cryptsetup-2.4.3 | 3 
           host-libselinux-3.3 | 3 
           wpa_supplicant-2.10 | 3 
                       unknown | 2 
             bluez5_utils-5.63 | 1 
librtlsdr-ed0317e6a58c09887... | 1 
               protozero-1.7.1 | 1 
         python-greenlet-1.1.2 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
               target-finalize | 1 
                tinifier-3.4.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/9216c677cc8789dc8dd0fbfe1b6a1d8f878716f1 |     
   x86_64    | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/82f5809f0fc05ce814fe67078b9d622fbfdd0324 |     
  powerpc    | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/278f73fb745f97e61c27c6ba776003329b5a016c |     
    arm      | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/c08b40d4af432072959aacf0298e0e282254df01 |     
    arm      | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/6bbad051ee9c8d3ddf11ea2a536bc7a8cf9e4867 |     
  riscv64    |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/0887f4f8fb4c4a2006ba711028b2a37f3fa5fa46 |     
  aarch64    |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/7b016b7170aacbab34757194e88fce95fc7edac3 |     
  mips64el   |        cryptsetup-2.4.3        | NOK | http://autobuild.buildroot.net/results/70a839430158717f520973f60458e4e80ff469b2 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/694cc65478a82ec93d2074252892036855cdc49d |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1bb288cd7f8536e6c374d33b257e8ad1587502e9 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0b38841d4b0bba1b1e24fcbe9db68b745054943d |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/456528190fbd95e23d6d24cc75b5e01499ffe032 |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/4019c8db0d5979e0ec2276ab5625a31b9e9985e2 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6fbbbd2ef6261f57b1405edc93f81f4c29205e3b |     
powerpc64le  |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/cbab90ac0ca89b5a52635b54d2b4051f0bbcc8cc |     
   xtensa    | librtlsdr-ed0317e6a58c09887... | NOK | http://autobuild.buildroot.net/results/a366ae8d1713e60e82f26a27f2146bc16ae54d25 |     
    i686     |        protozero-1.7.1         | NOK | http://autobuild.buildroot.net/results/c3ae3b5caf79eb30c8a1786f58abea4f2b41a26e |     
    arm      |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/ed896fb6b7a451faecad76bee0e9e113f60cf409 |     
    i586     |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/87f52db7f8ebefa4c1ae3dd70d4a7a460f9aca35 |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/5d8d7913dd595932fc832b9cd690f0ceab69c735 |     
  aarch64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/d6eae4cf0c00330366130dd4623c5db245bf4c47 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6eb1c45dab2ec3cb1bc577325318556a9d82ed23 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3dff4ba9c6e8981d1aacaf82fe43d685c3837189 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/07a1f872056f993317b2101402567f85643cc0d9 |     
    arc      |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/001981339f3b895ecd9208a747a0e47d07c9583a |     
    arc      |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/1dc4ea7d73cf6234012e38290cf7c8eb67bdaf84 |     
   x86_64    |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/758ad18658c61586a2c60b69074a729f2add3f9f |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 mesa3d-20.3.5 | 2 
                  zeromq-4.3.4 | 2 
            erlang-jiffy-1.0.6 | 1 
           host-nodejs-12.22.9 | 1 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 
monkey-f54856ce250c4e257354... | 1 
               openldap-2.4.59 | 1 
                  sunxi-cedarx | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/bd9af5a3238c3832f17ed9948047b755908991c2 |     
   x86_64    |      host-nodejs-12.22.9       | NOK | http://autobuild.buildroot.net/results/c1e1d1de23aed9359ece120174bf0e7dd3cc3e4a |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e7b8435858f34e3d359d435e716a2c4e08ebf53d |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/66b929a0c68ca1b0bcb04a1a6d6db503f27e757a | ORPH
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/bdd367e2ee4f294f9ced3bfd46658702d63e669f |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/79d652c295b61dfd913abd47cb8417a8b67db513 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d5abe7732a5c59d47b9a52acdad9daf02fc069bf |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/9f6e9d33f43ad96f3a1705184e031841ea9d73d4 |     
    arm      |          sunxi-cedarx          | TIM | http://autobuild.buildroot.net/results/8ba0758c59f8c509db91d8c0b6841dc224e2a5d1 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2917820ea84e5497d9cf334b3a45d9159dbdd3b5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ec0580315c5fb2ee88dc99413c05d7373f2147d5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ad864a532b758a3c11cc0243630d71a3a74996dc |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f0c5c48f92e88a7ca7654f77ef00506ab68ddfae |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
