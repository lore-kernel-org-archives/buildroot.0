Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0350C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 03:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D769404F2;
	Sun, 13 Sep 2026 03:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9doaKkmZn2PF; Sun, 13 Sep 2026 03:29:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 070AE40535
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789270182;
	b=e0ARa6uwEpoeZWEiSgYk026TUT78cC40D65j4x6hOYAkHMMFWsN09la5/Jqt4B9J2iMS
	 q6plQB6wl68W88ldHmx2ZtmFp3ubHh1Y66aGnpuGpgRnOlEbQuIwuZKjm2FxfdeCZ81a0
	 +Y82GD405nD4Lher/ad/F+OIjDzRpECnPWxyzjCsZUzte2Byn/yHTVI2H+DR81V7+qz0j
	 aQyK1q+MP6ygqhogKdWDsFoZDWGslz5qHrtgOAy/DQvl41GuGU0g0BBlhgE3YnAUYO9bu
	 Za/4MFqMa6k8m9mwmh40sCdPi5tzNuQSe/+2odJ5ajMSXpdlL0WkfRuvYZeol4CZR4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789270182;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ps7uxu5NmjNA+NwKTJQ+091wmj261UkWdKYRXvewFn4=;
	b=KwcmAkpYwvWRGBBwDMZ+32an33g81kId65F5hcx0dD4nX9ZImQug5LuoAdfEw6LBkAWj
	 e0YQaEj7o/yNcjan0fYy/frOQ4W+eGBP5G3MEgkddEIlp5snJIJrTXcG3xOewlTaInBu1
	 RPzYOezsUnw85JCzeWqv6FFlMVTSHh3nD4tV7b4+/jMG957CoP3kiytrvrt/9YNGnsUHZ
	 UXfsYm62s0JB6mVeSenhMD1YAegBUqU+pQltA4dkrfvXoPGMSdQHJB3cN/8C6gvUu1m13
	 38JxbL4mY21DnuWqsVv1oO0qU0DFRcMsWO59ppT/XtjChjniuqSwhVRYxui1bxQrK5g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789270182;
	bh=Ps7uxu5NmjNA+NwKTJQ+091wmj261UkWdKYRXvewFn4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s2XVmgFVAfKV2nvigFneBgRkRYlGyuzCa6HcbcOziYwbEmGbr/1vqeNwv/C4JDY+F
	 W6lqexKBDX02UFDK1st7fH4sUpr72qAWi5eQgFP9+Q/6aMz+MnlavHgHH+GnmTviy9
	 zhEQE1FJkahWz0xsEk9l4H+9ypH/0ZGSPCtTs86HShDslDNdpUldHJtUm87M+403mR
	 kxZNiZN2lytciIHiaB37OkJ1ih1Eud6qWv857Z35EcJARL/v3fxtRszgWwpr8K/mzP
	 B1OZYGIj0mtTy2d+/ah2o/RUrCLGM7qjmXhEc27SFHoVxsrBP8jNt0phzCspY7qn4I
	 GXeMc3Oc51Qsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 070AE40535;
	Sun, 13 Sep 2026 03:29:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F48E109
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 03:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84B9760601
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 03:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lmwzYXzkmax for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 03:29:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0A603605EB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789270179;
 b=H9RGvI3N+LIIKbEZIUYzuk7fdu/lA9lk4Y2NhgL8+vgWpNbXJo4jwFjwA30BBPztOigR
 0b/mErJ7N2dYYo/Ig//co47VyLlCm5c7/8e92LtsCCTfPqgK+hVLVhRz5HxitxB6ZYCPo
 H8SKW42dlTAktobckd5nc7vJaJoKpuTja1lbdc1neG3sbR/U9RE8MDUaW9j1y40qdHJnV
 yjXi98KXLzzKQr5hWAty+ZeEOLH5BvZRyUnAtLlNIgiwUuXV2jH78qhd4CQjHYCm2XCZM
 5+iZTOrv+wYRnyZ4ePV9y4wOqVYwzZXNB8Xff/rUVLbFS3VPwg47uzI8etcyWgqt4fQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789270179;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=jF/6v+Prbl0dik6IUq3o/hPwLkBYfCRFdmCui3O4CqI=;
 b=OAj/r1xFPr52YyetFIy9zA1Miw8qmjtFsGiAVtsS2lnGZk7FtXoj8sAsJdSg4Kj0/VtV
 OBY8gOBUeKoVevPeDYh9Lzrub1ctPL3YCx3hn6cGq7YwIWuJcPEJS/f9lIoJcdooMiuFe
 hufWy4gxkuY24WDN/Q9Id8NOJ4PDLa/IZb3CavLiMcqAAo+4JMdZR8cl3ff5wdoT7wZQF
 KihSNZ+su6eUaOOg5vERxYwOIrCf4VTDKiF6y3q2OXj4Xg6mJJJ/mAYcOlkc8mTD3Ac1H
 SXleyACmBYevvhXBBJDWL81qCgVU+8kpc8Gb99ekKy80huSJ8aqRFR+v2UN2zzx6/yA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WXgSwrqs; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WXgSwrqs
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A603605EB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 03:29:38 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6b885ef8so3425715e9.1
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789270176; x=1789874976; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jF/6v+Prbl0dik6IUq3o/hPwLkBYfCRFdmCui3O4CqI=;
 b=WXgSwrqstE5knT3KLg3Bs6wzNeoSt3fR9avrqLjUo6OaqNq54ByeeZeW5sNK+38JNC
 Iowh/R96U4wqJsLhJPJ9O3o7m4xEXZKywD1PyU5ICmxn+c23ip7RxdyvkefgTdkNYkbE
 EGoQ4KcknrRUmP11/o+jOz1M1oVvEKmDBc4jgzfxSa3mZDAUQLqj0DILK0zaDgt8UuvB
 C86lanml09IO1jfvqoEBd22FUv+CzKeabMUmgKTAD73FDdhov1s9AbNc2Or++wtd6q8j
 uZ9hUdjrgj4E5vKqrgXCG84w0DXK/TOXdPB2VMRAGCTbc2UrFK1J3vSKKtSO+9g/R4ld
 ldlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789270176; x=1789874976;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jF/6v+Prbl0dik6IUq3o/hPwLkBYfCRFdmCui3O4CqI=;
 b=svI0uRWn4MtdFsPJm9JYD74v08BINHf9KsYwrDn6RP+tv29o2rv3+EgabErq/XDqAx
 RaIJ9/mIJansKO4sHHcLyrwOk3QSItTHcNrMfjS/a7LGzc8FmmC4uVbkFha1Is+XkUI/
 HqbnFSj7uBRr3hqXEA49ejlTASxmHiOY0s0OtaRwpcPrP8zlqiEWObElqMzUvJLdgpHj
 kMmTeovu4hhGyBE9ReZasS2Ced1ynk7yahOFPnVbBZbrv8mItnG9t3klcqIM0THnX7Cu
 DEBtwaoXit42WkFs5duFW/cg9cPyqvuZu546SEKSCgstbLnRf5Z89F6Ms7KoFVKdiWbb
 4bZQ==
X-Gm-Message-State: AFuF++nOMggsI7CmeEE6EZF9AkNVqyZb19w3aXgDikk548yjM8rOXpDe
 3NQRS/W8nrRCMiIIoYtGPrK62gW61y6wiIXpqPug6gp1n+a/svD0dHq2711Bq989
X-Gm-Gg: AYBFou3nlAGFeivfXFd/KQGtoEHQM2hxldwR/BTn5znz9Lu6ESv2ydHauk/TuuPjWeE
 AONwwvJQqdCxZHJP4SB/W2qOhywnjz1BMP3AgGUW6FCaRB6OKNh3S6JK5ty8woqYL1qPzfSoF+n
 Kx3BIrC4d6vQe1hgSEqMzUimlz9Rz/812qvZGAesZZIy56neJNbrdXhpg0hX+fWcD1S/wMhW8Lq
 6Yk5iatdsC2QyqOVgRrRnEzMf0sbNCgVlTpNg3mVeyi36IgJ7oXsCaCMKA3v2zbkvx/ivFirH8I
 IVqVHmPo8KS7/q4Zyi2cEPnZGHhYlnqWUxxpv+KNcioOWxg84akWi6AbQXgPfnHNis+4bIlKu8I
 BkiTmcvQ7glaYa1hbCzkS6YZKZe9jBY5f90G+qbd6P698gmqJZZTnOgQf7eFxs3adcSYA8KxkGR
 R+lwzy0YqfDPuYAUXZHbflK+IwpsQBLdwU/RU3dBvwh6GO2d1GkuD09rvyUv8gf6MI+SI7xto4/
 Q==
X-Received: by 2002:a05:600c:190b:b0:49e:6d8d:6cf0 with SMTP id
 5b1f17b1804b1-49e6d8d6d6fmr49654295e9.29.1789270176307; 
 Sat, 12 Sep 2026 20:29:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c39086sm258412485e9.10.2026.09.12.20.29.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2026 20:29:35 -0700 (PDT)
Message-ID: <6aa6189f.86e65606.3036a7.181b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 13 Sep 2026 03:29:35 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-12
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

Autobuild statistics for 2026-09-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  1  |  0  |  3  |
  2026.05.x  |  0  |  1  |  0  |  1  |
  2026.08.x  |  0  |  2  |  0  |  2  |
    master   | 21  | 27  |  0  | 48  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.86.0 | 2 
   openvmtools-11.3.5-18557794 | 2 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             dahdi-linux-3.3.0 | 1 
                    emlog-0.70 | 1 
                  ffmpeg-6.1.5 | 1 
                  iozone-3.508 | 1 
               libgpiod2-2.3.1 | 1 
                   linux-7.2.5 | 1 
               linux-pam-1.7.2 | 1 
               madplay-0.15.2b | 1 
                 mdevd-0.1.6.5 | 1 
               pcsc-lite-2.1.0 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.42.3 | 1 
        perl-xml-libxml-2.0134 | 1 
python-remi-2022.7.27-37-g1... | 1 
       python-tpm2-pytss-2.3.0 | 1 
                python3-3.14.7 | 1 
                 s6-rc-0.5.5.0 | 1 
                 skopeo-1.23.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/2c9bc5ab1cffb597d301d028b1417666d55bf195 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/66aa875e07fd4123971d639c2b2a46d5d6409523 |     
  mips64el   | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/1e19aecc0b1ce3c8538441b57e7f9de4abba97e6 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a0ce7ffa3c804339861c79e58188edb5d3f4d61b | ORPH
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/2bd99a677cb268e9ee95220b2e27233427a8c367 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/361e94e3d985c56ad3129b2b18f5e8856b46991b |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/7ed7f9c36dae1ddb965a0f0021db6cd319927b47 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/7de8d971dd8a835ae7dda2f583a82be95d1ac517 | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c889c02f496f5b037c4d6f110f26d637fed76333 |     
   x86_64    |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/70bd378195e195bf99425e4c3a1f47b1a1e6665e |     
    m68k     |          linux-7.2.5           | NOK | https://autobuild.buildroot.org/results/80387187a7c7d7528d57e745115193a5cc90a80c | ORPH
    i586     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/540bf91c0226b79ec39d7a73d5a9688090d0c61a | ORPH
  riscv64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/dbbe0667b7e8a016cfb067afdeec813815485659 | ORPH
   x86_64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/240d4c50ec3f2aed5b39e6bf8dd57346740f32c2 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ed95582046298d7b618555db14e584983d67e51f |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/791d9eb4c5ef6520b9f91a2337a0d67dbf3070d3 |     
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/7a4828aae45855fbfef8653c0a57cc6b276daec6 | ORPH
    i586     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/8a673e1c0b1a389f08d57e2a8f7b7d9f5e52e1ec |     
  riscv64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/81f4e05057494f2aaefbfa5f810408c5b9581c02 |     
   x86_64    |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/14a9af4a64eab7ae30b10e93aeec45633b02cb6e |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/85f048dbd591643ee9776d70aa32324ed8738647 |     
    i686     |    python-tpm2-pytss-2.3.0     | NOK | https://autobuild.buildroot.org/results/ff6c5b579cc096e7f251bc8eb9877bcf52e57bd5 |     
    i686     |         python3-3.14.7         | NOK | https://autobuild.buildroot.org/results/66a79e3f446533c8c23b5f298e14c607142e09ed |     
    i686     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/cad8d2865935651f34fd72add00d8a66e27e1794 |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/dfb98738574402c7d6ca0d3d6c340b0baf2c06b1 |     
powerpc64le  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/71823f43b9c6b9cd7098e66620c8661eda3f8b18 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ac52f6e549a7c836ef9d896fbe6c005fdc9c28e9 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                   perl-5.42.3 | 1 
                  prboom-2.5.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c586dee7e6c49582727a3c7efab57ca9e5dcc911 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/c99850c1b504901696ab6f1c3e0be74c4d824803 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/46975ee8583b294dfcb03c3a10a408673078ac42 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    azmq-1.0.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/e034cf69d765c4e417ffec0b433a6d3210b1eb9b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
