Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79D2C982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 03:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7390A81199;
	Fri, 18 Sep 2026 03:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_pzTuEdZEsU; Fri, 18 Sep 2026 03:30:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 393738119C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789702204;
	b=Tvb22EhPFqXjAfM1U6TNBgCjuvj5Yk0vrDfDrR/+eiFjDTm1JA8uP+ycCYxoYDeb+5Ra
	 rNDR86RbC3F+MwRiixtBoQv8WFsk7DbKhkJHD1yFy+EeQRvH7ACyplEXzmbsKbezno26n
	 zyC93VV+PXqZdIJpxguvCBrTvJHVotAO8YEjWt/9ZxO8Zz94/GkSuZo8t9OLOUg44FdZs
	 YfLxKm36NUMDgAoiNCJ76VuKOX89PPnYGnZjVzcyNIJkVDnftO6pt9RY06MSpld99cBah
	 aPE5aPwcNkC9b9ZRvFO5EMkoXw2EE7TbmIMLo8lgJLz8X6jI7m8LeXED41h/IfqrTYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789702204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dhhYstcB+XcPH7zttrcSlYyyJTOZP28Q7nlOYqHDvJk=;
	b=SYVNq6LEdSwYEZ0JyzkQRiRP+kFfoppIhYUZYzirIIYLuEDC+YmuYX8c1EPAUoTKk5qa
	 0EFkca2zmTuGsccqo7Jx73/vLHo1rBjLkmfE132t3OxfktwlTPdrnr92VjHdWczwVsdSp
	 ajtGO3bEYllq/qEWmzlPB+Su8kGIFiaD5+Sb9kuWj8dtv84mcd8KgauvDmnROrDKrtRhq
	 /f2gbce/DOJXsu3UETxIx5HXBLGHpLWYnVfW36mSRpl8E1AWSkjDORn65OWGAO2QoG9KA
	 D6WHm85AmUPEVcMFUJ98rQsESCcZ1Qvq9QykpMZ3hXWPKOZabdW/+hVCkH+njCDD7Lw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789702204;
	bh=dhhYstcB+XcPH7zttrcSlYyyJTOZP28Q7nlOYqHDvJk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HGXVjywvqmBumiY4Kup+GYR8iD6FlXQLgDUh4M4n7XVMSlUfv5fLDnxni4amwE7xv
	 A2BmtOpNpGy4guaQL6891k7epeO+foJmNPXO1Fmb72y4YPMxyZwEbkw1/td2r0nlnP
	 iWg2ZCoE4MbPWcVowM9j8mj7WguHkn4Hgpotw5O6WbC3G+FOv27rTFymhGobHdQ0Gu
	 d8ciq9IFMz4HeKYMkpFOW+8BrRrVfcRjn1CXIEzKpCs0MnE0ECh5WSwliTcsbYbHv+
	 ZIoT2VxoFq5TZlDedApZxBYhrdF4dGX0AfEnGrve4MB7l1Cj9JhL7nQn2tqT7OdPcG
	 OwZKo8a2e9chw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 393738119C;
	Fri, 18 Sep 2026 03:30:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C268362
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 03:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E3E060BAB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 03:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DPm-zATNUhL for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 03:30:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CA02260B8E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789702201;
 b=awFpDy3VfgYpkpVHvbsTERVYgZMj8GIU+oudaUfTv3wQUA6iAqNksDyXddFqYKPcKjpB
 /X+cXEgY5fesF06+UXjlL4+Nyj4h1fTIFeJTRW1vvNG20npGUaO8ML0GgO8nSBM3jhWP5
 2Q5WfsuM83Wuc2BHxeBxIH7S31KebT6v0Vv86cY/b6RHhnl0bLMSS69xClyzoejo4dchH
 Vvvt5yEQGWg2flC5cL7x/wLPA2hV+YBO3X2a98BhX2DPNeEG9vaYXjMG7kVpJtMyqvsNX
 vwTpOmFBeIHbWdpUqgysrcCsNXJvQDsSCiA/+tl6RfijdNMd6hwAyJi7fFpvrBVQAjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789702201;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=G3BmEEgDCaFivPeJPCm+X2/iC0sk8IhCQaCLMtV+KFo=;
 b=CkcclQAbIJubY2cS8wqaDPoOYVLS73doM7yGWxIFWOri3MoEydBZ8F6a4MaCCUf7xtbl
 wn9iTBrLWeF71Q8AA6150XHCH48yigL10uZicYSQG/5Uq4lCusdZsam0sz8QcoopSrZjX
 SCXGS6ORCZRx/a79H/gaAEjKp6tMUZ2uteV9ITiNjBXohYX0EWpOmZWOEewihbzSf4S7J
 GPIJPLi+J2gEGpdd3eI2aTotQ63tBRGISfLPLUENiYYUYofr5Xp4+8OFtqhtSp9zBLYiy
 g0l2Poqic5brJpIe92H5QDjc8QbBESaK9lqucyf0LU9nlfrex+CQjD5Jcw3x2+fvaZw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gPobDbl2; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gPobDbl2
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA02260B8E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 03:30:00 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d3931so1860995e9.3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789702198; x=1790306998; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=G3BmEEgDCaFivPeJPCm+X2/iC0sk8IhCQaCLMtV+KFo=;
 b=gPobDbl2XCBG7ftxbpPoTAq8fm5iV2ox8ZEy+qAIFT2viaTa8n/AKmYD6B5CEDnsxr
 +s9RXDXduIQzEcicpe4oyzVZKY4n8DtN8H/ts67cgVacHWu7+hZfYTw3DrH7D05bHEfx
 dF6/2C3eTiFa4uWZSm3N3sa6LhVCBcFj67qU6CvvI11uHU92pcmkltr2+3jTqEWpgiAX
 60Uucs1dv0ik7JkA6WJzN9XrUIfaKQTVtpPV73vP+WImI3iDCaApndQeDkXRrgG0sYyk
 dDXH/UzVGzH82/VMf7WEo8i4ExuhTYwls3ZNW3cJon02GuFBk/7JY4JHxgUr6sc5XwRj
 KpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789702198; x=1790306998;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=G3BmEEgDCaFivPeJPCm+X2/iC0sk8IhCQaCLMtV+KFo=;
 b=JsH3knwfCOoPkrWkaI77qEqBA6YA4hUmUBLvnoDZG1UIdHTr0JRfTtCCdLs+axpIo/
 T4O7M1m9Jb5+BJNbldoCMm6VRwFrheRjNA7Bfo9MI89cbPHYQz1HdKzVyZEbF4zJRrZE
 NNY/S6DlTxiP6ZH5z0hUuWwIQu08ik9YnJfV7FdlToOqrhPc+bdmX5hL3V9mBr5XblOw
 iiZDYYe47bTPCo9JBzf6SRH4lVrPHuHyuis0fkSkuyoyrf93yPgq6RhyRKWIsS69WN6x
 eayaCxRLgtREXHdEyBxYc44Lahx7JtPJG2daPKE8AAGAdUzaKoajPI+ywaItfCOthDI+
 Wdgg==
X-Gm-Message-State: AFuF++m2c6kxlNVim06DSGAJLKsbUSo8IKiLkajZ70RZtoCxY1KmRSZ/
 CDA3tC3Q7aiZqPR14EgNGKcE4CjqiNXX2iWkEnG+otpK1F+qpnTFAKzvvDzGMQiY
X-Gm-Gg: AYBFou3ze0cKSnILnMUYrq7oCFeQmx6d04NGdCpN6egXOe8xwjcNVyoN+XCRS5MK5AN
 vxGNcHDqomWYE6GoZoAIzaMNg6U6Fr/MpqcMjXx5bVkhTjc0NqoJK2s1FkOly6wwTJmPZIdG8bD
 V7FHTZtFZdD3DRY1vucyWWolDAkqOm2vOHIpANWtPMPGCIeoSjJVCfHSz5LG644L7ihVi0ApsoE
 4Q+nkq20FWWnUMSUoHuk2CQl0XOLQeEIWtCcKz88whmUAHSlv/fPP4FGBxliE3XdDe3o1gzohgk
 Vd587AXeVTx5nQNtNcDhi5Nkolloxs5+CyvTeuLGES//D8t58sTSa+13x7hTsj9tuoHGQBgoIfg
 LOwtpJZcjN5mHK89P2FSHBdOTz0B8RcUKk/sWVVtzKOmGkttLIpUdzxXfHZOs26zJzrB/Ax7o/H
 xVivYL8/06z7SPybfetSd3v9E8ydCnE4m2RdNU7DUhJCeGovdaGmr3jCKRXLi2kqeZCwWTajVcF
 Q==
X-Received: by 2002:a05:600c:1f8f:b0:49e:8354:26fb with SMTP id
 5b1f17b1804b1-49fc574c729mr11100095e9.32.1789702197799; 
 Thu, 17 Sep 2026 20:29:57 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd23a815sm133974355e9.14.2026.09.17.20.29.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 20:29:57 -0700 (PDT)
Message-ID: <6aacb035.09b60c6c.8b9bb.70f2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 18 Sep 2026 03:29:57 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-17
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

Autobuild statistics for 2026-09-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  6  |  0  |  7  |
  2026.05.x  |  1  |  4  |  0  |  5  |
  2026.08.x  |  1  |  2  |  0  |  3  |
    master   | 28  | 38  |  1  | 67  |

Classification of failures by reason for master
-----------------------------------------------

                   atop-2.13.0 | 2 
             bubblewrap-0.12.0 | 2 
          cloudflared-2026.6.1 | 2 
      freeradius-server-3.2.10 | 2 
               tcf-agent-1.8.0 | 2 
             alsa-lib-1.2.16.1 | 1 
                   dante-1.4.4 | 1 
      docker-cli-buildx-0.25.0 | 1 
              erlang-26.2.5.21 | 1 
                        ffmpeg | 1 
                  ffmpeg-6.1.5 | 1 
               gocryptfs-2.3.2 | 1 
    host-mender-artifact-4.4.1 | 1 
              host-rust-1.98.1 | 1 
                host-wine-11.0 | 1 
           igh-ethercat-1.6.12 | 1 
                libmpeg2-0.5.1 | 1 
              libopenssl-3.6.4 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
               openblas-0.3.34 | 1 
   openvmtools-11.3.5-18557794 | 1 
            optee-client-4.9.0 | 1 
               pcsc-lite-2.1.0 | 1 
                   perl-5.42.3 | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
                 rtl_433-25.02 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                    sbctl-0.18 | 1 
                  sysprof-49.0 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
                       unknown | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/46ab3a348b74d2296f337a56af7e0e731adb46fe |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/d13fa7892a897a2e7b7a7539b068c11a46cd2753 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/f9c416e4a8297a9409ee0a1a2d3ed30ed1c5de22 |     
    i586     |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/e34afacdde75474839b1a2e41b601e4ce79a434c |     
  mips64el   |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/5c3bc8cd3a271d8c78e682917e2a0e203a1206cd |     
  riscv64    |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/1c9ec5111969f9edb779998193a9a5d88eb69140 |     
   x86_64    |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/1694740114e4a7c055ff2021f21d62d4ec0f0098 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/221c9481fa1e7a0df701da3abab8dcf039659de9 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/eb7fc6dba4e27363021e389b257cff96b3ae2d98 | ORPH
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/f2f373929e91697c03e2d90d2a742c291de6e531 |     
  mips64el   |             ffmpeg             | TIM | https://autobuild.buildroot.org/results/82c2d98823ee7e7266285882e340e47f8d13400c |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/6f0f0c16ff9b639519fc1439ab0d964b362c2f85 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/7802894dcb235b8bc73b827dda9df3244e5cf8b6 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/a83b3e6a5ac8e3211b7da4d7c0ba182e4af72437 |     
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/7bacd197ed914af5417764c69d6a4045e2bf699b |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/c70da6aac07d592797c00cb11d0ee5069f21fdeb |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/24557cce343fa3b2c0b4c9527f3767bb15f1a01d |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/d2fe6e822b43b6952260b1ef0a70dfd10cb5e59e |     
   mips64    |      igh-ethercat-1.6.12       | NOK | https://autobuild.buildroot.org/results/a73dae31e97e8075b115ac82e2e77c3ca85b3293 |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/169fecc819d3e69805c46a8438c244c0a75ccf26 | ORPH
  riscv64    |        libopenssl-3.6.4        | NOK | https://autobuild.buildroot.org/results/18bb2d601eb2086b6784be3b033a2499422b4a45 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/fb5854889869aab324a5625e562497befde315c8 | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/31c6c823d1fa97a4008be154e47422bd75c2826f |     
    i686     |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/69a928306754613d7a952fc3883a38f99c357c68 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/6f7aa609fd2609eeaf6f7937f7ba6b820009be0c |     
  aarch64    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/3ad6cdb23b57bb71c28ba9987474f413fb64d7dc |     
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/fda6b8a3750dca825c69589b5a48d6542abe43c4 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/3e4bb0fcee102eb105190f5cbe2beb591d259220 |     
    i686     | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/1b8462fca33dd2a023b962c81c1e607dedf05ba3 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/20c929635b37fa3179231afcd6b3dec6d4f6835d |     
    i586     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/e1d71b8af96cf6a7d1dfb23f137908d5e97b65a8 |     
    i686     |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/8f4583a6cfcc91ae174431817018091bb9279082 | ORPH
    i686     |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/e8caca7470b53d59e68848e93674eb57d80e65f9 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/faf4dba345ed40bc72b0a935fdf21a16af8a59dc |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/770a592b04bfbfe43cd3819392b3f9d7fc91b4b9 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d9d573b481b597d1dabb0e55ad8089868e1408b8 |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a7d3eda5a345c0b5b70deef8b9d4d850efa5d41d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/02e9fa74fe39bff33ccd30d792f6306ce4604649 |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/6cf6faa5aea0d58c79fefa28e0075e438ecff810 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                  linux-7.1.13 | 1 
                 wolfssl-5.9.2 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |          linux-7.1.13          | NOK | https://autobuild.buildroot.org/results/f665ca718faa39599083b957d422220b3a216b22 | ORPH
  mips64el   |         wolfssl-5.9.2          | NOK | https://autobuild.buildroot.org/results/562a9e3638259fe82c59cf1411f125f0360c7913 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 
                  linux-7.0.14 | 1 
                   perl-5.42.3 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/f87cdd8856163976e58d974a4475baaf04726cd2 |     
  riscv64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/f3b3f04b2ffd2b4ab5972b9e6198324dec923137 |     
   x86_64    |          linux-7.0.14          | NOK | https://autobuild.buildroot.org/results/df944e40110db1fb0d00dd3e80bb89d54672ed29 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/779dd67e5caaaf2f859fd89ea1ef2498ab2922c4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                     bc-1.07.1 | 1 
kismet-52bcb902e36b2df1562c... | 1 
             libtorrent-0.13.8 | 1 
                memtest86-7.20 | 1 
                  mender-3.5.3 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/fd84e12da64881d2ffdf9d33431815533364db69 |     
    i686     | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/c3fe20007bc1bb95519d573eb7924418a1fea51d | ORPH
    i686     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/294110a2a744626892a2034023d36b37767d5c37 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/0393dfdc2c948d8fc4c9bc5caa6764f69b5e9da7 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/ffdb38785957404cc671236f8bb8d4e88019108f |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/2e4f6cfe589b3d62ee551cd8699ac59dc3bb9752 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
