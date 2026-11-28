Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2674B606A31C
	for <buildroot@archiver.kernel.org>; Sat, 28 Nov 2026 04:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=scuaHJ0O;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOSR2jog
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E823B8128D;
	Sat, 28 Nov 2026 04:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcebZ76rSr9P; Sat, 28 Nov 2026 04:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9DC6C8128E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795840042;
	b=aTK0RFg3G3kX3JyMuHruPUiLVHzOuZwY70vEtKZRH1xSzenFPqwr58xEOAtqR7aDSwxM
	 t3RZlpHm8EPzw95FXruDnvPjFjQnjczVpYi5v1+VmCA7yuhuc58b3iNSUpeEq5ljo53+8
	 9A0sNTI48JgjF2PzKEOZGqeqCpZx+cdqEUJc4T7T5bgWCvRpHAlsxKbDGRscCCZv2LdcO
	 fcgyJI0AtLYwqoGil5qNtVeZH0FuuCSYCJiCgcqzUk4KRSaMGRoMRqOABs++kT/oP3f7o
	 rM+v7C3GyqKey7U9VKQN/h7kW2donL2Qh7LDytiWJdWdwiqJj+NdpJ4EG9vpGTAcLcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795840042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VcP+mgfyyFY0ur8lMZ3Adp+gBg8ZQcIQkrK3abXgxB4=;
	b=Nl4Ewr4bVcdsUUJb+yTqg7eUkybfg1NavWmGQxon34bFroCdK9Kcm18hM4k14sxYGdp1
	 pKZk1y4d02C62whIE5nUHHMS1NDeOtMTvUPiDIfE7FH6uOquC782gYoAJu2BaqStcfKBD
	 gx1w30aV+bi84doww7CANsEpAQ+smUo4fnmCOGONwe1ZFWZAvgRvLrapCwadhphdVeBCB
	 xQ/0q/BdvaEPRgL/MCzHtUkOmKhREMX4sBR5VGfoQz9MjMLHdAZt9gv9Yp8rHpPYcD8H+
	 jvAiNogB4mIjxM/FtCOdDu/TbX9rxD1luhAlgVzbemSZpJNUczVHm2kL1KUYGNk1wRQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795840042;
	bh=VcP+mgfyyFY0ur8lMZ3Adp+gBg8ZQcIQkrK3abXgxB4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=scuaHJ0Or/SZu8XUCMan71fOjtLwoJ4HBQ8PrjLFY6i167D6G6PRCla3BPMsfantJ
	 WSsHZoLuFmdK+MGff+0YiuAwsnzit6+IB/kkEEauOI3aY17QXwu+UUOzBYybiMEKjW
	 LP0iQ6FZyGsjy2swBnnq6IlccLAeaTZPuHd7bd9xhIz9gZgwLOMaQed0lc6fhzIZK7
	 +6ss8Cxircl+dnfg+K8FY7wRNB7zC3CvmfDvVprVi71Q88eg8v6r6rnCwGLzyczugB
	 EN2BttPgzr/t7CMG6+DT3uYj2XBua4YFrpm3UpfMIVUmoTJvwxZNrCisrkNv2+9WwY
	 wOFq5il6jzQBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC6C8128E;
	Sat, 28 Nov 2026 04:27:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6134373
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 04:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A818240A59
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 04:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8594rOh9rli for <buildroot@buildroot.org>;
 Sat, 28 Nov 2026 04:27:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0828A409F9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=jOSR2jog
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0828A409F9
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 04:27:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4bba5e17728so32033135e9.2
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 20:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795840038; x=1796444838; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=s240AQup5eEd9+Ig4IeLGMf6Ccd0gwLUAZ+rLuSkIaI=;
 b=jOSR2jogoxf4kJQtQWsWjVs+Y1rbn29Bc3o6UqaRE8pH3WRg8s+56r3wRbZM4izrFf
 gD+1tHjLyHED/+uiTzcDX6KHyvD2GFWnzE+E/Ft3SA7p0QKotsjdxb8/ZehSpAsUVilB
 KtQXl9MRRtEp3kqszlwqy09R8TsARLFe6F96EEAd/rIf7cuFVYxK8VGSetaPn9Uai91I
 WgjgolGebXUmcVJNKLtzglWgi5TwxVIhI0gs8Z05pmZ4KWLPSeN8NwkPfk2vocfgmNl4
 odCJKj81ZTWLBOlZTTe7b87/rar3dXI443qDbVTK9rfnwYau2R7B6xZ0MB6In1PYJKha
 ld8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795840038; x=1796444838;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=s240AQup5eEd9+Ig4IeLGMf6Ccd0gwLUAZ+rLuSkIaI=;
 b=sNzQTQO/jSRgzVVwMmBem5q+F9nRcjVCdkmgqKZ20k5etTRIIAF1Lok2jhekAZH0B1
 dWcLeJ54so6ggM4KFllG7TWFT26+uH/J8mX65h7nhlyqog/kmIoLrKWRuHFUzbBUzQEv
 1WbivMGKBzSWnvuhV/uAp2Nw+KgFEl/8boUeDTPHuiMBCi4R++AuYhjLZXRAv/ZWR7T/
 Hdu4Tk/U5cHJRHdXxKrtRBCjUjd/C/FfhY+2khUDxTHF+fcjrftri78bI1PeY+TTcp6C
 lfaipZDrnvmoI63+8dHZf9ooodVzFoJdqh2Mx8EXE4GWlmZ1izlqQJPUdaLOYJd4F4j2
 QMHw==
X-Gm-Message-State: APuU4Z/yE+hfgLHAeN4JtxoE5bYGXDiNEnsWR65fkc72sQ69bSTPDMnE
 EXKiLSHIlmVOKSuoTHHs8kb+xTAlMxgj+p9BGE470miHi2x1VVerNVZJwXDGsZ69
X-Gm-Gg: AZFdTZeCG2iWvq0sxpIwIWyNzIePVqPN0AtkbMiXXcHW0NGz6Jk5VXLoi6TXjJky2V1
 g/d8Wt8FH0AVky0F0TWPTwnkBits2I6izDRLUmku2usBywkSmU/wVaBLQhOEc+tu6fzIc7yiU/Q
 BYLX+wlZjOrJ84smACkjwgJD+2WP8KlwIO8fFBaTc+Xhi6rpuo+cGqsq2TO809UbguzZchP51X0
 H1xh/6J6m199HzUQhmwiubX5+7yYfy7FKv0HWzE3Tt4BAu2HJmkyLXmgCQUTYZwjzKmssSI+cdM
 2pRHedvyx0bpo4KAFK9uvUC0iLGpnzj5LwgTm4xneEL1heGsJRQWvy2WDex1Ys3DUmYIZ6lMSYY
 Vtp/Q46cW0BCb7HSoLgTnLJzcApx1FgajllnUI//J5hbShWoTX51xqx2M/gWmtJdxRJyD05PT7t
 dLvRUxncga1rfAKlqQQqnbcGjbzioN5KEH5Ij88avxW48FJxGokBfK9MGyAR26NW3EJRnKz82m2
 o7jYbRgfReA5/hWngWjntr+LquvHhHzjw90/H4bt2WdlosA4kHcqot3hrgS+B3Fsm4aUA+ryZhq
 2cF6/JDeSKHyDXG0/t2fUW+ZsjpHcRLK
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id
 5b1f17b1804b1-4bb88826810mr524384125e9.11.1795840037634; 
 Fri, 27 Nov 2026 20:27:17 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853368d3sm726787215e9.1.2026.11.27.20.27.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 20:27:17 -0800 (PST)
Message-ID: <6b0a5825.d8e4836d.1a537f.251b@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 28 Nov 2026 04:27:17 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-27
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

Autobuild statistics for 2026-11-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  4  |  0  |  8  |
    master   | 22  | 44  |  1  | 67  |
     next    |  1  |  3  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
             host-libbpf-1.6.2 | 3 
            igd2-for-linux-2.2 | 3 
    host-mender-artifact-4.4.2 | 2 
                    lua-ev-1.5 | 2 
                  chawan-0.5.1 | 1 
                cryptopp-8.9.0 | 1 
                 glibmm-2.76.0 | 1 
               harfbuzz-15.0.0 | 1 
            host-mfgtools-0.02 | 1 
       host-nodejs-src-22.23.5 | 1 
              host-rust-1.99.1 | 1 
                  libbpf-1.6.2 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libkcapi-1.5.1 | 1 
               linux-pam-1.7.2 | 1 
         mali-t76x-r5p0-06rel0 | 1 
                  ndisc6-1.0.7 | 1 
           oath-toolkit-2.6.14 | 1 
                 opensc-0.27.1 | 1 
                         pcre2 | 1 
                   perl-5.42.3 | 1 
               python3-3.14.10 | 1 
qt5base-fbed962c3195ab3952f... | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                rdma-core-62.0 | 1 
                 rtl_433-25.12 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                   s6-2.13.1.0 | 1 
                 s6-rc-0.5.5.0 | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.07 | 1 
                  xxhash-0.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/d6a6d591322272feefbc242c8541e15b27601c7a |     
  aarch64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/9aec21d3df12f4193e2efb3818fb325b60f52a90 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/2147ac8b0cf3734048178f4a22ab8fa16c7387d4 |     
  aarch64    |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/2dec7f0a06326052d7b24f74c582719edd2ea7cb |     
    arm      |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/a3ebb3d3db02e6fdcd02bbbd539e4d729592a325 |     
    i686     |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/e30580e2bf0b25f41739e30e2590f162762735b7 |     
   x86_64    |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/6ddde1fa395995074115b40899cb621cd23d3850 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/f23bb6a78f78c9bf0022d0180c24a31e138131b8 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/b367756d1424c5ecaf6473fee3401dd572fd27f0 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/751fc623e8228116651247359a9536f78c79b833 |     
powerpc64le  |    host-nodejs-src-22.23.5     | NOK | https://autobuild.buildroot.org/results/d74df7cf1624ea276243afac9e1aa0d6db339caf |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/5bae35113ca2011b172f4cdfff5193e1cb5f9037 |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/e371ad71ed98d39cd741d1a457c360058b95d75a |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/125e08dcbfb386c8b2525ab23ecaee393dc39381 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/16700d19b313210ed8f29e3fb24000975464dbe3 |     
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/1865826b89a68b56308f60ad8509eefbac2e6929 |     
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/9c513dac376e54c220a553dcacd6b5c48c5c4486 | ORPH
  aarch64    |         libkcapi-1.5.1         | NOK | https://autobuild.buildroot.org/results/9ba8ba76c32b236718b48af79aa957d2c99ce50d |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/064805f28549d072a5ab84f70c55fa4064d32362 | ORPH
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ccc7e81a474f110e6dc2b13663866846367544b9 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/32b191beb02e079d2e8024cca461621c579510f0 |     
    arm      |     mali-t76x-r5p0-06rel0      | NOK | https://autobuild.buildroot.org/results/6dea6cef47c39158380422bbeeec69bc4363e9d7 | ORPH
  mips64el   |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/8398b443a8c5ff8550aa4ced733c4899f7e9d794 | ORPH
  aarch64    |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/cd8cc472bfbcdd1e14d4ca7a1c0a2ade13d6fa84 |     
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/b4d383f17f097dfa5a2feab1808eaf634a876bba | ORPH
  mips64el   |             pcre2              | TIM | https://autobuild.buildroot.org/results/9018479d0c261932ab35e8355350d4fd476979f2 |     
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/4953ac09c90769e123cac34c6b18e36d074b88c5 |     
   x86_64    |        python3-3.14.10         | NOK | https://autobuild.buildroot.org/results/97d0d313d99f164e94bf9dfdc4031ba07a237324 |     
    arm      | qt5base-fbed962c3195ab3952f... | NOK | https://autobuild.buildroot.org/results/7a98de3dbd700ce0a76c27017a77d7e0aefb5ac4 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/9dcec4872871719171e4fd3ba88a503897dafd22 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/1e5a737867be9771d8ef8ff303408d3c5de032c2 |     
powerpc64le  |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/6fa6fc808c1e045a74995e7de5aa1fc577a6323a |     
   x86_64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/6fecc4592c8d43d15406efd90aafd7a622818651 |     
powerpc64le  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/6130bf0b917be76898bea102f2a6cb839927d2ee |     
    arm      |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/ed2bfb9e018a31262c89ae813609af44de651744 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/6deb3c0a5864c15f645cc254f8afc4b445e4f17d |     
powerpc64le  |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/7bea3254707c87e86f9585947852614a86d64afa | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/5d5a5d790475148b4bf45fbab65915f3634fc60b | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/10bae01ed375c04c4fcae9fbf9742d212922d213 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/3531be33296986def93dfe9eae62c7de9cadc6e7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/d68717e557967982e7bf0467a8b9a6b8fcf9c588 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/482f74689218fc6111f1fe36894ccd485ae5d684 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/895cd43bb2138723631202e2b4558a38e528281f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c4c7e391146cd8c02c73d654b82e08781837c0d1 |     
   armeb     |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/f28b26dd3cae4f371ee17e5ab30760c898aa430e | ORPH


Classification of failures by reason for next
---------------------------------------------

            host-mfgtools-0.02 | 1 
                   perl-5.42.3 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/415eba1f9367ead8a69c6baf06e8ff74db473f5a |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/9998fb4c43283f92746822f9e1914fb3d8ab77d8 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/041e617aa49d9339ba2d11b88868dab466e8f012 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
            host-skopeo-1.18.0 | 1 
                 logsurfer-1.8 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/4aa0131c20d7add3c629038b999379f9c129ab9d |     
  aarch64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/eb559157fe94930366d2eff5c925f23ca15a5d7f |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/4e045c52f6f677f86c211b2fc85edfb99dee54e7 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/1ed8e812b21d21ba596007493f63cdab7851c489 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
