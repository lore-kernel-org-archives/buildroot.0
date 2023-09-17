Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2C5CD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 06:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3E9610BC;
	Sun, 17 Sep 2023 06:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD3E9610BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIhfeccDZ8bE; Sun, 17 Sep 2023 06:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBFE9610B8;
	Sun, 17 Sep 2023 06:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBFE9610B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEC91BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76E8E60A98
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 06:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E8E60A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVY-jy1Tlk7w for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 06:31:00 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 627AA605AD
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 06:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 627AA605AD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A8AAC0004
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 06:30:57 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 06:30:57 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230917063102.76E8E60A98@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694932257; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AJdONxy92Z5C9eNsmg8vRd5TwdhPUtA/xO81IJgmr/k=;
 b=e2+2hJqUn6pZAB5fFECa2g/cM8YOp1HtUaJKznwwgjAa/oTj7UIVFpTG+OlifQIqgZDj8C
 Ipqi1/WCUKnUzvr3gmExQB0S6w+dK/gbnrBhTz+FYZylfaJhJS3BNEJdQPwnQrIsXvBQrs
 HHxg+HgP5P/3Whrba74NoBqbw0t82lbsw0GyaNRJbRE6D8lI+PZMmuLW2tZusBtRJzJko6
 hgWI0kxDO3io1EkH8yg14C2J5PQD1BuPY9ROCjJRKS+c58NJq5dA6xrxVOWdUAJfAPj/Wp
 FF5I8t3ignwbCRYn4sJ5kQHbIWfNS1LlmR3uBy5GDNV8ntoKmH+fLGsBuYmLCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e2+2hJqU
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-16
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

Autobuild statistics for 2023-09-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  2  |  0  |  4  |
  2023.05.x  |  2  |  3  |  0  |  5  |
  2023.08.x  |  2  |  0  |  0  |  2  |
    master   | 36  | 41  |  1  | 78  |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.21.1 | 3 
                  linux-6.4.14 | 3 
glibc-2.37-2-g9f8513dc64119... | 2 
              host-rust-1.71.1 | 2 
        host-sentry-cli-2.20.3 | 2 
                    php-8.2.10 | 2 
                    proj-8.1.1 | 2 
                 uclibc-1.0.44 | 2 
                bpftool-v7.1.0 | 1 
                    brltty-6.5 | 1 
                    crun-1.8.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              fstrcmp-0.7.D001 | 1 
                    fwup-1.9.1 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.76.1 | 1 
                   libnss-3.93 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   mutt-2.2.11 | 1 
                nushell-0.76.0 | 1 
              open62541-v1.3.6 | 1 
               openblas-0.3.24 | 1 
                oprofile-1.4.0 | 1 
          python-rpds-py-0.9.2 | 1 
             stress-ng-0.15.07 | 1 
                   systemd-254 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                wf111-5-2-2-r3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/3723c9dd8b0165aa7226a84d94559ad903eb1963 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/40f344e423ed61e9a6bc85d9f9f86a0bc47c77cd |     
  riscv64    |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/f19482753e9262ec806cf550619170467a144daf |     
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/95f5db4fe7f66c27611b8b12b361b3c1d2ac7b88 | ORPH
   sh4aeb    |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/c65ee1076ded0e0669f614f3cf1c88df506a965d |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/821f0adb9c29b0d9b86a83320e549917af0ceb39 |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/152c301485afc4adf16e4497ef3fa583a45bc232 |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/085fbea0968d9fb6fe2146bcfcca6069b42ff392 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d075741b9bf6ecac0d875633ff6db654fe554c4e |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2646af09405c8d2086ab0a9c5f83f3f3baa2cc12 | ORPH
    i686     |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/faee19805699735e596a4d504142bdd7c093c958 |     
  riscv64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/350994b1e67f0da2684d31682fc3d647fa65c96e |     
    or1k     |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/6fa00f195ed31bde5ef62665638a7bf397584ffe |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c90f628092512c95692d8098c1a5330a5331ea1b |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f3fe515dacc1bd57dd64699cdfc150b44cf19123 |     
  riscv64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/eb2ae3c165bc99d3b1d23db9e61b793edd43c65f |     
  riscv64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/85b522526165501bf2538cf003ac5ac6b776e546 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0ab56f25a6d43302a9dbb22a4745347187e11356 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c55e6e276c420ec47409ea1c6ad4f2c1c5023a96 |     
 aarch64_be  |          libnss-3.93           | NOK | http://autobuild.buildroot.net/results/a1c322c452675767734b8ec55eceb9ee9ea3728d |     
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/c2ec64006a7f6e64d0091617fc5f2ca79cebe417 | ORPH
powerpc64le  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/a4874dac1861d5bce08a512b1a0094897d08c32f | ORPH
    sh4      |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/16bfac4bdbf80ea8e6738c20a2556cce32089ccd | ORPH
   armeb     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/5cb15fb08b16db8e664a98a6edeac2457c594e30 | ORPH
 aarch64_be  |          mutt-2.2.11           | NOK | http://autobuild.buildroot.net/results/7ce69f01f9e5cde3afe8c7fb9ca15b7f721b4f47 |     
   mipsel    |         nushell-0.76.0         | NOK | http://autobuild.buildroot.net/results/a416185a5e4f1f1364fc53691e0dfff8140bff0e |     
  riscv32    |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/faf9e9d538c8b8efb613871df800ab79b5b50d91 | ORPH
  mips64el   |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/d0e0b8f9ecc78212dd6d04e6918756123b6f73bf |     
   sparc     |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/28aa348e89256f666b86fcf6fb5a9f64ed57daaa |     
   armeb     |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/29123093015b2b74a1fe8c718196525b2a59109b |     
    or1k     |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/db381727c621ae5b20b37950cfa1e4fe2ca62675 |     
powerpc64le  |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/6f801b23ffe9023f20a4dcee9338b9068b382f9b |     
    m68k     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/eaadc216deedfa514d460deb388b428eb8efdc3e |     
    mips     |      python-rpds-py-0.9.2      | NOK | http://autobuild.buildroot.net/results/10f90b3f2c2c9d1b9ec164907d72e0e035e60ef1 |     
microblazeel |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/d9bf2dd808a9d4d3eedb28a27dd9b08ef6618b02 |     
   nios2     |          systemd-254           | NOK | http://autobuild.buildroot.net/results/67b288953364f8f1eb0b26c74f8647263d942900 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/44e33a79e1bda5543fa657dbab96a8f6bfedebc2 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/5045d4f27052ffeb2b60c1fb0f7377d967f83088 |     
   mips64    | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/735a97e22e871503f3f32c92b0d9e5cc0c8cd6b7 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/28dc14d13784d25af7e742a80f5f32a779e3bbfa |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/237b2f96768c6555e31563ae235b08e7440e8417 |     
    i686     |         wf111-5-2-2-r3         | NOK | http://autobuild.buildroot.net/results/2c93848964bd1732560e019f7b7018f12d3f558e | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

          cups-pk-helper-0.2.7 | 1 
            host-binutils-2.38 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |      cups-pk-helper-0.2.7      | NOK | http://autobuild.buildroot.net/results/f5ddf8802eea9ddebb926157eb2b2e071f7f1955 | ORPH
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/392d124d6eba45a02b2fb2e545a7dbd907c28130 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

            cppcms-2.0.0-beta2 | 1 
                elfutils-0.186 | 1 
       host-python-sip-4.19.25 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/28eb403ab886e8cde6e052d2ae440b7d73c00959 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0ac224022df475d21535ebd26e4a50d84b48f8f4 | ORPH
  sparc64    |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/ece9105fa8f31ce51b895787fdc2bd6a7a2a2aea |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
