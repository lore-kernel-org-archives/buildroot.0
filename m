Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD8AC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 05:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1B9614C2;
	Wed, 10 May 2023 05:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1B9614C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pPH6UHC98ZbZ; Wed, 10 May 2023 05:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A55F60F00;
	Wed, 10 May 2023 05:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A55F60F00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9811BF327
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 05:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 607F6403AA
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 05:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 607F6403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7CATUclGahx for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 05:43:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775C440186
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 775C440186
 for <buildroot@buildroot.org>; Wed, 10 May 2023 05:43:32 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 819BFFF809
 for <buildroot@buildroot.org>; Wed, 10 May 2023 05:43:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 10 May 2023 05:43:29 -0000
Message-Id: <20230510054334.607F6403AA@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683697409; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OXKm8xIL5srS7d1qoE+4mrYRKEb+nBAoPEYu3igYEXw=;
 b=DZqMWbEPLljgWbCCzPBocA/qPiW3Mq/i6F/b4n9+e8q2q1SQ+KZKJvKuRMOUbmzOGhOKQy
 KKjTahiymYk/mM/BBToyqxXbCl6Wj0iaieeG/0/8Sc+KmNvlM2vSWvTX5ILhrAwrYy04qr
 elfqVK1gsoy8JbTXRNgyO+FXff8NgdkpboUF2lLAaDf32jLPi88PVek9TbLG0IIeQrb59+
 h8C1vJpwdD3NMKJQx84IQ11hr2R5uPGiELRS5CQNnhi78Jxn3XUXz8ny3r1+ofhw+Rdezx
 AXsdzkp98uZ82WRGRHXnrQBAiSjEawaWx3GpAqZsglV0yiutpVAkzif4w+gDWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DZqMWbEP
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-09
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

Autobuild statistics for 2023-05-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  9  |  0  |  0  |  9  |
  2023.02.x  |  7  |  6  |  0  | 13  |
    master   | 31  | 35  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

host-heimdal-f4faaeaba371ff... | 3 
               host-qemu-7.2.0 | 3 
                   bird-2.0.11 | 2 
                host-go-1.19.9 | 2 
sconeserver-8d1935919a20133... | 2 
                       unknown | 2 
                    zeek-4.1.1 | 2 
azure-iot-sdk-c-LTS_07_2022... | 1 
             batman-adv-2022.3 | 1 
                 coreutils-9.3 | 1 
           crucible-2022.05.25 | 1 
                 dc3dd-7.2.641 | 1 
                elfutils-0.186 | 1 
            flatbuffers-23.3.3 | 1 
                     frr-8.4.2 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
            host-binutils-2.39 | 1 
                    lcms2-2.14 | 1 
                  libbpf-1.1.0 | 1 
                   linux-6.3.1 | 1 
        ltp-testsuite-20230127 | 1 
                 mesa3d-23.0.3 | 1 
                    olsr-0.9.8 | 1 
           python-pyicu-2.10.2 | 1 
                    ruby-3.1.3 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/514cc58b05bd06cfa1574bbcc7a311ec77bb2f4d |     
 powerpc64   |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/3999b6d60748efda22e79b2de201da888d714c64 |     
   xtensa    |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/ea8c9d89359a7188e5649342e8de07c8e5a39368 |     
    arm      |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/c31aa8840e16f9878542e530a78283c43216dff3 |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d1af75a2ffe595e6bb2477c6940dac4d421791b3 | ORPH
    i686     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/4d0783323a18be24892eaa48aa7db1eed527b676 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b140816ed417aa0deca5cdbb57d610ba28bbf24d | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2373c934ea8c5aadd145e7e0359b9686cbd848d9 | ORPH
    arm      |       flatbuffers-23.3.3       | NOK | http://autobuild.buildroot.net/results/4b04f5feaa63416a29c73767740b7187240001b1 |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/bc7c659c5e391cbe7326653772d4683559c54842 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/b7003b616d76c145820a1bba324e2d4799df3593 |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8d25fcf422a4515413708231ea81f98ac6c4c490 |     
    arm      |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/c8c94bcfeb62e0c2b5043b0b11114353b3311298 |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/cc8ec778d7113878f23960dee177b3927f9d5869 |     
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/11b6c363733cc84f001a559784a1026d6b6fd502 | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e2a694dc9856b4caa94029ea31776bc51920839d | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/31cba2a3336eb35faf1e78634948888cf0111fe5 | ORPH
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/bd697ae6cc7b489e3263ba6f9676831fab60fda9 |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/b3fdc18eb67190b063443d3a34641b4588af0b6b |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/e8d630bd9b59b54a472beb1c6d1f7a86ea87b9da |     
   xtensa    |           lcms2-2.14           | NOK | http://autobuild.buildroot.net/results/bbbd886770098672c319e341a979d5c9bbe1ec0d |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/39f065395a9abb94e6fb2d841a94b98c7a5ae543 |     
    or1k     |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/edf5c1fb05cbc38830980ac43b53269700619be6 | ORPH
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/862b27aac92751e2e3a05ae03c26651d7ee1cfce |     
  mips64el   |         mesa3d-23.0.3          | NOK | http://autobuild.buildroot.net/results/0a6a11fa1e4db224d9f0451a6bf1157403f8ba4b |     
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3037c8f0d1c0f37363f4bde924daa5b0dafcc44f | ORPH
    arc      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/b37e24f956140063bb850f74e1631d04e5ca6ab2 |     
  riscv64    |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/7ee6bde36271c2192fd70acd0b7561ca47e55cd8 |     
  mips64el   | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/cdd1ea60736f748171c4b977dbf46d14f57c2858 |     
  riscv64    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/e70356702fde53ada90fdcbd77f70a26a3617066 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/490e9c65f4cc4cd9cb91bdc82ade99b16eb64937 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ce0f7713c9f9f64106f363d7fbfe8831a8a53420 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/95824b7fb90a1dfb77ebdead8fd61500e21cf23d | ORPH
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/8e430ace1bacc3e6b9cf889619efa0b46832b8b3 |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/152efb49bf89f76a2a65fdbde01cabf6d259ccc0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                    sdl-1.2.15 | 2 
fs/ubifs/ubifs.mk:49: /home... | 1 
               host-qemu-7.2.0 | 1 
               libvorbis-1.3.7 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/61873b80310ed9c7f4ae43c6c685e3187ec78474 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/62ff6cc522a164a9a49732fc24929fc0efb1d26b |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/fb69a3d9497235c615be48772aaf9761a338ce2d |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/285806e9be16c67a2cae8b423b1586759eb04a76 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/6d26aec86f2dc525e201e7bab7357f1079ae0841 | ORPH
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/c594e26691b169033d2e8b911d7f4c5da55cdb6d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
