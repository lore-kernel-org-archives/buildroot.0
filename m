Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF27EE3F2F
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 06:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5644283B76;
	Fri, 15 Sep 2023 06:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5644283B76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYO7r_gcXxOU; Fri, 15 Sep 2023 06:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7686E83B61;
	Fri, 15 Sep 2023 06:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7686E83B61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 296171BF2B7
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 06:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3DE240A67
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 06:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3DE240A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atvYOf2S7b3r for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 06:38:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AA0840253
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 06:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AA0840253
Received: by mail.gandi.net (Postfix) with ESMTPSA id 889746000B
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 06:38:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 06:38:52 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230915063856.E3DE240A67@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694759932; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t8IBwKDlRgV6TYA9QS77EdDQWUmLeUASRGfTrc7c2yU=;
 b=M61H1gO0Ni+2YRSGtcstMRl2XyNi2ImGEukNjFZ+qFrP4JcOUdH4l1T6fZIby4zOd4l6tu
 sxZvqr088LLsPoVzbpdJgRcnkubTKc2oKKa5ZCLXHV+tQOIG3YbMaYIhb7dEWyrd87QShy
 10z7KWQe/QNZP8tTvE8YaT7pmovsGH+2iqyv9AQEhxhLtxyyJEE0MIkZ2L7yvE/CMBCL3i
 pmxl6afzDA4M/Z+hB6gt6PVyYQt0kohU+zGbMaFtqZZLjihjDrzwVQTqfDJyT3QHPZuqjW
 ufJDCVeS4PAN1mlwiXVXnDSI7hH69nD58jwGHFMNyYWxqIS1R6bhuJlc4g2RGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M61H1gO0
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-14
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

Autobuild statistics for 2023-09-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  2  |  0  |  4  |
  2023.05.x  |  4  |  3  |  0  |  7  |
  2023.08.x  |  4  |  1  |  0  |  5  |
    master   | 46  | 23  |  2  | 71  |

Classification of failures by reason for master
-----------------------------------------------

         gobject-introspection | 2 
                  linux-6.4.14 | 2 
             bluez5_utils-5.68 | 1 
                    brltty-6.5 | 1 
                 coreutils-9.3 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                gnu-efi-3.0.15 | 1 
                host-go-1.21.1 | 1 
              host-rust-1.71.1 | 1 
              libostree-2023.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    ncmpc-0.47 | 1 
                  ntp-4.2.8p17 | 1 
                oprofile-1.4.0 | 1 
package/libspdm/libspdm.mk:... | 1 
                     pv-1.6.20 | 1 
                 reproc-14.2.4 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/60080f7aabf34c6c51385d11a348d0612a76d5e6 |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/c1470014d902b3b690375340097e1c52c2041b66 |     
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/0e797df6ffd82bd6e055eaac5d22f7a7a69bfba9 | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/1462f2f9347b81eac2bda9afc54582b8d1647ded | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1e43e6b15a1c52084de5ca9f215232cd80079d03 | ORPH
    or1k     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/166d51f64dfdeeac713bf5f8c2a0932ed4aee087 |     
    arc      | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/2de345723d7fedb73c417bd52be77be362d1f02d |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/60e4beef8633019f28c673f98bc6892ad7d14e8a |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/705b1f2f809576f3442562fef187c8ada2689ba2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/829ce8102e479c8e1d0da18db13a3d8440cc4408 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/347be8a4d9fdb6c665899e6ce606309063b62d66 |     
   xtensa    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/5e18defa7ec19530cbe58a8f2386f60aeaad0725 |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/13b8ba4d994731ae047aa9c5e5f6938dc8cf5763 |     
  mips64el   |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/629684105fa8411742890d66463840dc11b0414f |     
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e4ee97f624b9902122f87acc3763ca656cbe9371 | ORPH
  sparc64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/17812be66a2447689d5a2688791b36e75d56b9d5 | ORPH
  aarch64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/d04daeaffaabded8779970931c3d8143e7a0a7dc | ORPH
   mipsel    |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/50e10b09e795f3e5187ecc959dfa7fca23b07510 |     
    sh4      |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/10dadaffba4e4517deeea6c8432660b743a3df91 |     
   mips64    |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/7fb9fd099b8874aa588e5d81096fbfb433e83019 |     
 aarch64_be  | package/libspdm/libspdm.mk:... | NOK | http://autobuild.buildroot.net/results/2f9007ee40126cd57753bc97ae2d81c922d9f9f2 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/143b79dc332c1e54498c5a6386e629df8b073545 | ORPH
  sparc64    |         reproc-14.2.4          | NOK | http://autobuild.buildroot.net/results/eae83a8db60a7d4bceeb4621b2071708fa049129 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/79cabba7acdc8503e3b59a56748938bca3f4f333 |     
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/dea32739db2c389a7d4de705ae809030c42b0338 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                freerdp-2.10.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         freerdp-2.10.0         | NOK | http://autobuild.buildroot.net/results/fa3c39394de48f4bbdbea0702a78e669586f9f88 |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7640145092338f564e8a96ebcd54f9f5fa50c7a9 | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                    olsr-0.9.8 | 2 
               host-go-1.19.12 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        host-go-1.19.12         | NOK | http://autobuild.buildroot.net/results/110925ae4f6bbd53e0c45226bed374e98123923e |     
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/df716f50d9b4d78d642ace4c6441066f421ede62 | ORPH
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/430b770850bed7b84f4060e665472ccd2a0936ea | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

               libglib2-2.76.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/29a25133f80fbae63cbbafc50bc62e9aec367b76 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
