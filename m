Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCD3C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 04:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 840F18233E;
	Sat, 25 May 2024 04:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16SKyKG-yxRq; Sat, 25 May 2024 04:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7BA282BD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7BA282BD6;
	Sat, 25 May 2024 04:02:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 444D01D00FD
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 04:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3081340280
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 04:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Imrm3tRvHkzY for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 04:02:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03002400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03002400B8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03002400B8
 for <buildroot@buildroot.org>; Sat, 25 May 2024 04:02:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFBB06000A
 for <buildroot@buildroot.org>; Sat, 25 May 2024 04:02:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 04:02:31 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716609751; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DipTSN1E3zfPE747s2mAv5BZwQXYGr5GS1lZlikFlwU=;
 b=Ka235IqUi8udYXQd6L+/O58pUVqFDjHXejK46jacf4R/xhpQ+yqlM4FIefN3fY4RmNyZRc
 uIuYsSod4EmEuzy0HCA6Z8uVaNF9UPaK0zxurlDlbtl0Z5xKs6htpVWkXygrM33hO37/OG
 eTE4rQdy4krLFLaxjL4WZD7HFwBDMbx6UehAQHZLux0+gsM6ZbgodwgjerIML/ox0CSiac
 gA7STgjM2P0ptwrGmTrfw9ZOBdDIUARjfh318JHMJANhUbUfrW1NhNWOZQ9brZdKSsbpan
 /smGwCjhTylWaA4E/PAFJF9Gsp2JxLzYoIAzw4re1zmlL+XYsrqikUBAMBDbFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ka235IqU
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-24
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
Message-ID: <20240525040231.5RF3fmyXqUcR9zmzO0E6sn8FNWbNFGPFZWb4Vpb8U8o@z>

Hello,

Autobuild statistics for 2024-05-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  5  |  0  | 13  |
    master   | 30  | 45  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 3 
glibc-2.39-5-ge0910f1d3278f... | 3 
ibm-sw-tpm2-5452af422edeff7... | 3 
                libressl-3.8.4 | 3 
                    fcft-3.1.6 | 2 
                       unknown | 2 
               acpica-20240321 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                   bullet-3.25 | 1 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
                 dhcpcd-10.0.5 | 1 
                elfutils-0.189 | 1 
                    eza-0.18.8 | 1 
                     frr-8.5.4 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
  gobject-introspection-1.76.1 | 1 
               gocryptfs-2.3.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
              libgeotiff-1.7.1 | 1 
               lightning-2.2.3 | 1 
                   linux-6.8.9 | 1 
               lynx-2.8.9rel.1 | 1 
           mediastreamer-4.4.8 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.7p1 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
           python-zlmdb-22.6.1 | 1 
                 shadow-4.14.5 | 1 
                 uclibc-1.0.48 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20240321         | NOK | http://autobuild.buildroot.net/results/32f45d8566886f97684feb355b7e16151d4acf8e |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/781371a1ab9244b030bac4a0cd45cb01b0e022e1 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2c30ec75ec126b1cf089426fd12833b547953586 |     
  mips64el   |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/5b0208f176dcf75ba9672f8895946d78bb2f34a0 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4c9d0bb4fe85e22d2f93ce4fb033c5732a4189dc | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/f6763cf0ad53604da0f929add41fa26e10f66808 |     
  mips64el   |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/3ee654070c1f71d30a92690858eb77536e50cd0a |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a41797597d22a94a7db9e4d3fa7c95a4d4dcaa45 | ORPH
   x86_64    |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/104dd82afd9e80f0668cee456a5da273d29858ad |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ad3579ffc768f490c78d9f1a3284c692a4b76886 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f8d43180d7d17dc0902dd675ad5164208e6d937e |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/97376b5a95e384f430ca358035fc050ad5336088 |     
  mips64el   |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/29d58306ded327f5322208e3cc1e2b9cd425ce9b |     
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/99106320cacda9184b0263b24b500c29f611010b |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/3673a33f8ed5d0092352056d78588e885127ca7c |     
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/9a1ecf58a1cf1e53f5faa88cb41be2f7578be492 | ORPH
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/f6dbd655cbd4b9ba51e7f58c0810839c18317f5f |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/00a4dd7e683aed9a5361b50fcaa52dfa09a2d6ce |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/d1535954bd5b19045a93fd5f7bc7b11d7084fc34 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ae25620b16fce865669549b1a0135f12cb531014 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0b9d5f3972efbbe9326d112d9021f1bd85e16ab1 | ORPH
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/1e3f808ad97a88d32deb9131ead7fa8cc2a7b969 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b85f31595628408c9d405ff447077575892f8d12 | ORPH
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ec4335b63754c9e4635a0a15ac4b026a3f065d8e |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9a9734f4dcb8e46b5d74fd53b36ac0e0aebfbca6 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/81203fba1350052bafa2a475b129c5914328a052 |     
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/b5bd9296290c09c6d4acf41311a0be0863ea5a18 | ORPH
    arm      |        libgeotiff-1.7.1        | NOK | http://autobuild.buildroot.net/results/5cb66c167c5d5a1f220751c0975ddb8efbf2db1f |     
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a11ae0f9b651b386555a33b350c0f6f713c88a82 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7caefd4560aef06b1c0933ec25fba664570afff8 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/84c0e357fadabeab26e2c4faba2256cf9327fa0d | ORPH
   mips64    |        lightning-2.2.3         | NOK | http://autobuild.buildroot.net/results/c22c7f6c5164c6ff1867e54933a54ef25dfaf093 |     
  powerpc    |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/ec59167f9086626dc9f095f898b970b7eb18961e | ORPH
    or1k     |        lynx-2.8.9rel.1         | NOK | http://autobuild.buildroot.net/results/ec606d2c14b13be8bbbfcb6299b4ec3a489e5082 |     
    m68k     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/705974c84b90a8b9fb7fa1d04500e4d6ed071fda | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/a9783fddd2d171df3c042e301852a8364c689b28 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/624495dc42e751737af28a3a52bbd3592c8a8db4 | ORPH
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/2e05d50ce4233b46947f1279279b86bd11f4ba02 |     
    arm      |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/afe848c9aca376e774c8237137b9dccc18afc4ee |     
   mipsel    |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/3006c4a0cd92dfe92f43c215f9251bdfbe4d86d2 |     
 powerpc64   |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/2ef9b43fac39aada60ee140bc44c5074262d601c |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/41d43a37e6eaec99783970c35ce663da5fd87e37 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/580556a381a1c49c7cd51470e0d8060fe21d7f9d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/782e9275b97aa909d20b47fbe916597ac95645e1 |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/458bab015dae44f74e6177941e6cf07c3335ffd9 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
                    gdal-3.8.2 | 1 
          linux-5.10.162-cip24 | 1 
                       unknown | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a1e3e80c0b2aea1e7d5f9ad4a14539bf9014f389 | ORPH
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/e643c070bbe5619273d6109420bb8d90539e6de3 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b91b03a7861b85de21cc16f6774e357214c5f293 | ORPH
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/0c851d60221db24e9c27377bfede3d4260c54a8b |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/12a369af54649262478f382575a32cd563c5f7bb |     


Gitlab CI results for 2024-05-24
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688464  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688469  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688474  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688483  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688494  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688556  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688560  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688564  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688566  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688568  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688570  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688573  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688582  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688610  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688681  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688686  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688693  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688704  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688705  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688712  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688714  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688716  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688717  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688720  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688723  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688725  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688729  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688732  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688734  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688735  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688738  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688740  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688744  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688746  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688750  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688753  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688756  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688760  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688763  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688766  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688802  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688851  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688858  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688860  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688863  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688868  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688872  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688883  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688887  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688900  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688908  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688915  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688919  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688966  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688967  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688974  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688976  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689008  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689011  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689016  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689068  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689066  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689076  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689083  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689094  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689131  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689149  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689158  |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689164  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689173  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689305  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689316  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689369  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689373  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689381  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689413  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929000584  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929000642  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929000673  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929000710  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929001083  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929001403  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929001435  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929001546  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929001563  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929002011  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929002045  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929002191  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929002229  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6929002318  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
