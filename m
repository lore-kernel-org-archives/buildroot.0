Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631EEEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 30 Jun 2023 05:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A806E81F37;
	Fri, 30 Jun 2023 05:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A806E81F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DROZf4vsbefn; Fri, 30 Jun 2023 05:01:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4602081F9C;
	Fri, 30 Jun 2023 05:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4602081F9C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 904271BF3C8
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 05:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55C3E417C8
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 05:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C3E417C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3P-hFGPtp5eA for <buildroot@lists.busybox.net>;
 Fri, 30 Jun 2023 05:01:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07223417C3
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07223417C3
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 05:01:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 53F67C608F
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 04:46:11 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C50A20004
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 04:46:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 30 Jun 2023 04:46:06 -0000
Message-Id: <20230630050155.55C3E417C8@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1688100366; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QQJcarPsRLHDfRzUa1jvxky03haXVyeIe7g1UZXuuhA=;
 b=NcMunrhr5Zue4LvlsG1IRN0UDGx6U0U9bC1DR7Vhs3BusMBlbwIQrVZaiTsxOaREL4w7tx
 VrXpOZN3A5B+pniZVcHrW7vRSzSbZFqidZHaUu5l9pxHKoIafbkZNQheFFlf9NtMabp25A
 ofSyixTOTHKD17CwOe52Y188JR90dsrkJ3kosl80fhenHrpSbmaWcy8ASrcd9BC+9JEIbZ
 6K6cRWHELLO+neZZWXhCXZQuN4VyrlNNx1EcMYvfHvbun4iWw8u6ue1W4L0GjAEGaq66V1
 co+aN94UUXuKr2GCyahqT502sCev/ydQ3LRK4BK5EcTHz6KDUMxzxUTKLJzACg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NcMunrhr
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-29
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

Autobuild statistics for 2023-06-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  3  |  0  |  9  |
    master   | 111 | 118 |  1  | 230 |

Classification of failures by reason for master
-----------------------------------------------

                   gupnp-1.4.3 | 17
                alsa-lib-1.2.9 | 8 
                   linux-6.3.9 | 8 
                    strace-6.3 | 4 
                 agentpp-4.6.0 | 3 
glibc-2.37-2-g9f8513dc64119... | 3 
             host-ccache-4.8.2 | 3 
              host-rust-1.70.0 | 3 
          libedit-20221030-3.1 | 3 
               libglib2-2.76.1 | 3 
                 mpg123-1.31.3 | 3 
              open62541-v1.3.4 | 3 
               syslog-ng-4.1.1 | 3 
                 dc3dd-7.2.641 | 2 
                elfutils-0.186 | 2 
  gobject-introspection-1.74.0 | 2 
               host-go-1.19.10 | 2 
              libgcrypt-1.10.2 | 2 
                  ntp-4.2.8p15 | 2 
                    olsr-0.9.8 | 2 
tovid-87c676f4aadb7303d2cd9... | 2 
                   trinity-1.9 | 2 
ulog-0389d243352255f6182326... | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                    brltty-6.5 | 1 
          cryptodev-linux-1.12 | 1 
                   expat-2.5.0 | 1 
                  ffmpeg-4.4.4 | 1 
             fontconfig-2.14.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
                   guile-3.0.9 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.4.0 | 1 
igh-ethercat-2e2cef61318953... | 1 
              libcamera-v0.0.5 | 1 
               libcgroup-2.0.3 | 1 
               libvorbis-1.3.7 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20230127 | 1 
                    mpv-0.35.1 | 1 
                   perl-5.36.1 | 1 
                     php-8.2.7 | 1 
                     pv-1.6.20 | 1 
            python-sip-4.19.25 | 1 
                  reaver-1.6.6 | 1 
rtl8192eu-865656c3a1d1aee8c... | 1 
                    sdl-1.2.15 | 1 
                 uclibc-1.0.43 | 1 
                  xvisor-0.3.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/2431e31f3ab135ca8ed3cb19c7a577030d2f51e6 |     
   mips64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/2180d1dda885176491e8585f445da4147a4c34ea |     
   armeb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ef0fc53d6727d7c483be7ca754ca82e2dc3c6845 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/6bdd59c8c6892bda9d35ce0657f18157f4b06d3b |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/1e965d83d75615f35308440c5db044314a349357 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/8a8454438c6443041f22ed8ca92ada8e61302157 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/679dc5511aef878adb9ad93c2148d1c95dbfae58 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/0cc08a5bfedb8dd2d1fd3bc5c794205a0c2f0ecb |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/51794f4da4cf147c36b190220954d934b96ba29d |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/2470d6af6bb8257656f5596ac1b9c6eb6e2d6cb0 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/b37032182086aeda4b1fad81ef3ea9b3935a29d0 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/255ea37ab2e62e5e374019de8f58ce58c53f5fc1 |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9e89f66384069a70e68d393e6f57237a8525bff6 |     
   armeb     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/2856b394a259b3012f24078381b0d7efc30dfa18 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/db2b5d08cf1466891ce1b7e82e5b8a405fc6550f | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b9aea8f8645e97e2d74027e61a88ec952215c628 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3c5cae3859694dedad6fd386cb935fc00e752432 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/59943e59e9f388308a6fbfb1ea04b469b07773c1 | ORPH
 aarch64_be  |          expat-2.5.0           | NOK | http://autobuild.buildroot.net/results/28603fec07ab0d255c0bc08c91c10391b04b1a5a |     
   mips64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/e410150470c3895871b3f9bc0616ed5dc1900ca2 |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/de2837e40bf8c5ec5ce680c176b13f0ea94f3927 | ORPH
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1c44eb59d3fb30276e7e938be06eb9202457ca16 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b9b18fa67613ec30f29b68ebe2da49734101d778 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4992147774c93ab37a67d7cee61dc765079fdb92 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/b934f4daf64414cae467a75895897f01e6454ab4 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/78e9a845eb2e3244d11a923e0e735d0fb236e2e5 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/5994594d47803df1798a1830eeb0da00c6523355 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/40b198aa01505459f5e4e321fcf5e381be7a5b58 | ORPH
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d10ee0cd4ca5522985c9d0cb9d826d2e09553f76 |     
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/5584940af18001ce3227104f95c12ac7040e79a2 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/ac1100f277ac5766366325115d7b061d36eb7c58 | ORPH
    mips     |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/db71f5426de95ade2c3710aa3698f83de03672a5 |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/b310c1a19b4b1f5f52149dbbc9811511b04c7f4a |     
   sh4eb     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/98b5c7897fe8290b9b6eef09bac457c996370ef7 |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/e1814722fe00d7deffaa537dc90efd4d3c3582d8 |     
    or1k     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/5826452e20c1e5a89d26b7607a0d08bae5b0131c |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/1be779c2d51feee100336cc2006eeec57911b932 |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/412beec80e0e612f07374891fd21764ff9a7fbf0 |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/4c30e303ffbc27b5928c63e9dea2099ea632007f |     
microblazeel |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/409f8e6203a599ed98c13a9e05a218938ef1b449 |     
    m68k     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/2609255c0c9219c13b0f0a92cf3cc8a4944f35f6 |     
 aarch64_be  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/4e795da44f3849deb250358325271b4f90f256eb |     
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/241ace50e4a0888cf267c0e2e1c7d3865c62258e |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/e7766597805e6896c49402ef4fa72e4d85aedc1c |     
   armeb     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/33174957c184569673b12680d099e868500446c1 |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/b777b85c232355310d7b1f2aabe10a4f9aec3ecc |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/0502c0a238bb615f7022eb6c6c1d2680ab2aa312 |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/e12e618fcfe829e81c78005bc2942e86e8e25c00 |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/3ac3a27f3f700ada72a3085191eb7d0f56c43a11 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6deb7af775c416765afe0e2930ca8f558ea5908e |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/027ed5a83eca48f8e086f837563e5d6e7ced15d5 |     
   sh4aeb    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/eae0c77b4b4e1c84260e4878f5bbd899dae5d255 | ORPH
    arc      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/fdfd176837b930084868eff0a2242cfa0979df02 | ORPH
   arceb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/dda5f5985211a5b3a8a6554e6618d518f68f8ab6 | ORPH
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/3d4fc9d26934dfea7ab0ff294f4fedffe0a2d4a5 |     
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/b942cf9c331e9dd54beba00ce048383a1568ae31 |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/405fecd86cdfb81db087982315fea6c633890506 |     
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/de8c87dd4e16763ea8de55fe61fd61686ddd82dc |     
   x86_64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/e7959181c89bbbfd909d6d4509cc1bb7f35fbb74 |     
  sparc64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/5cd61cde60ab77c2adbb5715985d331181992d9b |     
   x86_64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/5d5e606d8f65f275de45fe35cd92442f46f89761 |     
 powerpc64   | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/dde50405c15e950d65bff50a3a4f4f49f8cae000 |     
    or1k     |        libcamera-v0.0.5        | NOK | http://autobuild.buildroot.net/results/03bd44c2ccf498a8cfca7b067dfbb2f7c52b2338 |     
 aarch64_be  |        libcgroup-2.0.3         | NOK | http://autobuild.buildroot.net/results/3139cc211ab414dcafbf340943d2ad9e3327c3b6 |     
    m68k     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/031bce60aa0f4d58efcc47c5f36a7fc9baae6d0d |     
  powerpc    |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/c742c9a196bf19ab12d8ad6703140fc5a2847868 |     
   xtensa    |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/21726c0c6fe3bf241e0c3068256b2104028d7b51 |     
    i686     |        libgcrypt-1.10.2        | NOK | http://autobuild.buildroot.net/results/83ecc94554e1762cedde78087db953ac349d2995 | ORPH
    i686     |        libgcrypt-1.10.2        | NOK | http://autobuild.buildroot.net/results/d6d9b5d20ebb0ac8178c6bd6389e7e60c7506348 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5326a21c77ba5aad37085e7bd20254dfe3518b4d |     
   x86_64    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/98bcb3193fd3a0574588db2d995828cf26ef0283 |     
   armeb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d4b229e33c5fa8d4f5cc97fb52c09ab8ebf2def3 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/84dc487bda7e5303157d1afe7ba41c374b06ec28 |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/9ddfba7912ef8a65cbe3733a29e444f97a1d0bd4 | ORPH
    m68k     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/928618359eaee8980f7907fa21eef2397dd0c583 | ORPH
   mips64    |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/0dcc1738fbbe1dd0a56cb36b10e440d23f42d662 | ORPH
  mips64el   |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/d1d812e6b42e96f560905ff859b77842196b2f09 | ORPH
powerpc64le  |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/eb2b5ecce45a8b091e3af6000467277b1d19f81b | ORPH
    m68k     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/5b154c8f07056dd1f8e38eae219c0914357f3173 | ORPH
   nios2     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/cd14766ecd490d2eb8539212b63e2597831433cf | ORPH
   armeb     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/b93fa76e5c2ced0b7bd30511a0aa7a5e8b0e4b96 | ORPH
  powerpc    |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/2c1bf8487962026309612b693903f69ef077f1ca | ORPH
 powerpc64   |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/d36b0160ea15578c1845a875639e07ee3d9639b5 |     
    mips     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/092733b5bcda8bb93b9d1b0a84d86799d05f48f1 | ORPH
   mipsel    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/3d42bc21e508ff681f97d97ec23cfa5a994a0791 | ORPH
 microblaze  |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/f3bab1de12e5d8af24754c2d2c021f178e619db7 | ORPH
 powerpc64   |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/39ea8e4973bf2bcf3bfaaada5e6f0ced4b9e4004 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/f57eb987fb10ed21b265e0370b18ad43fe681616 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/d63cbdcd3d33681ded2f44475b50ee1e60e4eb64 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/af9a108b262a476821a56870867032e2f7bf56e3 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/221178aaffdfe2d4aa08ed3090d575091e353a7a | ORPH
   sh4eb     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/fcd5c144ca7b0644ea6e93805f9766d6eb6b2cea | ORPH
   mipsel    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/4bb7189712ea5d4d45f967537ed0c7983c897b85 | ORPH
   s390x     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/9e8d893ea702be7694164788f2bce0665a36ca50 | ORPH
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/f3b2c15813a6a3c70832bc14d8f5e9c36543d71a |     
   armeb     |           php-8.2.7            | NOK | http://autobuild.buildroot.net/results/b68411dd64c69b7be4bc65127c249ace53c11547 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/a6126f4d486e078d9441c2a0a399c902ba92c36e | ORPH
   nios2     |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/f9f06c5c80835eaceb98f4a382fe7ec13ea252e1 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/827125f5b19730640df198c611579cddb9e4ac8d |     
  aarch64    | rtl8192eu-865656c3a1d1aee8c... | NOK | http://autobuild.buildroot.net/results/819d575fa4df9d685661a5642b24113717f6b2c8 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/9a453a22445ec36101903b58074a9f67b84a624d | ORPH
  aarch64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/f2de6917da51bf2e029ad0a4a1faa9f9939e2505 |     
 aarch64_be  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/127850b307325b778058f69ba67599bc1b99bdf3 |     
   sparc     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/8e335d1b2ee18b6b3c3ed4feb5c35998efe8f158 |     
    m68k     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/b4c7f4536af18bb6ee5fca1ab0763eb7bcadccdf |     
   sh4eb     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/40d61ef72dbee34e97d614fed2bf0af9cb9929b2 |     
   x86_64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/fd906b877b0279177596fa70401007718833005b |     
    arm      |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/2a4517c874cf15b04983a7e9b3f110693177ad4b |     
   s390x     | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/4dac2bf2fd2d5fc6636a37ce6de63b306b6fe79e |     
  sparc64    | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/eb01098b7646e6d5f65882095ce84821612c4cbb |     
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/34b4373b48c4b46a067e658e4fcbc961efd89aa9 | ORPH
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/4d38fa91ceaf52e8110b7e19b6335c6c7170c7e8 | ORPH
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/0b516a47c945e9f44ee4986a7099733f93ec82b1 |     
    arc      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/cc264d6e7d1e93e59b6d742cff4359d7fb84b79a |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b9625959d236a8f7b550919065934bf248809e28 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/d1cc902dd1ca9d5677f36ae984913999c6319526 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/a1fdac889777a501b73379e8ad93f1a7160f5719 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/3879064e0e21c0e09939cf5c903ee5cd5a887299 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3e09876869e722eb678c4ea45d230e6f775ec79c | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

         host-gcc-final-11.4.0 | 1 
               host-go-1.19.10 | 1 
                  linux-6.1.32 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/8d93cf942f7e1726c1aeb5821da57fa637279552 |     
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/bb179abd5f1920ec8c661d707fdeb531aad72eb7 |     
   s390x     |          linux-6.1.32          | NOK | http://autobuild.buildroot.net/results/6ac404beeb223c34265a072384b452e9d2b26590 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
