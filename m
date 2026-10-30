Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CBB606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 04:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NRuJgl7v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxg8aEgb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC8F40758;
	Fri, 30 Oct 2026 04:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up2pi1zqaPvk; Fri, 30 Oct 2026 04:32:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1E32A40A9C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793334749;
	b=bPrqZSWHPiGcrgNAb8NsaWIcIjD/4RcjughD+ZRyFaZIkHoBL2H3RcP7NrOrVF1dLVqe
	 VX9QlgC1gaANWwmDmSjOpvY4FJvz1I6gpqLmuoikcjmfPaIpTPHhOcN0O8vJsIP/PpWIn
	 wirxcm+AvpOAklul4bZFTlk03NOjX7uXymFZGhfy+aHscVzCc4EAhyEtnoKHR3EblfhPD
	 GkzAoSxDgtGVwIkGhpvaE9BaNmC624jLP6aMufHjb+raNUlUdcdrpuniJeiJSZ4n9Qlqp
	 9HDD9ezX1PMtuTKyEzl/ueXayRSbLmPUOdFGV3cr6MVZi4jAAM3vcbLSKC9sI3RjDRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793334749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=S1aYHtT8LG+40QAc+CTiXxqhVHb4AMnIIu5HDo1AfGU=;
	b=lRcxgu8eiqu50VfOprQrEcjMiqoYbwR2iZaU8OORroW7lf6ztY2D8fuPMTsJS29QRiMt
	 fSklKo7eRxFygPxtVRwcWH2wT2Che8SsyJqtrLbS4uuM+zX8D7IgaxPGgzwgRmK9RrYXT
	 lhfTESc9/jbvL9sce2BbGdnGY9up9qqiOibS0L0wAnJzBXaYViY9bgJ466fJuHAdNZIzP
	 z3NMKzW5tvrcjRuTyrcEMZt4m65K5Ppzl2AZvX3eFQVt1d3mOR01963oCypf2QAHDCDhc
	 vDgZ6BIDxueNRluOmdxyAAJiMJj4rbkWJiczn+uw73BbRtFFKqaYL4hvw9n5q7BLRNg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxg8aEgb;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793334749;
	bh=S1aYHtT8LG+40QAc+CTiXxqhVHb4AMnIIu5HDo1AfGU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NRuJgl7vUsm48nbw1JEl/zKK15tihke+DdJOSTJy0KqTkA6nvibdwUYBfDB6ti+r8
	 yUMVA9I6E6SE8Vl7TUD1lKk/aNZDshIMNCfT0lZmYZxAQtVDWw34h9Z9ooNdA0j+Y+
	 rfNu6UwyJh+Sq8tt1e+DtUqphvLv8nSPMUSgIddyrCV8/GjviINKwr3eyBBNxkGXxm
	 pA5oslmq2ZOWt+T3IYbToKeJkU0obT1zFWmG6QXcBFGdobUUJB/MbRHIlgARxVKY+l
	 EzS6cUh9xbjs9BpG+2TjzR37wV26lLNQday1XYv9AC3isoK1HQilTxYqlajdsTw5WM
	 FgqilEvmf7hLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E32A40A9C;
	Fri, 30 Oct 2026 04:32:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB241DE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C7240A9C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YQdxj09oSfK for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 04:32:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7176540758
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793334745;
 b=AGBysal7qMgMyxI3axKXjO3V7LEKUxly9omYHHNKFbtRmx9GPzVUK2/5Cds6dsK2aZsY
 zrA3eXUxfFYZdjqhljWMbubQocEvP6xwsgD30jF13PJY1hc//DrsaUIeeFggeqxGFjb8m
 CTvhcfBbKpAPDa4tFDjmRmYlllGIV4XO6+s9RBP8bADrih/l1iiFkOv0xe2kLEHdohjVl
 8XeZMJazaFAzxlV4hDd8M7dsRQ/26lUYAST8ICkinuabZCKQL+teUO9ILkJxCHEcQAD+c
 pNkAqK6DLXTmZdC9lOWmba8iJmygbv3rP8KLI/TkqPOTwT4as78+jScAxBhhm8O886Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793334745;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=BnJWFWlpzI3FnyYXAH++SMo6nYqe1hNEA4RWkpLt8cs=;
 b=Ywd9ohab6fg2vkgDSgkM8vresimwy8xArWesTVqHKMZ8S/S6K47gi/0li7tYtlcGbKgM
 erzsjpK4zdAuEicgXi9EyhkSY+VH3ZdcFXCQIWU0IVKsWsUFNDCUR5fGPlYaX0a20hTun
 t+I7UlEPWlJIxkaOemmmKnILTj2TszjWyngNz8HdklWl1CVUwkq4gNJcPzjYse5hj2yTf
 P2omLASGiKBF35PiIGw9A3TpbYuJYFLHQEyYtULxrUu+qCVoATB4CPwnu0Ys1CgM47JiT
 PzlFYgA2juUVGaAENCzUzQhV+sYmIHECmW/Zi5GAlcgHmZqsKKsyjeC96b2V/Esd7Sg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=bxg8aEgb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=bxg8aEgb
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7176540758
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:32:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so217226f8f.0
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793334743; x=1793939543; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BnJWFWlpzI3FnyYXAH++SMo6nYqe1hNEA4RWkpLt8cs=;
 b=bxg8aEgbZBgDM2qvm4fbLps/AneZ6HpwGLoqBb2W8b4DdPV9dTwNqo4bKDEE2kJlzU
 /AW55352k8V34Jzfeo6/6X60Mo2UX52DTNR2vIXZ8UNwhk2pMLbU364MFLYFYqu+r2gf
 juNrTiBqkHxNYAktuYr60wHfvrEgIe4gN/eLvq0fJXnQaQwJsT0L0FXZTkB3UUGlAtQC
 QhYL78CW3gnMUepHGYa8mMl72J5kXoHndJ7a/ArPlw/VjJI48S8iEZEOh6ybRcOOSR4Q
 W61RXZbBAwy+7diKqfhczgbDaRqTuN7MGAQGb1VSRLHOTJSMFouWy7+yD89C4AgH//Kc
 L8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793334743; x=1793939543;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BnJWFWlpzI3FnyYXAH++SMo6nYqe1hNEA4RWkpLt8cs=;
 b=XKkKMCxV0VBTIbCpS0NcLVx3DIiLEuDsvUl2pKEMeQzz0OFP+TZawiItUQ2Hte94f2
 yxslhJHW+y1IB2XJhsqy9uzvVz+FHijZkYOKcE8vYjpOZ8OuTPmDyJ26nye2H9Y+y4yy
 /BLpd8LNk7a4JeGgtMg+78B33whc8gWzEuZMVqY5r15N5hVwjCpcwwGFQpAk30HxmKrK
 BGjQAMF0U8/fpV5i1aJ2WkCe235tX0EpLam1/lSr+YQWVAexJWeyWYtCabONYIw/0DXq
 1aSlHibMjxZbXo7duMAQye+VzOE96izEpt5vIlhk/kzTyjOG/J+h0f9VPGU52y6rj2yx
 /5KA==
X-Gm-Message-State: AFq9FYIjlv5U+5RiepChrjayPDkw1tB0HELbKyEgVL/8ZJUI3KDKTEys
 lqFRXa+E0Ot1v07aIKA+YLCEA/EUEHd/N9jHTFp3M8CVay9NZkqaMQ9U4NtzZnmF
X-Gm-Gg: AYBFou03AjeAVD4cKJICSZCmVHEPO+dWQq/GQI8YHYMQ95arZcXdUEvPSxKeclVb8rP
 +Nz9/QE8sOkiYhx1RdwgOQWKx9tb2OToeGuOriYcF3BMndt8iAu9ZfE0VAl88teLdwa1LenaaJg
 uORRA3K4xHLR+mbV+zEIqaU7n2qeDrf2oui50+uBplK68cPW/kZ1t9e+/IzGqWJhdM2mM6Ceb5z
 CvYsGeJZXGLbhuRqbaIe4T8C5zd4KVR4mjpZgHzXgOJ3cG9vsjFGekaXsgV1NEKK6Zc10GA4y0y
 h29hxQmVyHkcMmiS0JBRFW8xiYeAxim38JAK+P1laghOPgJao3Kyq3IuUK0cpN64u7tPI7K7AYu
 wMZWdEP4w4bgOk8L6RHTKBgDFcZ742ztVogLjvpySLjIDrEA6tmjmgqocWOoL/PT30vvcJ1aEs3
 TOKx8b9fhwdJPMfcapAlk0ByaFJYTEzxTzvnZlWzV1luX29kJVeiPsMqKiOqSjYzFa3WAXGgNPD
 39KPFXwq/p5Vk2JibZGzcq5xt4KsJhOYReU0HnehNdGQjEWfwwS7bfe+rLgbOZSQkus5FX04pRN
 JKnKVeorflG62oWwi8pTVD2iYdH9YtuRrsFUzVm4l1BxRB4sAPA6GVZOHA==
X-Received: by 2002:a05:6000:29ce:b0:48d:f7c0:97c0 with SMTP id
 ffacd0b85a97d-48e6e304627mr1685573f8f.50.1793334743024; 
 Thu, 29 Oct 2026 21:32:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b723cdsm1028283f8f.12.2026.10.29.21.32.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 21:32:22 -0700 (PDT)
Message-ID: <6ae41dd6.6c7231db.2d295.96b8@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 30 Oct 2026 04:32:22 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-29
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

Autobuild statistics for 2026-10-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  7  |  0  | 13  |
  2026.05.x  |  1  |  4  |  0  |  5  |
  2026.08.x  |  4  |  3  |  0  |  7  |
    master   | 32  | 50  |  0  | 82  |

Classification of failures by reason for master
-----------------------------------------------

                  chawan-0.5.1 | 3 
                   perl-5.42.3 | 3 
                       unknown | 3 
                  ffmpeg-7.0.3 | 2 
                 host-gdb-15.2 | 2 
        ltp-testsuite-20260529 | 2 
                rdma-core-62.0 | 2 
            18xx-ti-utils-R8.8 | 1 
                    attr-2.6.0 | 1 
                        chawan | 1 
                cifs-utils-7.8 | 1 
                flannel-0.26.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 haproxy-3.4.4 | 1 
host-am335x-pru-package-5f3... | 1 
    host-mender-artifact-4.4.2 | 1 
              host-rust-1.99.1 | 1 
          host-xfsprogs-6.19.0 | 1 
                   iotools-1.8 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                 lcdproc-0.5.9 | 1 
               libecoli-0.11.3 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                  libva-2.24.1 | 1 
                 libzlib-1.3.2 | 1 
                linux-5.15.223 | 1 
                     linux-7.3 | 1 
                  lldpd-1.0.22 | 1 
                   lmdb-0.9.35 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
                  mender-3.5.3 | 1 
                    mraa-2.2.0 | 1 
                  newt-0.52.25 | 1 
  nxp-mwifiex-lf-6.18.20-2.0.0 | 1 
package/python-scipy/python... | 1 
         python-cramjam-2.14.0 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                 s6-rc-0.5.5.0 | 1 
           virglrenderer-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/500ab1e5fc96b226bc6dd9bd7c738e7bc9b9cd9f |     
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/0cd4b9e9c02c4e279e9e0f6d2334c096e9823cb7 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/b8ffd5d6598a756a0a132162c1ee9d4685f7ef29 |     
    i686     |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/8dd7227ba0237ba2cd5043c4cf89dcba29282bd7 |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/2db4d027055013c0520fb1b83cc68150806fb016 |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/3a7f2471521f9062f11e27e71c8a9c0e5445e3df |     
   x86_64    |         cifs-utils-7.8         | NOK | https://autobuild.buildroot.org/results/eae6e865159977087a13c99e9afea41188a8a9e4 |     
  mips64el   |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/64ae4af8a62b82036fe287ac1b3356372d3efcc7 |     
    i686     |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/9930db6ae69e3864616a02a124dae98160d31fa1 |     
    arm      |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/1b7b1daa475c3ed7e02afeb71350695998f66e3f |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/7f0621c2de681a4330581a0890da01951cda9629 | ORPH
   x86_64    |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/bff4499e9ad0df9a660b9bbfa231171e6ff53b3a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/bb76db695323ad077844a0be2056d6db92543429 |     
  aarch64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/7327a03b45fb0aeb2386d1d25a8af659421479ee | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cb9eb82f5ee549b7409ccf8f19d0f6e1137f3f44 | ORPH
   x86_64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/160d6923d7147e7f88863ac8ed69365dd833912d |     
  aarch64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/31444f3ee80534656bb000d4b3226e41d615bb1e |     
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/64ae5b418fe626393deff81eeb3038b7ec3cf36b | ORPH
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/a3d053b21f7db1090c6bb9120399b9d3312500b1 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/e963c77fd640568138adafad4b9c49d243aedbd0 |     
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/b8b1780c360606b4a88fa9b69248b11142fd41f9 | ORPH
  mips64el   |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/3d53d5aa62138bfaee50f828b4993ba643647de7 |     
    arm      | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/918a8a51e86deff7dba09d806ac88f4660c4bd29 | ORPH
  aarch64    |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/76cf5664a879aa0867d24714ecea6d606377ebf5 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/3af6bf69b9a5be73d216f8487f08fd953391d9e2 | ORPH
microblazeel |         linux-5.15.223         | NOK | https://autobuild.buildroot.org/results/3838467ee00d618214257f7d479eec68c88bea4e | ORPH
    i686     |           linux-7.3            | NOK | https://autobuild.buildroot.org/results/992e285898646b97688c4e261e89faf476ebca01 | ORPH
  mips64el   |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/8ce3c8eedb5e841cfd3341e1f03615587c7159fa | ORPH
  aarch64    |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/e4f78c7d9e64142a817552125f8ef6bf6663f673 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/5563dde7e857414a30c8abe02f852ae5fbec9f57 |     
    i486     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/c0db546a0fbbc159480d0039e81c552ae304577c |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/57e35c81200715bb2b8cd725555d19d57c552973 |     
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/89e78429da964c08c91f51d3df5a477746649cc7 | ORPH
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/98d4e171baedfaa3cb6837a50989cabb52f3bdb3 |     
  aarch64    |           mraa-2.2.0           | NOK | https://autobuild.buildroot.org/results/9d0617f741359844564ff040110f64fb3d75dc36 |     
powerpc64le  |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/929378a23fb9a936487332a6c92aef78ee64d96f | ORPH
  mips64el   |  nxp-mwifiex-lf-6.18.20-2.0.0  | NOK | https://autobuild.buildroot.org/results/935979427995223b31b9b05ab6a294923810cd84 |     
  aarch64    | package/python-scipy/python... | NOK | https://autobuild.buildroot.org/results/073f66d571cd948bec84c08621a09d07b954aa69 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/bf22f0e480a8741554bfdc29233f3f37a2add371 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/2ea88392fd331b53f26ac2781c9b807f86170d55 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/cd0d79fecea89e5a0f5ec4f45c11fcf2136e40af |     
  mips64el   |     python-cramjam-2.14.0      | NOK | https://autobuild.buildroot.org/results/0d924207c72a7937ad4273f885cc92dd0d884232 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/3218560336e47b5f4360651241bacc2b2241924a |     
  mips64el   |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/7cfab0e0a075dffa02fbaf4f8400f1619a3ac7b1 |     
  mips64el   |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/0adfa5ebdda133066011e22f0ea9dc898d671974 |     
   x86_64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/ed8a7f642be1e8afb024a1975201202ca25f013b |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/42776edce5998b3684dbced8878e687f4dd77b5e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b20be56cc7389e86fffca1f533f108fac7f35816 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/38d16aa6130807dcfd2557a757d6a1fc03043986 |     
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/196790c544adea3e031dc126ce4ef9d4a49424f5 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
                      fio-3.42 | 1 
              libmodbus-3.1.12 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/07a2549c6004e0c47715aa774993e2c08f15c3a8 | ORPH
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/bd11a9aded7982a14d9e7dda647ed0c68daef162 |     
   armeb     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/f31ba4c9d50783103f2fd72d1899303a09bca9ef |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            dt-utils-2023.11.0 | 1 
                   exim-4.99.5 | 1 
            jpeg-turbo-3.1.4.1 | 1 
     linux-5.10.254-cip72-rt32 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/59f0379f5ab096a5071cccebca870e43d2924905 |     
powerpc64le  |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/bdc06e8861d0d39b4d0044ce4a1809de626748d3 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/431b39dd15f3d29720bba064aa3e9d3d78c2a4ae |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/fd0158a73a8a448e0d68e93d7a37911c2a4c360d | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              execline-2.9.6.0 | 2 
            host-go-src-1.27.2 | 1 
            host-skopeo-1.18.0 | 1 
                 libgee-0.20.6 | 1 
                 openmpi-4.1.5 | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/623d2eca2a27044f85cd35270178050e198d0fa5 |     
    i686     |        execline-2.9.6.0        | NOK | https://autobuild.buildroot.org/results/e713ab95281358aa86a7c3380e8fe7214913a947 |     
    i586     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/30daa3f48d0f9f380380e33d9717342ddc68335e |     
    i686     |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/78d88267d77629d05134e0f88e363545f6112a22 |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/a0c1ae23d80fb00d3fcfc50746f2fcd9153b4768 |     
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/ee1c504ba53c574a3c257fca1417b302491d9fcc |     
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/de2781d82b634f91e54a72d00bd3f3b9b559012d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
