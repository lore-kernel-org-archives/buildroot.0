Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB18C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 06:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A4C8216A;
	Sun, 24 Dec 2023 06:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A4C8216A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4MgosQQbF5g; Sun, 24 Dec 2023 06:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A238A82162;
	Sun, 24 Dec 2023 06:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A238A82162
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1883C1BF2CA
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 06:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2891417CE
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 06:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2891417CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TS1Vd5HPDClA for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 06:40:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C159341708
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 06:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C159341708
Received: by mail.gandi.net (Postfix) with ESMTPSA id 002CA240006
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 06:40:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 06:40:10 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231224064015.A2891417CE@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703400011; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PtLIsiBtq5e288evDnjaerJ0a8MvQZOQaLKnCsC8hyM=;
 b=hDI14EniV35buGI/P/jLWEXlZr0h2vTi0w439TWLC11EU2K/MnySnasWNddgCcLyucWoDg
 OsoZY1akooPxSCaNI8BiMQqbGlWlrenGmIpVt4YtlKv2wyN+3S7evdbs121Fg7IgjEtOv0
 DCqwJFMl9xGGSZRLpB5tfW1geWiAfL6KKeIpGY4a9/yW4Gzy2Trq+j8B++JxRpfpt0CqTq
 lhhmfhgDPyP1oyLxfpQQ0S9A8s7DfLEdkY/S9RTGViP0RcZzYIt8c+Gveq2hyAb0eCKPkT
 mWyiseg1Zxx8b86/MFW8MOyydTa/oQkG8gdYPzZqtYwWx65Cz7re3tYpq9wWZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hDI14Eni
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-23
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

Autobuild statistics for 2023-12-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  3  |  0  |  6  |
  2023.08.x  |  4  |  1  |  0  |  5  |
    master   | 14  | 20  |  0  | 34  |

Classification of failures by reason for master
-----------------------------------------------

                     exim-4.97 | 4 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.71.1 | 2 
                     criu-3.19 | 1 
                elfutils-0.189 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
google-breakpad-c85eb4a59b6... | 1 
                host-go-1.21.5 | 1 
     host-moby-buildkit-0.11.6 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
              iputils-20231222 | 1 
              libostree-2023.8 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-6.6.7 | 1 
               owl-linux-1.0.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           criu-3.19            | NOK | http://autobuild.buildroot.net/results/bc124d9841923b5bcfa8105294ada768884b1980 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fd6d0014072abbd174f38a764b6d66ee3e6e1798 | ORPH
  sparc64    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/fb61fa9a7783928820ac5b7f41f42ded9d0e2e3b |     
    mips     |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/5c84a3eaa9aa96b7f6e5e410ea58826dd7802c6e |     
   mips64    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/3e23bcc87e80392d81a32518b984ae8877b7ccae |     
microblazeel |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/d3f5ffdf399a5669dcadb215bb13a7f57e6aed3d |     
 aarch64_be  | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/069f70f088cbfcd72c6876b9e31176872152f6d0 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b141e42cc73b5cbe3592ac94ca8910978260b632 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4e214d847df4836969c7c5f058881cc235cb3ee5 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/73f17ec308b6fd20dabdb7e391a3f67793a14d5b |     
powerpc64le  |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/554369519a4c7368e6207323fecb0edbb1bedcdd |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/27c41107d40470b7929fd26cd263768893d0a3c0 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/78dab77b5fdd62fecbbf9206acae566f5952bee4 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8970fc9d84a92e3839001d04efb51c1ba983a09a |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/62c8a13b4c3f307a660708f49198759c782e0b22 |     
   arceb     |        iputils-20231222        | NOK | http://autobuild.buildroot.net/results/347073c014ed2100d6b3a04496acca890d1f60a5 |     
   nios2     |        libostree-2023.8        | NOK | http://autobuild.buildroot.net/results/25d9d4f256861628ddd8e8ce659a39655d27b457 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/4578835ac16de414cfb6758c67515c0ab1cab654 | ORPH
   mips64    |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/d89ea1475a7750e070023f01ad2f5cb08c30acb3 | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | http://autobuild.buildroot.net/results/b37a5f7f3ef8c46d5406d85575f8704ad2c60cc0 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 2 
               gupnp-av-0.14.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/b9aa595ba1bb0f45e940f683200b54723546031a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/6488b53f94e3a640858a0aede1c0fa1eead31045 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/00722415004e0a6a6ea07fc33808cfcc904550fb |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                  linux-6.4.16 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/0b4c31773e3ac6e06213313db95057460d0b73d0 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
