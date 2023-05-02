Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647DFC77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 05:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A30140183;
	Tue,  2 May 2023 05:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A30140183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1gJ2F7dWncF; Tue,  2 May 2023 05:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C23BD40264;
	Tue,  2 May 2023 05:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C23BD40264
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A22FD1BF40B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 05:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FD484021C
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 05:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD484021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJMADtujz3eO for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 05:38:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86385400E7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86385400E7
 for <buildroot@buildroot.org>; Tue,  2 May 2023 05:38:07 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E2B911C0005
 for <buildroot@buildroot.org>; Tue,  2 May 2023 05:38:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 02 May 2023 05:38:05 -0000
Message-Id: <20230502053809.6FD484021C@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683005886; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aVcbEFA26VOdFFvIfKl7MzJvbk73Mb/RgYToAkMjbmg=;
 b=Y+OmZ4bXj9KvjJBfefJj1iKxG/Bfjt1wNk6gaxDalLQNYF6iC43r/4u+l7MAi8rAdBDU5H
 hRn5zF5kgNTxX8xhCLDcIhK2t+6/xK16ct9xb+qRfw5M0HTT/0+TP6z1ZBjQuMNU7Zvdzb
 KxXeMzMVvyz9EA7rP+cOZfD+F7PoX2hoWbqQDzQL3WxkySCqhupvpM6kShyiDzGpHN61p1
 Gz4n5684wXYzKVBwg0Krub6q231eRGC0XfndP0XxD9k64gq/EDyjkGTq8DOKAKK2meNk54
 2X7ITbFcBNIRGJHUn+j/DWc+uXnVZCs1iyVpH9waQDOu6ght6J2UH50YXw31Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y+OmZ4bX
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-01
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

Autobuild statistics for 2023-05-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  8  |  0  | 12  |
    master   | 32  | 34  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 5 
                host-go-1.19.8 | 4 
         host-gcc-final-11.3.0 | 2 
          linux-5.10.162-cip24 | 2 
                 uclibc-1.0.43 | 2 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
                   flann-1.9.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.37 | 1 
             host-delve-1.20.0 | 1 
         host-gcc-final-10.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
              host-rust-1.68.2 | 1 
               libdeflate-1.15 | 1 
                  linux-6.1.14 | 1 
         multipath-tools-0.9.4 | 1 
           python-pyicu-2.10.2 | 1 
                  readline-8.2 | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c19b37da2f0755a03f7946756548b49966eefdbb |     
  aarch64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/0d599c5b4911aaec7065efbb7aa238888e606101 |     
   nios2     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/aaa6ad4f02b9bbc5b7a958acee18b500ab23b40d |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ec139c84523b41d83dab77fad49d81038484d95e |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/23d35951834734c84da83c47a0a166d46a572afa | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/88a1337b345f60a3daba0670ed2dd78453ec7036 | ORPH
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8be0394a46564db7175667027931abfd189a1b53 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/84245ffca231dd777d3233c74f0f7bb065229dc3 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/dccecb7e80bd418c6adc5f9b4564e94674d4da2d |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6d665ed8ff49f7a34d49a47caf5565e99bf7c22d |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/209821805c11e7b7541827b90b75eaeef1f58893 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/79ecd4be16b8236492f2b78b78bdb7644599b585 | ORPH
    i586     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/91b43f86ebddb6b5dbb2eddf0de6b17f4d029854 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/98f968ab27370ccd1adaa09f7086b3c70e09181b |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/369109f87e350b7c7030fa4f339654c8114d2a87 |     
    i686     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/e79cba89d50404d26f29c450acb9e5cafa3f2f37 |     
microblazeel |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2c9a2fe123be69c7c5847111f13e8a03b9b026e7 |     
microblazeel |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/dbd1a9ac6b0bf1473fa7be394bf51734c597d93f |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/062a0026cfacd3ec25fa349cc53c00144411414b |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4701a5b39f2af27794f43e74baf61a40423d56ce |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/35e70d7b60706defc9c441f2506592c499c048d3 |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/fd4b06546660abb20bb74754748959883b665efa |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/d7dce21c4e49b8b5837d4c0733200b3256900703 |     
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b92ee5f79cdec179bea474dcf2738c974c8b036e | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/5baece8809fd869d6f8833cee80f8273b2df4b81 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/73a055f0485102add0dcd6e6ae9574e093c5d7bf | ORPH
   armeb     |     multipath-tools-0.9.4      | NOK | http://autobuild.buildroot.net/results/555bd8be19ee51ef4d18b505411f93cc62ef5177 |     
microblazeel |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/b8ea98102540eef87f273066010ae7c2b70be33b |     
  mips64el   |          readline-8.2          | NOK | http://autobuild.buildroot.net/results/80c6ef3191a7e6fed5c1b2badb14a729bbea2225 | ORPH
microblazeel | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/96d08c80c0452af46ff25e6455aea64bd32c4cd8 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c5de459f4dd26d7ac8b1171ff6b28e190255ecb8 | ORPH
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/150c74d9ac6acc6ad2e43a0566da9c7264e7d97e |     
   mips64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/5a91bc3b2a842a87f683401b412c1afc071743d7 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/60be15723d41c05eeccaebb6c64c9d52b452c860 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                host-go-1.19.8 | 2 
fs/ubifs/ubifs.mk:49: /home... | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-qemu-7.2.0 | 1 
               libglib2-2.72.3 | 1 
                  linux-6.1.14 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/15f508cad41a70f4155679edc07c306d45f2c335 |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ed19f4463035749a304cb1d6ba3bf562a5cbd4ab |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ff3545e7255eb98ef0d994609d1ecfa339f08f7b | ORPH
    i686     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/b82d9b099f2bc66702a28779a6db359857cc2a52 |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/e47857272b3befa81827b3235e4813365877fbdf |     
   armeb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/00df852922a1fd65a511ba44bffbec1f18f1ce81 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/50424bfcd4176f93f2b1340b9266668de0807e0b |     
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/2445f5fb4c087fe73eb621fa914848dd7e068134 | ORPH


Gitlab CI results for 2023-05-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691032  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691033  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691488  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691547  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691575  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691424  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691426  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691428  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691431  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691436  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691438  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691440  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690927  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690969  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690970  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691122  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690992  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690993  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690994  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690995  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690996  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690997  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690998  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204690999  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691123  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691125  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691145  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691224  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691223  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691231  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691232  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691234  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691236  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691237  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691270  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691293  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691306  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691378  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691397  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691411  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691413  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4204691418  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
