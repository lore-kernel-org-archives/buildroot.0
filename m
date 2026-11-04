Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B10606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qr64g5+9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=in/pqRFY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0BDB40583;
	Wed,  4 Nov 2026 04:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOr9A_CD-N3S; Wed,  4 Nov 2026 04:31:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B3264405A7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793766676;
	b=A08wpuX2eg5GXNrmLlzIHDeQPr/rfMIfEuQw4F+6QN1MgeB0+kZGiiTHW6DiiBmSZ7r1
	 WZM2NNQ1MlkY2Banf4GGC29yE7gEjoF7vu3uLrqZhaIUELd8qbB/6KloJiI7SIgGiBWHt
	 9I89EMmiD14Yewm9ESNLID48ZSRwCAfbgqJv5F2HBVjWgPV1hPkcXijyI0HMQVw2E630P
	 SzKBlX5MtoK4F9C+aA9J35LQcR1WgydCPgVom6EXPIRRUbiFgwz+2E+bH1nMNgI1cyqKG
	 OW+Zg2r+oNIOHvAD2sr25CNQA/3Y1sdVjus3FzohM5Lcno17A3Ztpwhs28o4NgdYk7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793766676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4BLuB0dH7pRPdMN92D99Nq+N0CeA1zxxmZeV1/DZ+ws=;
	b=Qc2CdsftxLRKjlPGtkYBFG/5ODSBtd/7Sus+6tx9Ne7zuAOMT5WAqzrZzHG1VXlJWw4X
	 T1I0yy2xJccDNtFmPdhxaPOtcDEh93pUrj6aJNo8HxjCSDGl/q6cE6UyuK2anHFH/uXlJ
	 rL7bx3gCQ8bAk0hzhkb5f4WhZiOyGGknSaxRi8IoN+SqmFTWrqGiqvzGcKhkOgleIQuUD
	 kUbRIEIt8GVyCGaOmrR1hMwZ1tcBPtc4UiTXsSEa5rErTMyRIN8LYSoHwEt5rbeKHP8sK
	 3aog9UszPnzGf36wKH1hQovOQdeWEOlfm3pUbOW6BliK4EpI7FkMAKFtsb7kvvfPvOQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793766676;
	bh=4BLuB0dH7pRPdMN92D99Nq+N0CeA1zxxmZeV1/DZ+ws=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qr64g5+9uQvEXLLi8EFzVgBpkqbYpXrOFJKOljCh86vP3BycSIkluLgePGxMLiPv5
	 dKyaJp4L8nJ0Sg4dDZMo98pBTDOOZ4PKwrrH71NZhmX04SONpMfga25grCPoD5cqgy
	 R1f66dZ6Pi4cjc4NVsr17Bxb1Dp4y2RBm445xIS4RGD9QekibiOzfj1Y25gnW4qK94
	 /q0wvEDVJ8ljPuHmQuR/y9p40+4tL/8QJ6SJuLg4ISXw88jIrnGT7f1QjjsvRo57IT
	 hCcIE+uAuDgMweUUfcQRVnUvyiNyYlIuSpRHfvaPQc78J+dFaf6N5rwtlwiouQUp47
	 Ht1WfqZ+GexXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3264405A7;
	Wed,  4 Nov 2026 04:31:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BC982AC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 04:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71A9F400BE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 04:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAoGaM5_BOR3 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 04:31:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D497E40048
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793766673;
 b=C5lHE1r+Hq2OMqaGmB3JSH268j9pUVUoj7ciAgrkFP9B3PJ28kOiy2nwsgmGXj5Ao1Zb
 NYyvH9ijQg4MtwTVAVeCd8iFQVw9DsHkFDnaJTHMGsnQ3FMUfPRhP1YHFVEBQoYttj8Z5
 fcAihASoiMx+Hi+WsszfCcIhzdlHBHycbikuKTH7I5VfHHJ13EdgOqbG0W9LUlL2h88Eq
 t8+IWpXlcAQUFe2S44TUdBNWrqgHkFHEXgnY+dNgIAoPPbiXdWmkTZEZVKBA615uD7Cdi
 ZOoe5jY+VYtMLZQelBp8TFR46m53NGIRsJqtrZkzkhu5UsKCcq1btZLc/vj183LI/gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793766673;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=A3VWwYcRumqA8Mua6ygW2+9/FgWU8FKEtOsQ904Ig60=;
 b=sUFaoS0Ln5i7rG7Hsnvg4oGFNIyjdSS8590wRlokfKR2s+V+Rwrc1lj8E9YHXRqupPuk
 5UjZIG8KgG8Q1HJnixtVOgEYcXsZvf72n2ly0PzjIrCzzokGFtxYQpzhTNsyB0jLqX3cn
 yzCJ/gCu8PBvUBYdY4qGPknBNVoOp4clTOgk6+1Ex2CVe8a0icqpbyYwLSIsdHHVPH+wl
 zcHrh0KFbfC79tO/9vpd2FCP0PDNzrNnkTVMnU1CPPgAn6qzrskILQBB24QQB6iq4lqD5
 NiXdWyJTd+IWVc9C8h3dKmlUKxNjBz1u6ZOre4A2W9RQHMLBvDXYfyK/Z2Uq8OLMdog==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="in/pqRFY"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=in/pqRFY
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D497E40048
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 04:31:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so1534475e9.3
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 20:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793766669; x=1794371469; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=A3VWwYcRumqA8Mua6ygW2+9/FgWU8FKEtOsQ904Ig60=;
 b=in/pqRFYPg6pHSvkBDHcjVARO+/9alSKWN+1mtTgGw/a+0ZhnHaHTWd1QzEXRlJzr3
 1yHSBQ7LQD3qmfz3jao+WIYN9e738kdJc4j9XCwe5iPBJrhBmlQNS7C/2LkXtFsbR5Hs
 niW34E2QEtiUrdkdX7iFwXMW2zVJjFTKEdCtsB+slTPTCf3Vi8bWefM8O7I/y06p3Xw5
 ENgxG/6ery2sSvj9MS1637ELt8h+TKNyMR9ixv6HqhrcYegFGtyKdbPL8fVvPRDB8sXs
 ikg5fXhqv85pHhjYYfzPtq9TbTfoNpnHzxjPqWTQ6VCwDXZ8NOAyXTWPUTBSskGq/2OY
 wbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793766669; x=1794371469;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=A3VWwYcRumqA8Mua6ygW2+9/FgWU8FKEtOsQ904Ig60=;
 b=1CaH9AGHJ675VzvAqosPAnmHzpojXbNYI65KTkmuRuwhw1O165lL06z3sCGxMrl1sC
 N151YNTPxlMhWt5mstQAYDBEOlIo1SW36ycn/XBqta0B/kD0hrDcoOVYQx28cudbgzlq
 Gmp/O5w/dVttH7f6/9cL1V8HiIR94/asg3x+w6XgqaWocydW5XkFvDpq+gU78X98RpQH
 ozajf4eNSCVxBJagL2bYFU8qONmCHov4HPmnVLe70tU/sIOGeex/q0XJc31WN1USlPHJ
 CayIXbOQGtctK5w3H6sX2O+NsicVR7zY8L1uLBpZ7b6cv7yEjdlPRjt4YyCL9szU37ha
 8VPw==
X-Gm-Message-State: APuU4Z9hzToQT/7HSabwKrNwTBWFLT5xo8RWRavRiVR5n3W64u2JUeBF
 uApoYpCC7D0Rp17W0ZdIQyPNvuY+CKt/1P9w9//Rpi8jJGe7Pchj+GgNsSmgdJNl
X-Gm-Gg: AYBFou2PunN9b+U6+Gx8E5mIwjsnimbim88kAPsZyq03NbyQyHPcp1//tLlXvQ62kkd
 FzAXVVnKuUnyM7wTUi6BxwhYKT+FPzv8AXMJEMUNTiT6ACljtSXEjkTcmX5p+6dSLjLcnEHZ/Y2
 xj4/HQGlk+RijL9u817KWiNI+Z8AKo7cMXENo5GTlxk3WhQgiPncg/knm8KoQ7yYEGwFSqZnld7
 v/r2Q5MCKmfQ1yQ2gLJwdMyyX3tBtnQaJX9xkLcsCIznv9LmaZ7lQLjFaNavR2QPCZLdRtThXCN
 yrBJYNs9dQUAS4loxEO2XEd9cvIQIMma1sDYuVypzuf6zmisRc/a2noxYPpS0d5RRIbawbl4rGA
 GCJ6DHtWV4u3hEP7eV9AjZvWzMy7Xvl/Fs83NvFVrPq53DToX2YaTXn1iZhn2/QsKmkbZEiO3Dw
 tZ/cD0jCr1Vinl1ux4M62lfWZ/shKMMwxY+eax6F/AWRg0YGs2Jb2xhLSVhStVwiZP0VTTixbCq
 URC1f6HZggo23ZAlJf8kJsTetaJJ7JyTllCKyIME6IiwptfMjB4J38hNWH8uJRyzvtG6oL/0PT7
 N7EUw5yaUKpl1wg4FVGs3szhUbd5+d02J2Hy
X-Received: by 2002:a05:600c:1381:b0:4a4:fc8c:cfd9 with SMTP id
 5b1f17b1804b1-4ac180f27cfmr362216685e9.25.1793766669392; 
 Tue, 03 Nov 2026 20:31:09 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b43457595asm13481985e9.4.2026.11.03.20.31.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 20:31:08 -0800 (PST)
Message-ID: <6aeab50c.7c6011cc.1b2267.da7b@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 04 Nov 2026 04:31:08 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-03
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

Autobuild statistics for 2026-11-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 12  |  0  | 17  |
  2026.05.x  |  1  |  3  |  0  |  4  |
  2026.08.x  |  2  |  3  |  0  |  5  |
    master   | 26  | 55  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
                    lua-ev-1.5 | 3 
             open62541-v1.5.10 | 3 
                   perl-5.42.3 | 3 
                 glibmm-2.76.0 | 2 
    host-mender-artifact-4.4.2 | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
                  lldpd-1.0.22 | 2 
                    opus-1.6.1 | 2 
python-remi-2022.7.27-37-g1... | 2 
                    sbctl-0.18 | 2 
               tcf-agent-1.8.0 | 2 
                    attr-2.6.0 | 1 
                   bird-2.15.1 | 1 
                  chawan-0.5.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
            dt-utils-2023.11.0 | 1 
        edk2-edk2-stable202608 | 1 
           ghostscript-10.08.0 | 1 
             glibmm2_66-2.66.8 | 1 
host-am335x-pru-package-5f3... | 1 
                 host-gdb-15.2 | 1 
host-python-charset-normali... | 1 
              host-rust-1.99.1 | 1 
                  libbpf-1.6.2 | 1 
                linux-5.10.273 | 1 
                   linux-7.3.1 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
                     lua-5.4.9 | 1 
                  mender-3.5.3 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                 rtl_433-25.12 | 1 
             tailscale-1.104.2 | 1 
uclibc-ng-test-132c6134d691... | 1 
                  xxhash-0.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/8fecbb94bfa926d6eb28823a96e959808ebd97e1 |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7af4a2d769e61639bdd6ee7fac1f978c97eca892 |     
powerpc64le  |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/8283e5800cd5f2baff3dc29c36106d810103a02b |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/ea5871110ab17694bdfa3b0998596c5969115d55 |     
  mips64el   |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/e606b2117634bc125d22d7d3c62c2d1eadab440b |     
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/563345e3f1bb8954be6286a1a43689e37f4786a9 |     
    arm      |      ghostscript-10.08.0       | NOK | https://autobuild.buildroot.org/results/c3b208883eafd4087b097c29a67d02c4cb07abdc |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/18c49cd2cf79da295e1a586f9e0e4a94d627f16c |     
    m68k     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/825890bae6090c60d13cb2843a50551106fc1c3d |     
   x86_64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/9ad92826df682d737ba4ea73e122affd21f95bed |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/61286905f25ff96beb26dd6f80d2d104046ed6ba |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/bbfa3ab42c7a5ab9931de29a5bff1dde17beb1f6 | ORPH
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/fcbe53a7685c9b6d7d06431ec52c686bd8512801 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/2c7d1b8cf1f1bb5447eacb83b9efc60465376122 |     
powerpc64le  | host-python-charset-normali... | NOK | https://autobuild.buildroot.org/results/b0d56c0190b25b2eed736c1ea8899fe9d896f12e |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/0ed6a7dff128e51abcd75b537f1e5168b760c7a9 |     
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/0d72b36643ba7d8cfbf8cc9e20f8c7287b6ed348 |     
  aarch64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/5f18a898f3783e720b2833cd09a6958f98746130 | ORPH
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/6060822835c1c0b20496a608d6571ce929cc6208 | ORPH
   x86_64    |         linux-5.10.273         | NOK | https://autobuild.buildroot.org/results/2f44da537a8d35969c012b39e792ab446524fbf9 | ORPH
loongarch64  |          linux-7.3.1           | NOK | https://autobuild.buildroot.org/results/3706b2e504ee0d7d1023e7db55effbd6706fbb38 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/7ceb8837bffa6b6df0609a7a4acff2ca5e880461 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/86c33797a5f09dbb1162a554cb6019f7c0702fbd | ORPH
  mips64el   |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/91a599bc913f2fe9c5e554f4b523b7fd6b40db7b | ORPH
   x86_64    |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/40303f099c734349cf58e561c5644bfaafb6a11e | ORPH
  mips64el   |           lua-5.4.9            | NOK | https://autobuild.buildroot.org/results/b95786e90e859bd28d8b9f2a0bfaabdaabdfb2f3 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/e398e5f41236dcd7a59c19efed6d8f2503f5251f |     
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ae8648247c8633b6749f616d8a7ae096a894d109 |     
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/7d5333736bb1e431afbaef775cbc907a9023b075 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/7f43af4805b1d02bc37dcad4a2a514e57eb4a909 |     
powerpc64le  |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/318cad924147f4a5d8a872bf549fb007d1d97905 | ORPH
   x86_64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/f33c46fda88dae2c217082e35593c20208af0111 | ORPH
  mips64el   |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/1e1720dce68d7e0b4d95a4cf45a1638a9c19ba0b | ORPH
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/4c47a742b49bf143cda8fea2ecf159796489c9cd |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/87366fcf3d913c84545d4cf8c96296cbbaaff1d6 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/059c6787626ffd22db049c1376578748d125143d |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/8763c35f40813beff4179d628d90238b34dbaff8 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/b129fd5f6d20c73a739bc74f4478e5fe65e3fbc8 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/11edf7c9f2fedfe3824974c1cab2ebc901fce58c |     
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2e793a57ceb3d687a171566901a92fa236e15f2e |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/0bc14736a3bfabeb0a64eca62a793d7b94a3e598 |     
   x86_64    |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/d46b7d5b4da946468d84da7bd5bfdec0eeb57585 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/0365cab5326f056da803a1eecfeee5f01c04788f | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/cdefdb7f91a2f5febd3b0180917f4d27b1ee92c7 | ORPH
   x86_64    |       tailscale-1.104.2        | NOK | https://autobuild.buildroot.org/results/1c3565c7fd7fe1927bf1d4be858e75a32be95c0e |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/bd8ea151324ba66c20aa5e38b0d5c29ba752a989 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/bd69fe6988ae0225f19e416f6e6aabd40a3e0325 |     
    arm      | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/e06305d8a0831bbe91ac3df35b7c4e5c3f6fbd80 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2c22690a77cc3ecc069ced1ece01e2dceb056a5f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b65bf4ea5fc471d2f19dd0a5073f08d750b37d78 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8b7f5095c2a65a530a4a4020232e8224333de432 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5b37d8719840cbbb2dda7e3e794f7ac40dfd1c47 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1a7a16ca9675420a1d41ddcf494145d73ee003ea |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/c5c34874cddeca6120ba1d38fdd5deb739b5c7b8 |     
  aarch64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/d85cbea4746c9fa766a5fb44d32fb1d56db6bdd6 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                   dbus-1.16.2 | 1 
               trousers-0.3.15 | 1 
                       unknown | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/6e7153bfa1f05e25e837ba244048027ca5a91b42 | ORPH
 powerpc64   |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/11e258dfe58d012e4470ea749c5de277126b6aa5 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/8062918210ba465ceec66ecdde885eccd32c7a5e |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 
               libepoxy-1.5.10 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/c26ad5c7cbc6ca2d3171c7ea18b522d8f7becc3e |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/296ad5f70ca68453ece5862dedf73bd8c020ea5a |     
    arm      |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/e2b852d38c27d80e265752db03c709a2b6ed7f41 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 3 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                 fwts-25.03.00 | 1 
           host-libselinux-3.7 | 1 
 host-softether-4.30-9700-beta | 1 
                libselinux-3.7 | 1 
                  mender-3.5.3 | 1 
             netsniff-ng-0.6.8 | 1 
                   perl-5.40.5 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/af23a84fe4e59ff3cae19b176fb4e16f967ee096 |     
   x86_64    |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/33285ec05959aadc5d237b62772e460688715dff | ORPH
   arceb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/49cdb1d995f7e958867bcab4b5843ba7db9df84b |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/a2d2853695853724f9069e0a8e9d895a116118d3 |     
powerpc64le  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/d77042af2e4dcf67487fcbae57cdbbaefd0bda7e |     
    arm      |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/0037d730b8941ab403c9b58291efd16c08262194 |     
    i686     |       netsniff-ng-0.6.8        | NOK | https://autobuild.buildroot.org/results/589c68e0572bb1b56c2b01ce58254d974a79cd0d |     
   arceb     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/a70ed4e81ca42575c2f4864a70cd1a2eeea268d1 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/16f1855521514d543ddcfa18a2d999c1ccd0f6a6 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c65d29bd5592b2a4e7d5add4d87ba5242ae73ed4 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/13470eba6e2530339449c9f2b9fefee878cc69a8 |     
    m68k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/23ee87325f71229a71fdd24082a0262387e6cb39 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
