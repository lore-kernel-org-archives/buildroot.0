Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24AEC79FB7
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 03:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 850FB4085B;
	Thu, 10 Sep 2026 03:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Opl7SOKnQv1E; Thu, 10 Sep 2026 03:27:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 06B3440860
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789010861;
	b=TwSuiVNLyvsbTZ11vy6dyT4O5UIBdX7J6xu2ParDJ2REGv6kku5nY6HbHurW/cBjou4b
	 1bN0G6OVMPWnJrkg84qEQohnOMLnjLz9J3z4QXtgwsKzx2IVrfxbOLUYz08bWimKDFKzu
	 0Emzyu/Pa5HKr5BSWC5xSeNh3mMY2waES+26nR2R7sZchYyUHuAZD/ztrpmlKkYZkc91p
	 TUT+EGZkNxBQDMbid0AKJFMwi5cZseGaUuOtTZBxLt/LFJRMdfn+TOOPXTP1TbyVVNeTl
	 IZsu4hE296oYcDGLbJzSz4cGINWHKkBSrzAjZeR9Ciclo77MTQwU34sXGXMxUkD1lJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789010861;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WUYdMwcjWIuNWVUoQ4gcotVi1b7JCa4zlNAFbCj5vo4=;
	b=VhukjjupIUaP/nZsvTqTQA5EMuYRWNe1uROIujm0Gxbb/jUeSDuiVo6zaNC4HvGOJCQP
	 fEIXalEEVoih2kAJ/qZS5fmZtLGuhS5aLDbO0gCak7gPzmpwIZn1TV7vluzTMLaCXsFyT
	 8wWS8LWfI41Skw0C9C6WS3ePiDGAWMSJj4z5uu2iM7I1NP7PNMR6EHu64z3HwGEa2tYoS
	 pAnoxFCyhI6Pyqu0HJzcGVdqxA0Hv1p/dT8IdbdlY+ut3iAlbOVmHXEheQNKGAxS8BxO0
	 iXyzXfZd4NyLUChhLkXWWajNxdhqjz4wXWS/qDiRz7GPqZXuzeu4SmczeILN3qAI93w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789010861;
	bh=WUYdMwcjWIuNWVUoQ4gcotVi1b7JCa4zlNAFbCj5vo4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fGN/eUXjJsHLeqdlE6nBu1gXX2C04ySfGoWJh3gVT3rwXQkQ7g/OIowKtxB+AX6w2
	 qEGaCH2euwXTud0t8fq38cLvtoLTc9R5wJJmSGyG+EmFth2R+Cb7PvpcpDdfRt4Jtc
	 l98ClUzJNsddwyu8AvZWGY6v9Y7bs8r5hVVYlzE4PdYWW/ps04NWsvodOyQoVlEnRO
	 8/GOw2bj86DRVnm2ptTDDwYBc83FVVZ6IrA+w8GEBhSya+aI3j7Thx7yrS6REHUiJx
	 XI3ISJvaspK4ZlUsdhzLwezET0lxEP32Gw227tlOoTMQoq4dhjO7P1yorYOAe1Ue+J
	 9SZL08DBTXMmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B3440860;
	Thu, 10 Sep 2026 03:27:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2E7F32F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 03:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7EA880F01
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 03:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bdYX5Cnbl0c for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 03:27:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F2E9480E94
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789010858;
 b=deaxSDKRGup3HOMMLj0qzTfHhnRqmOIi8QwcizWhAoYBhzdARSZriiinVIFUXsgNmIYo
 NuJyN6rM+CxIcVLsmtp2ryAZ+iYGWleYgDNI55BEkSu6goZ7xsCnyfB4lkQhl0/R33e0D
 sm+0Mfn4BJs4r31BO3Ne1aHTPRURAVsChFC7n6F9cvwml08EUchxPCKdw83epj193nqKM
 OmkPNlgGvx/nkIDRT7Uqz7tNUsIoTEF4jFpI+eaxoWa8WoXBToMPKEVS1jPI8CcWjIS0R
 1KiE5fectWiNvJesgelhPdCYKbhGM0WCt7c4RRziStBahqX1kUwLA1ao5gmUSf1UVfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789010858;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=BH/M4+nRdlSups9SScuO3O+yJIOGGzelCZAWFb6pQCk=;
 b=d4klGxfknIp4ov60gS4GrpeFcBqvzcFaz7eDM4V1vla7uzSjWC+gvphgeEEH4wiizE5V
 3AsXvY/k2cmcEfCLaQe4aobuOP1FfNZMJJ+Sg+0amdudTyipT5jPm0Pw/PZmTvGLApOM9
 xfrNtAVG0Bi6Fc1I12mHVCUnnIyqNXB1/Py85abW+t7SaPyL4M1Ep9+2NtWJOY2TVOGFz
 9qgrWuDLXYnTg5dyrGPhdycbC8CmuVrJQgUJjp53zqclbxRnlCPYB6ck25/RxJPiJ2EKB
 xrB4SxPkK4c5sPLX3nX3N52Kh2Rp9L8E+ukjNH6AbXJ0Jw+6eLqqhbUAx6TPwWxIBNQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JTR5uHy3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JTR5uHy3
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2E9480E94
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 03:27:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-485850cf499so4635909f8f.3
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 20:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789010855; x=1789615655; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BH/M4+nRdlSups9SScuO3O+yJIOGGzelCZAWFb6pQCk=;
 b=JTR5uHy3fi6lGAj0xGMJm/qURYILllkAZx/k6AeWwLd/puYHIshve9rrPPtv7oKWYD
 96/zjKKpsSndToKBxT+fQjmPXHUuvRJReiCKP9vAdO2WaXljI6OkpXi36q4wQpvw/psM
 8JA0gN9PwKD9OJYi+hJE7yL/atXU2I6UUNcidTzSv11D5ptqeDFmkXcxozSnuLBJ5R14
 U3LGP1JGH1foN2VeJRvgvJf+z48AAEOJEi3hruJt2cpxncRwg8od9UFGjpyRdR+mzEmO
 RVg+ga/aqct2Y4iB7vM+Si6clBHy4LmkX0ZaS/anAlYQmV18gixvtOVrqSDYmdzAWWki
 g92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789010855; x=1789615655;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BH/M4+nRdlSups9SScuO3O+yJIOGGzelCZAWFb6pQCk=;
 b=tK16Z+lll2Sj8f2/YpRD0z/HScOSyV/qdjJwSzXsXKPY3MANvmH0HEUd3zTQGElzde
 M/2J+67YU8aV0cCfxD8HE5ECPuuHnDV1U96URnYR08Q4OPWBeB8FvYGlolkKU+E+7ulH
 vX/8XSUR/1O7VfeTwYlzKfbAridMYDLqm0xlY3CtqHSYZbH4e5EXVrpajfZbNYAGcnCN
 3ae6ghHC7Miia9tQCKLxQdADfOrEVyXIgVFhcj23djS/pFxr+8fJkUrB2rPO8lTbagJC
 OLywgE12zMMA0/HnaSrsSzTIXckrTNxgnsw4HpDM0enayHut2VzdFzoa6/lFxQ896Wtm
 VO8g==
X-Gm-Message-State: AFuF++lc1q+wnT1uCuadEM4sNs88OMQmm8WoisNnnPil2uvXliBEeV/v
 XxWHHMoSO0Sx4MAohwYleDmmbmAkdSwtjfj1oDai54tAhOmGlaqs9JLky5oq/GSX
X-Gm-Gg: AYBFou3lVn0loaKnVcNsEMbDACHaIZ6pWVnSl77eX48ckQ5lXy+QmiwV65+5nEZES0D
 zk8s5kyAnopeJwZU57vo3S5JIWfnNfGr81RvnrDHON31YJRBnhwMKihUiBn3Mng9i574Wi37i4W
 t/7VbPYWpj8XP1ONc8h/Gr7Yj6oSWWjQ38HJRPHyGaWgnMoqcLvL9xcAd6p84c9OQd/A65yjFXf
 NI1efbwkXePdPwF6TrW8XI4rvj6yyFPHjetQD6spNIktFNSC2HrXPklU+LSFptTB5NLCEctjFJZ
 88u1gBoPuoRrdPj0oPk0EE9X1xjYSmtQT1bp+JXshHKkhK2ZeFaictvga3XveWuJRDVBTaldyka
 UN5h6wxrj7dDIvFDVBPQILs1C73Z+HvpyQFzAJX4kMX0w6wjtvUGEzpRg1UENw8ItBjkavfvc0C
 9gY5u+YdpaiJp8daQv18j7qJr8e/P66HLMb5TQwOfzL40zKobOBV4UzZ9ijWAklHMELRB0YG+is
 RDF1/JgM042
X-Received: by 2002:a05:6000:4615:b0:484:479f:4152 with SMTP id
 ffacd0b85a97d-485872b733cmr41286674f8f.23.1789010855188; 
 Wed, 09 Sep 2026 20:27:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm40235052f8f.17.2026.09.09.20.27.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 20:27:34 -0700 (PDT)
Message-ID: <6aa223a6.c9eda3e9.76660.0255@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 10 Sep 2026 03:27:34 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-09
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

Autobuild statistics for 2026-09-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 16  | 18  |  0  | 34  |
  2026.05.x  |  2  |  4  |  0  |  6  |
  2026.08.x  |  2  |  9  |  0  | 11  |
    master   | 35  | 61  |  0  | 96  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 4 
  gobject-introspection-1.86.0 | 3 
               tcf-agent-1.8.0 | 3 
                       unknown | 3 
                 ddrescue-1.30 | 2 
        edk2-edk2-stable202602 | 2 
                  ffmpeg-6.1.5 | 2 
     linux-5.10.254-cip72-rt32 | 2 
                rdma-core-62.0 | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
                   atop-2.13.0 | 1 
                  bcusdk-0.0.5 | 1 
                   dante-1.4.4 | 1 
                  dpdk-25.11.2 | 1 
                    emlog-0.70 | 1 
              erlang-26.2.5.21 | 1 
                    fcft-3.3.2 | 1 
        fmlib-lf-6.18.20-2.0.0 | 1 
            gnuradio-3.10.12.0 | 1 
            host-go-src-1.27.0 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
               libglib2-2.88.3 | 1 
                    libjpeg-10 | 1 
          libmicrohttpd-1.0.10 | 1 
                libmpeg2-0.5.1 | 1 
                  libnfs-6.0.2 | 1 
              llama-cpp-b10702 | 1 
        ltp-testsuite-20260529 | 1 
                    lua-ev-1.5 | 1 
                  mender-3.5.3 | 1 
            nodejs-src-22.23.2 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.42.3 | 1 
                  prboom-2.5.0 | 1 
   python-pydantic-core-2.46.3 | 1 
rtl8192eu-9664b2bfc4bcba55c... | 1 
                 rtl_433-25.02 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                  sdl2-2.32.10 | 1 
                 skopeo-1.23.0 | 1 
                  stunnel-5.80 | 1 
                 systemd-258.7 | 1 
           uboot-tools-2026.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/34395fecb19e71a37e981994d0abe7b24f1a153b |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/086715964239b1e0805f2641a2a4ca9ba0247e77 |     
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2f12d4fe1c7c0012277fa533fc9cfad45b483de0 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/16c3dd86bb94cd770d48ee4bde6c64ca6a7db322 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bda51086ab2c63e7549e80da0c314a5428ab4aad | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5bb63f76518c1310cf015e0fc5005b1efbd6675a | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/abf6b5ab1d427f58ea0594428fd15e22d57ae41d | ORPH
    i686     |         ddrescue-1.30          | NOK | https://autobuild.buildroot.org/results/6e280e557bffc428708bff0be84067e8bbd61034 | ORPH
    i686     |         ddrescue-1.30          | NOK | https://autobuild.buildroot.org/results/0c89c2b891888e76cf595ddb57a4cf142684e295 | ORPH
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/3c95f65b091028bf89dee3ea04dacf8ae1c5ac4b |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/e83ac628534b28d6e1ae9c721ce6db901e8d5dff |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/e7b603a73e2dc3168d18a1be31a55ffc74eef83f |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/c44174315c3471223da6a502f9555f121ce067fa |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/2ec68a8361ecc3dad29704cc92d6c819f3a88ebe |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/6792109a982924f4cf2b8bcc9a2ac7c12f5ddc55 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/d16c5c713dae664308a5e29c47090e70a477c122 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/f480c00f1dd5778bd45aa81c66839439f97d519b |     
  aarch64    |     fmlib-lf-6.18.20-2.0.0     | NOK | https://autobuild.buildroot.org/results/63127ebf41f8731bb1c6764636e5e2a9d03bbb45 | ORPH
    i686     |       gnuradio-3.10.12.0       | NOK | https://autobuild.buildroot.org/results/333d79865cc8e01c0e6dc83840cf0d787f5eb464 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/b423a6ae54308ceda2870af43318ab6b748b1e96 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/2b948f78af99624d0463d6aec177e06eeb81000c | ORPH
  aarch64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/b2d4da3ba7c1e05e53d7dafcd8af89c8f0316e2c | ORPH
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/2e8ea472bfe01837b2007c41746ec1df8cb62ec2 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/1d62675bfe00d1f12fbdf0a38af84cd49e88e2f2 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/f08f7027608c9068df7d98534415f82ccaa3555b | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/f97b5354308b19356f074a605b7ada8ae5d650ad |     
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/6ee75a5be645fbb2dbe0d29ed4564154ee8a3a9b | ORPH
    i686     |        libglib2-2.88.3         | NOK | https://autobuild.buildroot.org/results/c518f05df293268e52b492f29e0fc479f2da917a |     
  aarch64    |           libjpeg-10           | NOK | https://autobuild.buildroot.org/results/fd8ec6465619ed03b2d6c3f10cafa0083b3cb9fb |     
  aarch64    |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/adf88313f6f2978e98aa36caf3c5754758a91d7a |     
    arm      |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/15fa62b6e3f4e74fde072d0cbf734e0ec45646d3 | ORPH
  sparc64    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/7a96c14b8581f4ced427285d97eda22a356f8d99 | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/dc43016a4eb6e2d85dc3418881c1bcf41fe4e7b0 | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/a1e0a0c246ed14c919cf150e377a4dbe264977c4 | ORPH
    i686     |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/056bfe69185b4b6ce14f41a5d9337830eafe4af9 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/6449f9e323241eee5b86619c206ef1b516693150 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/81eb03898bd09a03a22a04e43d35d2a0cc64fd85 |     
    i686     |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/6f700879cbf72ffd9233642479d657309889aa3b |     
  aarch64    |       nodejs-src-22.23.2       | NOK | https://autobuild.buildroot.org/results/ea7b6ec189f0718b6b231bea70ebb80be740ea1d |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/46db6678d97bbf5979daa4d48fe85a3b0e00b7ea |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/9ec98652e42a870ccd78116a0e3c6cf82da1b8bc |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/e0beb0ff474c44cbc0afa7de3df0ec586cab63d3 | ORPH
    i586     |  python-pydantic-core-2.46.3   | NOK | https://autobuild.buildroot.org/results/cc211428eb809410afeaf3a975d2ae8b35e63b26 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/49c2f8b0b51f09df127a7fa663371049c5fe045c |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/e332ee36cf65f569b0138134d253707a2cf2948e |     
    i686     | rtl8192eu-9664b2bfc4bcba55c... | NOK | https://autobuild.buildroot.org/results/10ad703433e593063ee7cb405ea60b25fa1827be |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/e98c42e98410abe09def07259c6f628e05a7f9e7 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/ed2f64653c22fa3837d1ecfa3522525ccd22f77b |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/a3c9c48406c33d0ee7dfa5e95bd65e30fe55384d |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/2b3fa2d196f8b6d7bfa51500a7023ba78a5fe713 |     
  powerpc    |          sdl2-2.32.10          | NOK | https://autobuild.buildroot.org/results/de33415ad4f26c79523b32889e9e5c70faa43fa7 |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/e867d2bbe24dd098ccecec29643e79ba3f35fd4d |     
    arm      |          stunnel-5.80          | NOK | https://autobuild.buildroot.org/results/3d691184ba83ba4d881632f2b2bb4da5aa50f491 |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/fda8672d87a831f28e80ee54892aff893391d414 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b08967e18675e645c27169de393108ba4261cb02 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/866c952bae7dbeffa4fb603d788ccdcd7745c790 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/084508300d570ac9cbf527765ea3c8bed389d858 |     
powerpc64le  |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/63dc235af017d8c8df9e63f26c7523466bbd641e | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9180390bfed929dc6b7a5dff57de49a1a3efe232 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4fad673c5646b7663bb4103ed7b52c10f1b47df1 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/84a4332f95ef5d4b95054b13730b34ab296c4ef5 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

               libecoli-0.11.3 | 2 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  bcusdk-0.0.5 | 1 
                   duma-2.5.21 | 1 
        edk2-edk2-stable202602 | 1 
        ltp-testsuite-20260529 | 1 
python-remi-2022.7.27-37-g1... | 1 
            timescaledb-2.28.3 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/b6e8e96d34791853543a878562cb645e65a9bbb3 |     
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ff422c090fcce4ec43747fdc99de9df66c7a44d9 |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/254e63721cef068542a2342fcfe953ad0ce6b2ef | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ef91a9f27828cabe7ee4f17e21ce6d6f0b2c05de |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/5926847ea13d43a3adf190fc4c8f8791dbd9dc24 |     
 microblaze  |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/370396fa3a2003ce835009fc8ce965ccace5e38a |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/a3ed5127c8e8bab7488f49eaf61481ad6ac6a0e7 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f4b2f498dd0c475d2288b0a1015b43a4bd315e67 |     
    i686     |       timescaledb-2.28.3       | NOK | https://autobuild.buildroot.org/results/27fef6dbe6150f185e8a1627f8f5542b13e617e4 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
            jpeg-turbo-3.1.4.1 | 1 
                 libavif-1.4.1 | 1 
                openocd-0.12.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2269e08da8d26431b0c8bf982839ae710b5c599b | ORPH
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/6d48f18ef18c756ddd5efeac66549f595bafb609 |     
  mips64el   |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/a0ce104e584d9b01b88038844a2b0b9ff108aae8 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/fa11745f27ffd24b368a486a7b5c889ab4d08434 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 3 
                freerdp-2.11.8 | 2 
host-netsurf-buildsystem-75... | 2 
                   dante-1.4.4 | 1 
                  ffmpeg-6.1.5 | 1 
               freetype-2.13.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                     gzip-1.13 | 1 
 host-softether-4.30-9700-beta | 1 
                 libgee-0.20.6 | 1 
                libsoup3-3.6.6 | 1 
             libtorrent-0.13.8 | 1 
        ltp-testsuite-20250130 | 1 
package/wine/wine.mk:347: w... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c8ab0db899fb882ee7693a80bd595bdc39162800 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/7b75dc8f69da0296922427653a527765a6cc4ee9 |     
powerpc64le  |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/80f2d33a7c6de61718b1b10361dc6235c91b9b23 | ORPH
powerpc64le  |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/33884f5eca736ed2b8476da473b630ecfd19f58a | ORPH
    i686     |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/8ef2cc1fe3ac01b5a491dd5de9ac08c1add499db |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/88cfc5ccf7f4c74f519fa19d5a99213ddcd091d8 | ORPH
    i686     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/895e4742474049904db21308f7112425f1bf5c1e | ORPH
  mips64el   | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/95c34ed9e8f51058ffc57fcd5e7640b550cfe1d1 | ORPH
   x86_64    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/0797b1bd66d6cbe562130a9231c380f38759afc8 | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/cced5dea1507596f453339a6171b6f5430ed91d0 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c90bb73465a7a687e793614689261096364128a0 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/238ea274ca90200d67451f68b50df00b59c02966 |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/42994c284c879188e4500f91a6ee433cdde4eba9 |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/960022082b121124d628424602e5816f0e0b8989 |     
    i586     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/3f8bdd18bb1bd443323e3084190151c618c9c951 |     
  aarch64    |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/7ab98d3392f17f3030714b2feac0fe36bb884c82 | ORPH
  riscv64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/3cc2f1c28adc9008ca6738f91169bcc876a79e54 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/0cf84f35f6229b009530d919ffaca76e62d84bf9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
