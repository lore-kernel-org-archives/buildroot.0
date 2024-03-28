Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B42C54E67
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 06:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0BE860C08;
	Thu, 28 Mar 2024 06:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHxaHiWcMa2y; Thu, 28 Mar 2024 06:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85ECA60C00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85ECA60C00;
	Thu, 28 Mar 2024 06:57:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19FFE1BF844
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 06:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0742240993
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 06:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJnTTj3c4PO0 for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 06:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E24C240992
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E24C240992
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E24C240992
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 06:57:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3A0420008
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 06:57:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 06:57:25 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1711609045; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MdEl9+7MgCJvc63mofOSFEo+jRuF+zRURejIhHC5+so=;
 b=OoZ391ZaZzf4NEqEE3dtAB7UnSlq+LkbncPS63n7VZDN7yMfYPjgwbSEEFV9flzEcr+X5U
 C1BEwK6b2Zds6EYYgxAHY0JTe9aY/p8fk+PT0MHj+iCXx8Fml5yEZv8VIOaFzqxjOb2Kqy
 2r5jHv1ks+s96f3kjKI76ULLjRX+Q2OSjWZp/hWitfdpcbmYTVJfnjMIpTFYQT8Qe4eTug
 AynMLB//SF+u20s3RdDxPk9UYLVQMSYByhzun3H3INyFBhB8vovJPr0CBhUbygQ3Pl38z1
 P6XbhjjvPxRMveJzXvNQUQ2F3dh7Lt/ViQP03d+xB4TWzwWWVcgA3nRfxveHuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OoZ391Za
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-27
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
Message-ID: <20240328065725.RiCpiaGzl0xHnppvfIfeE0CCfFujdAUDL_WuONzycCI@z>

Hello,

Autobuild statistics for 2024-03-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 10  |  5  |  0  | 15  |
  2023.11.x  |  5  |  6  |  0  | 11  |
  2024.02.x  |  7  | 10  |  0  | 17  |
    master   | 25  | 36  |  1  | 62  |

Classification of failures by reason for master
-----------------------------------------------

                  davfs2-1.7.0 | 5 
               apcupsd-3.14.14 | 2 
dmenu-wayland-a380201dff5bf... | 2 
host-heimdal-f4faaeaba371ff... | 2 
               asterisk-20.5.2 | 1 
check-11970a7e112dfe243a2e6... | 1 
           crucible-legal-info | 1 
          cryptodev-linux-1.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             docker-cli-24.0.7 | 1 
                     frr-8.5.4 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
            host-binutils-2.42 | 1 
               ipmitool-1_8_19 | 1 
          libcamera-apps-1.2.1 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.76.1 | 1 
                mongodb-4.2.18 | 1 
                  octave-8.4.0 | 1 
                 openssh-9.7p1 | 1 
package/crucible/crucible.m... | 1 
                     php-8.3.4 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
                tpm2-tss-3.2.2 | 1 
                       unknown | 1 
                 wavemon-0.9.5 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/87e1c47c7235b72e130240aed3c7dc1bc1bbe5bc |     
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d25cfe544217517c3e392f8db928b6bc4dc88826 |     
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/dbbc0e3e241224aad31689665dccbc581cc7fd0a |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/014b2f512ed676ec9302ff1752ffc01e5d334f0d | ORPH
  aarch64    |      crucible-legal-info       | NOK | http://autobuild.buildroot.net/results/c0d98559f569cd34a84b05b4df89e7c62a19a9d4 |     
   nios2     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/81dcdcc79218254e4ef2cff87f22856c545d34f3 | ORPH
powerpc64le  |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/f8bb96d920dcc6d2c7115c7bd925cf0f50f5486a | ORPH
    arm      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/25249cd3310448e4916853e1f6b366f6b75a4d13 | ORPH
 aarch64_be  |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/7a2dc8a33f3d528867613b2313b8cbcf98fc0e70 | ORPH
    arm      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/ff80e06c119510c270f20f87265060b7dc4fc675 | ORPH
microblazeel |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/318c668b16f09bfc4cc835bd715f595c9dcdd39b | ORPH
   mipsel    | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/980aa82656b15f0f66455238fac5fb0684ca9daf |     
   mipsel    | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/ac7ee5510d864e7c026b5234e5b669f94d07b6de |     
    arm      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/41765f2821a400bcfe5ec23280f6daca6bccead8 | ORPH
  riscv64    |       docker-cli-24.0.7        | NOK | http://autobuild.buildroot.net/results/0f3712d2aaaf0d985a89354d42f5432d944f4ec3 |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/a8c7e6f6c0f3cc71055cab87ad3a035f5d865ec1 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2afeb697163e87950b5b4be0b7490a0874cce4da |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/75c78362d5c156155acd8fd630c435fe791c05bf |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bb9c0816f0b58b08ac7032bc89ed2dfb9c4c377e | ORPH
  riscv64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/0ced3f7959672dd60671adc83d83035d4f210f30 |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1bb696e7edacf08baf29431afbad335f5989f326 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5bf3f1f6d068f6c636ee965aee1b4f11ce426de2 | ORPH
    arc      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/d5e4905802a053e0d06a7c9b69941677d6663a74 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/49f75377e4ed3c601f20a1606f0d513b1cd358fb |     
    arm      | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/871399a6696280ee5d6be8f57a61d43df7215187 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0d1d0ea705b1e8168ff6a2e3ff8dd2d0fcb120a0 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/a4b2b86f98a89808663b8703bcbcd2c47d3ea3bb |     
powerpc64le  |          octave-8.4.0          | NOK | http://autobuild.buildroot.net/results/a666a1615e0ce6e4b920851bbfbf90d40af7421c |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/c44c8938ec25885e049ac5ce2c1bd704225fb5ac | ORPH
   x86_64    | package/crucible/crucible.m... | NOK | http://autobuild.buildroot.net/results/e4e4b054d4fd14d080ccc0d767a4b90fd08f71f2 |     
    arm      |           php-8.3.4            | NOK | http://autobuild.buildroot.net/results/750afe108129b87ffc7458972316cca35db82c3b |     
   x86_64    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/d80dfe6ad37c5c566fa2b20a1af7f52dcdfac8d4 |     
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/d78ac712dbf1d7a15db4e29895a264cc82e49f40 |     
   nios2     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/1742779c473bcadd90c321b9003949cf49287f19 | ORPH
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/c8ca71f250c902122c261d7eb403839e587044b8 |     
    arm      |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/c8d842e1cdb8736bff65861beb2debe7b125702d | ORPH
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/7c0c57889a481c6682a80c2ddc83c3344b7eaf6d |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                     efivar-38 | 2 
               gupnp-av-0.14.0 | 2 
                  waffle-1.7.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/bdad1f752b95433a0ff8fdb8c2a11c609e4da3eb |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/16dfd1369d977e27fe1f3bd57af6f8909ac2ccbb |     
   sh4aeb    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/5d2273ea4f4bb68e62ce8ce9515f165d0cf0b0ca |     
   mipsel    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/6d13bc6d87cd031334abdd4777e3f3fae4ac8e6f |     
    i586     |          waffle-1.7.0          | NOK | http://autobuild.buildroot.net/results/7cf08f0616f5c17bf03dbf0679ccf8fde3f9136b |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                  boost-1.83.0 | 2 
                  linux-6.6.22 | 1 
               poppler-22.12.0 | 1 
              skalibs-2.12.0.1 | 1 
                       unknown | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/4805a98b568846a10f5e3dbde338fd2f2f6d3655 |     
    arm      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/4281b99c26fbc141edc6f0298bf7428a9a5caa67 |     
   mips64    |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/5790d8fb8448cb851c0332ec9278021f0aa1f52f | ORPH
   xtensa    |        poppler-22.12.0         | NOK | http://autobuild.buildroot.net/results/9b1422b2d305a9bc6d9c8072c74a4d5d33c175a4 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/eb9a4578f937188e34120a6c6f0b676796f09984 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ad8188906c8421ebf4905131d7e313b089410cbc |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 2 
               apcupsd-3.14.14 | 1 
                     file-5.45 | 1 
                    gdal-3.8.2 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
  gobject-introspection-1.76.1 | 1 
               libglib2-2.76.1 | 1 
                libressl-3.8.2 | 1 
                    qemu-8.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fdfd00acebb34dd29d71bbf1562266bce659390b |     
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.net/results/ef56e89bc106016546584fa0265cfc98014e8ca5 | ORPH
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/9e9a958c5c3744463319ba846af9ab4884c7c359 |     
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/2bf1a872858ada962cc4ed799a3a76fc54654cc3 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ca78e546d7dcc060cc3d20b46ae5bc5f95371c3a | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/dbaecb9f808c17b76d6a49ff8fdedea989a25124 |     
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/34a171299ddd6a30c2dd533ad41e0334ca7d0344 | ORPH
   x86_64    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/1834e83fc5f444feb68c6a65ffaee4fd2823283a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8f3fe1cd3acc12a6ae4014d676570e83c5b48a3c |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/a0c4a09bb3a0f9824f984b1a77c1e68bdc6728a4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
