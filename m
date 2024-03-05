Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2A6C5478C
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 06:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6203040137;
	Tue,  5 Mar 2024 06:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-Q9G08jXjuI; Tue,  5 Mar 2024 06:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37F8F41528
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37F8F41528;
	Tue,  5 Mar 2024 06:44:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 667DE1BF955
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 06:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 535DD608EE
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 06:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BplYYJFO79vn for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 06:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 961DC6089B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 961DC6089B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 961DC6089B
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 06:44:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F328FF807
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 06:44:23 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 05 Mar 2024 06:44:23 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1709621063; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c4bukdie1KBY1UujSZq2IprPUzChfn0I43smksskY+I=;
 b=YCSuVHNGnzYXyk2/EACiRme3xB9BfI3ueHuNf44ws6q6P1qDEGMU+PEK0RgIRsA83dD84b
 luVShich+Y9uHZhnamiKQ87mOm4ZA5d7r7TsT3WNPuUYVcLee2qqHumVtsJBjwFZjZabVV
 meb3HXKdv614I8/7QHKaMudLZEIgkUhV2aTRgn2kTSi9DWY66CT46JUwb0tW38hGewXPS4
 Se7ewFeEUjnUJ4DOvRQH9cuwcob+LBNwYnHT0gVJPqP51yyz/LxejUZtieRyYrOLt2ULyn
 I1uCqY8ECN0aZWXJdclQY66rVW/+rM6l/eaCrTAsFcQ6ANoCnTWqE2l79NkpBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YCSuVHNG
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-04
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
Message-ID: <20240305064423.rK3qVsubhiZ2UqB5VWOpWZfuEjkk5ko8h3XFTCUrw-o@z>

Hello,

Autobuild statistics for 2024-03-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  5  |  0  |  8  |
  2023.11.x  |  8  |  6  |  0  | 14  |
    master   | 45  | 32  |  0  | 77  |

Classification of failures by reason for master
-----------------------------------------------

              libarchive-3.7.2 | 3 
                   botan-3.2.0 | 2 
                elfutils-0.189 | 2 
              host-rust-1.74.1 | 2 
                libressl-3.8.2 | 2 
               asterisk-20.5.2 | 1 
               belle-sip-4.4.8 | 1 
                   bullet-3.25 | 1 
                    dust-0.9.0 | 1 
                   foot-1.16.2 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.21.7 | 1 
host-heimdal-f4faaeaba371ff... | 1 
igh-ethercat-f5dc109176400f... | 1 
          libcamera-apps-1.2.1 | 1 
                librsvg-2.50.9 | 1 
                  libva-2.20.0 | 1 
          linux-5.10.162-cip24 | 1 
                memtest86-6.20 | 1 
mmc-utils-80271e9a6fd0db9cb... | 1 
     portaudio-190700_20210406 | 1 
      rauc-hawkbit-updater-1.3 | 1 
                  tllist-1.1.0 | 1 
                 wolfssl-5.6.6 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/8f7572b2f08bff860190584896c289cb408bb634 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/f732345f10167c55a9274e963738cf4bec61f97b |     
    arm      |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/8e00b1c5cff407f02c0d6a171e7cfc0bbca6d3ab | ORPH
  powerpc    |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/4171515ce33832fb07c8b42cda2575067f9e9859 | ORPH
    arm      |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/0263cec554d47fd2b29ec727ffb2e06b4cfd8a89 |     
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/777f4b88ee9acecde35e641ab497a180e7a96f39 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bd08970adf641c444b5ceebc51144923bce91c70 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5d192ef25a33ce732ed8de9f493065fdd0b34219 | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/53e5afa164627ef5f27202d6ed310d7899754647 |     
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/cdf682c917c3d84507537b5f76631b6db32d25b0 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9a14f3cc49871fce0cd73f74828903cd12ee6035 | ORPH
  mips64el   |         host-go-1.21.7         | NOK | http://autobuild.buildroot.net/results/51f76a31ec5a3357b1d793fb4d45661289a0edcf |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e39d6c0b9cf4902b2f5c47031797f359e38b779e | ORPH
 powerpc64   |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4236124302805cd6dcca50e46f80678334932d0a |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/d26d78e1dea6a42ddbf76a82fe6f0fd44f27fc42 |     
   x86_64    | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/c27e155360f258f39fc8fb51522cbc5e047c3e87 |     
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ec72e062400d8be8b6c7d1f0dfb4ee0e62770bf1 |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/f822c9c91110faeb16e6eb954d7ad18e6fdfb853 |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/35e86a7c1667d6abc5ac164698fb608155b30943 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e8398a3e69289d74c4e205997da2bbc0acbbd401 |     
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/67a0a901fcee5242a273f0668e107a16af12c897 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4344d1f0e036fdf0187d82d5ac50854da22bdb33 | ORPH
    arm      |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/8c0dbf211dd5604f1b0a1ff08ed181d7779715f4 |     
    arm      |          libva-2.20.0          | NOK | http://autobuild.buildroot.net/results/b9dbd104fa05c59883d87f74e6522c55620a4252 |     
    arc      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/89443474fe165348d5a165cd9abd257d83307fcd | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/e57ff3831c4aee5b999cb707492f9d55e661b50a |     
    mips     | mmc-utils-80271e9a6fd0db9cb... | NOK | http://autobuild.buildroot.net/results/06f972f95f4f2e0e7504b1fa069b89695b7377ef |     
    sh4a     |   portaudio-190700_20210406    | NOK | http://autobuild.buildroot.net/results/8adb570f31839b236d96ca42885ac2cfe33c2527 | ORPH
    arm      |    rauc-hawkbit-updater-1.3    | NOK | http://autobuild.buildroot.net/results/e275d0ec4fe1da418a6163b46666316034b83b19 |     
    arm      |          tllist-1.1.0          | NOK | http://autobuild.buildroot.net/results/e82fdf4f9ef199e1baa169d38a75872bddd4e6dd |     
   mips64    |         wolfssl-5.6.6          | NOK | http://autobuild.buildroot.net/results/36d9ce840c8379429c9f3c34a9886e828476533b |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/707212e8dbed4a22c9e31b91a174f425d146abd3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   perl-5.36.3 | 2 
               clamav-0.103.11 | 1 
               gupnp-av-0.14.0 | 1 
                     squid-6.6 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        clamav-0.103.11         | NOK | http://autobuild.buildroot.net/results/4a26464279bf617286a1692c28134f5a98870e57 |     
    sh4a     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/e27755dd8a947157b8515ff20d318c554689af14 |     
    arm      |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/47a1df631bfb9ee35869ea2a2853d7201a574956 |     
    arc      |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/88eb79088eba1476ec97c1e991ae626227f5292d |     
  sparc64    |           squid-6.6            | NOK | http://autobuild.buildroot.net/results/f1766d1a3b2ce7745fa23cdeae1101806cd97aea | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                       unknown | 2 
                  clang-15.0.3 | 1 
            freeswitch-1.10.11 | 1 
                libressl-3.8.2 | 1 
             util-linux-2.39.2 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/d8cddd43b1c1f63e8c3aeb4d5babf28da2f0f226 |     
  riscv64    |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/54fba021d441bccc99e34b0d58707f8de43b0c9a |     
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d9b3e071dab661b5f01d8bb81a358924ea58b3fb | ORPH
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/07c7140d92466b1300f2c48998f7d222d146da38 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0bf632d9c29e2e7bddba8bb36e16dd5894c2878f |     
    sh4      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/df9608e9de362ef66c7ba2eda32f5d0be135f38b | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
