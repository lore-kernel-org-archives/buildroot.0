Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C50606A33F
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 04:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KRfRfPBo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zn3XKvUM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED93B8104C;
	Tue, 10 Nov 2026 04:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZxm_RXVZNSS; Tue, 10 Nov 2026 04:24:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 157858101D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794284676;
	b=cEtcGDwucb8F1KsmkuUShF4buoRW9Q+KLY+hjXU0AsM2HOTuOJ3NtGcGGNeEtEvuBjhE
	 jdW9x9iu+Z5vnfy1DX/PUSR/j4HSAG9y/Nre7baptzYGx+p0U5qz3dnWdXhe7GftfCKD0
	 CXAAm44p3YMz2NNmh6DGcfSbT5BGBzf6Vrv5VGNrdyoYuMkQbb73GQ4mQgleearWipLj7
	 WLm37kSbURamQ9QUYTsKEwfPDgz3UU+RBu91zm+XB5Npw7O6HcaHnRocmBTUoq3MSXuZ0
	 /l3Jusk9ViZ2PD3l8QcyGVzAwBwV81aeukrnwHL3adpFrW4Qphi5lJ8NJ+iLxIr9N9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794284676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=USVVHSb0R3ZFDrbPwwo5plsBLwQsQPbAZib+NQ9V3qY=;
	b=JKDzF/81taXk/9C/07cP4xN2UpjRpBokKanEijcDj7U+jNjpiDi8zX8zYVMlQVGQ4jAK
	 AzrejOnkMQQ/IvYCY/fdQbIhomcN4nYu5N5TuIMf8vvbD/54QdZERTu2KHArzQAilCK2l
	 I3JewGNMNS0kj3HMGOkpNXSFZtnnhSSaLgDxsV3BuGj3lr4GCy2fIO3tz5hZOnofkJk8X
	 zH9lU17xatjYuFzZ6ipYXNv7Lj4sMTjvUtsXdD3+8YSbnHRECf5z+IhiMvW94ZqFygG6t
	 jKcMwVwk06QJ/Ull4/qRhRLBtm6enBJSxpkmW68iR0Q7pM88CBPmiwyZeJ4JqTblj/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794284676;
	bh=USVVHSb0R3ZFDrbPwwo5plsBLwQsQPbAZib+NQ9V3qY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KRfRfPBoVkYLHQkRmd1G0r9WMLKf/mAT/KxNiIMHdx4SgfRIGK5HZ5vcRnfbmGwfk
	 1I9U3+KX4oxe3W+h4coV7DCf9EfqnJJR462ZjUfaGQNpxkkn+dq83LrzRAOMOAEuvL
	 X6Vrg1W1XK8UTFgUOzp80TsNDKAVfC46Zig2bqPiCFrb+bK0Lup9xd7I/JFMeye+h9
	 SvDs9C+zuNVhJwxq83ONn3hbc442F85ln84k6nMb00e9TF9Dww4u8p2RQ8epiNiEQ2
	 S5ZwI867kObGEA24iLRpHNNkV4cxHqWGUgxDMckFCKhPYD1a5abQohlm32tHB0nkRI
	 qXoBRKN5sC67g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 157858101D;
	Tue, 10 Nov 2026 04:24:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00DFA31F
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 04:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E69B3607FC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 04:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7VOr66VMETZ for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 04:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 897926069A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Zn3XKvUM
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 897926069A
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 04:24:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so13200515e9.2
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 20:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794284669; x=1794889469; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fLIiDN6RuT07TbXiI1WBzF6QL6fTRoEJtEAIBY9UWsU=;
 b=Zn3XKvUM7xCi5co3JTG0S9wGqTYqNKcjFkYGSyAUJLr1eLroqH1E+EeWIjIWfUEZbW
 Tt7wqIYhC/fx8NYME8fc/UN88RzFHmoLTnYVWnlHSBVpTtmNpS0K9aeDuyIswCHeXxd9
 FPLwlfVAbHPicccORz541lNav73tuU+FHQkFyfXTgTjLELQLEHsVr4k8QS7FuRoS1Cyj
 xb8P2kAknyM7aig7MTlb8HrDHw/QK1ruaPH6wxQ+5aEpbhkP/13OtQ3x2wcDbVC+PhKW
 46v7T8W28yAAMJ6fKqFECQCIkqyxIM9iY2wX/zlICIMWfY+klfELYGw9sOtdekWHBVO5
 5kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794284669; x=1794889469;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fLIiDN6RuT07TbXiI1WBzF6QL6fTRoEJtEAIBY9UWsU=;
 b=BLDfO41ecDQyXxu+fs4g2uvg5lONW9ipHLWodSqIkDZ9U4uvvXnoT+PaMpq+vu+KFv
 gD4thsB20+PGGLW21saFMePeQ+9jPpuIzwQokvgdRxM2KZFUvUwSiMtUYNE4hnAecxn4
 sDvBl3SX7+Os3/f/rp/ybTiVQn8OFOLNfc/kL3/zqzPCzYgwswiLANUCQbHRK+djiKm5
 k8sH0KfAW+vdkqLmkYzMJSeI7YpiJzFr1VwX22dpJJIe60UH5tmtrXs1WUG3MSNCqVVp
 OVCk3yXM04FCnte5/4qQiuNuMqtWajHv2TPdpkJYcXRqXEXjIxEHQEbQqH7XNKqU2sJT
 iuMA==
X-Gm-Message-State: APuU4Z84vLuXEE0by9NPRIFmaA5fxH1DQrnlTC2/FdUIYIaS3s/Q4lPO
 b0QmrrrmOP6r1l4JBzFaJroxAgNbuTu0/njQEaAtPoxd3Nh9T8tz50A0Z9m6PRqd
X-Gm-Gg: AYBFou2aUJbM+pfvffoMHXDGBlLQ8nF6tDpPl6AWCa2R/q3K0FpMo9JF6sRdSi/W2m/
 qFH/GOi4ftoPj2G/yV4dkY7ci2LjTo3BdHViriXcQRsKC/2aRt2tdVpKRTPgJbXC45bg2jUgWSW
 0NgFVIXyDFBuj+xCZModqxLBocsbL295YlohXKjqFHhvpbnaDdxQrBtRH6oNG77miVbyZMWvmGx
 Jdu76r0y5BfkPei7uXmWhzYgMg8rcWTMR0WF99XqXUeNuY9tW7IJsmhEHJtSOdtcTPsqJDrsSCZ
 atdYjYW0CZYbh6iOO5Earh9ZJEEUffFicHLQgJz1klHg6xrgHScOcK7hyxz3KTIQpHoD+LPsF0c
 uYzvPpmF+XVc8UlaM2uuw8Al39MRxGP3QDqh8/nsQ+hb6qbToxaUwADKzVlHeOVcdlIbhrWcrS7
 ZRtIFwWmZWAOEReCweG7emrpYHD/b9YbZ053Al9R0oG/SozWLJ1QVOzX4rh7k9uDGZDMC9OjXu5
 GuDFSv4VrgxAz7EECaAGwLi6pvR0iYA9ZUW7buR3R5stYJlyE+PEBBaktke9fC/WHCyR3Rgtzdc
 Moj5297wTkBpytcK5QbY5vdL55Pm2BcV
X-Received: by 2002:a05:600c:a03:b0:4a5:e6fd:65e5 with SMTP id
 5b1f17b1804b1-4ba02350f2amr17811015e9.31.1794284668704; 
 Mon, 09 Nov 2026 20:24:28 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba02387ed4sm22583895e9.4.2026.11.09.20.24.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 20:24:28 -0800 (PST)
Message-ID: <6af29c7c.63afbf66.5598d.04dd@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 10 Nov 2026 04:24:28 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-09
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-11-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 17  |  0  | 25  |
  2026.05.x  |  2  |  5  |  0  |  7  |
  2026.08.x  |  4  |  3  |  0  |  7  |
    master   | 59  | 148 |  3  | 210 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 20
                    attr-2.6.0 | 4 
             fswebcam-20200725 | 4 
host-am335x-pru-package-5f3... | 4 
                      mksh-59c | 4 
                   perl-5.42.3 | 4 
      host-uboot-tools-2026.07 | 3 
libesmtp-v1.1.0-14-g335ee8d... | 3 
               linux-pam-1.7.2 | 3 
               tcf-agent-1.8.0 | 3 
                  xxhash-0.8.4 | 3 
             dahdi-linux-3.3.0 | 2 
                 glibmm-2.76.0 | 2 
             glibmm2_66-2.66.8 | 2 
    host-mender-artifact-4.4.2 | 2 
                     host-rust | 2 
            igd2-for-linux-2.2 | 2 
             open62541-v1.5.10 | 2 
                  prboom-2.5.0 | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
                 systemd-262.2 | 2 
               acpica-20260930 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                   atop-2.13.0 | 1 
                   babeld-1.14 | 1 
                 binutils-2.47 | 1 
                   bird-2.15.1 | 1 
                  boinc-8.2.11 | 1 
                bpftool-v7.5.0 | 1 
                        chawan | 1 
                  chawan-0.5.1 | 1 
         cloudflared-2026.10.4 | 1 
              containerd-2.3.7 | 1 
                  dhcpdump-1.9 | 1 
                  dpdk-25.11.2 | 1 
        edk2-edk2-stable202608 | 1 
                  eudev-3.2.15 | 1 
                      fastd-23 | 1 
                  ffmpeg-9.0.2 | 1 
                      gd-2.3.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
               harfbuzz-15.0.0 | 1 
             host-asn1c-0.9.28 | 1 
host-google-breakpad-f49c2f... | 1 
            host-mfgtools-0.02 | 1 
               host-nim-2.2.12 | 1 
                host-odb-2.4.0 | 1 
              host-rust-1.99.1 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
                    htop-3.5.1 | 1 
                  hwloc-2.12.2 | 1 
                  jasper-4.2.9 | 1 
                 lcdproc-0.5.9 | 1 
                  libbpf-1.6.2 | 1 
               libdvbcsa-1.1.0 | 1 
               libecoli-0.11.3 | 1 
             libfribidi-1.0.18 | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.90.1 | 1 
            libnetconf2-3.7.10 | 1 
                    libopenssl | 1 
           libwebsockets-5.1.0 | 1 
                 linux-6.1.192 | 1 
          linux-6.12.114-cip34 | 1 
                 linux-6.6.162 | 1 
                   linux-tools | 1 
                   lmdb-0.9.35 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
               mosquitto-2.1.2 | 1 
                    mraa-2.2.0 | 1 
                     mtd-2.3.1 | 1 
                  mupdf-1.23.9 | 1 
                    musl-1.2.6 | 1 
                  ndisc6-1.0.7 | 1 
                    ne10-1.2.1 | 1 
                 nethogs-0.8.8 | 1 
                 openmpi-4.1.8 | 1 
                    opus-1.6.1 | 1 
                p11-kit-0.26.5 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                    pppd-2.5.5 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                rdma-core-62.0 | 1 
                    rpm-4.18.1 | 1 
rtl8723ds-122a574f780da32bb... | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
                    sbctl-0.18 | 1 
              skalibs-2.14.3.0 | 1 
              syslog-ng-4.12.0 | 1 
                  tllist-1.1.0 | 1 
        udev-gentoo-scripts-33 | 1 
          usb_modeswitch-2.6.2 | 1 
            vorbis-tools-1.4.3 | 1 
                    which-2.23 | 1 
                     yq-4.49.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20260930         | NOK | https://autobuild.buildroot.org/results/014241256f3b6e21425323f19198229cc89a23df | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/4c6d84f40ed53b47faf6c87cf3b27c4f0b7f7a84 | ORPH
powerpc64le  |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/c0f30403b7efbde10e2f0918b7580cd381e33966 |     
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/029631db79d29b59aff1094e672cce9aabaa01c5 |     
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/f0a625f2c6a6ebd037c28b932c26dba619b79449 |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/0240cc56eb49cd20bf2d786f75e7818c073f9958 |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/160ef1a1b8d6a41a33cef6bb69502ff89a5cfeb8 |     
  riscv64    |          babeld-1.14           | NOK | https://autobuild.buildroot.org/results/a8392ecc1daca90767c507f0cc54b7ec94d60c70 |     
    arm      |         binutils-2.47          | NOK | https://autobuild.buildroot.org/results/ee94fc7c8d5d76a8f359ee35fb03bc6dfc82986c |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/52f0264b0cd8fa1ea4a3306c0b39dada2a321d37 |     
  aarch64    |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/17b09033af448c90df4bcb88dd3a50cf5d1d3e56 |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/7ab9d35e216f20c09b4880a85c083d77021870df |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/7f6b31f14297b7e58f93af3144b20d0ef81e30c8 |     
    arm      |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/3adad72fc9458df710e38883d89b7ced32af8996 |     
    i686     |     cloudflared-2026.10.4      | NOK | https://autobuild.buildroot.org/results/ca142b65f8e6347f2dd11ae8fb4ac54c4b79d6fc |     
    i686     |        containerd-2.3.7        | NOK | https://autobuild.buildroot.org/results/db134b0344d3b9ccacbcf13bf42ef16924043f3b |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/afc6cc2b58fbb514ca3f6a7fe446db8db42957e7 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/06bfdd76966185c57b6c8f4a5fcc470c2caf4cc8 | ORPH
    arm      |          dhcpdump-1.9          | NOK | https://autobuild.buildroot.org/results/019fd9fd6dee2f2a30c7959e5879fc178380cb7f | ORPH
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/106a9fc2ed9b90e05f5ae9ed98e6b1427347da5a |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/d2d89e3d276d766002384312b8d3b01067fe485d |     
powerpc64le  |          eudev-3.2.15          | NOK | https://autobuild.buildroot.org/results/bd99257c2c54e3e005eb6902c6d5459105060c52 |     
   x86_64    |            fastd-23            | NOK | https://autobuild.buildroot.org/results/2f70f1566c166faa25595e153b011bc27a944ceb |     
    i686     |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/03ac3f61f24bcdd3b28e0023c4fdafa23789ff47 |     
powerpc64le  |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/0eb112cb0e583032632892163e849339c50abda8 |     
   x86_64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/dc46bf29878dd26027c1061bf5ffa84ef4436df1 |     
  aarch64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/62c37f004eae6b1db754cc9377e2f6011d99f2a6 |     
powerpc64le  |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/1daff63434eabd8e479714832ddb4b64432a4eb9 |     
 aarch64_be  |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/d72061484d9e5226893835974e803fa086d98177 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/72aac4d75cd75ab20c2d64522771a4ba26dddda6 | ORPH
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/8de2dca3bbe89d061f9af825b257418e8c772092 |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/c04236296f0b21ea87b0c53e4ecba520ad395b2a |     
    i686     |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/d4fe87be81f68899b942891cc272f6dc76cbaad3 |     
  mips64el   |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/70e359ab49b0c688184c110882b48c96c349f368 |     
  aarch64    |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/45e9f0c6668dd24df30bd89b94a9a0aa4eb9941a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/2eca84936e64d5823327de4bae1a99dd4196a742 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/48c5b4107f840ff7d4a715887de647807559b137 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/47e3b1222fe39d72942eba6a8f90b25e4360b4dd |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/b22e4330da320866b4295abaa532f83166b3655d |     
    m68k     |       host-asn1c-0.9.28        | NOK | https://autobuild.buildroot.org/results/6cd7132af5001a01f45af0863b3c08ed5853e7e6 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/a7cc7522e4d3c28967b06918b1a927104d1acafb |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/2816e52d69bf50248d184ea4304e4b603bec8e01 |     
    i686     |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/d410e59e3b256efbe0987dde0b7bd80a5114c6e9 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/070e919275de988bad551336420024b0f78035fe |     
    mips     |        host-nim-2.2.12         | NOK | https://autobuild.buildroot.org/results/5511fa302033f5d315aace2376e8eb0fb90e61f1 |     
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6004e2df8459ca639769531cbfa6ac9f1de52daf | ORPH
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/3d693ae53275f51ef41d55be4941a0948893d061 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/da0ecfd0854d62fedaca96f111ad6d32c2ad050b |     
  aarch64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/b1cb5646111f0b90ef1e0b53b264001c69d0100e |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/69cf32dc75575fb3d03fc3a1c39475fc67c531ef |     
   x86_64    |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/3e665a9b0496a45576e2c3ba31342d6d1b5cec9f | ORPH
  mips64el   |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/764e0a2bd474e5315e5716cc916c5d6cff1e139c | ORPH
powerpc64le  |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/1fbdb97d50b44ef16640a466ca45b4490915ffd0 | ORPH
  mips64el   |           htop-3.5.1           | NOK | https://autobuild.buildroot.org/results/202838a38f232d35811477a277f0953187b233fb |     
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/15135818430824563b8e7298898a8167bb39f1f7 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/e9e86ab26578a002fd01ab7149689bf49f86fc17 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/90e1d97120e374acbb0aeef3bd186763f6e62563 |     
powerpc64le  |          jasper-4.2.9          | NOK | https://autobuild.buildroot.org/results/79204a1cb79b354924dbdaf0878c27742c9554b3 |     
  aarch64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/cd93cd250b7206240a1df325b472cd61440b556b | ORPH
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/ce83dc868477847ba07e3d096c97714dc1ac94d8 |     
  aarch64    |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/8519c7d7db725560196689c452f1662a7fab146e |     
  mips64el   |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/a0a7e17f1a76588932a8a7f8db35a832d540cc69 |     
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/176144a77c8b0659929aaf32185fd2ab84f3e566 | ORPH
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/ece722bf8162082ddd70d6cc51f868ef9382f6a0 | ORPH
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/ff1f9f37ac3e3265e7ac371af4f707d689e3ed63 | ORPH
  mips64el   |       libfribidi-1.0.18        | NOK | https://autobuild.buildroot.org/results/029ee2c10c472cb92b5c898c6ffdf18b5c807c9e |     
    or1k     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/2b5eea2b53717aaa5b57e9e722f551befb9be855 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/3fa414b6ac856afc7d35cc6e041dbe363ec0c76c |     
  mips64el   |       libnetconf2-3.7.10       | NOK | https://autobuild.buildroot.org/results/b510a7f80cbe639845459c0a052fe585fd0130b1 |     
  mips64el   |           libopenssl           | TIM | https://autobuild.buildroot.org/results/83d875c41c888a7d5081941a5afaf862028a3e14 |     
  mips64el   |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/b40f516d0b425fee2a69ebc3c8d4f0a612cee1cb |     
   x86_64    |         linux-6.1.192          | NOK | https://autobuild.buildroot.org/results/ef07034aa83dea03f54ab6268afad87e5e5273eb | ORPH
   mipsel    |      linux-6.12.114-cip34      | NOK | https://autobuild.buildroot.org/results/9492d236debe665a7f9e5e901567d9dd9b2a2eb6 | ORPH
   x86_64    |         linux-6.6.162          | NOK | https://autobuild.buildroot.org/results/82f771ed879acdc7abb8b10999152a53cd2f75a0 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/ebb0e01b096af33f002eeffdb98639dc9cf82aa0 | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/19bb1dda71965498f74dd75c07db9e2712b5e348 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a3cd64baf3e372107067ba1b752eed07673c594a | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b2b0131b8707cd132517d8fd6ea498f3a3c8af33 | ORPH
    arm      |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/e039717ba66d82d2fd1ca8ee3e6d76fd8ffcc0c6 | ORPH
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/7138b55c49f1f6520cefe298d6d7d51359283215 |     
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/0faf53f094ea505272ab1d999ead8c751719c0c6 | ORPH
   x86_64    |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/eefde4c8f3d570d89c54c27dd35654f0d22cd99b |     
powerpc64le  |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/57f580379edb62603353b1713d66b13bdcecf5d9 |     
  mips64el   |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/99a4ad8fe2e95f4c522c1f60541ea156a8fcf950 |     
    arm      |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/3820982458684aa21141541088ac7794de62a73c |     
    i686     |        mosquitto-2.1.2         | NOK | https://autobuild.buildroot.org/results/5639fa021c6327abc623e7c7f995ed812509b0eb |     
  aarch64    |           mraa-2.2.0           | NOK | https://autobuild.buildroot.org/results/11e3a8f12b52198c2060e280af06620e78571003 |     
  aarch64    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/9735901db302143eeb3858eb2b7f69e01b9688d7 |     
    i686     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/f4eff3b382fe449602b4724af53b7a25dd3652b5 |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/5f3df3b8df0577db31d215aa1255090d1667fc50 |     
  aarch64    |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/ed39f24abe06c2737386fb591b89ae258c16d69f | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/1064ce1d1520c4feda68606be8948e6ca192e473 |     
  aarch64    |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/8f975abdb9fea5d6bed0d8cc34c219ffbb5c2ea0 |     
    arm      |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/6e3831cfdcb91204d0dde2d4ef96a258cbc002e4 | ORPH
    mips     |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/ffecc311aa2c434582827491e4a2ae215ced5b9f | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/07f1f74060cdd1f444d6a16b4a97639f5f5494c5 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/25c8fbf1f1714a17a0dac3174e3ee732384c1980 |     
  aarch64    |         p11-kit-0.26.5         | NOK | https://autobuild.buildroot.org/results/1e69cfb7cfaea6385b2f02432687bb9023f667cc | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/9df817371fe306487253a9d173c2b575bb8f8461 |     
 aarch64_be  |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/00583ad16f54b8a86813d1301b810aa8d0132e15 | ORPH
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f36fa344a6b4d62d2fe7eeb86bd59ab10fb7cc65 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/2ea616c1f8939ebb6d11349b617f43c076ece4d2 |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/e7952bd442d4e55e8967939bf81e8f01631b3e45 |     
loongarch64  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f55a3778fddebc24a61168aca9252db7c7d46591 |     
  mips64el   |           pppd-2.5.5           | NOK | https://autobuild.buildroot.org/results/76bb5f41e08a1ffdaf81802bede1b2e0c771ba5b |     
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/855bb27f3d7e3057d996a5a4003a0d0686810984 | ORPH
   mips64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/807c4950df761fd569dda0a7dc5ff497d219a189 | ORPH
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/f1f070bc5ac72d8b0f2ed403273635b7459a9ae5 |     
  mips64el   |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/2b86409c9f0e1e335ae6c3baf816c80e4c357906 |     
   x86_64    |           rpm-4.18.1           | NOK | https://autobuild.buildroot.org/results/9691359518edb0081e268ac71a575b4a5503001e |     
powerpc64le  | rtl8723ds-122a574f780da32bb... | NOK | https://autobuild.buildroot.org/results/7bdebd44f8a477ef3c51e20432faf1939389fd57 |     
powerpc64le  | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/39a2c3e5a3303b514f4f90027db40bfcb8d16f2e |     
  aarch64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/4d1c0e3bfeb841bc207f2cb53ac65fad4dc11ba0 |     
powerpc64le  | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/eded40adf62d397cfd417a3da113b0b20a925867 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/277a46bf74de0b7b7c7271bfdb1bb1add85367ec | ORPH
powerpc64le  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/ae29aebc72f85fc5fc2fad7a52861e762f60240f |     
  mips64el   |        syslog-ng-4.12.0        | NOK | https://autobuild.buildroot.org/results/3be9569c7cf5b7f49028c2bf10c50cb21f901e7f |     
    i686     |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/dab4f341f809d44838fdc93b5f1c101dcd330905 |     
  aarch64    |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/dfd4e2c44ad24d09d09ede194e08437d6a733178 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9e7805825eb38fa0559256a66dd43211bc80404f |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b9cc2db59b8caba9f20aea45d7da0538b6f19263 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7b008e54bceda37cd5a3c4a9de72b868c2cc6826 |     
  aarch64    |          tllist-1.1.0          | NOK | https://autobuild.buildroot.org/results/21b79dcbf4c76ff2ce2e284f13483ce649cdc954 | ORPH
powerpc64le  |     udev-gentoo-scripts-33     | NOK | https://autobuild.buildroot.org/results/dd672923e1291fcef584d4d1e8953d6bb15493a8 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/0a430a396800311572c65426637aaf5bc3563534 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/221734538cd4d76a8bf3d57e699ed11e592b60d4 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/dd551473fee86aeab4828703d46722f42b10d583 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/ee00ee82f4fe20db9fb47ae8e1886cd57c3d5e30 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/14f6e740e785a967a4d7bfcb7bca56340f2e6aa0 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/77cd9dd3286299628f0ed38d9dea2ef9c94c78a1 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7f5020acd21cebada4aa68fbeec0c4b73ff7036a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/efc2a89bbdf57d478c7b58c59d5aa13bad0168ce |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5f234698cd22add23a5088ec4ba0feca29061d8f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f3fd492d47c666d235768cc113dddbb303c39eb7 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/e2aaed3b1e7daa12f886604e47697e57a3a6a3ce |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5697621ed8e0dd1b35ba00d09c2e6770b3e3fc1d |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/9319f04a0fcc15315580979eed9eee2ed458d56d |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3abf2d796deb4020609cbfebe508f3c9c85534ba |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c03b0c5af383f36fcb27126cf476943f98f4f270 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/dd99dc3ddcb752e3fd06ce5f610aacde2e814beb |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3b1fd3b31774cfbe43f831eef4c5ae154c951620 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/68effdfcce361e6ab91af7882a1cb8e6ffe09242 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7176d8e7161bd6e7038e5de7afc2e2d6eb97c4b4 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/900bf2c570d06228b8c26664da9a06d8bbbbd844 |     
  mips64el   |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/7080ceec88adfc9b236f2299519be56e3dae8baa | ORPH
  mips64el   |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/ea9d82fa7b9199f3ff617b849e30e47228a0392e | ORPH
  aarch64    |           which-2.23           | NOK | https://autobuild.buildroot.org/results/ffd59212b7b7908c0de63ee1a48fb0891dcca181 | ORPH
   x86_64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/6c67419082900ec83efc168a3b1060650af2ec8c | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/499538359d1a2dcb62691a08da4e57ec0331aeec | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/db16b13d0b2017241cd45c6929258538cb2e1191 | ORPH
    i686     |           yq-4.49.2            | NOK | https://autobuild.buildroot.org/results/ca234574c596984beea3d5923db041e61471f5ef |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                  boinc-8.2.11 | 1 
             dahdi-linux-3.3.0 | 1 
               linux-pam-1.7.2 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/978b5066bdc9b39e41f8110f3aedcf44c65a161c |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3665fec4c803d50ed60b020b6a1f1a4d791129b9 | ORPH
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a5cf6209013b3e55a4e59b67fe3b1325f5383c89 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 1 
                   perl-5.42.3 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3ccb05b06e6a0d31af9da2faf9818881ec78f7cb | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/72aef8f4899bd5d9d94bc4802a2379468eef1e70 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/b3d056c9862cc5c371b16296f83bad36065cf60d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5f9498b017ff12d52d6e24f6f2bfaf8c5ffc084f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/396e04bfbee89742b37a7b2f7b4c0241d6e0643b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.5 | 2 
                bpftool-v7.1.0 | 1 
                  eudev-3.2.14 | 1 
        host-python-lxml-5.3.0 | 1 
            host-skopeo-1.18.0 | 1 
                lesstif-0.95.2 | 1 
         libhdhomerun-20210624 | 1 
                libsoup3-3.6.6 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250130 | 1 
            lttng-tools-2.13.8 | 1 
                    polkit-125 | 1 
    python-cryptography-44.0.1 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                   uhd-4.7.0.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/98b344d97c9cf70bb80c619815c37c04d7aca83e |     
    i686     |          eudev-3.2.14          | NOK | https://autobuild.buildroot.org/results/23eff0ff7b51a4eba726f78c5b0feff5d4f1a436 |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/1da70b88b2c090b91df967d901afbfb712644f32 |     
   arceb     |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/653390f789ac2fd35b05ee18c670a71c87154def |     
  mips64el   |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/610c9fa0bbc34e09f02095fe4c7ec15e6c32d0d3 |     
  aarch64    |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/2627681c8ff2a224dd427072fc08206a7a549a15 |     
    mips     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/12d1e2ea3f5ac4c2b6c8bbd7e2fed2560a411455 |     
powerpc64le  |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/78ffdcdf7c4d73c17c9762ff2e10a938c87d2453 |     
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/e7708c65d1375233d4db71c7d40c3e9d01fe5c25 |     
   x86_64    |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/0a3e4a24fc982260557e2da7627cd27a9fb0fccd |     
  mips64el   |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/c4a1e774dfa24cba134123f089ae0da7c990f616 |     
   arceb     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/c983122729a8ac65a325f91c83b38a246ff17264 |     
  mips64el   |           polkit-125           | NOK | https://autobuild.buildroot.org/results/b71a81e4e5bcb1c59e1d02148911597fbdce3c4d |     
    i686     |   python-cryptography-44.0.1   | NOK | https://autobuild.buildroot.org/results/54d91ac182ca19d26993858d5abcd7d4be4f4989 |     
   arceb     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/50c7e58af66e5d16aae222d73568649453698b02 |     
   x86_64    |          uhd-4.7.0.0           | NOK | https://autobuild.buildroot.org/results/4c91d25a9adbc227d5f0f37cd1c6e2398cbed612 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/b32a1af1e34adbaba2cb2ab17602155c7205595b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
