Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0DAC4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 06:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5962403C5;
	Wed,  6 Dec 2023 06:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5962403C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZV0wfnkYKZv; Wed,  6 Dec 2023 06:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76B9404A3;
	Wed,  6 Dec 2023 06:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E76B9404A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 785961BF853
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 06:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2519E4031D
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 06:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2519E4031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1wFeSsCk_Xw for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 06:43:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B85740123
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 06:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B85740123
Received: by mail.gandi.net (Postfix) with ESMTPSA id 760FBE000B
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 06:43:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 06 Dec 2023 06:43:06 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231206064312.2519E4031D@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701844986; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5tmlUIf1ajPXMBxxdGkorRIzTG8CsdGopTqPt7PSHV4=;
 b=VsOg39bTwiYbYO2MAPZPaglM4sbCoS0jvrhYWwQXDmbCTR2YPzMVQZXrUcSwES1PK1gl8H
 IYIfDwYyf15rzFC3H2MqlQJqJDwAUNvhq5xKoxUCNgMa+cSIA/cNbT7GAF3HFTb2Y5Cl2b
 JFcJxUpkvgSn1EW/GkhyuNb16LGH89xJRFQAO2u9CKkSppLXhfmKjLgWS3L2QpCsg14r0d
 4Trlo12kF+XgJAqWiZVFkkxq5XoiOR52ZecseZxlcQjlnHJb2HmDjWQfp6S/GjKrBg0J4c
 5GzORqj+KW+iwd9zL46cj5Lcy5Sw/u+m9yMLq3AjeUY6k+Ne5fL0BdLhcaNuEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VsOg39bT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-05
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

Autobuild statistics for 2023-12-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  1  |  0  |  5  |
  2023.08.x  |  3  |  3  |  1  |  7  |
    master   | 53  | 34  |  1  | 88  |

Classification of failures by reason for master
-----------------------------------------------

              libarchive-3.7.2 | 4 
check-11970a7e112dfe243a2e6... | 2 
          cryptodev-linux-1.13 | 2 
           dmraid-1.0.0.rc16-3 | 2 
  gobject-introspection-1.76.1 | 2 
                libressl-3.8.2 | 2 
                       unknown | 2 
                     criu-3.18 | 1 
                elfutils-0.189 | 1 
                     frr-8.4.2 | 1 
                 gnuplot-5.4.9 | 1 
         gobject-introspection | 1 
                 highway-1.0.3 | 1 
         host-gcc-final-12.3.0 | 1 
              host-rust-1.71.1 | 1 
              hyperfine-1.14.0 | 1 
                libselinux-3.5 | 1 
                   linux-6.6.3 | 1 
 Makefile:727: target-finalize | 1 
                memtest86-6.20 | 1 
                    ngrep-1.47 | 1 
        python-pysensors-0.0.4 | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.12.7 | 1 
                 wolfssl-5.6.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/49ac4295fdbf290f8a5f3f5b0a78fde88b7e585d | ORPH
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/94939bc1ad07c3b00a78c1d78d0529af1ce068b1 | ORPH
 aarch64_be  |           criu-3.18            | NOK | http://autobuild.buildroot.net/results/e76aa96ca37c1c812387a93294e706438192dc98 |     
powerpc64le  |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/ecd91db830ebe9017783cfa71901c9b22db01776 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/2ad6f811bbddbd620ef06e42886394159375f8dd | ORPH
   sh4eb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/524092466c1930dd1f2b9637a05e12d74d22d499 | ORPH
  powerpc    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/6ad7bfa6bfe8ff07f8a57674171df1266c855f37 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8eb425d9d555472084096eca1a8f58dd5405f1d9 | ORPH
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/c524f9be7a69e9795abc71e9a7cf33b22afd35a9 |     
   arceb     |         gnuplot-5.4.9          | NOK | http://autobuild.buildroot.net/results/4df947e93cf3aa3f510be19d909407076899e50a |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/579881e58186e2674fc26a3e9470ef5c8ed36f90 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ac20af2e71cfc0466205063d9b78a1624aeda005 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c8941c0a8e3b2bae0021700e3aab820d0dd8378f | ORPH
 aarch64_be  |         highway-1.0.3          | NOK | http://autobuild.buildroot.net/results/212e872a13b906415e07501a08368a783aa9c672 |     
   arceb     |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/cce2a23b83caf8b8bf060a475e45892952872a43 |     
  mips64el   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/27f3d1ad1045f5566dbd12480b49608b76460de5 |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/d59f2aaa13c20898341311847bd255d2794214e8 | ORPH
    or1k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/bd597b0dc123bd104fa2bdeb27c156debae66bdc |     
    arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/6df6a067f0034a29da1b41bdd2353b3b2d5fd710 |     
microblazeel |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ba7c30f08b13075b6ba2841e71af66f025884499 |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/33658814a935388362fba6148b0ba2a19eab363c |     
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/300877a37798e85e5bcd362cfb10994ef701b1e5 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/140a7a60b853cd6600e0c24def4d0459491afd16 | ORPH
    sh4a     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/53f6332e0e1c3b3590e83467fe521ad9799a00a3 |     
  mips64el   |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/6ca21e30e294a330ec84c0ccde4b0c777dad8da4 | ORPH
    arm      | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/22cd642e11a5c9a0e04971bfaccf8ea30dbe4c37 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/15ece19703bb21c1326ff353aa79f3550a01f648 |     
   mips64    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/fb5fda261c9aae598a8765f3d0cee7190885e7a2 |     
powerpc64le  |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/54e54814cf727d6a967fe4e732b6e2fb0d0e0783 |     
 aarch64_be  |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/34765fc46e41c0e81ae7fa50d14ad2a9cc7393f0 | ORPH
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/33bb7eb6130e884ee06c8767744c07157dc34100 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/8431ab7d44bbd6b104d961745e1b35e1cdd8ec8a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2b389f2e19183dca1d61f42ae9aa09461765c866 |     
 powerpc64   |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/dcbac65b0604ddea6a74f1e4061147da86fbcac7 |     
  mips64el   |         wolfssl-5.6.4          | NOK | http://autobuild.buildroot.net/results/e92cdf5b89ac5fbe747116361ad2e28540e485de |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                    php-8.2.12 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/e3a927086d234a6d6db1ab53660a62fa896c0ea2 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 2 
         gobject-introspection | 1 
                  kexec-2.0.26 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/65eb9688ae12fbf692e17b5af85ed61b15ceb5f4 |     
    arm      |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/be76cf20cd4396c7c98e5cb1fb6077302fcd7c2a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d0f0677795301022953c6738de49a2ef454aaf68 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/b60c0c7d7b327dfa9b6d36f2fae4ba41d50cc2cb |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
