Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AD4606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 04:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gMPkA8+n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1CT78M3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A8340ABD;
	Thu, 12 Nov 2026 04:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEfYTJq-PhWL; Thu, 12 Nov 2026 04:32:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0AF2F40ABE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794457931;
	b=WOhEmlLAtbI9nqlyTgCHq/oqpTkAKRp2mMElyDTiRMWOMojIKq3QKBM61Osrr6eFQqHM
	 ByAo7xhE8FZs/87VwthDCv+s56Wp0UrBFsqqpbZTSvPje8rtajKl+xygCw3YdzfJMiesc
	 MxnaJ3RMfFCjpdli79o9AI8xdcpCz+huVXGEQRC0TB7Ng3sNx6baHUhh5dZs0zbOSL6RV
	 bbomdVsmDEUS6mR+X0wwHM/kWTnvoOblfwXMPXs4W3Dvf/XPTwFOnE4JE9s/N1nUCEeUp
	 BKsSBPuz7iFSk5cewnEEFUIGv5bBwWXCXlcd1WK/OXU3miSrNfqVo4ZdX9MQ6hUFYnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794457931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4I/AUXF98RM4pTiUYPDsleNZ/oEQfU+ssMQX0KkP+D0=;
	b=hkCTIJG5M+IjhdAp7Kc8qVtKVEhQdH8CIEsJtir7CAljyqR/7B/2NhprP3dV2GkOakmK
	 zZUw1e7up3AxPZizg2OPaa9Gsq8CIrclO1Mfh6fgBa0/cJHxCTgxjqIn4iNfdmBid0tWe
	 WDdU194P3fH/y90hIC65E+CgWBtU7w7qxLVQ7NAt0tstT2378P+lLYuL8yWBQRXlNlyq5
	 Pl6kXQ53xFB3nyqMBCfcfD/GLUFvEEceNaBUF/Isl8ZCeKb0KMQdKbExsvIJdE+9LbBN8
	 4ke85NiFbh+l2vBcDFXJDEXEXI8siCAlqqiMukRSnj3vMQ4GAuARIfJ6W+YVEuYayrQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794457931;
	bh=4I/AUXF98RM4pTiUYPDsleNZ/oEQfU+ssMQX0KkP+D0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gMPkA8+nF2oPvmS/nULQBjAEiveHycsMsZPwWL0SdzKc5H61FsgjiK7wTGKkfX1+w
	 6BZEm6A6Lc4oSsIvhFuhHyllN9KnyWY2Tj/IHZzAUZD1b3RnDv+dlII2E9F1vyl8CS
	 /BCcSiwumlEb9uQJQlQB8Pl97IsDxYwFh3r9TGvg1r26WVl79Y/EL5OG6c5g6X10n4
	 Vx6LtWDf7Qw1DX1ru3SR/+bglhLzJ6BTN+A2+53OtEZPSxv8irnCimh4siVtzZhgIl
	 stpKcCeVoaBZMNA+1yO9/Wbw+PBwgeTUvaUF1F659iABXDjtmiyckBNNXjGAMMokKB
	 0enHFBkMQElWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF2F40ABE;
	Thu, 12 Nov 2026 04:32:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70464D7
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 04:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56560608C7
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 04:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpjNs6cPw3qP for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 04:32:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8A45C608AB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=u1CT78M3
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A45C608AB
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 04:32:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-490f38e9688so373006f8f.0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 20:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794457925; x=1795062725; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LFsOiKYxBQhu+FUj8A+0cbQprVEmxtneSXrZik5aIEI=;
 b=u1CT78M39gUFu4LU6zYEvtbYXCnAfDk5nSD9ANbLFK/h/5r9z/fxMkn+oSEP2D3hNU
 c0E4dazQVygIwW827Iy1/4V1hN6kaK4GldmkOHrKTHU7v/CrXU9rdHMCKf5rylPijYhw
 G9Ol9dp2cbQnp83tHlRlEZ81H71K/UuYgN6qTnlNU4gNXmm3XBjgk9uQpGPekucA2bdv
 IAuKL3M74ZoYlwRMhutEk/dqXYzGftQclVTBT1YnipS5ktTMrHxB2PL2aOPFBmVfLUkn
 iwhzmycdpqPCtjqkCVGuqnHM9MH/1VZM8LYOD0b8SE2xQlN2Y+Uo4o1hHGNJfKON9YFP
 Xgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794457925; x=1795062725;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=LFsOiKYxBQhu+FUj8A+0cbQprVEmxtneSXrZik5aIEI=;
 b=hw7T/aVZccQqueL8Ktizn47BDq4q6NQFZ62KXZK3/n7k7LfP/P5GgO33t+pwTcTOt5
 T4P/RAnKotnSIjuSPm9brU7vGS/5LIlXXt3OeU5QhzNdHLJ7wP4duQQIQ0Cu1xmTQVr3
 u098dsg3N6cqsXDc8HYVGSZTpCm3R0hUMQpgW7z23LubZ1sGrNwPfsc2uQeef50ldDdH
 JaI5EQq9ZIsQY9EZ5CcWQc16oK2ljzi0Mqy+iVXJ7N6MONz/q5uXKwz24AR9Nqi1n9YU
 S28X383LlOyJk4SqjH1GGbce9PeTwLvA/gIlNK68Kh3aA3f6HhBUZsAw0MAptNjrWaYB
 akAw==
X-Gm-Message-State: APuU4Z9fkGDfnPl4wYIRMlnTwy/7D4N35XlfGNNE1ScnWXsPHBTkjdY3
 RvYvWI5edsXIMNlE74i+7/BGyaropgmmySmIoK8Nuob1iiO8IipqppIthbmrXO+n
X-Gm-Gg: AYBFou2C++lQv4EfzlTcAf8nJkQYouTSf/6tzx3PSkjRAs7Uhl2Thn1sWu3we+K8JaH
 W3dY+HjRgNa6Fbp5W2kc6S8aTcOqv7uObzvAmYAOpBHVSH3guWUkx1U0qN1ZOZF/q1ri+EH8tZB
 enwmh6A1gXCEWssq1CtXprvF4msvC841b34mAEBJyINtT3RmslPdNCKNQbMdEy57OlD4Hn6g3zb
 9fX6uRwXs97e114+B+hPfsuo8k6fk7Yy5EoVAduCNqpqru29Dccx+az2Yf46RynmdS9vYk626H0
 vPVjfBOHaeFgNN2PJmNRVxmUh/L/+VjtTt7omj58n47w387GlzesMHY3qkWp2SkoFPWSb3B5o+w
 dHcZL0QScGUz4PPIAuKiJJ3drgCfWOD9UhcsusdSrCPwYuRsHT5pBRIFAPtTCFNMJ6L44VihtFg
 yqvBOXM/EXHfoHCiGYToaHXNxlyO9cuQey4dPgMdX0sA0wKXcMtu/ZGRO4E1GqPisbP4wgUzxuR
 VuhUwiSJyp3aINMKARa5FMp20Ah3rYpEnTNz4VeBSkzI4da86L1wGEcZHqAZsSXpK49XVvAEQeA
 R66lV7gHwdkTBna3t6rAGEpWXvbDued7
X-Received: by 2002:adf:e00b:0:20b0:491:eb12:e151 with SMTP id
 ffacd0b85a97d-49afe16887dmr1709522f8f.4.1794457924489; 
 Wed, 11 Nov 2026 20:32:04 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49835858f26sm14960929f8f.18.2026.11.11.20.32.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 20:32:04 -0800 (PST)
Message-ID: <6af54144.287207bf.3bc745.f80a@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 12 Nov 2026 04:32:03 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-11
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
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-11-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 11  |  0  | 14  |
  2026.05.x  |  2  |  1  |  0  |  3  |
  2026.08.x  |  1  |  3  |  0  |  4  |
    master   | 41  | 48  |  0  | 89  |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.42.3 | 4 
                       unknown | 3 
                    attr-2.6.0 | 2 
libfutils-c326ce0cc2a735438... | 2 
               libglib2-2.90.1 | 2 
               libunwind-1.8.3 | 2 
               linux-pam-1.7.2 | 2 
               tcf-agent-1.8.0 | 2 
                bpftool-v7.5.0 | 1 
                  cairo-1.18.4 | 1 
                  chawan-0.5.1 | 1 
                  davfs2-1.7.3 | 1 
                  ffmpeg-9.0.2 | 1 
             fswebcam-20200725 | 1 
gcnano-binaries-7c181cacf89... | 1 
                 glibmm-2.76.0 | 1 
             glibmm2_66-2.66.8 | 1 
                 haproxy-3.4.4 | 1 
                 host-gdb-15.2 | 1 
              host-rust-1.99.1 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
                  libdex-1.0.0 | 1 
             libxmlsec1-1.3.13 | 1 
                  lldpd-1.0.22 | 1 
               mosquitto-2.1.2 | 1 
                    mraa-2.2.0 | 1 
                 nethogs-0.8.8 | 1 
           oath-toolkit-2.6.14 | 1 
             open62541-v1.5.10 | 1 
             parsec-tool-0.7.0 | 1 
        perl-xml-libxml-2.0134 | 1 
                  prboom-2.5.0 | 1 
                rdma-core-62.0 | 1 
                    sbctl-0.18 | 1 
                 systemd-262.2 | 1 
uclibc-ng-test-132c6134d691... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/2bd4b81b28f3ae871fccfa3ff8939e4ccd014307 |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/a9f9602e47e4ccc45c84862f5c9115901ab82dce |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/6a5c5637bb0c1dd3d855aa81b6849d7fef56c0c6 |     
    hppa     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/f76b8f361d01eef892ad21722b099ba8bacfcc57 |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/63e5d640c49446aabd60df712c56dd6337cf4c0b |     
    arm      |          davfs2-1.7.3          | NOK | https://autobuild.buildroot.org/results/2c76e90c2e0bae878de02b602fd2645cf61609d0 | ORPH
  aarch64    |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/288f248951609da69b8541dfb42fad8fb16526e8 |     
    i686     |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/ac3b541c731601466cff22b68971be1e4e22e2c0 |     
  aarch64    | gcnano-binaries-7c181cacf89... | NOK | https://autobuild.buildroot.org/results/2651c43eda57af49ab35d8761dbf180812b7c766 |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/a7deedf93b7c8151412ae4cdab39ffb3951b6170 |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/4dd2590043701eb17524cb0c2e10faf5454391d7 |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/caece5432fb6f682f32ed12295375ec193e25000 |     
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/8871158b5387cf48414d7247777615ff4cb04bfe | ORPH
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/a49a2be6bf3f7da33a2d5163c152f74e4e65ed6f |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/53b0680791a0f3faf5386401ea2d789c919c6f82 |     
  mips64el   |          libdex-1.0.0          | NOK | https://autobuild.buildroot.org/results/a7ce67e98c4228be873db3bf16528e6998708ef8 |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/8111a452f33339fb6b5c5be4174cb761237a70fc |     
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/e82e7c5edecbde19699b691df91037f31de0473d |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/1a3edb09974e02cd19b80da605cef17d38ab97f6 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/7fa498e24167947f26004b2e76c95cf22ca08023 |     
  mips64el   |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/c0e4c470504c80966bcfdd2ec0c0af118553f971 | ORPH
    arm      |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/a16d51937d9183f9174c2b3ce0906a343c0b9de9 | ORPH
   x86_64    |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/dd5cd7ce05e198fef36d505f9193846bf901f946 |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b70e96b9bff769768c08760c3f0e91608b104bce | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/36876142cc71ae8bc43b79e597862c14c1fdb687 | ORPH
  riscv64    |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/8357a67410b63c5ae0d889bc9eaa016b70664cd3 | ORPH
    i686     |        mosquitto-2.1.2         | NOK | https://autobuild.buildroot.org/results/92b2b0efaf36b46d22da107173d8bbd83bc748c0 |     
  aarch64    |           mraa-2.2.0           | NOK | https://autobuild.buildroot.org/results/a71f5bdf6c4089a3f1468720537f6a11d228ae69 |     
   x86_64    |         nethogs-0.8.8          | NOK | https://autobuild.buildroot.org/results/7b366de7f70fddb755de01a096e57d3a01b6e275 |     
powerpc64le  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/c2c9182608ffa636a1550142df9e362ac548d1e8 |     
   x86_64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/e3f37c464fcf776c72c1707166892cad54c45efd | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/10cfdd882dff8b4ee550886151b7ff620ede5a1a |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/4526343910b720e51037303516d00fea9ec1ab62 |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/05e42cd6897ab0766f28bd100ffc3ddeb98eb552 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/38556f15b906dad79ad0d2fd5c5761db4771ea52 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/691cc41dcfe78a6b3f8484ca2e411bbf609fa3c9 |     
   x86_64    |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/1e5f84decdd17bdac2a68972ff7cb52ca5783d57 |     
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/7d5050c54ba8319f0fd58336851121f5e127b1aa | ORPH
    arm      |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/842402f7a4690f9b1b0b52f8fe3d1a9d6db9db60 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/b28529903f8190dcdfa11afc0259514472f70bfa | ORPH
    arm      |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/a37f44f3df16d4f49297b2a24bad20b0ad603ef1 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9a93e56785bf2f5e96c0c012b703cbfd8162835b |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e843abde1546c8bf350dad3b6237cd554e6c1446 |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/ff424df43c8add4daca04a2c9934bb6ff821f25f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3863c656b3790dcbb1bbb32894e305402ca1a64d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/516216f06f2c5ad7edf6cd3eeb0295189975a315 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/24145a046291e4248d4be6891d9e644fb9e1cb6a |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/c27f35cc34895242951b8cdf29b4556ab1aeb7d6 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                drogon-v1.9.13 | 1 
    host-mender-artifact-4.4.1 | 1 
host-mxsldr-2793a657ab7a224... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         drogon-v1.9.13         | NOK | https://autobuild.buildroot.org/results/55c9631f94dbc6a130473bce5cb95d4ae0904770 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/0fea26d50890067e8a894ce50fcdd72d9d855c5c |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/0d22876257fd3fa95af6e46c39a31caf7f227f12 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                    fcft-3.3.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/75734a55f493b8e4e9f9f84ba8e077aa70d2f767 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
                libsoup3-3.6.6 | 2 
             batman-adv-2024.4 | 1 
      host-uboot-tools-2021.07 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.5 | 1 
                 rtptools-1.22 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/5a904cc12e0121fb0822cf38d09e86c19c13aab9 |     
    arm      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/68c64fe1e9d40c3b7bd3e9c9923ac5fd6b4ba950 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/83239ec89430e937fe2a5317f98cb59684cafee4 |     
  mips64el   |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/dfc9d699133ba3716d4722b78b0b5987af453544 | ORPH
   arceb     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/8b5fdc5f84d117e7e8cce269614177c800458cf5 |     
    or1k     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/72810638bf622475760cd016e720c42f1b812039 |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/03abfee0f5d2dd34aea30b1e69998cf23742ac86 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/96a9de20ac12e5f57afe6c21a1b23c224a61f4ba |     
    arc      |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/339b904f8e322e952636e4e7f77fe26c064fb319 |     
    sh4a     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/def0828b610aeacd46bbb73d76b71b702c6e047e | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/2f3a8d832aca3b36c42c68ae29a760e8c07992e3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
