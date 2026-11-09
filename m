Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CD7606A322
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OPJ60Eg1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QDW2xPWz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047A84066D;
	Mon,  9 Nov 2026 07:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkLunZj82Y26; Mon,  9 Nov 2026 07:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A281F40636
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794208152;
	b=V4FwxVeV+/c9gxGx+xPZuRnHq5WFgTJMAFn2WfozIvcLfgVW0cWi4aHoSAkuosCafeYz
	 2oxjQcyNCC9djLoaYTpYE6h122ooS3FqOVlw3KVZs44KSH5E8L16cgGmuuyAQtUHM5zBE
	 vO4hRmA67ZfbT/1Jwywv8RWkQ93R6Dq67RLYzIo4lTSu9AZngLMpBzvREupUFGBCwyRrw
	 7sN/iH+V+kZfQMYXj+OK1Jh0srlvINORFFmeL9h50zhzMFHbvkckusyYfJxfQarWBCiN7
	 /9qwipSoaB2T9x33JzV7ejICV+clfbI3nzdci3hwef91alYdpGTcahy7TY2lBl8UBVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794208152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:
	 X-Mailman-Approved-At:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=cXXQgQNF4/pPg68GbaAA+St+wHssRgWrHaYfPgSNgKY=;
	b=quC7FgssNtT928ZsXMsJAHwMv53Cvhi69DxQie7Iob3YQm1u0oTyCQ8RaZ+tvk/X8KEW
	 b9+ieGgupulVohDZIvnN0VCNRt+OMbtWKxrCc1wGvWEkg6OBtY7qbzWx55DvY/bmF0UIb
	 8dti1O4GrcmrKqb3arC/9Yaqky/VjJQdkGRW+199/UqBrrwf1e4TqbTmdfCxaLfhjrJlv
	 EjNapMh70FCd+r0ze9Ibw1O2d1tOb+c5glhqNYNlxPfgDMpHXR41+YaI7Xy55b60GI2LF
	 RCPS03UbbYfkq3Lh3AOV+tvGFmjG7f02rtkCItDnwtD6SUlWzJngRkzo3Cy78dmhSJA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794208152;
	bh=cXXQgQNF4/pPg68GbaAA+St+wHssRgWrHaYfPgSNgKY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OPJ60Eg15Mbtyc2sgdz7E5daFQI73RNU3wPYCOsnqEwKopkGtgfYXgSiXOGsGF9eu
	 n8I1jappFwP73TjSyPkvjvc7ByLROuAjDvGBOVrElidIMPLMn+3/Tvkm08qm37c4h0
	 JwEDivn17OkUJPuvL3ClqqMsRnEx701Cq1+wN6X+7REyYdwfq7jhKyYiaUbAPStMnC
	 y+u1Uy290meF5ZZKhbHUUB0VXoOVJO98BdSWrQ5tm78xz9jmpdn435uNq1sW1DgV7R
	 NkuqH7aGY7I0edVAuG1jEG1umi7tgiOe11KaXtfQZtzIacL15k4EfUN9eWKa0INK0C
	 ZJRDDWSNE819A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A281F40636;
	Mon,  9 Nov 2026 07:09:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E2E1A6
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 04:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB6994010C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 04:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VEjIL4RIdlB for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 04:33:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BAABB40050
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=QDW2xPWz
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAABB40050
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 04:33:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so3051045e9.2
 for <buildroot@buildroot.org>; Sun, 08 Nov 2026 20:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794198804; x=1794803604; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3dnujF/eHLiLpqPlgvT+jlmjf1a9qPWHgSAM1hj513E=;
 b=QDW2xPWzp50mJu4O/3WvSLKu5+mWJ5caob4Rtb3T8NA6mrhonrtU3xHEo17xl/sd4f
 UjSSZApVcBG/idN/jxy8dHfwUHLQ1Nt1LgVDf8AaYMY1SzZSBYDm8XHDCVYP3ncWX0DL
 td4uqTT+RC8HnDOfm4OWNoAuWTDquja39NsT9JxSQLsiFXj2KL+PpCDH1HtmjDDwzFvP
 c2W1F5qiPEbOOiHuaxfPI/VbHBo4oURaXEqBBMcBxk63q3KThWJnVTzB09OAbkm/6ddv
 BxJLMSabPYFM8+7q20ZR3V4OAiYpPjJ2Jh8PGYy7aw4eRLdlbFEoUODzKbCO5edEbjeQ
 PMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794198804; x=1794803604;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3dnujF/eHLiLpqPlgvT+jlmjf1a9qPWHgSAM1hj513E=;
 b=D/JB+2qGXpsPMOdcaVAjahI6TtLDT1iMumhYAAjqSo6PxPQ60YOSA7GPs8GDvk+ebu
 DPbCpVI3HNxe5omMW5SqbYiF5ztwcBowFJzh/EGyKb9Bn6GocffSI6yUIwRhj+8K98rv
 YLluhRHomLgy/vY69So1+Jg5AYYVuROv5iwv/c+X3cpNjVCNJfKKFr0nzfYnW4eZOyfZ
 oDo1XBewkzIJojgFuNI906pmw3yO1MT4kd2vxcZa207XwvBCgb4od2B9KPy2pLTUw1RO
 UjWb18LQzduroJY4b/pHyKTRWlWAzfqeBPYLsJHapKQny8xZTz7dlk92ebJVGZBVwP49
 fJiA==
X-Gm-Message-State: APuU4Z/1+fgscukuT1imNLxg6mVcSvE2sa0AC/nu9eII7qZhNoJe5xWq
 ByIdVfvSiSG4eNActLqUfYwZ15r58QUjHW20t6ARgHPgBCCUOX5yd5VgeoyiQ5N/
X-Gm-Gg: AYBFou0vm13bW6yN/P2Hjh4GBH4MyU7m/7cW3eIUw22YbGbXJC+lTkFNmq7/qkS+sGM
 12CIBRk2PEHoreaa4K593wWPStqxCArvp9DlWDJLTfi+71azQ65ClcTVnsXWIQpQiwZpfZ/UCMQ
 rpEoE9yosZb1VHcIFmLjoubF2wTTw989hg+QptYGMLmkse699vN9Lf85/weS7JGsLiIomUdGZ4/
 Ahw3tIMN3icvV5OrsjHNolho5uBs6iy+B7TdAczE0wokaN6V10zdsI9mh+vnjNEsIBjJfFRz+9T
 p0FXNOjkA3LWnm5g1M/whhml0EFCXhgFzeskn8bcYjrlZ3w5Nm68XgxEgrnnh1L0yO82GlIt5sr
 tkkHe7zD0tTgRU7UnXrl6bE1OIAyYQf2n3GCFzm3jhIThRglR1n/HaarWTEVdMVcWLuhDBy+k7B
 04RvyrV5TOKXBeUoXPmr8U7ZChm/VHx0I1gLzyldqKNQ5r+DJbLWEJiQqYis2Ssnxv5rCB4AbO2
 LVgDHk0FSkxz3v61g0BpK50oHX7eVp0NYbUZzcJZ4Njul+NMnIzelU2m6cnTESwNRbwhxXSvt+R
 s0cJArP2Ucncj5+m0/uaZkLZnsFqoEk5OlwEfIR91DAp3Jt41/LMqQlISA==
X-Received: by 2002:a05:600c:524d:b0:4a3:59c9:a758 with SMTP id
 5b1f17b1804b1-4b963c89877mr54640285e9.32.1794198802836; 
 Sun, 08 Nov 2026 20:33:22 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90ee247e9sm113841365e9.6.2026.11.08.20.33.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 20:33:21 -0800 (PST)
Message-ID: <6af14d11.b6211bfc.62611.6f8a@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 09 Nov 2026 04:33:21 -0000
X-Mailman-Approved-At: Mon, 09 Nov 2026 07:09:12 +0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-08
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

Hello,

Autobuild statistics for 2026-11-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 15  |  0  | 20  |
  2026.05.x  |  2  |  8  |  0  | 10  |
  2026.08.x  |  3  |  4  |  0  |  7  |
    master   | 64  | 163 |  1  | 228 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 13
                 glibmm-2.76.0 | 5 
               tcf-agent-1.8.0 | 5 
          host-xfsprogs-6.19.0 | 4 
               libglib2-2.90.1 | 4 
                      mksh-59c | 4 
raw2rgbpnm-f28b903ca63b4c22... | 4 
                    attr-2.6.0 | 3 
                   babeld-1.14 | 3 
             batman-adv-2025.4 | 3 
    host-mender-artifact-4.4.2 | 3 
                   perl-5.42.3 | 3 
           uboot-tools-2026.07 | 3 
                  xxhash-0.8.4 | 3 
                  chawan-0.5.1 | 2 
              fftw-quad-3.3.10 | 2 
             fswebcam-20200725 | 2 
host-am335x-pru-package-5f3... | 2 
                host-odb-2.4.0 | 2 
              host-rust-1.99.1 | 2 
      host-uboot-tools-2026.07 | 2 
               libdvbcsa-1.1.0 | 2 
libfutils-c326ce0cc2a735438... | 2 
               linux-pam-1.7.2 | 2 
                  ndisc6-1.0.7 | 2 
                    opus-1.6.1 | 2 
            quickjs-2026-06-04 | 2 
                 rtl_433-25.12 | 2 
                 rtptools-1.22 | 2 
                 xenomai-3.2.5 | 2 
          aardvark-dns-v1.17.1 | 1 
               acpica-20260930 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
              containerd-2.3.7 | 1 
cpuburn-arm-ad7e646700d14b8... | 1 
                 cukinia-0.9.1 | 1 
                   dbus-1.16.2 | 1 
                  dhcpdump-1.9 | 1 
                 dovecot-2.4.5 | 1 
                drogon-v1.9.14 | 1 
            dt-utils-2023.11.0 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202608 | 1 
              erlang-26.2.5.21 | 1 
                  ffmpeg-9.0.2 | 1 
              findutils-4.10.0 | 1 
                      fio-3.42 | 1 
               freeipmi-1.6.18 | 1 
            gdk-pixbuf-2.42.12 | 1 
             glibmm2_66-2.66.8 | 1 
               gocryptfs-2.3.2 | 1 
                 haproxy-3.4.4 | 1 
host-amlogic-boot-fip-42d37... | 1 
               host-attr-2.6.0 | 1 
            host-binutils-2.47 | 1 
            host-ccache-4.14.1 | 1 
       host-gcc-initial-16.2.0 | 1 
                 host-gdb-15.2 | 1 
            host-mfgtools-0.02 | 1 
host-mxsldr-2793a657ab7a224... | 1 
         host-ti-cgt-pru-2.3.3 | 1 
                host-upx-4.2.1 | 1 
            igd2-for-linux-2.2 | 1 
              imx-vpu-5.4.39.3 | 1 
                 lcdproc-0.5.9 | 1 
               libcodec2-1.2.0 | 1 
                libcurl-8.23.0 | 1 
               libecoli-0.11.3 | 1 
              libgcrypt-1.12.3 | 1 
                 libical-4.0.7 | 1 
             librdkafka-2.16.0 | 1 
                libressl-4.3.4 | 1 
              libseccomp-2.6.1 | 1 
              libunistring-1.5 | 1 
               libunwind-1.8.3 | 1 
            libxkbcommon-1.9.2 | 1 
             libxmlsec1-1.3.13 | 1 
                   linux-7.3.3 | 1 
        ltp-testsuite-20260529 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
                 mesa3d-26.2.5 | 1 
                    ne10-1.2.1 | 1 
                  netsurf-3.10 | 1 
           oath-toolkit-2.6.14 | 1 
                    parted-3.8 | 1 
                         pcre2 | 1 
                  pdmenu-1.3.6 | 1 
python-pydevmem-600b5d1ef89... | 1 
               python3-3.14.10 | 1 
          refpolicy-2.20250923 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                    sslh-2.0.1 | 1 
                  swipl-10.0.2 | 1 
                 systemd-262.2 | 1 
           virglrenderer-1.3.0 | 1 
            vorbis-tools-1.4.3 | 1 
        wireless_tools-30.pre9 | 1 
            xorriso-1.5.4.pl02 | 1 
                    znc-1.10.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.17.1      | NOK | https://autobuild.buildroot.org/results/51aa093689c2655a18724f8343ea65d5deec6752 | ORPH
powerpc64le  |        acpica-20260930         | NOK | https://autobuild.buildroot.org/results/cb002336ff22488145f5be575ce527c4d9051364 | ORPH
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4c43e71725185c63cba831602385de86f0848004 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/de0c1e822788362aed515c282cff9ace67b5e185 |     
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/6f53cc0e328d5a5f5ef54ae851637a806ace6b1d |     
    i686     |          babeld-1.14           | NOK | https://autobuild.buildroot.org/results/b28e5679d92da887dae9d83c469df85721051bbf |     
  mips64el   |          babeld-1.14           | NOK | https://autobuild.buildroot.org/results/d2e09db1659ebdd0f409758d97f585c862dca684 |     
  aarch64    |          babeld-1.14           | NOK | https://autobuild.buildroot.org/results/dd4fa528bf4a0d822e50ba5bd658228c38146115 |     
   x86_64    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/b8b1e5f44eaafe9f12c0d540cb50757ddd7c5c1a |     
    i686     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/d86c0fa3d932117e5b71bac937cc2f5c04276053 |     
powerpc64le  |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/6744b997887f87ddb019aff99d778045ef357b6d |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1f4989080e779d7fbb215029eb6337b61b6fc988 |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/29766038fbefeb00ccc2a457ed0ff52c8f93d158 | ORPH
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/208aae6873848f23bedc345065b7fdc69d80fab1 |     
  aarch64    |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/25627d35f3515bab652e7c40c28edfc4098c22d3 |     
 aarch64_be  |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/99730e24c1ed21164a0ad998766f3d502e60480e |     
    i686     |        containerd-2.3.7        | NOK | https://autobuild.buildroot.org/results/f198a3c261b84496ae139ae48387d750bb5fb9e3 |     
  aarch64    | cpuburn-arm-ad7e646700d14b8... | NOK | https://autobuild.buildroot.org/results/f104f40d09be509c393183b11172acf47e39fd5e |     
  mips64el   |         cukinia-0.9.1          | NOK | https://autobuild.buildroot.org/results/3b2d9be52526d4efee3b15cdf2dfeafb2b8ceb39 | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/49baa70067738ece2ef4afac90665abb2c08cf59 | ORPH
   x86_64    |          dhcpdump-1.9          | NOK | https://autobuild.buildroot.org/results/fb2437c189669fdb92695e5711387e027020f70d | ORPH
  mips64el   |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/37ea5d0b20741cc84d6659f36bbdac9c1cad774a |     
    arm      |         drogon-v1.9.14         | NOK | https://autobuild.buildroot.org/results/64d305fee6dca0ef5e0f87755d81f7ed6ddb4d8b |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/e4d0038a3b2227583d8ece0b837cf86b70f7939e |     
    arm      |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/030798eba5e3c4a51a2498628c5b0e9f57b2d717 | ORPH
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/a218c71410bdca872f59a7d18bbd04ce25275c87 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/0b583a5ac7d095522945c49d04b7585a3194763f |     
  aarch64    |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/1c0ee31a4163658877a55450c9cd2636c474b7a3 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/22bc7b146da9ef653b302e0c1df857b784323f83 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/713e75fe0521bf53263c3a5d0ae52eb6779a694b | ORPH
powerpc64le  |        findutils-4.10.0        | NOK | https://autobuild.buildroot.org/results/fb4ddb1895daf5ebfedaaab0438f3bb3d80db5aa | ORPH
  mips64el   |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/35dae6a0cd1283948cce55fe15fd4e7530c8e704 |     
 microblaze  |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/7c3d45e9ddba67aa5ff3b41e9fd753cdb4917da4 |     
  riscv64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/01a3440cee8e1b53ad36aa08b09f49dbff4bb2e1 |     
  aarch64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/821222cd66a74002f9e315cc950367b7b55a8fff |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1b741d1b2e90072e06f83f50ef1e36541edb2abb | ORPH
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/fc3f895ed9b6a808a5f6752637e021d70ecfad81 |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/c71fb9ab5cfd4241eed59ccd1a09e12a4206a0d7 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/63a132dc971918bcf75e143618a3925f227d1a0d |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/ffd1366b424d4df8bcfa7faa475d3dc26d07a665 |     
  riscv64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/75553ea2569883d3f698331723698587b326399f |     
  mips64el   |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/16ed6aa4539e4a64fef1cd2c424d70959d579b03 |     
   x86_64    |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/87e17f50eb9c8a63d518a8c7fc5d4ffe67c7e010 |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/567c213d2636e7f61546863fb732559866bf16fd |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4e83882b529170b410bf6164fb064df5e09eaccd |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/852de0d1a061408f971bfab12f8f9006f7860adc |     
powerpc64le  | host-amlogic-boot-fip-42d37... | NOK | https://autobuild.buildroot.org/results/706edfa84b2a3a656975e1e405ba24285f68ccb0 |     
    arm      |        host-attr-2.6.0         | NOK | https://autobuild.buildroot.org/results/402f6163f257786a50bf9180eaa0e4a8d143fe5a |     
  mips64el   |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/08923527c33affb0453cc374fe29fe139004423c |     
  mips64el   |       host-ccache-4.14.1       | NOK | https://autobuild.buildroot.org/results/e4b7dbdda8291bbcab08a79242f127ddf56fe629 |     
   x86_64    |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/17b34ec750c8f7f1b7e6f3ab2c0d503bc6b9b9c8 |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/546b3caa8d8b19a039afe701061001baee9c5d00 | ORPH
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/4afbe78ecc0f9ca7503d88a51d64fa59603d411e |     
   x86_64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/744b7975d2427b9030eca421a4b453a1b1511362 |     
  aarch64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/7922ad553a2d51b3d68daa8514033f9e114a10cd |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/79cb47625d2049d778ff1178a978da77d91cc303 |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/191fd868a7140189f973975200a3aa343a5c4a9f |     
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/93260f6cf8804a09f00b421f0f01a2a2bacd07ad | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2b3c6749b6fda1dfce129c1905d2dc578641841d | ORPH
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/c9014bc2364baf98607ba9cc63e4477eef6daa62 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/62beead73ca8487ce3052623c4ff394df2c09873 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/72d9b0ca948dfe6bb09947811d692cd1c671f20c |     
  aarch64    |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/7904b347da6b1d9f2502cafeee0bfc9d3071a2a0 | ORPH
  riscv64    |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/386cb14da77c7bef2e5d28a04e2be440197de886 | ORPH
    i686     |         host-upx-4.2.1         | NOK | https://autobuild.buildroot.org/results/09bc72d9993630b4f3f44bfcf300d0ee2b2dbbfc |     
  riscv64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/aa6d58315d803f769066d948df83ea91fb57bdec | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/d76e66075a9fae55ae84b7bd3d7a01594ade43aa | ORPH
  riscv64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/d576258a433d51aaa0889e01ca20e2897c9c3997 | ORPH
  mips64el   |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/b8594e47308e8248f898d623bfd2d3db9671032f | ORPH
    or1k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6c4e6ecc776873d316b530beb90ec0c0af674223 |     
    arm      |        imx-vpu-5.4.39.3        | NOK | https://autobuild.buildroot.org/results/62bcd9b1db3b8c7cb523d58375664cac740a0fe7 |     
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/b3a86e3627123d847885c1c9f77225c149e832bf | ORPH
   x86_64    |        libcodec2-1.2.0         | NOK | https://autobuild.buildroot.org/results/5c966d2d245937ab0f7a7498329f7baaee58843b |     
loongarch64  |         libcurl-8.23.0         | NOK | https://autobuild.buildroot.org/results/558c08d552920e45628254bdc029518120a35ae1 |     
powerpc64le  |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/85e22a53dd1da63fea5e3d2947b99a9a0454bce7 |     
   s390x     |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/566675859964980bd110a932da0f7b5c4a181913 |     
    hppa     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/7ef4d5fe1d21faf7fcf16198e627da86fa2fc5b2 |     
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/93904cc39fd25bfe06034a2ca2d01d2126590f41 |     
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/1ca24613fd5b6fa7d82c8abef0b614b6c55e5852 |     
    arm      |        libgcrypt-1.12.3        | NOK | https://autobuild.buildroot.org/results/d81acbc91230b091db83a3a931650b2446eb6a9e | ORPH
  sparc64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/2ac262a2f62abd794e426e211b7326330a6bb459 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/081e68b70c51d8662edb1db53083094f844280d4 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/7f2cf505a5b15dfee3f9b2ddef8025dadfb6891d |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/7bc49d3540ea90868623d3b2c6b0bf653541b6dc |     
    i686     |         libical-4.0.7          | NOK | https://autobuild.buildroot.org/results/871b275db968b4ad6d40b810eac6a086de71dadd |     
  aarch64    |       librdkafka-2.16.0        | NOK | https://autobuild.buildroot.org/results/86738961d2c16b5ce13895ee3e344c332b6085a5 |     
    arm      |         libressl-4.3.4         | NOK | https://autobuild.buildroot.org/results/83dce58c1f3c0de30bd79a9fb30a2bd5a91d8261 | ORPH
    i686     |        libseccomp-2.6.1        | NOK | https://autobuild.buildroot.org/results/a35d0eec490ac1cbf2ea4df94fee98e27e56a138 | ORPH
powerpc64le  |        libunistring-1.5        | NOK | https://autobuild.buildroot.org/results/6ac501fc9840e25bba78df04b26f93341722155a |     
   mipsel    |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/fabaffac6553fe90f9f83a8a499d8f839e6bfd6f | ORPH
    arm      |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/a64abbd9d264c5227d283e8b66f00a75d31229f6 |     
powerpc64le  |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/f6a0df2b69e11e987045c1ced4331066ac8560f4 |     
powerpc64le  |          linux-7.3.3           | NOK | https://autobuild.buildroot.org/results/d80c573c4309b4aad908d9f48d87e46305b73aa8 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e9fac2e7a3fc9243d5284cd123d62e4ccf33af3c | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8aa5d6a531129ce21556799c6eca4408ebe7cecd | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/767c64691e4d980a33d1a76ec6ae6a89d4e05874 |     
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/0cde06296a249af945bfb9e890ff7cfe81ed54ef |     
  aarch64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/c397d2eb8ec8020803e0473da21710cb32b3080a | ORPH
   x86_64    |         mesa3d-26.2.5          | NOK | https://autobuild.buildroot.org/results/2e5b94fd65bcbe93a7a7c77ad8863a8d43751000 |     
  mips64el   |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/0e3e7aa6c65773feb14985418d0ef01c23f33f6e |     
  mips64el   |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/526b3e9849e8ae5f67b7732de79cb4a53e443936 |     
   x86_64    |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/66d240c477f763eddfbacc5295f2f2ce2498c61f |     
    arm      |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/2f7f6d0ef179e5803cc30adb0f7de7aa3cd23645 |     
powerpc64le  |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/0ae34af8d1501af212bc12e27a0db1ea0145f33c | ORPH
powerpc64le  |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/ba191ada57faecfa6d3620dac58ddde58e3d104f | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/6dcd599c691c7d7694ca2ee952d8376648f18cf4 |     
   x86_64    |          netsurf-3.10          | NOK | https://autobuild.buildroot.org/results/83652f8ca4a07a55d7d94ba3566e57cb85254372 | ORPH
    arm      |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/2cb8b4a60b3534fa085bd9a548e0a6ccc3f8cbc5 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/b46df2af5e21249936897b514367715ef8684aac |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/0e73e2259a56deda4e1001870a6eb1cea60c57e8 |     
 powerpc64   |           parted-3.8           | NOK | https://autobuild.buildroot.org/results/7c2dfdc297b1a8ea8b6a5e3db0d3dc9d6b57b9fc |     
  mips64el   |             pcre2              | TIM | https://autobuild.buildroot.org/results/fb892ff9232e7690520f448b35c9229307201b7c |     
   x86_64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/42f9351808a9acb6f9cb28477f9053560dbc2861 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/29f4fb9bcec1865fc92ae3a905f01237b7d9a76d |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/869d205439991042621427ea7421c1aaac679ac2 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/fc436e714947ca812eff2dc71068947d9ad9116e |     
powerpc64le  | python-pydevmem-600b5d1ef89... | NOK | https://autobuild.buildroot.org/results/f6c3cedbcd3af00890dc710fdfd8e624fb46ea67 |     
   x86_64    |        python3-3.14.10         | NOK | https://autobuild.buildroot.org/results/1294267ff157df698f775fc84d16b28a1a26204b |     
  aarch64    |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/1a2fedff5af6868cb83b3650bfcd98dd0267a005 |     
  aarch64    |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/23316e1e5047e2f0ade849e7fb8b8d6c2a3ca158 |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/bf46a849e0370a525633046fcb2ef4147c208086 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/14aea4ac522cf7b2ef614b15432e653b811fa2b8 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/797f7f03c20fecc871d68d7a34b0c47e330e8a32 |     
  mips64el   | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/a061533d33614556166a2c85b218b0787c65112f |     
   x86_64    |      refpolicy-2.20250923      | NOK | https://autobuild.buildroot.org/results/184149a3a79f691ad3ddfbdc587077a75ae4af62 |     
    mips     |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/f89797fedd4a05a4172d16a5b3eda4511d96a17c |     
  mips64el   |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/ee873f05380b46c9dab7f6902362a451a98614e9 |     
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b5561664d0d0f8d0610904267551ff5d141650fb | ORPH
powerpc64le  |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/a613a2d3f188a003839b237503b8bb925f866301 | ORPH
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/32e32b65ae33c6e253021100d9ab7887df77f698 |     
   x86_64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/bd37de7666d1fbdfeeda896503e8ac1b97121aee | ORPH
  aarch64    |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/03bd359318817b131bf4b0faa1fe1c28ac4803ed |     
powerpc64le  |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/3b1a29357ac99454ca8961f969b33a56aad897ec |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/068a11816ddf13f5134357ec934c7d74a6ddffeb |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/704da92c994d9c7351027b08dc33e33b22479897 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a9f403d2367eac97901c1484472724a52e672385 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/720465b57e88450228e9754447c2841426df5446 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7b02760782fe86d1ec24d79b1fc511ee1095e075 |     
  mips64el   |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/4279abe34ae97de59bfbdbc94a44fca238e4c3d8 | ORPH
  mips64el   |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/9c9f8d9b4d82bc762d09c84cd580d8d7220f2aaf | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/209bb35f712615f6cdbf2c579059952a8579a46c | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/e80f6256a859fed93d149f62573644e79a84a712 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/704906ee2e2d1b61fd88666ad426be8875c33863 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c93a9a541a14baf500b654360e71318bcaf0e5c9 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b2690e9438e4a1fa0ac02efcf69a09d65d3c2236 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/938d282b3165262cb12ebf4b5c96add8a289982a |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/4e082ca6f62003ad5af67399c94014aa1e5af53d |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4bc060a589148abb3db1d87f595571855f3f5ad7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d4371a8b7fa8e59c1e992d1855a5736644f4e887 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/265b897677898725b67c5321d71a3daba3c9974f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f185117073e9d6819d89292e84b8a3940b69efa9 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/ceb262a5feb482545e781d3d9f37b653bad66e77 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/feab8461992fcfa04890b7fd513abccff80d4fe6 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f05fa46f32ec4ffba42a82e058e76e93b549aa16 |     
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/239e6a668b20ebae8e6bb2ca3bb1a067a45f6e57 |     
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/61731af57329333db078a157ad964e871c656146 | ORPH
  aarch64    |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/4e206f65a8906467b2913c6c502c96023ec0b516 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/4ec08c1111110121789f9bbd1c239b6509e38625 |     
  aarch64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/29590bc3af033808b0267dfd107d440e72ed0480 |     
powerpc64le  |       xorriso-1.5.4.pl02       | NOK | https://autobuild.buildroot.org/results/5ded6eef4760758eeb81969a1e6c7beba8cbdeb2 |     
    arm      |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/cd1bc314b69bf45b9d5fb0b3173d025f8dcb370c | ORPH
    arm      |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/eafd69f85cc9c539f80460c5bbdee70b523073b4 | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/8a75200b2ec2229f1b44bf4de771a0cf596d8cf3 | ORPH
powerpc64le  |           znc-1.10.3           | NOK | https://autobuild.buildroot.org/results/9c1b95fe6a89dafa547673f56af06c2c42f34c7e |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                  dpdk-25.11.2 | 1 
               libecoli-0.11.3 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                openntpd-6.8p1 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/65f8ef4766a6636547ab0a3f45dd994da793e177 |     
  aarch64    |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/ee73fea83cfecb6477f4baac9828073177b78e11 |     
  mips64el   | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/9158f6b1bc8d651511fd5d510ecccbc364818bfe | ORPH
powerpc64le  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/7eb56834e1dcb51d17f797dd2b98ce66a04ce544 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 4 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                 libavif-1.4.1 | 1 
                   linux-tools | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/a13849fac5c580a79fdfd78dece9ede0c9cc6356 | ORPH
  aarch64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/3448ffc4b1a77fe1563fd5ae6dddf2072a7eae14 |     
   x86_64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/c26cec359f737f5eeabe487fabea757e0eae87a7 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/d661911101346a69bb8b61e44bcf70b9d378739d |     
  mips64el   |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/49c45d7fdc3531e5d420a39a0d28d769f64ed369 |     
    i686     |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/62657de07dd612208ecd8762f76cd0a54edcb913 |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/902fca1847b107411361e2febbc037c27c09d001 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/4bb982766917737cbe08c3ef238519f3648401a0 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             fluent-bit-3.2.10 | 2 
        host-python-lxml-5.3.0 | 2 
                       unknown | 2 
              asterisk-22.10.1 | 1 
  gobject-introspection-1.82.0 | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
            host-skopeo-1.18.0 | 1 
      host-uboot-tools-2021.07 | 1 
     libphidget-2.1.9.20190409 | 1 
                 logsurfer-1.8 | 1 
                   perl-5.40.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-22.10.1        | NOK | https://autobuild.buildroot.org/results/09eb65e182f9aa6ceef53c6d99b4890da916a583 |     
   x86_64    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/8ed093bdc82698430219914cfac50e6c18462ecf |     
    i686     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/7c5678fac30fed71df9c606b7416f014dbcc5d42 |     
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/38155dc272bbcc6cff8f13c94500b2ddb723e904 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/3e7684870d06a8e9a19548f7eed46c1ea04c5175 |     
    arm      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/8811feb9465cbfbd5a9956b825f373c033947da7 |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/eb14db0838cc92eaed6a2a6dd3e5d712e9fc07f8 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ec6253f322ab48eb50b634f13fbbc564501e2980 |     
   x86_64    |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/71610b07d1fbae9c88eab5b4c85c03462f4fd96c |     
powerpc64le  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/2906b57be609d7049b0ed15fe2e865509e119393 | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c39b7231a86f3811aa94f436784b6fc0d73d9235 |     
   mipsel    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9b007d649291cc3c4b65625260e75bb73d74de80 |     
  mips64el   |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/775a7635d805f80b43663fcdcee083e7af31ecda |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/42fabe79464cbbacb8e5c1d1ca522d379f66e5e9 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b7fd8c72b20828eceb73c7f86231b1db8fead168 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.17.1      | 2.1.0        | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.7        | ORPH
                      adsp-ldr |  DISTRO  | https://release-monitoring.org/project/388235 | 1.0.1        | 1.0.3        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 51.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.7.2        | 5.0.2        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2026.4       | ORPH
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 13.0         | 14.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.8        | 5.0.2        |     
                      apr-util |  DISTRO  | https://release-monitoring.org/project/000096 | 1.6.5        | 1.6.6        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.4        | ORPH
                         asn1c |  DISTRO  | https://release-monitoring.org/project/016926 | 0.9.28       | 0.9.29       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.11.0      | 24.0.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.58.2       | 2.62.1       |     
                         atftp |  DISTRO  | https://release-monitoring.org/project/015219 | 0.8.0        | 0.8.1        |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.3       | 2.36.4       |     
                     atkmm2_28 |  DISTRO  | https://release-monitoring.org/project/373360 | 2.28.4       | 2.28.5       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.5        | 4.2.1        | ORPH
                        augeas |  DISTRO  | https://release-monitoring.org/project/007017 | 1.14.1       | 1.15.0       | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.20         | ORPH
                  b43-fwcutter |  DISTRO  | https://release-monitoring.org/project/000152 | 019          | 021          |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.17.0       | 2.18.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2026.4       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2025.4       | 2026.4       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.2.0        | 2.2.4        |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/010587 | 1.13.0       | 1.14.0       |     
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.17      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.46.1       | 2.47         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.4.0        |     
                       bitwise |  DISTRO  | https://release-monitoring.org/project/111150 | 0.50         | 0.70         |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.8.3        | 1.8.7        |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/021324 | 4.3.1        | 5.0.0        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.87         | 5.88         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.87         | 5.88         |     
                          bmon |  DISTRO  | https://release-monitoring.org/project/000209 | 4.0          | 5.0          | ORPH
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 8.2.11       | 8.2.15       |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.92.0       |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.11.1       | 3.14.1       | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.8.1        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.27.0       | 0.27.1       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.8          | 6.9.1        |     
                         broot |  DISTRO  | https://release-monitoring.org/project/141357 | 1.60.1       | 1.62.0       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 7.3          | ORPH
                    bubblewrap |  DISTRO  | https://release-monitoring.org/project/010937 | 0.13.0       | 0.13.1       |     
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.14.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.14       | 0.6.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.3        | 2.5.2        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/000247 | 1.18.4       | 1.18.6       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.1       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.5       | 1.14.6       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.311        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.5.0        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/007680 | 3.16.0       | 3.16.1       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/000257 | 4.14.1       | 4.14.3       |     
                        cdrkit |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     |     
                        chawan |  DISTRO  | https://release-monitoring.org/project/392954 | 0.5.1        | 0.5.2        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                       chicken |  DISTRO  | https://release-monitoring.org/project/000280 | 5.4.0        | 6.1.0        |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 7.8          | 7.9          |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.6.1        | 2.7.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/010503 | 3.0.25.02.14 | 3.1.26.09.26 |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2026.10.4    | 2026.10.7    |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.5        | 3.0.5        |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/000306 | 4.4.4        | 4.4.5        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.7.1        | 1.9.1        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.20.1     | 4.3.20.3     |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.2.1        |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.8        | 1.4.9        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.3.7        | 2.4.2        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.48.0       | 0.65.0       |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.24         | 1.30.1       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 3.5.0        | 5.1.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.27       | 3.0.29       |     
                        davici |  DISTRO  | https://release-monitoring.org/project/021340 | 1.4          | 1.7          | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.2        |     
                     dbus-glib |  DISTRO  | https://release-monitoring.org/project/001979 | 0.114        | 0.116        | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.5.0        | 1.5.1        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.24         | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.27.2       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.29         | ORPH
                      dhcpdump |  DISTRO  | https://release-monitoring.org/project/021415 | 1.9          | 2.00         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20251001 | 1.3-20260721 | ORPH
                     ding-libs |  DISTRO  | https://release-monitoring.org/project/013710 | 0.6.2        | 0.7.0        |     
         distribution-registry |  DISTRO  | https://release-monitoring.org/project/378976 | v3.1.1       | 3.1.2        |     
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0.1       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.38.2       | ORPH
                      dos2unix |  DISTRO  | https://release-monitoring.org/project/000453 | 7.5.5        | 7.5.7        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/000457 | 1.16.1       | 1.18.0       | ORPH
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 25.11.2      | 26.07        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/389396 | 9.34.0       | 9.35.0       |     
                      drm-info |  DISTRO  | https://release-monitoring.org/project/299264 | 2.9.0        | 2.10.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/016911 | 1.7.2        | 1.8.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 10.2         | 11.1         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.2.3        | 1.2.7        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.9.0        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.7        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 26.09.1      |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.195        | 0.197        | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.21       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.28.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.2.5.21    | 29.1.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.27       |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.10      | 1.11.13      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.31       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.34       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 1.0.13       |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.61       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.34       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.26       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.29       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.23       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.16       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.10       | 1.9.4        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 4.6.0        | 4.7.0        |     
                         eudev |  DISTRO  | https://release-monitoring.org/project/013466 | 3.2.15       | 3.3.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.10.0.0     |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.9        | 1.4.3        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.23.3       | 0.23.5       |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/014689 | 1.16.0       | 1.17.0       |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.2       | 2.11.4       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.2       | 2.1.4        | ORPH
                      faketime |  DISTRO  | https://release-monitoring.org/project/021348 | 0.9.12       | 0.9.13       | ORPH
                        fbterm |  DISTRO  | https://release-monitoring.org/project/008331 | 1.7.0        | 1.8          | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.3.2        | 3.3.3        | ORPH
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 10.3.0       | 10.5.2       |     
                       fdk-aac |  DISTRO  | https://release-monitoring.org/project/016208 | 2.0.3        | 3.0.0        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                          ficl |  DISTRO  | https://release-monitoring.org/project/021430 | 3.065        | 3065         |     
                     findutils |  DISTRO  | https://release-monitoring.org/project/000812 | 4.10.0       | 4.11.0       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.42         | 3.43         |     
                  firmware-imx |  GUESS   | https://release-monitoring.org/project/390526 | 8.30         | 8.31         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.28.10      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/021434 | 1.14         | 1.15         |     
                      flashrom |  DISTRO  | https://release-monitoring.org/project/010202 | 1.7.0        | 1.8.0        |     
                        flatcc |  DISTRO  | https://release-monitoring.org/project/021350 | 0.6.1        | 0.6.4        |     
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.5        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 5.1.2        | 5.1.5        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.5.7        | 2.6.2        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/011526 | 12.2.0       | 12.2.1       |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 7.2.0        | 7.3.1        |     
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.17.1       | 2.18.3       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.26.0       | 1.28.0       | ORPH
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.4          | 5.5          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.18       | 1.6.20       |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.8       | 3.33.0       | ORPH
                      freetype |  DISTRO  | https://release-monitoring.org/project/000854 | 2.14.3       | 2.15.0       |     
                         ftxui |  DISTRO  | https://release-monitoring.org/project/373193 | 6.1.9        | 7.0.3        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.18         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.17.1       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.1.9        |     
                     fwupd-efi |  DISTRO  | https://release-monitoring.org/project/326081 | 1.8          | 1.9          |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 4.4.0.1      | 4.4.1        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.11.4       | 3.13.3       |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.44.8       | ORPH
                     genext2fs |  DISTRO  | https://release-monitoring.org/project/021440 | 1.6.2        | 1.6.3        |     
                     gengetopt |  DISTRO  | https://release-monitoring.org/project/000892 | 2.23         | 2.23.1       |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 1.0          | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/008735 | 2.2.2        | 2.3.1        |     
                           git |  DISTRO  | https://release-monitoring.org/project/005350 | 2.54.0       | 2.56.0       |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/017093 | 0.7.0        | 0.8.0        | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 19.5.3       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.90.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.90.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.8       | 2.66.10      |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.1        | 1.0.3        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.3          | 0.3.1        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/001216 | 6.0.4        | 6.0.6        |     
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.8.1        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.46       | 1.3.49       |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.16.2       | 0.20.0       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.84.1       | 1.85.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 51.0         |     
                         gssdp |  DISTRO  | https://release-monitoring.org/project/001262 | 1.6.4        | 1.6.6        |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.13      | 1.28.9       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.10       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.13      | 1.28.9       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.13      | 1.28.9       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.13      | 1.28.9       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.13      | 1.28.9       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.13      | 1.28.9       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.13      | 1.28.9       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.13      | 1.28.9       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.9.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.13      | 1.26.11      | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.2       | 0.16.0       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.13      | 1.28.9       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.13      | 1.28.9       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.10      | 3.24.11      |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 5.18.0       | 5.22.0       |     
                  gumbo-parser |  DISTRO  | https://release-monitoring.org/project/214990 | 0.13.2       | 0.14.1       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.9        | 1.6.10       |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.4       | 0.14.5       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.2       | 0.12.4       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.57.2       | 1.62.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 3.4.4        | 3.4.7        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/001299 | 15.0.0       | 15.1.0       |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/011695 | 1.9.21       | 1.9.27       |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.3.0        | 1.4.0        |     
                       hiredis |  DISTRO  | https://release-monitoring.org/project/001318 | 1.3.0        | 1.5.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.26.6       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/001332 | 3.5.1        | 3.5.3        |     
                      httpdate |  GUESS   | https://release-monitoring.org/project/138170 | 1.0.1        | 1.0.3        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/005387 | 0.412        | 0.413        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.12.2       | 2.15.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.61.0       | 3.0.0.1      |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 78.2         | 79.1         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.44       | 0.8.45+nmu1  | ORPH
                 ima-evm-utils |  DISTRO  | https://release-monitoring.org/project/019247 | 1.6.2        | 1.7          |     
                          inih |  DISTRO  | https://release-monitoring.org/project/011600 | 62           | 63           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.26.275     | ORPH
                        iodine |  DISTRO  | https://release-monitoring.org/project/001386 | 0.8.0        | 0.9.0        | ORPH
                        ipcalc |  DISTRO  | https://release-monitoring.org/project/007555 | 1.0.3        | 1.2.0        | ORPH
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.3        | ORPH
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.27         | 0.28         | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.42.1       | 1.43.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.4.1        | 1.4.3        |     
                      jemalloc |  DISTRO  | https://release-monitoring.org/project/001441 | 5.3.1        | 5.4.0        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.3        | 3.7.0        | ORPH
                           joe |  DISTRO  | https://release-monitoring.org/project/001467 | 4.6          | 4.8          | ORPH
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 3.2.0        | 3.2.1        |     
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.4.3        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.31.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.31.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.31.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.31.0       |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.7        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.2        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.15.1       | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/012523 | 3.100        | 4.0          |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/009815 | 2.19.1       | 2.20         |     
                           lft |  DISTRO  | https://release-monitoring.org/project/021863 | 3.91         | 4.03         | ORPH
                        libaec |  DISTRO  | https://release-monitoring.org/project/015539 | 1.1.7        | 1.1.8        |     
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.8        | 5.0.2        |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/001558 | 3.8.10       | 3.8.11       |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.6.2        | 1.8.0        |     
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.14.0       | 1.15.0       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        | ORPH
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 1.0.0        | 1.2.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/006308 | 1.18.0       | 1.18.2       | ORPH
                       libebml |  DISTRO  | https://release-monitoring.org/project/007879 | 1.4.5        | 1.4.7        |     
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.11.3       | 0.11.8       |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.5       | 1.14.0       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2609.0     |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/001623 | 1.12.3       | 1.12.4       | ORPH
                       libgeos |  DISTRO  | https://release-monitoring.org/project/013493 | 3.14.1       | 3.15.0       |     
                       libglfw |  DISTRO  | https://release-monitoring.org/project/001180 | 3.4          | 3.5.1        | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.24.3       | 2.2.0        | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.3.2        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/012587 | 1.0.23       | 1.0.24       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.51      | 3.24.52      |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.51       | 0.5.53       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/010656 | 1.19         | 1.19.1       | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.43         | 1.44         |     
                   libiec61850 |  DISTRO  | https://release-monitoring.org/project/141617 | 1.6.1        | 1.6.2.1      |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/015689 | 0.26         | 1.0.0        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.31.3       | 1.32.0       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.3        | 0.2.6        |     
                        libjxl |  DISTRO  | https://release-monitoring.org/project/232764 | 0.11.2       | 0.12.0       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/016828 | 1.5.0        | 1.5.1        |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.11       | 2.1.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.49         | 250          |     
                    liblogging |  DISTRO  | https://release-monitoring.org/project/001654 | 1.0.6        | 1.0.8        | ORPH
                        libmad |  DISTRO  | https://release-monitoring.org/project/021487 | 0.15.1b      | 0.16.5       | ORPH
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/001657 | 1.7.1        | 1.7.2        |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.14.1       |     
                         libmd |  DISTRO  | https://release-monitoring.org/project/015525 | 1.1.0        | 1.3.0        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.14.4       |     
                     libmodbus |  DISTRO  | https://release-monitoring.org/project/009728 | 3.1.12       | 3.2.0        |     
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/068638 | 3.0.16       | 3.0.17       |     
                  libmpdclient |  DISTRO  | https://release-monitoring.org/project/021364 | 2.23         | 2.27         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.10       | 4.6.4        |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.1        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 7.0.1        | 8.0.0        | ORPH
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.24       |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/007953 | 4.39         | 4.40         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/002503 | 3.132        | 3.133        |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.6.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.6.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.6.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.6.0        | ORPH
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.6.0        | 2.7.0        |     
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.10       |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/002566 | 3.6.5        | 4.1.0        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/015135 | 5.3.1        | 5.3.2        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2026.6       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.20       | 0.4.21       | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.2.1        | ORPH
                       libpfm4 |  DISTRO  | https://release-monitoring.org/project/021491 | 4.13.0       | 4.14.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.7.0        | 2.8.1        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.10.7       | 8.0.2        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                         libqb |  DISTRO  | https://release-monitoring.org/project/009399 | 2.0.8        | 2.0.10       |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.4       | 0.22.3       |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/001713 | 1.11.0       | 1.13.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 4.3.4        | 4.4.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.63.4       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.7        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.8.2     | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.8.1        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.1       | 2.12.2       |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.35       | 0.7.41       |     
                      libsoup3 |  DISTRO  | https://release-monitoring.org/project/011483 | 3.7.3        | 3.8.1        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.8.2        | 3.8.3        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/018547 | 2.8.0        | 2.8.1        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/001729 | 0.12.1       | 0.12.2       | ORPH
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.4        | 2.5.0        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.5.4        | 2.6.2        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.15.3       | 0.16.27      | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 2.1.1        | 2.1.2        |     
                   libubootenv |  DISTRO  | https://release-monitoring.org/project/020618 | 0.3.7        | 0.3.8        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.10.0       |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.3.3        | 1.5.2        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.25      | 22.2.1       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 1.0.3        | 1.0.4        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.15.6       | 0.15.7       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.12         | 2.15         |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.18.0       | 8.18.7       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 12.9.0       |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.16.0       | 1.17.0       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.9.2        | 1.13.2       |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/003531 | 2.47         | 2.59         |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.6.1        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.13.6       | 6.4.13       |     
                   libyang-cpp |  DISTRO  | https://release-monitoring.org/project/388240 | 4            | 12           |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.10.2       |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.10.2       |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.11.4       | 1.12.1       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.28.0       |     
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.7.2        | 1.7.3        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.8.3        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2025.10.13   | 2026.11.08   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.22       | 1.0.23       | ORPH
                          lmdb |  DISTRO  | https://release-monitoring.org/project/006974 | 0.9.35       | 1.0.3        | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.2.0.1      | ORPH
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/021499 | 1.1.4        | 1.1.6        |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.7.0        | 1.8.0        |     
                        log4qt |  DISTRO  | https://release-monitoring.org/project/180409 | 1.5.1        | 2.0.1        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/001842 | 0.651        | 0.660        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/001844 | 4.99.6       | 4.99.7       | ORPH
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/001845 | 0.32         | 0.33         |     
                 ltp-testsuite |  DISTRO  | https://release-monitoring.org/project/021502 | 20260529     | 20260930     |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.5.1        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.18.0       |     
                      lua-zlib |  GUESS   | https://release-monitoring.org/project/380938 | 1.3-0        | 1.4          |     
                      luaposix |  DISTRO  | https://release-monitoring.org/project/011729 | 37.0         | 38           |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/001856 | 3.12.2       | 3.13.0       |     
                      luksmeta |  DISTRO  | https://release-monitoring.org/project/011763 | 10           | 11           |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.3        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.53.0-0     | 1.53.0-1     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.44      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 6.0.6        | 7.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/001863 | 2.9.2        | 2.9.3        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/001865 | 1.10.0       | 1.11.0       | ORPH
                         lzlib |  DISTRO  | https://release-monitoring.org/project/021513 | 0.4.1.53-4   | 0.4.3        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 26.01        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.8        | 1.8.0        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.18     | 13.1.1       |     
              matchbox-desktop |  DISTRO  | https://release-monitoring.org/project/235369 | 0.9.1        | 2.0          | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.30       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 3.6.7        | 4.2.0        |     
                        mbpoll |  DISTRO  | https://release-monitoring.org/project/368619 | 1.5.2        | 1.5.4        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20261024     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 210          | 213          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.8.2      |     
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 8.00         | 9.00         |     
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 26.2.5       | 26.2.6       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 26.2.5       | 26.2.6       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
                            mg |  DISTRO  | https://release-monitoring.org/project/131079 | 4.4          | 4.6          |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2026.04.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.28.0       | 1.29.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.18.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.2.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2026.09      |     
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.34.2       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.12       | 3.0.17       |     
                       mokutil |  DISTRO  | https://release-monitoring.org/project/246006 | 0.7.2        | 0.7.3        |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.40.0       | 0.42.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 7.0.0        | 9.0.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/002024 | 1.8.32       | 1.8.34       |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/002028 | 4.0.49       | 4.0.50       | ORPH
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
                      multicat |  DISTRO  | https://release-monitoring.org/project/021734 | 2.3          | 2.4          | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.15.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.28.6       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.4.1        | 2.4.3        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.6        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.45         | 1.53         |     
                          nano |  DISTRO  | https://release-monitoring.org/project/002046 | 9.2          | 9.3          | ORPH
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2.2        | 1.3.0        |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/002048 | 2.16.03      | 3.02         | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.26.1       | 3.27.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.12.0       |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/002055 | 0.52         | 0.54         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.6-20251231 | 6.6-20261107 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.9        | ORPH
                         neard |  DISTRO  | https://release-monitoring.org/project/021866 | 0.19         | 0.20         |     
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.4.2        |     
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.17.1      | 2.1.0        | ORPH
                       netbird |  GUESS   | https://release-monitoring.org/project/383363 | 0.81.5       | 0.82.0       |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.234        | 1.239        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.37.1       | 2.12.3       |     
                       nethogs |  DISTRO  | https://release-monitoring.org/project/002065 | 0.8.8        | 0.9.0        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.14       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.5        | 2.8.21       |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         | ORPH
                       nettest |  DISTRO  | https://release-monitoring.org/project/392517 | 2.1.3        | 2.2.0        |     
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.10.2       | 4.0          | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.5       |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.70.0       | 1.71.0       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 28           | ORPH
                           nim |  DISTRO  | https://release-monitoring.org/project/016496 | 2.2.12       | 2.4.0        |     
                          nmap |  DISTRO  | https://release-monitoring.org/project/002096 | 7.992        | 7.993        | ORPH
                           nnn |  DISTRO  | https://release-monitoring.org/project/017080 | 5.1          | 5.3          |     
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.23.4      | 26.13.0      |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.23.4      | 26.13.0      |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.3.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                       ntfs-3g |  DISTRO  | https://release-monitoring.org/project/002504 | 2026.7.7     | 2026.9.28    | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.108.0      | 0.116.1      | ORPH
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 620.70.06    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 580.95.05    | 620.70.06    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 2.15         | 3.2          | ORPH
                  oath-toolkit |  DISTRO  | https://release-monitoring.org/project/002515 | 2.6.14       | 2.6.15       |     
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 11.1.0       | 11.3.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.6.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.18         | 2.19         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v14.4.1      | 14.6.3       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.13       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1.1        | 1.2.0        |     
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.24.3       | 1.25.2       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2025.07.22   | 2026.05.29   |     
                opencl-headers |  DISTRO  | https://release-monitoring.org/project/223257 | 2025.07.22   | 2026.05.29   |     
             opencl-icd-loader |  DISTRO  | https://release-monitoring.org/project/378666 | 2025.07.22   | 2026.05.29   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.8.1        | 1.8.4        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.14.0       | 5.1.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 1.1.1        | 1.2.0        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                      openldap |  DISTRO  | https://release-monitoring.org/project/002551 | 2.6.14       | 2.7.2        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.11       |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.64.1       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.4       | ORPH
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.41       | 0.4.44       | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.6.0        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.31         | 1.32         |     
                          palo |  GUESS   | https://release-monitoring.org/project/389410 | 2.29         | 2.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.58.0       | 1.58.2       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.58.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.4       | 2.46.5       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                        parsec |  DISTRO  | https://release-monitoring.org/project/183223 | 1.4.1        | 1.5.0        |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.19.3       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.11       | ORPH
                       pcmanfm |  DISTRO  | https://release-monitoring.org/project/002607 | 1.3.2        | 1.4.0        |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.5.2        | 2.5.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                      perftest |  DISTRO  | https://release-monitoring.org/project/017223 | 26.01.5      | 26.07.8      |     
                          perl |  DISTRO  | https://release-monitoring.org/project/013599 | 5.42.3       | 5.44.0       |     
                      perl-cgi |  DISTRO  | https://release-monitoring.org/project/002687 | 4.72         | 5.02         |     
              perl-cgi-session |  DISTRO  | https://release-monitoring.org/project/011821 | 4.48         | 4.49         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.23         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.41         |     
             perl-data-optlist |  DISTRO  | https://release-monitoring.org/project/002769 | 0.114        | 0.115        |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.014        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.656        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.91         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.60        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.099        |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/011868 | 1.20240923   | 1.20261105   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/011809 | 5.519        | 5.522        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.49         | 9.54         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20261020     | 20261105     |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/006578 | 1.0054       | 1.0057       |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
           perl-time-parsedate |  DISTRO  | https://release-monitoring.org/project/003469 | 2026.033     | 2026.0219    |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.37         | 5.40         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0213       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.27       | 5.1.28       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 3.0.1        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.5.0        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.5.0        | 3.5.3        |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/003643 | 1.3.2        | 1.3.3        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.6.6        | 1.6.11       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 3.0.10       | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.15.3       | 1.15.4       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.7.0       | 6.1.4        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 5.0          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 126          | 128          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 25.10.0      | 26.11.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/003694 | 3.6.4        | 3.7.0        |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.17         | 4.24         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.13       | 1.3.15       | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/003702 | 2.15         | 2.16.1       |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/003708 | 4.0.6        | 4.0.7        | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.10      | 0.14.12      |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.7       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.10.5       | 1.12.7       |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/021248 | 1.3.0        | 1.4.0        |     
   python-argon2-cffi-bindings |  DISTRO  | https://release-monitoring.org/project/241938 | 25.1.0       | 26.1.0       |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.4.0        | 5.0.0        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 3.0.2        | 3.1.0        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.43.125     | 1.43.126     |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.43.125     | 1.43.126     |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 7.3.0        | 8.0.0        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/064102 | 6.2.0.post2  | 6.2.1        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/013246 | 3.2.6.post2  | 3.4.0        |     
                python-dunamai |  DISTRO  | https://release-monitoring.org/project/029644 | 1.26.3       | 1.26.5       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 5.4.0        | 5.6.0        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/047977 | 0.162.0      | 0.162.2      |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 25.9.23      | 25.12.19     |     
              python-flit-core |  DISTRO  | https://release-monitoring.org/project/044841 | 3.12.0       | 4.2.0        |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 16.1.0       | 16.6.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
                python-libyang |  DISTRO  | https://release-monitoring.org/project/035917 | 3.3.0        | 5.1.0        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 4.3.1        | 4.4.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.9       | 3.11.2       |     
                 python-memray |  DISTRO  | https://release-monitoring.org/project/267110 | 1.19.1       | 1.20.0       |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.5.4        | 0.6.0        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 11.1.0       | 11.2.1       |     
                   python-mpd2 |  DISTRO  | https://release-monitoring.org/project/019721 | 3.1.1        | 3.1.2        |     
                   python-mypy |  DISTRO  | https://release-monitoring.org/project/008453 | 1.19.1       | 2.4.1        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 2.4.0        | 2.5.4        |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/006084 | 2.1.0        | 2.2.0        |     
              python-periphery |  DISTRO  | https://release-monitoring.org/project/021705 | 2.4.2        | 2.5.0        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20260520.0   | 20260818.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/039654 | 2.14.2       | 2.14.3       |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.50.2       | 2.50.4       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.16.2       | 2.17         |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 2.1          |     
                  python-pypng |  DISTRO  | https://release-monitoring.org/project/006706 | 0.20220715.0 | 0.20250521.0 |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.31       | 7.1.32       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.3.0       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/005548 | 2026.11.7    | 2026.11.9    |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.17.1       | 1.18.1       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.74.0       | 3.0.0b3      |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.17.2       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.3        | 6.0.0        |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/007314 | 235          | 236          |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.1        | 5.13.0       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 4.2.5        | 5.1.0        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | v3.1.1       | 3.4.1        |     
            python-zc-lockfile |  DISTRO  | https://release-monitoring.org/project/004100 | 4.0          | 4.1          |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.153.0      | 0.154.0      |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 23.1.1       | 26.10.1      |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/013254 | 3.14.10      | 3.15.2       |     
                           qbe |  DISTRO  | https://release-monitoring.org/project/371270 | 1.2          | 1.3          |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 11.0.0       | 11.1.3       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.1        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                qoriq-mc-utils |  DISTRO  | https://release-monitoring.org/project/377824 | 10.39.0      | 10.40.0      |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.40.0       | 0.41.1       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.12.0       |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.12.0       |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.12.0       |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.12.0       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.18      | 6.12.0       |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.3       | 6.12.0       |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.3       | 6.12.0       |     
                       qt6grpc |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.3       | 6.12.0       |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.11.3       | 6.12.0       |     
                qt6positioning |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.3       | 6.12.0       |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.3       | 6.12.0       |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.3       | 6.12.0       |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.3       | 6.12.0       |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.8.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.18.1       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.1.0        | ORPH
                     rasdaemon |  DISTRO  | https://release-monitoring.org/project/377958 | 0.8.4        | 1.0.0        |     
           raspberrypi-usbboot |  DISTRO  | https://release-monitoring.org/project/115700 | 20250227-... | 20261103-... | ORPH
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 62.0         | 65.0         |     
                         redis |  DISTRO  | https://release-monitoring.org/project/004181 | 8.10.2       | 8.10.3       |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250923   | 2.20260922   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.8       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.1       | 15.2.0       |     
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.48         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 11.0.4       | 11.13.2      |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2510.0     | 8.2610.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.11         |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.15.3       | 0.16.27      | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 4.0.6        | 4.0.9        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 46.1         |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.44.0       | 2.44.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.15.1.1     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.3      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.2.0.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.4.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.8.0.1      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.8.0.2      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.9.1        | 08032024     |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.37      | 0.99.38      |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.1          | 2.2          |     
                         scdoc |  DISTRO  | https://release-monitoring.org/project/068662 | 1.11.4       | 1.11.5       |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                           sdl |  DISTRO  | https://release-monitoring.org/project/004777 | 1.2.15       | 3.4.20       | ORPH
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.12       | 3.4.8        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 3.2.4        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/004783 | 2.2.0        | 3.2.0        | ORPH
                          sdl3 |  DISTRO  | https://release-monitoring.org/project/375746 | 3.4.16       | 3.4.20       |     
                    sdl3_image |  DISTRO  | https://release-monitoring.org/project/004781 | 3.4.6        | 3.4.8        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.6        | ORPH
                         seatd |  DISTRO  | https://release-monitoring.org/project/234932 | 0.9.1        | 0.9.3        | ORPH
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.17.6       |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.32.8       | 0.32.10      |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.5.1        | 4.7.1        | ORPH
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/004801 | 1.48         | 1.49         |     
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.18.0       | 4.20.3       |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.5.1        | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       siproxd |  DISTRO  | https://release-monitoring.org/project/179540 | 0.8.3        | 0.8.4        |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.16.0.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.9.1        | 4.9.7        | ORPH
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/096795 | 1.3.3        | 1.3.7        |     
                        snappy |  DISTRO  | https://release-monitoring.org/project/004844 | 1.2.2        | 1.3.1        | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.8.2        | 1.9.0        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.6.5        | 4.0.2        |     
                        snooze |  DISTRO  | https://release-monitoring.org/project/376662 | 0.5          | 0.6          |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.12.2.0     | 3.13.2.0     |     
                     soapy-sdr |  DISTRO  | https://release-monitoring.org/project/014536 | 0.8.1        | 0.9.0        | ORPH
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/020628 | 1.0.2        | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                 spirv-headers |  DISTRO  | https://release-monitoring.org/project/230542 | 1.4.357.0    | 2026.08.0    | ORPH
         spirv-llvm-translator |  DISTRO  | https://release-monitoring.org/project/227273 | 23.1.1       | 23.1.3       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.4.357.0    | 1.4.363.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.20.0       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/004880 | 7.7          | 7.8          | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.22       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.3.1        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.23.11      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.21.02      | 0.22.02      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 6.0.5        | 6.1.0        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.80         | 5.82         |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/004905 | 1.14.5       | 1.15.0       |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 26.09        |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/004911 | 0.6.3        | 0.7.0-rev.1  |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 8.0.7        | 8.0.8        |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/020562 | 1.2.1        | 1.2.2        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 10.0.2       | 10.1.5       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.41.4       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 49.0         | 51.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.7.11       | 5.2.27       |     
                   sysrepo-cpp |  DISTRO  | https://release-monitoring.org/project/388239 | 6            | 11           |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.8.0       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.14         | 3.18         | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.104.2      | 1.104.5      |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2023.2.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.11.1       |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.1.0        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.6.0        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.9.1        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.21.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.5.2        | 5.5.4        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.15.10      |     
                           tig |  DISTRO  | https://release-monitoring.org/project/004969 | 2.6.0        | 2.6.1        |     
                          time |  DISTRO  | https://release-monitoring.org/project/004971 | 1.9          | 1.10         |     
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.28.3       | 2.31.0       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.3        |     
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/021379 | 7.0          | 7.1          |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/008699 | 1.11.2       | 1.11.3       | ORPH
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20261101     |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.8.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.1.0        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.6b         | 3.8          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/016819 | 3.0.0        | 3.1.0        | ORPH
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 4.1.3        | 4.2.1        | ORPH
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.2.1        | 2.3.2        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/005022 | 2026.07      | 2026.10      | ORPH
                        uclibc |  DISTRO  | https://release-monitoring.org/project/013815 | 1.0.59       | 1.0.60       |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/021638 | 5.0.3        | 5.0.4        | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.20         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.9.0.1      | 4.11.0.0     |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.26.1       | 1.26.2       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 3.7          | 3.8          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 7.2.6        | 7.3.2        |     
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.9.7        | 1.10.0       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.91.5       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.3.0        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                      usbutils |  DISTRO  | https://release-monitoring.org/project/005061 | 019          | 020          | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.61         | 6.67         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.10.0       | 2.12.0       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.5       | 2.42.4       |     
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.5       | 2.42.4       |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.15.3       | 0.15.4       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.18      | 0.56.19      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/013639 | 3.27.1       | 3.28.0       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.1.3        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.8.4        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.4        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.2.0943     | 9.2.1310     |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/007283 | 2.13         | 2.14         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.2.0        | 3.3.0        |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.84.1       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.368      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.368      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.363.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.368      | ORPH
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.7        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.9.0        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.24.0       | 1.26.0       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.48         | 1.50         | ORPH
                 wayland-utils |  DISTRO  | https://release-monitoring.org/project/129361 | 1.2.0        | 1.3.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.52.4       | 2.54.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 16.0.0       | 16.0.2       |     
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.23         | 2.25         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 11.0         | 11.21        |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.14       | 0.5.19       | ORPH
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.10.0       | 4.2.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.50.5       | 2.54.2       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.47.1       | 0.51.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       | ORPH
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.30       | 2.1.0        |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.1        | 1.1.2        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.9        | 1.1.1        | ORPH
                  xapp_fstobdf |  DISTRO  | https://release-monitoring.org/project/017156 | 1.0.7        | 1.0.8        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.10       | 1.0.11       | ORPH
                      xapp_ico |  DISTRO  | https://release-monitoring.org/project/021722 | 1.0.6        | 1.0.7        | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.6        | 1.0.7        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20260907     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.3        | 1.2.4        | ORPH
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/012314 | 1.3.4        | 1.3.5        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/005164 | 1.1.2        | 1.1.3        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.5        | 1.1.6        | ORPH
                   xapp_xclock |  DISTRO  | https://release-monitoring.org/project/015032 | 1.1.1        | 1.2.1        | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.4        | 1.2.5        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.6        | 1.2.7        | ORPH
                      xapp_xfd |  DISTRO  | https://release-monitoring.org/project/015024 | 1.1.4        | 1.1.6        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.1        | 1.1.2        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.7        | 1.0.8        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xkill |  DISTRO  | https://release-monitoring.org/project/014993 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.2.0        | 1.2.2        | ORPH
                 xapp_xlsatoms |  DISTRO  | https://release-monitoring.org/project/014990 | 1.1.4        | 1.1.5        | ORPH
               xapp_xlsclients |  DISTRO  | https://release-monitoring.org/project/014989 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.8        | 1.0.9        | ORPH
                  xapp_xmodmap |  DISTRO  | https://release-monitoring.org/project/014960 | 1.0.11       | 1.0.12       | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.2.0        | 1.2.1        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.3        | 1.5.4        | ORPH
                     xapp_xrdb |  DISTRO  | https://release-monitoring.org/project/014956 | 1.2.2        | 1.2.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.1.0        | 1.1.1        | ORPH
                     xapp_xset |  DISTRO  | https://release-monitoring.org/project/014954 | 1.2.5        | 1.2.6        | ORPH
                 xapp_xsetroot |  DISTRO  | https://release-monitoring.org/project/014953 | 1.1.3        | 1.1.4        | ORPH
                 xapp_xstdcmap |  DISTRO  | https://release-monitoring.org/project/017150 | 1.0.5        | 1.0.6        | ORPH
                   xapp_xvinfo |  DISTRO  | https://release-monitoring.org/project/014951 | 1.1.5        | 1.1.6        | ORPH
                      xapp_xwd |  DISTRO  | https://release-monitoring.org/project/014950 | 1.0.9        | 1.0.10       | ORPH
                 xapp_xwininfo |  DISTRO  | https://release-monitoring.org/project/014949 | 1.1.6        | 1.1.7        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.7        | 1.0.8        | ORPH
                xdata_xbitmaps |  DISTRO  | https://release-monitoring.org/project/013645 | 1.1.3        | 1.1.4        | ORPH
                xdg-dbus-proxy |  DISTRO  | https://release-monitoring.org/project/058434 | 0.1.8        | 0.1.9        |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/008648 | 3.20211022.1 | 4.20260303.1 | ORPH
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/015059 | 1.0.5        | 1.0.6        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.1        | 1.4.2        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.19.0       | 7.2.1        | ORPH
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.49         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.19       | 1.3.20       | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.12       | 1.8.14       | ORPH
            xlib_libXcomposite |  DISTRO  | https://release-monitoring.org/project/001769 | 0.4.6        | 0.4.7        | ORPH
               xlib_libXdamage |  DISTRO  | https://release-monitoring.org/project/001771 | 1.1.6        | 1.1.7        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.6        | 1.3.7        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.2        | 1.8.4        | ORPH
              xlib_libXinerama |  DISTRO  | https://release-monitoring.org/project/001779 | 1.1.5        | 1.1.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.2.1        | 1.3.1        | ORPH
                   xlib_libXpm |  DISTRO  | https://release-monitoring.org/project/001787 | 3.5.19       | 3.5.20       | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.4        | 1.5.5        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.12       | 0.9.13       | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.5        | 1.2.6        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.14       | 1.0.15       | ORPH
              xlib_libXxf86dga |  DISTRO  | https://release-monitoring.org/project/001797 | 1.1.6        | 1.1.7        | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.6        | 1.1.7        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.8        | 1.1.9        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.3        | 1.2.0        | ORPH
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/017190 | 2025.1       | 2026.1       | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.14         | 6.17         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/005250 | 21.1.24      | 21.1.25      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.31         | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.9        | 1.0.10       | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 24.1.13      | 24.1.14      |     
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 14.2         | 15.0         |     
                            yq |  DISTRO  | https://release-monitoring.org/project/303696 | 4.49.2       | 4.54.2       |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.16.0       | 5.3.3        |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.15       | 8.0.0        |     
                          zbar |  DISTRO  | https://release-monitoring.org/project/013689 | 0.23.93      | 0.23.95      |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.5        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/016905 | 2026b        | 2026c        |     
                  zisofs-tools |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     | ORPH
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.8        | 0.10.0       |     
                           zsh |  DISTRO  | https://release-monitoring.org/project/005307 | 5.9          | 5.9.2        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.3.0        | 3.1.1        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
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
           binutils-bare-metal | CVE-2026-90828   | https://security-tracker.debian.org/tracker/CVE-2026-90828  
           binutils-bare-metal | CVE-2026-90803   | https://security-tracker.debian.org/tracker/CVE-2026-90803  
           binutils-bare-metal | CVE-2026-90804   | https://security-tracker.debian.org/tracker/CVE-2026-90804  
           binutils-bare-metal | CVE-2026-90829   | https://security-tracker.debian.org/tracker/CVE-2026-90829  
           binutils-bare-metal | CVE-2026-90801   | https://security-tracker.debian.org/tracker/CVE-2026-90801  
           binutils-bare-metal | CVE-2026-90802   | https://security-tracker.debian.org/tracker/CVE-2026-90802  
           binutils-bare-metal | CVE-2026-90830   | https://security-tracker.debian.org/tracker/CVE-2026-90830  
           binutils-bare-metal | CVE-2026-90831   | https://security-tracker.debian.org/tracker/CVE-2026-90831  
           binutils-bare-metal | CVE-2026-91782   | https://security-tracker.debian.org/tracker/CVE-2026-91782  
           binutils-bare-metal | CVE-2026-91781   | https://security-tracker.debian.org/tracker/CVE-2026-91781  
           binutils-bare-metal | CVE-2026-91779   | https://security-tracker.debian.org/tracker/CVE-2026-91779  
           binutils-bare-metal | CVE-2026-91780   | https://security-tracker.debian.org/tracker/CVE-2026-91780  
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2026-107885  | https://security-tracker.debian.org/tracker/CVE-2026-107885 
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
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-107696  | https://security-tracker.debian.org/tracker/CVE-2026-107696 
                        ffmpeg | CVE-2026-107675  | https://security-tracker.debian.org/tracker/CVE-2026-107675 
                        ffmpeg | CVE-2026-107676  | https://security-tracker.debian.org/tracker/CVE-2026-107676 
                        ffmpeg | CVE-2026-107678  | https://security-tracker.debian.org/tracker/CVE-2026-107678 
                        ffmpeg | CVE-2026-107677  | https://security-tracker.debian.org/tracker/CVE-2026-107677 
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-55648   | https://security-tracker.debian.org/tracker/CVE-2026-55648  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-91962   | https://security-tracker.debian.org/tracker/CVE-2026-91962  
                       freerdp | CVE-2026-91960   | https://security-tracker.debian.org/tracker/CVE-2026-91960  
                       freerdp | CVE-2026-91954   | https://security-tracker.debian.org/tracker/CVE-2026-91954  
                       freerdp | CVE-2026-91961   | https://security-tracker.debian.org/tracker/CVE-2026-91961  
                       freerdp | CVE-2026-91946   | https://security-tracker.debian.org/tracker/CVE-2026-91946  
                       freerdp | CVE-2026-91947   | https://security-tracker.debian.org/tracker/CVE-2026-91947  
                       freerdp | CVE-2026-91957   | https://security-tracker.debian.org/tracker/CVE-2026-91957  
                       freerdp | CVE-2026-91959   | https://security-tracker.debian.org/tracker/CVE-2026-91959  
                       freerdp | CVE-2026-91956   | https://security-tracker.debian.org/tracker/CVE-2026-91956  
                       freerdp | CVE-2026-91955   | https://security-tracker.debian.org/tracker/CVE-2026-91955  
                       freerdp | CVE-2026-91950   | https://security-tracker.debian.org/tracker/CVE-2026-91950  
                       freerdp | CVE-2026-91964   | https://security-tracker.debian.org/tracker/CVE-2026-91964  
                       freerdp | CVE-2026-91963   | https://security-tracker.debian.org/tracker/CVE-2026-91963  
                       freerdp | CVE-2026-91953   | https://security-tracker.debian.org/tracker/CVE-2026-91953  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-109677  | https://security-tracker.debian.org/tracker/CVE-2026-109677 
                       freerdp | CVE-2026-68579   | https://security-tracker.debian.org/tracker/CVE-2026-68579  
                       freerdp | CVE-2026-68580   | https://security-tracker.debian.org/tracker/CVE-2026-68580  
                       freerdp | CVE-2026-110832  | https://security-tracker.debian.org/tracker/CVE-2026-110832 
                       freerdp | CVE-2026-110837  | https://security-tracker.debian.org/tracker/CVE-2026-110837 
                       freerdp | CVE-2026-110834  | https://security-tracker.debian.org/tracker/CVE-2026-110834 
                       freerdp | CVE-2026-110830  | https://security-tracker.debian.org/tracker/CVE-2026-110830 
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67290   | https://security-tracker.debian.org/tracker/CVE-2026-67290  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67289   | https://security-tracker.debian.org/tracker/CVE-2026-67289  
                       freerdp | CVE-2026-67293   | https://security-tracker.debian.org/tracker/CVE-2026-67293  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67295   | https://security-tracker.debian.org/tracker/CVE-2026-67295  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67298   | https://security-tracker.debian.org/tracker/CVE-2026-67298  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-55191   | https://security-tracker.debian.org/tracker/CVE-2026-55191  
                       freerdp | CVE-2026-55192   | https://security-tracker.debian.org/tracker/CVE-2026-55192  
                       freerdp | CVE-2026-55193   | https://security-tracker.debian.org/tracker/CVE-2026-55193  
                       freerdp | CVE-2026-55194   | https://security-tracker.debian.org/tracker/CVE-2026-55194  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-121411  | https://security-tracker.debian.org/tracker/CVE-2026-121411 
                       freerdp | CVE-2026-121406  | https://security-tracker.debian.org/tracker/CVE-2026-121406 
                       freerdp | CVE-2026-121407  | https://security-tracker.debian.org/tracker/CVE-2026-121407 
                       freerdp | CVE-2026-121408  | https://security-tracker.debian.org/tracker/CVE-2026-121408 
                       freerdp | CVE-2026-121409  | https://security-tracker.debian.org/tracker/CVE-2026-121409 
                       freerdp | CVE-2026-121403  | https://security-tracker.debian.org/tracker/CVE-2026-121403 
                       freerdp | CVE-2026-121405  | https://security-tracker.debian.org/tracker/CVE-2026-121405 
                       freerdp | CVE-2026-121404  | https://security-tracker.debian.org/tracker/CVE-2026-121404 
                       freerdp | CVE-2026-121401  | https://security-tracker.debian.org/tracker/CVE-2026-121401 
                       freerdp | CVE-2026-121402  | https://security-tracker.debian.org/tracker/CVE-2026-121402 
                       freerdp | CVE-2026-121410  | https://security-tracker.debian.org/tracker/CVE-2026-121410 
                       freerdp | CVE-2026-121400  | https://security-tracker.debian.org/tracker/CVE-2026-121400 
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-111373  | https://security-tracker.debian.org/tracker/CVE-2026-111373 
                       freerdp | CVE-2026-111382  | https://security-tracker.debian.org/tracker/CVE-2026-111382 
                       freerdp | CVE-2026-111381  | https://security-tracker.debian.org/tracker/CVE-2026-111381 
                       freerdp | CVE-2026-111379  | https://security-tracker.debian.org/tracker/CVE-2026-111379 
                       freerdp | CVE-2026-111377  | https://security-tracker.debian.org/tracker/CVE-2026-111377 
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67303   | https://security-tracker.debian.org/tracker/CVE-2026-67303  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67300   | https://security-tracker.debian.org/tracker/CVE-2026-67300  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-109247  | https://security-tracker.debian.org/tracker/CVE-2026-109247 
                       freerdp | CVE-2026-109254  | https://security-tracker.debian.org/tracker/CVE-2026-109254 
                       freerdp | CVE-2026-109242  | https://security-tracker.debian.org/tracker/CVE-2026-109242 
                       freerdp | CVE-2026-109241  | https://security-tracker.debian.org/tracker/CVE-2026-109241 
                       freerdp | CVE-2026-109244  | https://security-tracker.debian.org/tracker/CVE-2026-109244 
                       freerdp | CVE-2026-109251  | https://security-tracker.debian.org/tracker/CVE-2026-109251 
                       freerdp | CVE-2026-109246  | https://security-tracker.debian.org/tracker/CVE-2026-109246 
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-121386  | https://security-tracker.debian.org/tracker/CVE-2026-121386 
                       freerdp | CVE-2026-121392  | https://security-tracker.debian.org/tracker/CVE-2026-121392 
                       freerdp | CVE-2026-121387  | https://security-tracker.debian.org/tracker/CVE-2026-121387 
                       freerdp | CVE-2026-121399  | https://security-tracker.debian.org/tracker/CVE-2026-121399 
                       freerdp | CVE-2026-121397  | https://security-tracker.debian.org/tracker/CVE-2026-121397 
                       freerdp | CVE-2026-121398  | https://security-tracker.debian.org/tracker/CVE-2026-121398 
                       freerdp | CVE-2026-73242   | https://security-tracker.debian.org/tracker/CVE-2026-73242  
                       freerdp | CVE-2026-73241   | https://security-tracker.debian.org/tracker/CVE-2026-73241  
                       freerdp | CVE-2026-109941  | https://security-tracker.debian.org/tracker/CVE-2026-109941 
                       freerdp | CVE-2026-109942  | https://security-tracker.debian.org/tracker/CVE-2026-109942 
                       freerdp | CVE-2026-63633   | https://security-tracker.debian.org/tracker/CVE-2026-63633  
                       freerdp | CVE-2026-63652   | https://security-tracker.debian.org/tracker/CVE-2026-63652  
                       freerdp | CVE-2026-63117   | https://security-tracker.debian.org/tracker/CVE-2026-63117  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-66402   | https://security-tracker.debian.org/tracker/CVE-2026-66402  
                       freerdp | CVE-2026-55564   | https://security-tracker.debian.org/tracker/CVE-2026-55564  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                       freerdp | CVE-2026-121963  | https://security-tracker.debian.org/tracker/CVE-2026-121963 
                       freerdp | CVE-2026-121955  | https://security-tracker.debian.org/tracker/CVE-2026-121955 
                       freerdp | CVE-2026-121950  | https://security-tracker.debian.org/tracker/CVE-2026-121950 
                       freerdp | CVE-2026-121957  | https://security-tracker.debian.org/tracker/CVE-2026-121957 
                       freerdp | CVE-2026-121964  | https://security-tracker.debian.org/tracker/CVE-2026-121964 
                       freerdp | CVE-2026-121956  | https://security-tracker.debian.org/tracker/CVE-2026-121956 
                       freerdp | CVE-2026-121959  | https://security-tracker.debian.org/tracker/CVE-2026-121959 
                       freerdp | CVE-2026-121961  | https://security-tracker.debian.org/tracker/CVE-2026-121961 
                       freerdp | CVE-2026-121958  | https://security-tracker.debian.org/tracker/CVE-2026-121958 
                       freerdp | CVE-2026-121962  | https://security-tracker.debian.org/tracker/CVE-2026-121962 
                       freerdp | CVE-2026-121952  | https://security-tracker.debian.org/tracker/CVE-2026-121952 
                       freerdp | CVE-2026-121953  | https://security-tracker.debian.org/tracker/CVE-2026-121953 
                       freerdp | CVE-2026-121954  | https://security-tracker.debian.org/tracker/CVE-2026-121954 
                       freerdp | CVE-2026-121960  | https://security-tracker.debian.org/tracker/CVE-2026-121960 
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                    gdk-pixbuf | CVE-2026-5201    | https://security-tracker.debian.org/tracker/CVE-2026-5201   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-91101   | https://security-tracker.debian.org/tracker/CVE-2026-91101  
                         hplip | CVE-2026-91102   | https://security-tracker.debian.org/tracker/CVE-2026-91102  
                         hplip | CVE-2026-91105   | https://security-tracker.debian.org/tracker/CVE-2026-91105  
                         hplip | CVE-2026-91106   | https://security-tracker.debian.org/tracker/CVE-2026-91106  
                         hplip | CVE-2026-91103   | https://security-tracker.debian.org/tracker/CVE-2026-91103  
                         hplip | CVE-2026-91104   | https://security-tracker.debian.org/tracker/CVE-2026-91104  
                         hplip | CVE-2026-91100   | https://security-tracker.debian.org/tracker/CVE-2026-91100  
                         hplip | CVE-2026-91099   | https://security-tracker.debian.org/tracker/CVE-2026-91099  
                         hplip | CVE-2026-91098   | https://security-tracker.debian.org/tracker/CVE-2026-91098  
                         hplip | CVE-2026-91097   | https://security-tracker.debian.org/tracker/CVE-2026-91097  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libpjsip | CVE-2026-84975   | https://security-tracker.debian.org/tracker/CVE-2026-84975  
                      libpjsip | CVE-2026-77396   | https://security-tracker.debian.org/tracker/CVE-2026-77396  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libsoup | CVE-2026-102560  | https://security-tracker.debian.org/tracker/CVE-2026-102560 
                       libsoup | CVE-2026-102558  | https://security-tracker.debian.org/tracker/CVE-2026-102558 
                       libsoup | CVE-2026-102555  | https://security-tracker.debian.org/tracker/CVE-2026-102555 
                       libsoup | CVE-2026-102556  | https://security-tracker.debian.org/tracker/CVE-2026-102556 
                       libsoup | CVE-2026-102559  | https://security-tracker.debian.org/tracker/CVE-2026-102559 
                       libsoup | CVE-2026-102557  | https://security-tracker.debian.org/tracker/CVE-2026-102557 
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-97380   | https://security-tracker.debian.org/tracker/CVE-2026-97380  
                       mariadb | CVE-2026-92262   | https://security-tracker.debian.org/tracker/CVE-2026-92262  
                       mariadb | CVE-2026-85745   | https://security-tracker.debian.org/tracker/CVE-2026-85745  
                       mariadb | CVE-2026-85746   | https://security-tracker.debian.org/tracker/CVE-2026-85746  
                       mariadb | CVE-2026-85985   | https://security-tracker.debian.org/tracker/CVE-2026-85985  
                       mariadb | CVE-2026-86047   | https://security-tracker.debian.org/tracker/CVE-2026-86047  
                       mariadb | CVE-2026-107822  | https://security-tracker.debian.org/tracker/CVE-2026-107822 
                       mariadb | CVE-2026-107823  | https://security-tracker.debian.org/tracker/CVE-2026-107823 
                       mariadb | CVE-2026-107814  | https://security-tracker.debian.org/tracker/CVE-2026-107814 
                       mariadb | CVE-2026-107816  | https://security-tracker.debian.org/tracker/CVE-2026-107816 
                       mariadb | CVE-2026-107818  | https://security-tracker.debian.org/tracker/CVE-2026-107818 
                       mariadb | CVE-2026-107817  | https://security-tracker.debian.org/tracker/CVE-2026-107817 
                       mariadb | CVE-2026-107815  | https://security-tracker.debian.org/tracker/CVE-2026-107815 
                       mariadb | CVE-2026-107821  | https://security-tracker.debian.org/tracker/CVE-2026-107821 
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                          ruby | CVE-2026-97229   | https://security-tracker.debian.org/tracker/CVE-2026-97229  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
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
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sqlite | CVE-2026-119586  | https://security-tracker.debian.org/tracker/CVE-2026-119586 
                    strongswan | CVE-2026-78132   | https://security-tracker.debian.org/tracker/CVE-2026-78132  
                    strongswan | CVE-2026-78126   | https://security-tracker.debian.org/tracker/CVE-2026-78126  
                    strongswan | CVE-2026-78131   | https://security-tracker.debian.org/tracker/CVE-2026-78131  
                    strongswan | CVE-2026-78133   | https://security-tracker.debian.org/tracker/CVE-2026-78133  
                    strongswan | CVE-2026-78123   | https://security-tracker.debian.org/tracker/CVE-2026-78123  
                    strongswan | CVE-2026-78135   | https://security-tracker.debian.org/tracker/CVE-2026-78135  
                    strongswan | CVE-2026-78134   | https://security-tracker.debian.org/tracker/CVE-2026-78134  
                    strongswan | CVE-2026-78124   | https://security-tracker.debian.org/tracker/CVE-2026-78124  
                    strongswan | CVE-2026-78127   | https://security-tracker.debian.org/tracker/CVE-2026-78127  
                    strongswan | CVE-2026-78130   | https://security-tracker.debian.org/tracker/CVE-2026-78130  
                    strongswan | CVE-2026-78129   | https://security-tracker.debian.org/tracker/CVE-2026-78129  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
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

CVEs for the '2026.08.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
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
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
           binutils-bare-metal | CVE-2026-90828   | https://security-tracker.debian.org/tracker/CVE-2026-90828  
           binutils-bare-metal | CVE-2026-90803   | https://security-tracker.debian.org/tracker/CVE-2026-90803  
           binutils-bare-metal | CVE-2026-90804   | https://security-tracker.debian.org/tracker/CVE-2026-90804  
           binutils-bare-metal | CVE-2026-90829   | https://security-tracker.debian.org/tracker/CVE-2026-90829  
           binutils-bare-metal | CVE-2026-90801   | https://security-tracker.debian.org/tracker/CVE-2026-90801  
           binutils-bare-metal | CVE-2026-90802   | https://security-tracker.debian.org/tracker/CVE-2026-90802  
           binutils-bare-metal | CVE-2026-90830   | https://security-tracker.debian.org/tracker/CVE-2026-90830  
           binutils-bare-metal | CVE-2026-90831   | https://security-tracker.debian.org/tracker/CVE-2026-90831  
           binutils-bare-metal | CVE-2026-91782   | https://security-tracker.debian.org/tracker/CVE-2026-91782  
           binutils-bare-metal | CVE-2026-91781   | https://security-tracker.debian.org/tracker/CVE-2026-91781  
           binutils-bare-metal | CVE-2026-91779   | https://security-tracker.debian.org/tracker/CVE-2026-91779  
           binutils-bare-metal | CVE-2026-91780   | https://security-tracker.debian.org/tracker/CVE-2026-91780  
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2026-107885  | https://security-tracker.debian.org/tracker/CVE-2026-107885 
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
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
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                         expat | CVE-2026-115506  | https://security-tracker.debian.org/tracker/CVE-2026-115506 
                         expat | CVE-2026-117610  | https://security-tracker.debian.org/tracker/CVE-2026-117610 
                         expat | CVE-2026-113351  | https://security-tracker.debian.org/tracker/CVE-2026-113351 
                         expat | CVE-2026-118370  | https://security-tracker.debian.org/tracker/CVE-2026-118370 
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-30754   | https://security-tracker.debian.org/tracker/CVE-2026-30754  
                        ffmpeg | CVE-2026-96611   | https://security-tracker.debian.org/tracker/CVE-2026-96611  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-52297   | https://security-tracker.debian.org/tracker/CVE-2026-52297  
                        ffmpeg | CVE-2026-52296   | https://security-tracker.debian.org/tracker/CVE-2026-52296  
                        ffmpeg | CVE-2026-52295   | https://security-tracker.debian.org/tracker/CVE-2026-52295  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-107696  | https://security-tracker.debian.org/tracker/CVE-2026-107696 
                        ffmpeg | CVE-2026-107675  | https://security-tracker.debian.org/tracker/CVE-2026-107675 
                        ffmpeg | CVE-2026-107698  | https://security-tracker.debian.org/tracker/CVE-2026-107698 
                        ffmpeg | CVE-2026-107676  | https://security-tracker.debian.org/tracker/CVE-2026-107676 
                        ffmpeg | CVE-2026-107695  | https://security-tracker.debian.org/tracker/CVE-2026-107695 
                        ffmpeg | CVE-2026-107678  | https://security-tracker.debian.org/tracker/CVE-2026-107678 
                        ffmpeg | CVE-2026-107677  | https://security-tracker.debian.org/tracker/CVE-2026-107677 
                        ffmpeg | CVE-2026-107660  | https://security-tracker.debian.org/tracker/CVE-2026-107660 
                        ffmpeg | CVE-2026-107697  | https://security-tracker.debian.org/tracker/CVE-2026-107697 
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-55648   | https://security-tracker.debian.org/tracker/CVE-2026-55648  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-91962   | https://security-tracker.debian.org/tracker/CVE-2026-91962  
                       freerdp | CVE-2026-91960   | https://security-tracker.debian.org/tracker/CVE-2026-91960  
                       freerdp | CVE-2026-91954   | https://security-tracker.debian.org/tracker/CVE-2026-91954  
                       freerdp | CVE-2026-91961   | https://security-tracker.debian.org/tracker/CVE-2026-91961  
                       freerdp | CVE-2026-91946   | https://security-tracker.debian.org/tracker/CVE-2026-91946  
                       freerdp | CVE-2026-91947   | https://security-tracker.debian.org/tracker/CVE-2026-91947  
                       freerdp | CVE-2026-91957   | https://security-tracker.debian.org/tracker/CVE-2026-91957  
                       freerdp | CVE-2026-91959   | https://security-tracker.debian.org/tracker/CVE-2026-91959  
                       freerdp | CVE-2026-91956   | https://security-tracker.debian.org/tracker/CVE-2026-91956  
                       freerdp | CVE-2026-91955   | https://security-tracker.debian.org/tracker/CVE-2026-91955  
                       freerdp | CVE-2026-91950   | https://security-tracker.debian.org/tracker/CVE-2026-91950  
                       freerdp | CVE-2026-91964   | https://security-tracker.debian.org/tracker/CVE-2026-91964  
                       freerdp | CVE-2026-91963   | https://security-tracker.debian.org/tracker/CVE-2026-91963  
                       freerdp | CVE-2026-91953   | https://security-tracker.debian.org/tracker/CVE-2026-91953  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-109677  | https://security-tracker.debian.org/tracker/CVE-2026-109677 
                       freerdp | CVE-2026-68579   | https://security-tracker.debian.org/tracker/CVE-2026-68579  
                       freerdp | CVE-2026-68580   | https://security-tracker.debian.org/tracker/CVE-2026-68580  
                       freerdp | CVE-2026-110832  | https://security-tracker.debian.org/tracker/CVE-2026-110832 
                       freerdp | CVE-2026-110837  | https://security-tracker.debian.org/tracker/CVE-2026-110837 
                       freerdp | CVE-2026-110834  | https://security-tracker.debian.org/tracker/CVE-2026-110834 
                       freerdp | CVE-2026-110830  | https://security-tracker.debian.org/tracker/CVE-2026-110830 
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67290   | https://security-tracker.debian.org/tracker/CVE-2026-67290  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67289   | https://security-tracker.debian.org/tracker/CVE-2026-67289  
                       freerdp | CVE-2026-67293   | https://security-tracker.debian.org/tracker/CVE-2026-67293  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67295   | https://security-tracker.debian.org/tracker/CVE-2026-67295  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67298   | https://security-tracker.debian.org/tracker/CVE-2026-67298  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-55191   | https://security-tracker.debian.org/tracker/CVE-2026-55191  
                       freerdp | CVE-2026-55192   | https://security-tracker.debian.org/tracker/CVE-2026-55192  
                       freerdp | CVE-2026-55193   | https://security-tracker.debian.org/tracker/CVE-2026-55193  
                       freerdp | CVE-2026-55194   | https://security-tracker.debian.org/tracker/CVE-2026-55194  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-121411  | https://security-tracker.debian.org/tracker/CVE-2026-121411 
                       freerdp | CVE-2026-121406  | https://security-tracker.debian.org/tracker/CVE-2026-121406 
                       freerdp | CVE-2026-121407  | https://security-tracker.debian.org/tracker/CVE-2026-121407 
                       freerdp | CVE-2026-121408  | https://security-tracker.debian.org/tracker/CVE-2026-121408 
                       freerdp | CVE-2026-121409  | https://security-tracker.debian.org/tracker/CVE-2026-121409 
                       freerdp | CVE-2026-121403  | https://security-tracker.debian.org/tracker/CVE-2026-121403 
                       freerdp | CVE-2026-121405  | https://security-tracker.debian.org/tracker/CVE-2026-121405 
                       freerdp | CVE-2026-121404  | https://security-tracker.debian.org/tracker/CVE-2026-121404 
                       freerdp | CVE-2026-121401  | https://security-tracker.debian.org/tracker/CVE-2026-121401 
                       freerdp | CVE-2026-121402  | https://security-tracker.debian.org/tracker/CVE-2026-121402 
                       freerdp | CVE-2026-121410  | https://security-tracker.debian.org/tracker/CVE-2026-121410 
                       freerdp | CVE-2026-121400  | https://security-tracker.debian.org/tracker/CVE-2026-121400 
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-111373  | https://security-tracker.debian.org/tracker/CVE-2026-111373 
                       freerdp | CVE-2026-111382  | https://security-tracker.debian.org/tracker/CVE-2026-111382 
                       freerdp | CVE-2026-111381  | https://security-tracker.debian.org/tracker/CVE-2026-111381 
                       freerdp | CVE-2026-111379  | https://security-tracker.debian.org/tracker/CVE-2026-111379 
                       freerdp | CVE-2026-111377  | https://security-tracker.debian.org/tracker/CVE-2026-111377 
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67303   | https://security-tracker.debian.org/tracker/CVE-2026-67303  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67300   | https://security-tracker.debian.org/tracker/CVE-2026-67300  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-109247  | https://security-tracker.debian.org/tracker/CVE-2026-109247 
                       freerdp | CVE-2026-109254  | https://security-tracker.debian.org/tracker/CVE-2026-109254 
                       freerdp | CVE-2026-109242  | https://security-tracker.debian.org/tracker/CVE-2026-109242 
                       freerdp | CVE-2026-109241  | https://security-tracker.debian.org/tracker/CVE-2026-109241 
                       freerdp | CVE-2026-109244  | https://security-tracker.debian.org/tracker/CVE-2026-109244 
                       freerdp | CVE-2026-109251  | https://security-tracker.debian.org/tracker/CVE-2026-109251 
                       freerdp | CVE-2026-109246  | https://security-tracker.debian.org/tracker/CVE-2026-109246 
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-121386  | https://security-tracker.debian.org/tracker/CVE-2026-121386 
                       freerdp | CVE-2026-121392  | https://security-tracker.debian.org/tracker/CVE-2026-121392 
                       freerdp | CVE-2026-121387  | https://security-tracker.debian.org/tracker/CVE-2026-121387 
                       freerdp | CVE-2026-121399  | https://security-tracker.debian.org/tracker/CVE-2026-121399 
                       freerdp | CVE-2026-121397  | https://security-tracker.debian.org/tracker/CVE-2026-121397 
                       freerdp | CVE-2026-121398  | https://security-tracker.debian.org/tracker/CVE-2026-121398 
                       freerdp | CVE-2026-73242   | https://security-tracker.debian.org/tracker/CVE-2026-73242  
                       freerdp | CVE-2026-73241   | https://security-tracker.debian.org/tracker/CVE-2026-73241  
                       freerdp | CVE-2026-109941  | https://security-tracker.debian.org/tracker/CVE-2026-109941 
                       freerdp | CVE-2026-109942  | https://security-tracker.debian.org/tracker/CVE-2026-109942 
                       freerdp | CVE-2026-63633   | https://security-tracker.debian.org/tracker/CVE-2026-63633  
                       freerdp | CVE-2026-63652   | https://security-tracker.debian.org/tracker/CVE-2026-63652  
                       freerdp | CVE-2026-63117   | https://security-tracker.debian.org/tracker/CVE-2026-63117  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-66402   | https://security-tracker.debian.org/tracker/CVE-2026-66402  
                       freerdp | CVE-2026-55564   | https://security-tracker.debian.org/tracker/CVE-2026-55564  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                       freerdp | CVE-2026-121963  | https://security-tracker.debian.org/tracker/CVE-2026-121963 
                       freerdp | CVE-2026-121955  | https://security-tracker.debian.org/tracker/CVE-2026-121955 
                       freerdp | CVE-2026-121950  | https://security-tracker.debian.org/tracker/CVE-2026-121950 
                       freerdp | CVE-2026-121957  | https://security-tracker.debian.org/tracker/CVE-2026-121957 
                       freerdp | CVE-2026-121964  | https://security-tracker.debian.org/tracker/CVE-2026-121964 
                       freerdp | CVE-2026-121956  | https://security-tracker.debian.org/tracker/CVE-2026-121956 
                       freerdp | CVE-2026-121959  | https://security-tracker.debian.org/tracker/CVE-2026-121959 
                       freerdp | CVE-2026-121961  | https://security-tracker.debian.org/tracker/CVE-2026-121961 
                       freerdp | CVE-2026-121958  | https://security-tracker.debian.org/tracker/CVE-2026-121958 
                       freerdp | CVE-2026-121962  | https://security-tracker.debian.org/tracker/CVE-2026-121962 
                       freerdp | CVE-2026-121952  | https://security-tracker.debian.org/tracker/CVE-2026-121952 
                       freerdp | CVE-2026-121953  | https://security-tracker.debian.org/tracker/CVE-2026-121953 
                       freerdp | CVE-2026-121954  | https://security-tracker.debian.org/tracker/CVE-2026-121954 
                       freerdp | CVE-2026-121960  | https://security-tracker.debian.org/tracker/CVE-2026-121960 
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                    gdk-pixbuf | CVE-2026-5201    | https://security-tracker.debian.org/tracker/CVE-2026-5201   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-91101   | https://security-tracker.debian.org/tracker/CVE-2026-91101  
                         hplip | CVE-2026-91102   | https://security-tracker.debian.org/tracker/CVE-2026-91102  
                         hplip | CVE-2026-91105   | https://security-tracker.debian.org/tracker/CVE-2026-91105  
                         hplip | CVE-2026-91106   | https://security-tracker.debian.org/tracker/CVE-2026-91106  
                         hplip | CVE-2026-91103   | https://security-tracker.debian.org/tracker/CVE-2026-91103  
                         hplip | CVE-2026-91104   | https://security-tracker.debian.org/tracker/CVE-2026-91104  
                         hplip | CVE-2026-91100   | https://security-tracker.debian.org/tracker/CVE-2026-91100  
                         hplip | CVE-2026-91099   | https://security-tracker.debian.org/tracker/CVE-2026-91099  
                         hplip | CVE-2026-91098   | https://security-tracker.debian.org/tracker/CVE-2026-91098  
                         hplip | CVE-2026-91097   | https://security-tracker.debian.org/tracker/CVE-2026-91097  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-93590   | https://security-tracker.debian.org/tracker/CVE-2026-93590  
                   imagemagick | CVE-2026-93586   | https://security-tracker.debian.org/tracker/CVE-2026-93586  
                   imagemagick | CVE-2026-93587   | https://security-tracker.debian.org/tracker/CVE-2026-93587  
                   imagemagick | CVE-2026-93589   | https://security-tracker.debian.org/tracker/CVE-2026-93589  
                   imagemagick | CVE-2026-93588   | https://security-tracker.debian.org/tracker/CVE-2026-93588  
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-108693  | https://security-tracker.debian.org/tracker/CVE-2026-108693 
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-116154  | https://security-tracker.debian.org/tracker/CVE-2026-116154 
                   imagemagick | CVE-2026-116152  | https://security-tracker.debian.org/tracker/CVE-2026-116152 
                   imagemagick | CVE-2026-116149  | https://security-tracker.debian.org/tracker/CVE-2026-116149 
                   imagemagick | CVE-2026-116142  | https://security-tracker.debian.org/tracker/CVE-2026-116142 
                   imagemagick | CVE-2026-116155  | https://security-tracker.debian.org/tracker/CVE-2026-116155 
                   imagemagick | CVE-2026-116151  | https://security-tracker.debian.org/tracker/CVE-2026-116151 
                   imagemagick | CVE-2026-116159  | https://security-tracker.debian.org/tracker/CVE-2026-116159 
                   imagemagick | CVE-2026-116143  | https://security-tracker.debian.org/tracker/CVE-2026-116143 
                   imagemagick | CVE-2026-116140  | https://security-tracker.debian.org/tracker/CVE-2026-116140 
                   imagemagick | CVE-2026-116148  | https://security-tracker.debian.org/tracker/CVE-2026-116148 
                   imagemagick | CVE-2026-116156  | https://security-tracker.debian.org/tracker/CVE-2026-116156 
                   imagemagick | CVE-2026-116146  | https://security-tracker.debian.org/tracker/CVE-2026-116146 
                   imagemagick | CVE-2026-116157  | https://security-tracker.debian.org/tracker/CVE-2026-116157 
                   imagemagick | CVE-2026-116145  | https://security-tracker.debian.org/tracker/CVE-2026-116145 
                   imagemagick | CVE-2026-116144  | https://security-tracker.debian.org/tracker/CVE-2026-116144 
                   imagemagick | CVE-2026-116141  | https://security-tracker.debian.org/tracker/CVE-2026-116141 
                   imagemagick | CVE-2026-116158  | https://security-tracker.debian.org/tracker/CVE-2026-116158 
                   imagemagick | CVE-2026-116153  | https://security-tracker.debian.org/tracker/CVE-2026-116153 
                   imagemagick | CVE-2026-116147  | https://security-tracker.debian.org/tracker/CVE-2026-116147 
                   imagemagick | CVE-2026-116160  | https://security-tracker.debian.org/tracker/CVE-2026-116160 
                   imagemagick | CVE-2026-116150  | https://security-tracker.debian.org/tracker/CVE-2026-116150 
                   imagemagick | CVE-2026-107209  | https://security-tracker.debian.org/tracker/CVE-2026-107209 
                   imagemagick | CVE-2026-107208  | https://security-tracker.debian.org/tracker/CVE-2026-107208 
                   imagemagick | CVE-2026-107210  | https://security-tracker.debian.org/tracker/CVE-2026-107210 
                   imagemagick | CVE-2026-105083  | https://security-tracker.debian.org/tracker/CVE-2026-105083 
                   imagemagick | CVE-2026-105081  | https://security-tracker.debian.org/tracker/CVE-2026-105081 
                   imagemagick | CVE-2026-106569  | https://security-tracker.debian.org/tracker/CVE-2026-106569 
                   imagemagick | CVE-2026-106574  | https://security-tracker.debian.org/tracker/CVE-2026-106574 
                   imagemagick | CVE-2026-106566  | https://security-tracker.debian.org/tracker/CVE-2026-106566 
                   imagemagick | CVE-2026-106580  | https://security-tracker.debian.org/tracker/CVE-2026-106580 
                   imagemagick | CVE-2026-106567  | https://security-tracker.debian.org/tracker/CVE-2026-106567 
                   imagemagick | CVE-2026-106568  | https://security-tracker.debian.org/tracker/CVE-2026-106568 
                   imagemagick | CVE-2026-106578  | https://security-tracker.debian.org/tracker/CVE-2026-106578 
                   imagemagick | CVE-2026-106571  | https://security-tracker.debian.org/tracker/CVE-2026-106571 
                   imagemagick | CVE-2026-106565  | https://security-tracker.debian.org/tracker/CVE-2026-106565 
                   imagemagick | CVE-2026-106572  | https://security-tracker.debian.org/tracker/CVE-2026-106572 
                   imagemagick | CVE-2026-106575  | https://security-tracker.debian.org/tracker/CVE-2026-106575 
                   imagemagick | CVE-2026-106564  | https://security-tracker.debian.org/tracker/CVE-2026-106564 
                   imagemagick | CVE-2026-106576  | https://security-tracker.debian.org/tracker/CVE-2026-106576 
                   imagemagick | CVE-2026-106570  | https://security-tracker.debian.org/tracker/CVE-2026-106570 
                   imagemagick | CVE-2026-106573  | https://security-tracker.debian.org/tracker/CVE-2026-106573 
                   imagemagick | CVE-2026-106577  | https://security-tracker.debian.org/tracker/CVE-2026-106577 
                   imagemagick | CVE-2026-106579  | https://security-tracker.debian.org/tracker/CVE-2026-106579 
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-119123  | https://security-tracker.debian.org/tracker/CVE-2026-119123 
                   imagemagick | CVE-2026-119124  | https://security-tracker.debian.org/tracker/CVE-2026-119124 
                   imagemagick | CVE-2026-109270  | https://security-tracker.debian.org/tracker/CVE-2026-109270 
                   imagemagick | CVE-2026-109268  | https://security-tracker.debian.org/tracker/CVE-2026-109268 
                   imagemagick | CVE-2026-109262  | https://security-tracker.debian.org/tracker/CVE-2026-109262 
                   imagemagick | CVE-2026-109282  | https://security-tracker.debian.org/tracker/CVE-2026-109282 
                   imagemagick | CVE-2026-109279  | https://security-tracker.debian.org/tracker/CVE-2026-109279 
                   imagemagick | CVE-2026-109280  | https://security-tracker.debian.org/tracker/CVE-2026-109280 
                   imagemagick | CVE-2026-109266  | https://security-tracker.debian.org/tracker/CVE-2026-109266 
                   imagemagick | CVE-2026-109259  | https://security-tracker.debian.org/tracker/CVE-2026-109259 
                   imagemagick | CVE-2026-109261  | https://security-tracker.debian.org/tracker/CVE-2026-109261 
                   imagemagick | CVE-2026-109258  | https://security-tracker.debian.org/tracker/CVE-2026-109258 
                   imagemagick | CVE-2026-109281  | https://security-tracker.debian.org/tracker/CVE-2026-109281 
                   imagemagick | CVE-2026-109277  | https://security-tracker.debian.org/tracker/CVE-2026-109277 
                   imagemagick | CVE-2026-109265  | https://security-tracker.debian.org/tracker/CVE-2026-109265 
                   imagemagick | CVE-2026-109275  | https://security-tracker.debian.org/tracker/CVE-2026-109275 
                   imagemagick | CVE-2026-109273  | https://security-tracker.debian.org/tracker/CVE-2026-109273 
                   imagemagick | CVE-2026-109267  | https://security-tracker.debian.org/tracker/CVE-2026-109267 
                   imagemagick | CVE-2026-109260  | https://security-tracker.debian.org/tracker/CVE-2026-109260 
                   imagemagick | CVE-2026-109263  | https://security-tracker.debian.org/tracker/CVE-2026-109263 
                   imagemagick | CVE-2026-109278  | https://security-tracker.debian.org/tracker/CVE-2026-109278 
                   imagemagick | CVE-2026-109264  | https://security-tracker.debian.org/tracker/CVE-2026-109264 
                   imagemagick | CVE-2026-109269  | https://security-tracker.debian.org/tracker/CVE-2026-109269 
                   imagemagick | CVE-2026-109274  | https://security-tracker.debian.org/tracker/CVE-2026-109274 
                   imagemagick | CVE-2026-109272  | https://security-tracker.debian.org/tracker/CVE-2026-109272 
                   imagemagick | CVE-2026-109276  | https://security-tracker.debian.org/tracker/CVE-2026-109276 
                   imagemagick | CVE-2026-102635  | https://security-tracker.debian.org/tracker/CVE-2026-102635 
                   imagemagick | CVE-2026-109964  | https://security-tracker.debian.org/tracker/CVE-2026-109964 
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libpjsip | CVE-2026-84975   | https://security-tracker.debian.org/tracker/CVE-2026-84975  
                      libpjsip | CVE-2026-77396   | https://security-tracker.debian.org/tracker/CVE-2026-77396  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libsoup | CVE-2026-102560  | https://security-tracker.debian.org/tracker/CVE-2026-102560 
                       libsoup | CVE-2026-102558  | https://security-tracker.debian.org/tracker/CVE-2026-102558 
                       libsoup | CVE-2026-102555  | https://security-tracker.debian.org/tracker/CVE-2026-102555 
                       libsoup | CVE-2026-102556  | https://security-tracker.debian.org/tracker/CVE-2026-102556 
                       libsoup | CVE-2026-102559  | https://security-tracker.debian.org/tracker/CVE-2026-102559 
                       libsoup | CVE-2026-102557  | https://security-tracker.debian.org/tracker/CVE-2026-102557 
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-43631   | https://security-tracker.debian.org/tracker/CVE-2026-43631  
                     llama-cpp | CVE-2026-43628   | https://security-tracker.debian.org/tracker/CVE-2026-43628  
                     llama-cpp | CVE-2026-43632   | https://security-tracker.debian.org/tracker/CVE-2026-43632  
                     llama-cpp | CVE-2026-43629   | https://security-tracker.debian.org/tracker/CVE-2026-43629  
                     llama-cpp | CVE-2026-43627   | https://security-tracker.debian.org/tracker/CVE-2026-43627  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-97380   | https://security-tracker.debian.org/tracker/CVE-2026-97380  
                       mariadb | CVE-2026-92262   | https://security-tracker.debian.org/tracker/CVE-2026-92262  
                       mariadb | CVE-2026-85745   | https://security-tracker.debian.org/tracker/CVE-2026-85745  
                       mariadb | CVE-2026-85746   | https://security-tracker.debian.org/tracker/CVE-2026-85746  
                       mariadb | CVE-2026-85985   | https://security-tracker.debian.org/tracker/CVE-2026-85985  
                       mariadb | CVE-2026-86047   | https://security-tracker.debian.org/tracker/CVE-2026-86047  
                       mariadb | CVE-2026-107822  | https://security-tracker.debian.org/tracker/CVE-2026-107822 
                       mariadb | CVE-2026-107823  | https://security-tracker.debian.org/tracker/CVE-2026-107823 
                       mariadb | CVE-2026-107814  | https://security-tracker.debian.org/tracker/CVE-2026-107814 
                       mariadb | CVE-2026-107816  | https://security-tracker.debian.org/tracker/CVE-2026-107816 
                       mariadb | CVE-2026-107818  | https://security-tracker.debian.org/tracker/CVE-2026-107818 
                       mariadb | CVE-2026-107817  | https://security-tracker.debian.org/tracker/CVE-2026-107817 
                       mariadb | CVE-2026-107815  | https://security-tracker.debian.org/tracker/CVE-2026-107815 
                       mariadb | CVE-2026-107821  | https://security-tracker.debian.org/tracker/CVE-2026-107821 
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          nmap | CVE-2026-0011    | https://security-tracker.debian.org/tracker/CVE-2026-0011   
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-96778   | https://security-tracker.debian.org/tracker/CVE-2026-96778  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-96640   | https://security-tracker.debian.org/tracker/CVE-2026-96640  
                 python-pillow | CVE-2026-96642   | https://security-tracker.debian.org/tracker/CVE-2026-96642  
                 python-pillow | CVE-2026-96637   | https://security-tracker.debian.org/tracker/CVE-2026-96637  
                 python-pillow | CVE-2026-96643   | https://security-tracker.debian.org/tracker/CVE-2026-96643  
                 python-pillow | CVE-2026-96644   | https://security-tracker.debian.org/tracker/CVE-2026-96644  
                 python-pillow | CVE-2026-96638   | https://security-tracker.debian.org/tracker/CVE-2026-96638  
                 python-pillow | CVE-2026-96641   | https://security-tracker.debian.org/tracker/CVE-2026-96641  
                 python-pillow | CVE-2026-96639   | https://security-tracker.debian.org/tracker/CVE-2026-96639  
                 python-pillow | CVE-2026-96636   | https://security-tracker.debian.org/tracker/CVE-2026-96636  
                 python-pillow | CVE-2026-112895  | https://security-tracker.debian.org/tracker/CVE-2026-112895 
                 python-pillow | CVE-2026-112898  | https://security-tracker.debian.org/tracker/CVE-2026-112898 
                 python-pillow | CVE-2026-112896  | https://security-tracker.debian.org/tracker/CVE-2026-112896 
                 python-pillow | CVE-2026-112897  | https://security-tracker.debian.org/tracker/CVE-2026-112897 
                 python-pillow | CVE-2026-112894  | https://security-tracker.debian.org/tracker/CVE-2026-112894 
                 python-pillow | CVE-2026-112891  | https://security-tracker.debian.org/tracker/CVE-2026-112891 
                 python-pillow | CVE-2026-112893  | https://security-tracker.debian.org/tracker/CVE-2026-112893 
                 python-pillow | CVE-2026-112892  | https://security-tracker.debian.org/tracker/CVE-2026-112892 
                 python-pillow | CVE-2026-112400  | https://security-tracker.debian.org/tracker/CVE-2026-112400 
                 python-pillow | CVE-2026-112403  | https://security-tracker.debian.org/tracker/CVE-2026-112403 
                 python-pillow | CVE-2026-112401  | https://security-tracker.debian.org/tracker/CVE-2026-112401 
                 python-pillow | CVE-2026-112406  | https://security-tracker.debian.org/tracker/CVE-2026-112406 
                 python-pillow | CVE-2026-112405  | https://security-tracker.debian.org/tracker/CVE-2026-112405 
                 python-pillow | CVE-2026-112404  | https://security-tracker.debian.org/tracker/CVE-2026-112404 
                 python-pillow | CVE-2026-112402  | https://security-tracker.debian.org/tracker/CVE-2026-112402 
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-112390  | https://security-tracker.debian.org/tracker/CVE-2026-112390 
                 python-pillow | CVE-2026-112397  | https://security-tracker.debian.org/tracker/CVE-2026-112397 
                 python-pillow | CVE-2026-112392  | https://security-tracker.debian.org/tracker/CVE-2026-112392 
                 python-pillow | CVE-2026-112393  | https://security-tracker.debian.org/tracker/CVE-2026-112393 
                 python-pillow | CVE-2026-112399  | https://security-tracker.debian.org/tracker/CVE-2026-112399 
                 python-pillow | CVE-2026-112394  | https://security-tracker.debian.org/tracker/CVE-2026-112394 
                 python-pillow | CVE-2026-112391  | https://security-tracker.debian.org/tracker/CVE-2026-112391 
                 python-pillow | CVE-2026-112395  | https://security-tracker.debian.org/tracker/CVE-2026-112395 
                 python-pillow | CVE-2026-112396  | https://security-tracker.debian.org/tracker/CVE-2026-112396 
                 python-pillow | CVE-2026-112398  | https://security-tracker.debian.org/tracker/CVE-2026-112398 
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-112901  | https://security-tracker.debian.org/tracker/CVE-2026-112901 
                 python-pillow | CVE-2026-112900  | https://security-tracker.debian.org/tracker/CVE-2026-112900 
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-114501  | https://security-tracker.debian.org/tracker/CVE-2026-114501 
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59203   | https://security-tracker.debian.org/tracker/CVE-2026-59203  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-102275  | https://security-tracker.debian.org/tracker/CVE-2026-102275 
                  python-pyjwt | CVE-2026-102271  | https://security-tracker.debian.org/tracker/CVE-2026-102271 
                  python-pyjwt | CVE-2026-102274  | https://security-tracker.debian.org/tracker/CVE-2026-102274 
                  python-pyjwt | CVE-2026-102269  | https://security-tracker.debian.org/tracker/CVE-2026-102269 
                  python-pyjwt | CVE-2026-102268  | https://security-tracker.debian.org/tracker/CVE-2026-102268 
                  python-pyjwt | CVE-2026-102267  | https://security-tracker.debian.org/tracker/CVE-2026-102267 
                  python-pyjwt | CVE-2026-102270  | https://security-tracker.debian.org/tracker/CVE-2026-102270 
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
                  python-pyjwt | CVE-2026-48523   | https://security-tracker.debian.org/tracker/CVE-2026-48523  
                  python-pyjwt | CVE-2026-103001  | https://security-tracker.debian.org/tracker/CVE-2026-103001 
                  python-pyjwt | CVE-2026-101917  | https://security-tracker.debian.org/tracker/CVE-2026-101917 
                  python-pyjwt | CVE-2026-101918  | https://security-tracker.debian.org/tracker/CVE-2026-101918 
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
                python-urllib3 | CVE-2026-97688   | https://security-tracker.debian.org/tracker/CVE-2026-97688  
                python-urllib3 | CVE-2026-97689   | https://security-tracker.debian.org/tracker/CVE-2026-97689  
                python-urllib3 | CVE-2026-97687   | https://security-tracker.debian.org/tracker/CVE-2026-97687  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                         rsync | CVE-2026-119741  | https://security-tracker.debian.org/tracker/CVE-2026-119741 
                          ruby | CVE-2026-97229   | https://security-tracker.debian.org/tracker/CVE-2026-97229  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
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
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sqlite | CVE-2026-119379  | https://security-tracker.debian.org/tracker/CVE-2026-119379 
                        sqlite | CVE-2026-119377  | https://security-tracker.debian.org/tracker/CVE-2026-119377 
                        sqlite | CVE-2026-119376  | https://security-tracker.debian.org/tracker/CVE-2026-119376 
                        sqlite | CVE-2026-119371  | https://security-tracker.debian.org/tracker/CVE-2026-119371 
                        sqlite | CVE-2026-119373  | https://security-tracker.debian.org/tracker/CVE-2026-119373 
                        sqlite | CVE-2026-119375  | https://security-tracker.debian.org/tracker/CVE-2026-119375 
                        sqlite | CVE-2026-119378  | https://security-tracker.debian.org/tracker/CVE-2026-119378 
                        sqlite | CVE-2026-119374  | https://security-tracker.debian.org/tracker/CVE-2026-119374 
                        sqlite | CVE-2026-119372  | https://security-tracker.debian.org/tracker/CVE-2026-119372 
                        sqlite | CVE-2026-119591  | https://security-tracker.debian.org/tracker/CVE-2026-119591 
                        sqlite | CVE-2026-119586  | https://security-tracker.debian.org/tracker/CVE-2026-119586 
                    strongswan | CVE-2026-78132   | https://security-tracker.debian.org/tracker/CVE-2026-78132  
                    strongswan | CVE-2026-78126   | https://security-tracker.debian.org/tracker/CVE-2026-78126  
                    strongswan | CVE-2026-78131   | https://security-tracker.debian.org/tracker/CVE-2026-78131  
                    strongswan | CVE-2026-78133   | https://security-tracker.debian.org/tracker/CVE-2026-78133  
                    strongswan | CVE-2026-78123   | https://security-tracker.debian.org/tracker/CVE-2026-78123  
                    strongswan | CVE-2026-78135   | https://security-tracker.debian.org/tracker/CVE-2026-78135  
                    strongswan | CVE-2026-78134   | https://security-tracker.debian.org/tracker/CVE-2026-78134  
                    strongswan | CVE-2026-78124   | https://security-tracker.debian.org/tracker/CVE-2026-78124  
                    strongswan | CVE-2026-78127   | https://security-tracker.debian.org/tracker/CVE-2026-78127  
                    strongswan | CVE-2026-78130   | https://security-tracker.debian.org/tracker/CVE-2026-78130  
                    strongswan | CVE-2026-78129   | https://security-tracker.debian.org/tracker/CVE-2026-78129  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                         wget2 | CVE-2026-1858    | https://security-tracker.debian.org/tracker/CVE-2026-1858   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
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

CVEs for the '2026.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-2026-93546   | https://security-tracker.debian.org/tracker/CVE-2026-93546  
                        apache | CVE-2026-56449   | https://security-tracker.debian.org/tracker/CVE-2026-56449  
                        apache | CVE-2026-63292   | https://security-tracker.debian.org/tracker/CVE-2026-63292  
                        apache | CVE-2026-59797   | https://security-tracker.debian.org/tracker/CVE-2026-59797  
                        apache | CVE-2026-47360   | https://security-tracker.debian.org/tracker/CVE-2026-47360  
                        apache | CVE-2026-73637   | https://security-tracker.debian.org/tracker/CVE-2026-73637  
                        apache | CVE-2026-73636   | https://security-tracker.debian.org/tracker/CVE-2026-73636  
                        apache | CVE-2026-42528   | https://security-tracker.debian.org/tracker/CVE-2026-42528  
                        apache | CVE-2026-56154   | https://security-tracker.debian.org/tracker/CVE-2026-56154  
                        apache | CVE-2026-56153   | https://security-tracker.debian.org/tracker/CVE-2026-56153  
                        apache | CVE-2026-57941   | https://security-tracker.debian.org/tracker/CVE-2026-57941  
                        apache | CVE-2026-59685   | https://security-tracker.debian.org/tracker/CVE-2026-59685  
                        apache | CVE-2026-79768   | https://security-tracker.debian.org/tracker/CVE-2026-79768  
                        apache | CVE-2026-58415   | https://security-tracker.debian.org/tracker/CVE-2026-58415  
                        apache | CVE-2026-63686   | https://security-tracker.debian.org/tracker/CVE-2026-63686  
                        apache | CVE-2026-48005   | https://security-tracker.debian.org/tracker/CVE-2026-48005  
                        apache | CVE-2026-46729   | https://security-tracker.debian.org/tracker/CVE-2026-46729  
                        apache | CVE-2026-63045   | https://security-tracker.debian.org/tracker/CVE-2026-63045  
                        apache | CVE-2026-42356   | https://security-tracker.debian.org/tracker/CVE-2026-42356  
                        apache | CVE-2026-63718   | https://security-tracker.debian.org/tracker/CVE-2026-63718  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
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
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                        brotli | CVE-2026-111497  | https://security-tracker.debian.org/tracker/CVE-2026-111497 
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2026-55480   | https://security-tracker.debian.org/tracker/CVE-2026-55480  
                          cups | CVE-2026-55453   | https://security-tracker.debian.org/tracker/CVE-2026-55453  
                          cups | CVE-2026-55467   | https://security-tracker.debian.org/tracker/CVE-2026-55467  
                          cups | CVE-2026-61702   | https://security-tracker.debian.org/tracker/CVE-2026-61702  
                          cups | CVE-2026-107885  | https://security-tracker.debian.org/tracker/CVE-2026-107885 
                          cups | CVE-2026-107890  | https://security-tracker.debian.org/tracker/CVE-2026-107890 
                          cups | CVE-2026-107886  | https://security-tracker.debian.org/tracker/CVE-2026-107886 
                          cups | CVE-2026-107888  | https://security-tracker.debian.org/tracker/CVE-2026-107888 
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
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
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                          exim | CVE-2026-94057   | https://security-tracker.debian.org/tracker/CVE-2026-94057  
                          exim | CVE-2026-94056   | https://security-tracker.debian.org/tracker/CVE-2026-94056  
                          exim | CVE-2026-94054   | https://security-tracker.debian.org/tracker/CVE-2026-94054  
                          exim | CVE-2026-94055   | https://security-tracker.debian.org/tracker/CVE-2026-94055  
                         expat | CVE-2026-115506  | https://security-tracker.debian.org/tracker/CVE-2026-115506 
                         expat | CVE-2026-117610  | https://security-tracker.debian.org/tracker/CVE-2026-117610 
                         expat | CVE-2026-113351  | https://security-tracker.debian.org/tracker/CVE-2026-113351 
                         expat | CVE-2026-118370  | https://security-tracker.debian.org/tracker/CVE-2026-118370 
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-30754   | https://security-tracker.debian.org/tracker/CVE-2026-30754  
                        ffmpeg | CVE-2026-96611   | https://security-tracker.debian.org/tracker/CVE-2026-96611  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-52297   | https://security-tracker.debian.org/tracker/CVE-2026-52297  
                        ffmpeg | CVE-2026-52296   | https://security-tracker.debian.org/tracker/CVE-2026-52296  
                        ffmpeg | CVE-2026-52295   | https://security-tracker.debian.org/tracker/CVE-2026-52295  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-107696  | https://security-tracker.debian.org/tracker/CVE-2026-107696 
                        ffmpeg | CVE-2026-107675  | https://security-tracker.debian.org/tracker/CVE-2026-107675 
                        ffmpeg | CVE-2026-107698  | https://security-tracker.debian.org/tracker/CVE-2026-107698 
                        ffmpeg | CVE-2026-107676  | https://security-tracker.debian.org/tracker/CVE-2026-107676 
                        ffmpeg | CVE-2026-107695  | https://security-tracker.debian.org/tracker/CVE-2026-107695 
                        ffmpeg | CVE-2026-107678  | https://security-tracker.debian.org/tracker/CVE-2026-107678 
                        ffmpeg | CVE-2026-107677  | https://security-tracker.debian.org/tracker/CVE-2026-107677 
                        ffmpeg | CVE-2026-107660  | https://security-tracker.debian.org/tracker/CVE-2026-107660 
                        ffmpeg | CVE-2026-107697  | https://security-tracker.debian.org/tracker/CVE-2026-107697 
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-55648   | https://security-tracker.debian.org/tracker/CVE-2026-55648  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-91962   | https://security-tracker.debian.org/tracker/CVE-2026-91962  
                       freerdp | CVE-2026-91960   | https://security-tracker.debian.org/tracker/CVE-2026-91960  
                       freerdp | CVE-2026-91954   | https://security-tracker.debian.org/tracker/CVE-2026-91954  
                       freerdp | CVE-2026-91961   | https://security-tracker.debian.org/tracker/CVE-2026-91961  
                       freerdp | CVE-2026-91946   | https://security-tracker.debian.org/tracker/CVE-2026-91946  
                       freerdp | CVE-2026-91947   | https://security-tracker.debian.org/tracker/CVE-2026-91947  
                       freerdp | CVE-2026-91957   | https://security-tracker.debian.org/tracker/CVE-2026-91957  
                       freerdp | CVE-2026-91959   | https://security-tracker.debian.org/tracker/CVE-2026-91959  
                       freerdp | CVE-2026-91956   | https://security-tracker.debian.org/tracker/CVE-2026-91956  
                       freerdp | CVE-2026-91955   | https://security-tracker.debian.org/tracker/CVE-2026-91955  
                       freerdp | CVE-2026-91950   | https://security-tracker.debian.org/tracker/CVE-2026-91950  
                       freerdp | CVE-2026-91964   | https://security-tracker.debian.org/tracker/CVE-2026-91964  
                       freerdp | CVE-2026-91963   | https://security-tracker.debian.org/tracker/CVE-2026-91963  
                       freerdp | CVE-2026-91953   | https://security-tracker.debian.org/tracker/CVE-2026-91953  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-109677  | https://security-tracker.debian.org/tracker/CVE-2026-109677 
                       freerdp | CVE-2026-68579   | https://security-tracker.debian.org/tracker/CVE-2026-68579  
                       freerdp | CVE-2026-68580   | https://security-tracker.debian.org/tracker/CVE-2026-68580  
                       freerdp | CVE-2026-110832  | https://security-tracker.debian.org/tracker/CVE-2026-110832 
                       freerdp | CVE-2026-110837  | https://security-tracker.debian.org/tracker/CVE-2026-110837 
                       freerdp | CVE-2026-110834  | https://security-tracker.debian.org/tracker/CVE-2026-110834 
                       freerdp | CVE-2026-110830  | https://security-tracker.debian.org/tracker/CVE-2026-110830 
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67290   | https://security-tracker.debian.org/tracker/CVE-2026-67290  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67289   | https://security-tracker.debian.org/tracker/CVE-2026-67289  
                       freerdp | CVE-2026-67293   | https://security-tracker.debian.org/tracker/CVE-2026-67293  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67295   | https://security-tracker.debian.org/tracker/CVE-2026-67295  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67298   | https://security-tracker.debian.org/tracker/CVE-2026-67298  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-55191   | https://security-tracker.debian.org/tracker/CVE-2026-55191  
                       freerdp | CVE-2026-55192   | https://security-tracker.debian.org/tracker/CVE-2026-55192  
                       freerdp | CVE-2026-55193   | https://security-tracker.debian.org/tracker/CVE-2026-55193  
                       freerdp | CVE-2026-55194   | https://security-tracker.debian.org/tracker/CVE-2026-55194  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-121411  | https://security-tracker.debian.org/tracker/CVE-2026-121411 
                       freerdp | CVE-2026-121406  | https://security-tracker.debian.org/tracker/CVE-2026-121406 
                       freerdp | CVE-2026-121407  | https://security-tracker.debian.org/tracker/CVE-2026-121407 
                       freerdp | CVE-2026-121408  | https://security-tracker.debian.org/tracker/CVE-2026-121408 
                       freerdp | CVE-2026-121409  | https://security-tracker.debian.org/tracker/CVE-2026-121409 
                       freerdp | CVE-2026-121403  | https://security-tracker.debian.org/tracker/CVE-2026-121403 
                       freerdp | CVE-2026-121405  | https://security-tracker.debian.org/tracker/CVE-2026-121405 
                       freerdp | CVE-2026-121404  | https://security-tracker.debian.org/tracker/CVE-2026-121404 
                       freerdp | CVE-2026-121401  | https://security-tracker.debian.org/tracker/CVE-2026-121401 
                       freerdp | CVE-2026-121402  | https://security-tracker.debian.org/tracker/CVE-2026-121402 
                       freerdp | CVE-2026-121410  | https://security-tracker.debian.org/tracker/CVE-2026-121410 
                       freerdp | CVE-2026-121400  | https://security-tracker.debian.org/tracker/CVE-2026-121400 
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-111373  | https://security-tracker.debian.org/tracker/CVE-2026-111373 
                       freerdp | CVE-2026-111382  | https://security-tracker.debian.org/tracker/CVE-2026-111382 
                       freerdp | CVE-2026-111381  | https://security-tracker.debian.org/tracker/CVE-2026-111381 
                       freerdp | CVE-2026-111379  | https://security-tracker.debian.org/tracker/CVE-2026-111379 
                       freerdp | CVE-2026-111377  | https://security-tracker.debian.org/tracker/CVE-2026-111377 
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67303   | https://security-tracker.debian.org/tracker/CVE-2026-67303  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67300   | https://security-tracker.debian.org/tracker/CVE-2026-67300  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-109247  | https://security-tracker.debian.org/tracker/CVE-2026-109247 
                       freerdp | CVE-2026-109254  | https://security-tracker.debian.org/tracker/CVE-2026-109254 
                       freerdp | CVE-2026-109242  | https://security-tracker.debian.org/tracker/CVE-2026-109242 
                       freerdp | CVE-2026-109241  | https://security-tracker.debian.org/tracker/CVE-2026-109241 
                       freerdp | CVE-2026-109244  | https://security-tracker.debian.org/tracker/CVE-2026-109244 
                       freerdp | CVE-2026-109251  | https://security-tracker.debian.org/tracker/CVE-2026-109251 
                       freerdp | CVE-2026-109246  | https://security-tracker.debian.org/tracker/CVE-2026-109246 
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-121386  | https://security-tracker.debian.org/tracker/CVE-2026-121386 
                       freerdp | CVE-2026-121392  | https://security-tracker.debian.org/tracker/CVE-2026-121392 
                       freerdp | CVE-2026-121387  | https://security-tracker.debian.org/tracker/CVE-2026-121387 
                       freerdp | CVE-2026-121399  | https://security-tracker.debian.org/tracker/CVE-2026-121399 
                       freerdp | CVE-2026-121397  | https://security-tracker.debian.org/tracker/CVE-2026-121397 
                       freerdp | CVE-2026-121398  | https://security-tracker.debian.org/tracker/CVE-2026-121398 
                       freerdp | CVE-2026-73242   | https://security-tracker.debian.org/tracker/CVE-2026-73242  
                       freerdp | CVE-2026-73241   | https://security-tracker.debian.org/tracker/CVE-2026-73241  
                       freerdp | CVE-2026-109941  | https://security-tracker.debian.org/tracker/CVE-2026-109941 
                       freerdp | CVE-2026-109942  | https://security-tracker.debian.org/tracker/CVE-2026-109942 
                       freerdp | CVE-2026-63633   | https://security-tracker.debian.org/tracker/CVE-2026-63633  
                       freerdp | CVE-2026-63652   | https://security-tracker.debian.org/tracker/CVE-2026-63652  
                       freerdp | CVE-2026-63117   | https://security-tracker.debian.org/tracker/CVE-2026-63117  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-66402   | https://security-tracker.debian.org/tracker/CVE-2026-66402  
                       freerdp | CVE-2026-55564   | https://security-tracker.debian.org/tracker/CVE-2026-55564  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                       freerdp | CVE-2026-121963  | https://security-tracker.debian.org/tracker/CVE-2026-121963 
                       freerdp | CVE-2026-121955  | https://security-tracker.debian.org/tracker/CVE-2026-121955 
                       freerdp | CVE-2026-121950  | https://security-tracker.debian.org/tracker/CVE-2026-121950 
                       freerdp | CVE-2026-121957  | https://security-tracker.debian.org/tracker/CVE-2026-121957 
                       freerdp | CVE-2026-121964  | https://security-tracker.debian.org/tracker/CVE-2026-121964 
                       freerdp | CVE-2026-121956  | https://security-tracker.debian.org/tracker/CVE-2026-121956 
                       freerdp | CVE-2026-121959  | https://security-tracker.debian.org/tracker/CVE-2026-121959 
                       freerdp | CVE-2026-121961  | https://security-tracker.debian.org/tracker/CVE-2026-121961 
                       freerdp | CVE-2026-121958  | https://security-tracker.debian.org/tracker/CVE-2026-121958 
                       freerdp | CVE-2026-121962  | https://security-tracker.debian.org/tracker/CVE-2026-121962 
                       freerdp | CVE-2026-121952  | https://security-tracker.debian.org/tracker/CVE-2026-121952 
                       freerdp | CVE-2026-121953  | https://security-tracker.debian.org/tracker/CVE-2026-121953 
                       freerdp | CVE-2026-121954  | https://security-tracker.debian.org/tracker/CVE-2026-121954 
                       freerdp | CVE-2026-121960  | https://security-tracker.debian.org/tracker/CVE-2026-121960 
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                          gawk | CVE-2026-40553   | https://security-tracker.debian.org/tracker/CVE-2026-40553  
                          gawk | CVE-2026-40468   | https://security-tracker.debian.org/tracker/CVE-2026-40468  
                          gawk | CVE-2026-40469   | https://security-tracker.debian.org/tracker/CVE-2026-40469  
                          gawk | CVE-2026-40467   | https://security-tracker.debian.org/tracker/CVE-2026-40467  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                    gdk-pixbuf | CVE-2026-5201    | https://security-tracker.debian.org/tracker/CVE-2026-5201   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          gpsd | CVE-2026-58459   | https://security-tracker.debian.org/tracker/CVE-2026-58459  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-91101   | https://security-tracker.debian.org/tracker/CVE-2026-91101  
                         hplip | CVE-2026-91102   | https://security-tracker.debian.org/tracker/CVE-2026-91102  
                         hplip | CVE-2026-91105   | https://security-tracker.debian.org/tracker/CVE-2026-91105  
                         hplip | CVE-2026-91106   | https://security-tracker.debian.org/tracker/CVE-2026-91106  
                         hplip | CVE-2026-91103   | https://security-tracker.debian.org/tracker/CVE-2026-91103  
                         hplip | CVE-2026-91104   | https://security-tracker.debian.org/tracker/CVE-2026-91104  
                         hplip | CVE-2026-91100   | https://security-tracker.debian.org/tracker/CVE-2026-91100  
                         hplip | CVE-2026-91099   | https://security-tracker.debian.org/tracker/CVE-2026-91099  
                         hplip | CVE-2026-91098   | https://security-tracker.debian.org/tracker/CVE-2026-91098  
                         hplip | CVE-2026-91097   | https://security-tracker.debian.org/tracker/CVE-2026-91097  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-93590   | https://security-tracker.debian.org/tracker/CVE-2026-93590  
                   imagemagick | CVE-2026-93586   | https://security-tracker.debian.org/tracker/CVE-2026-93586  
                   imagemagick | CVE-2026-93587   | https://security-tracker.debian.org/tracker/CVE-2026-93587  
                   imagemagick | CVE-2026-93589   | https://security-tracker.debian.org/tracker/CVE-2026-93589  
                   imagemagick | CVE-2026-93588   | https://security-tracker.debian.org/tracker/CVE-2026-93588  
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-108693  | https://security-tracker.debian.org/tracker/CVE-2026-108693 
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-116154  | https://security-tracker.debian.org/tracker/CVE-2026-116154 
                   imagemagick | CVE-2026-116152  | https://security-tracker.debian.org/tracker/CVE-2026-116152 
                   imagemagick | CVE-2026-116149  | https://security-tracker.debian.org/tracker/CVE-2026-116149 
                   imagemagick | CVE-2026-116142  | https://security-tracker.debian.org/tracker/CVE-2026-116142 
                   imagemagick | CVE-2026-116155  | https://security-tracker.debian.org/tracker/CVE-2026-116155 
                   imagemagick | CVE-2026-116151  | https://security-tracker.debian.org/tracker/CVE-2026-116151 
                   imagemagick | CVE-2026-116159  | https://security-tracker.debian.org/tracker/CVE-2026-116159 
                   imagemagick | CVE-2026-116143  | https://security-tracker.debian.org/tracker/CVE-2026-116143 
                   imagemagick | CVE-2026-116140  | https://security-tracker.debian.org/tracker/CVE-2026-116140 
                   imagemagick | CVE-2026-116148  | https://security-tracker.debian.org/tracker/CVE-2026-116148 
                   imagemagick | CVE-2026-116156  | https://security-tracker.debian.org/tracker/CVE-2026-116156 
                   imagemagick | CVE-2026-116146  | https://security-tracker.debian.org/tracker/CVE-2026-116146 
                   imagemagick | CVE-2026-116157  | https://security-tracker.debian.org/tracker/CVE-2026-116157 
                   imagemagick | CVE-2026-116145  | https://security-tracker.debian.org/tracker/CVE-2026-116145 
                   imagemagick | CVE-2026-116144  | https://security-tracker.debian.org/tracker/CVE-2026-116144 
                   imagemagick | CVE-2026-116141  | https://security-tracker.debian.org/tracker/CVE-2026-116141 
                   imagemagick | CVE-2026-116158  | https://security-tracker.debian.org/tracker/CVE-2026-116158 
                   imagemagick | CVE-2026-116153  | https://security-tracker.debian.org/tracker/CVE-2026-116153 
                   imagemagick | CVE-2026-116147  | https://security-tracker.debian.org/tracker/CVE-2026-116147 
                   imagemagick | CVE-2026-116160  | https://security-tracker.debian.org/tracker/CVE-2026-116160 
                   imagemagick | CVE-2026-116150  | https://security-tracker.debian.org/tracker/CVE-2026-116150 
                   imagemagick | CVE-2026-107209  | https://security-tracker.debian.org/tracker/CVE-2026-107209 
                   imagemagick | CVE-2026-107208  | https://security-tracker.debian.org/tracker/CVE-2026-107208 
                   imagemagick | CVE-2026-107210  | https://security-tracker.debian.org/tracker/CVE-2026-107210 
                   imagemagick | CVE-2026-105083  | https://security-tracker.debian.org/tracker/CVE-2026-105083 
                   imagemagick | CVE-2026-105081  | https://security-tracker.debian.org/tracker/CVE-2026-105081 
                   imagemagick | CVE-2026-106569  | https://security-tracker.debian.org/tracker/CVE-2026-106569 
                   imagemagick | CVE-2026-106574  | https://security-tracker.debian.org/tracker/CVE-2026-106574 
                   imagemagick | CVE-2026-106566  | https://security-tracker.debian.org/tracker/CVE-2026-106566 
                   imagemagick | CVE-2026-106580  | https://security-tracker.debian.org/tracker/CVE-2026-106580 
                   imagemagick | CVE-2026-106567  | https://security-tracker.debian.org/tracker/CVE-2026-106567 
                   imagemagick | CVE-2026-106568  | https://security-tracker.debian.org/tracker/CVE-2026-106568 
                   imagemagick | CVE-2026-106578  | https://security-tracker.debian.org/tracker/CVE-2026-106578 
                   imagemagick | CVE-2026-106571  | https://security-tracker.debian.org/tracker/CVE-2026-106571 
                   imagemagick | CVE-2026-106565  | https://security-tracker.debian.org/tracker/CVE-2026-106565 
                   imagemagick | CVE-2026-106572  | https://security-tracker.debian.org/tracker/CVE-2026-106572 
                   imagemagick | CVE-2026-106575  | https://security-tracker.debian.org/tracker/CVE-2026-106575 
                   imagemagick | CVE-2026-106564  | https://security-tracker.debian.org/tracker/CVE-2026-106564 
                   imagemagick | CVE-2026-106576  | https://security-tracker.debian.org/tracker/CVE-2026-106576 
                   imagemagick | CVE-2026-106570  | https://security-tracker.debian.org/tracker/CVE-2026-106570 
                   imagemagick | CVE-2026-106573  | https://security-tracker.debian.org/tracker/CVE-2026-106573 
                   imagemagick | CVE-2026-106577  | https://security-tracker.debian.org/tracker/CVE-2026-106577 
                   imagemagick | CVE-2026-106579  | https://security-tracker.debian.org/tracker/CVE-2026-106579 
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-119123  | https://security-tracker.debian.org/tracker/CVE-2026-119123 
                   imagemagick | CVE-2026-119124  | https://security-tracker.debian.org/tracker/CVE-2026-119124 
                   imagemagick | CVE-2026-109270  | https://security-tracker.debian.org/tracker/CVE-2026-109270 
                   imagemagick | CVE-2026-109268  | https://security-tracker.debian.org/tracker/CVE-2026-109268 
                   imagemagick | CVE-2026-109262  | https://security-tracker.debian.org/tracker/CVE-2026-109262 
                   imagemagick | CVE-2026-109282  | https://security-tracker.debian.org/tracker/CVE-2026-109282 
                   imagemagick | CVE-2026-109279  | https://security-tracker.debian.org/tracker/CVE-2026-109279 
                   imagemagick | CVE-2026-109280  | https://security-tracker.debian.org/tracker/CVE-2026-109280 
                   imagemagick | CVE-2026-109266  | https://security-tracker.debian.org/tracker/CVE-2026-109266 
                   imagemagick | CVE-2026-109259  | https://security-tracker.debian.org/tracker/CVE-2026-109259 
                   imagemagick | CVE-2026-109261  | https://security-tracker.debian.org/tracker/CVE-2026-109261 
                   imagemagick | CVE-2026-109258  | https://security-tracker.debian.org/tracker/CVE-2026-109258 
                   imagemagick | CVE-2026-109281  | https://security-tracker.debian.org/tracker/CVE-2026-109281 
                   imagemagick | CVE-2026-109277  | https://security-tracker.debian.org/tracker/CVE-2026-109277 
                   imagemagick | CVE-2026-109265  | https://security-tracker.debian.org/tracker/CVE-2026-109265 
                   imagemagick | CVE-2026-109275  | https://security-tracker.debian.org/tracker/CVE-2026-109275 
                   imagemagick | CVE-2026-109273  | https://security-tracker.debian.org/tracker/CVE-2026-109273 
                   imagemagick | CVE-2026-109267  | https://security-tracker.debian.org/tracker/CVE-2026-109267 
                   imagemagick | CVE-2026-109260  | https://security-tracker.debian.org/tracker/CVE-2026-109260 
                   imagemagick | CVE-2026-109263  | https://security-tracker.debian.org/tracker/CVE-2026-109263 
                   imagemagick | CVE-2026-109278  | https://security-tracker.debian.org/tracker/CVE-2026-109278 
                   imagemagick | CVE-2026-109264  | https://security-tracker.debian.org/tracker/CVE-2026-109264 
                   imagemagick | CVE-2026-109269  | https://security-tracker.debian.org/tracker/CVE-2026-109269 
                   imagemagick | CVE-2026-109274  | https://security-tracker.debian.org/tracker/CVE-2026-109274 
                   imagemagick | CVE-2026-109272  | https://security-tracker.debian.org/tracker/CVE-2026-109272 
                   imagemagick | CVE-2026-109276  | https://security-tracker.debian.org/tracker/CVE-2026-109276 
                   imagemagick | CVE-2026-102635  | https://security-tracker.debian.org/tracker/CVE-2026-102635 
                   imagemagick | CVE-2026-109964  | https://security-tracker.debian.org/tracker/CVE-2026-109964 
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                      libglib2 | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                    libopenssl | CVE-2026-42772   | https://security-tracker.debian.org/tracker/CVE-2026-42772  
                    libopenssl | CVE-2026-84784   | https://security-tracker.debian.org/tracker/CVE-2026-84784  
                    libopenssl | CVE-2026-84782   | https://security-tracker.debian.org/tracker/CVE-2026-84782  
                    libopenssl | CVE-2026-72897   | https://security-tracker.debian.org/tracker/CVE-2026-72897  
                    libopenssl | CVE-2026-35189   | https://security-tracker.debian.org/tracker/CVE-2026-35189  
                    libopenssl | CVE-2026-35191   | https://security-tracker.debian.org/tracker/CVE-2026-35191  
                    libopenssl | CVE-2026-75806   | https://security-tracker.debian.org/tracker/CVE-2026-75806  
                    libopenssl | CVE-2026-75804   | https://security-tracker.debian.org/tracker/CVE-2026-75804  
                    libopenssl | CVE-2026-75805   | https://security-tracker.debian.org/tracker/CVE-2026-75805  
                    libopenssl | CVE-2026-54875   | https://security-tracker.debian.org/tracker/CVE-2026-54875  
                    libopenssl | CVE-2026-54872   | https://security-tracker.debian.org/tracker/CVE-2026-54872  
                    libopenssl | CVE-2026-54873   | https://security-tracker.debian.org/tracker/CVE-2026-54873  
                    libopenssl | CVE-2026-77696   | https://security-tracker.debian.org/tracker/CVE-2026-77696  
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libpjsip | CVE-2026-84975   | https://security-tracker.debian.org/tracker/CVE-2026-84975  
                      libpjsip | CVE-2026-77396   | https://security-tracker.debian.org/tracker/CVE-2026-77396  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libsoup | CVE-2026-102560  | https://security-tracker.debian.org/tracker/CVE-2026-102560 
                       libsoup | CVE-2026-102558  | https://security-tracker.debian.org/tracker/CVE-2026-102558 
                       libsoup | CVE-2026-102555  | https://security-tracker.debian.org/tracker/CVE-2026-102555 
                       libsoup | CVE-2026-102556  | https://security-tracker.debian.org/tracker/CVE-2026-102556 
                       libsoup | CVE-2026-102559  | https://security-tracker.debian.org/tracker/CVE-2026-102559 
                       libsoup | CVE-2026-102557  | https://security-tracker.debian.org/tracker/CVE-2026-102557 
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-43631   | https://security-tracker.debian.org/tracker/CVE-2026-43631  
                     llama-cpp | CVE-2026-43628   | https://security-tracker.debian.org/tracker/CVE-2026-43628  
                     llama-cpp | CVE-2026-43632   | https://security-tracker.debian.org/tracker/CVE-2026-43632  
                     llama-cpp | CVE-2026-43629   | https://security-tracker.debian.org/tracker/CVE-2026-43629  
                     llama-cpp | CVE-2026-43627   | https://security-tracker.debian.org/tracker/CVE-2026-43627  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-97380   | https://security-tracker.debian.org/tracker/CVE-2026-97380  
                       mariadb | CVE-2026-92262   | https://security-tracker.debian.org/tracker/CVE-2026-92262  
                       mariadb | CVE-2026-85745   | https://security-tracker.debian.org/tracker/CVE-2026-85745  
                       mariadb | CVE-2026-85746   | https://security-tracker.debian.org/tracker/CVE-2026-85746  
                       mariadb | CVE-2026-85985   | https://security-tracker.debian.org/tracker/CVE-2026-85985  
                       mariadb | CVE-2026-86047   | https://security-tracker.debian.org/tracker/CVE-2026-86047  
                       mariadb | CVE-2026-107822  | https://security-tracker.debian.org/tracker/CVE-2026-107822 
                       mariadb | CVE-2026-107823  | https://security-tracker.debian.org/tracker/CVE-2026-107823 
                       mariadb | CVE-2026-107814  | https://security-tracker.debian.org/tracker/CVE-2026-107814 
                       mariadb | CVE-2026-107816  | https://security-tracker.debian.org/tracker/CVE-2026-107816 
                       mariadb | CVE-2026-107818  | https://security-tracker.debian.org/tracker/CVE-2026-107818 
                       mariadb | CVE-2026-107817  | https://security-tracker.debian.org/tracker/CVE-2026-107817 
                       mariadb | CVE-2026-107815  | https://security-tracker.debian.org/tracker/CVE-2026-107815 
                       mariadb | CVE-2026-107821  | https://security-tracker.debian.org/tracker/CVE-2026-107821 
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          nmap | CVE-2026-0011    | https://security-tracker.debian.org/tracker/CVE-2026-0011   
                    nodejs-bin | CVE-2026-111497  | https://security-tracker.debian.org/tracker/CVE-2026-111497 
                    nodejs-src | CVE-2026-111497  | https://security-tracker.debian.org/tracker/CVE-2026-111497 
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
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
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-106587  | https://security-tracker.debian.org/tracker/CVE-2026-106587 
                       openssh | CVE-2026-106583  | https://security-tracker.debian.org/tracker/CVE-2026-106583 
                       openssh | CVE-2026-106582  | https://security-tracker.debian.org/tracker/CVE-2026-106582 
                       openssh | CVE-2026-106584  | https://security-tracker.debian.org/tracker/CVE-2026-106584 
                       openssh | CVE-2026-106553  | https://security-tracker.debian.org/tracker/CVE-2026-106553 
                       openssh | CVE-2026-106555  | https://security-tracker.debian.org/tracker/CVE-2026-106555 
                       openssh | CVE-2026-106585  | https://security-tracker.debian.org/tracker/CVE-2026-106585 
                       openssh | CVE-2026-106552  | https://security-tracker.debian.org/tracker/CVE-2026-106552 
                       openssh | CVE-2026-106586  | https://security-tracker.debian.org/tracker/CVE-2026-106586 
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                         pcre2 | CVE-2026-89158   | https://security-tracker.debian.org/tracker/CVE-2026-89158  
                         pcre2 | CVE-2026-89162   | https://security-tracker.debian.org/tracker/CVE-2026-89162  
                         pcre2 | CVE-2026-89161   | https://security-tracker.debian.org/tracker/CVE-2026-89161  
                         pcre2 | CVE-2026-89160   | https://security-tracker.debian.org/tracker/CVE-2026-89160  
                         pcre2 | CVE-2026-89157   | https://security-tracker.debian.org/tracker/CVE-2026-89157  
                         pcre2 | CVE-2026-89156   | https://security-tracker.debian.org/tracker/CVE-2026-89156  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2025-1218    | https://security-tracker.debian.org/tracker/CVE-2025-1218   
                           php | CVE-2025-14181   | https://security-tracker.debian.org/tracker/CVE-2025-14181  
                           php | CVE-2026-109619  | https://security-tracker.debian.org/tracker/CVE-2026-109619 
                           php | CVE-2026-109618  | https://security-tracker.debian.org/tracker/CVE-2026-109618 
                           php | CVE-2026-6103    | https://security-tracker.debian.org/tracker/CVE-2026-6103   
                           php | CVE-2026-93682   | https://security-tracker.debian.org/tracker/CVE-2026-93682  
                           php | CVE-2026-91765   | https://security-tracker.debian.org/tracker/CVE-2026-91765  
                           php | CVE-2026-91768   | https://security-tracker.debian.org/tracker/CVE-2026-91768  
                           php | CVE-2026-91766   | https://security-tracker.debian.org/tracker/CVE-2026-91766  
                           php | CVE-2026-91767   | https://security-tracker.debian.org/tracker/CVE-2026-91767  
                           php | CVE-2026-91769   | https://security-tracker.debian.org/tracker/CVE-2026-91769  
                           php | CVE-2026-92842   | https://security-tracker.debian.org/tracker/CVE-2026-92842  
                           php | CVE-2026-17545   | https://security-tracker.debian.org/tracker/CVE-2026-17545  
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-96778   | https://security-tracker.debian.org/tracker/CVE-2026-96778  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-96640   | https://security-tracker.debian.org/tracker/CVE-2026-96640  
                 python-pillow | CVE-2026-96642   | https://security-tracker.debian.org/tracker/CVE-2026-96642  
                 python-pillow | CVE-2026-96637   | https://security-tracker.debian.org/tracker/CVE-2026-96637  
                 python-pillow | CVE-2026-96643   | https://security-tracker.debian.org/tracker/CVE-2026-96643  
                 python-pillow | CVE-2026-96644   | https://security-tracker.debian.org/tracker/CVE-2026-96644  
                 python-pillow | CVE-2026-96638   | https://security-tracker.debian.org/tracker/CVE-2026-96638  
                 python-pillow | CVE-2026-96641   | https://security-tracker.debian.org/tracker/CVE-2026-96641  
                 python-pillow | CVE-2026-96639   | https://security-tracker.debian.org/tracker/CVE-2026-96639  
                 python-pillow | CVE-2026-96636   | https://security-tracker.debian.org/tracker/CVE-2026-96636  
                 python-pillow | CVE-2026-112895  | https://security-tracker.debian.org/tracker/CVE-2026-112895 
                 python-pillow | CVE-2026-112898  | https://security-tracker.debian.org/tracker/CVE-2026-112898 
                 python-pillow | CVE-2026-112896  | https://security-tracker.debian.org/tracker/CVE-2026-112896 
                 python-pillow | CVE-2026-112897  | https://security-tracker.debian.org/tracker/CVE-2026-112897 
                 python-pillow | CVE-2026-112894  | https://security-tracker.debian.org/tracker/CVE-2026-112894 
                 python-pillow | CVE-2026-112891  | https://security-tracker.debian.org/tracker/CVE-2026-112891 
                 python-pillow | CVE-2026-112893  | https://security-tracker.debian.org/tracker/CVE-2026-112893 
                 python-pillow | CVE-2026-112892  | https://security-tracker.debian.org/tracker/CVE-2026-112892 
                 python-pillow | CVE-2026-112400  | https://security-tracker.debian.org/tracker/CVE-2026-112400 
                 python-pillow | CVE-2026-112403  | https://security-tracker.debian.org/tracker/CVE-2026-112403 
                 python-pillow | CVE-2026-112401  | https://security-tracker.debian.org/tracker/CVE-2026-112401 
                 python-pillow | CVE-2026-112406  | https://security-tracker.debian.org/tracker/CVE-2026-112406 
                 python-pillow | CVE-2026-112405  | https://security-tracker.debian.org/tracker/CVE-2026-112405 
                 python-pillow | CVE-2026-112404  | https://security-tracker.debian.org/tracker/CVE-2026-112404 
                 python-pillow | CVE-2026-112402  | https://security-tracker.debian.org/tracker/CVE-2026-112402 
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-112390  | https://security-tracker.debian.org/tracker/CVE-2026-112390 
                 python-pillow | CVE-2026-112397  | https://security-tracker.debian.org/tracker/CVE-2026-112397 
                 python-pillow | CVE-2026-112392  | https://security-tracker.debian.org/tracker/CVE-2026-112392 
                 python-pillow | CVE-2026-112393  | https://security-tracker.debian.org/tracker/CVE-2026-112393 
                 python-pillow | CVE-2026-112399  | https://security-tracker.debian.org/tracker/CVE-2026-112399 
                 python-pillow | CVE-2026-112394  | https://security-tracker.debian.org/tracker/CVE-2026-112394 
                 python-pillow | CVE-2026-112391  | https://security-tracker.debian.org/tracker/CVE-2026-112391 
                 python-pillow | CVE-2026-112395  | https://security-tracker.debian.org/tracker/CVE-2026-112395 
                 python-pillow | CVE-2026-112396  | https://security-tracker.debian.org/tracker/CVE-2026-112396 
                 python-pillow | CVE-2026-112398  | https://security-tracker.debian.org/tracker/CVE-2026-112398 
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-112901  | https://security-tracker.debian.org/tracker/CVE-2026-112901 
                 python-pillow | CVE-2026-112900  | https://security-tracker.debian.org/tracker/CVE-2026-112900 
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-114501  | https://security-tracker.debian.org/tracker/CVE-2026-114501 
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59203   | https://security-tracker.debian.org/tracker/CVE-2026-59203  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                    python-pip | CVE-2026-13346   | https://security-tracker.debian.org/tracker/CVE-2026-13346  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-102275  | https://security-tracker.debian.org/tracker/CVE-2026-102275 
                  python-pyjwt | CVE-2026-102271  | https://security-tracker.debian.org/tracker/CVE-2026-102271 
                  python-pyjwt | CVE-2026-102274  | https://security-tracker.debian.org/tracker/CVE-2026-102274 
                  python-pyjwt | CVE-2026-102269  | https://security-tracker.debian.org/tracker/CVE-2026-102269 
                  python-pyjwt | CVE-2026-102268  | https://security-tracker.debian.org/tracker/CVE-2026-102268 
                  python-pyjwt | CVE-2026-102267  | https://security-tracker.debian.org/tracker/CVE-2026-102267 
                  python-pyjwt | CVE-2026-102270  | https://security-tracker.debian.org/tracker/CVE-2026-102270 
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
                  python-pyjwt | CVE-2026-48523   | https://security-tracker.debian.org/tracker/CVE-2026-48523  
                  python-pyjwt | CVE-2026-103001  | https://security-tracker.debian.org/tracker/CVE-2026-103001 
                  python-pyjwt | CVE-2026-101917  | https://security-tracker.debian.org/tracker/CVE-2026-101917 
                  python-pyjwt | CVE-2026-101918  | https://security-tracker.debian.org/tracker/CVE-2026-101918 
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                python-urllib3 | CVE-2026-97688   | https://security-tracker.debian.org/tracker/CVE-2026-97688  
                python-urllib3 | CVE-2026-97689   | https://security-tracker.debian.org/tracker/CVE-2026-97689  
                python-urllib3 | CVE-2026-97687   | https://security-tracker.debian.org/tracker/CVE-2026-97687  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                         rsync | CVE-2026-119741  | https://security-tracker.debian.org/tracker/CVE-2026-119741 
                          ruby | CVE-2026-97229   | https://security-tracker.debian.org/tracker/CVE-2026-97229  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
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
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sqlite | CVE-2026-119379  | https://security-tracker.debian.org/tracker/CVE-2026-119379 
                        sqlite | CVE-2026-119377  | https://security-tracker.debian.org/tracker/CVE-2026-119377 
                        sqlite | CVE-2026-119376  | https://security-tracker.debian.org/tracker/CVE-2026-119376 
                        sqlite | CVE-2026-119371  | https://security-tracker.debian.org/tracker/CVE-2026-119371 
                        sqlite | CVE-2026-119373  | https://security-tracker.debian.org/tracker/CVE-2026-119373 
                        sqlite | CVE-2026-119375  | https://security-tracker.debian.org/tracker/CVE-2026-119375 
                        sqlite | CVE-2026-119378  | https://security-tracker.debian.org/tracker/CVE-2026-119378 
                        sqlite | CVE-2026-119374  | https://security-tracker.debian.org/tracker/CVE-2026-119374 
                        sqlite | CVE-2026-119372  | https://security-tracker.debian.org/tracker/CVE-2026-119372 
                        sqlite | CVE-2026-119591  | https://security-tracker.debian.org/tracker/CVE-2026-119591 
                        sqlite | CVE-2026-119586  | https://security-tracker.debian.org/tracker/CVE-2026-119586 
                    strongswan | CVE-2026-78132   | https://security-tracker.debian.org/tracker/CVE-2026-78132  
                    strongswan | CVE-2026-78126   | https://security-tracker.debian.org/tracker/CVE-2026-78126  
                    strongswan | CVE-2026-78131   | https://security-tracker.debian.org/tracker/CVE-2026-78131  
                    strongswan | CVE-2026-78133   | https://security-tracker.debian.org/tracker/CVE-2026-78133  
                    strongswan | CVE-2026-78123   | https://security-tracker.debian.org/tracker/CVE-2026-78123  
                    strongswan | CVE-2026-78135   | https://security-tracker.debian.org/tracker/CVE-2026-78135  
                    strongswan | CVE-2026-78134   | https://security-tracker.debian.org/tracker/CVE-2026-78134  
                    strongswan | CVE-2026-78124   | https://security-tracker.debian.org/tracker/CVE-2026-78124  
                    strongswan | CVE-2026-78127   | https://security-tracker.debian.org/tracker/CVE-2026-78127  
                    strongswan | CVE-2026-78130   | https://security-tracker.debian.org/tracker/CVE-2026-78130  
                    strongswan | CVE-2026-78129   | https://security-tracker.debian.org/tracker/CVE-2026-78129  
                      suricata | CVE-2026-57225   | https://security-tracker.debian.org/tracker/CVE-2026-57225  
                      suricata | CVE-2026-57223   | https://security-tracker.debian.org/tracker/CVE-2026-57223  
                      suricata | CVE-2026-57222   | https://security-tracker.debian.org/tracker/CVE-2026-57222  
                      suricata | CVE-2026-57224   | https://security-tracker.debian.org/tracker/CVE-2026-57224  
                      suricata | CVE-2026-57226   | https://security-tracker.debian.org/tracker/CVE-2026-57226  
                      suricata | CVE-2026-57229   | https://security-tracker.debian.org/tracker/CVE-2026-57229  
                      suricata | CVE-2026-57227   | https://security-tracker.debian.org/tracker/CVE-2026-57227  
                      suricata | CVE-2026-94083   | https://security-tracker.debian.org/tracker/CVE-2026-94083  
                      suricata | CVE-2026-94084   | https://security-tracker.debian.org/tracker/CVE-2026-94084  
                      suricata | CVE-2026-46387   | https://security-tracker.debian.org/tracker/CVE-2026-46387  
                      suricata | CVE-2026-46352   | https://security-tracker.debian.org/tracker/CVE-2026-46352  
                      suricata | CVE-2026-63446   | https://security-tracker.debian.org/tracker/CVE-2026-63446  
                      suricata | CVE-2026-63449   | https://security-tracker.debian.org/tracker/CVE-2026-63449  
                      suricata | CVE-2026-63450   | https://security-tracker.debian.org/tracker/CVE-2026-63450  
                      suricata | CVE-2026-63451   | https://security-tracker.debian.org/tracker/CVE-2026-63451  
                      suricata | CVE-2026-63448   | https://security-tracker.debian.org/tracker/CVE-2026-63448  
                      suricata | CVE-2026-63452   | https://security-tracker.debian.org/tracker/CVE-2026-63452  
                      suricata | CVE-2026-45759   | https://security-tracker.debian.org/tracker/CVE-2026-45759  
                      suricata | CVE-2026-45764   | https://security-tracker.debian.org/tracker/CVE-2026-45764  
                      suricata | CVE-2026-45751   | https://security-tracker.debian.org/tracker/CVE-2026-45751  
                      suricata | CVE-2026-45766   | https://security-tracker.debian.org/tracker/CVE-2026-45766  
                      suricata | CVE-2026-45752   | https://security-tracker.debian.org/tracker/CVE-2026-45752  
                      suricata | CVE-2026-45763   | https://security-tracker.debian.org/tracker/CVE-2026-45763  
                      suricata | CVE-2026-45762   | https://security-tracker.debian.org/tracker/CVE-2026-45762  
                      suricata | CVE-2026-45767   | https://security-tracker.debian.org/tracker/CVE-2026-45767  
                      suricata | CVE-2026-45761   | https://security-tracker.debian.org/tracker/CVE-2026-45761  
                      suricata | CVE-2026-45770   | https://security-tracker.debian.org/tracker/CVE-2026-45770  
                      suricata | CVE-2026-45768   | https://security-tracker.debian.org/tracker/CVE-2026-45768  
                      suricata | CVE-2026-45765   | https://security-tracker.debian.org/tracker/CVE-2026-45765  
                      suricata | CVE-2026-45769   | https://security-tracker.debian.org/tracker/CVE-2026-45769  
                      suricata | CVE-2026-71855   | https://security-tracker.debian.org/tracker/CVE-2026-71855  
                      suricata | CVE-2026-71418   | https://security-tracker.debian.org/tracker/CVE-2026-71418  
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                        thrift | CVE-2026-41608   | https://security-tracker.debian.org/tracker/CVE-2026-41608  
                        thrift | CVE-2026-58023   | https://security-tracker.debian.org/tracker/CVE-2026-58023  
                        thrift | CVE-2026-49158   | https://security-tracker.debian.org/tracker/CVE-2026-49158  
                        thrift | CVE-2026-48586   | https://security-tracker.debian.org/tracker/CVE-2026-48586  
                        thrift | CVE-2026-45112   | https://security-tracker.debian.org/tracker/CVE-2026-45112  
                        thrift | CVE-2026-43871   | https://security-tracker.debian.org/tracker/CVE-2026-43871  
                        thrift | CVE-2026-55968   | https://security-tracker.debian.org/tracker/CVE-2026-55968  
                        thrift | CVE-2026-55970   | https://security-tracker.debian.org/tracker/CVE-2026-55970  
                        thrift | CVE-2026-55969   | https://security-tracker.debian.org/tracker/CVE-2026-55969  
                        thrift | CVE-2026-55971   | https://security-tracker.debian.org/tracker/CVE-2026-55971  
                        thrift | CVE-2026-58389   | https://security-tracker.debian.org/tracker/CVE-2026-58389  
                        thrift | CVE-2026-66053   | https://security-tracker.debian.org/tracker/CVE-2026-66053  
                        thrift | CVE-2026-58662   | https://security-tracker.debian.org/tracker/CVE-2026-58662  
                        thrift | CVE-2026-48145   | https://security-tracker.debian.org/tracker/CVE-2026-48145  
                        thrift | CVE-2026-48144   | https://security-tracker.debian.org/tracker/CVE-2026-48144  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                       unbound | CVE-2026-81634   | https://security-tracker.debian.org/tracker/CVE-2026-81634  
                       unbound | CVE-2026-81642   | https://security-tracker.debian.org/tracker/CVE-2026-81642  
                       unbound | CVE-2026-80225   | https://security-tracker.debian.org/tracker/CVE-2026-80225  
                       unbound | CVE-2026-78227   | https://security-tracker.debian.org/tracker/CVE-2026-78227  
                       unbound | CVE-2026-82720   | https://security-tracker.debian.org/tracker/CVE-2026-82720  
                       unbound | CVE-2026-82717   | https://security-tracker.debian.org/tracker/CVE-2026-82717  
                       unbound | CVE-2026-77955   | https://security-tracker.debian.org/tracker/CVE-2026-77955  
                       unbound | CVE-2026-85501   | https://security-tracker.debian.org/tracker/CVE-2026-85501  
                       unbound | CVE-2026-77860   | https://security-tracker.debian.org/tracker/CVE-2026-77860  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                     wireshark | CVE-2026-96421   | https://security-tracker.debian.org/tracker/CVE-2026-96421  
                     wireshark | CVE-2026-96422   | https://security-tracker.debian.org/tracker/CVE-2026-96422  
                     wireshark | CVE-2026-96415   | https://security-tracker.debian.org/tracker/CVE-2026-96415  
                     wireshark | CVE-2026-96416   | https://security-tracker.debian.org/tracker/CVE-2026-96416  
                     wireshark | CVE-2026-96418   | https://security-tracker.debian.org/tracker/CVE-2026-96418  
                     wireshark | CVE-2026-96419   | https://security-tracker.debian.org/tracker/CVE-2026-96419  
                     wireshark | CVE-2026-96423   | https://security-tracker.debian.org/tracker/CVE-2026-96423  
                     wireshark | CVE-2026-96420   | https://security-tracker.debian.org/tracker/CVE-2026-96420  
                     wireshark | CVE-2026-96417   | https://security-tracker.debian.org/tracker/CVE-2026-96417  
                     wireshark | CVE-2026-95392   | https://security-tracker.debian.org/tracker/CVE-2026-95392  
                     wireshark | CVE-2026-95395   | https://security-tracker.debian.org/tracker/CVE-2026-95395  
                     wireshark | CVE-2026-95389   | https://security-tracker.debian.org/tracker/CVE-2026-95389  
                     wireshark | CVE-2026-95393   | https://security-tracker.debian.org/tracker/CVE-2026-95393  
                     wireshark | CVE-2026-95388   | https://security-tracker.debian.org/tracker/CVE-2026-95388  
                     wireshark | CVE-2026-95387   | https://security-tracker.debian.org/tracker/CVE-2026-95387  
                     wireshark | CVE-2026-95394   | https://security-tracker.debian.org/tracker/CVE-2026-95394  
                       wolfssl | CVE-2026-89134   | https://security-tracker.debian.org/tracker/CVE-2026-89134  
                       wolfssl | CVE-2026-89102   | https://security-tracker.debian.org/tracker/CVE-2026-89102  
                       wolfssl | CVE-2026-89133   | https://security-tracker.debian.org/tracker/CVE-2026-89133  
                       wolfssl | CVE-2026-89135   | https://security-tracker.debian.org/tracker/CVE-2026-89135  
                       wolfssl | CVE-2026-15442   | https://security-tracker.debian.org/tracker/CVE-2026-15442  
                       wolfssl | CVE-2026-94418   | https://security-tracker.debian.org/tracker/CVE-2026-94418  
                       wolfssl | CVE-2026-94417   | https://security-tracker.debian.org/tracker/CVE-2026-94417  
                       wolfssl | CVE-2026-94419   | https://security-tracker.debian.org/tracker/CVE-2026-94419  
                       wolfssl | CVE-2026-93302   | https://security-tracker.debian.org/tracker/CVE-2026-93302  
                       wolfssl | CVE-2026-93304   | https://security-tracker.debian.org/tracker/CVE-2026-93304  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
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
                        zabbix | CVE-2026-23920   | https://security-tracker.debian.org/tracker/CVE-2026-23920  
                        zabbix | CVE-2026-23921   | https://security-tracker.debian.org/tracker/CVE-2026-23921  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
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
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
           binutils-bare-metal | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
           binutils-bare-metal | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
           binutils-bare-metal | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
           binutils-bare-metal | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
           binutils-bare-metal | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
           binutils-bare-metal | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
           binutils-bare-metal | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
           binutils-bare-metal | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
           binutils-bare-metal | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
           binutils-bare-metal | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
           binutils-bare-metal | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2025-54605   | https://security-tracker.debian.org/tracker/CVE-2025-54605  
                       bitcoin | CVE-2025-54604   | https://security-tracker.debian.org/tracker/CVE-2025-54604  
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                      bpftrace | CVE-2024-2313    | https://security-tracker.debian.org/tracker/CVE-2024-2313   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2026-107885  | https://security-tracker.debian.org/tracker/CVE-2026-107885 
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
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
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                         expat | CVE-2026-115506  | https://security-tracker.debian.org/tracker/CVE-2026-115506 
                         expat | CVE-2026-117610  | https://security-tracker.debian.org/tracker/CVE-2026-117610 
                         expat | CVE-2026-113351  | https://security-tracker.debian.org/tracker/CVE-2026-113351 
                         expat | CVE-2026-118370  | https://security-tracker.debian.org/tracker/CVE-2026-118370 
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-30754   | https://security-tracker.debian.org/tracker/CVE-2026-30754  
                        ffmpeg | CVE-2026-96611   | https://security-tracker.debian.org/tracker/CVE-2026-96611  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-52297   | https://security-tracker.debian.org/tracker/CVE-2026-52297  
                        ffmpeg | CVE-2026-52296   | https://security-tracker.debian.org/tracker/CVE-2026-52296  
                        ffmpeg | CVE-2026-52295   | https://security-tracker.debian.org/tracker/CVE-2026-52295  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-107696  | https://security-tracker.debian.org/tracker/CVE-2026-107696 
                        ffmpeg | CVE-2026-107675  | https://security-tracker.debian.org/tracker/CVE-2026-107675 
                        ffmpeg | CVE-2026-107698  | https://security-tracker.debian.org/tracker/CVE-2026-107698 
                        ffmpeg | CVE-2026-107676  | https://security-tracker.debian.org/tracker/CVE-2026-107676 
                        ffmpeg | CVE-2026-107695  | https://security-tracker.debian.org/tracker/CVE-2026-107695 
                        ffmpeg | CVE-2026-107678  | https://security-tracker.debian.org/tracker/CVE-2026-107678 
                        ffmpeg | CVE-2026-107677  | https://security-tracker.debian.org/tracker/CVE-2026-107677 
                        ffmpeg | CVE-2026-107660  | https://security-tracker.debian.org/tracker/CVE-2026-107660 
                        ffmpeg | CVE-2026-107697  | https://security-tracker.debian.org/tracker/CVE-2026-107697 
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                         forge | CVE-2025-12816   | https://security-tracker.debian.org/tracker/CVE-2025-12816  
                         forge | CVE-2026-118776  | https://security-tracker.debian.org/tracker/CVE-2026-118776 
                         forge | CVE-2026-118777  | https://security-tracker.debian.org/tracker/CVE-2026-118777 
                         forge | CVE-2026-118775  | https://security-tracker.debian.org/tracker/CVE-2026-118775 
                         forge | CVE-2026-118774  | https://security-tracker.debian.org/tracker/CVE-2026-118774 
                         forge | CVE-2026-33891   | https://security-tracker.debian.org/tracker/CVE-2026-33891  
                         forge | CVE-2026-33896   | https://security-tracker.debian.org/tracker/CVE-2026-33896  
                         forge | CVE-2026-33895   | https://security-tracker.debian.org/tracker/CVE-2026-33895  
                         forge | CVE-2026-33894   | https://security-tracker.debian.org/tracker/CVE-2026-33894  
                         forge | CVE-2026-119191  | https://security-tracker.debian.org/tracker/CVE-2026-119191 
                         forge | CVE-2026-119187  | https://security-tracker.debian.org/tracker/CVE-2026-119187 
                       freerdp | CVE-2026-55648   | https://security-tracker.debian.org/tracker/CVE-2026-55648  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-91962   | https://security-tracker.debian.org/tracker/CVE-2026-91962  
                       freerdp | CVE-2026-91960   | https://security-tracker.debian.org/tracker/CVE-2026-91960  
                       freerdp | CVE-2026-91954   | https://security-tracker.debian.org/tracker/CVE-2026-91954  
                       freerdp | CVE-2026-91961   | https://security-tracker.debian.org/tracker/CVE-2026-91961  
                       freerdp | CVE-2026-91946   | https://security-tracker.debian.org/tracker/CVE-2026-91946  
                       freerdp | CVE-2026-91947   | https://security-tracker.debian.org/tracker/CVE-2026-91947  
                       freerdp | CVE-2026-91957   | https://security-tracker.debian.org/tracker/CVE-2026-91957  
                       freerdp | CVE-2026-91959   | https://security-tracker.debian.org/tracker/CVE-2026-91959  
                       freerdp | CVE-2026-91956   | https://security-tracker.debian.org/tracker/CVE-2026-91956  
                       freerdp | CVE-2026-91955   | https://security-tracker.debian.org/tracker/CVE-2026-91955  
                       freerdp | CVE-2026-91950   | https://security-tracker.debian.org/tracker/CVE-2026-91950  
                       freerdp | CVE-2026-91964   | https://security-tracker.debian.org/tracker/CVE-2026-91964  
                       freerdp | CVE-2026-91963   | https://security-tracker.debian.org/tracker/CVE-2026-91963  
                       freerdp | CVE-2026-91953   | https://security-tracker.debian.org/tracker/CVE-2026-91953  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-109677  | https://security-tracker.debian.org/tracker/CVE-2026-109677 
                       freerdp | CVE-2026-68579   | https://security-tracker.debian.org/tracker/CVE-2026-68579  
                       freerdp | CVE-2026-68580   | https://security-tracker.debian.org/tracker/CVE-2026-68580  
                       freerdp | CVE-2026-110832  | https://security-tracker.debian.org/tracker/CVE-2026-110832 
                       freerdp | CVE-2026-110837  | https://security-tracker.debian.org/tracker/CVE-2026-110837 
                       freerdp | CVE-2026-110834  | https://security-tracker.debian.org/tracker/CVE-2026-110834 
                       freerdp | CVE-2026-110830  | https://security-tracker.debian.org/tracker/CVE-2026-110830 
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67290   | https://security-tracker.debian.org/tracker/CVE-2026-67290  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67289   | https://security-tracker.debian.org/tracker/CVE-2026-67289  
                       freerdp | CVE-2026-67293   | https://security-tracker.debian.org/tracker/CVE-2026-67293  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67295   | https://security-tracker.debian.org/tracker/CVE-2026-67295  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67298   | https://security-tracker.debian.org/tracker/CVE-2026-67298  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-55191   | https://security-tracker.debian.org/tracker/CVE-2026-55191  
                       freerdp | CVE-2026-55192   | https://security-tracker.debian.org/tracker/CVE-2026-55192  
                       freerdp | CVE-2026-55193   | https://security-tracker.debian.org/tracker/CVE-2026-55193  
                       freerdp | CVE-2026-55194   | https://security-tracker.debian.org/tracker/CVE-2026-55194  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-121411  | https://security-tracker.debian.org/tracker/CVE-2026-121411 
                       freerdp | CVE-2026-121406  | https://security-tracker.debian.org/tracker/CVE-2026-121406 
                       freerdp | CVE-2026-121407  | https://security-tracker.debian.org/tracker/CVE-2026-121407 
                       freerdp | CVE-2026-121408  | https://security-tracker.debian.org/tracker/CVE-2026-121408 
                       freerdp | CVE-2026-121409  | https://security-tracker.debian.org/tracker/CVE-2026-121409 
                       freerdp | CVE-2026-121403  | https://security-tracker.debian.org/tracker/CVE-2026-121403 
                       freerdp | CVE-2026-121405  | https://security-tracker.debian.org/tracker/CVE-2026-121405 
                       freerdp | CVE-2026-121404  | https://security-tracker.debian.org/tracker/CVE-2026-121404 
                       freerdp | CVE-2026-121401  | https://security-tracker.debian.org/tracker/CVE-2026-121401 
                       freerdp | CVE-2026-121402  | https://security-tracker.debian.org/tracker/CVE-2026-121402 
                       freerdp | CVE-2026-121410  | https://security-tracker.debian.org/tracker/CVE-2026-121410 
                       freerdp | CVE-2026-121400  | https://security-tracker.debian.org/tracker/CVE-2026-121400 
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-111373  | https://security-tracker.debian.org/tracker/CVE-2026-111373 
                       freerdp | CVE-2026-111382  | https://security-tracker.debian.org/tracker/CVE-2026-111382 
                       freerdp | CVE-2026-111381  | https://security-tracker.debian.org/tracker/CVE-2026-111381 
                       freerdp | CVE-2026-111379  | https://security-tracker.debian.org/tracker/CVE-2026-111379 
                       freerdp | CVE-2026-111377  | https://security-tracker.debian.org/tracker/CVE-2026-111377 
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67303   | https://security-tracker.debian.org/tracker/CVE-2026-67303  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67300   | https://security-tracker.debian.org/tracker/CVE-2026-67300  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-109247  | https://security-tracker.debian.org/tracker/CVE-2026-109247 
                       freerdp | CVE-2026-109254  | https://security-tracker.debian.org/tracker/CVE-2026-109254 
                       freerdp | CVE-2026-109242  | https://security-tracker.debian.org/tracker/CVE-2026-109242 
                       freerdp | CVE-2026-109241  | https://security-tracker.debian.org/tracker/CVE-2026-109241 
                       freerdp | CVE-2026-109244  | https://security-tracker.debian.org/tracker/CVE-2026-109244 
                       freerdp | CVE-2026-109251  | https://security-tracker.debian.org/tracker/CVE-2026-109251 
                       freerdp | CVE-2026-109246  | https://security-tracker.debian.org/tracker/CVE-2026-109246 
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-121386  | https://security-tracker.debian.org/tracker/CVE-2026-121386 
                       freerdp | CVE-2026-121392  | https://security-tracker.debian.org/tracker/CVE-2026-121392 
                       freerdp | CVE-2026-121387  | https://security-tracker.debian.org/tracker/CVE-2026-121387 
                       freerdp | CVE-2026-121399  | https://security-tracker.debian.org/tracker/CVE-2026-121399 
                       freerdp | CVE-2026-121397  | https://security-tracker.debian.org/tracker/CVE-2026-121397 
                       freerdp | CVE-2026-121398  | https://security-tracker.debian.org/tracker/CVE-2026-121398 
                       freerdp | CVE-2026-73242   | https://security-tracker.debian.org/tracker/CVE-2026-73242  
                       freerdp | CVE-2026-73241   | https://security-tracker.debian.org/tracker/CVE-2026-73241  
                       freerdp | CVE-2026-109941  | https://security-tracker.debian.org/tracker/CVE-2026-109941 
                       freerdp | CVE-2026-109942  | https://security-tracker.debian.org/tracker/CVE-2026-109942 
                       freerdp | CVE-2026-63633   | https://security-tracker.debian.org/tracker/CVE-2026-63633  
                       freerdp | CVE-2026-63652   | https://security-tracker.debian.org/tracker/CVE-2026-63652  
                       freerdp | CVE-2026-63117   | https://security-tracker.debian.org/tracker/CVE-2026-63117  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-66402   | https://security-tracker.debian.org/tracker/CVE-2026-66402  
                       freerdp | CVE-2026-55564   | https://security-tracker.debian.org/tracker/CVE-2026-55564  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                       freerdp | CVE-2026-121963  | https://security-tracker.debian.org/tracker/CVE-2026-121963 
                       freerdp | CVE-2026-121955  | https://security-tracker.debian.org/tracker/CVE-2026-121955 
                       freerdp | CVE-2026-121950  | https://security-tracker.debian.org/tracker/CVE-2026-121950 
                       freerdp | CVE-2026-121957  | https://security-tracker.debian.org/tracker/CVE-2026-121957 
                       freerdp | CVE-2026-121964  | https://security-tracker.debian.org/tracker/CVE-2026-121964 
                       freerdp | CVE-2026-121956  | https://security-tracker.debian.org/tracker/CVE-2026-121956 
                       freerdp | CVE-2026-121959  | https://security-tracker.debian.org/tracker/CVE-2026-121959 
                       freerdp | CVE-2026-121961  | https://security-tracker.debian.org/tracker/CVE-2026-121961 
                       freerdp | CVE-2026-121958  | https://security-tracker.debian.org/tracker/CVE-2026-121958 
                       freerdp | CVE-2026-121962  | https://security-tracker.debian.org/tracker/CVE-2026-121962 
                       freerdp | CVE-2026-121952  | https://security-tracker.debian.org/tracker/CVE-2026-121952 
                       freerdp | CVE-2026-121953  | https://security-tracker.debian.org/tracker/CVE-2026-121953 
                       freerdp | CVE-2026-121954  | https://security-tracker.debian.org/tracker/CVE-2026-121954 
                       freerdp | CVE-2026-121960  | https://security-tracker.debian.org/tracker/CVE-2026-121960 
                    freeswitch | CVE-2026-49847   | https://security-tracker.debian.org/tracker/CVE-2026-49847  
                    freeswitch | CVE-2026-49843   | https://security-tracker.debian.org/tracker/CVE-2026-49843  
                    freeswitch | CVE-2026-49840   | https://security-tracker.debian.org/tracker/CVE-2026-49840  
                    freeswitch | CVE-2026-49841   | https://security-tracker.debian.org/tracker/CVE-2026-49841  
                    freeswitch | CVE-2026-49842   | https://security-tracker.debian.org/tracker/CVE-2026-49842  
                    freeswitch | CVE-2026-49848   | https://security-tracker.debian.org/tracker/CVE-2026-49848  
                    freeswitch | CVE-2026-49472   | https://security-tracker.debian.org/tracker/CVE-2026-49472  
                    freeswitch | CVE-2026-49475   | https://security-tracker.debian.org/tracker/CVE-2026-49475  
                    freeswitch | CVE-2026-45771   | https://security-tracker.debian.org/tracker/CVE-2026-45771  
                           frr | CVE-2025-61101   | https://security-tracker.debian.org/tracker/CVE-2025-61101  
                           frr | CVE-2025-61107   | https://security-tracker.debian.org/tracker/CVE-2025-61107  
                           frr | CVE-2025-61105   | https://security-tracker.debian.org/tracker/CVE-2025-61105  
                           frr | CVE-2025-61106   | https://security-tracker.debian.org/tracker/CVE-2025-61106  
                           frr | CVE-2025-61103   | https://security-tracker.debian.org/tracker/CVE-2025-61103  
                           frr | CVE-2025-61104   | https://security-tracker.debian.org/tracker/CVE-2025-61104  
                           frr | CVE-2025-61100   | https://security-tracker.debian.org/tracker/CVE-2025-61100  
                           frr | CVE-2025-61102   | https://security-tracker.debian.org/tracker/CVE-2025-61102  
                           frr | CVE-2025-61099   | https://security-tracker.debian.org/tracker/CVE-2025-61099  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                    gdk-pixbuf | CVE-2026-5201    | https://security-tracker.debian.org/tracker/CVE-2026-5201   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                        giflib | CVE-2026-26740   | https://security-tracker.debian.org/tracker/CVE-2026-26740  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                      harfbuzz | CVE-2026-22693   | https://security-tracker.debian.org/tracker/CVE-2026-22693  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-91101   | https://security-tracker.debian.org/tracker/CVE-2026-91101  
                         hplip | CVE-2026-91102   | https://security-tracker.debian.org/tracker/CVE-2026-91102  
                         hplip | CVE-2026-91105   | https://security-tracker.debian.org/tracker/CVE-2026-91105  
                         hplip | CVE-2026-91106   | https://security-tracker.debian.org/tracker/CVE-2026-91106  
                         hplip | CVE-2026-91103   | https://security-tracker.debian.org/tracker/CVE-2026-91103  
                         hplip | CVE-2026-91104   | https://security-tracker.debian.org/tracker/CVE-2026-91104  
                         hplip | CVE-2026-91100   | https://security-tracker.debian.org/tracker/CVE-2026-91100  
                         hplip | CVE-2026-91099   | https://security-tracker.debian.org/tracker/CVE-2026-91099  
                         hplip | CVE-2026-91098   | https://security-tracker.debian.org/tracker/CVE-2026-91098  
                         hplip | CVE-2026-91097   | https://security-tracker.debian.org/tracker/CVE-2026-91097  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-93590   | https://security-tracker.debian.org/tracker/CVE-2026-93590  
                   imagemagick | CVE-2026-93586   | https://security-tracker.debian.org/tracker/CVE-2026-93586  
                   imagemagick | CVE-2026-93587   | https://security-tracker.debian.org/tracker/CVE-2026-93587  
                   imagemagick | CVE-2026-93589   | https://security-tracker.debian.org/tracker/CVE-2026-93589  
                   imagemagick | CVE-2026-93588   | https://security-tracker.debian.org/tracker/CVE-2026-93588  
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-108693  | https://security-tracker.debian.org/tracker/CVE-2026-108693 
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-116154  | https://security-tracker.debian.org/tracker/CVE-2026-116154 
                   imagemagick | CVE-2026-116152  | https://security-tracker.debian.org/tracker/CVE-2026-116152 
                   imagemagick | CVE-2026-116149  | https://security-tracker.debian.org/tracker/CVE-2026-116149 
                   imagemagick | CVE-2026-116142  | https://security-tracker.debian.org/tracker/CVE-2026-116142 
                   imagemagick | CVE-2026-116155  | https://security-tracker.debian.org/tracker/CVE-2026-116155 
                   imagemagick | CVE-2026-116151  | https://security-tracker.debian.org/tracker/CVE-2026-116151 
                   imagemagick | CVE-2026-116159  | https://security-tracker.debian.org/tracker/CVE-2026-116159 
                   imagemagick | CVE-2026-116143  | https://security-tracker.debian.org/tracker/CVE-2026-116143 
                   imagemagick | CVE-2026-116140  | https://security-tracker.debian.org/tracker/CVE-2026-116140 
                   imagemagick | CVE-2026-116148  | https://security-tracker.debian.org/tracker/CVE-2026-116148 
                   imagemagick | CVE-2026-116156  | https://security-tracker.debian.org/tracker/CVE-2026-116156 
                   imagemagick | CVE-2026-116146  | https://security-tracker.debian.org/tracker/CVE-2026-116146 
                   imagemagick | CVE-2026-116157  | https://security-tracker.debian.org/tracker/CVE-2026-116157 
                   imagemagick | CVE-2026-116145  | https://security-tracker.debian.org/tracker/CVE-2026-116145 
                   imagemagick | CVE-2026-116144  | https://security-tracker.debian.org/tracker/CVE-2026-116144 
                   imagemagick | CVE-2026-116141  | https://security-tracker.debian.org/tracker/CVE-2026-116141 
                   imagemagick | CVE-2026-116158  | https://security-tracker.debian.org/tracker/CVE-2026-116158 
                   imagemagick | CVE-2026-116153  | https://security-tracker.debian.org/tracker/CVE-2026-116153 
                   imagemagick | CVE-2026-116147  | https://security-tracker.debian.org/tracker/CVE-2026-116147 
                   imagemagick | CVE-2026-116160  | https://security-tracker.debian.org/tracker/CVE-2026-116160 
                   imagemagick | CVE-2026-116150  | https://security-tracker.debian.org/tracker/CVE-2026-116150 
                   imagemagick | CVE-2026-107209  | https://security-tracker.debian.org/tracker/CVE-2026-107209 
                   imagemagick | CVE-2026-107208  | https://security-tracker.debian.org/tracker/CVE-2026-107208 
                   imagemagick | CVE-2026-107210  | https://security-tracker.debian.org/tracker/CVE-2026-107210 
                   imagemagick | CVE-2026-105083  | https://security-tracker.debian.org/tracker/CVE-2026-105083 
                   imagemagick | CVE-2026-105081  | https://security-tracker.debian.org/tracker/CVE-2026-105081 
                   imagemagick | CVE-2026-106569  | https://security-tracker.debian.org/tracker/CVE-2026-106569 
                   imagemagick | CVE-2026-106574  | https://security-tracker.debian.org/tracker/CVE-2026-106574 
                   imagemagick | CVE-2026-106566  | https://security-tracker.debian.org/tracker/CVE-2026-106566 
                   imagemagick | CVE-2026-106580  | https://security-tracker.debian.org/tracker/CVE-2026-106580 
                   imagemagick | CVE-2026-106567  | https://security-tracker.debian.org/tracker/CVE-2026-106567 
                   imagemagick | CVE-2026-106568  | https://security-tracker.debian.org/tracker/CVE-2026-106568 
                   imagemagick | CVE-2026-106578  | https://security-tracker.debian.org/tracker/CVE-2026-106578 
                   imagemagick | CVE-2026-106571  | https://security-tracker.debian.org/tracker/CVE-2026-106571 
                   imagemagick | CVE-2026-106565  | https://security-tracker.debian.org/tracker/CVE-2026-106565 
                   imagemagick | CVE-2026-106572  | https://security-tracker.debian.org/tracker/CVE-2026-106572 
                   imagemagick | CVE-2026-106575  | https://security-tracker.debian.org/tracker/CVE-2026-106575 
                   imagemagick | CVE-2026-106564  | https://security-tracker.debian.org/tracker/CVE-2026-106564 
                   imagemagick | CVE-2026-106576  | https://security-tracker.debian.org/tracker/CVE-2026-106576 
                   imagemagick | CVE-2026-106570  | https://security-tracker.debian.org/tracker/CVE-2026-106570 
                   imagemagick | CVE-2026-106573  | https://security-tracker.debian.org/tracker/CVE-2026-106573 
                   imagemagick | CVE-2026-106577  | https://security-tracker.debian.org/tracker/CVE-2026-106577 
                   imagemagick | CVE-2026-106579  | https://security-tracker.debian.org/tracker/CVE-2026-106579 
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-119123  | https://security-tracker.debian.org/tracker/CVE-2026-119123 
                   imagemagick | CVE-2026-119124  | https://security-tracker.debian.org/tracker/CVE-2026-119124 
                   imagemagick | CVE-2026-109270  | https://security-tracker.debian.org/tracker/CVE-2026-109270 
                   imagemagick | CVE-2026-109268  | https://security-tracker.debian.org/tracker/CVE-2026-109268 
                   imagemagick | CVE-2026-109262  | https://security-tracker.debian.org/tracker/CVE-2026-109262 
                   imagemagick | CVE-2026-109282  | https://security-tracker.debian.org/tracker/CVE-2026-109282 
                   imagemagick | CVE-2026-109279  | https://security-tracker.debian.org/tracker/CVE-2026-109279 
                   imagemagick | CVE-2026-109280  | https://security-tracker.debian.org/tracker/CVE-2026-109280 
                   imagemagick | CVE-2026-109266  | https://security-tracker.debian.org/tracker/CVE-2026-109266 
                   imagemagick | CVE-2026-109259  | https://security-tracker.debian.org/tracker/CVE-2026-109259 
                   imagemagick | CVE-2026-109261  | https://security-tracker.debian.org/tracker/CVE-2026-109261 
                   imagemagick | CVE-2026-109258  | https://security-tracker.debian.org/tracker/CVE-2026-109258 
                   imagemagick | CVE-2026-109281  | https://security-tracker.debian.org/tracker/CVE-2026-109281 
                   imagemagick | CVE-2026-109277  | https://security-tracker.debian.org/tracker/CVE-2026-109277 
                   imagemagick | CVE-2026-109265  | https://security-tracker.debian.org/tracker/CVE-2026-109265 
                   imagemagick | CVE-2026-109275  | https://security-tracker.debian.org/tracker/CVE-2026-109275 
                   imagemagick | CVE-2026-109273  | https://security-tracker.debian.org/tracker/CVE-2026-109273 
                   imagemagick | CVE-2026-109267  | https://security-tracker.debian.org/tracker/CVE-2026-109267 
                   imagemagick | CVE-2026-109260  | https://security-tracker.debian.org/tracker/CVE-2026-109260 
                   imagemagick | CVE-2026-109263  | https://security-tracker.debian.org/tracker/CVE-2026-109263 
                   imagemagick | CVE-2026-109278  | https://security-tracker.debian.org/tracker/CVE-2026-109278 
                   imagemagick | CVE-2026-109264  | https://security-tracker.debian.org/tracker/CVE-2026-109264 
                   imagemagick | CVE-2026-109269  | https://security-tracker.debian.org/tracker/CVE-2026-109269 
                   imagemagick | CVE-2026-109274  | https://security-tracker.debian.org/tracker/CVE-2026-109274 
                   imagemagick | CVE-2026-109272  | https://security-tracker.debian.org/tracker/CVE-2026-109272 
                   imagemagick | CVE-2026-109276  | https://security-tracker.debian.org/tracker/CVE-2026-109276 
                   imagemagick | CVE-2026-102635  | https://security-tracker.debian.org/tracker/CVE-2026-102635 
                   imagemagick | CVE-2026-109964  | https://security-tracker.debian.org/tracker/CVE-2026-109964 
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-47770   | https://security-tracker.debian.org/tracker/CVE-2026-47770  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libbson | CVE-2024-6381    | https://security-tracker.debian.org/tracker/CVE-2024-6381   
                       libbson | CVE-2025-0755    | https://security-tracker.debian.org/tracker/CVE-2025-0755   
                       libcdio | CVE-2024-36600   | https://security-tracker.debian.org/tracker/CVE-2024-36600  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-70968   | https://security-tracker.debian.org/tracker/CVE-2025-70968  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                      libglib2 | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
                      libglib2 | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                      libglib2 | CVE-2026-58012   | https://security-tracker.debian.org/tracker/CVE-2026-58012  
                      libglib2 | CVE-2026-58011   | https://security-tracker.debian.org/tracker/CVE-2026-58011  
                      libglib2 | CVE-2026-58010   | https://security-tracker.debian.org/tracker/CVE-2026-58010  
                      libglib2 | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
                      libglib2 | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
                      libglib2 | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
            libglib2-bootstrap | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
            libglib2-bootstrap | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
            libglib2-bootstrap | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2026-58012   | https://security-tracker.debian.org/tracker/CVE-2026-58012  
            libglib2-bootstrap | CVE-2026-58011   | https://security-tracker.debian.org/tracker/CVE-2026-58011  
            libglib2-bootstrap | CVE-2026-58010   | https://security-tracker.debian.org/tracker/CVE-2026-58010  
            libglib2-bootstrap | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
            libglib2-bootstrap | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
            libglib2-bootstrap | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libpjsip | CVE-2026-84975   | https://security-tracker.debian.org/tracker/CVE-2026-84975  
                      libpjsip | CVE-2026-77396   | https://security-tracker.debian.org/tracker/CVE-2026-77396  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libsoup | CVE-2026-102560  | https://security-tracker.debian.org/tracker/CVE-2026-102560 
                       libsoup | CVE-2026-102558  | https://security-tracker.debian.org/tracker/CVE-2026-102558 
                       libsoup | CVE-2026-102555  | https://security-tracker.debian.org/tracker/CVE-2026-102555 
                       libsoup | CVE-2026-102556  | https://security-tracker.debian.org/tracker/CVE-2026-102556 
                       libsoup | CVE-2026-102559  | https://security-tracker.debian.org/tracker/CVE-2026-102559 
                       libsoup | CVE-2026-102557  | https://security-tracker.debian.org/tracker/CVE-2026-102557 
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-97380   | https://security-tracker.debian.org/tracker/CVE-2026-97380  
                       mariadb | CVE-2026-92262   | https://security-tracker.debian.org/tracker/CVE-2026-92262  
                       mariadb | CVE-2026-85745   | https://security-tracker.debian.org/tracker/CVE-2026-85745  
                       mariadb | CVE-2026-85746   | https://security-tracker.debian.org/tracker/CVE-2026-85746  
                       mariadb | CVE-2026-85985   | https://security-tracker.debian.org/tracker/CVE-2026-85985  
                       mariadb | CVE-2026-86047   | https://security-tracker.debian.org/tracker/CVE-2026-86047  
                       mariadb | CVE-2026-107822  | https://security-tracker.debian.org/tracker/CVE-2026-107822 
                       mariadb | CVE-2026-107823  | https://security-tracker.debian.org/tracker/CVE-2026-107823 
                       mariadb | CVE-2026-107814  | https://security-tracker.debian.org/tracker/CVE-2026-107814 
                       mariadb | CVE-2026-107816  | https://security-tracker.debian.org/tracker/CVE-2026-107816 
                       mariadb | CVE-2026-107818  | https://security-tracker.debian.org/tracker/CVE-2026-107818 
                       mariadb | CVE-2026-107817  | https://security-tracker.debian.org/tracker/CVE-2026-107817 
                       mariadb | CVE-2026-107815  | https://security-tracker.debian.org/tracker/CVE-2026-107815 
                       mariadb | CVE-2026-107821  | https://security-tracker.debian.org/tracker/CVE-2026-107821 
                mesa3d-headers | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          nmap | CVE-2026-0011    | https://security-tracker.debian.org/tracker/CVE-2026-0011   
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-106587  | https://security-tracker.debian.org/tracker/CVE-2026-106587 
                       openssh | CVE-2026-106582  | https://security-tracker.debian.org/tracker/CVE-2026-106582 
                       openssh | CVE-2026-106584  | https://security-tracker.debian.org/tracker/CVE-2026-106584 
                       openssh | CVE-2026-106553  | https://security-tracker.debian.org/tracker/CVE-2026-106553 
                       openssh | CVE-2026-106555  | https://security-tracker.debian.org/tracker/CVE-2026-106555 
                       openssh | CVE-2026-106585  | https://security-tracker.debian.org/tracker/CVE-2026-106585 
                       openssh | CVE-2026-106552  | https://security-tracker.debian.org/tracker/CVE-2026-106552 
                       openssh | CVE-2026-106586  | https://security-tracker.debian.org/tracker/CVE-2026-106586 
                       openssh | CVE-2026-73282   | https://security-tracker.debian.org/tracker/CVE-2026-73282  
                       openssh | CVE-2026-73281   | https://security-tracker.debian.org/tracker/CVE-2026-73281  
                       openssh | CVE-2026-73283   | https://security-tracker.debian.org/tracker/CVE-2026-73283  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       proftpd | CVE-2026-35025   | https://security-tracker.debian.org/tracker/CVE-2026-35025  
                       proftpd | CVE-2026-63091   | https://security-tracker.debian.org/tracker/CVE-2026-63091  
                       proftpd | CVE-2026-63090   | https://security-tracker.debian.org/tracker/CVE-2026-63090  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                      protobuf | CVE-2026-0994    | https://security-tracker.debian.org/tracker/CVE-2026-0994   
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2025-69228   | https://security-tracker.debian.org/tracker/CVE-2025-69228  
                python-aiohttp | CVE-2025-69230   | https://security-tracker.debian.org/tracker/CVE-2025-69230  
                python-aiohttp | CVE-2025-69227   | https://security-tracker.debian.org/tracker/CVE-2025-69227  
                python-aiohttp | CVE-2025-69229   | https://security-tracker.debian.org/tracker/CVE-2025-69229  
                python-aiohttp | CVE-2025-69226   | https://security-tracker.debian.org/tracker/CVE-2025-69226  
                python-aiohttp | CVE-2025-69223   | https://security-tracker.debian.org/tracker/CVE-2025-69223  
                python-aiohttp | CVE-2025-69224   | https://security-tracker.debian.org/tracker/CVE-2025-69224  
                python-aiohttp | CVE-2025-69225   | https://security-tracker.debian.org/tracker/CVE-2025-69225  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-96778   | https://security-tracker.debian.org/tracker/CVE-2026-96778  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-96640   | https://security-tracker.debian.org/tracker/CVE-2026-96640  
                 python-pillow | CVE-2026-96642   | https://security-tracker.debian.org/tracker/CVE-2026-96642  
                 python-pillow | CVE-2026-96637   | https://security-tracker.debian.org/tracker/CVE-2026-96637  
                 python-pillow | CVE-2026-96643   | https://security-tracker.debian.org/tracker/CVE-2026-96643  
                 python-pillow | CVE-2026-96644   | https://security-tracker.debian.org/tracker/CVE-2026-96644  
                 python-pillow | CVE-2026-96638   | https://security-tracker.debian.org/tracker/CVE-2026-96638  
                 python-pillow | CVE-2026-96641   | https://security-tracker.debian.org/tracker/CVE-2026-96641  
                 python-pillow | CVE-2026-96639   | https://security-tracker.debian.org/tracker/CVE-2026-96639  
                 python-pillow | CVE-2026-96636   | https://security-tracker.debian.org/tracker/CVE-2026-96636  
                 python-pillow | CVE-2026-112895  | https://security-tracker.debian.org/tracker/CVE-2026-112895 
                 python-pillow | CVE-2026-112898  | https://security-tracker.debian.org/tracker/CVE-2026-112898 
                 python-pillow | CVE-2026-112896  | https://security-tracker.debian.org/tracker/CVE-2026-112896 
                 python-pillow | CVE-2026-112897  | https://security-tracker.debian.org/tracker/CVE-2026-112897 
                 python-pillow | CVE-2026-112894  | https://security-tracker.debian.org/tracker/CVE-2026-112894 
                 python-pillow | CVE-2026-112891  | https://security-tracker.debian.org/tracker/CVE-2026-112891 
                 python-pillow | CVE-2026-112893  | https://security-tracker.debian.org/tracker/CVE-2026-112893 
                 python-pillow | CVE-2026-112892  | https://security-tracker.debian.org/tracker/CVE-2026-112892 
                 python-pillow | CVE-2026-112400  | https://security-tracker.debian.org/tracker/CVE-2026-112400 
                 python-pillow | CVE-2026-112403  | https://security-tracker.debian.org/tracker/CVE-2026-112403 
                 python-pillow | CVE-2026-112401  | https://security-tracker.debian.org/tracker/CVE-2026-112401 
                 python-pillow | CVE-2026-112406  | https://security-tracker.debian.org/tracker/CVE-2026-112406 
                 python-pillow | CVE-2026-112404  | https://security-tracker.debian.org/tracker/CVE-2026-112404 
                 python-pillow | CVE-2026-112402  | https://security-tracker.debian.org/tracker/CVE-2026-112402 
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-112390  | https://security-tracker.debian.org/tracker/CVE-2026-112390 
                 python-pillow | CVE-2026-112397  | https://security-tracker.debian.org/tracker/CVE-2026-112397 
                 python-pillow | CVE-2026-112392  | https://security-tracker.debian.org/tracker/CVE-2026-112392 
                 python-pillow | CVE-2026-112393  | https://security-tracker.debian.org/tracker/CVE-2026-112393 
                 python-pillow | CVE-2026-112399  | https://security-tracker.debian.org/tracker/CVE-2026-112399 
                 python-pillow | CVE-2026-112394  | https://security-tracker.debian.org/tracker/CVE-2026-112394 
                 python-pillow | CVE-2026-112391  | https://security-tracker.debian.org/tracker/CVE-2026-112391 
                 python-pillow | CVE-2026-112395  | https://security-tracker.debian.org/tracker/CVE-2026-112395 
                 python-pillow | CVE-2026-112398  | https://security-tracker.debian.org/tracker/CVE-2026-112398 
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-112901  | https://security-tracker.debian.org/tracker/CVE-2026-112901 
                 python-pillow | CVE-2026-112900  | https://security-tracker.debian.org/tracker/CVE-2026-112900 
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-102275  | https://security-tracker.debian.org/tracker/CVE-2026-102275 
                  python-pyjwt | CVE-2026-102271  | https://security-tracker.debian.org/tracker/CVE-2026-102271 
                  python-pyjwt | CVE-2026-102274  | https://security-tracker.debian.org/tracker/CVE-2026-102274 
                  python-pyjwt | CVE-2026-102269  | https://security-tracker.debian.org/tracker/CVE-2026-102269 
                  python-pyjwt | CVE-2026-102268  | https://security-tracker.debian.org/tracker/CVE-2026-102268 
                  python-pyjwt | CVE-2026-102267  | https://security-tracker.debian.org/tracker/CVE-2026-102267 
                  python-pyjwt | CVE-2026-102270  | https://security-tracker.debian.org/tracker/CVE-2026-102270 
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
                  python-pyjwt | CVE-2026-48523   | https://security-tracker.debian.org/tracker/CVE-2026-48523  
                  python-pyjwt | CVE-2026-103001  | https://security-tracker.debian.org/tracker/CVE-2026-103001 
                  python-pyjwt | CVE-2026-101917  | https://security-tracker.debian.org/tracker/CVE-2026-101917 
                  python-pyjwt | CVE-2026-101918  | https://security-tracker.debian.org/tracker/CVE-2026-101918 
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-tornado | CVE-2026-35536   | https://security-tracker.debian.org/tracker/CVE-2026-35536  
                python-tornado | CVE-2026-31958   | https://security-tracker.debian.org/tracker/CVE-2026-31958  
                python-urllib3 | CVE-2026-97688   | https://security-tracker.debian.org/tracker/CVE-2026-97688  
                python-urllib3 | CVE-2026-97689   | https://security-tracker.debian.org/tracker/CVE-2026-97689  
                python-urllib3 | CVE-2026-97687   | https://security-tracker.debian.org/tracker/CVE-2026-97687  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2025-13837   | https://security-tracker.debian.org/tracker/CVE-2025-13837  
                       python3 | CVE-2025-12781   | https://security-tracker.debian.org/tracker/CVE-2025-12781  
                       python3 | CVE-2025-13462   | https://security-tracker.debian.org/tracker/CVE-2025-13462  
                       python3 | CVE-2025-12084   | https://security-tracker.debian.org/tracker/CVE-2025-12084  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                       python3 | CVE-2026-3644    | https://security-tracker.debian.org/tracker/CVE-2026-3644   
                       python3 | CVE-2026-4519    | https://security-tracker.debian.org/tracker/CVE-2026-4519   
                       python3 | CVE-2026-3087    | https://security-tracker.debian.org/tracker/CVE-2026-3087   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2025-54566   | https://security-tracker.debian.org/tracker/CVE-2025-54566  
                          qemu | CVE-2025-54567   | https://security-tracker.debian.org/tracker/CVE-2025-54567  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-5683    | https://security-tracker.debian.org/tracker/CVE-2025-5683   
                qt6declarative | CVE-2025-14576   | https://security-tracker.debian.org/tracker/CVE-2025-14576  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                         redis | CVE-2026-23479   | https://security-tracker.debian.org/tracker/CVE-2026-23479  
                         redis | CVE-2026-25243   | https://security-tracker.debian.org/tracker/CVE-2026-25243  
                         redis | CVE-2026-23631   | https://security-tracker.debian.org/tracker/CVE-2026-23631  
                         rsync | CVE-2026-119741  | https://security-tracker.debian.org/tracker/CVE-2026-119741 
                          ruby | CVE-2026-97229   | https://security-tracker.debian.org/tracker/CVE-2026-97229  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
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
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                        sqlite | CVE-2026-119379  | https://security-tracker.debian.org/tracker/CVE-2026-119379 
                        sqlite | CVE-2026-119377  | https://security-tracker.debian.org/tracker/CVE-2026-119377 
                        sqlite | CVE-2026-119376  | https://security-tracker.debian.org/tracker/CVE-2026-119376 
                        sqlite | CVE-2026-119371  | https://security-tracker.debian.org/tracker/CVE-2026-119371 
                        sqlite | CVE-2026-119373  | https://security-tracker.debian.org/tracker/CVE-2026-119373 
                        sqlite | CVE-2026-119375  | https://security-tracker.debian.org/tracker/CVE-2026-119375 
                        sqlite | CVE-2026-119378  | https://security-tracker.debian.org/tracker/CVE-2026-119378 
                        sqlite | CVE-2026-119374  | https://security-tracker.debian.org/tracker/CVE-2026-119374 
                        sqlite | CVE-2026-119372  | https://security-tracker.debian.org/tracker/CVE-2026-119372 
                        sqlite | CVE-2026-119591  | https://security-tracker.debian.org/tracker/CVE-2026-119591 
                        sqlite | CVE-2026-119586  | https://security-tracker.debian.org/tracker/CVE-2026-119586 
                         squid | CVE-2026-32748   | https://security-tracker.debian.org/tracker/CVE-2026-32748  
                    strongswan | CVE-2026-78132   | https://security-tracker.debian.org/tracker/CVE-2026-78132  
                    strongswan | CVE-2026-78126   | https://security-tracker.debian.org/tracker/CVE-2026-78126  
                    strongswan | CVE-2026-78131   | https://security-tracker.debian.org/tracker/CVE-2026-78131  
                    strongswan | CVE-2026-78123   | https://security-tracker.debian.org/tracker/CVE-2026-78123  
                    strongswan | CVE-2026-78135   | https://security-tracker.debian.org/tracker/CVE-2026-78135  
                    strongswan | CVE-2026-78134   | https://security-tracker.debian.org/tracker/CVE-2026-78134  
                    strongswan | CVE-2026-78124   | https://security-tracker.debian.org/tracker/CVE-2026-78124  
                    strongswan | CVE-2026-78127   | https://security-tracker.debian.org/tracker/CVE-2026-78127  
                    strongswan | CVE-2026-78130   | https://security-tracker.debian.org/tracker/CVE-2026-78130  
                    strongswan | CVE-2026-78129   | https://security-tracker.debian.org/tracker/CVE-2026-78129  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40226   | https://security-tracker.debian.org/tracker/CVE-2026-40226  
                       systemd | CVE-2026-40225   | https://security-tracker.debian.org/tracker/CVE-2026-40225  
                       systemd | CVE-2026-29111   | https://security-tracker.debian.org/tracker/CVE-2026-29111  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2024-57259   | https://security-tracker.debian.org/tracker/CVE-2024-57259  
                   uboot-tools | CVE-2024-57254   | https://security-tracker.debian.org/tracker/CVE-2024-57254  
                   uboot-tools | CVE-2024-57257   | https://security-tracker.debian.org/tracker/CVE-2024-57257  
                   uboot-tools | CVE-2024-57258   | https://security-tracker.debian.org/tracker/CVE-2024-57258  
                   uboot-tools | CVE-2024-57255   | https://security-tracker.debian.org/tracker/CVE-2024-57255  
                   uboot-tools | CVE-2024-57256   | https://security-tracker.debian.org/tracker/CVE-2024-57256  
                   uboot-tools | CVE-2026-29009   | https://security-tracker.debian.org/tracker/CVE-2026-29009  
                   uboot-tools | CVE-2026-29008   | https://security-tracker.debian.org/tracker/CVE-2026-29008  
                   uboot-tools | CVE-2026-29007   | https://security-tracker.debian.org/tracker/CVE-2026-29007  
                   uboot-tools | CVE-2026-46728   | https://security-tracker.debian.org/tracker/CVE-2026-46728  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-27456   | https://security-tracker.debian.org/tracker/CVE-2026-27456  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
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
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
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
                          zeek | CVE-2026-60109   | https://security-tracker.debian.org/tracker/CVE-2026-60109  
                          zeek | CVE-2026-60108   | https://security-tracker.debian.org/tracker/CVE-2026-60108  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
