Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6E0C001DE
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 05:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD621607A4;
	Wed,  2 Aug 2023 05:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD621607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ziX9S2TcXj8I; Wed,  2 Aug 2023 05:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A78D60E5C;
	Wed,  2 Aug 2023 05:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A78D60E5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A45151BF387
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 05:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8380404AF
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 05:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8380404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZz0UDfqTvHJ for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 05:40:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 804B54187E
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 05:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 804B54187E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77810FF808
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 05:40:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 02 Aug 2023 05:40:15 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230802054020.A8380404AF@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1690954815; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3MtIVbS+cbobpqHo0VNgqkZCkFpOO9EAebYO3chs2H0=;
 b=BfMWLnVr63yl79xt6kjWahq92su6lY3S6p8TtYtIHz85wj0R75FOAdkr/5sHxQ8BJ7mCxk
 9XScRXkfGWE0cjQzLwEIKl4oFw1Ea3HeVCARNAimSm1p7McSF/+92PkI4o16/Zi9s107bv
 o/uS84bZRDsRUYzWmdN4LfVpziAXzg3BnblaNhQByw7MW1e0L2uS7EIFAcV1Iiv13RIGYJ
 wrPD48wG3KNFJ3ZV2da6X756HY1xZWODo1WifYgY06psqyLSbUKd5+58qB5YQNGdoa8wL9
 S+IaVNIESo402Nd6E1zihEZdHLV6Nya5vHG2xxCtQEZtrq9qhxUuxtrPOHirQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BfMWLnVr
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-01
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

Autobuild statistics for 2023-08-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  3  |  0  |  7  |
  2023.05.x  |  1  |  4  |  0  |  5  |
    master   | 52  | 55  |  0  | 107 |

Classification of failures by reason for master
-----------------------------------------------

             host-ccache-4.8.2 | 5 
              open62541-v1.3.6 | 3 
                  check-0.15.2 | 2 
  gobject-introspection-1.76.1 | 2 
host-gdb-arc-2020.09-releas... | 2 
                host-go-1.20.6 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-6.4.7 | 2 
               linux-pam-1.5.3 | 2 
                     pound-4.8 | 2 
             util-linux-2.39.1 | 2 
                xenomai-3.0.10 | 2 
             bluez5_utils-5.68 | 1 
                  botan-2.19.3 | 1 
                   bullet-3.21 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             f2fs-tools-1.16.0 | 1 
             gnuradio-3.10.7.0 | 1 
                   guile-3.0.9 | 1 
         host-gcc-final-12.3.0 | 1 
     host-python-maturin-1.1.0 | 1 
         host-sentry-cli-2.8.0 | 1 
                libgeos-3.12.0 | 1 
            linux-fusion-9.0.3 | 1 
                     lxc-5.0.2 | 1 
                 mpg123-1.31.3 | 1 
                  nginx-1.24.0 | 1 
                    olsr-0.9.8 | 1 
                   perl-5.36.1 | 1 
            qpid-proton-0.35.0 | 1 
                    sslh-1.22c | 1 
               syslog-ng-4.2.0 | 1 
                tpm2-tss-3.2.2 | 1 
tvheadend-fe47ecb5504a521fe... | 1 
                       unknown | 1 
               valgrind-3.21.0 | 1 
                  zeromq-4.3.4 | 1 
                 zlib-ng-2.1.3 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/1627d3c9209186f1f39c3a82191afb2fef8db755 |     
    arm      |          botan-2.19.3          | NOK | http://autobuild.buildroot.net/results/5906f53e8dab00a0e5358953ffe85395081c2701 | ORPH
    or1k     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/e25ef00ea9961f37fbe0a99c8ac8271b5595178b |     
    m68k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/0dce320809bbba0438afd03e79c898d737f81f6a | ORPH
  riscv64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/8d9376bb0f8a620a9939d7ffcc90a13d6d27acce | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/29f841a0ddaf4c50bc7432e7c899140f10d95be0 | ORPH
  powerpc    |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/71c8b688c20171c36bb21d4026e80cb7c60880d6 |     
   x86_64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/f33d4dd5633dd0ab770716805924417ca08db21b |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a7081a2eaf913d4b80c17823b666082801c65d16 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/77f76d6605c7b4c60d4996f7191ccddb63203463 | ORPH
powerpc64le  |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/e6f31cf9a7a0174188b9be3850254c3ad6ebd26e |     
    mips     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/2db9afebcf22e5a05fc491bf75b0793ffe2479ab | ORPH
 aarch64_be  |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/36ff0c4bf4844d634830ae6da8ea1038f700ef70 | ORPH
    arc      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/a15d020a8f06cb8ad2d4aedab8b18db45970f74b | ORPH
   s390x     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/f50cb469dd5d199573f09f7e9178b3f6cd8d383d | ORPH
  mips64el   |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/cd341365d1c429bfca505a742e86b3090897db23 | ORPH
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/f2ca977355b8f5c0fddb75ab28f485793d425b7a |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e60c9bba5395970f99e9f889bba4675ac6f004c4 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/77807555de23e4800df6f856b95d1089eb481632 | ORPH
   mips64    |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/10c5caba0196f050dfb1b2f3e56c82a32937b990 |     
  aarch64    |         host-go-1.20.6         | NOK | http://autobuild.buildroot.net/results/c0d8e6ed6d16e4c1e8f0e8a5388aa8fe1f1a9fb3 |     
powerpc64le  |   host-python-maturin-1.1.0    | NOK | http://autobuild.buildroot.net/results/f121c3d54d82e9cc915ff9e987d4300807e48073 |     
  mips64el   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/8dcdf3303fb1e68fcde43f14d2f3c01d4b21ae76 |     
    or1k     |         libgeos-3.12.0         | NOK | http://autobuild.buildroot.net/results/62ff987b5aade5013faa7360048d03288631281d |     
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/a62e48a0e05b9fd9c2b7583758ea45c68afb5efd | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/72d030d4024429fd9af6c0ee0db588e2c7fb2432 | ORPH
   mips64    |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/af182c5de052dcc861d171efd0cd1d374a6692a4 | ORPH
   mips64    |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/eaccff642afbaad8770c4f07b29ea43f882fc8b2 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/d992ce4998bb488a9606a17ec81caa14b0e9c471 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/197e8514a8e0061ba3eefd7225bef1beb4c3421d | ORPH
   xtensa    |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/e555d1c8e7bbcc224a88eb5c222b11290fe80a14 | ORPH
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/8311293f14a36d3f9bd38982d294e1d2bb96d4f9 |     
   sh4aeb    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/cd00855b6132becefc4b29fa6a9e21dcddc54982 |     
    arc      |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/fe8ee4b29d08b751d87d3df2e48eae7832090134 |     
    i486     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2d88e78e7557d3c6a7ac246bea18764ca718af7a | ORPH
powerpc64le  |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/7fbe8440d2bae56f56a55f076707fa99d083c69c | ORPH
   armeb     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/6586be2661a76a291390285d187db0426b5c1eac | ORPH
   xtensa    |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/81009792a9d1e51604ac3a92554ebc5ba2eecc31 | ORPH
    arc      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/e438d1d5f3643e3ab998a4714eda3f362fa312e9 |     
 powerpc64   |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/711bb6189be502baf36e7f02c9c5f0c83961a2cf | ORPH
    mips     |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/8433df3388b661ba9167ccdf9cad097497251741 | ORPH
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/636f3cb72a0832bf9c8716878fd980a73c037d86 |     
   sh4eb     |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/55fd2e7acddf3cf4a773dd6cca0b1a07da5b0491 |     
    i686     |        syslog-ng-4.2.0         | NOK | http://autobuild.buildroot.net/results/cd4411d6f10ef3482389c1aadd2c4dc55f351b55 |     
   mips64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/a334f19cface29322ec688629326f87748f065ea | ORPH
   nios2     | tvheadend-fe47ecb5504a521fe... | NOK | http://autobuild.buildroot.net/results/858af1bbbd1fb6de791efb51e6ab4c89bbd82956 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d268e720c10948acc48e014fc845353d80e179d6 |     
   sparc     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/216a120beaa673ae822414f426ed51efe22b83e4 | ORPH
  mips64el   |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/edf85774c9f8b7b992f0fa8cb9e73b1f00bcc713 | ORPH
  mips64el   |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/0dbac4e2693cf36a037e60d5c5338c9cc25a5170 | ORPH
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8180749c9d1259d68d6ac7c5b0d041675f475287 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/afa258750cc54c0907140b1cf009337ab0434764 |     
    mips     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c5bd4562723d0cf47a37ce4c38796a1662fbcfdc |     
    arm      |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/943d9445c50313611bd0747c1f46e540cb11befb | ORPH
microblazeel |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/19a51780e0661ad70a6b4608e06d5e78f4bf4822 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
          linux-5.10.162-cip24 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0ec67b84ce755201c86873e03878d0138553e8f0 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ad43f6e57f88b9c36e3448e66c515b66b3b08661 | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/69169d5fbfccbf9814a54018fe8e5e4a4c10a6c8 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.3.12 | 1 
       python-stack-data-0.6.2 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/25903b061a02476c8c3c0dc3443d4f04e9ae8f95 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/eee7908e73cd447342b728431d44bdea462ef95f | ORPH
   mips64    |          linux-6.3.12          | NOK | http://autobuild.buildroot.net/results/3a95fd110525d56a90f7ecf6095e7a4afa189a97 | ORPH
   s390x     |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/d4a9442d058c3367debabbe3cac92f7b74f7743e |     


Gitlab CI results for 2023-08-01
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561231  | ORPH 
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
