Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD74EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 05:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88D54402F2;
	Tue,  1 Aug 2023 05:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88D54402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7Obmc9vSScf; Tue,  1 Aug 2023 05:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB4C440289;
	Tue,  1 Aug 2023 05:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB4C440289
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C69B1BF33F
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 05:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA2C14085D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 05:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA2C14085D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rP_-Y_arX_2 for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 05:36:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75DD540544
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 05:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75DD540544
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78C7F1C000B
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 05:36:24 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 01 Aug 2023 05:36:24 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230801053629.DA2C14085D@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1690868184; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1NMWe7R+y7wsmhW8AxuHOmzhNkcNqnO3kS+/GNTx76I=;
 b=CDTOrARqLYZz/tJFrfFUspIyVpNJpSP08osvoopfQNVHjhWPLgws5B2hfEEXiew22JQ9cM
 ZrrYStHSMw4CiudI3Aun5SKkDijqB44z5JwnRNM1XzGYz5CCfl+6z2VSE7WiRVqMW1J6yF
 pM/5nPLqLFK4j4e0wYzj4ZY8Lg8TQqICZueuVV541kQhgBCcZ/vDX9DhAl1olM64ild5hs
 3OtW/rT68eEcjuwgVzd3wPLzL4JTikEKxM+jWlpxzAGaEUCM579OlUnAk9Dd3fZCnaN4sW
 5M+HwapPdUCSRvrgEhXIV9MyuCL+vtuk4DuUZGFU7dyz6aEiajm7x7sPs2Jbyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CDTOrARq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-31
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

Autobuild statistics for 2023-07-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  4  |  0  |  9  |
  2023.05.x  |  5  |  2  |  0  |  7  |
    master   | 51  | 41  |  1  | 93  |

Classification of failures by reason for master
-----------------------------------------------

              host-rust-1.71.0 | 5 
             host-ccache-4.8.2 | 4 
         host-sentry-cli-2.8.0 | 4 
                 mpg123-1.31.3 | 4 
                 dc3dd-7.2.641 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
host-gdb-arc-2020.09-releas... | 2 
                    olsr-0.9.8 | 2 
                       unknown | 2 
                    brltty-6.5 | 1 
                  check-0.15.2 | 1 
                elfutils-0.189 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
          host-elf2flt-2021.08 | 1 
     host-python-maturin-1.1.0 | 1 
          libedit-20221030-3.1 | 1 
                 libpng-1.6.40 | 1 
               lightning-2.2.2 | 1 
                     lxc-5.0.2 | 1 
tvheadend-fe47ecb5504a521fe... | 1 
             util-linux-2.39.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4816090584aaee554bf608068c83743ce2ec1098 |     
    mips     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/b9b89f38bd42b9e33a023b9ecca7496536c5aafa | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3d10078d538da74b451ce5f40d9040ff1c792db7 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/194f714a9eee70781942636538cb31bc66618db7 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f5401e5c43de94ede853742cb57fc49e21a5bee8 | ORPH
    or1k     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/45ee19fd98c9209f3a4facf429898310812cffa3 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/c452ea64e54d37079a5237fd880246393d141469 |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/3c6d3eb0c179ba919309990019d543c806e3df17 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/af6bed2e4d38dc99c7e321e9886db1da7f4f9467 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5e04b1f08220763b72d15f448da3922ba47544ce | ORPH
    arc      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/a673f990f6c1427df043c9849fff4e0414575a4b | ORPH
    or1k     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/6f5e4ad97f17cb9ff27270a8ebdc22a7a3f3f199 | ORPH
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/5b90112558aa4160e2eec4dfc84b9f4ecde33e8b | ORPH
    i686     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/67eb48cb835d24780beea40fb9b6252fe19af8ca | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/f2fa30c3e4035b9ac23bda82a324448e43a0d257 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/aa9331b1aae5a51db4db5c1d4020c0855515a2a7 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/62d4ca515820514b034807d1d0b654056bc9bf35 | ORPH
  sparc64    |   host-python-maturin-1.1.0    | NOK | http://autobuild.buildroot.net/results/86485a60d5ca5d95e2ffc72de24577a496956f67 |     
 powerpc64   |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/46616680223cb1de0131058c6a24793d58bd8948 |     
   armeb     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/dd808d8cdb95e13fe68f86fcf6910129d1ce11ca |     
  powerpc    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/0141528699a9b2629b1974606e47ea876ee4b69d |     
   x86_64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/a0c8c2c9aa334649e07f3de694195a996ed20730 |     
  aarch64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/5c194fda418c47ac34bdcb2751f6360247d47ec7 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2aa9dc689dc9b79a62b8e48039b779f77819eb3f |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4e24cb67402bad35ab57833d72e6c857b3eb4e07 |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/263f70545e32234f72fbca1ef008bbbecfbebbad |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/39553470d101ff08aa3be1cd8a941829d0496c6a |     
    m68k     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/266955a6e68ef5388ae9768f6432b9a12ca650db |     
  riscv64    |         libpng-1.6.40          | NOK | http://autobuild.buildroot.net/results/1950ba24111b11bf522e67854b2745a4212986fd |     
    arm      |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/1d1480dc0c3fb0a88490e3fae85abb2aa76bdade |     
   mips64    |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/c17728d3c35aaccfcacef5d0e503f4a9ac54c0e9 |     
  sparc64    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/95828d67726757a9f3a29ef393eb880e03ac5c5c |     
   nios2     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/5233fae4316072d8801ebea00b2a3e016e0fe92f |     
   sh4aeb    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/cedbe3b345088c02a0a4471a77ea63c8352f8e06 |     
 aarch64_be  |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/2270bba8b730c0072b61cf48617d30e619d0e0ed |     
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/78c5546b5b38749211b9273ceb8a2041137e9401 | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f7d0346e304bb78d4421b28b124964d6098aeda2 | ORPH
   nios2     | tvheadend-fe47ecb5504a521fe... | NOK | http://autobuild.buildroot.net/results/99235aa2aca1afe031a088baebbd46057fe75fcd |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d4615566b5ade3141c95b8676eacf22a1e7a660a |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/3c9a0744b9a7da34fa119fb5d207b5170e51e67b |     
   sh4aeb    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/6b1ca0c2c9ef3689339bb4382e14514549ea9945 | ORPH
  mips64el   |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cf84c49b8662f95eeb676650db9b643fc2c63f7b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.38 | 1 
               host-go-1.19.10 | 1 
                     pv-1.6.20 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/da69e8024ed6c919408975d4612bacd9152cfe2f |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bd14098e6ede2dc38d917f1d360c60f4ef5b78d8 |     
    mips     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/ae61070663d019366f859a9cdf2410d4d5b0351e |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/d304fd672c10e13bfcd920f757233d799d29191f | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               host-go-1.19.10 | 1 
              liquid-dsp-1.4.0 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/fdde45acaf5be1a81cf8df4e0254fcf539245cf9 |     
   sh4aeb    |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/d24742c434e84c6078e2050124399192031a107e |     


Gitlab CI results for 2023-07-31
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561231  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768562086  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561186  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561189  | ORPH 
...mdRoIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561190  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561194  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561197  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561199  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561201  | ORPH 
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561202  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561203  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561206  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561386  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561390  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561117  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561464  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561481  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561482  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
