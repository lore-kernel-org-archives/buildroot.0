Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5302C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 03:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4755040ECB;
	Fri, 31 Jul 2026 03:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8BbZGg_U8XR; Fri, 31 Jul 2026 03:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D488D40ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785468588;
	bh=nUF060AJIPkGTysGGzSkUkXzCv3Vt5NXexid21YUx6k=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=srtAU3y3RjSQU1xrP2SlF3VdX/5L4C/rVkfPQ3kTBv8qRztufq87Yk4f8SLKwc/0U
	 NNlcjqxTmfxjcGPjWlYwTntAhK+IGrSqlGXB4BeAjKK6TaOmJ4bv7aHFICvU2ttbwR
	 iv+ALw+rGeAcU6A3Cie0knkIaS+eWpgqAUOMsQPF8YAjHj4kDzOMN78KqhIfJvhCK9
	 XWV8dhItBH/AlMrbRbUjLEB/RW7DODLGWg7fMlrctZUiHPB6jzRvDr2zbmBUXt5nFC
	 Jv3dBgjTrw+MoA+h8plA/9x+A6g9x2snlV13jTnUNo3u+k/pvWkecNvqnN0tX4Lmje
	 EUG0beBwfl1jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D488D40ECF;
	Fri, 31 Jul 2026 03:29:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F3EF2CE
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 03:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40A0E40ECF
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 03:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vUFPPqu_Z3r for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 03:29:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9AAC40ECB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AAC40ECB
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9AAC40ECB
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 03:29:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47f7854678bso204619f8f.3
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785468583; x=1786073383;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oQv87fKeyr/19heKUWILvSXJiWr6jErXoKg5QPFw0nY=;
 b=A6B0pjZgY3nlg+/Rd61+4AkVtyUwMFHtO+cPAuzs4kP7Fds1sP/0KIaK14Hwf/P+eg
 PewKegUO1H1XCyA2ypxlA6fSFSF92VVy+jVXVIBUr9kPyaqSDCYfOiTa8EJkJ4U0dvN4
 rlKST2ve8YyEjjj3cynT7le1p7s5Fl6iHPX7idb0Em8VSizWdbCuqA+2i7bjGxuYNHEq
 Kkm4T6/75tNafRv3LSr+45x5FIwY/yb3AWUMHdsOBUxxGkXminSwS99znj/INfUH1jjG
 y0jvYEnYvkxD9x+AyhhPv4ed3FeIQIgwwni9YtvQ8tDEVpTrRzrJn1egdwOC3yQgxsxk
 25SA==
X-Gm-Message-State: AOJu0YzJZRhebcKmVBMnLldG1bCU28Fglps/UiT4aMEvEo72WAqOqzZc
 lIijW/esVMpmP6GPfl4simEa1T1ggmdFuxpv4ATFuE9rbOxoLPECW1yvhWZtxqwH
X-Gm-Gg: AR+sD13ldDSeUzA+X5uu7v7xmlsSnNDPgwjrjxj6ipZda11V4eTkenet6I08EJ5OKCo
 sJHQHBdKPgEWBV5nsAXKIZc5HVRqTMXvmYR9W45mAm1+HteeFIEUkU5331JHZKDE/eUz43mCg4r
 aOnCFzxSH1+hqD+gOsEZZb2UseTbki5u0VB8FV9Y9Eu64W3Iu3qJD2wuTFSS01bVfPRfhr6P+zy
 1fRDb76+HDnHhtGtQ7fvCPnaBNh1TvPqWtUIDEf5DBHLPNOYZPH/mSarqlN/zEdSbnU9Pw9bfTM
 RDEnccIUG2IO/O3dPZ83tGJoaO6CnNruxZuRlQDkO6Zz9lV7xXvMqJH5QmLt8727j0eoLsnFLcg
 115N4Z7D6MJg8Vd4sQNO1ikpPUZ+Xx8Yt4P2/icvU4yWdEQr/C0FVwBncZe3bScz+qShUKH75QP
 IiQNWSoK0+Sj9AojJRdu3jyBEz9ISBfZuik1FyaaEkENZe176jGbSOx4R/lYXIoOQ=
X-Received: by 2002:a05:6000:611:b0:47f:b622:fcd2 with SMTP id
 ffacd0b85a97d-47fd2adba70mr986609f8f.25.1785468583293; 
 Thu, 30 Jul 2026 20:29:43 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc892cc2esm12036842f8f.19.2026.07.30.20.29.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 20:29:42 -0700 (PDT)
Message-ID: <6a6c16a6.3fefe569.14e2d2.ea6d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 31 Jul 2026 03:29:42 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785468583; x=1786073383; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oQv87fKeyr/19heKUWILvSXJiWr6jErXoKg5QPFw0nY=;
 b=eLPxpwFCQDz+jCd3qqqqbYaLteo/MXypZiaikV19HlScLp0tsb54O4knHZ1ZUiiR6o
 GhIC7XZNXaDic+CG89JxlGTZ/tRwgN1yzzA1xxTpUAoBJEsYJTdk8oivTjNjXJ3yROIk
 5BThTvXsH9MQkrvMdLjWlwfrnMCt7gBT/A6vqyKqf6H5fIXw7lfHsxiGvYI4ESkqYw/O
 SY4mLgPKMhUW2Wq2UF/0TP4H24LFTXWZzrirVa/ZlcbQt1mf/DV6SZeAr+RUOHhrlIuu
 X1Cz6YDtFp2GvA7hU82OmxzTYw6m1Kq6CWrBy22LaX5aSLrjqBi9B7C7CQOzeYh+0VKh
 5zgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eLPxpwFC
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-30
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

Autobuild statistics for 2026-07-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  5  |  0  | 10  |
  2026.02.x  |  0  |  2  |  0  |  2  |
  2026.05.x  |  1  |  3  |  0  |  4  |
    master   | 28  | 40  |  0  | 68  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
          host-binutils-2.45.1 | 3 
                   perl-5.42.2 | 3 
                    attr-2.6.0 | 2 
                   dante-1.4.4 | 2 
        edk2-edk2-stable202602 | 2 
               libecoli-0.11.3 | 2 
        ltp-testsuite-20260529 | 2 
                  ntp-4.2.8p18 | 2 
             dahdi-linux-3.3.0 | 1 
              erlang-26.2.5.15 | 1 
                    fcft-3.3.2 | 1 
  gobject-introspection-1.84.0 | 1 
host-gcc-initial-arc-2024.1... | 1 
    host-mender-artifact-4.4.1 | 1 
                   i2pd-2.59.0 | 1 
            igd2-for-linux-2.2 | 1 
              jpeg-turbo-3.2.0 | 1 
     linux-5.10.254-cip72-rt32 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
                  mupdf-1.23.9 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/f2a796d905d964b3009f058b569b7c3a044a5997 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/34cce9fd0635e2663350c207894fef59eb7e2469 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e04b1d9543f41946bb6ac0c4726d6876e131e168 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7e3bc56da8df5df35bec3f0528d422d12280459a | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5dbdaebecf53f4f8fdc4cae20a35f7fbd30cd5d1 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/937275ec081b8c0388fc391d6a6785cfac81af19 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/fab5e2bf3d37f7593ec5cee4b80fc8ee7e8b4b9c |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/e649390310cc3063941148a00127e417078242c3 |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/e754ccf98ea011e18ecbbe5afbdaed03eeb4a64a | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/db959b3d2bba5cb51d59372f0ef4f8911d1256b1 | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/885c40ce6cee8f5ff20b1087741d139ca4851f7a |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/ba3996a53342ed9a2aa1ca707ead0d8c63b0fc6d |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/d8a3772dc8908cb610b936162368b068ecb68408 |     
    arc      | host-gcc-initial-arc-2024.1... | NOK | https://autobuild.buildroot.org/results/6730693c227dc8d3866fdcf22bd6757dc70856bb |     
   mips64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/b403a4fe2e223e8d75a283b2706182e964f76d70 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/fdede246de2deb7ee3d11cf74130e64cabaf5737 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6d7e143060254a32ffb00bf56855662e04e588eb |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/05a7bda2100f31c312041d1312c6f570d89f28ad |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/e9fe3896026696764949641715fa08c42d96b770 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/253dfd495d0cc401b89e9ee754024460f6fe7a76 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/9cc2f3ff7eb4c3e906d2b1b061f34bb2b3cfc9fa | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4ed488aacc0b70246eec626a7731caa3c38c8525 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/569dce397b92bb78deae4715a2a06ca2743e42a3 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/7d60d980db1eff316e08f62012456789f82cff23 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/fc6c25e67bb62764b10d3f591074d5f4c62be1e8 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/fcc52de91dd3a39e7e8226a523a2dc698d019150 |     
   x86_64    |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/627489878ffdee237626b0fad35c508fbd150402 |     
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c1e1764edbdde11db9bf12cd5357c5d011c8a96d |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/6476dc84137c6f8b4368c69b29c6b6654ea5c925 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7cb7ec0f845b439ad35692887a691a7e3f1f326b |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f662dc784e8a40952370ababf0953f60f60db5d7 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e09ea1c53a75ca20c41efcfcb92e88f0fa5e7afe |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/e9fd1b26f4385a144c7ecaeba697526a35ef399e |     
powerpc64le  | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/771abb697ca88b9bca8f97176c279cd37726e0d3 |     
   x86_64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/79d5cb232189e5a0fc410c43f5f89151ff9139d5 |     
    arm      |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/3d5d7a186beda90fb42ba55f1c5890dbea43a6c6 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7a581387f186755644f197f94b1428b8670a52b6 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/bed942367edfe733dce8d7a446fe720d20d01c82 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1c780249f8cccd7f0c7bd79547536256deea4f69 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3dab5594c32844b84af990b88f03aa8ed0b1a6f9 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   bird-2.15.1 | 1 
  gobject-introspection-1.84.0 | 1 
                   linux-tools | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1d31fe587d69628c24a07d427ac8493c45030276 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/74121d83b1f693847d83da019136138098a587ae | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/f3e4ad357b6fa4bd33e82fe121f5ec3c3f531898 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

cegui-e7a03afc70c6182a091ff... | 1 
         libhdhomerun-20210624 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/e622ec6807f9950185bde8c9ac91c703f949c700 |     
  mips64el   |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/9b66c2b623ec863edabed288a3ba1be59d6cdd4d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               host-gawk-5.3.1 | 3 
          cloudflared-2025.1.0 | 1 
            qbee-agent-2024.36 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/2a31a8b939f2f19932046a326e2dff00cc1173ca |     
    i686     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/7dfcd020f5f811b4fd4881f46040cee7eb040ffd | ORPH
    i586     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/50a817f24dd105b217d769ccf2c473122c6f22a6 | ORPH
    i686     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/7130b04645391b694ea9bd33535618923e93645c | ORPH
    i686     |       qbee-agent-2024.36       | NOK | https://autobuild.buildroot.org/results/00804802a9ad49c18a8b970a9e06b88161576cb6 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
