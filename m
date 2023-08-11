Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6435EEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 05:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAAA341B97;
	Fri, 11 Aug 2023 05:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAAA341B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEwf_jYdGKIe; Fri, 11 Aug 2023 05:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 485C641BAB;
	Fri, 11 Aug 2023 05:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 485C641BAB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFCD91BF410
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 05:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85E644010D
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 05:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85E644010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tC4KJgw-SBBg for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 05:39:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC52A400BB
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 05:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC52A400BB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19B0860003
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 05:39:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 05:39:51 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230811053955.85E644010D@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691732391; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tPrM+125m+xoXNkWoorLYF9i6wYiUN1TVBG87AL75L8=;
 b=et9E+p7e5hlOEzs8fNr3tG0kPq2yxfgsOx6kPJ1gPbyNt0/bKiqWi4QYty52Ss+0kwJtw0
 SyyKhdf2sB6Y84UotXnKtLFNyGYzLJmjzZhHkky11p0NCkbwNZFp93m5coSH0VqG3dADLF
 BZUOg0Zu2tcRyB/IVQf3dXgXEEmk1KpQpoGJQZY6N/kQD+PjRSQO56apjl4/76dBTCJbBS
 EpbJh5oNGsZfhs2h69cn8VGrCGG888CcmECFpb4SDalUEm+SoBE908W9GT85WvVXmuhW+f
 cR/xmfdYCs3DPgGSARGY+d39q7hnglJOM2ZwzbSThGyH67xsVhd3RRoFenziXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=et9E+p7e
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-10
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

Autobuild statistics for 2023-08-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  1  |  0  |  4  |
  2023.05.x  |  1  |  2  |  0  |  3  |
    master   | 46  | 47  |  0  | 93  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 5 
        linux-headers-4.19.290 | 5 
                elfutils-0.189 | 4 
                   linux-6.4.9 | 4 
                       unknown | 3 
                  check-0.15.2 | 2 
         host-sentry-cli-2.8.0 | 2 
                     lxc-5.0.2 | 2 
              open62541-v1.3.6 | 2 
rtl8189fs-75a566a830037c7d1... | 2 
             util-linux-2.39.1 | 2 
                  cairo-1.16.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
esp-hosted-11e90f185a5a9922... | 1 
                     exim-4.96 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                     gmp-6.2.1 | 1 
              host-rust-1.71.0 | 1 
              libudfread-1.1.2 | 1 
          lttng-modules-2.13.7 | 1 
                     php-8.2.8 | 1 
                python3-3.11.4 | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/f37134bdb9fc79395c6434d30eceac7f1a0b9808 |     
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/51574d5c1511f4b81bd9ec7c2bbe8540da35dfd4 | ORPH
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/39f53fe36699f7b4167cce399519d0e89dc9ee70 | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/8c66e6133e60885f80a82fff49516f61f038aa72 | ORPH
    or1k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/dfc687b518ec266208edc25d073460d125fd5f38 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fd8155fdaf79a8b54ca5616b5e1dba79d4e0dd94 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9c9345cbc30593c7d43fd800998f52c98bcddcd0 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/33f3d4de499edd3b32416e17ce40183c35fb260f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/09d2ef3a44719e30e4c42cc68dc1d71be40ba72d | ORPH
   s390x     | esp-hosted-11e90f185a5a9922... | NOK | http://autobuild.buildroot.net/results/8a944b4161a4a0ebee6df33383d6ae3edb0d8883 |     
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/6c1f829f03df2be8a5aa6d2070028808dc8464ec |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7c5df86589af6892ff891662fa83ea493e111e35 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/0615a44fab7ceb1c01606672936122eecb5b77af | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/00e46d51f2b5f7801027b0aaeb3b15423980afb6 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/394752c425e89925db845489936d786258cea766 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/57e98943288c789e61986e664ec78f661d13f319 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fb05762366780d767f2c8778151cd97091424321 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/211fdb6dbb2bcf2d77e5bdd23d1f9ae1077c33c3 | ORPH
powerpc64le  |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/fd4b32349f48f0df01d76174259ab8eda9eea3ab |     
    i586     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/3c8a7b55e5e2f455ca09f9b3ba0987c6fd38d589 |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d3d5faa918801161e59105b1fddad825b635a42e |     
  riscv64    |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/ac5da04044a963a81295def8eb4d6f0e976e7e51 |     
   mips64    |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/d11924c76508cee15b5ae2205a4bd530b0371c1a | ORPH
   mips64    |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/2bd35d27bd696a0c3ea9bb8ae56ecf691c55dfa6 | ORPH
    mips     |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/087910cd044c6699dd7172bb49285362f53475c6 | ORPH
   mips64    |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/62f32cf9dcf38a499c845c88cd2ac60661989caf | ORPH
    arm      |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/fc0e253e3535bbc1413d150554e836d3da9e2042 | ORPH
  aarch64    |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/3b4d710735e8de47de20efdf9598e4e4fc8bb45c | ORPH
    mips     |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/0954fc0d6eadaf23b11cfab7413129da6059e8f3 | ORPH
   sh4aeb    |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/33487b186d8222c05bb61483bcc0d226f3bb48fc | ORPH
 microblaze  |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/b2fd749a68a1ac39acf5d0b0ae9c7857fff69fcd | ORPH
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/4d22c57fcfabfcc749a08f66bde95361b341ccef |     
   s390x     |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/031dd62b5d8006ce3afae61ac446d1c3f7f2bb82 |     
   armeb     |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/cdfe455eb6d188daaf8bc2389c6517b733136cf0 |     
   nios2     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/e1134863d1735c8daa4941e6e1f177b090f55ebc | ORPH
powerpc64le  |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/b732bf46c3909f66742c435b7b2326a536c941dc | ORPH
   armeb     |           php-8.2.8            | NOK | http://autobuild.buildroot.net/results/18752c925ce36c5f46f21b0f3ffb61af94bdba54 |     
   x86_64    |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/d6b7ad43524d86038054dab84609514527fba3a6 |     
   xtensa    | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/18bf94a2fa82c2c99320f87ec831ca4b750dc43a |     
  sparc64    | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/43d6c541741ee96a592c7e94f87a009c90c47479 |     
  powerpc    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/626d21070e940c2414a9a07a8fde2c057f2e2399 | ORPH
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d31d7543ccc594ae5502167f7d2d04e135e81720 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/df556f2aabe057edb9ec53fbbc3ebcb11a2adc4c |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2f5d3c345287e656852669510f4eeb711009097a |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/12687becb8fc1fb23b6223149b49c99d72131b3a |     
  powerpc    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/0f607d3550062bbd5145db9ef693905a72e545b0 | ORPH
   mipsel    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/45d4c324696cd0bd7e801a6f8472f66664839efc | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/3c01bb9f68cac08d5c65d298e2e7c0093342c979 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               nfs-utils-2.6.3 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/e12949efff9318f43da873595a8f6eb2ed4a7712 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/07a59f1a8fae88e70b476158569601895900ad65 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
