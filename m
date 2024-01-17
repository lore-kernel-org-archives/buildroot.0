Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D7FC47422
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 06:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD81B415D7;
	Wed, 17 Jan 2024 06:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD81B415D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vscdw9XiaY-L; Wed, 17 Jan 2024 06:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F54415D9;
	Wed, 17 Jan 2024 06:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F54415D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 632BF1BF285
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 06:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 053FB600C9
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 06:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 053FB600C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gujk_fr9jUS for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 06:45:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF251605AE
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 06:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF251605AE
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAB461BF204
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 06:45:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 06:45:06 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240117064512.053FB600C9@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705473906; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YDawufSF8P+/DkMdvO7ZK4tlVhCQMEgxvxksEmsmqjo=;
 b=ANvC+C7cOUmRosGOnFEPdxzos5TNx4lW8c+JWKcWZob1hHP1gncY6jjZWVZ/Jl9Xbzgo4Z
 yu1CcmZO13BA9Xn7gcMStBgsrI5GtwJXe7YR3thmtsF+D2SPRuUs5aDUbgeS0AwhYqoE62
 aGu7cTTUKMQ1KGtJpn02RsN9LscaiiLRonFHlUfMbQpWutlQZdgs0pnujX3KHa/hFqrM2X
 1wMD6zAtA+EcaiaD4HOWJHtKIu1MHLLkqtN1j9iIc9SjOh1lekG8xR2A9LmY19y82Y+iIb
 S866xJkSB4V35GMVufJBLc8UyzLC4i0mDDf55HQvb693yO0nUHQ+i556XD/niA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ANvC+C7c
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-16
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

Autobuild statistics for 2024-01-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  0  |  0  |  2  |
  2023.11.x  |  7  |  7  |  0  | 14  |
    master   | 45  | 44  |  0  | 89  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 5 
check-11970a7e112dfe243a2e6... | 4 
                  stunnel-5.71 | 4 
            micropython-1.22.0 | 3 
                   foot-1.16.2 | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.74.1 | 2 
 Makefile:727: target-finalize | 2 
                 openssh-9.6p1 | 2 
                       unknown | 2 
                    attr-2.5.2 | 1 
firmware-utils-86739f2b3ae9... | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
glibc-2.38-27-g750a45a78390... | 1 
        host-sentry-cli-2.20.3 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.2 | 1 
              libtracefs-1.8.0 | 1 
               libunwind-1.6.2 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.6.11 | 1 
                memtest86-6.20 | 1 
   python-pydantic-core-2.14.5 | 1 
         python-rpds-py-0.12.0 | 1 
                  rygel-0.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/c97088b3a2d9070d77bddbc7b058a46d56b0f91a |     
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2c5e89fb911bf12fa93519f8ab62a3a5a5639d18 | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0f14cbe5368a61a8ea491ee236b350cc55f2138f | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ad293ae8f9697cb40fccd77ee392130857f15606 | ORPH
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0431c885af6fc527cb0536c67ca3e553421ed1c7 | ORPH
    or1k     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/e327b15a0718a8acd7c6ac60edccad6d19027ba6 |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a8fdfbf44d95485e9e85120741ff8ce59797146c |     
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a6337e89de60eed19f546c04185772e1e2f759e2 |     
  sparc64    | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/59cb3c57e2eebe5e28b7252bbc02c7fc5c579819 |     
    arc      | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/093fd1063765b420fe053d8f5988cc1c9e401400 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9399b6ce24324f8bbc69d411ac32aa268eae7e1a | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7dabffb93850fb3c99928036b01a6bdcd9f46671 | ORPH
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/362bab6d32e59266427fc4c94366ce1c75e3792a |     
 powerpc64   |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/61dc1df5aa13f0175972bc16fde7951e240ae015 |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/218cd65631236f5481f2a5b851949221aa2cc50e |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/424df9b4d70bc679a6ff76e187b9911a9aa81b51 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/dea89c05e07876ef627f1cf5e0e88b27f8584cd1 |     
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2e84ff7d941c095239060750e009956194649061 | ORPH
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f1fc8f8bf812db3ac53c7a3f5b5174b8fdf64b7e | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6b283f017335924d9d69615cb19b957baec25232 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5f8efd6961336801a429fd3deea6e5c74a9ca8bb | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/eb552ad1c76355cfbce51bb33a49594c998ee01d | ORPH
   xtensa    |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/e0a8dd0781a1d1824a4cb78f47dcff4055083959 |     
   armeb     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/76f1f836fc65a58ba2e866f29876a3c67d1130a8 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ab486288e38454d116cc57ddf7f8b1c9e86d82a9 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/870a45477b42b1f270ad5bd9e2c605ff7fbd20af | ORPH
    m68k     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/0e85481b7f98054cc733db2f8918d9d23fd0c12c | ORPH
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/1e32470259cb6e9bc1aa35ef0058ffb0831c777c |     
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/48f2a2cab3083eb10fe050cd65f12197b467b595 |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/a7d7972e12f9d061a3900b4e7b4ccef30f848141 |     
    sh4a     |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/5d6d5444b81704e51e80a8289242e32c2263358b |     
 powerpc64   |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/f7df2a6f83cd937c777e5fbe9e9c7f5e013020d7 |     
    m68k     |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/387a588e00e43e9c6dea0da532f9cb774f41f1e0 |     
  mips64el   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/6f16d0bfb7dd04be2f04525fa6640064dc2b2f8c | ORPH
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/dcbffbecdaca87bdb6818c374eefec275b53ad54 | ORPH
    arm      |  python-pydantic-core-2.14.5   | NOK | http://autobuild.buildroot.net/results/86e098c3143e071265c484206f6c5d667f301052 |     
  powerpc    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/d38265fac4dddf438b94cea85bc3f1085e7ce8ba |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/1f2b845cca4060ad124135502b69ef675b482e95 |     
powerpc64le  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/6e37f19af72a4552c14508e5b3ae8e46dfb69474 |     
    arc      |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/e855a0cd428d56dcf82f0968b2f5e69daa970620 |     
  powerpc    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/ce011b029e39291e4a4c679d1265bd05bd54cf04 |     
microblazeel |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/2bd0242357310250879851fb223ecc689f49ca02 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/920d72c6ad1d284e732b4e5fa60bc6c94e915cd3 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1011ae7c7b2345ab0ad038d2a9bd75a8a88be67c |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                libressl-3.8.2 | 1 
                  linux-6.6.11 | 1 
                 openssh-9.6p1 | 1 
                    proj-9.3.0 | 1 
         python-rpds-py-0.12.0 | 1 
                     squid-6.6 | 1 
                       unknown | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6c733b08c41dd1a8a8f8bd26369adfcdc654e76d | ORPH
   mipsel    |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/6b9c9a59adeb5144c7df5da6ad1bcde454f3612e | ORPH
   mips64    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/1dffe68f1fd6525e4579a1051f170c8a132f4324 | ORPH
microblazeel |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/5a0ade19212fc62d090c86fd8c2e793464e52263 |     
    mips     |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/f3795398c3b4ecbd576c3c00b2a5595a9a23dbdc |     
   mips64    |           squid-6.6            | NOK | http://autobuild.buildroot.net/results/06755c324f0bf37e52976fce48a5ad62915193da | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/04030dba16f0a146face66a3f626e27a20df425e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
