Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C59DC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 07:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608FD607F6;
	Mon, 19 Aug 2024 07:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DixMouclimNI; Mon, 19 Aug 2024 07:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA99F607D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA99F607D7;
	Mon, 19 Aug 2024 07:44:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6217E1BF4D6
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 03:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51F4060619
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 03:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mqtbsPiy_kY for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 03:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5ED6460035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED6460035
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ED6460035
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 03:18:21 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso410912966b.1
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 20:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724037499; x=1724642299;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oSkegl6SS+A4R45SsZJh4R6UljMF8/G1W9YheX0xAPc=;
 b=nKEEgss9zb5ImMpNaDG9wGBSWjel/CI9PnHRrvwKVH7bWZeyNOim8A/Flq5HuEKmNU
 xVW3FKjRrzb0/CJ94yTO7LNb6f3+KvEWmeaO9YFEeieFdESzgCzooHT/sAONawpuZeSU
 TtpmprpEeWsZWMNrCZ/Ac/5I7JUYlEm4Fy0kV9b6rIfBrXjaKbMlgjYVx7WsF8TtWXwq
 Fo9xIRfiINtzpNtjYsjHvRMMkpNpsIH7Y85cEza15E8DUffa/WDdJVoppWBxB9lVMoJs
 feG3oqBbmNRy+iWJWBkffgooeZCDNV8lLf0sTPhBvB48igZG8IqxVCLqQv6HiaIQ/fm8
 yUMA==
X-Gm-Message-State: AOJu0YzX6BTWIW1DW8e5KlT26S+AMsnm+MnvurFljMoCyF2O8r6Qxde5
 nndhWPVROv0QEcE75FUfTrJr/xTVpIC/S5YqfwqRx6o15fHhuIYfvZFySdUH
X-Google-Smtp-Source: AGHT+IGdeUVVddZVF+5lwbK1toF4U9fDPhV4LhW8yukpG0hpLe72JjJ+bywHhSfICLPMQDP9E9G2YQ==
X-Received: by 2002:a17:907:e201:b0:a7a:bb54:c858 with SMTP id
 a640c23a62f3a-a839292f6e7mr731731066b.26.1724037497702; 
 Sun, 18 Aug 2024 20:18:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838394669esm587831466b.143.2024.08.18.20.18.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 20:18:17 -0700 (PDT)
Message-ID: <66c2b979.170a0220.12fee2.2292@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 19 Aug 2024 03:18:16 -0000
X-Mailman-Approved-At: Mon, 19 Aug 2024 07:44:32 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724037499; x=1724642299; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oSkegl6SS+A4R45SsZJh4R6UljMF8/G1W9YheX0xAPc=;
 b=AtDish64vBIrN6VJglKHeUl6U7Z+wUOTXxVd7gdoxL69rx7ywul4hS8XPsvLPlBP2E
 cHyU9dNOYXQTY0LX6ipZX/tSYBAw45v6ZGL4Rx4fboBNxur8M0ZOHn93AYSybhDqFBXl
 pws+XaqeH6ri//OwF4K1UlPYvl6t1o4aHb1kx4SXiUddGj7QO14I1Ay6n2CXIIrdc4Py
 ydb66iZq6Q9xl5enH3FvrnZbYQMAoHISOxGRZB+KHnm4J/Zwr8j8/7fRQssObaRNuwmH
 gGnbFsItMc4jRcSEjfzz4mlMeyWoBneysJDdUveXSIC8buR1MZ+cRiNq0KvRjxuJFMUx
 N1fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AtDish64
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-18
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2024-08-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 19  | 17  |  0  | 36  |
  2024.05.x  | 22  | 14  |  0  | 36  |
    master   | 33  | 48  |  3  | 84  |
     next    | 17  | 31  |  2  | 50  |

Classification of failures by reason for master
-----------------------------------------------

         gobject-introspection | 3 
host-vboot-utils-4b12d392e5... | 3 
                  mender-3.4.0 | 3 
                       unknown | 3 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.79.0 | 2 
 host-softether-4.30-9700-beta | 2 
                  linux-6.10.3 | 2 
           python-daemon-3.0.1 | 2 
                     avahi-0.8 | 1 
                   botan-3.3.0 | 1 
               collectd-5.12.0 | 1 
                   foot-1.16.2 | 1 
                      gdb-14.2 | 1 
                gerbera-1.12.1 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                gnu-efi-3.0.18 | 1 
                  gnutls-3.8.6 | 1 
             gtkiostream-1.8.0 | 1 
                 hddtemp-0.4.3 | 1 
host-go-bootstrap-stage1-1.... | 1 
            host-skopeo-1.13.3 | 1 
               ipmitool-1_8_19 | 1 
      libabseil-cpp-20230802.1 | 1 
                  libnss-3.103 | 1 
                liboauth-1.0.3 | 1 
                 libp11-0.4.12 | 1 
                libressl-3.9.2 | 1 
                 libssh-0.10.6 | 1 
                  libva-2.22.0 | 1 
                    ncmpc-0.49 | 1 
                nushell-0.85.0 | 1 
      python-autocommand-2.2.2 | 1 
            python-scapy-2.5.0 | 1 
             stress-ng-0.17.07 | 1 
             strongswan-5.9.13 | 1 
                 tbtools-0.4.1 | 1 
                   trinity-1.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.org/results/87575b8a69c5cd41e0b7417c7af42e186e88a65e | ORPH
  riscv64    |          botan-3.3.0           | NOK | http://autobuild.buildroot.org/results/205d7505803990508bbd545393902789063ababd | ORPH
  mips64el   |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/05d1998064ec9e7904cdfbb845218acb0f238329 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/222a8d49077c142f55b6837cbe3a0d51354f4a42 |     
   nios2     |            gdb-14.2            | NOK | http://autobuild.buildroot.org/results/a2325e666983a3badd9e79149809bdbe46d6ac7c | ORPH
   xtensa    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/3ba2bfafc1f04a4cd5714d15fd340b775722dbd9 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/4d869e364018da08b43c0d731630847159c9b37e |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/0531c6a6a4b43ab3ea2be6f6dadfbfb8a247e6a7 |     
   mipsel    |          gnutls-3.8.6          | NOK | http://autobuild.buildroot.org/results/c405192630e4ab606ea22a9b40f2b3dba72aeed8 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/3b281c21ef05179b3878196e1ecafac7340fda98 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/a8fa91d4940d6527954950e97d3700abad6893b4 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/62dcdfa67e9c2eba35d364cf102928a11a6c7213 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/019442d33d502c9c540986a96c447892d857020f | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/0d625d5ff8bb4748e826d939ed0565b40a734e91 | ORPH
  aarch64    |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.org/results/9e56ae3fb55a5a52a7658959fb645cd05cc88646 |     
    mips     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.org/results/d2efc71c95d767b4bc3d29b2863e04b1b06fc52a |     
   sparc     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.org/results/d1c41157ddace09399a3fc101026ae451c6a918a |     
    i686     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/8ca9cad96658cd58263139067bac06b7967de13f |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.org/results/3433c4e212872b5e2d347891d978133364eff78f |     
   mips64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.org/results/0a14a700b8dedee2fd735340fc0425d3e0dc396c |     
    or1k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/feb6d96e7ccac52b713c66d03f04a2c88d9b562a | ORPH
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/2075285416295cda06fd2227d67caf7ddaa15654 | ORPH
   arceb     | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/1fabca11c7839d2d7ed809f30482595719a29c92 |     
powerpc64le  | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/d6e69ee7f55da65e8e6e20eb7822ffe7cc29b313 |     
   nios2     | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/0e0a34e1ed95992047db4afb1ad07d3c42591bae |     
  mips64el   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/034f6c7f4851e9ff9b589d6ecaffcb6ba0d19bdb |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.org/results/b6775d78e1d06922e69978c69465a5249416603c |     
   mipsel    |          libnss-3.103          | NOK | http://autobuild.buildroot.org/results/8be01e2b3898affeabcadfa6ccabcb700ec16ca3 |     
  aarch64    |         liboauth-1.0.3         | NOK | http://autobuild.buildroot.org/results/3791ee8c7ba22958e71718310ee80d54a6d511a4 | ORPH
 powerpc64   |         libp11-0.4.12          | NOK | http://autobuild.buildroot.org/results/cad400ab0a655ff8970e77b0c17bb5016838b741 | ORPH
    arm      |         libressl-3.9.2         | NOK | http://autobuild.buildroot.org/results/518a2c2779f95dc118750c64571cb95bb55b218b | ORPH
  mips64el   |         libssh-0.10.6          | NOK | http://autobuild.buildroot.org/results/b529e86d801f7b24b081a1fd84257d7551394dcc | ORPH
 aarch64_be  |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/7a65ede3d03de124376b15ddd8e55dd359b4b5f4 |     
   arceb     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/d483b445238646aa29e65a8d3fc980804e04412a | ORPH
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/be44ff319863b6f331ee98851a2942c80a017fe3 | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/09e253734d22058fab73ce84aac6349c1f3e1013 |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/441afa2ae5c8b264d662d677752cb1110985d49f |     
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/9571c62a600c8bb5908787c50fe01178d2f23303 |     
   mipsel    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.org/results/3a99441cf4fb248ac99b8558692f7b14c7992945 |     
  powerpc    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.org/results/606946da3966fae0523f3da4b795bd6c5fc6f120 | ORPH
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/8a8343bc20edb42d804b1f768a5fbe97e7635f81 |     
   mipsel    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/6ae5bf62eb4dfdd497c9e705be2796ca9273cb4a |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/facead8832413062ee28a93437a889c56545eda5 |     
   mips64    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.org/results/3827e8de3bfe833d9578a32ea7706d79dcbadba9 |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.org/results/700691dc6284b5bf7503461fe9426f215a2f8772 |     
    arm      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.org/results/3927594d92e84f214bdd6e56728b70d6cbdedd45 |     
    arm      |         tbtools-0.4.1          | NOK | http://autobuild.buildroot.org/results/6d33fd6f14023e4651f203b765be2993730662d0 |     
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/3fbc9f89af4e06ff7d3820ff4e969b051dee7e82 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.org/results/7508f626293078177b4ea8b1571fc1987d2a0f73 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.org/results/923584a56b5eb8e4724b9bae53f29f77ebe18812 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.org/results/b63badf09d6eeff8ac542b9885be8887dcaba7fe |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
          libcamera-apps-1.2.1 | 2 
               collectd-5.12.0 | 1 
                elfutils-0.189 | 1 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
               host-go-1.21.13 | 1 
host-heimdal-f4faaeaba371ff... | 1 
 host-softether-4.30-9700-beta | 1 
           host-systemd-254.13 | 1 
              libtracefs-1.8.0 | 1 
                  ntpsec-1.2.3 | 1 
                 openssh-9.7p1 | 1 
                    proj-9.3.0 | 1 
               syslog-ng-4.3.1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/8d89e98ea9c62ce14121941c6857e60b63c58c9c |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/fb62b02867aa45741550c9c9d415982d18244e00 | ORPH
 powerpc64   | glibc-2.38-81-gc8cb4d2b86ec... | NOK | http://autobuild.buildroot.org/results/af1545d8a382b521ab57824cf9e1c1f2cb03009b |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/e8e8f572300749e0218587505b68a59d1bf24e5a | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/7e49d4d5991a14799a9bcd700fa39edb82027e79 | ORPH
  mips64el   |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/5cd3a170ef54fb2111db17b25d2f3cbef63db785 |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/e4d728992c64b5738fe052ecbfac540ce679b63d | ORPH
powerpc64le  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/03f151dcbd7de87360e4871d085f8b6618dcd65d | ORPH
  aarch64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.org/results/62f26bf720d8573dda55222c5f5769c4157a1e78 |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/f4ac60798349091af00c46fe305a6d94d7634e0d |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/47f4c68e316ecbf8eb62342c61ae44a0e777e95d |     
    arm      |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.org/results/d1c07ccef9887d7c2acad2428c6edff6e247a1e9 |     
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.org/results/0b786193715f0f8ac6ea4107bdc2e77257dd401e | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/a232eeb67059c7d347c3d09753517075e0fc24c4 | ORPH
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.org/results/df946efb0b7dbef692b5da5bdf35bc886c0cbfbe |     
  mips64el   |        syslog-ng-4.3.1         | NOK | http://autobuild.buildroot.org/results/b87e4f12a77847ba63ab4e7abf9c1317e71b99f2 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.org/results/f1038554d086865dba81194c0cf57cf2340a598b |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  linux-6.8.12 | 2 
              cache-calibrator | 1 
               collectd-5.12.0 | 1 
                 coreutils-9.3 | 1 
              e2fsprogs-1.47.0 | 1 
                elfutils-0.189 | 1 
                     exim-4.98 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  ledmon-1.0.0 | 1 
                 pixman-0.42.2 | 1 
             stress-ng-0.17.07 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/eee31bda076dc47fb5324b9e0f754e8470655ffb |     
  riscv32    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/b90c9d8916d9baf4f4b06fbda341953b0ba1d531 |     
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/9131f64887f938ad7e34812d52f613459db276fa | ORPH
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.org/results/a0fe3c3df9133617fe468adbd064bd3f0aecc957 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/7726bc424c0361c40c8d19ffbed44896c2f5abfe | ORPH
    arm      |           exim-4.98            | NOK | http://autobuild.buildroot.org/results/cdf5eb3d483e463eaacdd2ee8f89416476324279 |     
  riscv64    |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/c5af23cc82c690d30cc5ae6e8bc9604715a4b03b |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/ec1a50d651a0ef1b34d9771c647c8c7fb2d20a8c | ORPH
    m68k     |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.org/results/969b62c89bc37326260fb23c5652e21c0662cba2 |     
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/7109eb447498159c5ebdceaa0cb4b570b07d9d02 | ORPH
    i686     |          linux-6.8.12          | NOK | http://autobuild.buildroot.org/results/ffbb3931985b301c968c465cbcccb22ceb4c1033 | ORPH
  aarch64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/8b014e9cacc37dcbe2a5af225cb295e997900ca9 | ORPH
   sh4aeb    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.org/results/58da22ece4788112fb0c64b288ab73ab46c9f3b4 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.org/results/920c166d2198ad7d2ee3904bcd41f73be54a1fed |     


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 3 
                 dc3dd-7.2.641 | 2 
                  ffmpeg-6.1.2 | 2 
            flashrom-1.4.0-rc2 | 2 
         gobject-introspection | 2 
                  linux-6.10.3 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
                 apache-2.4.62 | 1 
                  boost-1.83.0 | 1 
             dahdi-linux-3.3.0 | 1 
                  fbdump-0.4.2 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
  gobject-introspection-1.76.1 | 1 
            host-binutils-2.42 | 1 
            host-binutils-2.43 | 1 
                libcuefile-475 | 1 
             libgpg-error-1.50 | 1 
                librsvg-2.50.9 | 1 
               lighttpd-1.4.76 | 1 
                  mender-3.4.0 | 1 
                    norm-1.5.8 | 1 
                nushell-0.85.0 | 1 
               pcsc-lite-2.1.0 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.org/results/bd2175f76f7cab090a921cc65672b5a479d554b8 | ORPH
 powerpc64   |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/9788c7ca4fc0a36092265e4822729af17a0cf825 |     
    arm      |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/0705291241cf02d28c12df88fd3d03c282b44b36 |     
 aarch64_be  |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/3658f690cefdb5dfa76de980c97194721a28251a |     
  mips64el   |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/291aa51e340e2b9956aefe08a41eb44a1ec140b0 |     
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.org/results/e0b7eb5704c0e6fcb8f81f4e998e43ebf627bebc |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/934c127717f0592220bf602cd1da230f170f9d60 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.org/results/7dbea0af9138023452a8e9677f7cf2ca9718f25c | ORPH
microblazeel |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.org/results/6f632c1805b1620d9761cbcac6b8b9256ea3f247 | ORPH
   mips64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/e6eec8f8cff0bd79e635df73ac5a4a52da4a0ccd | ORPH
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/b1ef35414449dcdbe2c5ad0b0523af8c3ffbe5e7 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/cef77ef9684cfb41140543b12bc20701f43c5a61 |     
   mips64    |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.org/results/b60dd2056760b275948f2ac4ef6e776e222ef11d |     
   arceb     |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.org/results/dcf0fbba03ea183c906be2aa2b68ba3aa3f08066 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/9f7544493ba28d48c25f1398a81941e72232be4c |     
 aarch64_be  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/048706064437ec7abd1847718d27429bac2a2483 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/6c7e12677e58dd225d0323b0705e78ad3201453f |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/395efdc33dd38a4fa093a28a13e4c05950461bb8 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/a8719b1ccc6ec31f47950d8f7191f2ebc2ae984c | ORPH
    or1k     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/9ed7ded2b6c0110f019299a931e6c5e8ca2bcfae |     
   x86_64    |       host-binutils-2.43       | NOK | http://autobuild.buildroot.org/results/70f44aa4f638c451414151e111118a5714b9e860 |     
   nios2     |         libcuefile-475         | NOK | http://autobuild.buildroot.org/results/6774c30b0ac0802288f9eb3d2c7268534f0673d8 | ORPH
  riscv32    |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.org/results/dad7c015068abb0587d0b620f2277747ffc85fbd | ORPH
  aarch64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.org/results/00a5a31d56909147bef698888c0b6ca0c7755d85 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/c622cd828521155b79bba1ab815bbb5cea29dfe9 | ORPH
   sparc     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/ffac25e3203d7bc86b6ef4621e5f9fbac5522d30 | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/539dfb36a45a2bb439bfaa1f409ce2eb82e00d73 | ORPH
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.org/results/41cae6cc61f62b0b5a0c85323a86e1d607f30101 |     
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/8a6ea5b3ad53ef645d33a695a108186b8e461797 | ORPH
   x86_64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.org/results/65a024ef46068203dfcfa7d17689a483a5798c6c | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.org/results/d7f8a04802bd8de252d4eb7e7c7a63ac8dd571be | ORPH
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/7fa2ad0965ea6ae1adc4e6678611328f7f6194d8 | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.org/results/b211dbd1d4fa4884a14cd74deeabbb12ab6541a8 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.1        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/000018 | 20240321     | 20240322     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/015661 | 1.1.10       | 1.1.11       |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 46.2         |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2024.2       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/013989 | 4.2.2+git... | 14.0.0_r61   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/021321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 10.0         | 12.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 3.1.7        | 4.0.2        |     
                           apr |  DISTRO  | https://release-monitoring.org/project/000095 | 1.7.2        | 1.7.4        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/007006 | 9.900.2      | 14.0.2       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/006988 | 5.3.1        | 5.4.2        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 20.9.1       | 21.4.2       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.50.0       | 2.53.1       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/000135 | 2.10.0       | 2.11.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.2        | 4.0.2        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.17         | ORPH
                       avocado |  DISTRO  | https://release-monitoring.org/project/013385 | 98.0         | 106.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/010751 | 7.2          | 7.3          |     
                        avro-c |  DISTRO  | https://release-monitoring.org/project/059411 | 1.11.3       | 1.12.0       |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/000154 | 1.9.2        | 1.13.1       | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/007137 | 2.0.4        | 2.0.6        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.21       | 5.2.32       | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.11         | 2.14.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2023.1       | 2024.2       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2023.1       | 2024.2       |     
                           bcc |  DISTRO  | https://release-monitoring.org/project/012803 | 0.29.1       | 0.31.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/021323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/014746 | 4.4.8        | 5.3.74       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/017108 | 8.2.4        | 8.2.6        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/014378 | 4.4.8        | 5.3.74       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/080042 | 4.4.8        | 5.3.74       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.10      | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/014923 | 9.16.48      | 9.20.0       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.42         | 2.43.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 26.2         | 27.1         |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.5.1        | 1.5.3        |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/021324 | 4.1.1        | 4.3.0        | ORPH
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.75         | 5.77         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.75         | 5.77         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 7.20.2       | 8.0.2        |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.86.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/021578 | 4.3.1        | 5.3.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.3.0        | 3.5.0        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.4.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.21.2       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 6.10.1       | ORPH
                    bubblewrap |  DISTRO  | https://release-monitoring.org/project/010937 | 0.9.0        | 0.10.0       |     
                        c-ares |  DISTRO  | https://release-monitoring.org/project/005840 | 1.32.2       | 1.33.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/021326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20230311     | 20240203     |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.0       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.4       | 1.14.5       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 1.0.0        | 1.1.0        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.0.2        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/007680 | 3.6.0        | 3.7.0        |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/000257 | 4.10.1       | 4.10.2       | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.6.1        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/085785 | 3.9.1        | 4.4.3        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/000276 | 3.6          | 20200710     |     
                       chicken |  DISTRO  | https://release-monitoring.org/project/000280 | 5.3.0        | 5.4.0        |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/008547 | 3.0.1        | 3.1.0        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/008810 | 4.4          | 4.5          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/000291 | 1.0.6        | 1.4.0        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/011811 | 15.0.3       | 18.1.8       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.3.2        | 2.4.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/010503 | 3.0.21.02.21 | 3.0.23.01.25 |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/021332 | 3.14.1.3     | 3.14.1.3+... |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2024.6.1     | 2024.8.2     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 3.30.0       | 3.30.2       |     
                        cmocka |  DISTRO  | https://release-monitoring.org/project/011779 | 1.1.5        | 1.1.7        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.3.0        | 1.5.1        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/017705 | 15.0.3       | 18.1.8       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.7.7        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.1.12       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.7        | 1.4.8        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.3          | 9.5          | ORPH
                      cracklib |  DISTRO  | https://release-monitoring.org/project/000362 | 2.9.11       | 2.10.2       |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.15         | 1.16.1       |     
               cryptodev-linux |  DISTRO  | https://release-monitoring.org/project/021409 | 1.13         | 1.14         | ORPH
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/000380 | 2.4.7        | 2.4.10       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 2.11.0       | 4.3.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.16       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/000391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 33           | 36           |     
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.4.0        | 2.5.2        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.20         | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.23.0       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.27         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20220117 | 1.3-20240619 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/000438 | 3.0.5        | 3.1.1        | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 27.0.3       | 27.1.2       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/369144 | 0.16.1       | 0.16.2       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.27.1       | 2.29.2       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 27.0.3       | 27.1.2       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2024.7       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/007454 | 3.2.1        | 3.3.0        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21       | 2.3.21.1     |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21       | 0.5.21.1     |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/010627 | 059          | 103          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/000462 | 9.21.4       | 9.28.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                      dt-utils |  DISTRO  | https://release-monitoring.org/project/021419 | 2023.08.0    | 2023.11.0    |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.9.0        | 1.1.1        | ORPH
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/000646 | 1.47.0       | 1.47.1       | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.0        |     
                           efl |  DISTRO  | https://release-monitoring.org/project/006128 | 1.26.3       | 1.27.0       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 23.04        | 24.07        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.189        | 0.191        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/017781 | 0.65         | 0.67         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.2        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/000696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.26.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.0.2       | 27.0.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.22       | 1.0.23       |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.5       | 1.11.10      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.22       | 1.0.23       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.30       | 1.0.31       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.15       | 1.0.17       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.11       | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/020539 | 1.0.9        | 1.0.10       |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.49       | 1.0.54       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.29       | 1.0.30       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/009151 | 1.2.7        | 1.2.14       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.16       | 1.1.21       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.25       | 1.0.26       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/010464 | 1.1.49       | 1.1.52       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/012752 | 1.6.2        | 1.8.3        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/010243 | 1.0.36       | 1.0.37       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.15       | 1.0.16       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.12       | 1.0.13       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.7.1        | 1.8.1        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 3.1.0        | 3.1.1        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/000763 | 6.9          | 6.10         |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.5        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.2        | 1.2.5        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/000769 | 0.27.6       | 0.28.3       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.18.22      | 0.19.0       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.34         | 1.36         | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.6        | 3.1.8        |     
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 9.0.0        | 10.1.0       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.7.1        | 3.10.3       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.2        | 7.0.2        |     
                     findutils |  DISTRO  | https://release-monitoring.org/project/000812 | 4.9.0        | 4.10.0       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.34         | 3.37         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.0.2        | 2.2.1        | ORPH
                      flashrom |  DISTRO  | https://release-monitoring.org/project/010202 | 1.4.0-rc2    | 1.4.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/007184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.3.9        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 3.1.3        | 3.1.6        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 4.7.0        | 6.6.0        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.14.2       | 2.15.0       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.18.1       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.1          | 5.2          |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/000853 | 3.2.3        | 3.2.5        |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.7       | 3.7.0        |     
                      freetype |  DISTRO  | https://release-monitoring.org/project/000854 | 2.13.2       | 2.13.3       |     
                           frr |  DISTRO  | https://release-monitoring.org/project/018555 | 8.5.4        | 10.1         |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.14         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.10.2       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 1.9.20       | 1.9.23       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 3.40.0       | 4.3.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.8.2        | 3.9.1        |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.10      | 2.42.12      | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/067634 | 2.5.5        | 2.8.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/018420 | 1.12.1       | 2.2.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 0.22.5       | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 17.3.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.80.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.80.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.6       | 2.66.7       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/001221 | 3.8.3        | 3.8.7        | ORPH
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/001223 | 1.76.1       | 1.80.1       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.4.0        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/009771 | 2.15.9       | 2.17.5       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/021447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.5.0        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.40       | 1.3.43       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.51.1       | 1.65.4       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 46.1         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/001267 | 2.7.1        | 2.8          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/021845 | 1.22.9       | 1.22.12      | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.22.9       | 1.24.6       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.22.9       | 1.24.6       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.22.9       | 1.24.6       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.22.9       | 1.24.6       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.22.9       | 1.24.6       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.22.9       | 1.24.6       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.22.9       | 1.24.6       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.22.9       | 1.24.6       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.22.9       | 1.24.6       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.22.9       | 1.24.6       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.22.9       | 1.24.6       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/018290 | 1.14.0       | 1.15.2       |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.8       | 3.24.9       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 3.24.7       | 5.12.1       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/001277 | 3.0.9        | 3.0.10       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.48.1       | 1.55.90      | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/006136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.15       | 3.0.3        |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/013375 | 11.2         | 11.5         |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/001316 | 0.17         | 0.18         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.24.4       | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/005387 | 0.384        | 0.385        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.9.3        | 2.11.1       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.50.2       | 2.53.1       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 73-2         | 75-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.41       | 0.8.43       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.1-31     | 7.1.1-36     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.7.3        | 1.12.3       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.23.9.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/020342 | 22.4.1       | 22.5.0       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/020614 | 20240531     | 20240813     |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/001389 | 3.16         | 3.17.1       | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/001393 | 7.16         | 7.22         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/001402 | 1.9.3        | 1.9.4        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/001404 | 1.4.4        | 1.4.5        |     
                            iw |  DISTRO  | https://release-monitoring.org/project/001410 | 5.19         | 6.9          | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/018380 | 2.17         | 2.19         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.1.2        | 1.2.3        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/001421 | 2.0.33       | 4.2.4        |     
                      jbig2dec |  DISTRO  | https://release-monitoring.org/project/001431 | 0.19         | 0.20         |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.81         | 0.82         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.4.1        | 3.5.0        | ORPH
                            jo |  DISTRO  | https://release-monitoring.org/project/018855 | 1.6          | 1.9          |     
                          jose |  DISTRO  | https://release-monitoring.org/project/011761 | 11           | 14           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 2.1.5        | 3.0.3        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/013910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/021681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/059395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/021815 | 1.13.1       | 1.14.0       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/021816 | 1.10.4       | 1.14.0       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/021817 | 1.19.5       | 1.21.0       | ORPH
                     json-glib |  DISTRO  | https://release-monitoring.org/project/013144 | 1.8.0        | 1.9.2        | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.5.1        | 2.6.4        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.1        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.5.0        |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.5.0        |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.5.0        |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.91.0       | 6.5.0        |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/001517 | 31           | 33           |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.1        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/001534 | 3.10.1       | 3.12.0       |     
                          less |  DISTRO  | https://release-monitoring.org/project/001550 | 643          | 661          | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20230802.1   | 20240722.0   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/007629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 3.1.7        | 4.0.2        |     
                     libassuan |  DISTRO  | https://release-monitoring.org/project/001559 | 2.5.7        | 3.0.1        | ORPH
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.1.0        | 1.4.5        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/001567 | 0.11.7       | 0.12.2       |     
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.3.0       | 0.3.1        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.1.0        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                       libcurl |  DISTRO  | https://release-monitoring.org/project/000381 | 8.9.0        | 8.9.1        |     
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.2        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.20         | 1.21         |     
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 0.6.1        | 0.7.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/006308 | 1.16.4       | 1.18.0       | ORPH
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.1       | 1.13.2       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2304.0     |     
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/000846 | 3.4.0        | 3.6.0        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/001174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/001180 | 3.3.8        | 3.4          |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.76.1       | 2.80.4       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/012098 | 1.4.0        | 1.7.0        | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/012558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.4        | 2.1.3        | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/001563 | 1.10.0       | 2.2.1        | ORPH
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.12.4       | 4.14.4       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/007735 | 237          | 238          |     
                       libheif |  DISTRO  | https://release-monitoring.org/project/064439 | 1.18.1       | 1.18.2       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/007981 | 2.41         | 2.43.1       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/001637 | 1.0.1        | 3.0.18       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.15         | 1.17         | ORPH
                   libiec61850 |  DISTRO  | https://release-monitoring.org/project/141617 | 1.5.3        | 1.6.0        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.26.0       | 1.26.1       |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 1.17.0       | 1.17.2       |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.5        | 2.0.6        | ORPH
                       libksba |  DISTRO  | https://release-monitoring.org/project/001649 | 1.6.6        | 1.6.7        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.45         | 2.47         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/021483 | 0.31         | 0.32         | ORPH
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.12.10      | 0.12.11      |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/001986 | 2.2.7        | 2.2.8        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/016827 | 0.10.1alpha  | 1.11         |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/014944 | 1.8          | 1.9          |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 2.1.28       | 3.3.3        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.2.6        | 1.2.7        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.22       |     
                         libnl |  DISTRO  | https://release-monitoring.org/project/001684 | 3.9.0        | 3.10.0       | ORPH
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/075209 | 4.2.2        | 6.1.3        |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.4.0        | 2.4.1        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2024.7       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.0.4        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/015701 | 2.14         | 2.14.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.4.0        | 2.6.0        | ORPH
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.58.93      |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.6        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.4       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.6          | 3.7          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001718 | 3.6          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001719 | 3.6          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.6.0        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.0       | 2.12.1       |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/001728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.25       | 0.7.30       |     
                 libsoundtouch |  DISTRO  | https://release-monitoring.org/project/115722 | 2.3.1        | 2.3.3        |     
                      libsoup3 |  DISTRO  | https://release-monitoring.org/project/011483 | 3.5.1        | 3.5.2        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.0.0        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/001729 | 0.10.6       | 0.11.0       | ORPH
                      libtirpc |  DISTRO  | https://release-monitoring.org/project/001740 | 1.3.4        | 1.3.5        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.4.6        | 2.5.1        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.19       | 2.0.10       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.2        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.2          | 1.3.1        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 0.21.0       | 0.26.6       | ORPH
                        libv4l |  DISTRO  | https://release-monitoring.org/project/009998 | 1.24.1       | 1.28.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.10.6       | 8.15.3       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 10.6.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.12.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.13.1       | 1.14.1       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/001767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.4.0        | 1.7.0        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.4.0        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 2.1.148      | 3.1.0        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 0.11.0       | 1.0.0.6      |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 0.11.0       | 1.0.0.6      |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.24.24      |     
                         links |  DISTRO  | https://release-monitoring.org/project/001822 | 2.29         | 2.30         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/001823 | 4.4.8        | 5.2.6        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20240709     | 20240811     |     
                      linuxptp |  DISTRO  | https://release-monitoring.org/project/021114 | 4.2          | 4.3          |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2021.05.03   | 2024.08.01   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.20       | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.3       | 18.1.8       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.17       | 1.0.18       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/001830 | 15.0.3       | 18.1.8       |     
                          lmdb |  DISTRO  | https://release-monitoring.org/project/006974 | 0.9.31       | 0.9.33       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.1.19+nmu1  | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.1.1        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.1.0        | 1.2.0        |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/010567 | 3.21.0       | 3.22.0       | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/011649 | 0.9.5-1      | 0.9.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.13.1       | 2.13.8       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.13.10      | 2.13.14      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.13.8       | 2.13.13      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.4.7        |     
                     lua-iconv |  DISTRO  | https://release-monitoring.org/project/011668 | 7-1          | 7.1.0        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.17.2       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.43.0-0     | 1.48.0-2     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.23      | 2.03.25      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 5.0.3        | 6.0.1        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/001865 | 1.9.4        | 1.10.0       | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/001866 | 1.23         | 1.24.1       | ORPH
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2408         | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.6      | 11.6.1       | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.27       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 2.28.8       | 3.6.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20240707     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 194          | 200          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/021746 | 4.4.8        | 5.3.75       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/001965 | 1.6.22       | 1.6.29       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 6.20         | 7.00         |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 24.0.9       | 24.2.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 24.0.9       | 24.2.0       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/006472 | 1.3.1        | 1.5.1        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/015392 | 2.25.1       | 3.52.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.22.0       | 1.23.0       |     
                        midori |  DISTRO  | https://release-monitoring.org/project/001974 | 9.0          | 11.3.3       | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/021521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.9.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.7        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.06      | 2024.07      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/010267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.15.2       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.7        | 3.0.12       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/002008 | 4.2.18       | 7.3.4        |     
                         monit |  DISTRO  | https://release-monitoring.org/project/005483 | 5.33.0       | 5.34.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.12.0.206   |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/011578 | 2.5.1        | 4.0.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/002019 | 4.1.1        | 4.2.1        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/012413 | 1.32.6       | 1.32.7       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.35.1       | 0.38.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 3.3.0        | 6.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/002024 | 1.8.25       | 1.8.26       |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/008868 | 1.1.6        | 1.1.7        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.43       | 4.0.44       | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.9.9        |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.24.8       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.3        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.38         | 1.40         |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2          | 1.2.1        |     
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.25         | 3.26.1       |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.20         | 2.5          |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.4-20230603 | 6.5-20240810 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                      neofetch |  DISTRO  | https://release-monitoring.org/project/016261 | 7.1.0        | 7.3.11       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 1.7.6        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 3.1.18       | 3.2.6        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.218        | 1.226        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.33.1       | 1.46.3       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.8        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.2.28       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/002062 | 5.9.3        | 5.9.4        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         |     
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.9.1        | 3.10         | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/021197 | 1.46.0       | 1.48.8       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.11.0       | 1.12.0       |     
                          newt |  DISTRO  | https://release-monitoring.org/project/015129 | 0.52.23      | 0.52.24      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.0.8        | 1.1.0        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.0.8        | 1.1.0        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.58.0       | 1.62.1       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.26.1       | 1.27.1       |     
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 27           | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 20.15.1      | 22.6.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 20.15.1      | 22.6.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.0.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       numactl |  DISTRO  | https://release-monitoring.org/project/002507 | 2.0.16       | 2.0.18       |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.85.0       | 0.96.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 560.31.02    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 515.48.07    | 560.31.02    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 1.12         | 2.10.2       | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.2          | 2.9          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v1.12.12     | 14.2.6       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/021545 | 4.3.1        | 4.3.2        | ORPH
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.10       |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.11      | 1.4.4        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.22.0       | 1.23.1       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2023.12.14   | 2024.05.08   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/006615 | 3.4.19       | 4.10.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.12.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.34       | 2.0.36       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 17.0.9+9     | 24+11        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/006847 | 9.2.4        | 10.0.0       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.5        | 5.0.5        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.52.1       | 0.54.2       |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/002559 | 0.24.0       | 0.25.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 12.4.5       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.6.2        | 0.7.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/059396 | 0.6.2        | 0.7.0        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/011081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.34       | 0.4.39       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/021691 | 4.4.8        | 5.3.74       | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/002582 | 0.25.3       | 0.25.5       | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.4.1        |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.54.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.3       | 2.46.4       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.18.0       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/005832 | 10.43        | 10.44        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.3.0        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/013599 | 5.38.2       | 5.41.2       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.21         |     
     perl-crypt-openssl-random |  DISTRO  | https://release-monitoring.org/project/002747 | 0.15         | 0.17         |     
                perl-data-uuid |  DISTRO  | https://release-monitoring.org/project/011837 | 1.226        | 1.227        |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.94         | 6.95         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.008        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.83         | 0.84         |     
          perl-extutils-config |  DISTRO  | https://release-monitoring.org/project/011847 | 0.008        | 0.010        |     
         perl-extutils-helpers |  DISTRO  | https://release-monitoring.org/project/011848 | 0.026        | 0.027        |     
    perl-extutils-installpaths |  DISTRO  | https://release-monitoring.org/project/011849 | 0.012        | 0.013        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.83         |     
                  perl-gdgraph |  DISTRO  | https://release-monitoring.org/project/009187 | 1.54         | 1.56         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/002967 | 3.81         | 3.83         |     
              perl-html-tagset |  DISTRO  | https://release-monitoring.org/project/002971 | 3.20         | 3.24         |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/002974 | 6.10         | 6.11         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/002977 | 6.45         | 6.46         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 12.92        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.088        |     
             perl-json-maybexs |  DISTRO  | https://release-monitoring.org/project/011953 | 1.004005     | 1.004008     |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.67         | 6.77         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/003050 | 6.12         | 6.14         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/011868 | 1.20230630   | 1.20240619   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/011809 | 5.509        | 5.515        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.047        | 0.048        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.35         | 9.37         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20231213     | 20240730     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.42         | 1.45         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/003163 | 0.72         | 0.73         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/011962 | 0.144        | 0.146        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                 perl-try-tiny |  DISTRO  | https://release-monitoring.org/project/011921 | 0.31         | 0.32         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.21         | 5.28         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0210       |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/015603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.22       | 5.1.23       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.3.1        | 3.3.2        |     
                        physfs |  DISTRO  | https://release-monitoring.org/project/003631 | 3.0.2        | 3.2.0        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 1.5.1        | 2.0.0        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 1.1.2        | 2.0.0        |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 0.3.81       | 1.2.2        |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/003648 | 0.42.2       | 0.43.4       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 1.6.3        | 2.3.0        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.13.2       | 1.13.3       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.2          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 123          | 125          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 22.12.0      | 24.08.0      |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/005601 | 16.3         | 17           |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.8          | 4.12         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.11       | 1.3.12       | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.5       | 0.14.6       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/021570 | 9.3.0        | 9.4.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 0.12.4       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 21.12        | 27.3         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.4.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/003721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.8.5        | 1.8.12       | ORPH
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/021243 | 0.4.7        | 0.4.11       |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/021244 | 0.7.0        | 0.7.1        |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 3.1.1        | 3.2.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.9.3        | 3.10.3       |     
         python-aiohttp-jinja2 |  DISTRO  | https://release-monitoring.org/project/021247 | 1.5.1        | 1.6          |     
            python-aiohttp-sse |  DISTRO  | https://release-monitoring.org/project/021251 | 2.1.0        | 2.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/021252 | 1.2.1        | 1.3.0        |     
              python-aiorwlock |  DISTRO  | https://release-monitoring.org/project/021254 | 1.3.0        | 1.4.0        |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.13.1       | 1.13.2       |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/010072 | 0.10.0       | 0.11.0       |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/037849 | 6.3.1        | 6.6.1        |     
                   python-argh |  DISTRO  | https://release-monitoring.org/project/009299 | 0.31.0       | 0.31.3       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/018462 | 3.7.2        | 3.8.1        |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.14.2       | 2.15.0       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/015099 | 23.2.0       | 24.2.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/007015 | 23.6.2       | 24.4.2       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/059411 | 1.11.3       | 1.12.0       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.14.0       | 2.16.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/009047 | 4.1.3        | 4.2.0        |     
                python-beniget |  DISTRO  | https://release-monitoring.org/project/091782 | 0.4.1        | 0.4.2.post1  |     
            python-betterproto |  DISTRO  | https://release-monitoring.org/project/030603 | 2.0.0b6      | 2.0.0b7      |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.22.1       | 0.23.1       |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.1.4        | 4.2.3        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 0.21.1       | 0.22.2       |     
                python-blinker |  DISTRO  | https://release-monitoring.org/project/020042 | 1.7.0        | 1.8.2        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/021929 | 0.8.0        | 0.9.0        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.34.14      | 1.35.0       |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.34.14      | 1.34.161     |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 5.3.2        | 5.4.0        |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/017873 | 4.3.1        | 4.4.2        |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/023230 | 2.2.0        | 2.3.0        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/064102 | 5.5.1        | 5.6.4        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2024.6.2     | 2024.7.4     |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/005536 | 1.16.0       | 1.17.0       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/021937 | 4.0.0        | 4.1.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/021936 | 4.1.0        | 4.2.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/020163 | 10.0.0       | 11.0.0b3     |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/003799 | 18.9.0       | 18.10.0      |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/012509 | 6.8.0        | 6.8.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 1.5          |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.1.0        | 1.2.1        |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/031282 | 3.0.0        | 3.2.0        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 39.0.2       | 43.0.0       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/013259 | 2.9.0        | 2.11.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/012679 | 0.29.37      | 3.0.11-1     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/003816 | 3.0.1        | 3.0.2        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/021939 | 4.0.0        | 4.1.2        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/005621 | 2.9.0        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.12.0       | 2.22.1       |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/003828 | 5.0.8        | 5.1          |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/013190 | 2.4.2        | 2.6.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/003849 | 0.20.1       | 0.21.2       |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2023.11      | 2024.5       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.18.0       | 0.19.0       |     
        python-email-validator |  DISTRO  | https://release-monitoring.org/project/098134 | 2.1.1        | 2.2.0        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.8.2        | 4.9.1        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/062869 | 1.6.1        | 1.7.1        |     
                 python-fastui |  DISTRO  | https://release-monitoring.org/project/372329 | 0.5.2        | 0.6.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.13.1       | 3.15.4       |     
                   python-fire |  DISTRO  | https://release-monitoring.org/project/021700 | 0.5.0        | 0.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/003867 | 3.0.0        | 3.0.3        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 4.0.0        | 4.0.1        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/021698 | 2.2.2        | 3.0.1        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/025028 | 0.42.3       | 0.44.0       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 2.0.7        | 24.3.25      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.47.0       | 4.53.1       |     
                 python-future |  DISTRO  | https://release-monitoring.org/project/026845 | 0.18.3       | 1.0.0        |     
                   python-gast |  DISTRO  | https://release-monitoring.org/project/065692 | 0.5.4        | 0.6.0        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/006459 | 3.1.40       | 3.1.43       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 14.3.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.42.2       | 3.48.2       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.15.0       | 2.19.1       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.26.1       | 2.33.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.62.0       | 1.63.2       |     
               python-gpiozero |  DISTRO  | https://release-monitoring.org/project/019948 | 2.0          | 2.0.1        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.13       | 0.1.20       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.60.0       | 1.65.4       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.60.0       | 1.65.4       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/003882 | 21.2.0       | 23.0.0       |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 2.3.2        | 3.0.0        |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.4.0        | 4.10.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.1-1      |     
            python-incremental |  DISTRO  | https://release-monitoring.org/project/015162 | 22.10.0      | 24.7.2       |     
                python-inflect |  DISTRO  | https://release-monitoring.org/project/003889 | 7.0.0        | 7.3.1        |     
               python-influxdb |  DISTRO  | https://release-monitoring.org/project/012696 | 5.3.1        | 5.3.2        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 8.20.0       | 8.26.0       |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/051611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/020150 | 3.3.0        | 3.4.0        |     
     python-jaraco-collections |  DISTRO  | https://release-monitoring.org/project/058530 | 5.0.0        | 5.0.1        |     
         python-jaraco-context |  DISTRO  | https://release-monitoring.org/project/062309 | 4.3.0        | 5.3.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.0.0        | 4.0.2        |     
            python-jaraco-text |  DISTRO  | https://release-monitoring.org/project/023436 | 3.12.0       | 4.0.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/003898 | 4.20.0       | 4.23.0       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/003901 | 24.2.0       | 25.3.0       |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.1.8        | 1.2.2        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/015512 | 1.4.1        | 1.5.1        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 5.2.2        | 5.3.0        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/006599 | 0.40.1       | 0.42.0       |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.13.0       | 0.15.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/003915 | 1.3.0        | 1.3.5        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/003916 | 3.5.1        | 3.7          |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/003917 | 2.4.12       | 2.5.0        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 3.20.1       | 3.21.3       |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/050566 | 0.30.0       | 1.1.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.8.2        | 3.9.2        |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.1.6        | 0.1.7        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.15.0       | 0.16.0       |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.3.2        | 0.4.0b1      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 10.2.0       | 10.4.0       |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/021831 | 1.0.7        | 1.0.8        |     
               python-mwclient |  DISTRO  | https://release-monitoring.org/project/009693 | 0.10.1       | 0.11.0       |     
                python-netaddr |  DISTRO  | https://release-monitoring.org/project/005586 | 0.10.1       | 1.3.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/007791 | 3.2.1        | 3.3          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 1.25.0       | 2.0.1        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.0.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.9.10       | 3.10.7       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/011718 | 24.0         | 24.1         |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 3.4.0        | 3.4.1        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/016689 | 0.8.3        | 0.8.4        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 10.3.0       | 10.4.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 23.3.2       | 24.2         |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/007500 | 1.4.0        | 1.5.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/008742 | 3.0.43       | 3.0.47       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/003715 | 21.12        | 27.3         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/003978 | 5.9.7        | 6.0.0        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/003980 | 2024.1       | 2024.1.2     |     
              python-pure-eval |  DISTRO  | https://release-monitoring.org/project/057556 | 0.2.2        | 0.2.3        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/011987 | 0.3.0        | 0.4.0        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 2.13.1       | 2.13.4       |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/013166 | 1.25.1       | 1.26.1       |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.2        | 0.7.7        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/036851 | 3.19.1       | 3.20.0       |     
                 python-pycups |  DISTRO  | https://release-monitoring.org/project/007975 | 2.0.1        | 2.0.4        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20231114.3   | 20240713.1   |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.20.1       | 2.22.0       |     
                  python-pydyf |  DISTRO  | https://release-monitoring.org/project/179112 | 0.8.0        | 0.11.0       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.30         | 0.31         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/017026 | 1.5.9        | 1.5.10       |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/003986 | 2.17.2       | 2.18.0       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.12         | 2.13.1       |     
                  python-pyjwt |  DISTRO  | https://release-monitoring.org/project/005653 | 2.8.0        | 2.9.0        |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.7.0.post1  | 1.7.0.post2  |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/021583 | 0.21.0       | 0.22.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.24.9       |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/007284 | 1.1.0        | 1.1.1        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 23.3.0       | 24.2.1       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/015558 | 3.12.0       | 3.13.0       |     
                 python-pyphen |  DISTRO  | https://release-monitoring.org/project/019681 | 0.14.0       | 0.16.0       |     
        python-pyproject-hooks |  DISTRO  | https://release-monitoring.org/project/320474 | 1.0.0        | 1.1.0        |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.7.1        | 0.8.0        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/020081 | 0.7.10       | 0.7.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.9        | 1.2.9.1      |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 0.3.4        | 1.4.4        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 4.4.12       | 6.2.5        |     
               python-pyspnego |  DISTRO  | https://release-monitoring.org/project/107092 | 0.10.2       | 0.11.1       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/021592 | 0.31.3       | 0.31.4       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/003765 | 8.1.1        | 8.3.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 0.23.6       | 0.24.0a1     |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/021140 | 0.15.0       | 0.16.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/008485 | 0.24.1       | 0.24.3       |     
                 python-pyyaml |  DISTRO  | https://release-monitoring.org/project/004123 | 6.0.1        | 6.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 26.1.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 5.0.1        | 5.0.8        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/081160 | 1.7.0        | 2.0.13       |     
            python-referencing |  DISTRO  | https://release-monitoring.org/project/304263 | 0.32.1       | 0.35.1       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/005548 | 2023.12.25   | 2024.7.24    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/011803 | 1.3.1        | 2.0.0        |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.18.1       | 0.20.0       |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.11.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2          |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.18.5       | 0.18.6       |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.10.0       | 0.10.2       |     
               python-schedule |  DISTRO  | https://release-monitoring.org/project/021600 | 1.2.1        | 1.2.2        |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.11.4       | 1.14.0       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/059641 | 1.6.0        | 1.6.1        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.16.0       | 4.23.1       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.7.1        | 2.13.0       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/007917 | 23.1.0       | 24.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 71.0.3       | 72.2.0       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.9.0        | 1.10.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 8.0.4        | 8.1.0        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.0.6        | 2.0.7        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/004026 | 3.19.2       | 3.19.3       |     
          python-simplelogging |  DISTRO  | https://release-monitoring.org/project/021134 | 0.11.0       | 0.12.0       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.8.6        |     
            python-smbprotocol |  DISTRO  | https://release-monitoring.org/project/047981 | 1.12.0       | 1.13.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.0        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.2        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.11.0       | 5.11.3       |     
                 python-sockjs |  DISTRO  | https://release-monitoring.org/project/056562 | 0.11.0       | 0.13.0       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.5          | 2.6          |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/004038 | 0.4.4        | 0.5.1        |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/004923 | 1.12         | 1.13.2       |     
               python-tcolorpy |  DISTRO  | https://release-monitoring.org/project/097274 | 0.1.4        | 0.1.6        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.5.0        | 5.7.0        |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/011635 | 1.6.7        | 1.7.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.16.0       | 0.20.0       |     
               python-tinycss2 |  DISTRO  | https://release-monitoring.org/project/016655 | 1.2.1        | 1.3.0        |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/012824 | 1.1.4        | 1.1.7        |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.12.4       | 0.13.2       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/007498 | 6.2          | 6.4.1        |     
           python-tortoise-orm |  DISTRO  | https://release-monitoring.org/project/033168 | 0.20.0       | 0.21.5       |     
             python-tpm2-pytss |  DISTRO  | https://release-monitoring.org/project/060656 | 2.2.1        | 2.3.0        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/011524 | 4.64.1       | 4.66.5       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/012211 | 5.8.0        | 5.14.3       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/019614 | 22.2.0       | 23.11.0      |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/017451 | 0.22.0       | 0.26.2       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.9.2        | 0.11.1       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2024.3.3     | 2024.7.2     |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 22.10.0      | 24.7.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/019661 | 22.0.0       | 23.11.0      |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 2.13.3       | 4.3.0        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/021617 | 1.3.0        | 1.3.2        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.8.19.14    | 2.9.0.202... |     
         python-typing-inspect |  DISTRO  | https://release-monitoring.org/project/209826 | 0.8.0        | 0.9.0        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/019764 | 2.7.2        | 2.8.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/004076 | 5.7.0        | 5.10.0       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/004078 | 2.0.7        | 2.2.2        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 2.6.10       | 2.6.15       |     
         python-urwid-readline |  DISTRO  | https://release-monitoring.org/project/084198 | 0.13         | 0.14         |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/019818 | 0.22.0       | 0.33.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/005341 | 2.2.1        | 4.0.2        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/008743 | 0.2.5        | 0.2.13       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 59.0         | 62.3         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | 2.26.1       | 2.27.1       |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/024711 | 8.2.0        | 8.4.0        |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/006181 | 1.8.7        | 1.8.8        |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/007288 | 1.4.2        | 1.8.0        |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/004092 | 2.3.8        | 3.0.3        |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/011428 | 0.40.0       | 0.44.0       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/006108 | 1.14.1       | 1.16.0       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/011805 | 3.0.1        | 3.1.2        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/012180 | 0.32         | 0.33         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/012031 | 3.0.6        | 3.2.0        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.9.2        | 1.9.4        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/050636 | 20220907.1   | 20230507.3   |     
            python-zc-lockfile |  DISTRO  | https://release-monitoring.org/project/004100 | 2.0          | 3.0.post1    |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.39.4       | 0.132.2      |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 22.6.1       | 23.1.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/004112 | 5.5.2        | 7.0.1        |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/050016 | 0.2.2        | 0.2.3        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/013254 | 3.12.4       | 3.12.5       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 10.5.0       | 11.9.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.35.0       | 0.39.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.7.2        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.7.2        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.7.2        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.7.2        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.14      | 6.7.2        |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.6.5        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 52.0         | 53.0         |     
                      readline |  DISTRO  | https://release-monitoring.org/project/004173 | 8.2          | 8.2.13       | ORPH
                         redis |  DISTRO  | https://release-monitoring.org/project/004181 | 7.2.5        | 7.4.0        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20231002   | 2.20240226   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/016520 | 3.6          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/021389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 6.20.3       | 9.4.0        |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/004209 | 3.15         | 4.0          | ORPH
                       rpcbind |  DISTRO  | https://release-monitoring.org/project/004212 | 1.2.6        | 1.2.7        |     
                       rrdtool |  DISTRO  | https://release-monitoring.org/project/004214 | 1.8.0        | 1.9.0        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.1.12       | 1.1.13       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.65.1       | 0.70.0       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 0.43.0       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.33.1       | 2.34.0       |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/004758 | 4.20.3       | 4.20.4       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/004760 | 1.1.1        | 1.3.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.7.0        | 4.8.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/004779 | 2.30.5       | 2.30.6       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 2.8.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.2        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.4       |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.6          | 3.7          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.6          | 3.7          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.33.1       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.7.8        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/021655 | 4.3.8        | 4.6.2        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.2       |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.4.4        | 4.5.1        | ORPH
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 3.3.9        | 4.3.4        | ORPH
                      shapelib |  DISTRO  | https://release-monitoring.org/project/004804 | 1.6.0        | 1.6.1        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.4          | ORPH
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.0.9        | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/021653 | 4.11         | 4.12         |     
                        skopeo |  DISTRO  | https://release-monitoring.org/project/009216 | 1.13.3       | 1.16.0       |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.7.0        | 4.8.0        |     
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/096795 | 1.2.3        | 1.3.1        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/004835 | 7.3          | 7.4          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.7.0        | 1.8.2        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.1        |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.5.1        | 3.5.2        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.1.40.0     | 3.3.3.0      |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.16      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.5        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.0       | 0.15.2       |     
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.3.261.1    | 1.3.290.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.6.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/004877 | 3.46.0       | 3.46.1       |     
                     sqlitecpp |  DISTRO  | https://release-monitoring.org/project/112684 | 3.3.1        | 3.3.2        |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.16       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.1.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.22.11      | ORPH
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 5.9.13       | 5.9.14       |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.71         | 5.72         |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 6.0.19       | 7.0.6        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/011497 | 1.8.1        | 1.9          |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.2.1        |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.8.2        | 0.9.0        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.38.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/004930 | 4.7.1        | 4.8.0        |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 2.2.150      | 2.10.1       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.7.6       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 256.4        | 256.5        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.04         | 3.10         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/001982 | 1.13.1       | 2.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2021.13.0    |     
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/013716 | 4.4.4        | 4.5.1        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.13.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.3.4        | 5.4.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.5.8        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/005581 | 0.14.1       | 0.20.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.15.0       | 2.16.1       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.1.0        |     
                           tio |  DISTRO  | https://release-monitoring.org/project/020587 | 3.5          | 3.6          |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.3a         | 3.4          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/016819 | 2.3.3        | 3.0.0        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/018790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 3.2.2        | 4.1.3        | ORPH
                    traceroute |  DISTRO  | https://release-monitoring.org/project/014877 | 2.1.3        | 2.1.5        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2021.07      | 2024.07      | ORPH
                        uclibc |  DISTRO  | https://release-monitoring.org/project/013815 | 1.0.49       | 1.0.50       |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.16         |     
                        umtprd |  DISTRO  | https://release-monitoring.org/project/046129 | 1.6.2        | 1.6.8        |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.20.0       | 1.21.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 2.1          | 3.5          | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.5.12       | 1.8.12       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.90.4       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 4.2.4        |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/011151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.13.0       | 0.14.0       |     
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.11         | 6.12         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.39.3       | 2.40.2       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.39.3       | 2.40.2       | ORPH
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.12.7       | 0.13.2       |     
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.6.9        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.1.0145     | 9.1.0675     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.9        |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/007283 | 2.11         | 2.12         |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.76.4       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/089353 | 3.4.31       | 3.4.38       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.4.0        | 4.4.3        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.3.262      | 1.3.292      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.3.292      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.3.292      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/005116 | 2.1.1        | 2.1.2        |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/021633 | 1.7.0        | 1.8.1        |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.6        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.44.2       | 2.45.6       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/001761 | 1.3.2        | 1.4.0        |     
                          wget |  DISTRO  | https://release-monitoring.org/project/005124 | 1.21.4       | 1.24.5       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/005128 | 5.5.14       | 5.5.23       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 8.0.2        | 9.15         |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.5.5        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.0.12       | 4.3.1        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/018357 | 0.16.2       | 0.18.0       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.4.0        |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.44.2       | 2.44.3       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 3.5          | 3.6          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.24       | 1.4.26       |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/021723 | 1.2.2        | 1.2.3        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20240102     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.2        | 1.2.3        | ORPH
                  xapp_x11perf |  DISTRO  | https://release-monitoring.org/project/015035 | 1.6.2        | 1.7.0        | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/005253 | 1.1.2        | 1.1.3        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.4        | 1.0.5        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.0.8        | 1.1.0        |     
                 xapp_xditview |  DISTRO  | https://release-monitoring.org/project/021262 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/005255 | 1.1.14       | 1.1.16       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.3        | 1.2.4        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.5        | 1.2.6        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/015025 | 1.2.0        | 1.3.0        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.0        | 1.1.1        | ORPH
                      xapp_xfs |  DISTRO  | https://release-monitoring.org/project/005256 | 1.2.1        | 1.2.2        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/015018 | 1.4.6        | 1.4.7        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.1.4        | 1.2.0        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.7        | 1.0.8        | ORPH
                     xapp_xman |  DISTRO  | https://release-monitoring.org/project/014962 | 1.1.5        | 1.2.0        | ORPH
                 xapp_xmessage |  DISTRO  | https://release-monitoring.org/project/014961 | 1.0.6        | 1.0.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/021718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/018845 | 1.0.3        | 1.0.4        | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.1.0        | 1.2.0        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/014958 | 1.2.6        | 1.2.7        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.0.7        | 1.1.0        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/005259 | 1.0.5        | 1.0.6        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/013646 | 1.15.2       | 1.17.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/005782 | 1.3.0        | 1.4.0        | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/021711 | 2.1.22       | 2.1.23       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/005235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/005236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/005181 | 4.14.6       | 4.19.0       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/005182 | 3.2.4        | 3.2.5        | ORPH
               xfont_encodings |  DISTRO  | https://release-monitoring.org/project/015051 | 1.0.7        | 1.1.0        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/017200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.4.0        | 6.9.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/006382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.42         | ORPH
                    xlib_libFS |  DISTRO  | https://release-monitoring.org/project/001618 | 1.0.9        | 1.0.10       | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.7        | 1.8.10       | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/001766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/001770 | 1.2.1        | 1.2.2        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/001772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.5        | 1.3.6        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.6        | 2.0.7        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.3        | 1.5.4        | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.4        | 1.2.5        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.7        | 1.1.8        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.2        | 1.1.3        | ORPH
                         xmrig |  DISTRO  | https://release-monitoring.org/project/017499 | 6.21.3       | 6.22.0       |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/017190 | 2023.2       | 2024.1       | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.03         | 6.09         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/005250 | 21.1.11      | 21.1.13      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.26         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 389          | 393          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.8        | 1.0.9        | ORPH
             xutil_util-macros |  DISTRO  | https://release-monitoring.org/project/015037 | 1.20.0       | 1.20.1       | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 23.2.4       | 24.1.2       |     
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 0.40.0       | 14.1         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 6.2.7        | 7.0.2        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.1        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 7.0.0        |     
                       zlib-ng |  DISTRO  | https://release-monitoring.org/project/115592 | 2.1.6        | 2.2.1        | ORPH
                          zlog |  DISTRO  | https://release-monitoring.org/project/021624 | 1.2.17       | 1.2.18       |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/013802 | 0.13.74      | 0.13.78      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-40724   | https://security-tracker.debian.org/tracker/CVE-2024-40724  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                       chicken | CVE-2022-45145   | https://security-tracker.debian.org/tracker/CVE-2022-45145  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libcurl | CVE-2024-7264    | https://security-tracker.debian.org/tracker/CVE-2024-7264   
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libyaml | CVE-2024-35328   | https://security-tracker.debian.org/tracker/CVE-2024-35328  
                       libyaml | CVE-2024-35326   | https://security-tracker.debian.org/tracker/CVE-2024-35326  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2024-24258   | https://security-tracker.debian.org/tracker/CVE-2024-24258  
                         mupdf | CVE-2024-24259   | https://security-tracker.debian.org/tracker/CVE-2024-24259  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                      netatalk | CVE-2024-38439   | https://security-tracker.debian.org/tracker/CVE-2024-38439  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                    postgresql | CVE-2024-7348    | https://security-tracker.debian.org/tracker/CVE-2024-7348   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                          wget | CVE-2024-38428   | https://security-tracker.debian.org/tracker/CVE-2024-38428  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2024-40898   | https://security-tracker.debian.org/tracker/CVE-2024-40898  
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-40724   | https://security-tracker.debian.org/tracker/CVE-2024-40724  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                      binutils | CVE-2023-25586   | https://security-tracker.debian.org/tracker/CVE-2023-25586  
                      binutils | CVE-2023-25585   | https://security-tracker.debian.org/tracker/CVE-2023-25585  
                      binutils | CVE-2023-25588   | https://security-tracker.debian.org/tracker/CVE-2023-25588  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2023-47470   | https://security-tracker.debian.org/tracker/CVE-2023-47470  
                        ffmpeg | CVE-2023-46407   | https://security-tracker.debian.org/tracker/CVE-2023-46407  
                        ffmpeg | CVE-2024-22860   | https://security-tracker.debian.org/tracker/CVE-2024-22860  
                        ffmpeg | CVE-2024-22862   | https://security-tracker.debian.org/tracker/CVE-2024-22862  
                        ffmpeg | CVE-2024-22861   | https://security-tracker.debian.org/tracker/CVE-2024-22861  
                        ffmpeg | CVE-2024-7272    | https://security-tracker.debian.org/tracker/CVE-2024-7272   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libcurl | CVE-2024-7264    | https://security-tracker.debian.org/tracker/CVE-2024-7264   
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libyaml | CVE-2024-35328   | https://security-tracker.debian.org/tracker/CVE-2024-35328  
                       libyaml | CVE-2024-35326   | https://security-tracker.debian.org/tracker/CVE-2024-35326  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                         mdadm | CVE-2023-28736   | https://security-tracker.debian.org/tracker/CVE-2023-28736  
                         mdadm | CVE-2023-28938   | https://security-tracker.debian.org/tracker/CVE-2023-28938  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                      netatalk | CVE-2024-38439   | https://security-tracker.debian.org/tracker/CVE-2024-38439  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                    postgresql | CVE-2024-7348    | https://security-tracker.debian.org/tracker/CVE-2024-7348   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
                 python-django | CVE-2024-41991   | https://security-tracker.debian.org/tracker/CVE-2024-41991  
                 python-django | CVE-2024-41989   | https://security-tracker.debian.org/tracker/CVE-2024-41989  
                 python-django | CVE-2024-41990   | https://security-tracker.debian.org/tracker/CVE-2024-41990  
                 python-django | CVE-2024-42005   | https://security-tracker.debian.org/tracker/CVE-2024-42005  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2023-6683    | https://security-tracker.debian.org/tracker/CVE-2023-6683   
                          qemu | CVE-2023-6693    | https://security-tracker.debian.org/tracker/CVE-2023-6693   
                          qemu | CVE-2023-5088    | https://security-tracker.debian.org/tracker/CVE-2023-5088   
                          qemu | CVE-2023-3019    | https://security-tracker.debian.org/tracker/CVE-2023-3019   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                          wget | CVE-2024-38428   | https://security-tracker.debian.org/tracker/CVE-2024-38428  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2024-40898   | https://security-tracker.debian.org/tracker/CVE-2024-40898  
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-40724   | https://security-tracker.debian.org/tracker/CVE-2024-40724  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libcurl | CVE-2024-7264    | https://security-tracker.debian.org/tracker/CVE-2024-7264   
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libyaml | CVE-2024-35328   | https://security-tracker.debian.org/tracker/CVE-2024-35328  
                       libyaml | CVE-2024-35326   | https://security-tracker.debian.org/tracker/CVE-2024-35326  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2023-31722   | https://security-tracker.debian.org/tracker/CVE-2023-31722  
                      netatalk | CVE-2024-38439   | https://security-tracker.debian.org/tracker/CVE-2024-38439  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                    postgresql | CVE-2024-7348    | https://security-tracker.debian.org/tracker/CVE-2024-7348   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
                 python-django | CVE-2024-41991   | https://security-tracker.debian.org/tracker/CVE-2024-41991  
                 python-django | CVE-2024-41989   | https://security-tracker.debian.org/tracker/CVE-2024-41989  
                 python-django | CVE-2024-41990   | https://security-tracker.debian.org/tracker/CVE-2024-41990  
                 python-django | CVE-2024-42005   | https://security-tracker.debian.org/tracker/CVE-2024-42005  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                          wget | CVE-2024-38428   | https://security-tracker.debian.org/tracker/CVE-2024-38428  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the 'next' branch
--------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2024-40724   | https://security-tracker.debian.org/tracker/CVE-2024-40724  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                       chicken | CVE-2022-45145   | https://security-tracker.debian.org/tracker/CVE-2022-45145  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libcurl | CVE-2024-7264    | https://security-tracker.debian.org/tracker/CVE-2024-7264   
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                       libyaml | CVE-2024-35328   | https://security-tracker.debian.org/tracker/CVE-2024-35328  
                       libyaml | CVE-2024-35326   | https://security-tracker.debian.org/tracker/CVE-2024-35326  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mupdf | CVE-2024-24258   | https://security-tracker.debian.org/tracker/CVE-2024-24258  
                         mupdf | CVE-2024-24259   | https://security-tracker.debian.org/tracker/CVE-2024-24259  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                      netatalk | CVE-2024-38439   | https://security-tracker.debian.org/tracker/CVE-2024-38439  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                       poppler | CVE-2024-6239    | https://security-tracker.debian.org/tracker/CVE-2024-6239   
                    postgresql | CVE-2024-7348    | https://security-tracker.debian.org/tracker/CVE-2024-7348   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-6505    | https://security-tracker.debian.org/tracker/CVE-2024-6505   
                       qt5base | CVE-2011-3193    | https://security-tracker.debian.org/tracker/CVE-2011-3193   
                       qt5base | CVE-2012-6093    | https://security-tracker.debian.org/tracker/CVE-2012-6093   
                       qt5base | CVE-2014-0190    | https://security-tracker.debian.org/tracker/CVE-2014-0190   
                       qt5base | CVE-2015-1290    | https://security-tracker.debian.org/tracker/CVE-2015-1290   
                       qt5base | CVE-2017-10904   | https://security-tracker.debian.org/tracker/CVE-2017-10904  
                       qt5base | CVE-2017-10905   | https://security-tracker.debian.org/tracker/CVE-2017-10905  
                       qt5base | CVE-2018-21035   | https://security-tracker.debian.org/tracker/CVE-2018-21035  
                       qt5base | CVE-2018-19869   | https://security-tracker.debian.org/tracker/CVE-2018-19869  
                       qt5base | CVE-2018-19871   | https://security-tracker.debian.org/tracker/CVE-2018-19871  
                       qt5base | CVE-2018-19870   | https://security-tracker.debian.org/tracker/CVE-2018-19870  
                       qt5base | CVE-2018-19873   | https://security-tracker.debian.org/tracker/CVE-2018-19873  
                       qt5base | CVE-2020-0570    | https://security-tracker.debian.org/tracker/CVE-2020-0570   
                       qt5base | CVE-2020-17507   | https://security-tracker.debian.org/tracker/CVE-2020-17507  
                       qt5base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt5base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt6base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                        skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                      suricata | CVE-2024-37151   | https://security-tracker.debian.org/tracker/CVE-2024-37151  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38535   | https://security-tracker.debian.org/tracker/CVE-2024-38535  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           vim | CVE-2024-41965   | https://security-tracker.debian.org/tracker/CVE-2024-41965  
                           vim | CVE-2024-41957   | https://security-tracker.debian.org/tracker/CVE-2024-41957  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                          wget | CVE-2024-38428   | https://security-tracker.debian.org/tracker/CVE-2024-38428  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                        xerces | CVE-2018-1311    | https://security-tracker.debian.org/tracker/CVE-2018-1311   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
