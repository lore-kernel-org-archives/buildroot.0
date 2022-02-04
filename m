Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 06:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50ACB84060;
	Fri,  4 Feb 2022 06:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jSgvlHSc48s; Fri,  4 Feb 2022 06:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 512FF84044;
	Fri,  4 Feb 2022 06:57:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3F4B1BF3BE
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 06:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE184401FB
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 06:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klOIsDXc3O5E for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 06:57:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9B3D400A4
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 06:57:16 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C03F8E000F
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 06:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643957833; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IpBwy6jO4LtwAtEqMjVQ0MaNC4ketAPeH/q2vCMjTas=;
 b=DIh3tpy2daUxjQD/or+ENdf0YTyHs6gTbvVgQg/EZprpTTPVCQoJDZbD/YSWt01oXlnXrg
 Vsy1YQU4iSm2OZQiEB4GIzFKIlcUPoBnw7g5yO0yhSCP0PmjRx09Ov3LiKl0Pa3aGqkaNN
 B9u+6VHmXJbRHonMX9nKn176j0kl+lA1nK0L+QQ2srfqmy3PwBiUYOjvOnGCJES7wHDVuB
 5A0kJ8/2w7eaj6WbUEBp6jtGYc4fal+CpXQyuSVLSRP49FXKcmSWzF5d7MPvq1icd+yOwv
 UUEw26A2Du/u9cQ9jAQDLNP+vBlCaCldUQPWZSROcAN4UZgRa7OzYaakn7sfFw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 04 Feb 2022 06:57:13 -0000
Message-Id: <20220204065718.DE184401FB@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-03
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

Autobuild statistics for 2022-02-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 58  |  6  |  0  | 64  |
  2021.11.x  | 22  |  1  |  0  | 23  |
    master   | 66  | 55  |  0  | 121 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 10
          python-aiohttp-3.8.1 | 8 
                 i2c-tools-4.3 | 7 
                libselinux-3.3 | 5 
                   guile-3.0.7 | 3 
   host-python-docutils-0.15.2 | 2 
python-argon2-cffi-bindings... | 2 
                  rygel-0.40.2 | 2 
               apcupsd-3.14.14 | 1 
                    bat-0.18.3 | 1 
             bluez5_utils-5.63 | 1 
              libblockdev-2.25 | 1 
                libglvnd-1.3.2 | 1 
               mongrel2-1.13.0 | 1 
                 opencv4-4.5.5 | 1 
                   perl-5.34.0 | 1 
               pulseview-0.4.2 | 1 
           python-augeas-1.1.0 | 1 
           python-brotli-1.0.9 | 1 
          python-bsdiff4-1.2.1 | 1 
         python-cchardet-2.1.7 | 1 
        python-docutils-0.15.2 | 1 
         python-pydantic-1.8.2 | 1 
             util-linux-2.37.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0543be638c356109539f574137439577c8aa834b |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/a1bf3226bc95574bd7c7d5aa4014e86b103f3343 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/cc2b5c51742119458011c396474b61da6a601630 |     
  riscv32    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/c1df00e611fe41d9d55b326dee84036a74f40f05 | ORPH
  sparc64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/41ffaedf8d52332fda2b6f8a6cec227858dfeb07 | ORPH
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/7ffb21d95eb91040ca0f243969aaa90e42655bae | ORPH
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/710590c1e7e0ca062c6f684c288fcd92918aa2ec |     
  aarch64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/63e8ef18976295566b7677de7fbf58e6f1182d50 |     
  sparc64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/99c24216636cff241ee8248ff38adf5d48c97bb6 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/59a95285ad56a1dfc944412eb43af8b75e27cee8 |     
   mipsel    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/39dd8b703bf14c5014764dd70b907dd29737065c |     
  riscv32    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/50397f9a1f637f0f8fe53e691798de7d2a49469e |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/49003a72bc4c52160122ae3e80f6cbd66a17a144 |     
  aarch64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/ee5eb3bf2525968fd957f02b6013abcb5138f3af |     
  aarch64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/5c54193986933fccab3858781beb635a6a970945 |     
  sparc64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/09589fdcc4994155d2138c52075c7a05fe2bdabc |     
  powerpc    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/f24e332688cb1118c8d28343f424d0ce1c78f7a8 |     
    m68k     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/0e28933572a037d94af7df7499935b93adec70aa |     
    or1k     |         i2c-tools-4.3          | NOK | http://autobuild.buildroot.net/results/4de907565a65693a6252c504510b541d8f2af496 |     
  mips64el   |         i2c-tools-4.3          | NOK | http://autobuild.buildroot.net/results/40cff94b5c912067b131a3f68452d29417c1f9da |     
    arc      |         i2c-tools-4.3          | NOK | http://autobuild.buildroot.net/results/ec5838614ee2efcdc94615e7ada3581be40b1a87 |     
    arc      |         i2c-tools-4.3          | NOK | http://autobuild.buildroot.net/results/aeba166da336ad0e60cb28f27d4468e1ceecddad |     
   nios2     |         i2c-tools-4.3          | NOK | http://autobuild.buildroot.net/results/b9794e514abcc5c1b1711aa09bd5e5d5469dcacb |     
  riscv64    |         i2c-tools-4.3          | NOK | http://autobuild.buildroot.net/results/c7c6c7a45d556fd7fe1909c7312dbc94de2509d9 |     
    m68k     |         i2c-tools-4.3          | NOK | http://autobuild.buildroot.net/results/a6501743e68406e0969eca510c5c978c9a299b01 |     
  riscv64    |        libblockdev-2.25        | NOK | http://autobuild.buildroot.net/results/e4b12c5abb38c0c35d76c12af676c94cb74bdc06 | ORPH
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/28283b5c035ab7860e274ac9eeed8c65d5541618 | ORPH
  powerpc    |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/1192a9b95367dafaecb96d11bdfbe2661db30a08 |     
    mips     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/4e8c9f388dec36a7737a235f9aa9dc01734bff5e |     
   mipsel    |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/c87d018e16f186e4afe50fec12aa767a08ef7bb9 |     
 powerpc64   |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/a2f8b6ed6348a76b8597edc2ed181bfdfd990fdc |     
    m68k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/4ec36f0b91630377ca8c057de1ea5ec151c0d05e |     
  mips64el   |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/8fcf9e650e7ba15c6ae8c4b08d52a89c87117574 |     
  powerpc    |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/1aabbec245cb7a8d144190c803bccec52a0277eb |     
  powerpc    |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/edb8ef198a5755802c6c32408833096b59d0bbbd |     
  aarch64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/78364c6f7950fea1a765c3d5654fca62116aa15e |     
    arc      |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/8f6edf4f6ecd2fd1f1dc16312ba70bf85c774d9c |     
   nios2     |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/bf03a028b650e5a166a816936eaa994c37776646 |     
 powerpc64   |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/d85b00cf7847486950b1faddfe2ca78aa759be72 |     
    arc      |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/982259958e7dcfffbecf2d184d383f9b4f7a6f14 |     
    sh4      |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/ee1b2a45d704a3e46ac5da8ddff3261af46b666f |     
    arm      |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/a9d4292b755deebecc17117385492262caf9e456 |     
  powerpc    |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/edb212f98d3d3bace75bad814288f84220d00aa7 |     
    arm      |      python-aiohttp-3.8.1      | NOK | http://autobuild.buildroot.net/results/c8fca3c380befb6e55c65a2942c7dc65522c94a9 |     
    arm      | python-argon2-cffi-bindings... | NOK | http://autobuild.buildroot.net/results/83b2551452a04a701e013dfad5cbd901c569d032 |     
    arm      | python-argon2-cffi-bindings... | NOK | http://autobuild.buildroot.net/results/2b270c75d07ae4a9985bd4b8ee9b3bb3d865d9df |     
   xtensa    |      python-augeas-1.1.0       | NOK | http://autobuild.buildroot.net/results/82847ea138cbd6901755c96da884e5fa5b034c83 |     
    i686     |      python-brotli-1.0.9       | NOK | http://autobuild.buildroot.net/results/9eec4ac69e651d85b6a63c32ba0b65d24301a885 |     
    i586     |      python-bsdiff4-1.2.1      | NOK | http://autobuild.buildroot.net/results/f5cc863dc47328e501961a7451d296dbcd7470bb |     
   mipsel    |     python-cchardet-2.1.7      | NOK | http://autobuild.buildroot.net/results/83df94d1e1dd67e5394bcffa26653841582de772 |     
   s390x     |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/11d901c18f1941cccb7195e9bd1f9c04ee9ec2fd |     
  sparc64    |     python-pydantic-1.8.2      | NOK | http://autobuild.buildroot.net/results/b51f5ceea663d39ee26256a60239192eabc9dddb |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/83ca6359def05e543f91f129f6c446d611e27df3 |     
    sh4      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9d3c41a4e4ba43e25226fb2293543de505189d23 |     
    arc      |       util-linux-2.37.3        | NOK | http://autobuild.buildroot.net/results/dcc94d8ee57e2d7c26b5202ce858350fe7593b9d | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/73066150cb054431ff115060f1699d4b8b180241 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4ca648754fbf09b3cc87ca951639821e3b0bf738 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5e6da7fdf89ba18b48e6b8e31a4e1750594cebfb |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2c4832b524333579598eb9ec79995ca61878621c | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/02cadf1bfe3eb779f26d37104569d02e504bb60f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a070424be878048f4ccc958906f58fa5ab1995a5 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/2589adecb9bfa3dd4f5aed4ca40f1f4ee5ed463d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
