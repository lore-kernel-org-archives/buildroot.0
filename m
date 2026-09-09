Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F61C79FAD
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 03:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11DE605CB;
	Wed,  9 Sep 2026 03:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL2MpcKGMGXt; Wed,  9 Sep 2026 03:22:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CC1306075A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788924176;
	b=fuh2CLYZRIXAg+4ugQ0qxF80ucL/2rLOI5tyX/kT2W2KxfC220ZDMjzkWWLXYngRDLNI
	 D8QL/y0GpYDxMLNBYMw3HE1Q+EVdyJ//V8979uCc9W3Sm0FRp9XTik+Rsz9+4GIg7ex8t
	 dVx7oxkxPYF4eYH5fVnOQGhIrlP/DJdzaWCmrHkqG905wReVcHLJBEux/ELkABldD1tol
	 LnulDyjpp1LO9Yxz9lZ9id1J4rIo7lt9uf3iVTR6ntgzdELv9Q1tvYy2ZbuJp0jYYGh2Z
	 Pk1vKPawX+LwQK5Md7s/QHzifCD6vG42LRxuRaMfipLFYVrLUnSGUpx/JldT0pudqLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788924176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qeV+KofVBPkZLHORluXrwegz/XwaJBeG/tyAHJxRpP8=;
	b=mMzB1OAr0XQ5Xg1iZdrXgLs4CSdyO6axCIEnrdbnuBum8TvV0XgJlPP+68iPPgFH59Cb
	 FqHS4X3Ad2r39JKGInrRxy8Psx11XywSV7G1tjPth1alPizCs9Do8kiLjxXGwDKCnVWlV
	 mRQvkzXiUfVRg+8qpBtTXNQElE1KVy8ezE+wzpM8vXUVC0yd0MXQD3ow287JxMflGA6Um
	 K5IxgcmqxH2OClYGRw67kVlastKprE4oMuw2j0daZUpkRuUBT+zQfUgAKwmt/eWreR/DY
	 bcfEE1oWWiOjbCJRqws8P8lJhBsPIGXVhlZGsORwToLpBHJ8B8MkKBVypjr1aKzb4KQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788924176;
	bh=qeV+KofVBPkZLHORluXrwegz/XwaJBeG/tyAHJxRpP8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jD/mxJ1JHwH+R9xJeA/9hjjy3U1OZEmNeDxt+6AaYE2X0+5Hav+sDmZGArb36XLTt
	 UbIWvs4NNxdxMt9AhP+s7JYh/LQDLSkDWOAQ1+IcYSiANrNZkgTU7qnUyQ8kXoTBT3
	 REs76SOnkaJZW/PxpAd+Y7CY274fff3j46xhhY9hcYErcFVz5UryHGVKRJy0cfy5CT
	 xwJL+66+/CEKp2SdheX6Bt4efvqEWEXtHw4LlxFO/zEfvqLsB9vLhyXgGyBaI8Jb9A
	 UQ4kylLyPI/XTVN2cd43wdGD9WjcKZiPc2pwt3q7pcecQ+EUlgGlwENuPqLGKzhF4P
	 ghKv2sxYgTCww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC1306075A;
	Wed,  9 Sep 2026 03:22:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E29C2E3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 03:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FB17406C6
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 03:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olHgogWORivu for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 03:22:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 14E194054A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788924173;
 b=DakeNxwJ6dbvev0m8L6psdeXeb87EE9TWhbqfRr3its7MEUhYDpSGDwAQcYo4dHgDBY5
 51Cwjb+6LdOtwRvIN1TRe4IgpLtUVheIVGYPeK99V/KLr+9GljtyLJSBhyw0g1Cwt/+Zc
 o2Ha63IW9tEKZnNYty/VKgzGnjrbEdxneymhqD0jqSYBmaNTiXks0xndmbsZ8Cv4LjF+p
 qqxrzlPTfIHusaghPiRSnshWW/T/PiR2rZ+huap4ldm1nrmH/K8Y6DXPt/leImGaNwHJ9
 3j3jB5uBkyWfYbvdG7Uq2PbxQ0gwanNz6kY7CXRTE555FCIBpRbR7DgB5wYUhMUUMbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788924173;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=Mhx0byTIKUJZRQEnmhpf7TQqAYRmIAce7FnltbtQdjI=;
 b=dsjUgeE/HGqSgSi5t28BHBvPmJNAI5Mvr2T2EEpTx/oedtgNeVl9XVKeii5tS+dSjuw3
 /lSzRm8wTpue6gEOLqYefROkzDCn2Nb6ty2oLSgtelhzjFckr4dJxJ1uuxYAT/G7wHw4E
 csOR+Q1cSPl2QfwleQEiV19tZWh6bTgkjvSMzknQQUaNOgFBzf9cic0XZ91+OMEIbBatu
 Hi2crnjK0Ob0IcrXwrqtp7Mm2Vbg7+n4zHSIp1MJcn7bijYSntidws9EaxTxrZF4dtloy
 og/jebMYQri04frkHNI0YXP0HED1RcrDlY1SnMAsLeej2zCNvFYY31ohpgItAYwwcyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=U3caC3ZT; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=U3caC3ZT
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14E194054A
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 03:22:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4858303de5dso6479100f8f.2
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 20:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788924169; x=1789528969; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Mhx0byTIKUJZRQEnmhpf7TQqAYRmIAce7FnltbtQdjI=;
 b=U3caC3ZTOizAesnxkAdDQqmO2+YoZSsnDkxKgR36HzaY5SUshgkMel3Pd9iHjkzjvF
 loOcEOfoecEr3Old33wiw5fNNOEdDNBRhDprPq8xGjh8qG759/oQwbBsT2IChI+4ww+g
 knBm0RKPgKzARAKjNDwA+/OotU1hR7DWFfbBma1uIT4jiZ0gnBGTjl+OPOIJNY2NanTg
 np9WpATAgmR1NYkw0AZGlLwpNmfg2C2PloI6cIj+RHXJG9KpXrVEa8rwcjx6+6I/gBjQ
 bdrYKA7l9DCdqqyFhKKndodRKaA11GiLDOVCzoEKco/wdog2tiY8WjsQAPf3/3IGldfr
 NvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788924169; x=1789528969;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Mhx0byTIKUJZRQEnmhpf7TQqAYRmIAce7FnltbtQdjI=;
 b=NaSYJ7m5A9XTuupKvOsMKbAI/0kEbFsdETmXapy5qniYWAPYMgWWmnnTxe+k4EHhta
 xUBCYQL3gWK9EP7chFih5iGBHqqxB/Y8FhKHsD+wlrk3grFzbZXaw5ZGwiY/3Jysl5wl
 smIosHXF6+Ww+44zPw1GEfpLKBQTicgmmFFR6mdaKGooHrQzHwpxAmO1LH+Qxvpcfgg7
 StoNnYRyPM3GiK0dl4oO7eOOLFsi3FgS3juW4k7l2ImvTTWA/drs3SQTqGwrBao323FV
 IFd55aD5k21uNcBgvN33B1Rq9JEvGvnXtuYH4arUqd+LcUOK4Tk4lrsIxYVMaa7xz7WF
 c8RA==
X-Gm-Message-State: AFuF++lRrmFS9yWPnd8z+pZ9meoDhD5dESzXHdBRKBp3O1yLFI+8/CKe
 B7soUFPYvY2NfBGzuIPOVzqPrkuawfmLjMpffL9qvKDYebSAxskD3fWcaVFYaniO
X-Gm-Gg: AYBFou2ETWirH53KqzLhGjk6Gf/PFTS36vbNuiTBMCu1lJSTzlI7zT4mrLA8SqquCZi
 XCc7H/LqWYucNkwBSBqoj4HmJj+8Ol5XRHTEriu1wzp+Cj6GKW/22nukzjQh9Jv9a7jbjaB93Qx
 qphpxOcxtmIsn2s2SVFt+R2UO1G5GXGDM1zOGq88kYVwGTLUpa2mw5yBB0+5HmKPe0JE0pT3ou5
 wB6f0i79OS/rGmw10J8Fhon9AA2zxyJjzSHrupY0XNNHsY7YZuJLD1kcR1d3cCkWxmilq2qVepO
 efQsmobW/7YQ170Ub1A2yD1/+o2321dZ8kz7O/S31cbQ3MQqVNha0sJkgO63HVY2bCXkeQm2OjE
 78EH44/7QnCGXiWLZqKgXhOQ/c1nWFcBnr0g/QyhZ/H+gvcKQfrQbgDFzHuqzlOw9q3HSJhQLCT
 uyUcbuKgtvIAHNKFy91/Z9KwYE+XbYeWvoLWwQ6Bml28Ged6BsIL8WJf9AApx1AqEMnlzqyFA67
 cZRsGtHDK/r
X-Received: by 2002:a05:6000:310d:b0:485:ad93:eae7 with SMTP id
 ffacd0b85a97d-485ad93f13amr1209201f8f.57.1788924168579; 
 Tue, 08 Sep 2026 20:22:48 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bf3f0sm44768290f8f.33.2026.09.08.20.22.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 20:22:48 -0700 (PDT)
Message-ID: <6aa0d108.4000cc3d.393730.b586@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 09 Sep 2026 03:22:47 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-08
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

Autobuild statistics for 2026-09-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 22  |  0  | 28  |
  2026.05.x  |  3  | 10  |  0  | 13  |
  2026.08.x  |  6  |  5  |  0  | 11  |
    master   | 39  | 108 |  0  | 147 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.47 | 16
            host-autoconf-2.73 | 5 
             dahdi-linux-3.3.0 | 4 
  gobject-introspection-1.86.0 | 4 
rtmpdump-6f6bb1353fc84f4cc3... | 3 
                       unknown | 3 
                    attr-2.6.0 | 2 
                host-mpc-1.4.1 | 2 
            libunistring-1.4.2 | 2 
      passt-2025_06_11.0293c6f | 2 
                rdma-core-62.0 | 2 
               tcf-agent-1.8.0 | 2 
                  bcusdk-0.0.5 | 1 
                    ccid-1.5.2 | 1 
                  dpdk-25.11.2 | 1 
            dt-utils-2023.11.0 | 1 
        edk2-edk2-stable202602 | 1 
              findutils-4.10.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
              fluent-bit-4.2.0 | 1 
               freetype-2.14.3 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
                     gmp-6.3.0 | 1 
            gnuradio-3.10.12.0 | 1 
           gumbo-parser-0.13.2 | 1 
                     gzip-1.14 | 1 
 host-binutils-bare-metal-2.47 | 1 
              host-bison-3.8.2 | 1 
               host-gawk-5.4.0 | 1 
                 host-gdb-16.3 | 1 
                 host-gdb-17.1 | 1 
                host-gmp-6.3.0 | 1 
            host-go-src-1.27.0 | 1 
host-google-breakpad-f49c2f... | 1 
                host-m4-1.4.21 | 1 
              host-rust-1.98.1 | 1 
            host-skopeo-1.23.0 | 1 
       host-xorriso-1.5.4.pl02 | 1 
                   i2pd-2.59.0 | 1 
           igh-ethercat-1.6.12 | 1 
      libabseil-cpp-20260107.1 | 1 
               libecoli-0.11.3 | 1 
                libgsasl-2.2.4 | 1 
                libkcapi-1.5.0 | 1 
           libsoundtouch-2.4.1 | 1 
                libsoup3-3.6.6 | 1 
             libucontext-1.3.3 | 1 
                libupnpp-1.0.3 | 1 
                  libva-2.24.1 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                  ltrace-0.8.1 | 1 
          lua-lunix-20220331-1 | 1 
make: *** Waiting for unfin... | 1 
               openblas-0.3.34 | 1 
             openjdk-25.0.2+10 | 1 
                openssh-10.5p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.42.3 | 1 
                 pixman-0.46.4 | 1 
python-remi-2022.7.27-37-g1... | 1 
                  redis-8.10.1 | 1 
rtl8822cs-55971663534233fd8... | 1 
                 rtl_433-25.02 | 1 
         s6-linux-init-1.1.2.1 | 1 
             sofia-sip-1.13.18 | 1 
                 systemd-258.7 | 1 
toolchain-external-bootlin-... | 1 
                 uclibc-1.0.59 | 1 
uclibc-ng-test-132c6134d691... | 1 
                   wget-1.25.0 | 1 
        wireless_tools-30.pre9 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/e5952d0ea0931477005211d6356d1e507331925d |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/8d8c8dc699ff86a09994d0364fcff923207279a8 |     
  mips64el   |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1049a15d22583d12f13dbc9b985a7c49dec42946 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/390659f6b87cdbf14d0eb0a78a36f8ac5adcc8db | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d33e0165f33de94895364d220ddf84ca2eda4e6a | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f66a67a727d80b98e393ffa21bb1e72d8d763fd2 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e65370638e8440f281d39f5bc4f4eb51c025bd50 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b51e1f8d784dcde0b22adae3952467dff02850b0 | ORPH
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/5692771482e6c3d6234b53e3baf480b8a954d9d1 |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/289aa5e792dd429421f78afee2ad6c209a002e57 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/2bafd0fc17e222c610e46aefa93b36bf0030b6d6 |     
    i686     |        findutils-4.10.0        | NOK | https://autobuild.buildroot.org/results/9b75d1d340bf72256606b29c4b28b269b2dd5ef3 | ORPH
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/d8592e4e76d2cdeff73be25073d7c239a4fd6c0a |     
    i586     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/1263073e9e8f67b712d35d61f120b789ca3e268e |     
    i686     |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/7b43cda3bec6d8c601468a3f5b4b6750679d2b77 |     
    i686     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/c31ba1f13932d6e7845ace44065f3a8f5ab7062c |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/11fa5ef2425ec6fa664912fe0d3f18862b920529 | ORPH
    i686     |           gmp-6.3.0            | NOK | https://autobuild.buildroot.org/results/135963b1a7cf5d92d2ac4ed3d59ef1ffc2ca7bd5 | ORPH
    i686     |       gnuradio-3.10.12.0       | NOK | https://autobuild.buildroot.org/results/2bf368d91f2b56ce74b27751930f4aa95a526230 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/9ae40021e779e33402f244113872eb8003f779dd | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/9edea66d51323178ad7b887ea27efd4fc9087fbd | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/74fdac8f167b519b915f9cab95551ce7e07a9d68 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/a7097f73c351d15443b7656e7fc99e19af9c331a | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/1b45a415294bacf5e738821e20b22e8a7ad3be79 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/c15154f218989ccb93dbcb64c51560d66eacafbc | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/aa99b33ce1499587f9dfa90d0944d52d5ae21d0f | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/17d930fea840ad228956e443f3a9ef4fe295b135 | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/0a7fbc74c5b36e3bab4b9c7d542ffe25777e70d4 | ORPH
   s390x     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/73da1621bc27eec5b5a2c7b1263414e1d73dad69 | ORPH
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/54e6c0b968c32070d7e635d5c8048114bd663245 | ORPH
   mipsel    |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/1aee11fbb8a2b5987ad2851bc246130d2f1403fe |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/0a6dc286804578e758387d2961f449c11076dd51 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/90869ae2779720561656327a6a2593752029beb3 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/8aa99fb1035e8035944e26461d81c77ea418f618 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/1ae56d303cf71a0308416475e32b23fddbe7daf7 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/ce2e0e71311dc87542ab2e1a7548b5f3a5ec3f46 |     
  riscv64    |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/f6dfbac66a8ded57cb0e39879e64a4e1c3b4822d |     
powerpc64le  |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/8b291c57c5856cef9a7cdecbd1dd8346a926ee64 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/28c9039cbea07feee30b483eb19e1ba69f4013ca |     
    arm      |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/ff6bc791d59fb9328f9e8aba14cb8b69d2443246 |     
  riscv64    |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/6c99d3b595ab022d054f0a63ca0c28832e805bc2 |     
powerpc64le  |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/68fad9911729ce91fe650210ba01d6d37a3571bd |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/c8fa38d8cf15071a0b6b9aae5c5abd97cf02ee4a |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/db958aabb862133e45354966f7d64d3bab415b21 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/33d05900b2a8355738e7354cfe7524f58b953522 |     
  mips64el   |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/6ee108756cf3e773865d33360514f3f1f23c0e94 |     
    i686     | host-binutils-bare-metal-2.47  | NOK | https://autobuild.buildroot.org/results/56e62f916ac97906dc00bdd825a7ff6dcbc647cb |     
    i686     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/5c850680658551554c257f9265dc916c4db7ea69 | ORPH
    i686     |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/a93870ceabe95379d642f38eebe527c7a0c6ee3a | ORPH
    i686     |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/b9b16f679504f0a48a8b1c2d502359e4c67548e8 | ORPH
  riscv64    |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/8ade5ccfd82ec424effc0c6f070186646af0c5b2 | ORPH
    i686     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/dbbdfab931800dba4ff053fa4b413febed9395a1 | ORPH
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/4f2d44b337e0099d3e33420dd83da76660bca5b1 |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/1a825b7a51569830b4e66cc8e5b87ce5b572c8af |     
   mipsel    |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/c3b5bfb8d3650c54f112bf149a005cdb132dce4c | ORPH
    i686     |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/8683d9d7217ec3eb39815364ad9cf5ce6f8057ce | ORPH
    i686     |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/7e8eba59afe7befa956ee79459659c355de88187 | ORPH
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/64f638dbafd04d332d337b4f157504109421a338 |     
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/0430dae79c58c1c826b19f0099374874129b0384 |     
    i686     |    host-xorriso-1.5.4.pl02     | NOK | https://autobuild.buildroot.org/results/8fbc292f419a20051accac7ee92ce40c170cca27 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/d17ce527a1a96ee8bf57d5b03a29f261c4e5feea |     
    i586     |      igh-ethercat-1.6.12       | NOK | https://autobuild.buildroot.org/results/4279f707fd56885ffb676ffa923dcaf78044a2d5 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/41b6ef8c0728cf1a3c7dfc2c4a33f923ec8e5797 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/00f23d1142087a4062c667c652a012b7be320e43 |     
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/ab7a94208b9c612f20446c4ffaf0daca54883155 | ORPH
    i686     |         libkcapi-1.5.0         | NOK | https://autobuild.buildroot.org/results/ae767320012be84a38aba1729999447adc504e39 |     
    i686     |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/5a0d18667fcb61b4f3099cd0c717e9c365d0bc7a |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/fdf2c437753edc46acefc457adadfe6cb4c6c3fe |     
    sh4      |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/394a1dda49e9ef7d7847a882f18e216012aee628 |     
    arm      |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/c6feb290e02e7dc793e33f5c2cb867981affb65f |     
    i686     |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/87980211ee67f41015e439abddc7cf597c2f5d37 |     
    i686     |         libupnpp-1.0.3         | NOK | https://autobuild.buildroot.org/results/f73f86cb823516515838dcda545df95ba96c6898 | ORPH
  riscv64    |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/dd3376b633bcf05cf57e50e9a9ffa2727d05c334 |     
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/59cb4be342452a180f5e7f311b76d3ff7927e67e | ORPH
    i686     |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/d7b63d5f714b50d91da40e05c8d07672111bb0b2 | ORPH
   sparc     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/7fba1da21af93a7a0431fb9431dc3c8e872a00ac |     
    i586     | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/4a4798eaecc459fc377de30e581925a9e322e91b |     
  riscv64    |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/45617e7c94a0d65c9b5b9028ab9b358ae8f34b05 |     
    i686     |       openjdk-25.0.2+10        | NOK | https://autobuild.buildroot.org/results/5542ccc407e7f4a4122d719d781c2f774feb1576 |     
   mips64    |         openssh-10.5p1         | NOK | https://autobuild.buildroot.org/results/9bf138a339824b1eadf491e338e753f345799c50 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/2c95754974fd38fbabf44b983f23c80ffb53fcd4 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7037cfbafaa3c3843303fd32a97c4b04f3dfbd83 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/9ac6e7782cbfd0f82192a703f201c989fb7f200d | ORPH
   sparc     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/bdf3165a5107c8cfc79fc9a633780bdeb26c4f48 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/749f1f972a7eca0988f57de3bf518d5dde42379d | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c128b604d3d94b8af40844e4668bf785e29d46ea |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/6287edfed0bfaccbe309126d737a68620558c01e |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/026d0de3258a8b976b101ac84095fe9601dd4049 |     
    i686     |          redis-8.10.1          | NOK | https://autobuild.buildroot.org/results/89d145f5f14d63571c210b7872a890f66c2a83d1 |     
   x86_64    | rtl8822cs-55971663534233fd8... | NOK | https://autobuild.buildroot.org/results/d4705d1a933528bad1f4afdf8f621c71bda8eada |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/9bd226a28550463ddff9acdb4a322b0446c95dfc |     
   mipsel    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/72a256dd534a890f83444d6d0131ae14b76b9a9b |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/3f304d12fbf9e403b3cb074e6e86e333ded6fb13 |     
  aarch64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/4f9efb55306b6d5e767692e32f1b529ddd072e36 |     
    i686     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/0e3cfa704df2eb40e3473441b4fa87532a762051 |     
powerpc64le  |       sofia-sip-1.13.18        | NOK | https://autobuild.buildroot.org/results/bd74c178fdceadd14c3b8d68949ba810139d1936 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5167501d6ecbf284ecb37af7fe333044ec157cb3 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/652a728df72c77b2b97336bdf3dc7b5d0aa19070 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/eaacd0c38fbf313fc2d6bf23fa7bf56ad858cb94 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/8b86ed7246322be399f99b4ed3e97201fc8d9476 |     
    arm      | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/dcd2aecf5b3484f00c13a9dda7e4d91d0799bb1e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b5d8d90917bc426d6d209fc52295b1e8a8075e6b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/112218538c20145e8db2ede6f20b866c6ff8ff0a |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6a0d11bf6742dc30d0840ec09439fb43ef9296f9 |     
    i686     |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/1695c7b35b05754a8a82c25523383aabf3be59df |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/83458bd5280734ab6ff3840d98e64d70b2027866 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/f25055239ff4e78165c9825695f69fe1debcd968 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

      passt-2025_06_11.0293c6f | 2 
               host-gawk-5.4.0 | 1 
       host-gettext-tiny-0.3.3 | 1 
               lightning-2.2.3 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/b1ca35741a50e619bd01ddb7bee681c70f7fad90 | ORPH
    i686     |    host-gettext-tiny-0.3.3     | NOK | https://autobuild.buildroot.org/results/f6d1dc5eda458a8b864faecbdf6291a839d45e16 |     
    i586     |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/d4ccface7ad852e43a842867bcc8709d80412c02 |     
   armeb     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/8b0fca1d1d79d4bcb7116752acf9356f19f77406 | ORPH
  aarch64    |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7a3b7c92e3e2f0216c4ec8657fd51916bbbc5cb7 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 3 
              erlang-26.2.5.15 | 1 
                   exim-4.99.5 | 1 
            host-autoconf-2.72 | 1 
              host-perl-5.42.3 | 1 
libfutils-c326ce0cc2a735438... | 1 
               pulseaudio-17.0 | 1 
    python-cryptography-47.0.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/2dc4b3a4a21dbd3b1d667dc3c999067f4f45fd7f |     
    arm      |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/ba2ede0c4393bec4a5d3f36f0ea70fcd54d60223 |     
  riscv64    |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/44832d64916592566ebfb90dbbeff6ef79023c5c | ORPH
    i686     |        host-perl-5.42.3        | NOK | https://autobuild.buildroot.org/results/e85d73656c2dca8e97e8e7261d5f7645f4334ebd |     
  riscv64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/443f2ee0c991af612c5932b76b818de907285790 |     
  riscv64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/9d540cad7e42db27e45bc6d2457df297609e724a |     
microblazeel |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/710c404a39e5d654e4673a8fb2e4935aed9ad5b8 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/b80ebacdd5c060865b17512e39e945e270c18efa |     
    i586     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/33b811a2b60def87458f5c5ae0a2edd2b2ef7d66 | ORPH
   x86_64    |   python-cryptography-47.0.0   | NOK | https://autobuild.buildroot.org/results/151689013ad15cf2d1ac2009fb748c9c5d39fe9d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 1 
                diffutils-3.10 | 1 
            dt-utils-2023.11.0 | 1 
               freetype-2.13.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.4.1 | 1 
  gobject-introspection-1.82.0 | 1 
                host-acl-2.3.2 | 1 
            host-autoconf-2.72 | 1 
               host-gawk-5.3.1 | 1 
                host-gmp-6.3.0 | 1 
            host-go-src-1.26.6 | 1 
                host-mpc-1.3.1 | 1 
            host-mtools-4.0.48 | 1 
              host-perl-5.40.5 | 1 
        host-python-lxml-5.3.0 | 1 
              host-rust-1.82.0 | 1 
            igd2-for-linux-2.2 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                     mdadm-4.3 | 1 
                  pdmenu-1.3.6 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2b1081a18a66b8b3cbcc57c3d64b0102a1cbf9e2 | ORPH
    i686     |         diffutils-3.10         | NOK | https://autobuild.buildroot.org/results/160cc0a9100b796d3a17fd6f337e757d6f65f92b | ORPH
   x86_64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/d11a5f3eec4968d829686a62406692f9fafd1d7c |     
    i686     |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/99664a7136c347539cf57f2256c0a00c28ad18ed |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a0b196c0691c865b1f977c0b9c941c845cae43df | ORPH
    i686     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/780b06035083c302cefd57f1c187ef90528b8d31 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/3054bf07b9aa9e300139457197a283753e3ee2ec | ORPH
    i686     |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/bc4c2b0c858bd142d59db08fdfcf69ac204fe34d |     
    i686     |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/11ff27fb28018351977ab38c9b57c9a99389e1f2 | ORPH
    i686     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/d420b2ca9b638489f9ad9355cb69405e7c404b8a | ORPH
    i586     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/c203a7a76ab45ee34883766444781dd5bf43625d | ORPH
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/9ca23b9aa5b1a760400a132f2a62dc75221baf4d |     
    i686     |         host-mpc-1.3.1         | NOK | https://autobuild.buildroot.org/results/a38b10e07dea6a2c8ec290f4df0639340be152d3 | ORPH
    i686     |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/b28ba55ec903cde039c541d2b0561b5a3cb1c85f | ORPH
  mips64el   |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/6e8457413121ab06b0bb1d20ae5bff0ce8de41b1 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/2da1688a4bb3ed12f58b807601363a491a3aafaf |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/395648b72aa2af62717c10c47703b5341532c80f |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/9a573941f7b987ea618a072638a66626c1f2c22a |     
    i686     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/61ce413278d8cbbf83698cbb7fab3bec55f62979 | ORPH
    i686     |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/363f1889e57db2fb6f59c44bfb141d4eb2090022 | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/55b3cf07a13848a89eec2f1ba93d1983d651f702 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/7fd5ed95b5adc892e6ce7e38a859a9e7eb64ee85 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
