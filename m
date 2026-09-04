Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE48AC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 03:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41DFF81124;
	Fri,  4 Sep 2026 03:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv2Vbd5aJnev; Fri,  4 Sep 2026 03:27:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 51B9381126
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788492431;
	b=C+XQFCgvF4Wt4l9d+fzm3+Zzm2903mvcV902QEKjUw7duYBE9ldE0lmaJxaB/FNgsG98
	 6LSSE6DnVh8G7vHkcCsChqcP8gu/zBWLRLPaF38t1DD9jyUAzSwg2qTh66KjNNR/oWrX9
	 fQoNwL2NIvtlE2g6ga/EpdaCW2C88xK8xADgDZ3qXmxbPesc5PIq3Zx639gV3TITGi4Ql
	 unsacwtnPEBfxLKMjjl82pqCWMh7tXYAU3T8yFTiAFxz68iQFnoCFtc3Awuv4tULdLSkZ
	 +dPpm22tjSlY6hzXXNr5g34MXMOMWzl789HJJ7o+3v35aL28ZZHilvu++PEqiU29uIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788492431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=br3+Jb6c6HnQn9imidFKhas1oitLLDEfggxCRObjbPY=;
	b=jn5vFHYYK3W+gUCXj3FN89XiYzrL+stIEEvEKnOr+08/3fwxMe8S/imGZFNB8NeQHPkr
	 W+CXcyyPMUZdcORBRb1mVP2nlUQBnPU5JdgENc1EGDxiR/IOQqqJoniu8vqG75hTr0Xt2
	 l3tncezoyBtJuvUPR6QdaKDFdL1K8tN+E3NSpYis6IuZH+IK2PhYYEc+j+QN7H8xHRvBw
	 TaXRQZNH5d+5c7mGhPs+nwjLh+sg3X6Ul9ibv7lMRVgUbQ3ivT+LXPSZU1ojfkkpXpLvP
	 u7n4CU6gOB0grmZthaCECm0Ok4+h1TGcKxFaP5ufA3JEwXBDWA6vnC74o1OcEBTSbzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788492431;
	bh=br3+Jb6c6HnQn9imidFKhas1oitLLDEfggxCRObjbPY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JEuzXLGc2Gu5rIZgey4dNp6Wxe6fhjMk2CvjbWdWhhwjrBRMNTtYutiBTqx2SkHOE
	 +z5s7Tr2KBLZg5cLRStDuuIS778jm51kB6KIPvjbznTcgMndrCaNqLvUZCCAyP2vZ6
	 x0vlGDe/HYeixg78lxMIHev8VYWSHSQnunzvbhnj4HMq1I0c6QZu4KHviZvGbjDl3w
	 67jWiucaE8sDXniXNz6U057+Ks37m7CesJTRGdrDsrmTL5lMTz5sfboj+NBe0cf0Lq
	 lc/am0PnKG4a/mkKBZgQdNxgndbFYiLvZuvRs8gfZ0Peesx408oBj0U3n6UDWupSQO
	 2oWbJFTEs2IiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B9381126;
	Fri,  4 Sep 2026 03:27:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 134CA2FC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 03:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C65060B43
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 03:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlPja3X43LZB for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 03:27:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9CF1060816
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788492427;
 b=WFbLtU3dpMuICLw+IGchF1iIxYEdcusYbAgOBh/3wnNEpfIXSIf+DhZKqftjhzDwCgH8
 Tac8NsZlniSeMVTLQhtJzvoT1GHbAPOOX5Jw9/rHpjPn0fk/UibDxHfIGh9NCclaEmmz1
 5lx7C5FI0bCcHCCQ5cKtCqODH0Op26W3jhmtAi2fOLCfb37Yen3la9blwGgOcGxMVDFPa
 VxZua3yHw4DZ0hqD0L3jZZjPN2x29axHcQL5DJ8wxIkJAmV6sVpXvfAnm+KpmGx/jWczp
 zVq3/a/iZCdJ8tvF0Zo7oqA0+lVgbhlT7SQI5WwTrA0ibHHDLFSq5FxDsjclXtmzJFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788492427;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=uM/7tdFFXz1JbOABJyBhQQ368BniwTvagzbtllKNb7o=;
 b=JwgESMVF4e8LrlJ6kqyND9ySLXFKgM8PmAcBUdOiiK4U/RMGn/MgR3hWWs4ZCekd8Tyw
 /ClMCfqr9CwWjg+0GF+QZWIxWqIOEQloMkJnZ9ua1TcYix61JDoCXZP+xyYC4udMqF+pp
 JS8TkmknhrASYrotk29qP4EErPYsNw4LQa8OeseHHv86F2D+UvK08feTH8Td57qRqcD/C
 SOjLwREfIgWn9/YeJeQSDDcN0qWsU1keWUT0vx44x+WCjAPrHSs0BolmKoymT/eCTfhLV
 l+6W8ocXXrWaIjdJGMeN2/vv6xaMJzn/YYdJ0D8ye/msvm1Ehk3P89IjRfFGKyrrLuQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=U2Ai5Rt+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=U2Ai5Rt+
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CF1060816
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 03:27:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4956869750eso4185895e9.2
 for <buildroot@buildroot.org>; Thu, 03 Sep 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788492423; x=1789097223; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=uM/7tdFFXz1JbOABJyBhQQ368BniwTvagzbtllKNb7o=;
 b=U2Ai5Rt+MHBIue1oM3s/ALiteWJ1pkBuspsH4G1rZo2Nx+Y2jhwgVAHDZWNZqa3GvC
 UN5UInBzYygAEbXJLIgWqwOuBOzM4WNb/bYi83DjjC605WaJYi19yeHhvoq9JaN9aXAZ
 5SFrGFmaz33HRFfuQFMHPu2DKts+oTEgM6UChnT8hEYcB+aN+gedVkngFTWhjFr/n/n5
 SI/ZX6IFgtX0hvdVF5kQ5WrjrzA7nbzOXL3glY3v5pFg7yYOAKqImus+w6Lyuu6lFsEu
 pEDDLeMXKYHnprYaUBhiWAT2mGRfrfbN2411YxW9Q+kXLscjznt7D23YIQHDp4C+rTtH
 kDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788492423; x=1789097223;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=uM/7tdFFXz1JbOABJyBhQQ368BniwTvagzbtllKNb7o=;
 b=htzXV+H0cCUZfotSQ98tDj3GJ3zeecz9xES5wqyK2b+Q3iITCppJZ0f6AACAOGEnwp
 a/O1nfW6iRMqy/wPgyIE2tAPuLJsxw8vonT0QTPEXBI8DlnBdJF47zcoNWuwaHOwBazw
 nnSKlS3WeOsB54fnRUJemwy6dwhFgChoiy6FvYbuwSiJvSmdQuPTZ+X+LdzQ6yPOwsD0
 8Cg+v6cyPUEGm9esIPXkh6oYpk/55nGo2cMQfMSM10gS1vYfMJfJoBCvQPB9fzEKRC//
 EHBfDL3ix+EErKjSKttc+M/KxsAxfuzJGm/i3yE6yP7yZ+LHYnUFLOekDAvdcLTnkyOv
 KNnQ==
X-Gm-Message-State: AFuF++nLR8YTx3Z6wWLHP4xAhDWq61B+NaFoJ9e37NpkltrZ+Sapx0Lb
 GcqWhggr+TREsYQ7aOsgduY/SqDzojSj/1Pi8YAjfy30gw4pA9Xh6S7twEp6H4Vy
X-Gm-Gg: AYBFou1CGO54WMG1X3Dx6kzc6FWd9+quF47/d62vdZ8dr4wXqBXpQtMt/wktAna6Lm2
 gYsAbkiTz06yQo4O609o7XSeSd/vGhRV2J3ULMkCRIqSeqr9+FGIz6ffnvQEzySKGuu6mZAtqqG
 rmFScIkSG7HQGBgSQHjM5qQNveiR7d5o3MkNHRBxK9BGzPr1F6BX3p3QTqFuj3ICssshWXIkCI8
 LmrRqYHNEYy0cP1qg1Zpb4jROohR+KsBJSzKQoEONjGw94icdLSDJTPS1bw4gb7T7vKd0z2OGlB
 YPn5lb/LZjG4OhtBdtyulao22u/PsHi4T8637SWDTRHSZKr0ptCiV6w4yIVzTz+DXlin+926b68
 e6IgbnFLgGavKa+jdYvC7pNIL088agpFFoJ7XrujNFBS3OVmJ0l+9quci1wo+iGXGHSNA4JBZS7
 zUFutf1kxd+xC8LtbnvuYCRdU+ZgGdYIx0W4OXVQHh1X8pKdPK6vW3eBe0V1UMZjY=
X-Received: by 2002:a05:600c:3b0e:b0:49c:eb04:1c49 with SMTP id
 5b1f17b1804b1-49cf8254d53mr25601285e9.13.1788492422871; 
 Thu, 03 Sep 2026 20:27:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf75cd8d0sm30797745e9.2.2026.09.03.20.27.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 20:27:02 -0700 (PDT)
Message-ID: <6a9a3a86.78c1dacf.33eb0b.67e0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 04 Sep 2026 03:27:01 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-03
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

Autobuild statistics for 2026-09-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  | 30  |  0  | 42  |
  2026.05.x  |  2  |  9  |  0  | 11  |
    master   | 36  | 79  |  0  | 115 |
     next    |  5  | 13  |  0  | 18  |

Classification of failures by reason for master
-----------------------------------------------

          host-xfsprogs-6.19.0 | 5 
                       unknown | 4 
                   dante-1.4.4 | 3 
        edk2-edk2-stable202602 | 3 
               host-attr-2.6.0 | 3 
            host-go-src-1.26.6 | 3 
                   perl-5.42.3 | 3 
             dahdi-linux-3.3.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
               gocryptfs-2.3.2 | 2 
      libabseil-cpp-20260107.1 | 2 
   openvmtools-11.3.5-18557794 | 2 
           virglrenderer-1.3.0 | 2 
                    attr-2.6.0 | 1 
                   bash-5.2.37 | 1 
                   bird-2.15.1 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
             docker-cli-28.5.2 | 1 
                  dpdk-25.11.2 | 1 
                     ed-1.22.5 | 1 
              erlang-26.2.5.15 | 1 
                      fio-3.42 | 1 
              fstrcmp-0.7.D001 | 1 
                  gnupg-1.4.23 | 1 
  gobject-introspection-1.86.0 | 1 
             gtkiostream-1.8.0 | 1 
                haveged-1.9.21 | 1 
            host-autoconf-2.73 | 1 
       host-gcc-initial-15.3.0 | 1 
                 host-gdb-16.3 | 1 
       host-gettext-gnu-0.22.4 | 1 
            host-libtool-2.5.4 | 1 
                host-mpc-1.4.1 | 1 
       host-nodejs-src-22.23.2 | 1 
              host-rust-1.97.1 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
                libmpeg2-0.5.1 | 1 
           libzenoh-pico-1.2.1 | 1 
                  linux-7.1.13 | 1 
        ltp-testsuite-20260529 | 1 
          lttng-modules-2.14.3 | 1 
                    lua-ev-1.5 | 1 
                 mbedtls-3.6.6 | 1 
               nushell-0.108.0 | 1 
                   patch-2.7.6 | 1 
     portaudio-190700_20210406 | 1 
               pulseaudio-17.0 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                 rtptools-1.22 | 1 
                    szip-2.1.1 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.07 | 1 
               valgrind-3.26.0 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/ca69ee0532948f8598ead0e591ecc349a007cfae |     
  riscv64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/89ecad30129d09b80738ca19fd9155c6c9dad2ca | ORPH
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9cdb5a7a5c917fed42d194bb2c7bf4068f7c8a60 |     
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/b06991c6fb5bd9d2e9cf5b9adec0f3adeea91892 | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/109a07bd195518bd8f7fd056a9077f5c5f3d55c3 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d46fc7964fbd72a918a0703f0053ce3c3059deb9 | ORPH
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e46227f1bf586064071e74d5ac97a66aeb7ce607 | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/042cac279836040f02ae2f883ebb80a7f6971069 | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c41b7ef1d4c6a3c2eff14de8c7f7f9e843dba656 | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/4b4ad8b05984fac783e7ea114bdbbc621dd2760c | ORPH
    arm      |       docker-cli-28.5.2        | NOK | https://autobuild.buildroot.org/results/fbe3f8ffc739b28e28a9e1d46c7b13d11f725250 |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/cc8f7d3c6d444e3ff28c178391be5dd475394692 |     
    arm      |           ed-1.22.5            | NOK | https://autobuild.buildroot.org/results/de5720d05ca47fcfe14496bc586882b2a420ea29 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/6795017f4dfe4954cba631bc2aa7e1f63275e19c |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/be3a346b80cc21507a3a807f0e526018a91e79e3 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f0e9dda2d2118daf06135aee780d9879ddbe0193 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/6d5cd7744aec8fc295a970748b7a99ff39320b92 |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/e6f732c266caafad8aae6b3afb16aaba5e3d0fac |     
    i686     |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/4fb01ff5c08564aaa921d372a3041b052633e828 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a2ef1112be0fb8cac57a2032e326d66ba28f06a3 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0c88b3b4bcf5eea60aa50fdfa4c8f16d05345635 | ORPH
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/234ea4592c95284abdbd4ec206edd34de18cce24 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/329113a4be4ad51858f10c0ccd85339656e62da8 | ORPH
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/1b007c76a448a3451cfd9b4b29d357d30cd8854f |     
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/eacc3673cbd478aa9e579c8732ff54e6d939210e |     
powerpc64le  |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/c50b367d4a45b0edb69e258ef103941da1304287 |     
  riscv64    |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/2ac3d0051e4e37bef2c71ccc270066f7e08d34a6 |     
    i686     |        host-attr-2.6.0         | NOK | https://autobuild.buildroot.org/results/0deb5d708827941c7a64363a5de614727fc8f3df |     
    i686     |        host-attr-2.6.0         | NOK | https://autobuild.buildroot.org/results/01cc37595874eab65a4a3cad51bdedfa8977b81b |     
    i686     |        host-attr-2.6.0         | NOK | https://autobuild.buildroot.org/results/2d2dd5c7f7df29f64d30a151e02d494ad8da028f |     
    i586     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/9173f71eac212efb5c17aacf18de613fe36c49f2 | ORPH
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/48560b98e2b3aa1dbbbc844740a2a415946c29e1 |     
loongarch64  |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/2e5185321445296549a3bef24db30bfd2df8bcbb | ORPH
   x86_64    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/d7958d20772cdc977c30709d402ceab25f50a522 | ORPH
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/136cf57256fb110d82e8479857f9c3f025530624 |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/731e9df742d866ba843af7f05b5e0a0b39796974 |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/4a0c883f581b964727fca334e697ad7ce7bb37dc |     
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/b02d35c0f2f4f5edd75d418c59dab7c17535a09e | ORPH
    arm      |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/854c2e0b2904b6f5032bf707ea291409a4c0ec7c | ORPH
    i686     |    host-nodejs-src-22.23.2     | NOK | https://autobuild.buildroot.org/results/21c18c0fc261e417483d140b6be58e94b904f566 |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/346a77384b90bbde7a53182175f69229d8f6c7c7 |     
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/d5a63e2d42bf88bdfbe75d835bcba04370710635 | ORPH
  mips64el   |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/f59d98bce29e5f72f15917596de5f21cd64c34fe | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/d2b0c7a14a003a1a3808118ad14a07f4d6c5b166 | ORPH
   mipsel    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/913400976f70150abd0f3356a05165f92c3758c9 | ORPH
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/855b6f1f60c1f6b57e599d588bc7f80b066c2f7a | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/bafb6012bda13f76ac43e45e9aec7dd095e9f36a |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/c0d156d390f7954ba9616a8bf48de906ec9f5ff6 | ORPH
  mips64el   |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/f375584f3721d61238b9e43d9926e037802f6141 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/71b6c2bf223338e61a5f2321ba00245f6a204186 |     
   x86_64    |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/e2678fe36605a01901893dc4826ed087bc820ef1 | ORPH
powerpc64le  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/2e8a5dc168799c9ba12d396d872149dff2ff7387 |     
    i686     |          linux-7.1.13          | NOK | https://autobuild.buildroot.org/results/c45eb89c84a1623206fdffbdf064748a31bbf17d | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/2f3ec5ce433d2be88062f0993457dba1df5c2990 |     
    i686     |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/f221d300f043fc826c5aaab9191b807193f455ad |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/1a1618da6e44cb8fa7df4225eb1345bf2cb9518a |     
  aarch64    |         mbedtls-3.6.6          | NOK | https://autobuild.buildroot.org/results/29295babbedcb84a0f09992b72c41a91a32aa94e |     
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/95c79c9a4409f6cdd160640de64b63b457c73dd0 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/30235b31857d1830a17a4bf71bfb3cd589c83d14 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/e85d2a94ff059992e5ced330ed277a79e5384d59 |     
  riscv64    |          patch-2.7.6           | NOK | https://autobuild.buildroot.org/results/425ab77852fd1fe5ebfeb290bba74ab495ab06f9 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/dd47e6f3f51c2b857886932be8776f8a0da43a4c |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/6480b1f1c45c94eb6b574f8816d03ba000fccddb |     
    i586     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c082cfcfa428ed881fa0be6090ef50b6d66e2c89 |     
  riscv64    |   portaudio-190700_20210406    | NOK | https://autobuild.buildroot.org/results/8eacbbd5cd6f72ff935a0b325db68eb13cd09b89 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5816281c22394662042576506ecc6d866cc1c042 | ORPH
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/57990024369dbabe5500435af33b41481697561d |     
  riscv64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/94a317f4051a0c56e4b44e472cb2b2582c738d44 | ORPH
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/8738c7d2b514a8de963e30a1fa5a0c4d960a7387 |     
  mips64el   |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/ced78495de40bee226294512f961b1fa33ce0713 | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/b7a63e1c638fe53d139a4c2b9a2e18ee3c76075e | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/815af8f06d787a943d29be2da5fcc9035ff5e449 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/50d62e5e1642554fbdb3318fe75ae4b12041694f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a91a222e08557145af3810e04bd63e76d19a4eb4 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/2696912323819f084870011d0f0e037902946e2a |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/c2f09538a944b4979bebbf573c4e08e8949a13f5 | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/3c267ce3a042325b73e5563cc73b1493a0641e65 |     
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/ccb153e077b32c4b3f85d98927260bc612065340 |     
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/eeed5ddbcd74f0f570118645887ad79ba16bc66a |     


Classification of failures by reason for next
---------------------------------------------

            18xx-ti-utils-R8.8 | 2 
              jpeg-turbo-3.2.0 | 2 
                   bird-2.15.1 | 1 
                     ed-1.22.5 | 1 
                    flex-2.6.4 | 1 
       host-nodejs-src-22.22.0 | 1 
                   ltris-1.3.2 | 1 
       python-autobahn-25.12.2 | 1 
                 rtptools-1.22 | 1 
                    szip-2.1.1 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/15bfc1110fc5f986bd391308d6bbfe95332f2820 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/fe834d809bb38580fab28a82de14f5d3689cd438 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/82b9568c609ddfed66be237c340f44569cf18a5e |     
    i686     |           ed-1.22.5            | NOK | https://autobuild.buildroot.org/results/8072d878783e0e0291a6a87afd438622096937a4 | ORPH
powerpc64le  |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/0dc9cd81833e3b2a476c6cb6b466c5db0b166de1 | ORPH
    i686     |    host-nodejs-src-22.22.0     | NOK | https://autobuild.buildroot.org/results/b4740fdc5557f80c7b2f189e3e47ca29272cde3d |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/39d65ff08bb9525416c261eba4d2d1995eba1d68 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/0246654a33434b66831b5a53be50b863a2064ebf |     
    i686     |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/66dafb640fe04cf13c082c3980de030296392100 |     
    i686     |    python-autobahn-25.12.2     | NOK | https://autobuild.buildroot.org/results/b930b726383c1905225d80601bf18c08c577a1d2 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/68174f3a661a5cbda7bc12d82b2e423f5773ea41 | ORPH
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/0020155af12fa5fa9aa06174e108f193d491e11e |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/45fd3872f496e2eb36370bc03f54fafc015da01f | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

        edk2-edk2-stable202602 | 1 
               host-attr-2.5.2 | 1 
           libmicrohttpd-1.0.9 | 1 
          lttng-modules-2.14.3 | 1 
                  newt-0.52.25 | 1 
                 openmpi-4.1.8 | 1 
package/vim/vim.mk:88: host... | 1 
                   qemu-10.2.0 | 1 
                 rtptools-1.22 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4e1a10f4b35a21ffae556f6aeaea79b58ac0bfec |     
    sh4      |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/0926f98a4492f166cee2092308b5ae17a879efbe |     
    i686     |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/dd8aef0670417d26e3f95d2aa68fdb33fa86e9ce |     
    i686     |      lttng-modules-2.14.3      | NOK | https://autobuild.buildroot.org/results/a7bbeab9589a937277d002ee753b022f823b3787 |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/37ba7f540f98439d7740bb4cac848771bbf39388 | ORPH
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/0f41a0ba72a265473b33da52479d509d648055bc |     
  riscv64    | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/45bd2bfd9b6c62b53f223d0db8eb4e1a35113196 |     
    i686     |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/7c46dd87c5bf4db1dfbeb47a7a5f0fa49b8b923f |     
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ee2bd52ead5d6fe7b02f487248f9afb57b15c0b1 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 2 
                    polkit-125 | 2 
            18xx-ti-utils-R8.8 | 1 
   azure-iot-sdk-c-LTS_08_2024 | 1 
                bpftool-v7.1.0 | 1 
                 coreutils-9.5 | 1 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.5 | 1 
                 fwts-25.03.00 | 1 
          gitlab-runner-15.5.0 | 1 
host-autoconf-archive-2023.... | 1 
          host-binutils-2.43.1 | 1 
            host-coreutils-9.5 | 1 
host-netsurf-buildsystem-75... | 1 
              libmodbus-3.1.11 | 1 
                  newt-0.52.23 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.30 | 1 
package/vim/vim.mk:88: host... | 1 
                   perl-5.40.5 | 1 
     portaudio-190700_20210406 | 1 
                 rtptools-1.22 | 1 
          sphinxbase-5prealpha | 1 
                   swipl-9.2.9 | 1 
                tinifier-4.1.0 | 1 
                tpm2-tss-3.2.3 | 1 
                       unknown | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/1f554b251514a9304e69f7e3061104029913a5b8 |     
    i686     |  azure-iot-sdk-c-LTS_08_2024   | NOK | https://autobuild.buildroot.org/results/521478d4628f9224af854ca5cd7a2250b1b56607 |     
    i686     |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/5ba1fe1e0fb732172d17fd9ee77b8031c7fc5125 |     
    sh4a     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/b1cf06d1171c39faa3025a202ba228456d04ac5f | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/14908472d8af9ade7ed5665562772add582cea37 | ORPH
    i586     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/6b917ab0acf79d40c6c2351a07d37627d7757b94 |     
    i686     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/590dee0deb2e182f54520cb5fd187cdfda0e61b0 | ORPH
    arm      |      gitlab-runner-15.5.0      | NOK | https://autobuild.buildroot.org/results/e155c00ac6b8f1c34603587dce9198e94a84c028 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d10cc7befae365a0327519513faf189bf2f742bb | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/d0bc8ce8a2ae9bfd4c3b67cae23b2a2e2cc653a8 | ORPH
  aarch64    | host-autoconf-archive-2023.... | NOK | https://autobuild.buildroot.org/results/2a196d77819bcbc22369a6a237dc7812eb294d2b | ORPH
    i686     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/26a0459b20cf1d51af01f84345a22e8ec69517dc |     
    i586     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/d83633a30876305676f478fe795a9cf7930a3028 | ORPH
   mips64    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/a07e7a0497bcb93d2808b95c4c8f106706697484 | ORPH
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/d74621e04d46786eaa3ad3c1bdb96332e97cbd9c |     
    i686     |          newt-0.52.23          | NOK | https://autobuild.buildroot.org/results/6e7d67d5b49c1347c2cb428cc53fbe48c6fe26f2 | ORPH
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/9c2efcb400f37bf60da18968f4729927bbfb7159 |     
    i686     |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/6be24f3cddf44f5799f3f87919e8c3f8ab02b6bb |     
   arceb     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/c3a0561bee52d01fbb71465ab25d6d9591d5f202 |     
  mips64el   |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/3148dd31ad9f329d2d6b493e02a17cda64b67720 |     
powerpc64le  |           polkit-125           | NOK | https://autobuild.buildroot.org/results/5b09b7a70deb0d3502803476899ba918db20a5f9 |     
    i686     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/8858b80a647e5931a81d661b393fcb47048be443 |     
  riscv64    |   portaudio-190700_20210406    | NOK | https://autobuild.buildroot.org/results/8808fb0f029d22565697f765d10eff33cf7e7a34 | ORPH
    i586     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/814a84e623f9c3b792da3e93375639e18820620d | ORPH
    i686     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/53eceb7e5af6ffdd3925109313be26886ae0966b |     
    i686     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/75a3424a784588aa912b63a992da6fadf9e0f03f |     
  riscv64    |         tinifier-4.1.0         | NOK | https://autobuild.buildroot.org/results/2f153f874f71715c1785273a1b37b417831478a7 |     
   x86_64    |         tpm2-tss-3.2.3         | NOK | https://autobuild.buildroot.org/results/164d443b69ca13b09f98ff3b56b529d77d8ef1e0 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/534525d5ad6cf9c987d91847083ab499b6c492cb |     
powerpc64le  |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/5c6459834c31136e9b8b94016d8d85350afbbe2f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
