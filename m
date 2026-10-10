Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCCFCA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 03:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D14D080E3A;
	Sat, 10 Oct 2026 03:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxUP_JlsFE_u; Sat, 10 Oct 2026 03:32:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB515808AF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791603141;
	b=oS5Rp1Tcn5oZNY/t02hwLQxkq3C7EPDcSPzbR2SJzKOHCAR0gGKgXN451yk6vEbHAc+G
	 0fGraK5PV9OVCA6A3r7u3lU/LQ26VKikE20cnBN94XycDSUO7dPJs8ivwwQKh/lFAJL2W
	 1jJtz9+YW6KKZp6lVWNODEFxED+8i6OrdPjAt4uOQHzQqg8CdOn6w0P/bDIEGfJwisuNJ
	 rMFF8+EOO1C37SxHpqho7P1/thVRui25qeeaCinkNyh0tLQc6YvldF7hH3BPu0hj47dTk
	 JhbfV5G10rFh4wd8YIX5+runPOq2GUyH0wd8fojT+xl0aP1oJZic1vZsq21+nYyVMVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791603141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KJEvz7/Omr60jKhSlXYLRaEKELMzz5qQG3idmelJ1+Q=;
	b=BGqxmg1yyh6y15QhIRpkFn/M5FGDVeGm1+6nArOozYgR2f5Btdilal8JAJXNuxer9Bmz
	 OxZxh+nMxgGflN5IhQzecM4Yi8Uj5OCBUqyrD5xSAJdmN77N9Vh7kg0vP66iXTfT40/lj
	 tVBLnB7fqa2iB96lTkL59MwDsktN8RFswUQVbguEtwHSF5nzNTqGcn5Ek/iuC/xD5Mu7m
	 vJ88uJp5E7WJHVCVqBOSp+OjjcCa0XMx2BxSN8oI5PbR9agNduygiVYEg137lfeRQAKcs
	 Eho0zOPVwDB5kzo5sXSXwMcLHPOhg079fG6FjnxZSofTHFck48jzpYZ88yJqeKW/LTQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791603141;
	bh=KJEvz7/Omr60jKhSlXYLRaEKELMzz5qQG3idmelJ1+Q=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YqvahmNq5FyzpHnu2Wh0pMImaxLed1D/2Zw/82GB/iUCJdKB4MiM9rduvqAnou0Tz
	 SdnsPesZ5Z+H/yp1auBQYkaboXI0dcjQDmnutFF6LUVlg0HZH0ssDkILmQGNe1gl9D
	 lLkByxijbQKNHmNgs799VO9j1wsY2UMvRheDr+LzVToCrEdmqzVzOP6HZOIza9fw71
	 zqIwlkxIwtFV/s7CHu+K1k4Tw0Nhvizhq85a8zQeKxeUPJkHSZ6xD7Gr7lgBChXVs7
	 y+nmQaS5PkLDu/JP07sleY2+3gxyP5IlwL3ofy2Y7csOiv3/o7I/Eg0fIOEP5T8mB2
	 nFMgy7OS+Z/+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB515808AF;
	Sat, 10 Oct 2026 03:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E2575
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 03:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBD4A40061
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 03:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLoPzHEi4SKI for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 03:32:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7B52940004
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791603135;
 b=r8rqF42NHJX55xdDgTwI9PKA3y+BNTPA7Sfgfhzsx1ihN41e73ETTbeYu18CaNakssjX
 YJLmN5pfZrXC7+GNe1QHKMDyv3ig3ODLFa2DBWmlz4CM9IyREDeIdb3btLR6+sMhcok81
 C57KfsQSKS/2ycmhnsvDXKU2U4lbcLtGK8e6y9FaRKBY7OfgOyv59Gi0Lcc0uZ62Alfaj
 2RRGSzV2rsE8GKUrIFVQWTHXP0Yulqf+w94eC1BQGnQehpxifsjSP6SU8fYKyoGCUtQ4t
 bhB8rEEsTBJ7dBFJZ3WTzBufp8gaHBNWkPkIM4sxpELi8edoeW4m79rwZq7kXfFm3Cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791603135;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=BBWBx8zjEeMmoPBqkAIJRIkDSejRqUPpm/M6ukooPh4=;
 b=U3vNjlKKAK2e79tMLorkKRA2ZidYR3v3rYc2ZJl7nNP+ARcOlCTglWjp4XYCJ69AhE51
 TXQrOvk5a1WSn8wcRoKirHv4ReHjlFmK7HYvtNY2dzIRY08ty5sW/uFKYWb2JZ6nDOVum
 8tfoktQQjPnihPMF/c9qXGy+an77O36EGxm968aFNBuNeLGiFBxsAtWpRD1q6MUstrkhb
 kNWUQlhiEfLCIPRtFIPvsy5PfCP8xxh41nh45KCkBfK1TRCw0CkywyAjSVk9+sweMUy0Z
 hdCnwuAhJKpiFINCheScbh5flJeGNnxOCdbSR+867AxNVdgcptEyPLA+KS3kF/t0bww==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YScnC46H; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YScnC46H
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B52940004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 03:32:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so3134395e9.3
 for <buildroot@buildroot.org>; Fri, 09 Oct 2026 20:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791603131; x=1792207931; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BBWBx8zjEeMmoPBqkAIJRIkDSejRqUPpm/M6ukooPh4=;
 b=YScnC46HY7WcecWT4FOMn/NjZRIuXxXDMil2LgAj2k+sfZk1BYJiVWRJO6ROaQ1mzx
 uMfey5ERAK6M2vSaf2WZik6S53n8yQnrg9KN8H06PhJSkT4pXOzF4tvR3sM/dT/fYzA5
 RxUI4qEznwuYDKXUFP5qAOqtMEBqRRTBTqK9A7JcAet/mPIYhNjSuenWOd+6nt93Hrdf
 JnYhT9yghmVBXbikldtf7i+nMEPvkfPLaIO99O5qnRg3rWBmKrSqJk/fnrh83mssE0b6
 bFykIFAKttwgiepfpGXd5b+qJkjuiFw4p/8mIPdrBN43oeiAtA5FsNeXW3OUkHTNUgkY
 vG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791603131; x=1792207931;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BBWBx8zjEeMmoPBqkAIJRIkDSejRqUPpm/M6ukooPh4=;
 b=CkUQtgbodtvVD8azgQvxgSByzxryPitnPzKUAekZjjB7stLyYFxDr1EXAK7TAccIjV
 JWTDvpeHi0lpZE6SuWjlImBRfoBJGDgiQJf3AAnd+/x8j4uRbz5QXklxMXyhkVnrYYIC
 ANl7LE4IFt7mUJxkv7+vgNz6Mdm9sdpcZ8yAYGPrRip8A/1RK/t497rkxVBeFOuNVvBl
 nZfg0IZeGd0V8joEe11/47qCVtSaSu9sGQQ3ob3OEk9R/PxDaDDS2Jd4m/BpbRN5/AQP
 +axB0gHb8FgsAre85LpoESsNw0t8O0RLHlCFSlfYsoNElLhlQ7jAz4mUXP1UvtMwDryR
 /jbQ==
X-Gm-Message-State: AFq9FYJ/hoHOpWD6KlCiZ4JhuB2U3PKlpQpdIXlyWkADuiYc7rqfyRIs
 VejHxhJyyQAJLsL1o6iTPqxI1Uzv4gU3oL1MTndoEaG98ficNB01OnMj0L9JXYOP
X-Gm-Gg: AYBFou2ZzhE3hwy+ZyEFLGtyPTWiNL+fZVHT/Vvtm5Z50VXqnAk1dZCiSu5dN1mxZWK
 ZMxhAxeIX45Bh1PijkY7/zqH9ewTcWTiY1cd3733ScMLKjCImExCscEyqISWxzpi5Zas8fox8IJ
 hot+G7w07GryOSCXVO+ci0rShSU2HW5okAUEu2XFJtOh/uHppaCSaIq17kx8b4vlj6pY2ALQOQ5
 //WFDbFTDj2TIxzmlxyd3GH+hcif7s7wjO6d5l49yXPDynPAIVMmyFUhnrNbcj30upfcRyPPh0e
 yKBeFpDMS14W41rcUiPan14yhsYRoxH/9m+Ds3mr9rREoUZx9m7lAvzpX+jHHc/JMsxYISbyZ/V
 5h3kCHUIGd4AmC0wgpZNH4taLlFKN5ITj5HvHSbTXIfCFmdhadL8LcAFx05BajbiZCk/hWhEx/V
 Iu8NyP7N8e7l89Yvoe9dF1NkW27mOe0RWWYHlZyvhDTMhJpNj+sGuUykmMKhi1WYGHOVv4OaE38
 A==
X-Received: by 2002:a5d:5c03:0:b0:48b:1b1:af12 with SMTP id
 ffacd0b85a97d-48dbad4dab2mr6508973f8f.56.1791603131065; 
 Fri, 09 Oct 2026 20:32:11 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ade914sm6416477f8f.54.2026.10.09.20.32.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 20:32:10 -0700 (PDT)
Message-ID: <6ac9b1ba.b8bed76c.2dc910.a18f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 10 Oct 2026 03:32:10 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-09
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

Autobuild statistics for 2026-10-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  8  |  0  | 11  |
  2026.08.x  |  0  |  2  |  0  |  2  |
    master   | 14  | 49  |  0  | 63  |

Classification of failures by reason for master
-----------------------------------------------

                 libclc-23.1.3 | 5 
                   perl-5.42.3 | 3 
              cryptsetup-2.8.8 | 2 
    host-mender-artifact-4.4.1 | 2 
host-python-types-psutil-7.... | 2 
                 libclc-23.1.2 | 2 
                 libjcat-0.2.3 | 2 
               tcf-agent-1.8.0 | 2 
                    attr-2.6.0 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
      docker-cli-buildx-0.25.0 | 1 
        edk2-edk2-stable202602 | 1 
                    emlog-0.70 | 1 
                  ffmpeg-6.1.5 | 1 
      freeradius-server-3.2.10 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gstreamer1-1.24.13 | 1 
                 haproxy-3.4.4 | 1 
            host-mfgtools-0.02 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
            igd2-for-linux-2.2 | 1 
libfutils-c326ce0cc2a735438... | 1 
                librsvg-2.50.9 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 
                  ndisc6-1.0.7 | 1 
  nxp-mwifiex-lf-6.18.20-2.0.0 | 1 
                petitboot-1.15 | 1 
                   qemu-11.0.0 | 1 
         s6-linux-init-1.1.2.1 | 1 
               tipidee-0.0.5.1 | 1 
                 uclibc-1.0.59 | 1 
             util-linux-2.41.5 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/f192e4c37a6045929c716927735c708769bbd596 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/c703d5004943e405c1ccfa355865b600336c7c49 |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8a7bb37ed009ccde180df8c4e4622f795d2b3c65 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/8885673ff7328f068429e937c83b7d93f1e47816 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/54f397a75e632fd928c1847efeb7ffa1c93f20bb |     
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b99bb78f91551f69421a83f4d7718a0a2a0c1280 | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3754446a3e4f6e9b3792001c927757e35410f5a6 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/c2cb876ec9bd995d178d7eb502e68129aad72d3e | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ae0176ad89e3fcabc7f544a80188b8666cca6cef |     
    i586     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/deb3a399f1cd7a1df924b9d9ac62671d6ce3b514 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/bde74c13267b3cdf6a9f7c601172df4d9b9cfe85 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/2dd18431b55c57bccfda2d07f05d36a68a1d2db1 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8d1bc4e322eb86f9a3a78d95f29198dee3717e02 | ORPH
powerpc64le  |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/34c4dd8c7d12165c1ff80c876bd1351417e8eb2a | ORPH
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/82d069275779a01818431733fcf0b88fc33bcc6a |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/ed03dd8b799a2a4d3e9da24389c1c1cba63955ea |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/2170eac3d9aac7923a9b9043d47227809d97bc22 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/28a388501e528723641f0be69905c072546f5448 |     
 powerpc64   | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/70d2085c19df628cdce1117980f6cd090e016267 |     
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/4c35ba4222994829d58753c3edfad4bf64913339 |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/7bf7cd60587c37091ef7461d04cd098442405052 |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/fe5ea3abd335b5f7ce615176e3a9f2f8c0adfaa4 |     
  aarch64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/931ce46dbe6946f1996450e9adf3a3baf707c581 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/b315d70c45be084e95f26b4268b3b62850c94c63 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/619d0f9c5447a690d7065c13300b4d60671f4b43 |     
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/7efa0f65165bdd8cfabeb5573d542b230ec475f8 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/a114e65583c35aff669c2ab10b3dc007ba6bde11 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/66209fdd593bddd06ce912bc20726e54281a0a26 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/21d68e7a2eb343f1b604c7c509a91ef5e0065858 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6abd270692cc7f5378182df5d793af3a65c608c6 |     
powerpc64le  |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/19ea1522a4e4f72042bcf2d44f99af032cfb39ef |     
    i686     |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/59c4a6332e320bed2fa745e0414e9d95898543f9 |     
    i686     |         librsvg-2.50.9         | NOK | https://autobuild.buildroot.org/results/1ed845b0887e4bd5afa19153c1ed20b3bed05ab2 |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/2f1b223649fad5622f41321ba6b75b85b908f097 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/6c92c3f8ad3f4d980ea4d188d72a8d7bc4f428a3 |     
powerpc64le  |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/84734b8e1ddcd3a8f6386a33c0eb1831088d60f4 | ORPH
loongarch64  |  nxp-mwifiex-lf-6.18.20-2.0.0  | NOK | https://autobuild.buildroot.org/results/872344b6ec6c5cd5ce03fd247651d5c6a7b0b72e |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/93b2f23cab521e61c5684634fcf9b9005b55826e |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/642deda6981fdff3eb1e5d4e7793b0321f05dcc1 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/be4503483b511d11c219a8596a85ab3be069aa2c |     
    i686     |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/682630b4d64532f9a134796c4509b79ff8b35caa |     
powerpc64le  |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/3e58b4f90462203beaf6c7604df133775f275403 |     
    i686     |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/a7bea619dd91669b75fe1bd2c1210fdd05ec89c9 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7b3d8d33864ee4a376822e1b4d140f3c97f6b21c |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/47547156e46056a324f903952a430f3a456ee19b |     
  sparc64    |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/084db774fe1d806fab4ae1b370b9bf458da46b74 |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/eeb37320a0bb138003e5a1c80605f2e05643c706 |     
    arm      |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/93637dfaabad0a1f11a94488421f6cc73882817f |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/defe2e02014e9db2c6ef11075faa15748def9abf |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                   dante-1.4.4 | 1 
               madplay-0.15.2b | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/90294b2baa8708491a7c0e97f665c8c51df12d59 | ORPH
  riscv64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/1b3836b9ee831a216717317899adc55ccbf95d6a | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dante-1.4.4 | 1 
             fluent-bit-3.2.10 | 1 
               freeipmi-1.6.18 | 1 
        host-python-lxml-5.3.0 | 1 
                  liburing-2.6 | 1 
                linux-6.12.111 | 1 
                openswan-3.0.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b843494f602bfb3cdf336e6167dc15a8bb7321c9 | ORPH
   mipsel    |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/e07809ea5e5738d6b8ab78775d5e0c0e6e71c889 |     
    sh4      |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/4715cd7065bd7ecb8e1d3ece587da666a8ec2ee8 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/6a788215e38f57a0a6234a14707a472358b96974 |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/d43498e652afed74e259f73e92c665d575a4f38a |     
   x86_64    |         linux-6.12.111         | NOK | https://autobuild.buildroot.org/results/c9d989965c0e384372c4592bb4a23ad30b0f2d49 | ORPH
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/6d15217754c865b966328ea0232205f4a942f6ef |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/514f340c737f73ec4d5a206907d22e8005cf47e3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
