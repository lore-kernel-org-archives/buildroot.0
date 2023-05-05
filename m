Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82A5C77B75
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 05:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C35E41F79;
	Fri,  5 May 2023 05:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C35E41F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0H0-e4eu3BQa; Fri,  5 May 2023 05:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37F3341F7C;
	Fri,  5 May 2023 05:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F3341F7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDF3D1BF39D
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 05:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFBC760BDB
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 05:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFBC760BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y8g6ESX3Xee for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 05:32:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C01660AF6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C01660AF6
 for <buildroot@buildroot.org>; Fri,  5 May 2023 05:32:52 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7FA9124000C
 for <buildroot@buildroot.org>; Fri,  5 May 2023 05:32:50 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 05 May 2023 05:32:50 -0000
Message-Id: <20230505053254.BFBC760BDB@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683264770; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pjwLzzFViQ29ToL9qm3UjIz2qSMUrMK6/Tg/fQbybGY=;
 b=ozf24sfWh3N7RBpPnzUso202uvtcTjGX5jxgZP6bDTZCIQW8ngnBF45X15kqtv14dfORtv
 R9aJR8d6ff9SUgxcoRe1tAJJoORNk/pv5mWbdclDuywOCKqeRDKQSQBSXykp6jMVRBb1XD
 Yn6htwwQ3G6N/kh9Kqn2UI4W+iQhRrd4/cJOJnUd6wxWZiR/YDohI7Ge5MVWrhbTT/VJ69
 753aP3nLM2HQrXOT+wTAaPhIAMtG5Tr37Ke9skGKeqBEU+78VXduma31RuQtcDiJkrv/32
 fcvu+8Yi7hIpGVZIerjSsRPdaRWFtfMWQVGFWVh9BVU5xd106VmJag8gcTLEog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ozf24sfW
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-04
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

Autobuild statistics for 2023-05-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  3  |  0  |  6  |
    master   | 17  | 31  |  0  | 48  |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 4 
         host-gcc-final-10.4.0 | 3 
              host-rust-1.68.2 | 3 
                 agentpp-4.6.0 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
                host-go-1.19.9 | 2 
                   duma-2.5.15 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
                       kmod-30 | 1 
               libbytesize-2.7 | 1 
               libglib2-2.76.1 | 1 
                   libnss-3.89 | 1 
                  linux-6.1.26 | 1 
                     php-8.2.5 | 1 
                python3-3.11.2 | 1 
            quickjs-2021-03-27 | 1 
                    sdl-1.2.15 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/55c450eddd39eeb3deb342713970348cd1a3ef85 |     
   mips64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/4ce9c12c44c724e7ef3e653b75e47dd05cf35f70 |     
   mips64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/dc5a08067323487292c6f3027db64b68c4f0626c | ORPH
   nios2     | fs/axfs/axfs.mk:32: /home/b... | NOK | http://autobuild.buildroot.net/results/e4adc5f4bac377e4b351df70c3bd32524169cd07 |     
    or1k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d65705ab935f05855c063d741902b81b16626c98 |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e238fc96b23c44b1e8c33ca28b7a0bcc2d290443 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/90e8f1d5e3cd497131d2ef702889c745c8ee665f |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bf201f0419662be0b6617f965dd66909379f9fa9 |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/62f7eaaf63c3455d19ddb38d063775c0d6bf14a2 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/1268316324ac2501aba71c4837fac18f48c10541 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/76feb1ac798e62b28dd6a0fbb3d3ce01cc1bddc2 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/85f4f9b2ff346a090db5d9508ad13d683ea39219 |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/e6a09e0cc2456d9b2be8a4bcd107cd4896f54ff5 |     
    i686     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/7252c38640cdface61919ad79c53778ba96a34b3 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4e9cfb1c83a885c77777132bd6c7d0a42c10986b |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2ffeadbaf5a73f7f8cfd283a088ed621530913ca |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/11b946ee4f93aadf3c6a7a2c64fa2a8338371a33 |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/530df1ff797fb400126ead086eb89fe903fef1fc |     
 powerpc64   |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/15c803b3ff364d06478b95e0a3250908dbea6919 |     
    arm      |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/3582e1f0c04046b5e296e4efe1ed93278119f374 |     
   mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/4f43f2bc660e771e54639425368a8075125f4fb4 |     
    arm      |            kmod-30             | NOK | http://autobuild.buildroot.net/results/5d05847e789e8f74265555f140b1763b34cdf9aa |     
   arceb     |        libbytesize-2.7         | NOK | http://autobuild.buildroot.net/results/713ab548e7b124c72c2922e8b7bd2e5d099cde4d | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d6aa28d68f8daa26c64e2f151e9a5fe3ca568692 |     
   mips64    |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/a2c6ca2f21fbba1f79e09c9daf7a45515b83c732 |     
  riscv32    |          linux-6.1.26          | NOK | http://autobuild.buildroot.net/results/e8811a4b453a8f73db0ca4c9cbca56c52b414d17 | ORPH
   x86_64    |           php-8.2.5            | NOK | http://autobuild.buildroot.net/results/e871d3cca7173f1c6918bcdae0eaaaf6916d5977 |     
   x86_64    |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/d3bca8426a5d05a2dbdcdcbdcac9cd87f6f1ef43 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/c307a1b67142405f81c9276056b28bea366f2ccf |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/a963b16163e51e1a9d8176351827c6202a0f48b2 | ORPH
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/170c68f7e8f705280c0533053bdf8d0a91305e77 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                    crun-1.7.2 | 1 
         host-gcc-final-10.4.0 | 1 
   libtorrent-rasterbar-1.2.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/03a767e59fcf7d13daa7a458fd587ccaf89cbdf1 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/f80503140927dc123d4690f696567b9db110f0c4 |     
   x86_64    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/ce93dd6d4cc0d7e7126bc64caf9130e6660fbb32 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
