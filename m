Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED95FC982FA
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 03:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 591B08091C;
	Wed, 23 Sep 2026 03:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d04SFqKzy3Xu; Wed, 23 Sep 2026 03:22:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5874B8087B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790133751;
	b=njF+tXuViFUG/Da1GHKmZaXm4jSUYQRFQrhGHIv3YTYCP2zzfm5qOId/9UJeZfuGLdUk
	 fKzVJzUvuB7biqvYCYQJmCR9hxphqXaYnuV2GBwVkhiRJBaKPgh0ItlTDPuKrl5huxjnT
	 //bEuGVJI/73Tc/UDwxzBrFv1j10aIAIfd2AfD2BQujgE5o8SXSPZU8WrWZ/m5cFiSNJk
	 c91bEL08u3vnb0tJExdMq9MoBqDEuuXw5GkN9PVQ4VPd4RMwtywPo7eZh38zXhi+VcimL
	 EFTsvdLkplLSSHCRrkhhRfrqcAEU/hF+IrbqhS1JeIs9zlmYHEH/AVLznTR+8vU3j9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790133751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rtpfAjflptZAyQxjver4vsNLV3zup4xZU0D1JwHUFOo=;
	b=Y/Dl7NNVPzLgG9RoQX9w/x6PwboR0mr3yFS9R+GByW44gsxhPifmuGz0VT7fh3N37DCF
	 nfDI89145566tJ+GgpyLngyKVupxP2ErTmtb/gk7HMU9mw5FQzR0eea9NP2H/dKAtf2ZM
	 1KpGMNBvEfbf9vxS5mKECKDpUjIuIz53uzcVoVnAk7DxsmY7mGQSZNgfMawsmO4JXpZJK
	 eBrk6DgAIJNZ3holgH6+3byoI/Z5m//ri2i1u+b23P8247gTpy9BcrEoeIayaX5kEnc+f
	 XkunLgBHAl5Tg225pXD4drxjJ8xrYzCXDK8psviKOp8WwUFrAdlwlPUOCOvzV/qWLtw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790133751;
	bh=rtpfAjflptZAyQxjver4vsNLV3zup4xZU0D1JwHUFOo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qethl2+6PxfciCZi9rV7JKqlvcZ562mJQx7JxPyxjJdT1LgiTzBVpGbtdsMUErvKT
	 AL4wl1PFSVzCpSB/fyjBvYi3QwvwXIcNTGKvb2z8LuuT7Di8GSrLrNgP4hhcGJsMR6
	 AstIUHMLVeeItp9EjIunD2jwXWkynbo7zn7YRRv+hYNSNJg4bSZaWquxhIRxTy9QVp
	 dWulEsGsZWV4WLMPm/eK2JzuHNBwgTt7AcLfcRrc03TNvxJVLf2gmQeLoybCRKMT6P
	 tayMkXYKsIzEzr11Njxd1KMVhV4TqGdOfVBOYxV85K71VUJY7DFF+9j/EOHkr7kTRu
	 mpWE9AOGjRYhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5874B8087B;
	Wed, 23 Sep 2026 03:22:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF3C23A9
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 03:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD0CD405EF
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 03:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nv_wIGn4r8Bq for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 03:22:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 681BC405E9
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790133748;
 b=Sv/LSFlf19g3yEa1rO/vDs/Fq7rn6iSKJAExbeceKti9AKvh1FO9KHd+uXvDjPBbwUT5
 2o8JzOXFf8i7shYEsBAJ8VZzsgHYirRQqQPm/f2yfdzyB2uQpnH9vpk//TLuHCu9ljYmT
 bXb8iV7SvlIcJHM9ovgkB+3475yLoqrpVS28Jz+Oy8jW9nU6mEAaORFO8eFw5nbfIhtop
 0X7g5/oKTBRzP9xWu2iq9H9+rwzcQeu11ZoRbovNtukpv4CdsOixWcd3MZHkwMosWlpwB
 Dd1AvQ55owLpWK2eIyhEbUSi/qgCVa6Jn4X4Pp7trOoAJCBlgNWg8cqzccpmb89WYBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790133748;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=7yPgGg3vJAK2AeeFxZfn0BaJVRjz8Vlt5aPL5EIkZuc=;
 b=TYMOqI0C7ve+W7yfm+V0t1Ib4tbr8d38L52Yb+pQn5Wa4E6AQtwayPxeGE2s/J3yhHe2
 14LPSlkf//ZOdHIHv0aclH/ITx6qimPiVDgkWmJlN9WCT3bQYEdRafpIiOd7sFiVVngwQ
 l2L95v7QzsFDp6NYhDLEmDLhQZPUZLAhmTGJHlUGvFfh0jZO2C/A9vl1W5PIwOJS/nCKa
 K7x9/PTBvIv3OV4VSNikh3obq6N4kwCkWA0AUbrpjBUHvN95D11gbOME8HZnAubHgJ3Ah
 NHrXEOMp3qdZ7gy3HnCetod0dNk2Nn5WYWq408WXE0m4hCm613zxctC+hQTQbqYHnWQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HTmmsDHm; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HTmmsDHm
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 681BC405E9
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 03:22:27 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so2003795e9.3
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790133746; x=1790738546; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7yPgGg3vJAK2AeeFxZfn0BaJVRjz8Vlt5aPL5EIkZuc=;
 b=HTmmsDHmPxkqfOtL97azbtcR+5cmQfyinAzsgv+jxG7IYVPsbbuBN4c6t4R1CeRJRJ
 Rz+vVccZHxQ+Uea8tC2uE4a8cf0eNdOp13XlVTgvzRTEhgosfnS2Fdr2XW+uOvm1M6Fu
 ppkcak/pgD2x1h89Kt5z9/t6v0YKiNebCNR1Me2pJRhaJLdEKBM4qCTDS8sK+GI0NHNX
 0gxpUyNRdfpBrzAj0M5IofFkK18PzrtPTcsrcHG3VIq1wdckUzoM6ksJGldzf8blCHu1
 MUuvLSIQukSpWC/kaV7rI/lR+20jI2XKklFAMVvGcWJho9uUzEsBcgIcm6/bnKTfbD++
 x0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790133746; x=1790738546;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7yPgGg3vJAK2AeeFxZfn0BaJVRjz8Vlt5aPL5EIkZuc=;
 b=gGqbh+5FfD4FhgjzEZ5wlHz1FHYN8QbQ2iFGLFygI8plXNV0/UCRWiaif3EBBkg2v8
 vrXKZDN3Nh4OyJeRqhDXArsfCJPjBuKU47kgvhlMUUZ/pbmjpWbNsrwy1LZjoXcOc7DR
 ct8UAAxgrNnknBkfqdsp/VkBlwGElwCGP5nsuL2c20GHB9PhPAAnf8BTwy/q/8tYeniE
 ZMDbVcfzJZtPUgHVtgEMhF8gw6fALfA8zqFqLBTgAGU7oV2BI60JsiUDQ6s7iN9Ma/QW
 xcli8JlO382GjmQG59Of47heXE0URidxBgXKoFbDYA513VvWJ94LuaOmYOuYoEYqxi05
 31oA==
X-Gm-Message-State: AFuF++nMcGgKwPYImO7Y9PmYID302Cpj3ogxZ+KFSGajRZJyalEYJID9
 3D4aD2F8Ih1J+twdCV3HrmAANpDNEAcRLHXuEFn03HAvBJjPpcH833yj6gkMxXlv
X-Gm-Gg: AYBFou3o7KVJRvCKDG308QhEfOramcWy35V6ufTvCeeqOtgW2rbROJEsIz9KSOz9YFD
 uhgkgirBQdpCIrRIw0T61vntTz1s6/MAiUXDvurukSAEiO61q5XSvXLNuNyMLYigGNRRuL4+eTg
 feFpDRercFvY3w5tP7khdOnrlY5U51AKuQfgGyeaNkowO99TLuJ4GM5hWaxoGz33tKseNHKw/dU
 0Fo+X0OHKViDQQ+4FA9+38V2rfVGL4eot0Oe+txBpqkZZxbxqElmD2YifcuQQk/Q1tmURsKUakv
 b3t/SMp+JFElJfzAGoI7vSRkFRlXKp6yzNGN2PpVaSXtOWw+hEslh+sug8pfmbp53X59DeDXv2b
 VfOeoYaKipn1MsmnAPieT4WKlTE0NwbweLxOgP1H9tzXTYZ2MHYhR5vlcWeukgIzn7VT2yoFeru
 93gN7+bDynkeLqlQVGfpILMDnaLuVJoQGjCGsfhB3O/7pYY0+S8mqyPSA0dMYFahS2NNjSKBgQd
 g==
X-Received: by 2002:a05:600c:1f90:b0:49b:9105:cdaf with SMTP id
 5b1f17b1804b1-49fdecd54abmr11428045e9.8.1790133745571; 
 Tue, 22 Sep 2026 20:22:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde185329sm40992765e9.1.2026.09.22.20.22.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 20:22:23 -0700 (PDT)
Message-ID: <6ab345ef.185e7683.115c46.c07b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 23 Sep 2026 03:22:23 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-22
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

Autobuild statistics for 2026-09-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2026.05.x  |  0  |  4  |  0  |  4  |
  2026.08.x  |  1  |  3  |  0  |  4  |
    master   | 27  | 30  |  0  | 57  |

Classification of failures by reason for master
-----------------------------------------------

                 libclc-23.1.1 | 3 
              cryptsetup-2.8.8 | 2 
        edk2-edk2-stable202602 | 2 
                 systemd-258.7 | 2 
amazon-ecr-credential-helpe... | 1 
                    attr-2.6.0 | 1 
                  bcusdk-0.0.5 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
              erlang-26.2.5.21 | 1 
      freeradius-server-3.2.10 | 1 
    host-mender-artifact-4.4.1 | 1 
               libtasn1-4.21.0 | 1 
               libunwind-1.8.3 | 1 
                 libv4l-1.32.0 | 1 
                    lua-ev-1.5 | 1 
                    ne10-1.2.1 | 1 
                   perl-5.42.3 | 1 
                    sbctl-0.18 | 1 
             superiotool-24.05 | 1 
                    szip-2.1.1 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.07 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/2e789a8a89c6ea36df1da92ac6a44104970c7f92 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/abc8bb2395a5c725ebd257361dc1b157722786a6 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c47a0a02094a152edd6e4f959153ec253e1efb44 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/4a9560a1e650ed3898cd79bd23283c4dafb257c8 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/1230cdb87d53b9bdbcf47508d1fbeb27203f8161 | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/af52997bb5e81df1d8a38ec1af1ce5b78237b1eb |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/3dad13c729bfbae20b7a1a868e8e8275c13f782a |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/2e85336fbf997986ad51747c552fe3007c904c9d |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/8370619ccfdb0aeb5d6bb304825dc16ddf2b2829 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/6a8808c34e7de28bc3605842c8cca95efb7828b5 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/3bd47e42198af5fb928956f01840527b8e3fbb31 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/dc76ad98d61a44c8cfff4f0b5ccdf8778d4ef59f |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/c29ee70c043c6c9576c0b67fe74e8da0d6708def |     
    i686     |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/0070aa62af969da19039f0a3d9fb26c1c2252a6b |     
    i686     |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/018a5b5fa352b90c7ad7f779120055e4bf70be93 |     
    i686     |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/3944dc3d5e0c3e2c0b06057057db9ab9527dd8ed |     
  mips64el   |        libtasn1-4.21.0         | NOK | https://autobuild.buildroot.org/results/d4f1c114cf2465c2631024517f8fbd7d38b0c318 | ORPH
    arm      |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/38b86e2634474da1354289055f89b8464978b9b2 | ORPH
    i686     |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/c2381ed56d10d9a254d20b862109841651e3a8cd |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/881e7632d4119e743a4d177fe33f99267a53095f |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/0d3d5e6bfea0e0c1a7322c6fbcd1a548d8446ed4 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/0a7980c26097ec591f9dce3b06f3a1afe872c95b |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/91b80a547d1db4a3ee24253124c9644cd3717511 | ORPH
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/4cacf84a39bfebf3d26fdafdb080cbdf26c81072 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/c9a9159d8c70022e7a82266f3c8deec17b1549f9 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/114b651060ff451c77d5136d725a29fc6f07d70b |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/bfd3ca5b2b07a6edf0fec6290ee714b85bd72dc6 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e1a7a30eac00c0da805c7d889ab03d0dc8474ab8 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/04c48b4654ac6e663155e61de1ef4252a5b4ec92 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/3b7b1bf5437fd493759dad4bdebeba5df1d21e61 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

        edk2-edk2-stable202602 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/fde8051bb0c410b32dc224d7636eeaa243aacdcb |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9a1a8d57252d6c237458fcabf61fc22519371e24 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1499c4ebc0949733917ef948fded6178e01837d9 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   gvfs-1.57.2 | 1 
            igd2-for-linux-2.2 | 1 
                  linux-7.0.14 | 1 
              tailscale-1.78.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/40b1d1bb43d30213402b3b4eeb0bfedeb6cb2639 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/a92bfef0ec9debabeda3c33806066c2af1c532d6 |     
    i686     |          linux-7.0.14          | NOK | https://autobuild.buildroot.org/results/67a28448c1d86b59a47d1338c5f27b6fefb51838 | ORPH
   x86_64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/3d45e924e0fc55ea9c0f23d20878a86ef3810593 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

          cloudflared-2025.1.0 | 1 
                 libgee-0.20.6 | 1 
              libgeotiff-1.7.3 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                   perl-5.40.5 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/b4a5c2dd5e7896597249b5fb2e1f0426f80c9b32 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/780146fe11d7df36fc7d98541869202eec684a6a |     
  aarch64    |        libgeotiff-1.7.3        | NOK | https://autobuild.buildroot.org/results/e52d21b3c41e5e7e08ee9d9b1d25ff1c6cf45bbf |     
  mips64el   |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/f10e8859c0ef26be0e089f7de873e9e461087cc4 | ORPH
   x86_64    |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/388a82f9ba40e2e475c637f697cfd8798c0c5689 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/7bb5c6bf72f85966d7171704695951586f856be1 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
