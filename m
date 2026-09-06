Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715A2C79F8B
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 03:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D29880EB4;
	Sun,  6 Sep 2026 03:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdAaouCgTVqO; Sun,  6 Sep 2026 03:27:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A75D580EB5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788665230;
	b=CNf4p7OT5LpChGl7+FiyFTtQedkFlj+z6VjB1/OiEx6pAiEWagPXFx88vaEeYniaYuqr
	 ULR53hOZmhj12vFf5SYt3vs58D4PwMRoopdyCO9Ov6GNyGXjYFyGit9jvQJXSgCUiVYHC
	 K+ARDBEUuJdiwhSLQxvw8/No7EWGMD2VJXNaLV47mEXUUy3UVVUcHBczZyH8g/Dlqclcf
	 7zwtWU3zS5P/AoGI0n0GgCxXkmAdELFrvnujWZ8/66q0xW2Z/TbwBTgYy/Gw3tmHzaoZf
	 v2O956/B2HcrRvPYVX8yaEDJn34pkpnmZqXd7jZMIf2LCQB8Q9ezVNQtxzHnjtzeZUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788665230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9ensez1JgsKDrOfQqFl3Q3hC23UXlFC7cKCXcjQ0bwE=;
	b=ZhYGonueMMVcb2DPF7dUjdZZRRcWnLdLRN8Od9cr2gEhTO1YdvTiWC77bpgb4jGyXhZg
	 iZMuk68lm+6/SXcTi1sp8KwnGgF1qh2v9bVzQPOVYAIiWVxCwM6DV0R6Jx8/I4aC7UTuH
	 JYm5IMBI5Al6aU/bVwaie7Y2VX+h9dD7xbxeN/zKZ9hvqgu/ZbrP9GUUelfa63NChXk/v
	 AA1vO9/VReTVyeeuiuVu3KDOyT4vuIOJP43LEifRGlhlo0oJV2aIsSz9VyFL66D18r43J
	 lharzGxlj9oPpVkDyVLlh70LWuvLKIwPDIG6Z9UuklNE6mAXm6LesC6tCUdHf9/tT7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788665230;
	bh=9ensez1JgsKDrOfQqFl3Q3hC23UXlFC7cKCXcjQ0bwE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lWu/oocavnVcoDS7FaT1in57JJR4lTPlBfU9Sju144vEs7FGZs0xrwta9BcbJ8PUx
	 KYWsuarSOuX8cVQ+NrvZPdPHl08YPaTvG3lcbpofk/QCb5yWTK9jR/zJMs0gbIMYvC
	 ZCWng5msVEpna4edCfQ77PngWvS4Mcv8OtCJqJeswrpzGPLSyJgGWvznEtp1dEN0Cb
	 bu1JXIzrDa8RP4TCbjUzoI7RMOJQ8vJHXAM9PRV4aLf9ylpfE2FGRTTrAQj6WdVcin
	 MAL4qPH+psjHdhZ/cETLTUomsElEsijEfaZ99IxoiVfCa1oRacJP1U5G0AI0o1Ofgw
	 K0YPyMZOnWm6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75D580EB5;
	Sun,  6 Sep 2026 03:27:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C45E3136A
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 03:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A755B407D9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 03:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kt4VbMuCHQB1 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 03:27:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 59DEE406E0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788665227;
 b=CW11QgN6rOCpjynCxjh84a3zQZMthvJhh/PLRzmArXKgtIz3Ul9Ms25nOWAW68F31Hg8
 o0/67S6SRhzfRRxbJAt43VrLNMGfI77qsWCY6HSad16txYI8YIYpmv185C2PdDU9j+4iw
 OWfuhL79bTfmZy2lEknzL5EWgileVWqUQpp2c/gDj5Z+P1moJYkM+JdPk19fzKuWuACR/
 k1VHvLG3QkFJMG/eTWfrWoHwyb0vlR7TBlWz+JJlj5FuYXfsdCyiZ9x4YaYz7880jtLQS
 PumDJiEYSGllx1Ot8x1AEqlIVaUfBQrWYPKkO7BcR6vZyMRmp06NOUqiWQ4rwnMzieg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788665227;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=OX7bDuik1uQjWvEpz/N82+ITu6WdYSGkGrakt4A8sGE=;
 b=KcmEZwjO5m6EqyOfmLVN8JLck3icouv4K2wndHPUKpRZdYYDb6bnZQWUn/ElUCyaQMAy
 epDH/YB6r54EoCrOXHJFsoKm0KvqxRGOxK1liVUGZplSuFsXthmlmigSOSPOSsgAUrIQy
 oggb+kAsGYadOrPKz1SgCxZBg7tfyTlLoMq6LxDT8Mylb2Fn4mBD87BmPMGXZGgXuwZBB
 nPRv62Nbnq07jIF1EDh6yT0hzCWgmcmkI1qzdhiEpnIGPWcY5cAIFIK2C0euPoIWFbnaf
 cwzHKpSvuZPCvMc/oRTDY+zsqIvYrCJTaqNmjZ3nM0lD1RvXdNMe/f6TD6sYWQEORKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PCKugtnL; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PCKugtnL
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59DEE406E0
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 03:27:05 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49d036e0e99so4637485e9.1
 for <buildroot@buildroot.org>; Sat, 05 Sep 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788665223; x=1789270023; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OX7bDuik1uQjWvEpz/N82+ITu6WdYSGkGrakt4A8sGE=;
 b=PCKugtnLP/EuFTPzfV8Wn1xOyWM/rrRmUsaKraYlUruep1nXvw9UrskTpCY/Nv7RZs
 Xxf7Gt9+1lAYbH2WZYCxDCrZrp5HcXfzqelZQC4SRLef/OLGmUe6GWMdOXhroILtWTud
 zTQfKIcFwM3rlZP6HhxQlnS4CRTj6IzpyNPuCRBGnWQHUp8E8YtFVa5Fp2xGMer6qV8e
 beqT/GiqyRXUWiIko0xAg9drLtTZAvye8b9A8o0uIUq8IB8oMq2sI0uZtebtc28k/4DV
 kwFdkApIg0tvaBesR+UBLeNLitdHTb3yvcVzULqY2YMfQkdJFjj6a5o/nqVy4VEyQc44
 ZESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788665223; x=1789270023;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OX7bDuik1uQjWvEpz/N82+ITu6WdYSGkGrakt4A8sGE=;
 b=EEUc2zRfmS3GDgi4onKafkl0nAI3Q22301RMAAbnhJQwBXSAq1QEnNlz1OSL66+xu9
 O36FHXrRuIx8uuLO4+Suc7VsA9QlnYTv5KKx2fmOL05qhjvvB0TPlX1xkvTKlIfifP+a
 UD5EHjJPDhshPbW68cC2GKL8NxoELaqdJwc8juV0/fSh30wa4UuT27q8ZB9bpqKBUptS
 +zR881kotJon+Au9VdNn2lPrrfYS/t/66Bo63e1o8H7gWn+vQgPKSnax9vG8Kvur6PU0
 EVes3M//4+mxcNeOEAI031v0wCQjvXjKWy4u/Uc/TiNYfGiFrF1IgW8ZzbvBbf/NGEcT
 QyuQ==
X-Gm-Message-State: AFuF++ma2pYu3depD/FeTb85Zfc4Aj2Ve0Ft58J95j3Txwi1lfj2HSWZ
 /aXVujVe1T0eqIKdAUAJlv4BTy6jU0xnVzPxGoSbNgsEkWWZodCL+hAc6mnrJfMr
X-Gm-Gg: AYBFou0DeSlhGUVRBkUk+zBJ9u0p4/s2ocoxuWmhWsCUB9sTD8m9IU0RpNDtdixbYUF
 efmwuTaiEMV/LH7aMM5ZnI0SfgC5WbLwblffV9/Ci18IvWlIfbTsZBmA+8j7++E7ZFMlZlya8AJ
 DiX26WBq8ttR5lcXXnTU9PX1yeyuU1HylfhEyFLDW02UuMyj5bqi5In1BfBQqI+O/fbt9XeY1Ad
 yPQAYsIbUiYsvEl7UB9fKN2hzLzD1dzJiS+IxKnZlpm0zx2fP72wXHjhUJuTJtk69Ok0yTu2IHs
 6gtB7cBTqN+sRex++QN2f+t07Mefz+P1dt9DbAzFRxTHXIZ+E4KGpK9M0s/sEimOH0QFPczxdAp
 XG5FCH6UBdHDMXL5alunvB63VerKeQfb6MDOmyQYHNzG+tiyQ4p23pZUMlsjakf7MB+1VO+lcyj
 TAuMIIwCCLLQPPgugcbF2nsQ7WqR9afMgRhhERFPZ4OaQaZqNVTzx4yYQtK7Y+elk=
X-Received: by 2002:a05:600c:4e46:b0:49b:910c:7703 with SMTP id
 5b1f17b1804b1-49cf823f160mr158044485e9.9.1788665223189; 
 Sat, 05 Sep 2026 20:27:03 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d03703f13sm46314455e9.0.2026.09.05.20.27.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 20:27:02 -0700 (PDT)
Message-ID: <6a9cdd86.de3d7003.35aaee.b1c3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 06 Sep 2026 03:27:02 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-05
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

Autobuild statistics for 2026-09-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 13  | 25  |  0  | 38  |
  2026.05.x  |  2  | 10  |  0  | 12  |
  2026.08.x  |  6  | 11  |  0  | 17  |
    master   | 30  | 91  |  0  | 121 |

Classification of failures by reason for master
-----------------------------------------------

          host-binutils-2.45.1 | 5 
            host-libtool-2.5.4 | 5 
                       unknown | 5 
             dahdi-linux-3.3.0 | 4 
            host-skopeo-1.23.0 | 4 
           igh-ethercat-1.6.12 | 3 
                 skopeo-1.23.0 | 3 
                    attr-2.6.0 | 2 
               host-gawk-5.4.0 | 2 
                host-mpc-1.4.1 | 2 
                libmpeg2-0.5.1 | 2 
     linux-5.10.254-cip72-rt32 | 2 
      passt-2025_06_11.0293c6f | 2 
                 rtl_433-25.02 | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
                 systemd-258.7 | 2 
            18xx-ti-utils-R8.8 | 1 
             alsa-lib-1.2.16.1 | 1 
                   atop-2.13.0 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  boinc-8.2.11 | 1 
                   ccrypt-1.11 | 1 
                diffutils-3.12 | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.21 | 1 
                  ffmpeg-6.1.5 | 1 
               freetype-2.14.3 | 1 
  gobject-introspection-1.86.0 | 1 
                host-acl-2.4.0 | 1 
            host-autoconf-2.73 | 1 
          host-binutils-2.46.1 | 1 
       host-gettext-gnu-0.22.4 | 1 
          host-libtasn1-4.21.0 | 1 
       host-xorriso-1.5.4.pl02 | 1 
                  iozone-3.508 | 1 
      libabseil-cpp-20260107.1 | 1 
               libcgicc-3.2.20 | 1 
               libepoxy-1.5.10 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libgsasl-2.2.4 | 1 
                 libiconv-1.19 | 1 
          libmicrohttpd-1.0.10 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
                 mdevd-0.1.6.5 | 1 
           oath-toolkit-2.6.14 | 1 
          openfpgaloader-1.1.1 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.42.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 s6-rc-0.5.5.0 | 1 
                  screen-5.0.2 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                    szip-2.1.1 | 1 
               tcf-agent-1.8.0 | 1 
toolchain-external-bootlin-... | 1 
                 uclibc-1.0.59 | 1 
           virglrenderer-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/0ebc664ba23eeb9fdd516cab76b71efa85439e93 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/21b721a791f9f84afb447a70d0cb2ca645f4e978 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/e6cd7cab3a7d28cf733ce064236ae98728d2d47b |     
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4e48d5e8231fa9d26d3a59640f52fd2c16f8d6b4 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/d688e7b890ec0a8b44e4d94a298ac189b3bd2f57 |     
   x86_64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/afd3e728d4a11e093d7a5ead24e03762636e4fe9 |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/f1015559e37d73403c396ee883d9a73fd167b9dd |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d2b353a6d5939995563e5d9421703869c1fcc9e6 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2cceea2561478c182df625a2314143293a89b564 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3a679d5984b3935d1a14f86d1a3b558b53864eba | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/34c3575f3dd434b281529fb0987dae2d24b741aa | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2d789bef3558a2ad0963554301f5e463e2a61825 | ORPH
    i686     |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/1401e672d1bdac53077fb7cbb4a638ed62782bd9 | ORPH
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/1d9e15c6d6a9a053786f2521e9c7a71b5b9689ad |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/3c71ba6efb52f7e5cba341b1bddd58c7ea6d50ea |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/65cf15894b1392733fe1fb4d1ef0c9081c2ad319 |     
    i686     |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/c8c077af65881b6ef451f70169958ddf21cbd38d |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/30bf97c40dae60ecba39be8f58ab183f73ccda27 | ORPH
    i686     |         host-acl-2.4.0         | NOK | https://autobuild.buildroot.org/results/db47f96a7a49ebde74fc8988261a13d5e8194c7c |     
    i686     |       host-autoconf-2.73       | NOK | https://autobuild.buildroot.org/results/359400735bc1b435294032747940f40cda0d97f5 | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/4a9ae8be1c564b1cfab5dc8a83e15ab826a341dc |     
   mips64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/53f8e7290fdec3ed130f433b35e4f941cb530cfb |     
   x86_64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/cfbcb80650785de7ad41a7d04ee005cf135a3ef2 |     
  riscv64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/51c6a5cdf1e2249f607c6ed68aa187d0fa96914f |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/d7e0565976cab157d7035499ce89e7fa7bccc4d9 |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/53d64524f5a4680d39b9d1b672f6e12a29ccf87b |     
    i686     |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/622d02bdd812734192613ceb6c059ceeb06ecfb6 | ORPH
    i686     |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/e31da2bc8a7ee0729ddb8f606bd0be94289599dd | ORPH
    i686     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/5e42502aa94e77bc4c91432cd7cba158f380cd4d | ORPH
  mips64el   |      host-libtasn1-4.21.0      | NOK | https://autobuild.buildroot.org/results/eb256a65fade23cf9db7738e10ed6e3daf269296 | ORPH
   x86_64    |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/242680ea7a79d490bc0c95bf89bc0854c99b7403 | ORPH
  riscv64    |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/554c86bebf4c679d1128077eab3fa9e3dad7e979 | ORPH
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/50d63ef2553a2d55ef05e0114b8f112c85c11be0 | ORPH
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/ada9562be1d3707e066f8361b7feacc0ada75a01 | ORPH
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/3ff687c7e93a68dd5086499480b1b55016bec6ed | ORPH
    i586     |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/3d6876ae363f1baef14d7742c7db8be422a2af25 | ORPH
    i686     |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/8e65dac737da1079928bbebfe0dd6f54f6facae8 | ORPH
    arm      |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/f68d58f86e880113048f9522e4bb7cfdc6711113 |     
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/06bd3df2633ebc34ec81d04f13eaf7fba6a2d5d7 |     
powerpc64le  |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/cc05744672fd0a7e3030e5e99b7527c204efd9a2 |     
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/e7dfb67efd82d0a06b31fe9ad79a671b9f6a6aa3 |     
    arm      |    host-xorriso-1.5.4.pl02     | NOK | https://autobuild.buildroot.org/results/0d14607d182727cc59822cafa9e0698e77441d7a |     
   mipsel    |      igh-ethercat-1.6.12       | NOK | https://autobuild.buildroot.org/results/4f509f1f788c1b8dc5a840ffa2e435c5ed7b6eea |     
    i686     |      igh-ethercat-1.6.12       | NOK | https://autobuild.buildroot.org/results/1460b43e7e05e4ba981628b2f84e8599153e1925 |     
    i686     |      igh-ethercat-1.6.12       | NOK | https://autobuild.buildroot.org/results/dd2ed09cf164663bf3615160bc8b8527148cca92 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/cff2b27e5acd3b75ef284f1029ad30401937b66c |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/e1ad3e0c3056a6c4fb1b97cd6dfd4d7cd9a0fda6 |     
    i686     |        libcgicc-3.2.20         | NOK | https://autobuild.buildroot.org/results/a6f7431ba290957b82dc28e51c255e64cc2bcd78 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/fe3d16dbd40f14852e4f9fdadb3f0b8622694ddd |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/f078258bdbd316d3d9f17bc3bc56c65330b2a33c |     
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/6bd7bf1273dd821a157c30f0f5d677b363f4a3b3 | ORPH
    i686     |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/23412e9587f854337c6183ac7d992cee7ee862dd | ORPH
    arm      |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/9baae0dacc8f616e6b7b94feae4507f89a885ce5 |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/06ac674c4975414318e71ce063389291942ca2bf | ORPH
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/31edf3b202370885d70986e8d6723bdbc60386f9 | ORPH
    arc      |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/1c208bc3ec2f1cb5eaa9d5df5bf66d77c2dbef89 | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/4af8cf4517f6f9ad0c09178d2c3dd04cdf96d2ea | ORPH
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b84663d863ce4dffe76295fd55c9e9c796561b40 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/540da62035d5dd89192fe5ac3855380976fd63b0 | ORPH
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/6cbb296f22fcce7f1a4c25aad3e9b1f80be29f26 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/9cef01ed5ed5d7ced31d7e39eae7a1b3b93a4f7c |     
  riscv64    |      openfpgaloader-1.1.1      | NOK | https://autobuild.buildroot.org/results/1ff81581162226e9412ca5d5d4688e0a12ed68af |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/bbdeb12f4c728f318dcf3c2ff8809710216d82d5 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/5363bb09dd276c2bc9627b84e01f4adbde768fbb | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/fc3d52187c0748eb0f5f2c1cff286aeec687b36d |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f18d75e463c9826a1a8380d1f91a332a9dd6d749 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/e326a6cc3de5ad44e986392526de3da05b1337b5 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/8f9c314fb28b32649dffa2380648686a275a7292 |     
    arm      | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/e6546c7e7f565aa76dfacb998fb4beadecc2f8a6 |     
    i586     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/b0cb4d3d1027a99de527b0b83897f4eb35f3056f |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/486fa6149d4daf7543f4e025a3ac790f091da237 |     
   xtensa    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/2a8041b87e71b589658256fdc0ba7a301e2b0a5a |     
  mips64el   | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/0fbd5e4773f370d44e6a5fb1a4dd5ff63d3e5e4f |     
    i686     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/5ade518bd04107c0e19858ae85e533f0d1d6b168 |     
    arm      |          screen-5.0.2          | NOK | https://autobuild.buildroot.org/results/fe6dfb2ac058e7f37d0332e5b6bbe7de72f48e06 | ORPH
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/cbe45b064469d9eb719d95653f983fa3419d65c1 |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/b0f7150f3f7b72b5aee536d435af40b62fb0c419 |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/eca3c6a49ee52d658ac3c909fe251c1360130061 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/b9909c7392ee9af70e4fb9cb529d97bd42c93024 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/57a7060af37f4198f8312531552d757b0b25e696 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/45a7d926e66579fb6e15e776cedfa2bd06a4bd9c |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/89936ff244da69c88a59603e5d56d7d4b46b5163 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3c96dea1ad3d9e2d906fd2cb3307c1e64fb42f88 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/e00eb194e8b337fcc6c5f5293c59248fd068f827 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/e662ffac5e21c716d0c1b7951962b6aceae1129a |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/00301e33ae0ae76de604844281aa0fcac71e11ee |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b6407f1cc3a3792db75ae360b8f300fd8b137363 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e91ac8983898e622f51ab401ff711f2a3cdec914 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/69725f774d71802c050d7833d528c6b789d12df9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9c0448b820bbe38ea206a1c993f499b8fb808665 |     
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/df739da2f9cd850269e44950db7c1603caea4c17 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

  gobject-introspection-1.86.0 | 1 
          host-binutils-2.45.1 | 1 
            host-libtool-2.5.4 | 1 
                host-mpc-1.4.1 | 1 
            igd2-for-linux-2.2 | 1 
          lua-lunix-20220331-1 | 1 
               madplay-0.15.2b | 1 
   openvmtools-11.3.5-18557794 | 1 
               tcf-agent-1.8.0 | 1 
                    which-2.23 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/c10fcb22480aa8cc231146276d1cd1c9d4615310 | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/3eef27b0075d3df0099b040cbd06a0d4a92579e3 |     
powerpc64le  |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/ac36da2339e9184a6c063748f2c98ab2978b82d1 | ORPH
  aarch64    |         host-mpc-1.4.1         | NOK | https://autobuild.buildroot.org/results/25d2842649b043801479a84a8e698c7b63ae120d | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/8f095027037a751cb48358b574eb3d88f5101978 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/5f7f97176dee8b9732c05fdeccd610cf1fa0b0e1 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/8756c861c3ffb0decb7aa614b863434cefb2b40c | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/9644561a0045c857d9ebcbd4bdd01340615f6f48 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fef5f7094cfcb81142962415e5360b36c1ae68c1 |     
    i686     |           which-2.23           | NOK | https://autobuild.buildroot.org/results/2c80e85f78634ee55c2bb54da3aed1d094426e31 | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/c78cdf1faa7b688bd048962bb8940a0fac8cd706 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 3 
              erlang-26.2.5.15 | 1 
               freeipmi-1.6.18 | 1 
            host-autoconf-2.72 | 1 
            igd2-for-linux-2.2 | 1 
                     kbd-2.9.0 | 1 
                   libidn-1.43 | 1 
                wf111-5-2-2-r3 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/4d6dc409b45ed3b7ba61cff19c4d05ee4f27d7d5 |     
    i686     |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/03162a64c2fbf57e0bedd48a0a4e09c3873db60d |     
  riscv64    |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/87fda98f6e088a2834c5bdd8b4a31486d610bef4 | ORPH
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/3ff7dcbcce2285cd0883947eaef45b34715bfe81 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/e1d49f4fb6cc0598b66f93f6f339ab583e8f2f9d |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/856e1ec1929a4fad2786b11601e1ed6513421bff |     
    i586     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/a592d4eb17faa111a39b691eb68b06a0171faa88 |     
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/1892d6de74b91a3aa4ad97d26b8e9e8b3a48e427 | ORPH
    i686     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/909be6079627c3c2ad658cfccf9b14f8b565edfc |     
    i686     |         wf111-5-2-2-r3         | NOK | https://autobuild.buildroot.org/results/bc68ddc48b5d5a41fa88a7df4b4e5ab35f876b6f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-perl-5.40.5 | 3 
package/linux-headers/linux... | 3 
          host-binutils-2.43.1 | 2 
        ltp-testsuite-20250130 | 2 
                    bat-0.25.0 | 1 
                  bcusdk-0.0.5 | 1 
             dahdi-linux-3.3.0 | 1 
                  dpdk-24.11.1 | 1 
              erlang-26.2.5.15 | 1 
                freerdp-2.11.8 | 1 
               freetype-2.13.3 | 1 
                  iozone-3.508 | 1 
                 nettle-3.10.1 | 1 
                 openmpi-4.1.5 | 1 
package/wine/wine.mk:347: w... | 1 
                  stunnel-5.80 | 1 
                   swipl-9.2.9 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/4d08e9dbeb7f7d0f908a322661c97651203cc9b2 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c6c035438e6b16cc2c6ab606f33828453523a8aa |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b6e1f803976291f5c04731e7a40a07ab6ec30fb8 | ORPH
   x86_64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/13f220d5a15898ab283ca5299885af0b79552998 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/01823144fba9b653fe04bcefdc248a6bc5b2664e |     
  riscv64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/b50eab246a3cba9fdb9f8ec23bfc3faff4a3895d | ORPH
    i686     |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/ab6064deab9667631a09d97e2b2e711f9af4d9b8 |     
   arceb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/976a5a7a323235f764c551537abcde7fe5e4f88a |     
    i586     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/687143371fba029cd8c2fb172b1de763d90acdb4 |     
  mips64el   |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/c7943339deca3ee8836be07be6a2c20e15500649 |     
powerpc64le  |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/31b4a0bacd30c459dfd38ae0a73ada14dba691db |     
  mips64el   |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/66037fdcdd489008cc8caafb94182193f30cff06 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/25667b6f217a625dbd778208f059d6d1476fce9b |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/6e4718b456c8bd8735e8b9080f7330957dbc3b8a |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/52d29a85930a75db8920f40c35626f6443513383 |     
  mips64el   |         nettle-3.10.1          | NOK | https://autobuild.buildroot.org/results/feec4ebba717d98390d8ba863fdf32655155e287 | ORPH
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/f37a1d4d47ef201f5de7c4beeb911d91fcb19726 |     
    i586     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/bda4e87b64d381ca87dfc91df49d1b3e77b6b05c |     
    arm      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/afc2750349222bf7b0d45c5fd601060869dd4822 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/15164b76b35589c38a465aa38fa0da52c4702ad9 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/e82771c7686c303016ce2e7dc7ed2b61de776f94 |     
    i686     |          stunnel-5.80          | NOK | https://autobuild.buildroot.org/results/b6779f2a4e61838486403659bb97d4385b6f789d |     
    i686     |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/3baa1b6087aeb87eb3d34e019bed1c4f8f685a66 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/509345ebe90c0a006f601a19f99abca88a51a381 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9fd2324625957bedd30c27697fb8b0aa4b4f989e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
