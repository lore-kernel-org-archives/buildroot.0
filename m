Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA13CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C542D60AD3;
	Thu, 15 Oct 2026 21:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qq3KnTShe252; Thu, 15 Oct 2026 21:52:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D336360AE4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101166;
	b=sghequY5lQKbp5U+WZ/mma2skcA36I9EMGrTwUDi2aTxO+XEkguZ2nkLnUCGycS1+Bed
	 TMtyNOudlSXGizSrGSCFLUioNQIujK2ySAnGjkWIvFNom+r8Q8UIdB7ZlgSa2J1hw7wY1
	 QBwhlwekkBFm546/ZERI47Ba/rPiV7XNDaIYDTIoNu2n2Ba99Y7gN3u8ag86aRVK+zeg4
	 xkcbwmL6f99F823ybdffI8iCVKoLWrHReZ6N0fgBvhsQiMF9J4zl6W8UiSWzJefG+E//j
	 iNEPvaHxv7qXYR/Y8Glx033x306RmCi+2DoEX67OYI8621orAM2amFwnnxnSbNcAoCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xWNfhhIZXh+vuZbD8DYTFE19LCUzoKLP4HN738I3hOo=;
	b=fY8iMmPUUPorWQeseltM5AvP++oci3E0njIlPBDHqcrqMbdH+34tYLqtJPNNgM6k3nWL
	 kKor1slOFkKey58PTZ5KP/bwdOctgUcy60bXzyDqDv2BAxvLUF/NGMI1aoxq3o/eBj1pX
	 w5BR2vduWioc+Z9GS7mkMHCfpoWUV7E9BKsYuk2LE9K3VJd4Ho+v1zorKCceHYOo02BVn
	 nOQiFGcoAFtkmy3zyWaKmMDqnObNW170Mz/hjhDWKMApiGiSsF0URNC9CwNEZQnLJsKu7
	 fvRwCocJjZTXGLTFxrEDDikOfeWu4c+rMXgrswV4pmgqFTMlzLkud3qVXvl4XE0dFag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101165;
	bh=xWNfhhIZXh+vuZbD8DYTFE19LCUzoKLP4HN738I3hOo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rqG2FELuEce3PIbVyGoo/hGM4A9ZThaQ/BqGWnezOqShP2cz0MnQ97bmGfJflYPD2
	 vrg1NrL77aNVSKEg6dggn2pWUpIV7uSJn5HenIlBW+4WVBwHi5URHJRf58dGu1T0HZ
	 hpSWEg5b7w/SlOT8ah3XnVkp599N6cksycU7iKgvRBQgSajw81bzgTIndnm6Mp+moF
	 dgj3Raqf7T4VNGd1p68eaNeR4wxjl+8VyHcCMJS2ybZvidu1H6DiTJUs1qhwj/XqBv
	 Br7vMmERXeXfVHfAL6NQBwadLAC0uZINkZ8h7jjt8Lh4G0akfMkU0wfm+mgeUOxti0
	 /Z+2NPxzuTEhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D336360AE4;
	Thu, 15 Oct 2026 21:52:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B40D332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 323FE4045C
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tr0rkpRxju8m for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 452444045B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101163;
 b=M4UnWfuH6WFjtwf9z88vXGD+1VGnr7OdWNgQu8vrzEPidyt1enc8TEm3iH7tkfzR5Awe
 QP40gJ9c6yfz5aBQ5VoPj6xKHRZUypQXt1Gt0ODrDIZ6W78Twbqf+RgRaob5E1wsDLDMo
 7613+OGMroCGCae/iZAf23lFWIWl1+e1SabOHCOAIJ6s7Ymgd8q+2JuoAIY5L3mCd3uE3
 dZlh/y6mCR+RIdUGEjlaKvlfLBwVxzORIQTSOjjB3JQBzOX0qaTvrhLl2v/rC87Ylc4Pz
 ZulwdKbSCvieI3+dq5ODuJvRGt2Wh+gH1zHXwn2cpgQ0U50JlM4Tjei9RGsIYintKzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101163;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=gcbHpwPDM2Wz4ECcdfJjmSfShzzkie7c2m+YEu7KJvo=;
 b=WbWcEfweRgqF766QphF+XFsbYLr8BucS1ujsQAbuJIiBGOeXtO7ZVPg3ruZiP38iKODm
 ftxgPg6kFrHovpu3+M2c8uw31d4Z8/Hn9A0EZCfOqxVkXB1Tfpt62MY9b/tXSLrzbcP4L
 +9t9Z5ROHzAOK+KWWs/KguUZkykPQz4XM6wFXmuWYuhDMoMgO+zuRgo28yJT/4kJnTv3r
 vFrdyUp6qaCCwowzLmIHAx1qcKO0HGavNoOga/18SsaLxaaoNQMpUpNmFqa8vTTIaq+W+
 rLCv8iB5w+0ZZELAkx0J8FnnL4RIyF6l/F8Epbsg1YY8zd/EaCYxnJ1ZkcsjxFv8/2g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TK1B5llp; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TK1B5llp
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 452444045B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:42 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-833e671ee9fso4200142a34.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101162; x=1792705962; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gcbHpwPDM2Wz4ECcdfJjmSfShzzkie7c2m+YEu7KJvo=;
 b=TK1B5llpcBV5KTPdmanetHSCyS/Yn52JgK85iz+DWdxwrb4GaCUcUE/g/n5tfybmU8
 SP6JW+GGY0WTbxQg6fLHbAFHOeJDaQlj04DxW/3YSdmK78kurMV6+FTscEFp8hJsqyB2
 OVjrL2j4+HS8VusXVDKgmsHeZP0hXVY6YIgjOFGzZ4D3ly3uz7E5YuWCt1KoOqg6nSWH
 S5mdrLzTETmrJXdz9KdYNm2W6jG7cAWPT3beMjdi1YttB4gAHIBUmdydym4y6mZfglNZ
 K9pPMZhcktM8VtVRQgerFW4EcHr3Aw0S+lbNpZ8pmpSlzpzq+VJMtC426LGGdHshtGB7
 za6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101162; x=1792705962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gcbHpwPDM2Wz4ECcdfJjmSfShzzkie7c2m+YEu7KJvo=;
 b=lFew/QMqhcm33TqEEW+UiVJSs4wxcOBMK/wOX4xMPL7MEg8CNGPnDZSCZJ0qgpAO/B
 RuvRuggQIMvUk9mCXUc11hQQ/r8mmubguGFcWapEqlSrTV+Z14XaK4gbeVBoZgYWsbgh
 eFwWdTPJqj0EWcdhIZ3ln+xVWMzfZ1sgXci/xYWT28b5A++BquO8FMxC19px3fui2heH
 IIs5Z+eUMNisVoz5nuY7/YGLWjitsIYB/AOQvu4+5EX+yGpPljWo+JV1hyW7uNPp2sE0
 4jBYMwVCS2haHXhTskiYsn4j1z28mjqMHY52rxNhpmVlZBlHL2GDqW6vIQDWxEXeU0HL
 kCMw==
X-Gm-Message-State: AFq9FYKKteR9/73NNNK7c7RAWpcU89FOXK29hzm6Uvwh97vqZpzcov2k
 YatQxiEFxCUQC4tssiAGjgb9ze0fF0I7/RWVuXuSsGB2XO5YukO82Wcbp4EUZA==
X-Gm-Gg: AYBFou35RcrMzbK2+Vo4jiXnn9IFTRsVKpcRffWHefmB8EcyXs12DyVOFrEoSEq1PgJ
 Ae8mEqWufqSd5wYbo4jZ4qEf1+TMVeFxZdrpeAped2fK5aClezn0Gu3YozcQtCCCApWpnAjUkIG
 lRCECK/ZlE6E+rj+3VqoMU5J/6aBItfYDbZXvt7i4dxiGPbEoOrSq2KS4cNwZqOiUPPAEb10hLv
 LJNXw7nfXQcWRitlQzxVFA01a5xmjmC7keOBSicECe6CySKRN9kZV6rlmAGbUGuD3D0xYeaDR5v
 z47AiBlnvZYILUlIi+aToYSgO4o1piIq2m3ORdYuFbEL2hMGe8t7jN1VMk1l2ziWnC2XfsMx67b
 ygSuDrJnRGqe1rmuZwrl2pfee8Nf0Sk1Yn62H5YZpBsIHECYPi25SqXTVj/J7IvkrSqP9GPGmn+
 UZVPihfYMxjRzdBDceQYe8Xd6g368RJk75Tcfwx3YhwBExrfeS+WcberRsOcp6xZGXkjaZG06V7
 KqucrKO91aLp4a/L8rcrFHSl/hWaUSH5jFbRg4H6dVBtVu9/zT4Wa4uI+U2dc24aWTTTaurSdnZ
 MKOefhjRmnNLUZfqPQYEhNabioK94VnJhrbxFpXqEU3JSuJvpYYKEikr0NLeGIHeT3M2yBpbWIB
 6u7sGjjG85cIufcmiLIZ3fGG9kiLjyDG9VOiPjPYM2eQ=
X-Received: by 2002:a05:6808:1909:b0:4f3:68d6:f131 with SMTP id
 5614622812f47-50c42173103mr24434520b6e.2.1792101161689; 
 Thu, 15 Oct 2026 14:52:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:52 -0600
Message-ID: <20261015215210.3426895-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-zope-interface: bump to version
 8.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 73a4c7992e..b8bf10518d 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  f430c7c2cd576867a9908a5ae13328d0  zope_interface-8.6.tar.gz
-sha256  b40ef9b4873afb5d0dec02b8d2dfde1cf18c72337b60c99cb735961e0bac05c0  zope_interface-8.6.tar.gz
+md5  d73d384affc6ca657c14abe048d8aee1  zope_interface-8.7.tar.gz
+sha256  0b47b62e8d0d99b24bcdd32f4f2120425e5019c3bee2ad69a0e1d75737487a96  zope_interface-8.7.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 59255ec906..2934485640 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 8.6
+PYTHON_ZOPE_INTERFACE_VERSION = 8.7
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/26/39/a8481b926e42c44a6fcc670904f8251469ec42edbff1ba066719ca1e7fb4
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/de/ff/a1f0021a26033da0df223fd05a7455d6d2881b67daf2c6dc897b4fe0a427
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
