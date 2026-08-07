Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B22C5AC67
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 03:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE5AB8110A;
	Fri,  7 Aug 2026 03:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZ5NiqPAC4sW; Fri,  7 Aug 2026 03:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5583D810F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786073122;
	bh=qNT8iEAGT2f8soLSM9GQjaJYbLWsXy4bQ5u4KXI2L4A=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m7XFZopjLzWXWMFpfMmufPgIby6aFy3nDZJ93Rzj30lpzxZO+vS9U9mOwMiA4NaU6
	 OEZxYMgjHQxEGsKmasQzljsZU/it0agh8nUm00anTyyBFknrhvhZGj4ufdhGC9JLR6
	 Nz60XQLywddr0UEQDT2twL9AifCfQLC1iZPvskBlkfTXnBOE0Q6D7m+7SYczvnIw5D
	 RGY5hJQn+ojlE6TxX/S0McRPKEzUwT9jd6bJhWu05TSDs5YJvUTgzpRfAm9L5oafq2
	 lt1vMnCLEOce6nosXsKy4Tg+kzC1m6IWCPY7FUPg2QW14T1q1+ERc09e4C1xTNdlgY
	 DBPFvdRpDfHLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5583D810F9;
	Fri,  7 Aug 2026 03:25:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBEFA392
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 03:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4C35810FA
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 03:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEmVR3XVkXk8 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 03:25:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F10A810F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F10A810F8
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F10A810F8
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 03:25:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso18403165e9.1
 for <buildroot@buildroot.org>; Thu, 06 Aug 2026 20:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786073117; x=1786677917;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OgQrEQtpAC8V3qAhUQEWPkKmQfMItBEx0mXN/djhD5w=;
 b=ULQxjb+Zs9iayiNA+lWVGe47vy4riIyMeghruB5Q10V2uDUJGBEtEtuTDz0qe+OGww
 jPRZtWjP+ySaCLZknHdH35oWj6Ke8Ls1P8TYNWtOYingGhwm5FfKS7ww8Li9xv4+qkI3
 6KCw0FSGyx36X1UcRoltDpTPF7DxFTctwAWPWwl7kobJH7pUOjFZztOKIvCaCsyvvAYg
 IVlE6rYgXS7DBBz3DJiEI/WdIIff1ROYaqvN+O9tfqTzMqny23eaujbw9F73J2vRkrRm
 yhXafe3dEAKBOZ4ZkcdNlepwuVVw2RDStzcfYYWfddxN/KoYWPn1U8fqgN/qSniuucFw
 gz9Q==
X-Gm-Message-State: AOJu0YwDJyniWu94MeU07BIWd0Cm7ORCtvQjj4slWbnMyC55fxEmQHjP
 w6rWd2gk39h+9vLgq7MTUkZz1JxrzqLQJ3j1j5PhXYzzGC0/lTbQ+bZ3brZPw3b8
X-Gm-Gg: AR+sD11IhhS3tDHidgpG8gsSrbpDxf8W4rwwoBBeR8a7kW11GYADQLWDRltG9ymiWrQ
 V4A+rqb36UVZ0l7mBeJJ4a1e0P+8w+KXkgG1lH7YO5+yNEGxI0DypuALdy7BNOII5GHb3eG0q1p
 QcRgDU8wNgaxJaioC5AolvN/759wJWV7dCKXLzUCkvzvvx7ncoVq2mZ6OLwLKj5zFx5KjKmZzBP
 vSHABIaSIH/My8jdng9gDe3Fziw8tgjGyUs+8HX6GvNLBX6BW9N9J9RBnqgVSSbxAI+RCnOtad+
 ToUXUQvK+njoECUdc5ltaig1OF23/i6s6y75/iGCaQYovhXO5XSTaSyo4bnEWg2Mso/ypXEmfhW
 6Uc8gCVRoJpMAfJvRCg1bko3ETZ8sq33bwuDIrT74GwwI1WgEXeL3vObsbEBCpBbC+pEvisYcXz
 pQRJnnq8uS7AAC9QzhaAxeMC+XS5JmMJoUMaej6nCy1PKaTfmp0zkY5LtCyRdZjzg=
X-Received: by 2002:a05:600c:1991:b0:493:e451:a9e1 with SMTP id
 5b1f17b1804b1-4994e7448d9mr238053495e9.2.1786073117095; 
 Thu, 06 Aug 2026 20:25:17 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995422b741sm120181475e9.14.2026.08.06.20.25.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 20:25:16 -0700 (PDT)
Message-ID: <6a75501c.5b42f266.2b3442.72e6@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 07 Aug 2026 03:25:16 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786073117; x=1786677917; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OgQrEQtpAC8V3qAhUQEWPkKmQfMItBEx0mXN/djhD5w=;
 b=ixYLz+WUKtIJZvGKOV287BKpPhYL8l95EWm2p+nyRxoRhXIu6/gng22SiztJ1+cE4q
 xZiT0OwnHg7hKb/BfS2XhVl70OpkktT/shgcMiSehDCpwJP6AK2MSXs+7diyaCWgRrqA
 yd3qD0w5k0I86Lbn0Y7elPo0AoU8yo4QyqS2a+Pe/NBlRD7cOPFss+UZob6c1D4ePXSE
 FkOGyN3797i3tDsQX9h07YAjy8p49k+dauSJJ/hiJMOGKeCpAfzhk9FW1F3P6HR/Ots6
 2Xdd+9sj8pdWk9rYkhgAvVJ6q5xYGnodm0EdwrcFkB1dAFGRGFwrB3tsMS2RdXsgzRcj
 LnWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ixYLz+WU
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-06
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

Autobuild statistics for 2026-08-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  4  |  0  |  5  |
  2026.02.x  |  2  |  1  |  0  |  3  |
  2026.05.x  |  2  |  2  |  0  |  4  |
    master   | 22  | 36  |  0  | 58  |

Classification of failures by reason for master
-----------------------------------------------

          lua-lunix-20220331-1 | 3 
            host-binutils-2.44 | 2 
               tcf-agent-1.8.0 | 2 
                       unknown | 2 
                   atop-2.13.0 | 1 
          cloudflared-2026.6.1 | 1 
                   dante-1.4.4 | 1 
              e2fsprogs-1.47.4 | 1 
                 empty-0.6.23d | 1 
          host-binutils-2.46.1 | 1 
         host-gcc-final-15.3.0 | 1 
            host-go-src-1.26.5 | 1 
          host-xfsprogs-6.19.0 | 1 
              jpeg-turbo-3.2.0 | 1 
                     kbd-2.9.0 | 1 
               libepoxy-1.5.10 | 1 
libfutils-c326ce0cc2a735438... | 1 
                   libidn-1.43 | 1 
           libmicrohttpd-1.0.9 | 1 
        ltp-testsuite-20260529 | 1 
                 nettle-3.10.2 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
                openscap-1.4.4 | 1 
                   perl-5.42.3 | 1 
                    proj-9.8.0 | 1 
                 systemd-258.7 | 1 
               trousers-0.3.15 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/d8b88af166b1ba6aa22e613555e8ee8fdf1440d3 |     
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/19fd79f4378e69e7473810a1c0ff05405a23ebe6 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e840252a09d2edcea181a09eb1de5d28c613ba0a | ORPH
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/162db6c7f343d780fe1be94ff9ee3e075368e035 | ORPH
    i686     |         empty-0.6.23d          | NOK | https://autobuild.buildroot.org/results/b7fa1ac462210b2d601a99edf3155d0fe6f552fa |     
  aarch64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/8019840adcb44eefe06886b17a799df30bebabfa |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/fc7764827a666d461da54c7e802e7fba9852bef5 |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/13d2aead555588c83815b521ed50d91c1d936760 |     
powerpc64le  |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/53f97d9b6f34ea8ffcf38c75429aa1247466a468 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/fbaa5b4f418d5939e235bd193122203f7b26bae5 |     
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/111104248d394431df03e95a1be30c753de5e239 | ORPH
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/abe47d5460e3c743481bb30b1845513731d2a63c |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/097b114c010e90eb43a99fae79bc67093d383b06 | ORPH
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/8fe2cc36384aac8792d0bb3f853e2f589ea8482b |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/5b045003c7350340d40f0be2af0cbf056e6808c6 |     
  sparc64    |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/083148d3d4f437c6820a5c0f8c1745407e4ff3bf |     
    i686     |      libmicrohttpd-1.0.9       | NOK | https://autobuild.buildroot.org/results/254437116e92c691bbe8c3e2988e5e67e7ac4aba |     
   x86_64    |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/bd087d28b156048255d6199c879c681c03e4a574 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/32a6289a3b281864c4819b76f9ce9dc98102cec5 |     
    i586     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/9df174ec9d29cbdbefeebfa2c3080838f04d11ee |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/2fb55a43d128418d18873dcd92df93f13afec8e7 |     
    i686     |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/7a92d75a2d4db54f44a89b6fd2452513ef5a4e0b | ORPH
   s390x     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/fb3c4e17daefae9b8e0123fb1180fb0534af1d9d |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/cbce07549394ed61a9b506f86634d4459388ae71 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/2a35a19f3b867c7460aa2085b42c95a16889c444 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/80731d78bcbcc71137b7afaafbf4270d95c63117 | ORPH
   s390x     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/e429939964f887f1611d977e5e39474ed472805b |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/fe5c307e823092f3da3cfbbf6373347e3ff93bf3 |     
  mips64el   |           proj-9.8.0           | NOK | https://autobuild.buildroot.org/results/972c0f9c5c88b9592741664a318a0586019b5a8b |     
    m68k     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/9dfaee3f7dd231e5d07e992cdc36bb7361b30beb |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ca510e1ce15f45c79aeff188eae5572cbd015f0d |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/270121dbcc0c22928d13b1bd2c278ae8cd6c12ab |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/9e2e07dbe39e4580896aca66843c1df0ec7f989d |     
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/934363d290244bf026146f5694d7773b189e4bcd | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/11e193307ad0c9925125963da451064898b26ed2 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a1a702e77c22308c77445a34d2931034516ffb20 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   linux-tools | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a50399e2c93fb1c8923a6605831645311dfdf429 | ORPH
powerpc64le  |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b161d86493fc99a8b545d67282c8be10a3fc577d |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e4b531c36823822251230f59213527d14af9b189 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              containerd-2.0.7 | 1 
      docker-cli-buildx-0.16.1 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
              openjdk-21.0.4+7 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/81fa74064f6e2fa6e6805b600986f7a5a9127079 |     
    i586     |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/701cfe5aaa7b4d7a82f6aeb03462a373f27411a0 | ORPH
  mips64el   |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/fbd92a7c7b9ac7b655a997618ce6a33f8f0d988c |     
    i686     |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/88bf8cc725bfe3fe52d34d02d78d3d663406c63e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
