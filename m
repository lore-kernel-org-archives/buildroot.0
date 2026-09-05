Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F62C79F82
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 03:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920D940BF3;
	Sat,  5 Sep 2026 03:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3fmgkhd5VoA; Sat,  5 Sep 2026 03:23:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 86BE540BDF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788578580;
	b=VLK3AsT+C3exdP1II/7HHCHM4aBhv6BNeL1u6OCMTT61uBNXBV6uJmV6dPsE2EeIrYhe
	 ICvU+t1I2SV2LNtiv62H8q0gugD87Ux5gIUlezfNHXPX3CS59vaMljji60NI9fUtVEnNQ
	 jayIPYLGPD7xrFqDO4pDZAvlh0w6YbRLcj5XJXJSK/I4ht39CpqtNdJqe8edxD7qhsQQ7
	 jnY7ZeBSVD2KTI8AcvvpS10Gcpk/Eh2dJ2DiUQzAmJcjowetSmzw2lQqdVohqVwroMSqG
	 Gq9FUVUi0aG6VaNoru1fT0+SdMR0XXIIUIXbhgbGu/hlHiUJfHKKRkIVflMbMjr/KQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788578580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E0iZBYZ5qKWNO3Taj0Nsnf30ejkPwypkOoAPaT36NoE=;
	b=eCSRIS8lb+Pg1T7f774TPA+qX0XxeMF0WbZ5iBe/NU5hTmyi/BTJAaujdfDu6LRsDOAR
	 cJIwFof8DZe0VrKOjuiUj4BALPFQaEXil5+IuuFVFq3AwkhPGCrmUsSD1QddqwdUlPOj3
	 +988aum/UBJwWeQBXTK/PKH2hkuQJDZ/Xgc6mSk6W8AUQhUi2XVrfwujgHw7WZjJm8cFx
	 58rSK/oyIxfSOuKCCl1lGw34AHMNpbplRVhbVecVd0IdHPYA/Dnv7JpaGezsulzBYpF8g
	 G1Q3E96t6/Z6yEUwU+jOjZbUZG0eBxOWTEyXKuj2B4Cj/j9HikwmivDA13ThnDLaj4g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788578580;
	bh=E0iZBYZ5qKWNO3Taj0Nsnf30ejkPwypkOoAPaT36NoE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qm/EEf6If+FPGDG4SJHsv8oFBz/l/q7kOcuqO6JzMHEMSjOBDxzsAPpuaw4ET9maY
	 zGdyx69KghfKPhfanmGBJJENByGjD4JH7jvN4NNe9NVSpTBCNcKwdILWlod4ZantsB
	 05l0qBkaGLBMluWO/4dJuwpwyqDHonZkXEKsQNcrkp3IwNKo0K11k1jfy/jOA5fC28
	 XIBd79awUBGldkR7YnXWs7qEquf4u99xn4ExVYVuR2B2JdqEG4HW2/OjObAQlD2eqb
	 inZhyOpcaaJ/nUV22ouIUxmgjJ3C49R6G6Tc8JJwSvVrKjfuWo//wVcQ5N6HNclvrO
	 Uz84hG1vFGZeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86BE540BDF;
	Sat,  5 Sep 2026 03:23:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FB10118
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 03:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1171D4051C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 03:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4ViqlNZIPsY for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 03:22:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3076640181
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788578578;
 b=VxAmAACbUfIVu06d0NxtU/2u0wZg/FEeZxZifDVHE+qXtO8rzxF27Fh+ePjNFlWmo4QK
 BYdmG/RuYVN94Zusemr3i1GOYaYRVJIUhXCNlXEVmfcUshcQzS3MMjFqYoV7JOVvx07aM
 0zhayn4Dbu+2fcJ0ONuUF4M/rs8fCH7Cd4JuUeCMaE2lEFSCQ6GPxxLq/KA6pLf9IMNA7
 UeY91loCBZUnsPxeB3XHiTdw6bkAgLbxPO5VCCwuXJjETWdTaCU7AecIwf9dKX7P6gVj7
 ix8Gv6rxBhMq4xSQ7biXlEe+ax777cJr8jmrmlk0KWcTK3uG988Unv5i/gxN33q/G5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788578578;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=kpmTFsiI8sagPfpQTOamD/9h0wIBJQymGq7uUGsefcc=;
 b=Ad8WHjL2c3BJoILJ43/gtpb1MpAKJexGKlVbxJzipC+YZqRWCEW0CtxiSSRfC5mGi1rc
 wwMJRuXJWxM2YoDm8kjDZjePjk5aD7J1X+KJJfpnX7XHGSNMGFnSdQa0JzsN79Rhw61Wl
 9mpXf8zTBYJ3JeXTx/zR6mBsIhhbauo/hmfyymq5W4XPAx1jBRYtFCj8N+6BiFxdpmgkf
 b51gVgkjJ7QMiJ/zrUU/3nGGcn2RRYvE/k2QdkgJ1AQPymyykaYMZZtbTjikhhMQXSrTg
 L0hXQMd3+xSH3JtzuiHjfS/hm79mOA2dKIlC9reJeSUgjD9FcpFWczlpXusWDoxkVWA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="RYbGID/e"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RYbGID/e
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3076640181
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 03:22:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-482f2ee53e7so1130971f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 20:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788578575; x=1789183375; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=kpmTFsiI8sagPfpQTOamD/9h0wIBJQymGq7uUGsefcc=;
 b=RYbGID/e9YCT+bCyynjxx4kDdq03tZ5gimEaCoUvEYwQ2fiFoupQ2hEmthDhEz4/Wt
 ZMdaQ/0gqnRQl0XHoPJHZ3J3d1LLqDUZxj8deHuuQMNX+Olf+U0YVtSeOE2q8uz5sO5I
 VKe3BOO+STgYvb4+kWE2wgNBlRUvciPX84kTJF+LF2JBCec8nP6HUn8hSYhS66nxt0pA
 Xg+zIgmkS7a4T2+MvNlclygfQN/glzwshmtXlZh4ZowpGy7FRdkyoYc1e/xUICQ8iWMp
 hOUCSpFqonEz+AdWuIfEyrPsyPTURpc/WqslypTjvLkaR6mn9oO2vduEWHjRFIn/qG95
 sqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788578575; x=1789183375;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kpmTFsiI8sagPfpQTOamD/9h0wIBJQymGq7uUGsefcc=;
 b=QmkKKY9MUZfvXNq59dGogzI58VKonR0OOTfaz7EOwKFdBEVTd3mltU/aj8tlgIQL+y
 Ils6XV+ipMypEjjZ25BVGLsZi3BRBB3tQ9bkTCQU1nqvzO1kBqRxRqknGbcBvywNQtEx
 c9VVVqCC1EiTHrJQQY82vJ6QquAjqHo7l1BByHUh+GGVoGd0xh0fx7bGHuqv887/7GEt
 z8c3CuFjMyOiKo3WZOwN7mTDeEUJafwk0J4DcBcMBRMxiCOv3KkK3CFjGhhpik5Mtlz8
 F9pBuLRbvnflj+b5SpFtlokV3vLSEhxQwd/wrpVrwQY5qj0IwVXlNmtpEvJ1FQH5qz65
 3lAg==
X-Gm-Message-State: AFuF++kxy1TIEMZh0oD6TEqXLbgzFbysO1xu5l6mPw1W3LXA4Ht173lS
 UXV0S/0S75qMV9TA7b7mRflooyTQkFZWZ+qQsEOw3AocN5QX+iWC7ZAaOZ/1GSZ2
X-Gm-Gg: AYBFou0dckyPWEQ0BzTWZ1Y4EkrK2xyH4TnEOwSVRmJKFano04jQdY3ZoLMRCX7gE1Y
 yutyI0YfPx5CDPDd+mfYXwQFfRL6OSCzi4Cs4Mugya652z9ziomphJoRe2LoZcAUBTaBu600bpJ
 x32Kes0onUrRUjmeYQ3Ua2Lg18eR8dbDyjUwVAWAe7t/qL6Utpne6ng5uPnMxxjvr8aSFm7/hFo
 lZasgXjy0G1ape06rdWxGZTWqKLyU3+QEFjAz8EopibrKoKndfpCU2+yorl/rgGkjiT6v5owphq
 4QCiPVG3z27AqZ1etygV+2//SYc/mROmFsOuGY/sZeJ4M1F7fIVV3VFD3ZkJVKe1njgElGNM6Az
 ooeXYH7eviTFQSPgQKkBJWtSKG8yfhth8VNRg4ZiLawwqsfAGzzaTZXxGeJWx4aYsKEruxl41gl
 h9N5qVOqHCSmGXDzqa8G3jngC6uZbekMqNwtFaSJC9o58ETwgIpfm7l/Dlerks/Q8=
X-Received: by 2002:a05:6000:29d3:b0:484:4537:95ed with SMTP id
 ffacd0b85a97d-485870872e4mr8702960f8f.5.1788578575310; 
 Fri, 04 Sep 2026 20:22:55 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c5bc5sm11013399f8f.24.2026.09.04.20.22.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 20:22:54 -0700 (PDT)
Message-ID: <6a9b8b0e.332d3c56.a539c.0bf2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 05 Sep 2026 03:22:54 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-04
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

Autobuild statistics for 2026-09-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 26  |  0  | 35  |
  2026.05.x  |  3  | 18  |  0  | 21  |
  2026.08.x  |  1  |  3  |  0  |  4  |
    master   | 40  | 72  |  0  | 112 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.86.0 | 4 
libfutils-c326ce0cc2a735438... | 3 
                       unknown | 3 
                    attr-2.6.0 | 2 
                   ccrypt-1.11 | 2 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
               freetype-2.14.3 | 2 
               gocryptfs-2.3.2 | 2 
            host-libtool-2.5.4 | 2 
               madplay-0.15.2b | 2 
                openocd-0.12.0 | 2 
                 skopeo-1.23.0 | 2 
               tcf-agent-1.8.0 | 2 
             alsa-lib-1.2.16.1 | 1 
                  delve-1.22.1 | 1 
        edk2-edk2-stable202602 | 1 
               freeipmi-1.6.18 | 1 
glibc-2.44-36-g2d5421ffca88... | 1 
           gumbo-parser-0.13.2 | 1 
       host-gcc-initial-15.3.0 | 1 
       host-gettext-gnu-0.22.4 | 1 
host-google-breakpad-f49c2f... | 1 
            host-nettle-3.10.2 | 1 
              host-rust-1.97.1 | 1 
            host-skopeo-1.23.0 | 1 
                host-wine-11.0 | 1 
          host-xfsprogs-6.19.0 | 1 
       host-xorriso-1.5.4.pl02 | 1 
            igd2-for-linux-2.2 | 1 
                     kbd-2.9.0 | 1 
      libabseil-cpp-20260107.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
              libeXosip2-5.3.0 | 1 
               libgpiod2-2.3.1 | 1 
          libmicrohttpd-1.0.10 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
          lua-lunix-20220331-1 | 1 
                  mupdf-1.23.9 | 1 
                 nettle-3.10.2 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
      passt-2025_06_11.0293c6f | 1 
        perl-xml-libxml-2.0134 | 1 
                   qpdf-12.3.2 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                  screen-5.0.2 | 1 
             superiotool-24.05 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
                      time-1.9 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/f8a0fa168ed6bf64fbbe97935a8f9b95436b01b5 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/83be4272178ac891c50794f97f2ada295035086c |     
  riscv64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/9e181ac111eace280dd5f93ae7a7d0d2df55b69b |     
    i586     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/6891ac3cdc0b2fea1363fe16cb8f4179c81beb08 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/75ce2b2c98aecb87ca0bd2bfdea3e451290d52cf | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d806013b89da628d681562b28a0cffe133ed943d | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/16bf25078ea0e44ede8d6d01b0450c16e89bea65 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/516a20084239ec6b57166c99dc7c2f6a07228d98 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/99824e321994462f4afd705b34494e6809e2b1c0 | ORPH
    i586     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/965d3375698fdec0dd92db898967691083b74992 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f1bbdce12390807f24eb77fbf7bcafcb77d0961f |     
  riscv64    |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/61181c91f303823c9b63caf5fe4a388855607e85 |     
    i686     |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/a667aece349b666290f83ee26952ddfcf108a3f1 |     
    i686     |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/a9441fa177114bae9c116e0ba63781a9a8e538bf |     
   sh4aeb    | glibc-2.44-36-g2d5421ffca88... | NOK | https://autobuild.buildroot.org/results/03d745a7dcc04d6eb50bb9f1ca94c79dd41f8d4f |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/7b30c8ee0effbe1502c3e66ce9a4e5e326b51d4a | ORPH
  aarch64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/ee92639937c9024f2c4afc049030d81a267df412 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/29cef554cc2b7706f3b0c755a0b5d14c275958da | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/aaee3176866f38c5ba367d4ac84bd538fcb63ce3 | ORPH
    i586     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/ca93736716626fa61147180d355305374280caec |     
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/4851cdaae4a19213bf700ad14c852ec9b09cce3c |     
    i586     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/23a0d0933b690a9bb295472ad5e7408051a53b45 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/66d6ef9a90d200061239701c6fc033de736f6346 |     
    i686     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/82c90a0a2bd0d09e434d70219e1fb0624a050497 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/9664be215d052c639ccb0bbaa8e3887dec0044d7 |     
  mips64el   |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/bba3590deca6afa1b00d39e6327040d6be8d1bad | ORPH
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/d6fa02655dec7101107820638d3f6c1d5ea6bf08 | ORPH
 powerpc64   |       host-nettle-3.10.2       | NOK | https://autobuild.buildroot.org/results/cb5572b8ce23b6e06f749f06e0f70f68827e4d9e | ORPH
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/b306cde4a292bbf5911a12c22e75ee10be58f255 |     
  riscv64    |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/7e2dbd8cdd89c9c254f937339af74b61e160d9e7 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/ebd7884e01a6292a8ecbd3a71671f9380ed42f77 |     
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/927c12061e36f62dbbec564ff1298e818d50bcce | ORPH
  aarch64    |    host-xorriso-1.5.4.pl02     | NOK | https://autobuild.buildroot.org/results/b085d9f6bdffffb238858f83a8a6a439793ec076 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/c1c507ead5b682c6a622b0c18aabb736eba51aea |     
    arm      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/29a682c8681bcc4a7794e4abaf702f250a098fc6 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/90a95ed8687fe528a659157981efd451b9f28829 |     
 microblaze  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/bcd4842c9395c8cc5107ac2ebbd60290d7fef044 | ORPH
  aarch64    |        libeXosip2-5.3.0        | NOK | https://autobuild.buildroot.org/results/5ebf8fdea06120d0c33cccdc965af1865cab5f7d |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/f80639f278ebe9933aa0edadb67f0385d1fe2502 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/4cef2654b1bde8cc1dcc404af8ba5bd87fadc53e |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/4571d27ac2f3997cd31745943e8e7e54a80866a0 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/a8dc738c1a01ea9e5c48da5229c40f9e7282be11 |     
   x86_64    |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/61c9c02655e377f66f4f8e0dfe168c46760ebf94 |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9a06774cbb31137374ba9c1d43384fa6e1a42b5c | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c878172f90b94ec664d104a61ab0f1392a1dea57 | ORPH
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c85ff157a2caca24bb40c04e47cae22c55283838 |     
powerpc64le  |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/9c15d85bccac463731ba599c750c1ba705cb4d1c |     
  riscv64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/2000403460dbba667e7ab7f4fba3d5224bb1b465 | ORPH
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/526b15341fee33b783dc83301afff224f35cde4c | ORPH
    i686     |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/ef1a0d9598c639550391eb4c568fb7c7432b021b |     
  aarch64    |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/ad52cc66e9b633e59363a0bf306024fbc32c0dd4 | ORPH
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/0ecf9bf56169f59c911e1009270544d13411139d |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/6b93bd888a13fad815d682ac4511e1b788972be1 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1f3390c16488836e6bf0e3a40610a9fa3ee0f4aa | ORPH
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/79a94e46e581f6914397086ac99866d1888b8c30 | ORPH
    i686     |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/49985090733ee22a78efd3b60b92f61b4e710ff4 |     
    arm      |          qpdf-12.3.2           | NOK | https://autobuild.buildroot.org/results/912770cffeeddf7ffd083ab0efb072825c11d123 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/d02e600377e9a6ad874727ea57c7d3f07002f20d | ORPH
    arm      |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/d9efae3ac0fddaece46d0a6d1f20133e66b012a4 |     
    i686     |          screen-5.0.2          | NOK | https://autobuild.buildroot.org/results/be9bbdc1c8de61b76ff391a20210a7fd51cfe5df | ORPH
   x86_64    |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/4ab129f625e3a38e3dc04d6c99ab84073c5c3bcc |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/c6d660393cf5dc317c2bccd7e0c97649969001e1 |     
   x86_64    |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/6afedd9c3a48a4bc0fb55013491010348612e25a |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5322f296afe65e67e3bd870af5ec66f4e7293f3a |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/7d6487a10478b36d8c7859cb10d5cdbfefff88a6 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a21dec6fea8974e00978b2d5a4842fb56cdd0952 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9af294487f3ca0ac05703cfd8d6147d1f7c86f7d |     
    i686     |            time-1.9            | NOK | https://autobuild.buildroot.org/results/fa38604f52ebae51a0cc4fc09e10da020c90941b |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/6b99295e2200116e6e4df9644a206529d613c243 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/18b3a58ea11e439fe9765fecff1860c0030573d9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/610725a6964c4fb7dd48fa8b16dcd3f437c63a41 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/553b14e604aa89a42a3435f884a6937b95b376de |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

               binutils-2.46.1 | 1 
               host-make-4.4.1 | 1 
                 uclibc-1.0.59 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/f5bef7b3ed328a1f5b10489ce705885e257589f2 |     
    i686     |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/cde734df4bbb774d2ceffbe0c727a9e7b33187a9 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/5dbb6f08d59c99af76623e493da32f79271eec40 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

              host-perl-5.42.3 | 3 
            jpeg-turbo-3.1.4.1 | 3 
package/vim/vim.mk:87: vim-... | 2 
                       unknown | 2 
                  ffmpeg-6.1.5 | 1 
                      fio-3.41 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
            host-go-src-1.26.6 | 1 
                 libavif-1.4.1 | 1 
                       nnn-5.1 | 1 
                    which-2.23 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/5699c6adb27afd6b3edf69b9e2bce8035a9c807f |     
    i686     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/aea449631f59fb77434ce87e6e09f97c6af2c002 |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ccf3948f90cb153a2659609ec84e10c50587925e | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2ec3de2856d66953d386f8f5e4db51962ef76878 | ORPH
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/1f497d710b4596bf4919bd063ddac53b04c8fc84 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/4fa0ba0e91eea9ce65bff92ea587a8211e78661a |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/81faa71f5c6477509a2c441234d02c4840ae6d22 |     
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/cbccf0251fae8dc2ad0267148d3e6d6fa2762033 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/1b0294ae279cadec5caf00bb2bf2d3bae2a3e00d |     
  aarch64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/99e5d6f0ed5afad1c262bc0e3d1cb45be2eb7692 |     
powerpc64le  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/6dfeb0901f9232ba927b7350959059c7d446cb99 |     
    i686     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/c636b32c886b606761e0133867125d0c32d35d52 |     
  riscv64    |            nnn-5.1             | NOK | https://autobuild.buildroot.org/results/5cd2b7a288a1681068448de6715e731580908206 |     
  aarch64    | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/81fceb36223f7fe3d830175a0cabb748c5fdbc97 |     
powerpc64le  | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/14bbb5eee777ac3cf6da0167d6e84bc64cf67fa2 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/61306812c435c8aa499e21f2a487304220496ee0 |     
   sh4aeb    |            unknown             | NOK | https://autobuild.buildroot.org/results/c79f90f7984cb2a42a037bb64f080193416e6aba |     
    i686     |           which-2.23           | NOK | https://autobuild.buildroot.org/results/4e36f103abbed3341134f9926f1a97f7cf3a5e42 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                memtest86-7.20 | 2 
                       unknown | 2 
                 coreutils-9.5 | 1 
                diffutils-3.10 | 1 
             docker-cli-27.5.1 | 1 
             erofs-utils-1.8.5 | 1 
                 fwupd-efi-1.7 | 1 
 host-binutils-bare-metal-2.44 | 1 
            host-coreutils-9.5 | 1 
               host-ola-0.10.9 | 1 
              host-perl-5.40.5 | 1 
        host-python-lxml-5.3.0 | 1 
                 libiconv-1.15 | 1 
                linux-6.12.107 | 1 
        ltp-testsuite-20250130 | 1 
            lttng-tools-2.13.8 | 1 
                 nettle-3.10.1 | 1 
                openntpd-6.8p1 | 1 
package/linux-headers/linux... | 1 
               pulseaudio-17.0 | 1 
                 rtptools-1.22 | 1 
                  screen-5.0.2 | 1 
                  stunnel-5.80 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/a561d80af0f2e103eb404cd36d43d169e6f48cf0 | ORPH
   x86_64    |         diffutils-3.10         | NOK | https://autobuild.buildroot.org/results/f7ebc7dc7eca4c8c4f91b9ab62d50425a813f530 | ORPH
   x86_64    |       docker-cli-27.5.1        | NOK | https://autobuild.buildroot.org/results/4f1a0b3a532f652fe383d3d1e4bf448e402d752a |     
    i586     |       erofs-utils-1.8.5        | NOK | https://autobuild.buildroot.org/results/8594322e1d016157348b03c14935fae8b2bda970 |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/838bb60dcaee5151a5d18dc68c525c6686e0bbe6 |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/7d63c04807217c635abfdc304fda355cc884da81 |     
    i686     |       host-coreutils-9.5       | NOK | https://autobuild.buildroot.org/results/63890d1f6bfb4f1a9a29885e6446ce25c376a742 | ORPH
    i686     |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/e4aa228034949968a34afaa03b9d05ab594b1378 |     
 microblaze  |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/84e3de48ee2dee9d6383616446f3783741bb0a50 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/7dbe878bcc11245593d2256c8b561a43aeea434d |     
  aarch64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/5f485107d55536600dfa146f9672f4194e29c6d4 | ORPH
    i686     |         linux-6.12.107         | NOK | https://autobuild.buildroot.org/results/a85b43ca94ded2cefa3208775e43b2a50b295f60 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/6178ddd942645230be725129d6244ca8c2eb8920 |     
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/8ebaccbb20ed5a0aa478e653838ac71d81453f93 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/a857f6823bd759309784c52c47da8495ad78f2a6 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/22daa0826232c42577460559aab9149e0f32c5a9 |     
    i686     |         nettle-3.10.1          | NOK | https://autobuild.buildroot.org/results/7d10a127e0e9ccc822ae73792449f5000ebccaf2 | ORPH
  mips64el   |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/e43734755d15793810f18eba4137a3d82acc7cbf | ORPH
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d19b7da8233dec316aeb1cd10ff5654bc4e23b0d |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a5b568532ff29e2d173f465bf8394559ace62e77 | ORPH
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/92d209d19ae202d3f79bc1dcb10911b309dfe8f2 | ORPH
    i586     |          screen-5.0.2          | NOK | https://autobuild.buildroot.org/results/c1826d2e031f806fea7f068290e82eb08f31d996 | ORPH
    i686     |          stunnel-5.80          | NOK | https://autobuild.buildroot.org/results/d7be29048337e5268fcd75575b2d143e4506bb4e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5328c931da06032ed61c1d2036530830502c2a74 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/5dad95c03b999aa6cf797bf919dea3afd5f7e3f9 |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/58ef7b7188df4cc1f74d30cc63c2c54c8656c416 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
