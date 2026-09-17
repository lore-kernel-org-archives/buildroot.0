Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0B5C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 03:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10BA86062B;
	Thu, 17 Sep 2026 03:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s_dgJuN_Skr; Thu, 17 Sep 2026 03:26:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D17EF6062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789615589;
	b=NOSSQhV5GFWXvejd/piyTGRMrshM77EnC5csGfK+x+8+rx/LXUpvn55X9ZEFWz8dxy/7
	 MAEbNUq/FA9ZvkrN+hVPClQu/NCHm5e8cQf4p3rt11pBoOXDPx1NguEnJqxF3cSGx6JBp
	 uixDui5pLg7IhmjTYwNu1/spxz3Ydd38ae/dvG6tSrH2IVsvX0CCrAW+KD8fRFqkbj9g3
	 WRUhJh32vM3S73fmk/egFp4b7wmOSL+tcwDrxUgKEa7Ar2Zz+iRsyjWCgPOcAyBlzOL/2
	 s4xwYDZDe4sDXGR0rG5Q3KuGyZxhu/jkX6XoVZaCtSArON+WfR4oL7U5S7szBLiMOtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789615589;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2eGTwf6IVpCB57ngXaiNl3kNcf6ryaXveInIsBmpV4Q=;
	b=RtIHjemHyuysC7ezCiqplzozZWyV2q96DfX8TAoUtrdCDeIuUru5gjneKCkp+wVkGK4C
	 48513th02VIeOtyjkIvsl+sLeiZPipTFqqaRXDZDpxjhhvxDkXnHTDCqnOViwvOwgWGy4
	 hlakI+m7kPikYQLwmBzNni5yxmvaSZoH7qD8vmAitnonrsq6On9W8gQjYEgXZCXXLnzt/
	 QQYmdPpQjOGppH0CU9q99812qnnS5zEofos95XkfKs79VEt/G/dFnGrbAdAKkhxtgNX1M
	 zjhSRq1o2dKvLyZGcu5oEMcAfIuNt8GMA2r5osaYb9zHxp57XzSDyYCAeUQe+FjOZEw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789615589;
	bh=2eGTwf6IVpCB57ngXaiNl3kNcf6ryaXveInIsBmpV4Q=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a+BlytywzS+Cil/wYoLoJMJOw4lBu5iWeBlc0jnR830Ucy4tHOMHIcRmGLMdhG/3n
	 Hqf5kImcr7CzbZQrYOWxSLIU/l+7Y1LYjhUGKpjsvyvDDG5LZk2SFU10Cd743PEak8
	 Hkb8YWBBuuaEqFpIz0pEkt6axZvrWmgXG3lg9/yrRpcCpdOyYmUEOEuiO0f16H3qmv
	 Pl4lpphc9Zb6Cr9eKCjXOs0k/sTZ4JJXjDz+OlmpJNy9K0iW8Sn67jOE4xKVshUmcl
	 VYxTZQTFIfG52hM8LRTitQOnGCquhQ+LmYGfhoSb4eWdf52193V/W+nXXfu8StEDJY
	 s45MbFnteUBsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17EF6062D;
	Thu, 17 Sep 2026 03:26:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07A9113D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 03:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED35380E31
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 03:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VO-Aro_2QFp1 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 03:26:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9093380E47
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789615587;
 b=P6rHwNvSSZD/F3XdQcV02sT2FwxRlGRjV+3Osdddi0gUvsg0L3DeSMZciMmnKO5X5Z5T
 Rt/eCM0Sfim2RnMYe7z2gxNbS44nbMUGu5p7HuyfKKp6toJuuMSJadlB+HEHcT3ACJPdk
 SpGzxgAmpdEDae/r+Lr6J609yYHpMFvtZ/BZEpEcqoQRV5yrL2TZ+KnkSo/RClDY7doAe
 YUK3kPhT4ypko/SpytKKd3YHfHCJf1z2rfBWAGoLa+Xwja0WVkUxgezTYMt6AWiMEJMdQ
 pHWIjYnW1WDno7EznITV7JnD9n24WvNFQ/zmpTfyI0ZPbYEgW2Ymp/ZqeiQXnYZReXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789615587;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=S+7lP7IXj7ziX8l0W8ZUNWGPFwa/BbAZ1GzPvxPjduk=;
 b=Ic5JuL7010l9IeTds+7uis3ILv4RPviUqp0U1drp2i2OCL/xM0auRRMci0aoTSn+l7pQ
 i7Zt8nigamL974lHDcbpk/FP9qvRfGAnuRRmQRyoxz4dRTY/RkBVWZLDIqrL09byglzex
 UC6OMe+ny8twpkcCL6Yuvugb2baDN3403g9BVPT3PqGw0Hl/F9SdTHyLWuysivyWesomR
 A2XZHKry9RzneJjIohzw/O/2inaXXN1Vk6uuD4lWKtl+IGDl/MobRhrJ5n83jcDCESGk1
 Mo5ydzZZHvQINaeJZaKp7mU2h9EUjFp4vPKoFsgwrFvcShMxjy3J7odnxsc3SeKEkBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="SxS/7Reg"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SxS/7Reg
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9093380E47
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 03:26:26 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so2671565e9.1
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789615584; x=1790220384; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=S+7lP7IXj7ziX8l0W8ZUNWGPFwa/BbAZ1GzPvxPjduk=;
 b=SxS/7RegGcJsMyhbcXt0zB/6yxL2FBSkE11moSB34GN+cajimPzEFnVOH60VoC/ikV
 62lPW5CV57FUr4OxJWK8t2CI5XpReEJLumkFGf6HJ38wZbSwRDR/pjB83NsV7sApg6ZT
 GhwreF4ShLQ5tgg5V1UCHgmS7j5hR2rdUp46DQxyLQrPW64k8OFQVGFjARoLUBfz2R1M
 CApMyGVBunolOUw+sbslFHuhD2oiJ7iGOLux6+5q/qODNJpVfLusxyn1f/5ha3IeORH3
 BdHxvX7vBcFoGAvN6HMWOeSweQoKUXyZrN2L6P9Oeaa85GGp5tCz8eEexCA61S0gk1d0
 LZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789615584; x=1790220384;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=S+7lP7IXj7ziX8l0W8ZUNWGPFwa/BbAZ1GzPvxPjduk=;
 b=Jhi6/ShttJihBkJILdySB7xzlMKceBasEQq1dlOUMF84ObTOkw0BAI7O75YXhZrZ2R
 dBPeFpdaw/NpmlWiYVYiK3Vdqs+K7lYOWl0J88uTRLKQu7/okkS5MhGQNAfooY44PHGL
 aD2E8qHfPnstIjZeu9bMGq6STpKc+x8QIJB+RBMChyYky/rnih63JdXZ0TX9vdB/U3Mm
 cMAh3/2yl/xKUEeqMHTiG0G6YchZNJNjnVzbp3fmHaqu5l8mvx32AIPrzHLo3P+FHS+l
 AbhV+xMRdoLnQv3ec/y5ZOcce8TmUISzTmUHHZKwy9XIYUArJnpQfD8am6PZJo/L8gNU
 bkcQ==
X-Gm-Message-State: AFuF++l4zVIgsUzwPF2uN9ZndFVgVCyQa9K6Hfr6noMixRTmOT9kME8a
 lwcrcv8W8nGtT1V5uEgL2SCTzuPB7Uaz/rjZ2wKMhcHhOODF7kpExGTlh7E3dhay
X-Gm-Gg: AYBFou1uyQoW946lcCjodTSkvVUkzA96V7doCAygqyr4D7yvLxXQIXk/Kg9AkBbGwrJ
 eN5e8Tp5Uf8H/8eVNTbG3HycPYqQQPYUBlaEOe2U4EIYtc3rLOTlvednw4b8q0QIPaQ8hf5ASQi
 1APOA9OwNTElrGgzvpH50jv8lKZPmU9kHvAUo+GxptpvSc+bS9qGF1PRgNITRVFr4pnt4m1XI5F
 3QEBFoAESBBND1ZbilcYrdJr6miFmgh0qhpNLh6mU6KwNQDUpBbRcIAhbZ2SNZuAsEH/wADJpN5
 AWm6+unrmLmRJCa8uFZD/DYurJAgAkrsx2LW1C4UqWahc8AfjTj7i3PQHz946llDfIsM4uuoSUY
 AsZdWqWMosj+NjjFoWNjR2J0iTuawUZuJ/Ldvjyy+9IHuyGVChlyKDe3bAEay53+Rgea3gElAVd
 cwW0eDNyVi2rpwtnBG/WvB8Mt2zDLU7LSO9bmzNFJQzPuqRF/82Fj3cf28urhlPTQPOAzhKSXcj
 fE=
X-Received: by 2002:a05:600c:83c8:b0:49d:28c4:b304 with SMTP id
 5b1f17b1804b1-49eb7341406mr51641775e9.29.1789615583855; 
 Wed, 16 Sep 2026 20:26:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbf515cfdsm18022115e9.11.2026.09.16.20.26.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 20:26:23 -0700 (PDT)
Message-ID: <6aab5ddf.325b51bf.302a6d.71d7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 17 Sep 2026 03:26:23 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-16
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

Autobuild statistics for 2026-09-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2026.05.x  |  1  |  2  |  0  |  3  |
  2026.08.x  |  1  |  2  |  0  |  3  |
    master   | 19  | 42  |  0  | 61  |

Classification of failures by reason for master
-----------------------------------------------

      freeradius-server-3.2.10 | 3 
                   perl-5.42.3 | 3 
              cryptsetup-2.8.8 | 2 
        edk2-edk2-stable202602 | 2 
 ibm-sw-tpm2-rev183-2026-08-26 | 2 
                openntpd-6.8p1 | 2 
                       unknown | 2 
                 aichat-0.30.0 | 1 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
                  broot-1.60.0 | 1 
             cni-plugins-1.7.1 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
      docker-cli-buildx-0.25.0 | 1 
                flannel-0.26.0 | 1 
  gobject-introspection-1.86.0 | 1 
host-google-breakpad-f49c2f... | 1 
       host-xorriso-1.5.4.pl02 | 1 
                  iozone-3.508 | 1 
                 lcdproc-0.5.9 | 1 
              libopenssl-3.6.4 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
                     mtd-2.3.1 | 1 
               openblas-0.3.34 | 1 
                  pdmenu-1.3.6 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/8d474032def1dd927dd67f87b3c3e32acd0f7568 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/0ece89591736d5b47ff2e1ce25b0da06f60c809b |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/a687844c1c0ee885eb0972835f64bf7cb5c5187c |     
    i586     |          broot-1.60.0          | NOK | https://autobuild.buildroot.org/results/5d6b19b18190d588e2a83d98f38f445a8bda77f0 |     
  riscv64    |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/2367fe2c8c2d68f66c5e9354eb94631665e3ade0 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/19f9689f6860cf6f04872662a4c7bdfbf9f91c32 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/1f0c5b308146e380fbfdd5e604857e11858d0b8c |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/13dcf5d39d4829acf82968098d7a59f4b0bbd81f | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3cec2d2bceb0228081bf4993d199ec0d4dcc6f97 | ORPH
  riscv64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/c8683403ce35b24ae18e4572c162e987eb05f6bc | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/571e634ac16d74df0c3308c38c75cdfd9d67a1cd |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/bec9b984b1bb6e85cbfa6970aa7d3c758fd10f62 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/ff7eca198a4f394a7f16f4bda2c4cf534025d35a |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/7b8e32d30b1a29372bb4c13f18de84800f98d1fc |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/d87ed854a575be3127d18297432ac491a27c63bf |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/bfdf51b3c28753a50b9cd63d75388ee6000b0444 |     
  sparc64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/089ddac5bdaaf5650cbc5c26d48952b5bede0ca6 | ORPH
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/952ac35a309aea84b8d83de8db2d6deba85eb9c9 |     
    i686     |    host-xorriso-1.5.4.pl02     | NOK | https://autobuild.buildroot.org/results/2de62f9e52a485256e3db28d9a4e724e7641c757 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/d7682c8f57ee2e630cac71546674f96ad02b2452 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/d4364f6e3636c696471bf8cba6d308439130e53a |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c057c0a8c4e171ee1cb133ad3df7c22fea04e842 |     
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/b3d08c6fe147ab2bb08d83c730047952a3b5ee9a | ORPH
  riscv64    |        libopenssl-3.6.4        | NOK | https://autobuild.buildroot.org/results/375aeb2d3697ac05c9fee3bfd6e082b72bed172b | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/133cd82cf5d33b1d8230a128cc34c6a5fecf21e9 | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/f6c8d7aba0f97e8bc2967cbb56517dbdd6e51d77 |     
    arm      |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/04a2d19a6af6bf0d954e488e295c7f47765afc78 |     
    i686     |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/7e2226469978db19827df5b5d2899b8c4ab14f77 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/e75a3f88c67ff520ad6344760758e762e493957c | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/db96b349d9cb50337872f1bc591771ce3fc2af32 | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/d475499250c93a26b48299def442d9237487cbdb |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/0d9987e56fb2b45a0d33bd4c260f7c755175dde4 |     
    mips     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c96ef45768dd943465d2ea7cf4d92466236b80c2 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/dbc05a51466dd2244e7e4a8357641777c5e89912 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2d8aa1b977eb3674c47138df347bad72a5cf9150 |     
    m68k     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/cc14b24c33e92550754a2dfdc8405d6bcfef815a |     
  sparc64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/467be055465a744a523bc6e96b00fce01260a524 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/57bb368e1b1672e528bbe534ccd8acb8a1e617a3 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e824a864f7e370dc0d57bb4c58865800ee478b0c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/22d7d51c84c4fd359cefdd1ebfab988246d85605 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/aabe7bff7bfb34fe5841f0f376a37e7618e229e3 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/4a58c34308095e4d8ae91e0a779c94123ee497f6 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

            igd2-for-linux-2.2 | 1 
               trousers-0.3.15 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a347908be45c66d1593e6e731d8719f433c1ccec |     
    arm      |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/e45a890279be1472704e680fe42541f665b70f95 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 
                   redis-8.6.6 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/5841c1489a02d4025d78ccca63fb570e9f2dc232 |     
    i686     |          redis-8.6.6           | NOK | https://autobuild.buildroot.org/results/fbe09d629a8e87da3b11e75c07264ace7c2b1c33 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                cryptopp-8.9.0 | 1 
host-netsurf-buildsystem-75... | 1 
      libabseil-cpp-20250127.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/1e74bf060c376c8f7c8077e4f0198f2c8641d81e |     
    i586     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/09ae379beac18633802cffa69189dcc700301739 | ORPH
    i686     |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/6824f893d7c4ff85498ab23cd407e47e41708ccf |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
