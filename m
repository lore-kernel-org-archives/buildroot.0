Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF80C88E50
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 03:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4848407C5;
	Sat, 12 Sep 2026 03:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOeZoAKM4Abx; Sat, 12 Sep 2026 03:28:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7782F407D6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789183718;
	b=aocdqFnoeJRAIDSqQwScaUOSUTil/EFkhraYgu1gIH2zYAqubRaUT/wBqFDu/zJyd5U5
	 WHmw56GVCUtfaDxZanZz+1MDk5rd/RV1D38msqo8rxGZk+jPkSQHkU7hD1mOG8IPczMLs
	 Bs56EgwWP+lmZAN1HVW3HEUhl1eC4Doe9wGfdWOGlXgCUy82WVVH0/WENmoicJBI127xX
	 Vk+1qxzVmZtsxtP/BFoA6hZH9ar7Uy9+uEXer64nWYGXhiTEd8QBIYX3xXOfYxJRqIsVm
	 n9Q1YGr17xmYaZQGsgP3apH31Vps39g213GA644QhcmJZnrZQzI/FYAGxLIWf20+5IQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789183718;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+t15WuuvmFrS63sW/VHMe9da1dMbwFebLPaBaVNaz44=;
	b=e8OEPSDTRx5OYEb1b2rm0SdT/Bwha5jVcPtBXr9ilhcAnTaqWcLDZqwKdGF/CuORZcVH
	 X/B3uRJEmNCoCwp1rKdq/3wbPDuJmNF0w1VyTssYNmeIDZGDQ+v2wtiZREfydt7YNxQZQ
	 H7MjAfOYCHwIPBMn4Lw/GuslWw+UJiGi4ANdZADRRkfgKrPF4PzvFNHlzwd0260BWlYx8
	 hN7Cg542GWh3cVaJ6X+lSk9Af1P1iTBpCktJlFIVgeZ2IgMon643ZqT5oXWvDQXoBJ1J6
	 8HIUFCzhbRZ6xBT3q4WrEWdYbtabvTWvs4MduNE4KSPPXM71tGCQbKrnSB4hJeRfscA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789183718;
	bh=+t15WuuvmFrS63sW/VHMe9da1dMbwFebLPaBaVNaz44=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C9EvQ55BN8Akg8O2wSymmDGG++1GXDgIEY4tItFM5d6TxO3Oto0zaO7WeUOAypgQ3
	 nchstJxNW/y4THjj8pijRyExfwUkPoHrpHw6otOED5MiXSFQHdNYX2BFmp8xssTfVi
	 9SGPgfCCsYQJkulR1ZbLWO9Fk+pFxH4PEvf65I4owSh8lJNNQzl6yNFAOuNoZIgzHj
	 /75OfveVR4koA+gAn+AECKICiz3IS/JFamdWJBRZWfeV09UvzUljxyMjJMitBHhIRU
	 1We8sO9sTLALRtL41DUHMT2ozlaZp2iw2W+P3J3W+ka5Fddi1L2zFlyaS0W3hBQP17
	 D2i5vtrqQVrpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7782F407D6;
	Sat, 12 Sep 2026 03:28:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1E322E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 03:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A358C80E43
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 03:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdlsL00wSx79 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 03:28:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 436B980E36
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789183713;
 b=eMBifHkqQuZtY7sr5c2OB+e1/MFLKkZprheG7GJ5xhZe8YUndKrteHUcW2HxsmWV3GoB
 uNEtfhJNVdTVyQCG3uK/p8FicNu74XHsmuU0ts60ojbefWm+pI20LdK2IUqG3s7hip6y3
 NWCDcrZiGBMMgOexr18ZnzoRLL9+5/kMLabur9Zau8z5bz1qWkIT+SlrvYG2zf5mYoNU9
 +WsGoXnsi+BbnwsXadJ4yYt3pS/ffACG/Cn8iiA+r+syclS1b8v22Izi3niWCh9KabIJT
 S9AT4KRFaPUtDnJNtFzi7DEFG/17kIYoTYHyGAL/kZdukotxX2VBHbxswjmq6x/XLfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789183713;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=MSun7S0JVFLnKpx7pfmW5VSABN7aAwQ9SIlczmZ3H6k=;
 b=oAOcCDdN8ys83J/Aq06WD9OtOSn5IpT8+ArocoK1I9orWjGcEl30jk0ZVQUO+lfAzGZO
 V7etgHV2iG37YhaXdmEFgOMzLeAHSs60a/a5OmIbvo9pNRSdUol9bE4+ULW+G3jgkc4Iz
 cVNss/iApoQXpS34vUaf9CSzRgU2Xy/i5Qm1gwtigjrYUSnF68hk1aHgfpt7rnP8QQELf
 EwqNXzdXDNecXd3HB+iWtcLHsslcI243Ambrorc+aGgCf6TGd4xfqfnsNMYMNgOjqI51l
 m9Y62siViiqzGgLQlh0keaA52Wzx4YMY7/llaB6PCQjHtS/UKHs+LZg3hHxx2C5JS9A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rq9JgDmM; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rq9JgDmM
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 436B980E36
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 03:28:32 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ccff31419so1585885e9.3
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 20:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789183711; x=1789788511; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MSun7S0JVFLnKpx7pfmW5VSABN7aAwQ9SIlczmZ3H6k=;
 b=rq9JgDmM8kTmqonRTBOLfQcMulpv/vcmEhTRGbGGcrFifB+fDC+4FKZVSalf2JWSn0
 MuyW5FnTFIkfwKB3niSgWj4NF83yrV8ST7LGYY3eWbF7GUM7cNHj0CC9BTirXGrNj8F5
 Alxv5ovkioSmj1hTLQHA4YIQ7KTO7E82pg6Tvi8iKeMiuyUqc1Z0yYBRuo9Mx8GtpBdA
 jWmiXW4LG5rLpY9cXOaBdxwYhnJby22hHlmW94UopDPsRdbCuZLa7vfpDdD7KTvDhiP/
 DYQtD6HlJS/sfoifP9WTE369BsnB0GVhW2HRVZoc0T0JaXkBX+Ls5t7ewLX/rekSmqNM
 2jbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789183711; x=1789788511;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MSun7S0JVFLnKpx7pfmW5VSABN7aAwQ9SIlczmZ3H6k=;
 b=fsBeCcEPXOFyFSUqISPV5od6lbqTT/V6JWkv3wWGPzxPvUiMD4V4nCty1DUFKl79/A
 aKCFVvCBDvyEA6pGhUsqEsC/cDJS8YiGpS/rIm2uUUNzpZN3xHKtEC8xMGQwn0uhqH9U
 nZpJPd1h/C98ztMB1Ha0RvSrQNBFcUekWcAjVgZOeiq9SWHF/wQ9F1AJbsgQAY49vDPL
 tnwCAMwkW7Etb+JsuSPu+v5GAeFvMnXeX8iyFJzUh8ctXP+09u/vHMXanC9IGVrd6lvi
 6MVN5QOQqPx7t0FpGanmG7kFzS/FQHKTc+92Fb1VnFjTgjFOhCyUqk242kT6YlwsrkQm
 QXog==
X-Gm-Message-State: AFuF++nar37ftVTm7+JSMcvLW++FUGYQzhUBY32wioiCEtRkgCLRZELO
 pk+rW4x5MBRdtwFqqqb0bY1oGAP9ff6tqTrhwWic4KfTg+26zNxenUr4JOAvY0O3
X-Gm-Gg: AYBFou2x1d8F/WiA9NynDEt8Wai60rvEo3BsvteNo/A1judwoOhWmqXT9FiDYvEfOjB
 Avobtf3//+xjRLEqOIlzKObiuFma5KgQUtp6oupStfDHeSn2NVBRkHIMFvzByHxPeU4XKu4AfFh
 td3ZfGT8W2PZGltH3asQIXUpj6++/40Jg3NXa65rNg/fP+Pru5jO03fA+kj+aCOOBAX+2T/1/WT
 BBkjvdP3nuumI+2eVy0DyNZrDNeXzgWQH3diUE1g8+fbnzTAsODwEmypdrfeX9nFHUvigW7oTRQ
 GjgfMdZeCEsHXMTcQDGUPZ2jomo6RfVtq1QZskAG+Nc77TsphkTTUOxPYjwz8qwEpSt2P/34oPX
 AKuraaA+T+/etRo8kJGOas9/bFsmQ7zbTBu427mKPK4Mc3+N1XrWAg/0HsF0fgdsuCCeZSuoW/7
 6e3MffZBsMUk+znhD3YCMKx+M4kGAEPvIYZtLY2PhaEps+AlJiDAECGT0MpxHjkRNgBFQ3aS+O2
 L88lX/KpC82
X-Received: by 2002:a05:600c:3501:b0:499:7219:122f with SMTP id
 5b1f17b1804b1-49e6caa72c4mr8484885e9.4.1789183710556; 
 Fri, 11 Sep 2026 20:28:30 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e63c9a7c9sm166488645e9.13.2026.09.11.20.28.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 20:28:30 -0700 (PDT)
Message-ID: <6aa4c6de.dea6c963.32655e.2583@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 12 Sep 2026 03:28:30 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-11
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

Autobuild statistics for 2026-09-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  3  |  0  |  7  |
  2026.05.x  |  3  |  2  |  0  |  5  |
  2026.08.x  |  1  |  1  |  0  |  2  |
    master   | 24  | 30  |  0  | 54  |

Classification of failures by reason for master
-----------------------------------------------

                  ffmpeg-6.1.5 | 2 
           gumbo-parser-0.13.2 | 2 
               linux-pam-1.7.2 | 2 
                    sbctl-0.18 | 2 
                       unknown | 2 
                 aichat-0.30.0 | 1 
             alsa-lib-1.2.16.1 | 1 
                  dpdk-25.11.2 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
                      fio-3.42 | 1 
                flannel-0.26.0 | 1 
glibc-2.44-40-g30950ce64dbc... | 1 
  gobject-introspection-1.86.0 | 1 
                   gvfs-1.57.2 | 1 
                host-lzip-1.25 | 1 
           libsoundtouch-2.4.1 | 1 
                libsoup3-3.6.6 | 1 
                  mender-3.5.3 | 1 
    python-cryptography-48.0.0 | 1 
            python-iwlib-1.7.0 | 1 
rtl8723ds-122a574f780da32bb... | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/e3f1cf4af0197d853895fa00ee4ff132613c6d5c |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/26dd4d9949805b71e69fe25ac3c6f2b76ab477d7 |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/5c7079e158d6ead5a099433ed1ea3d4a07e19e91 |     
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/a57ba1feaf1bffb2fe56262e3e33729247f32de6 | ORPH
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/65968f00ddcf92ae41ff7fef9214bd1ac7b6ac9e |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/6bf20b6f48e634f276d38dadf37bf74971fb878b |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/73292b621f85eb0669eee5a4e7c374b57b0de6b5 |     
powerpc64le  |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/ad9686498dd073ec403669f2315c356af2b4a7f4 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/0d09cf7b415758edbda8c3baa3fcdd357980745b |     
    hppa     | glibc-2.44-40-g30950ce64dbc... | NOK | https://autobuild.buildroot.org/results/641fce713b4c455dd220acbfcc4ab1690e3b8665 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/0230ab384cea50bcc9b510a423d223f9b92c592f | ORPH
   mips64    |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/8172ba794d3f5a9229d95cb4d5a9ffd8288f4f60 |     
powerpc64le  |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/8cb78aab718768501958ea4356a688ecc3d8c558 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/2a0348e1a459003bfa185b938c3534073ab3be0f | ORPH
    i686     |         host-lzip-1.25         | NOK | https://autobuild.buildroot.org/results/c23cc0fd9a1d03d036c26f49c77291c962e8d1f9 | ORPH
    i686     |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/644b6410a8a6de60002895854c122dc92076e4f7 |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/b799afbe5596e8677bc120179c0f5b4277757e22 |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/927a3aec442c6d112987c00d2935a6d40a2ed6ca | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/d8e91fce2c04850e00a118091c700014a107d6d5 | ORPH
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/4883e241e135b26dd7e6ab9ac22a226f8dee8ce0 |     
    i686     |   python-cryptography-48.0.0   | NOK | https://autobuild.buildroot.org/results/0ec14c3a05aaeaada4ad004c053154a8066efd1d |     
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/d9ff8564f2e5bc8d5b004ed21b1cacc9804c7cdf |     
    i686     | rtl8723ds-122a574f780da32bb... | NOK | https://autobuild.buildroot.org/results/1dd4d422ff2566f6489d047fbaf4f21a3364d77f |     
    i686     |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/c20f4073830be0c86e6610deb40f2fae0dab622f | ORPH
  riscv64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/53d41bd72e805ef14d832ccbb9b4b2ba40d995db | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/29065f15ea27df6b2cd42e9460e6194501e5fa8d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4c05eae4e789c82a110a50c7832a92da58fe750d |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3a6216fac46a8543b77eda53fcd80753167763be |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a38bcd2705b8f09f441a234c6e41952165778758 |     
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/aa778337a7fdc439a54d2d5d0af7cd67e7e444fd |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                    szip-2.1.1 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/8934db6d452573524009b619a90a8ddb8d3f8b08 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/aad24dbadb15674c63ab933503e64a486d47f6be |     
    i586     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/eea05d04be7dc3b3470336a423cdd53912752bc8 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

            host-go-src-1.26.6 | 1 
   openvmtools-11.3.5-18557794 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/85793c3b19819011436f3cf7a353b1b8b41b49b1 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ed3deda2a1c1240303ef2438156c8dc09b16ad96 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0e605cf4d21c0b8a1c5cead3578cbd5f6fe36874 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
