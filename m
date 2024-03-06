Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79996C5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 07:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB81F605CD;
	Wed,  6 Mar 2024 07:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4i0Dnvej6zb; Wed,  6 Mar 2024 07:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5028605FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5028605FB;
	Wed,  6 Mar 2024 07:05:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C07A91BF584
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 07:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAC8140433
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 07:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZlsBwPg4oNke for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 07:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C923400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C923400BB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C923400BB
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 07:05:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 213751BF20D
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 07:05:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 06 Mar 2024 07:05:17 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1709708717; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yqWRwEdg1sbNXxuwJPjM0uet+jKYt0oNkJLthwIBoj0=;
 b=N0v7YdBqdz/y9lr0egbpqDHukVlr0ri78+FvzIBpyLMZ5Z3wgPydlEBDvBd2Y/RW1RXoHV
 Q6C8Flqt+N7dTpXD/LqFx2sQJJbzxrp8IPutI9/vT5/1FM5EaVMB92EZavAT/MPKXTVU7S
 uw/TsFRQlOy9Pe3Cz5Il1jnGE8fTvlP2nxceGFVhjLR4mO1WfzTtp4Z/OCgSlRYvWMl8oN
 Q8MJb0/tlb5lSzV5TRrbjNjGNLqnJzzt6h0qPoiwb+rMg8YegJKM+Vu8CwiRJax7c6kVvo
 NDg56v/sOb1v8m6vMgX1BpB4I7fz7f8bQI0RmRNpA/HvkeIDxBV1IR2bqa3Hyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N0v7YdBq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-05
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
Message-ID: <20240306070517.duqAzmOT6uq0xcK80yeBVHlS0gkxJ_uQO733DCaKcgU@z>

Hello,

Autobuild statistics for 2024-03-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  |  3  |  0  | 10  |
  2023.11.x  |  8  | 10  |  0  | 18  |
    master   | 69  | 53  |  0  | 122 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-2.20.3 | 5 
                libressl-3.8.2 | 4 
                       unknown | 4 
                  linux-6.6.18 | 3 
check-11970a7e112dfe243a2e6... | 2 
           dmraid-1.0.0.rc16-3 | 2 
glibc-2.38-44-gd37c2b20a478... | 2 
  gobject-introspection-1.76.1 | 2 
               ipmitool-1_8_19 | 2 
              libarchive-3.7.2 | 2 
              libopenssl-3.2.1 | 2 
                 openssh-9.6p1 | 2 
                xenomai-3.0.10 | 2 
android-tools-4.2.2+git2013... | 1 
                   botan-3.2.0 | 1 
                  clang-15.0.3 | 1 
               dbus-glib-0.112 | 1 
dmenu-wayland-a380201dff5bf... | 1 
                elfutils-0.189 | 1 
esp-hosted-6a25417fc880fd74... | 1 
                  ffmpeg-4.4.4 | 1 
                     frr-8.5.4 | 1 
                 highway-1.1.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               libglib2-2.76.1 | 1 
                   libnss-3.97 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 mesa3d-24.0.0 | 1 
                    pppd-2.5.0 | 1 
           python-numpy-1.25.0 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2021.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4fc69ec915ec0aca2b4c90dd6a86dfe1823f7d2d |     
    arm      |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/03677de6270ff5de61fff2a76e5cd723aa34e64e | ORPH
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f5eb1ac0bfebdc0105c3ed93cf57e9906ce4a12f | ORPH
   mips64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/da67af693065a0dccea629e7e1c648c9cedf1ff4 | ORPH
    arm      |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/0c4a879934c4a7a4c1c03f3702c1858d3ff81d7b |     
   sparc     |        dbus-glib-0.112         | NOK | http://autobuild.buildroot.net/results/f46dd268ff6621cbb30cf1726a2f34bb04fcc431 | ORPH
   xtensa    | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/4b9db67fb444ec35d741e5d3e74263ac0c4d4a7d |     
  powerpc    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/9c78f465c0562d62a1623ffdc8c38e26ebfb4bb8 | ORPH
    sh4a     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/5c7c82959ce92db908d3ca20e2c1137509c2f981 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f3c6cb48b3812d23d6e3b2fa241dd2ad00a39f9c | ORPH
    i586     | esp-hosted-6a25417fc880fd74... | NOK | http://autobuild.buildroot.net/results/7997cc8a67645a6e1cf4e24d172c6feae459dcfb |     
    i686     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/18d5f8467b7cbcb30bf808dc3d0148f809cc9c77 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/e009270011d3e1dad7eec679c684c0b821c80300 |     
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/5153e6307e928d7e72ddc62c4c65f2df139ce317 |     
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/3f59dcd613f5f1583597641a5b501c5d69c66ac4 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/47c75ca01bdd00102bedf3079842970a83189b7e | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cfcda9d8429b29578c1b01269faf2289410afd62 | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/a915a63589831a0dbc1b0145ebf1c7f5b19c1de4 |     
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/99296443585cf0b8674ac2bb24dd295462a3c82d | ORPH
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a15231dcf082d01a9933fd099a00ab5d71c237b0 |     
   mips64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d599ff51af1e94b8759f9044fe522d0fd9875257 |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d6797fe8a131ef6f9e909613485c84e97164e1b1 |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9b7c4a3748336db4f9103740abb5d8fd16958ff9 |     
    arc      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9b84a06ffdec948c199118aec77d78c3d8062074 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/427aa42b8f3892d67af54a18a5c5060d7022a2ce |     
    sh4      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/6c43a2b51b60530399333dd3d910873c9968afcf |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/d6b900b5d1cbd5e6d3437acae253b64ccaf65343 |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/77f2511c0dad7bc0777bd8165eb9f160f82a17f2 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/fb9b0b1267733ac762e9e078702100bbfe19d614 |     
  mips64el   |          libnss-3.97           | NOK | http://autobuild.buildroot.net/results/47e4aa5259768dcc4d2b9062120c9c9c8d4dfd63 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/628592f871465055c42741ecdbbc3f3b93ebe633 | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/648fb1894d15f7985ab6c329e9f038776466dc3c | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/cc0faf41658bcb4957f421c778d9695ec87e53b4 | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/31183cb944babf3369857e67fa35d08f7ff2db31 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7513c765b992bcd0075401d9fed6c0444395c2bf | ORPH
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/619a9a2ee11c15a1e26ff4d7cb4f7155c2739d7a | ORPH
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d9a6ffaaf970745499c41e799ac628ae018e7c70 | ORPH
    m68k     |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/0d5b45eb375a39bb3f01b6cf8cf7ca5f88ca4c4f | ORPH
  mips64el   |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/9ec37aa99f1551ec81793f7cd95a20fa5b810061 | ORPH
   arceb     |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/8d0d5478ea9c9215aca4b9b0527fec7499f5cc04 | ORPH
   nios2     |         mesa3d-24.0.0          | NOK | http://autobuild.buildroot.net/results/51838b0f72216c8e277f77293df9c25aff7ce069 |     
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/b433d016e883bb40a595bb02cf155426fa446aa2 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/697cb122a0b562df60e201d10fd0cc58c1a25835 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/be03bf6614d654cdf4d08a30af9304c0d50d4d16 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/1f0f170be1d8de021a297f0ed928558b65b0c0a4 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/7e5095ae298649733d71008220485683cf9f1b0f |     
    or1k     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/136503f8e9c2eb5c9c304ebb52a0744af4d6f86a | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a5c20f19c74704f571b54a52959a2521748cdf8a |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/811c05bddae78f13e5b973fba4c2788bd3b5f355 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/09c3b6c982f38556479d40ac5ba72db94979575f |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/edead91b5749ce2b196e650e8ead98486d2b8f53 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1df4ce39342fe4f1771a8561a42e67f03b276f43 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/16451f677486582f9c405ff2fc3370d69e40e20f |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                acpitool-0.5.1 | 1 
                   exim-4.97.1 | 1 
                    php-8.2.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/f5aca337b44e55e0262089843bf8030fba59fc14 |     
 aarch64_be  |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/b06804512effc388c3f16388f328a37d275007e1 |     
    sh4      |           php-8.2.15           | NOK | http://autobuild.buildroot.net/results/36c086d4f9401c175bcf257a560c84d79d104c40 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
                 dhcpcd-10.0.5 | 1 
            freeswitch-1.10.11 | 1 
              fstrcmp-0.7.D001 | 1 
                host-go-1.21.7 | 1 
                   openrc-0.51 | 1 
                   poco-1.12.4 | 1 
                    proj-9.3.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/4b4d6ff7fd4ce762457b57f04fc52872f7af9863 |     
    arc      |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/933e2df843a462cc148f559a6583c01ffba05196 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/ff38259aee6c95eb48ff65d3f8e5036b572fbb3d |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9923dce0a84fb14ff1c844b026c75d6467f1475d | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ccd34fda9ab5eaa520ae74fff4411ba8fdf4fc40 | ORPH
  mips64el   |         host-go-1.21.7         | NOK | http://autobuild.buildroot.net/results/4d35570a83fda090f693ff4a4ca438d60ca9ad67 |     
   mipsel    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/a2449ae8c7929018125dbb310c9b8e7d10997e8a |     
  riscv64    |          poco-1.12.4           | NOK | http://autobuild.buildroot.net/results/001e08d03ba855507432345c213ba56e0534b865 |     
  aarch64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/45a443db333f9f821b5f36babbec9c257e955f33 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/484cbf4aac850fc8cacb596caa2419c43da5f0c3 |     


Gitlab CI results for 2024-03-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308291971  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292809  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292875  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/6313418172  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292288  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292275  | ORPH 
             TestNftables | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292334  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292356  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292442  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292448  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292491  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292497  | ORPH 
       TestPythonPy3Segno | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292499  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292500  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292480  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292525  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/6308292565  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
