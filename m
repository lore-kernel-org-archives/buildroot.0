Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CDEC4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 06:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEDCA41929;
	Sun, 12 Nov 2023 06:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEDCA41929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dn90AIOLYijs; Sun, 12 Nov 2023 06:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AE844192D;
	Sun, 12 Nov 2023 06:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE844192D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF0771BF422
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 06:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A14882287
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 06:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A14882287
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmqKJ4l50vcI for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 06:40:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45D4482273
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 06:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45D4482273
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A485C000B
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 06:40:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 06:40:31 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231112064036.9A14882287@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1699771231; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ntSewKNJGq0kqCSuX2EqMTqx5Qu5pn21aqMv+0yc7js=;
 b=NjVruv7lAhyKG8q6lfHXaS150yhybxxTxIw3sYjs05sRi7kOEfKyJ/wLlsEyry9wKxOs9F
 5yTZSAN9SKDFMGstIatyOjDyfvIkoPhuswEqCt1K3qcnVGl4qN57UWNQzyEvhFhuwkzhsv
 AwGXFZZUu+H+XRKjYu8dRvPSRLL/zhIOF77yXRh9bY6iorRzIFQU4bpaoodxn/NsSV2ffO
 UMmtqRE1il69Yyefkiu8t+QVwpZU35sTctx9c+CcgG18i4uhU9zaOuj7qGwvzOmjKPiQnf
 kaKrWl+BXz6zxidLIxgv9d0LvYk9SQJP0t0VBZ1pvb/acB1GLj/qPacpernarA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NjVruv7l
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-11
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

Autobuild statistics for 2023-11-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 14  |  9  |  0  | 23  |
  2023.08.x  | 11  |  8  |  1  | 20  |
    master   | 52  | 57  |  2  | 111 |

Classification of failures by reason for master
-----------------------------------------------

                   bird-2.0.12 | 6 
          python-msgpack-1.0.7 | 6 
                       unknown | 3 
                elfutils-0.189 | 2 
              gcc-final-12.3.0 | 2 
glibc-2.38-27-g750a45a78390... | 2 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
          libcamera-apps-1.3.0 | 2 
                libressl-3.8.2 | 2 
                libselinux-3.5 | 2 
        python-pysensors-0.0.4 | 2 
                 c-icap-0.5.10 | 1 
                 coreutils-9.3 | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 erlang-26.0.2 | 1 
       freeradius-server-3.2.3 | 1 
              gcc-final-11.4.0 | 1 
                      gdb-12.1 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
              libostree-2023.7 | 1 
          linux-5.10.162-cip24 | 1 
                     linux-6.6 | 1 
                   ltris-1.2.7 | 1 
          lttng-modules-2.13.7 | 1 
 Makefile:727: target-finalize | 1 
               mariadb-10.11.4 | 1 
                nushell-0.85.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                  reaver-1.6.6 | 1 
             s390-tools-2.29.0 | 1 
                     squid-6.3 | 1 
                 systemd-254.5 | 1 
             util-linux-2.39.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ff35bcbd7f59cc02fd81e546d50e0f875e7a858a |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9bec21201ecd59a8e1fa684158ed07b4449a8c68 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2e7d9c13dfede18968dad1798749a39484b4972e |     
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/06bed5a349a91e6ae8d4dd6a4d2af5c480af4cc6 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/70263018404453a766ad39b4a3fd5268bf71fd8e |     
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7c8888fc449376bb5540b87138f44de12e2afca7 |     
    m68k     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/5dac28b8fdc1777f85626312f1c55beaf9392dd9 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/0d0db751c24a3a3f377b77c7c018aa57d047841a | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d231fb49fda84e95ff39f1d427d08b56a5e59472 | ORPH
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2c2eea7d3d8e14b316ef08505abcdba580459499 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/874147010dcf37ff3c5a35443f3426bb260a2930 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b36874ba31f927a6a12d3ffe219c21dee12c7bb6 | ORPH
   x86_64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/8d39ac32ddecaa7ef4532c6383db0271ac6aa7a0 |     
   mipsel    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/0b8a5939118d79317f30d3a0035ce04558bffaae |     
    or1k     |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/835d4e29b633e2e5ed698089e7beaae62c927a5e |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/1ec66d3fd3992f3d6cd2a64fe018c7ef4af403bc |     
    or1k     |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/b50197db4b0e55f530fa4596f686feb6dd043f5c |     
    i686     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/bdad4df9d15735857b194f831bf3d9a638cc41a8 | ORPH
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/a50245b01d417de015e4637d2acd9a1233d83fa4 |     
    arc      | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/2308584d43ab28bb467cb8159e235adf04f8b6bc |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c45991f1467dc19d3591fd77d6a083fe2be907d6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/cd4706e87c5cf4fd4f0430f7bbe0ac5330282f74 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ed648290be609131761295e64009cc30abcc9a36 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/82bbcda8d4f6b811b5da7ddf649b860edeab5ff6 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/102f3c05f0f87b8de89cec46fd6d4d6386ba4c8f |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ebb6831b36648d634a704bf37955eecf306e1acf |     
   x86_64    |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/f9111b3d6129c844888a858ea05140abcebba692 |     
 aarch64_be  |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/f7e26dbd3207adb8f539e4b866ea60a20a444838 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8a3a86bda6156da72a6a69ca2c90ad9266b1e975 |     
   sparc     |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/e3f9918102d6a99c9dbedb4dd8808747ef529389 |     
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7baf18fa17bf7c5f6b78db6a5f5f1f91eed8d875 | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3a076fafec28d89a51acd4ccf5466aef1078d9e0 | ORPH
  powerpc    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/91320da4b248233ee99afdd453c0f83e29b480bf |     
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/1dc08f6f0fda7dee0904a3b5519d257b84191fce |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/087fe7998562589b7111853bb1d88608c289a0d0 | ORPH
  mips64el   |           linux-6.6            | NOK | http://autobuild.buildroot.net/results/3e7cd79a7b849a5e5269cdb36d549b0be54c5cd9 | ORPH
microblazeel |          ltris-1.2.7           | NOK | http://autobuild.buildroot.net/results/789fff41b43300dcf13a9ec04f36b46c161dfc84 |     
    or1k     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/82f9dccca20aa45be950c09452a134d0de224e26 |     
  aarch64    | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/9e0b2d85fbc6c3683dd4da9e2d62c8502a8636cd |     
   sh4eb     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/f7e856f733edcda3ca06fc0ff2eee5a6bcc3469f | ORPH
    mips     |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/cef92247eff7b311e7e9a094615a816bdce5e591 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/67ffb3c9603d200f1530b7aae6872c103a313746 |     
  mips64el   |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/bda0354c9364d86d56ed06b2c6445858fdd69911 |     
 aarch64_be  |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/49df334d0224e850fb98673d24373a11f7b21d13 |     
   x86_64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/898a9aff2e36ea07ca5f9797d5fdb4bb76b6694b |     
   x86_64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/90cf264f71f43345eb5862ab877adced670c97ee |     
   arceb     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/4f5f2c2fda7a968ae556a78f594dc1c3776579e7 |     
    mips     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/119b841866982007b672fc341c180a5a481b772d |     
  sparc64    |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/c77c402ca9d4194a08c03bf6aea35fa3c1f091c7 |     
   mipsel    |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/0d9275529093c72a8ced29aff31ed32cf7ddf2bd |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/6385428033810019b9520f218518398ac50c629f |     
   s390x     |       s390-tools-2.29.0        | NOK | http://autobuild.buildroot.net/results/22035cb4d8e251f9930a7d529b91b128919252bb |     
   x86_64    |           squid-6.3            | NOK | http://autobuild.buildroot.net/results/a39d4d22fadea1adbcfc692dee0a8e030530693e | ORPH
   nios2     |         systemd-254.5          | NOK | http://autobuild.buildroot.net/results/90fa209e4dd2f42d5011e54a36c61eae25ef38df |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f51a4e424dea118f4f022735564c0b6b6ef553d3 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/5796123cd26dd0996643b94dc766be4e496d4d2a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/278da7547a79f7106a31837817c5c2bcd7d7afb7 |     
    mips     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/d62ba2b5a13d32edad58d2935794411e8133b3a8 | ORPH
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d0f810ac192b9bf4e3ad34a2efd88daa234102f3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               openblas-0.3.21 | 2 
android-tools-4.2.2+git2013... | 1 
              host-rust-1.67.1 | 1 
               libglib2-2.72.3 | 1 
                 libnss-3.88.1 | 1 
                  linux-6.1.61 | 1 
              liquid-dsp-1.4.0 | 1 
             s390-tools-2.26.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/35658ffb2ec1ef5374317390ff4d5580cc5aae7d |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/505a0250dd77615fb007670c4b6dfec28bcbc02a |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/11fbef6208a72b804c52f1b7c60febad9648400a |     
   mipsel    |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/87fb4d5f1f182672b184fe93e30272b4ff902181 |     
   x86_64    |          linux-6.1.61          | NOK | http://autobuild.buildroot.net/results/222dacb872dfc8326690eb55e870962aeb799ef8 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/7691b7286c48d9816930f9e51c3158f09bb8f2b5 |     
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/57ba6773eaf81555a981279710675a6262825af4 |     
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/d21b8f2a70eab7fced7d4d2dd1b7289703853ef9 |     
   s390x     |       s390-tools-2.26.0        | NOK | http://autobuild.buildroot.net/results/ffd66395c1c633889f702ed970cf67b9fe88776e |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

             cni-plugins-1.3.0 | 1 
         gobject-introspection | 1 
               host-go-1.20.10 | 1 
              host-rust-1.71.1 | 1 
         host-sentry-cli-2.8.0 | 1 
                  linux-6.4.16 | 1 
                    putty-0.78 | 1 
               tcf-agent-1.7.0 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/a76e572138d87055754dd3e8aae6a7518c1ede24 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0450128facbf93c9c34fdbc0ad9dc3747d2048d9 |     
  powerpc    |        host-go-1.20.10         | NOK | http://autobuild.buildroot.net/results/e2ceab5b9a671f78a756a7a45594ac80d55c07f6 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ffaa0f6bbef11a3ad36ced34b0d8d85323768e98 |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/1f66835c506ebba38eb5e341ced1a1572842bc02 |     
   s390x     |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/9271dee750fdfe78bfb1998cc9792512e74e125d | ORPH
    arc      |           putty-0.78           | NOK | http://autobuild.buildroot.net/results/69c83e1589e67f6108f55e5115eddc4f6b08c517 |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/3cbb543700691d34f06c2fbf0f10c32f2395e4f3 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/9cfc3eef42ade7af299501630e17bfc0718aaeb2 |     


Gitlab CI results for 2023-11-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929720  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929721  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929722  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929724  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929726  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929729  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/5515054029  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929903  | ORPH 
...erlayfsVarBackingFstab | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929805  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929925  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929948  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929927  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464929950  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930066  | ORPH 
  TestNodeJSModuleHostBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930067  | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930068  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930075  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930142  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930143  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930231  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930182  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930187  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930193  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930207  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930222  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930224  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930235  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930242  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930246  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930254  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930259  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930264  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930269  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930298  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930316  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930318  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5464930322  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
