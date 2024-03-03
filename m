Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEFEC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 06:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF91608DB;
	Sun,  3 Mar 2024 06:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2-EkBK5x0t3; Sun,  3 Mar 2024 06:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C030F60A9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C030F60A9A;
	Sun,  3 Mar 2024 06:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30F811BF5F8
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 06:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B68E410BC
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 06:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vq5cQbRe9Ohk for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 06:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51EBC4109B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51EBC4109B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51EBC4109B
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 06:43:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AEFD1BF208
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 06:43:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 03 Mar 2024 06:43:07 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1709448187; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vD/X6fqg9zomp6pqg5IUcLPazGhyPLP10YO4bj/8nBY=;
 b=guRSvDN9D9v8dvYYweEfpl8LEWw7vRC9coHo+Du/wiimIqMDHtBmnap7TjerM5OsYhX/1w
 XTIcGQRDx6ykBPWzIDZJDXmuZIryOTaBEWRW7Bs1V3kooMF4UlPWXNErUv5m1zhq6K22Xj
 DqP/Uq+GX94/goO+V6oZ/hzk4LneBnbLOXXKrcAVTGLPm6bjT104YzersTAQnFFS0VelHV
 NWCQICF09GMMCTIZaBU5WqLKjiG/Q0Mg/fzn7x/lzkNtDM+WpF0UfN/YKXP5mfEsGlRcAP
 F9hZdSIR51sYnBDxf+1SruJNsy2Y31U7SalkeDA75yf+FFgB6xP6P35Ak6Pncg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=guRSvDN9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-02
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
Message-ID: <20240303064307.upqwB_nORPpxKaPMH-TjKKYMEKi3cNrbpByJ2KTmpGw@z>

Hello,

Autobuild statistics for 2024-03-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  5  |  0  |  9  |
  2023.11.x  |  2  |  3  |  0  |  5  |
    master   | 67  | 58  |  0  | 125 |

Classification of failures by reason for master
-----------------------------------------------

host-python-setuptools-scm-... | 5 
  gobject-introspection-1.76.1 | 4 
            gdk-pixbuf-2.42.10 | 3 
                 coreutils-9.3 | 2 
                elfutils-0.189 | 2 
                    fcft-3.1.6 | 2 
              host-rust-1.74.1 | 2 
        host-sentry-cli-2.20.3 | 2 
              libopenssl-3.2.1 | 2 
                  linux-6.6.18 | 2 
                 openssh-9.6p1 | 2 
                  boost-1.83.0 | 1 
                   botan-3.2.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                     efivar-38 | 1 
                    eza-0.16.0 | 1 
                 fdk-aac-2.0.2 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
                gnu-efi-3.0.17 | 1 
host-heimdal-f4faaeaba371ff... | 1 
     host-moby-buildkit-0.11.6 | 1 
igh-ethercat-f5dc109176400f... | 1 
               ipmitool-1_8_19 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
             libutempter-1.2.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20240129 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                  ntpsec-1.2.3 | 1 
              open62541-v1.3.9 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    parted-3.6 | 1 
                   perl-5.38.2 | 1 
                    pppd-2.5.0 | 1 
                    proj-9.3.0 | 1 
            python-sip-4.19.25 | 1 
                    qemu-8.1.1 | 1 
         spirv-tools-1.3.261.1 | 1 
                    strace-6.7 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/29b67148a22c663623fff5f67be3ee136a5c812a |     
 powerpc64   |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/1342138e957fca13854a9fb757eafa299073df56 | ORPH
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f6b2ce82bd5585ff656162124e68f72657280ef8 | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/dcaa4bebd018d89aa92105b6844a0472675d5626 | ORPH
   armeb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/4c2e62dce7fb374295b8784309b24d8ed6751774 | ORPH
    i586     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f554f96d555a899b288a3a68aeb5f5703b97b203 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ffaf7c582e24d02a5e5b90cbff91e85fcd667bcf | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4488b2c547d7adcd194c7d59b021aa7413760e11 | ORPH
    arm      |           eza-0.16.0           | NOK | http://autobuild.buildroot.net/results/9721298c114f2008f4e7e1ce9e2c8a919bd4946e |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/9abc0720c63ca1f610e4ce083bfb1ed0c18fb441 |     
  mips64el   |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/ac51d8310ffd72f832a08275cf3a79c99f160466 |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/3dacc255ffef0d5ee8f226f3c0fd48c1a3ee1fcc |     
  aarch64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/0b339f6f1cb604023c1772b61402f7fcbafb4871 | ORPH
   mips64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/576188ae4ea8f7456d92943946b1b1e1b8c3aaf1 | ORPH
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/233b68674fec05b56948cc0ceca721ffeb264606 | ORPH
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/fa47cd18b06b236b0693911c915990309df37024 |     
   armeb     |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/96bb3405f4dfda107978a98dfab05bbdefd67df1 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9cc788ccb93c5ac9b39ebe4c1559a071df6bf9db | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d28a3839a44eb206769422329113c35532519b52 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d834144adb02d1ffaf0cc9fd32505649e6c2d67a | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fce0a2607e638452bdea0dcac73ce889efed53f3 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8e0de4382b3e3bf3f55563c700e7b2362d22fbbe | ORPH
    arm      |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/2a7d7285900c709f9273ac4c6386e0253d38efcb |     
 powerpc64   | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/921af8cb0e8e27330ecca934a54b4a58e95ca358 |     
    arc      | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/d05e412170c427e4f210da164c783b3527f15892 |     
 powerpc64   | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/041ae4abd0f79e569f1b48f096c87ef33aa5b864 |     
 aarch64_be  | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/9c3153f488c69c8faab200090486b392d1481e8e |     
powerpc64le  | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/c8d16da11b11b0c0b3a101a4302c8c59f087bef5 |     
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4f13d2651e979e459e00570c4affe0421f957866 |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/6d2e7e6ddfbd9c1c82fb25ca5c906b497d9a286c |     
   sh4aeb    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/4d8931c513ea7eec5c1c083fb31390281aae2c79 |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b908a1b00b2d96728fac474517bb08fcee34239a |     
    i686     | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/8e60508ab7ba27ff750e3d5852ac96fe519a80de |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/3f766aec4d252f0fca8172e1f99d2f978522126a |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/f7046fcbe09c810b901cd56c006c1d7bc72a8238 | ORPH
   s390x     |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/777d86a1e53dc3d6a16c829348673f1c33245a6c | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/0afb1b21dfa17545a1ac881058d9ada1159c052c | ORPH
microblazeel |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/a8974aeb5df535c40885c6f3e52e4ed6c281e2fc |     
   sparc     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1ee40184555b7fdfa097cda0dc8f0a9e3120dec4 | ORPH
 microblaze  |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/242f07b2e15d42ec19e16f97a2fdf079351b0c39 | ORPH
   mips64    |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/d5e4170050973e820f91e6a58c76685e99fb045d | ORPH
    mips     |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/d2e75a79bc42b6a9a2b407fd557aca5c7f207d84 |     
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/307f8e68449ab8dde1384127c5ca8c14c0b4e578 | ORPH
microblazeel |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/05a231c20ed72c904955cde540bd6b01ac8ff748 | ORPH
   nios2     |        open62541-v1.3.9        | NOK | http://autobuild.buildroot.net/results/7ffdc506c090219b70efa2ae5702114182d22a01 | ORPH
   armeb     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/5b006f5c361b59a7de7ff61783aa565da618e576 | ORPH
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/fb1b0758d415c8ba79baeb6dcc393a34c60f33b2 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/63e052d59a46bc695f5dbec11b82e41c4d33fce6 |     
    arm      |           parted-3.6           | NOK | http://autobuild.buildroot.net/results/1f0af75ec55da9052fbfb195a0699f84619eac81 |     
    arm      |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/9584d2ff052d20aa1c8e6b48d3b1e9b148eff919 |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/c97497cdc9a32a66de88e09d830059807c04b7d7 |     
microblazeel |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/7291d07acf283a42f60bd939c2350c2006e63d1b |     
  mips64el   |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/878842f99197f32b14aa54adeff5adba2c94200a |     
    mips     |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/33a338732208c54a7202bbcd8fda7ef3b1434d96 |     
 aarch64_be  |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/aaeb0ca8773842768f9311fc804bb7529d9e3bfa | ORPH
  aarch64    |           strace-6.7           | NOK | http://autobuild.buildroot.net/results/0068e7dc34ccd44ad0513059e316833e183412ed |     
 microblaze  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/70eaea5d2dacfeb27eb46f1182d4e03859d75908 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/9332b178cde68bb1dc1ca1a76af6c2519fd7983d |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                    proj-8.1.1 | 2 
            freeswitch-1.10.11 | 1 
               ipmitool-1_8_19 | 1 
                moarvm-2022.12 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/cc08ad59e76225f93b37a63561b570cec9145456 |     
  sparc64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/f6b557f886f54bb0bf90a5810b95d6f4fe7f87e4 |     
  mips64el   |         moarvm-2022.12         | NOK | http://autobuild.buildroot.net/results/d337faa990113416b29c5735e213cf6dd6fd1888 |     
  sparc64    |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/58f2e9491275c678815bae78ce3cf018ec1ec424 |     
  sparc64    |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/a1ffaf612d6f03ce7fb80efc050821d1ae5b2551 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

             flare-engine-1.14 | 1 
              host-rust-1.71.1 | 1 
                 samba4-4.19.3 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       flare-engine-1.14        | NOK | http://autobuild.buildroot.net/results/87b3adc1512fae95b2195c817bbdfab7b7b3da76 |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/415430c0e7a76e30b814c7fa6213abd6992bea4c |     
  powerpc    |         samba4-4.19.3          | NOK | http://autobuild.buildroot.net/results/90362b07deb2babd7c860d7e63521c5e8d59c3a7 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
