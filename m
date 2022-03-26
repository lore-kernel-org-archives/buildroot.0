Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75A5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Mar 2022 07:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F8781A18;
	Sat, 26 Mar 2022 07:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJWR9uWZrr51; Sat, 26 Mar 2022 07:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14FFF81970;
	Sat, 26 Mar 2022 07:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76C121BF859
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 07:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7303C60C01
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 07:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQ3VjsQ17wbh for <buildroot@lists.busybox.net>;
 Sat, 26 Mar 2022 07:15:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E532660692
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 07:15:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1EAE2200010
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648278910; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d6KLPrCagNB9tN1u7zI2PDiN3k0/FGMc7JKIYQCa3TQ=;
 b=j2tzkXM3yA/Jf/CdI8YmBpipxcxW//5Y7YT9/p6ESRgxRpf2VRXwOEILjf0BzgaXpc3QDY
 2gagH5D927obYcKSDxOy6TD1QCaG/lVvpVpPxqMMOjNRnRT/qme7vZ39LxOE7AEUWPJlPI
 j9WDT1SYqPVc47ZP7v8nZicWbwPSkUpNW5L1f87r/bFYPJMW1m92AJNM5jLR3+zCNH4T53
 c9lwG18RNHTw2fwF49guAnukSy2eijje1ZABHX48JOkX8vkBSnrMTc9HS+fMQNeTpJKOXe
 4Qjok5qhYGs0J/7/YcM0dRcnjb8y1BFN9Mgt0gzezEqp1TN6WRxk6FwYDH7Y2g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 26 Mar 2022 07:15:10 -0000
Message-Id: <20220326071514.7303C60C01@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-03-25
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

Autobuild statistics for 2022-03-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 46  |  7  |  1  | 54  |
  2022.02.x  | 13  |  4  |  0  | 17  |
    master   | 64  | 27  |  0  | 91  |

Classification of failures by reason for master
-----------------------------------------------

                  pango-1.50.5 | 8 
                 dhcp-4.4.2-P1 | 5 
                       unknown | 3 
                mongodb-4.2.18 | 2 
                 wavemon-0.9.4 | 2 
                  exempi-2.6.1 | 1 
              host-delve-1.8.0 | 1 
             host-pango-1.50.5 | 1 
                      iwd-1.25 | 1 
              liquid-dsp-1.4.0 | 1 
                 mesa3d-21.3.8 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/230dc26c61f4a29cc755248285f7f938916f7649 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/86a0c2ab55fc2404b77107c403767b12042eced8 | ORPH
   s390x     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/e4df4f72e3782b712528fab4f33c0f48fc8c50e4 | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4d06e811ca90d48772a01cb83f172a1c5b7c9cfc | ORPH
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/f9d3525e4cb3706b94317e747c70741a38051fb7 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/26e51513bbbf43b949da227d97ad1ad290c6a303 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/b59458266d09a1a1e6c82428cb48170cc0c95828 |     
    arm      |       host-pango-1.50.5        | NOK | http://autobuild.buildroot.net/results/54369fff25c34e4fc01ba99943fac0b4520c93ed | ORPH
  powerpc    |            iwd-1.25            | NOK | http://autobuild.buildroot.net/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/881826b4b6c141e59a0da2d7d1ad55d3709fdb95 |     
    mips     |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/9b50c992567cc5d46dadb42ed5a72d27cd019388 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c23bb2884dfb54ec29db151bd8d6d3183de035ab |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/1211fe407e413742813c94dc2a7738ce5fd04735 |     
    arm      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/1cc8efe0895137828693f3059c22c139ff5295eb | ORPH
    arm      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/f52f6b3ed62d8a8e43b7db2c5b36c585e94adeea | ORPH
 powerpc64   |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/b18da16d29022eb27549d9aa431790259ae589d8 | ORPH
    arm      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/127875183c97e7bf70515eb1f3d2c0506200e149 | ORPH
  sparc64    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/3ff6bb98beecb72ef405563fa5341da2f140d57a | ORPH
    i586     |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/85e2aa2c8e2e490ce613da58b02ab7e8e7b0305c | ORPH
   s390x     |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/4acc36c6dc50a009bedd184cdf0343e375308dd6 | ORPH
  powerpc    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/1a78659b9f975913902c0a0d3bfc6467c9d2b0b4 | ORPH
    i686     | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/89dd546426d045c42814b0378949d958e7b1a6df |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a3f177a4e5cd93d188ae14b0cf0fa8bfaabb8474 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/d4f4e03841ae902b59a13e849ba0b679959be2f9 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/774ae837717eb4bfc333877b66fae4a207b31a06 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d8fe28ad85df5415f15409285e601c39c36f557a |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1102aa675d4b959c590f95439a9c20c253d273af |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
        glib-networking-2.66.0 | 1 
           host-nodejs-12.22.9 | 1 
                 hwloc-1.11.13 | 1 
                   python-lxml | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/ea89da41f8ac6d77775e3ae1dd52228eb682e5ff | ORPH
    arm      |      host-nodejs-12.22.9       | NOK | http://autobuild.buildroot.net/results/0f24e44353f34fea25644d97d7bc586bb386d884 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5c235348081cf917ab8b942f62bf3950ad66c105 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c644605b7356269da97156577d5f0bc4a474f0fd |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6079f06f494d970d8cdac4b7d3e7034a32738dc4 |     
microblazeel |         hwloc-1.11.13          | NOK | http://autobuild.buildroot.net/results/ddc57a897ed3b4c69c5a25dc18cb4f2fb6b82bdf |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/78c501c1499c7f093910dce4c5ddc793d0d4cb2b |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/86cc0dca02deb81354568f998b52f61f51059490 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  bind-9.16.26 | 1 
             bluez5_utils-5.63 | 1 
                 dhcp-4.4.2-P1 | 1 
                  exempi-2.6.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  nds32le    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/36293589d7bafdf29d542489240145a7a36eaa59 | ORPH
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/4aa68100c0becc4b0344fa5b5e8c39d6c784b120 |     
  riscv64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4b036e9e687490ff78383ceff4e59a6b108199e4 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/c5544a44e85fcbec25a2f45d9d175110a22bed2b |     


Gitlab CI results for 2022-03-25
================================

Detail of runtime-test failures for 2021.11.3
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/2249566655  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2249566682  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/2249566765  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2249566610  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/2249566855  | ORPH 


Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243853884  |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243853897  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243853955  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243853957  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243853958  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243853962  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243853985  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854014  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854039  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854059  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854065  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854082  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854084  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854086  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854091  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854146  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854148  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854164  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854190  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854335  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854355  | ORPH 
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854370  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854482  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854507  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854538  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854592  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2243854593  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
