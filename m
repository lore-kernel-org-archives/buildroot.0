Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2639AC25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 04:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 864D4605E2;
	Sun, 26 May 2024 04:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qLmq6kyS4FF; Sun, 26 May 2024 04:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A19605E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A19605E5;
	Sun, 26 May 2024 04:02:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9A9C1D0BBE
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 04:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4E9A40553
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 04:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVH0xOtsYEHT for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 04:02:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3836540556
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3836540556
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3836540556
 for <buildroot@buildroot.org>; Sun, 26 May 2024 04:02:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C05316000B
 for <buildroot@buildroot.org>; Sun, 26 May 2024 04:02:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 26 May 2024 04:02:40 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716696160; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1/pOnHsQrHC2xmOwmrMV5Vqd85lNECfl9WgSqjZv3kY=;
 b=d+LrICbQkYOEhMQrf34imxbMJBvfSqFYXfMSBKQWbcetY3l6mUTQf4HF9V3qVpQLPBBKKG
 QDA8Y0dlOJXGuGv+RAwH/ro3jompYNfszVNkgqruyo40vCYB9SHaHBAPs4OwhSac+D3oD0
 kKIUsSdXvkTOxSxMB8NdJt2K6VVnOrrqXiimLnew5Hr9So4yZmeo5UFBRdEIKb3zbxHIBT
 EJeHijp8Nj3pBW6Nuw2xYvA8+8nYP79hWOJgxyVjfaUDY+LRLoVP0VsjNx9bUaDv/vY1fv
 C8EuYL04cnGiK6mo92HkLiORpYkhFj/oAeVxKowGxoF8ki4r/IWVhyWC8DOn1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d+LrICbQ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-25
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
Message-ID: <20240526040240.I3qlBcTKGlJvll8NSXEYKzhm1pVOMs9ER-Z5DHgalb8@z>

Hello,

Autobuild statistics for 2024-05-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  5  |  0  |  9  |
    master   | 20  | 44  |  0  | 64  |

Classification of failures by reason for master
-----------------------------------------------

             cni-plugins-1.3.0 | 3 
                fail2ban-1.0.2 | 3 
                       unknown | 3 
                   bird-2.0.12 | 2 
                    dust-0.9.0 | 2 
                  ffmpeg-6.1.1 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
              libopenssl-3.3.0 | 2 
                   linux-6.8.9 | 2 
                    attr-2.5.2 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  boost-1.83.0 | 1 
                   botan-3.3.0 | 1 
             can-utils-2023.03 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                   exim-4.97.1 | 1 
                  fbdump-0.4.2 | 1 
                    fcft-3.1.6 | 1 
                   foot-1.16.2 | 1 
                host-go-1.22.3 | 1 
         host-libxcrypt-4.4.36 | 1 
            host-omniorb-4.3.1 | 1 
          libcamera-apps-1.2.1 | 1 
                   libcap-2.69 | 1 
               lightning-2.2.3 | 1 
           mediastreamer-4.4.8 | 1 
                  ntp-4.2.8p17 | 1 
                    proj-9.3.0 | 1 
                    rtty-8.1.0 | 1 
                sexpect-2.3.14 | 1 
                 uclibc-1.0.48 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/733a9805154d025b1dbcef5880d83061a19bc111 |     
   mips64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/55db5844e2560fff8f8b92ebce104521352611ed |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/4276244c182ae6556a61f2dba16d5809d6b6c2f2 |     
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8027c548c5ade474f0eb3b798c826acfbeb0237e |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/da272de8cf8ce461a0e7fe37af6abdc50bf085f3 |     
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/b16eef6f208e78887c301c9a92ee5a9f63134691 | ORPH
  powerpc    |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/339e5b1e6c51a1711f04a1cba4b626562abf353e |     
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dd14822ff6dc63ba60ab0d2946a2b8ae13a47bf2 | ORPH
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/478d7a34cff1aba75d16f844aa5dfe1a228f49fc |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/ca70c0769e3a6d938441b76285a6cd156b300a71 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/093d9f51bc2762a051a82e5deb498640ca8f73b6 |     
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/427b8d4c10004051ab993623b9f3cfdde8d100bd | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/d26f6c4b346a8dbca5ec426aff0493dab1079697 | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/75456cee90cea3ad3db0d607b44dff2edc5c5a42 | ORPH
   mipsel    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/aea7fa1f3aaa94bde0140067ee043dba1e45e13e |     
    sh4      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/17843ca20cbe239eac33113bda3701fe5bf781f8 |     
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5317ac3e149b893c917bf3cc0b82df958a6d9626 |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2ab68d97632db74ba847b2dd5381d127fd806667 |     
    or1k     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/eb1c3296cd090184cd789cac12c1f0669e08fe3f | ORPH
  mips64el   |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/0e6033ad5daca29a90d307be3358a540e2b0941a |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/154cbfcf611c2edd3f44f00485bfe4ff92c203be |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8f7bf6f5ebd6c7913fdf33c7f57bf143a0201d48 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/41db61c90a73f1c2bd950c989f8682ce81405789 |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/b09ffbd532470040f5748792bae8b9577d8d40a3 |     
    arm      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/5fa4feafafcf36752294cfd647d6fa4927b71521 |     
   x86_64    |       host-omniorb-4.3.1       | NOK | http://autobuild.buildroot.net/results/5a929d32ac9fbf4a5eb4680941972d53b33911bb | ORPH
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/480e3e8516626386247bc3d390ffabd8b6ae4459 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f38854473b75eef6502c97cda0b7a20082127b6c |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/501d040d1cf050bf23433132816cab6b4acf05c7 |     
 microblaze  |          libcap-2.69           | NOK | http://autobuild.buildroot.net/results/6ae7cf42826a1763bdf6ce781ed28e9c05a7d897 |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/2cb5fd34fb63332a871fee6f55557014b0f1e8ae | ORPH
 microblaze  |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/676d6d69e0d78185c6e7af76414a5da98be40ee1 | ORPH
   mips64    |        lightning-2.2.3         | NOK | http://autobuild.buildroot.net/results/6e8db235473d274798fa4b4f181ae6e18bc62229 |     
   nios2     |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/637862efa23bddbf2a37105ebb13e148d8669439 | ORPH
   mips64    |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/1fcd4e26ae9871bb2ee552dbb49ab5a739208b74 | ORPH
  mips64el   |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/3c30a570d4d1d3e03d9fdad08a621cccc1282d47 | ORPH
powerpc64le  |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/193fc77ede088463e6db6378e690db5e76a8e8ea |     
   mipsel    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/70de35a12ccaa57c48e1d68e86f2b0a547878f31 |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/964d974a8492df693f24b60d6e0887dfe8f54e6c |     
   sparc     |         sexpect-2.3.14         | NOK | http://autobuild.buildroot.net/results/06644abc47bfde582e48e7842eacd38af946ee8d |     
   xtensa    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/be014d20e9676730a4d750721e52ec212ac435b0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/16c19c52742ece95c5f106f3ae5d9369331fc2ba |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/4e0e9b604313863eabdf1efc9c5bb989f9e1b414 |     
    i486     |            unknown             | NOK | http://autobuild.buildroot.net/results/c79f942eb240f076b193b697b6571e550d2ac565 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               belle-sip-4.4.8 | 1 
          libcamera-apps-1.2.1 | 1 
                    pppd-2.5.0 | 1 
                       unknown | 1 
                 wavemon-0.9.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/3ec2cb9787cda4aab31a66fb3861aac1fc3ef8de |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/155b1d44be224d86ac44bf6a7c3b17c47752513d |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/83125596abb3d9fa14e558a15a7877f7c3740c91 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/64ea0404b571bc08fa22977612965cd2bab355a2 |     
   nios2     |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/6d8c8cc170fbdf4965e73a460116eafe3625ecd5 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
