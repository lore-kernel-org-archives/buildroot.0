Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871F3CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 03:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C428460615;
	Sun, 18 Oct 2026 03:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBboADf90knr; Sun, 18 Oct 2026 03:30:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2DE560638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792294216;
	b=AUpTQZ/NoCTjmKxpF4P3cYBcFVf+DmMl7dW1YbbEAGPNBbOFZ/2duNfeYgLoN7mJt6jQ
	 z6EKT7RbuKwrOn+ogKW35OEPp9QxeHgv4iIX9AVaX9FcD3hs4UCedXEwReDMCSMEr7U+0
	 s1WG3Dl8VkCxyuwyawyWve8NVS0IA3g+6fkcZHRW2EvjvQCcBJhdd5D+rjGHmM9thvMbY
	 F7FihtCC/0M2aeIfdam8XGReYPAR/vkMJlg5eK6RqmRhzytEMKtbd98RXQ9Z9vaB0Klm/
	 yiNap5nym8kCjB0P2xVgsCeX9L1R4Um75G/mReugspISS8A0XTCN79qbQ1G1LrEoPow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792294216;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H7Mmun5ElDppQ1is2O9F01fPvYzythOFSAAoLNuWpYI=;
	b=ALrVGu6GNJBeeiB+kqlWWuucJB7q74cDc0UjrDSPRQJGTxHxJ9/CXqIvIwy3QQ3/g1UK
	 zOaBGvdEYRgkj6MSGzXCMjuM/aUpGhqANN9aRFTLpRH+RFQw8pF6P1VH9De1pzhP2TuoW
	 uKtyJGZQZQwov3R5PeoCylS0ujjmGzzuuyIBXAthQ5tGnL1+ecEy1s4i+7cr4mohnPg8L
	 t/D384Kh/+TR1f/2g6BrsXsAuw3Un7pOUe6yddrnCyMxBFVXoBwBkDSNxl0gKHAYXYXxx
	 H/5dlkaf+79RJ9sRG29BwPaYt+63TAXA2QQ2kYjfRIZpoGkKYscFO5W+JaDZVIA7FSQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792294216;
	bh=H7Mmun5ElDppQ1is2O9F01fPvYzythOFSAAoLNuWpYI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LnSphd3TaMT+weqYzqL9goyIkqrGoxbVuRQHiXBUCCEX6xxHivhV0cSJ8CtXglyhV
	 kRN1JkmF7r0eEThu664QZzwIQNT/HT5VStPhhaPT/jCN2xBv0Wyf0zA3GbryXG6jkC
	 y7CEuwS5alBq3cUsbIh7JPly3APxa063WiPY6JnXFa8ATgo7emwH9kOqRQdUYxZsq6
	 MqzABf7Co8+V8+XelgrySGRUrQvix7f6Ye5lT/lBvFze8aJB+UeVmxN6yNEm75t9sx
	 rj+P7rHfn9yb+2U5Zb9RbumrysPmWd/LEI5UmMm6tdNs+pAw+vmpywBN1svkB4ElvQ
	 kHdFWrJNMmLCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DE560638;
	Sun, 18 Oct 2026 03:30:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 815BA787
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 03:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6745440060
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 03:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GceN2c-pH2Tv for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 03:30:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F1C604004A
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792294213;
 b=NMAKjnbbP1QxjYlsJcz0b4o8WADCdBJhV505mtEsWdowOX0fxyzVXiKoAKIOFqTdx7T3
 igVsYgUiq3bWa1r1RvBkZNK5N3dBuXTkrqO1w9byvNfvu8dx2NvNj3u6mXvdKaB06bes/
 CXlwKQw8GAnVtut5l0yEteO0E4OEmRtUrAgha8+CVzHK5d8hg466PWSUZaKOFY0a8LeG8
 58xTF35tLnANCYl6ZJsQItFDQPqAQRMnbTuK9XI8D6GaTml0a+pTgu1JKnPjDebIg6O7l
 aU7nl/oLYwjxhIG68we5oQy1AMHryhtDVWGV+UsCHHJ0sRYe/b5dai2ikbGG0SwVSWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792294213;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=peluy4rnfM1WnHwdOeT1vzD/N+uwGryFAzURDBN4QCQ=;
 b=gV8iDfwbnmSMlDJ6fHBaDyNZB57+E7fhjrmFYOqwDcRk8xw9yj0+a69y68aujcl6jRXG
 z9tgUduBwZCR8IZCUsolcvjWfN1HMFZn9qkeTDgnC0vx22zD0KzWjaxN/qVnJBAEpvhcK
 hBz9UXoxyXLzQ4Irir6zgfQiHnOtqVQeCTSqj15AyExng31u0QIg2w7IblPNeFEltR9sR
 w7JPqieyX0u4RVEBuoiLFKX1JX/uf27dySaAKo0e/KgG6WlP5BWLK2mlaEVd1au2yaPCl
 ZIZPpNGs8+2hUbXv/8Gf7j9DYa720VFNrhPzpXZL/oNVkyXWlJLm6FlevruxJahVfew==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QiFDFf6E; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QiFDFf6E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1C604004A
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 03:30:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so11655095e9.3
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 20:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792294210; x=1792899010; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=peluy4rnfM1WnHwdOeT1vzD/N+uwGryFAzURDBN4QCQ=;
 b=QiFDFf6EOyi2wlC6zFEXHJIp4H1BJlFIrWNxx11clmt7wx/T4zx+mvjOtNJmrAmaBH
 leOlBOXElm+QCKJ8GOfD9NiBOBKQbHcBwQzRKBC/qBSbY9n4WcV+Ny8gimoMhLqO8vHm
 ffFYkNFdpquvhavge06W1XC2pirzwqYhYQvoJstxIRSsR8UE5u7sw11VuwdOwknT/5a/
 TANVvsfRc1eT0RqFw0wtYZyZAK8njR8MEqDVTiFtZnhad89CDhG3GGv7FnMQEp3QW4T8
 n6IilQcaO6RY+V3chCtjr81jFffENdJa8OZSxTwSg4wnnFGvBiXMI6/6jTegaCmi/jjw
 bENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792294210; x=1792899010;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=peluy4rnfM1WnHwdOeT1vzD/N+uwGryFAzURDBN4QCQ=;
 b=hrnxZkulRGoVo+4g2bNX2K8Oishs9meLNKA6P9TMx20ECVCvSJTiLK51RwhncbgOi9
 c1XYDOjRMR2QF9XHI3de+rK9mg+FAPDEfcN50TZ4xb2DyiD6M7cNjNOQsgCiCk5q3has
 h01pW5zq9uSybg5wqZmaFRFgfhnZfHVbXv+Bn6yxjCtx4Zz3qXYSZE/M/Z2ms51NCD+3
 qH1Jb0dfdyHh0gSvGPIc2+Tt8zqpGr+mAGRFlPo2MTCrtYN2FOvxYHQDTEisnnMkZ7at
 0exXjozBJCK4N3C9hk2zX3OcILKYBpnu6N0xMkgoNDCRrnrGS2dbU68zyaqILxi2Mdgk
 +tdg==
X-Gm-Message-State: AFq9FYKXwJY0Vmb7WMEqC/cYQ5D+3hpms1RcsrsafVu+xL3/l+dfRlS/
 6lP4lTtTRizUlz2V5A11gXwyZtKRtkLlzAUer8N5Au4UwEKIZw0btNhhort18LgR
X-Gm-Gg: AYBFou0++Yok78TCXS2tvhR5vNy7L4B2V708i2JGj8EW8ttdXCPIQvtYsLusGQGbMTJ
 IMeRYSddbS7dg8kePVdsa/REscd770G5EgaKktanb9O+CaMXBm61B9KWugbuueG+ggvBQD0DMiL
 EffdnsL5QN4UwWgH5uDhRQhdIPb5c/s46YYo/dNaZKb7a+opBu8zLbKbic59EKuRdmtaEdhUjWE
 Qi3VJMKWZiJ+nJjO0HunCO3MinSHJHdwMmZHXqCNLlj9Y4yfgzPYA3+fJg08/L1OwFf270ZuNHS
 aM5WTUHoB9/4o8+p4hsqSInF2oA5TLpZ44oGfCQyA+2guGGkbqBmRTd7sVu+jJ74tQJFhThRZVk
 EJjcPPiPPFLcouPItDXdDqE0PI4HdM9dUT31Os7x8uM3zwSiej7u8QGtBy3L3AD9QVy7dMdWW0i
 Bkeve4I8ornp+EHRdqQ6TRDM3B8d2IU6dEFfH/W2zvihZWaNkQggVmZvSvMkKTNpsPBGX799X/v
 w==
X-Received: by 2002:a05:6000:41c5:b0:48d:f996:1814 with SMTP id
 ffacd0b85a97d-48e07faff88mr8141639f8f.57.1792294210121; 
 Sat, 17 Oct 2026 20:30:10 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd50d080sm14649949f8f.53.2026.10.17.20.30.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2026 20:30:09 -0700 (PDT)
Message-ID: <6ad43d41.1414cefa.230755.8188@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 18 Oct 2026 03:30:09 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-10-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2026.05.x  |  0  |  6  |  0  |  6  |
  2026.08.x  |  0  |  4  |  0  |  4  |
    master   | 41  | 149 | 11  | 201 |

Classification of failures by reason for master
-----------------------------------------------

              libmodbus-3.1.12 | 15
host-gobject-introspection-... | 14
                     host-rust | 11
            host-gauche-0.9.12 | 5 
                 systemd-258.7 | 5 
                   bird-2.15.1 | 4 
host-google-breakpad-f49c2f... | 4 
                       unknown | 4 
            host-go-src-1.27.2 | 3 
          host-xfsprogs-6.19.0 | 3 
               linux-pam-1.7.2 | 3 
                tpm2-tss-4.1.3 | 3 
am33x-cm3-fb484c5e54f2e31cf... | 2 
                    attr-2.6.0 | 2 
             containerd-2.0.11 | 2 
                   dante-1.4.4 | 2 
        edk2-edk2-stable202602 | 2 
                   gvfs-1.57.2 | 2 
    host-mender-artifact-4.4.1 | 2 
            igd2-for-linux-2.2 | 2 
                 lcdproc-0.5.9 | 2 
                 libclc-23.1.3 | 2 
               libepoxy-1.5.10 | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
libftdi1-v1.6rc1-2-g92d657b... | 2 
                  mender-3.5.3 | 2 
                rdma-core-62.0 | 2 
                    runc-1.3.6 | 2 
           uboot-tools-2026.07 | 2 
             alsa-lib-1.2.16.1 | 1 
               binutils-2.46.1 | 1 
                  boinc-8.2.11 | 1 
                    ccid-1.5.2 | 1 
          cloudflared-2026.6.1 | 1 
                cryptopp-8.9.0 | 1 
                   dbus-1.16.2 | 1 
                  delve-1.22.1 | 1 
              erlang-26.2.5.21 | 1 
              fftw-quad-3.3.10 | 1 
        fmlib-lf-6.18.20-2.0.0 | 1 
               freeipmi-1.6.18 | 1 
fs/tar/tar.mk:38: /home/aut... | 1 
                   grpc-1.83.1 | 1 
host-am335x-pru-package-5f3... | 1 
           host-libaio-0.3.113 | 1 
            host-libclc-23.1.3 | 1 
       host-nodejs-src-22.23.2 | 1 
              host-rust-1.98.1 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
                   i2pd-2.61.0 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
                ipmiutil-3.1.9 | 1 
               libglib2-2.88.4 | 1 
                libglvnd-1.7.0 | 1 
               libgpiod2-2.3.1 | 1 
          libmicrohttpd-1.0.10 | 1 
               libxmlrpc-r3341 | 1 
           libzenoh-pico-1.2.1 | 1 
                linux-5.10.272 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
                  newt-0.52.25 | 1 
           oath-toolkit-2.6.14 | 1 
                 octave-11.1.0 | 1 
               openblas-0.3.34 | 1 
                openntpd-6.8p1 | 1 
   openvmtools-13.1.0-25218885 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.42.3 | 1 
       python-dbus-fast-5.0.14 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                      rtai-5.3 | 1 
        s6-linux-utils-2.6.2.1 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
               trousers-0.3.15 | 1 
                 uclibc-1.0.59 | 1 
             util-linux-2.41.5 | 1 
               valgrind-3.27.1 | 1 
                wtfutil-0.47.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/faea312715fd315269eb69737787dc6b1f8a5cd4 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/8cf991e43cb59bbbcb707f899ebc4fe4637088aa | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/1dbc9f65916dc483327ddc9f7075357a3f8b43cd | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/5b8b7402097a31de8921142fc28d021f93df7420 |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4c4f6f5dd83c360494240fe8bc5e8c42c91ab867 |     
    i686     |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/32a496ea8234389c1ed5b5536e4a5613b27bbecd |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/b4c3266b09f13fbd1647f7cd707dfe4ebb20e958 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1403d82c816d301664c247de91aa1e911677e0d0 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/62079ff751e1ceff1bf6580bc4db166af21c1015 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/77e3f412134c43079285fef86fdc024da1e71197 |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/213214fdc6cb0cde98f55a61bb25cc73fafdb1d2 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/b9b225b89de01d3eb085f22358c9e5f1f1444968 | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/4a54a0f2b9296ecd60183820080a3132700b64f9 |     
   x86_64    |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/ab6f81bb3b3bf27627b75db589303c7713357e5b |     
   x86_64    |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/1d18e21b3ef49e818ec5da0c6b20069fe216fcaa |     
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/d17b331e9a5950a10b79dde4ef9d2c8b3194d281 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/a9b7c1e15d1dd48ec854f1f72bbbbd6a544984f1 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/daa944dfd42712fa9ac4c8127fda760f045494e1 | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/b792b01de568569be96a18953adc930579b42b8a | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/0fa0b173e400aab2762d54118638b5304c2c6abc |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/113216d9faf77df6033f1a6de339af85609af197 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b1b96457c60f014478657ecfe525e45e32f3b173 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/764f11b7c82dea5909120c2d8dc3ddb56b68e752 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/de927669c35b7321c04fb1f9cfa78dacc2a59024 | ORPH
  aarch64    |     fmlib-lf-6.18.20-2.0.0     | NOK | https://autobuild.buildroot.org/results/7fb2b2808c4f122e08ca217f34c4d56a2b1bfcc0 | ORPH
microblazeel |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/c9654c9339a0f7647f9d7e40d5b4826491054b90 |     
    i686     | fs/tar/tar.mk:38: /home/aut... | NOK | https://autobuild.buildroot.org/results/494c4c30a13f3d9640303e7639a2b47060ac47d5 |     
    i686     |          grpc-1.83.1           | NOK | https://autobuild.buildroot.org/results/6088f64c7a039b5c7f10ee0fcdb07605b6a89b84 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/ad7f6926e76e8ecf6c831255b5c28b7a73ae270e | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/3f51470b71e1ca4e888b457fa4fc471b557b4646 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ae7ff38bc8450e9087bac4b0966667d0eae0cf56 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/ddc6d52c33758947c46888d35c8a1e43fde39933 |     
   x86_64    |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/8b294a876daef1162121f3770a93d8159e0c25f3 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/1c195e71cf035ab79254a5b8a629531196373892 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/b704896ac3c84e5a93f4113a71f0b0f42e168fdd |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/0b982cf06be10560f5e2932f9e0d1a7e90668001 |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/286ad1a0d8aee69ffb3d8ed7a565ffdde4151636 |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/a991d0469a0df889ecb20e283cbd7a97ad9a2e16 |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/abb5827f2aaafb57ad3cda95c5545a0049304673 |     
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b07ca156a45b78036b49df8787d10f306edde4c2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e14fef753a1cf454746bc4af92a302ec0916777b | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3be556a5fccfab803563312f7ef2cf59fb17aa40 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a7f68e4d42e64dad750618fa2ee11ea64a271ad | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1f6e25bfe6bc8b8319a1bc1e59c82d88c7d27ecd | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7ba2a36e318eb5480b24b19806c694a20a15d480 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c41d12fdc3403c5be8f25f26dd05ed13f5b5cb95 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1dd7f42c0c791ab0a79bd32756ba5dc397e88f62 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/93bc5f23309d0a2b303bf1b9a0752c1972e71783 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6e3f133a4e4b786b355b3d89b2e0ca1230adc95f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ce1cf57d713fce650cc1ec8388d6a0b55200d79a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e9959fa23df29bd8bc28453a56bb5713141ea55d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b304f62633b13b56ba75dbaa07cc42e5147c9633 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/65381a26140631e6fc9aa08a9f670d90fff3b876 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/eb02e96aaeffe1522af54ce7f98315ecde41d96f |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/92ffac38d24b055ba1ba7a7fecd67982a1d75efa |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/fdd1040b3e5879e82a1116c2f522f34b1240f98c |     
   x86_64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/a3ada5bf8588efe95ae76619814ba498f9a8c78d |     
    i686     |      host-libaio-0.3.113       | NOK | https://autobuild.buildroot.org/results/a41a9a04310720b41c4a07ebcd977344ab94b49a | ORPH
    i686     |       host-libclc-23.1.3       | NOK | https://autobuild.buildroot.org/results/bf5dbbf6063249fda3388c18a2954b6c310b2b87 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/91fca09916c0abc46efda14c6e842b4ca6c0b2d1 |     
  riscv64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/33d94579ac0bbd08256d1d0f4f2fcaa5ef93a01d |     
    i686     |    host-nodejs-src-22.23.2     | NOK | https://autobuild.buildroot.org/results/09dcdd30c549b556082a250c79a3447e49d25cbe |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/8f46a686168820a9e2d47d4855f718367be3ff5f |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/d1d33ac319f6fe3c99abfc55c9099308c69f33b4 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/79649b2d70bd7b29cf731a9e47008fbffbd87411 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/700bfb0f422e4bd8447ea8adc4f7f80980415799 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/5880d6ce9a7664b139bd2ecab63ed50201f93626 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/de1f11a4cec467989ff0519dacec98b350964c13 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/709ca9dc61cb6a0e8452fa84b70e0a6e38f6022b |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/c0593b101612f49ae332912d1f59e092b0e7c182 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/41cdbc7e10b97b8fb29a15afd1bafde9bf14fabb |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/8c83366d498f15f0a57aa0f5cfe967e23f51cd9c |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/281589d67fe02c7b14b9802d3c9af47af968f589 |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/ca6b1394f807d9fb1e830b029990c67e813a65dc |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/ccc400083a31e9c6130750ed2eecb801a54b9ce0 |     
   sparc     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/2e70806ec01f96c8c014fc67ba9682d047f57ca6 | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/2618420ae1eee9db3be85306144ad2f4b8ec532b | ORPH
  riscv64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/5f780a64909c7144e4804303617f28e5e02f0e34 | ORPH
    i686     |          i2pd-2.61.0           | NOK | https://autobuild.buildroot.org/results/d071247028921023981a80cc2fb6b4bce1d4a559 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/dd51feee2422ea0328959aa2926b81f44a7da193 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/63e4713ce3784d983e7a6954a60ec5c59dca2d6b |     
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b41a2f5068abfb27698d720850ebd4f3007c8c2a |     
    i686     |         ipmiutil-3.1.9         | NOK | https://autobuild.buildroot.org/results/358caf6999a7e0f356746abd4d971394dba54485 | ORPH
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/d3a98e029af3640a149a0de1b6e25dc0e9590f0b | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/dd3721f3cef305fc479038a5750544e1b6b69395 | ORPH
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/efef862f03229d43be434bde926288a2071c9ef4 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/246990f564f7e481568210d592e214cc9b629fec |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/fdaf5dcc8b8d017cc48a7b4d26b3ab54cdada067 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/058b46b047348cecc710f75a4bdfa1951fffd887 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/fb56de8977af174e1e5669b5aabcd824a453fad3 | ORPH
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/8d3f44644660a9a417b53ae756126a471223ffd6 | ORPH
    i686     | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/0459c9c1edaa6c0d650b02068abf7683ad3fbd22 |     
    arm      | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/d2053821a18696bbbbe0b215d60d6ef2930e4641 |     
    i686     |        libglib2-2.88.4         | NOK | https://autobuild.buildroot.org/results/603240ff33248f5b8e6044b44f7e82a4f97de553 |     
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/971602bf9109455309dda0e95dc8bb2ab7bbdd44 | ORPH
   sparc     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/94159235695163e9f0a9b3ba4e8da727b88c9512 |     
    arm      |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/6bc7179cae516b9d8f8d36639d7170c934c94c62 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/7d92f331c5fd15f23ff36ccb72c347443c8766ca |     
  sparc64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/1b62002ca4bda2c4590ff8d02928384700f70c5c |     
  riscv64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/0917966c0ffd999fd441396fe8a2949a463d4698 |     
loongarch64  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d2e772cac195c555f5445b63b1f0b845a5d0c685 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4de5a47946a5ef5fb1bc0beff7f2a467b19e5a26 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4d9b9adde7812058c1c7cf6458f37cba4421ffd9 |     
   s390x     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/e4e40dd37105893201dcfba3fd6de206104dfced |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a2b0c4ad7451f87995aa42ea7204afa47d62c1dd |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/45841f28cd45def04a19adf584f509e9f1949610 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/7d069b02d651e9c4a7c089e40b198dc1b3968312 |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9a82b1ccd21933e5d53105fff7e4307082d72290 |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d9d777f97e0ee4020a9add1cbd308377f23f8683 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a1b0d2acf3a0a75e9da5818350ac5e2cf941992d |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ca135d929779340b3dbd0e6ecf28489ed8ce36f6 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/90b552af01c38c5b8a8557a3d6482247f90db0e1 |     
    i686     |        libxmlrpc-r3341         | NOK | https://autobuild.buildroot.org/results/850483483f7d53e4a4a52a35a6f10e3ef99145be |     
   mipsel    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/f1486d1d6d4dc0a0b38b59f99ebc421807be9f2c |     
powerpc64le  |         linux-5.10.272         | NOK | https://autobuild.buildroot.org/results/3680594b31e599c66feb254dd5f8f4dccd6fa274 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5f1d943f6d9c499722e15e5fc70c2f545b308cd5 | ORPH
    arm      |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/34410d99dd84aa0d2206dffdc50ddfada0521777 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/87a04ea873747ae157561d26c5bb676c178dc0eb | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/75da8662f73b88f8304c8191a4e6c1dec25b5e31 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/0504e0566325423f56f8a69e9d592598c594696d |     
  riscv64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/1947f8e5f79bd7a0c1fb6b2bcb0ccd9bea514044 | ORPH
    i686     |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/62a65dda01f59eeecbfdfebb1f028a6426136bd9 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/cfe20489ef96805dab13806af672e0138e9eee7a |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/c00b1302a676b958e2099895829ded5742a4ab4b | ORPH
 powerpc64   |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/a15342c779a638e2ac8b9609dc3ead3e49514e63 |     
    i686     |         octave-11.1.0          | NOK | https://autobuild.buildroot.org/results/41927644926fbd3265809ed25ab3acdb76c270f0 |     
    i686     |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/1372289a6644cc819831dfd8f0feb6d03eb2cd20 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/f172244e930136c8b1d9f78782d56951b7059581 | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/c4346d79c992fb18532ddbdf093d11bbcdfc31b3 |     
    i586     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/52768d643592969fa6731860b561d9a61cba4964 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/e8e61de3dbed6650f0e3918fb8f906355e872426 |     
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/47350a92f560d6e1c6aeb56f8c682a9a76a4f371 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/4c357c9b7d8cfb1b5f765321d6201b704141b6bb |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/b74939967e1826e3e3c4a03c62997a99a9956062 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/e26dabdd3422ad7dfb1284e5eb11c6e651e7d73a |     
    i686     |            rtai-5.3            | NOK | https://autobuild.buildroot.org/results/bbe95eada855ee9add13478ffe5e7f8bdcdabf55 | ORPH
  riscv64    |           runc-1.3.6           | NOK | https://autobuild.buildroot.org/results/6181acbd7b7265a1f23b4f50c954a98668c2e9fa |     
  riscv64    |           runc-1.3.6           | NOK | https://autobuild.buildroot.org/results/9a18ff7601ab8c9d7ba893ec90075ba261c644de |     
    arm      |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/2eef23f6779bfde20adfa279b606af878940959b |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/662d65013d37c2ebbcafdfe269abc65150892bd0 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/400842335cd86d9621baa131605ab7ac1822c47c |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/49c69394b5f906f796e2bfda9fd6bbefe47bd28f |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/17e8efcff942f09c7e54113e0f709c5882d1ecf1 |     
   x86_64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/89a962dbb096add7bd0b2ddbcace48c1eb87b179 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/1d66bc44d8685ecaa6de7552b4b9e333ef9ede88 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a254660525018018b388ed067de41cfc6e2c531c |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/0a3835af6e5b9bb12141c037d1841f6da300d650 | ORPH
  aarch64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/50acd8b732e3105c8c47c8aac4e56e7ba7640b62 | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/15727ca29b620d4150174ee09bd0adc30718b7d0 | ORPH
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/0014f55ac93ce23627f8620b3d8d4ac048e52fb6 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/06aa3f20cb89293b96d67d3333d18c626d280163 | ORPH
    i586     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/1a49b091f24414c5c16f2f25d41adf2cc3e6c3b0 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/48d61739dac2f3c8f94c79307c5d11b79132828a |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/70109381de3252cc614e473a24028fe1d39ec70f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9dd62bcb0ff7b11411e607a75122007f8bd5de2a |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/463559169271a64a9481b81b919f44ff88db0508 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b9d6cb125e640ef576368c8c8126bf835041b510 |     
    i686     |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/13c3d4b72c997db3cded2b8849dbaa753ebc6983 |     
    i686     |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/f07f2866cb791d2a1a488bde87ed89c26ddcf8f6 | ORPH
    i686     |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/f7f9af0e277a145fe8a25be722234b3cd6e71d19 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              erlang-26.2.5.21 | 1 
               libepoxy-1.5.10 | 1 
                  newt-0.52.25 | 1 
                       unknown | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/6b393c1d7ee248a40bcd5deee096ad09f311765d |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/a3824fd243380bb8a7acd6cb34d4bfb56a867c8a |     
   x86_64    |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/85b0b8012b7557b9a423035f1800a8aaba6f4463 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/40a9e2d77287969278917991d910b54f6a2a9638 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 3 
  gobject-introspection-1.84.0 | 1 
           gumbo-parser-0.13.2 | 1 
           synergy-2.0.12-beta | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/24215543cad0942aa5d740bf0ba1c187980285f0 | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/3d8bf55eea23815b98ce8de5b949f3f7bd3c9324 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/c2b75fa935e1e8e937a627a624f4270698d6f111 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/0531bd03ed62e4e249c8b899970eafa6a90f108f |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/a7567012c78ade5d5ad908e683d123f6909d2151 |     
    i686     |      synergy-2.0.12-beta       | NOK | https://autobuild.buildroot.org/results/67bd8eb4aac83ee1efeeecb7e7f168f6689354a4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

      docker-cli-buildx-0.16.1 | 1 
        ltp-testsuite-20250130 | 1 
               openblas-0.3.30 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/63bdaad8e078db193ae44152c19072cddd7614d3 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/fc35533f701a2b864f614a5223f2f5fda254a5d8 |     
  riscv64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/48c117ca31a76032bb95a012cd02593692c2f656 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
