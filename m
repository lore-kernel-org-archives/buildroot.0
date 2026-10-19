Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C58606A322
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bWVruiOs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s/pcH0nf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2289C6075A;
	Mon, 19 Oct 2026 17:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4nHvuhQAtpR; Mon, 19 Oct 2026 17:19:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4837960728
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430360;
	b=jwUFnjhXCCaFXw3/yPEBCQiVh4TvLBexno6s50yr7wFOZVfXilIWNrB2fSg4eXqS2JQb
	 3wo8HCuBxS2my1K2834Tul4YF86jqVIahYLKekOzN+RFLCKTC2jVbVhAESGFWWk36VrQC
	 1UhpQ32sJxB4y/pRZFZOEr+o2+HAL4jVVjJg8xcjUsBjHtT0Iywp6HBDYIqjMRCsWHxAo
	 pIEKIKgIJhkSpm3xVh4/4sUJ0PUIBIKWbbjW9kAW2vL1WRaGnGROKjdVmmA2xJgFRcFU6
	 1XH98Ot84e5AY7/p5lvtURYD6osVwN87W9CVS6XVsiF6ErlCKXJhGzLKCTAXRK6RdfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430360;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2shEAGJF8SPx6T1e/dt3ThHsDDms2plR/MYLL7HAwGU=;
	b=hcpkraPbVrhdaCM6hQ+cigbyg4X/iKldLdgG+trYuy2pzKNuqfB6eZMrx1f5UElHuHg+
	 0j9yqKH9CJRJJwnks2OKeATDzgn7kPY2pe3fHt5SUiBZXdVrEEJYHt3Er/6uOoPi59cq5
	 KMoUBpXu+Yqq0tkirjNYLGJOfpKn8kY4yiGheq8Ddo9/r3iE811peWGH+/rcZuFTQkX/s
	 0Bv9Dbx35Q0sqNSy5Ht4iWdGYFtohU8V5btE02G7kKo5l81hayo5mvilWiNed0Ib3dmN9
	 PbSNiX6E0bJieaL/L46yrPkgsghdP2YD41VP5pATsNNY1fTFT6k8Rz9uUaUxH9+56xQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430360;
	bh=2shEAGJF8SPx6T1e/dt3ThHsDDms2plR/MYLL7HAwGU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bWVruiOsScyLKIWG+xesJ8Y0YNUORNf2WLA2I04uaI4J7V7NTVJ34FoB0xZ+xbilu
	 uYKrCGlBbLRUUTDFIf1rFuq4xuwRvHfUPuF54w6fRSE1uo7Be3bhys3wxqW/PKKAbS
	 ttyO+CAbqzBs4GQthXB1RAJVSY49MuAdBVx1ABqiWcIoddwMpWH/4vjnsODaMUT+T9
	 qKTOUhc53NbhjwXLcE4djgKTWfM3t9RPgI8oa3z6JcWP6mkNIt7lvS6J95Tmi/DnBh
	 wq6lS3ME2ER1ACQMN1qJYUcIf0TvVudJD7zUOk0x4sPNGAiPQVsC37ppoOIkae7yYD
	 jjYMBWJi0iOOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4837960728;
	Mon, 19 Oct 2026 17:19:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3CBC1AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51A70403B5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuw3tP9OTKuH for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7222F405D0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430348;
 b=tCA6SnYAyZLrWdO06sHS12ILi7Cqxls5yFEr2SsbgAwOy+Qruvdu+upCYmT8OM+YFCVM
 PPON8XXIjTjpxxQGzcqTa0gVCR1wEnMW8YeNjV27izH5g1u18kSYj/8pKpCIwboxbomLt
 6kNrBnu6qK/DiKRUU1hRuILXL7FtxVwQyoQJnuzwe0i4LKl284LbePgS615cAoS1LgmGA
 eAP5zF3TNcmavKvEBfFqXOeAlU/Jx6Z+tQ6/+FJM0AYwFy3sXpGY72wb63HRzXe6mvq2j
 pXGwkvTQyB+JUHIWXy2PIiBUwf17Tf5JRMlXjeLua4McDyj9WSNeWcjdiO24SSM2CBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430348;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=6VuyXy+ugLuqE2N96zr3wuMrkpwjQjWMAhMgSQ7sN8Q=;
 b=QkaWiNNNwDvygyHm2xdv3x+LZpY/JhyVfiiGkUb96+oh7fVVAWXP/c+lCZIoteyp6JuF
 C18aU81r91klcircUbQui9VBr+50y3w8VDa89TZn0gvvTK7ViyjcKyQu/4IVAX7JE5iDZ
 9gK7XUFqrMcvWRowtzJzTzTS+mmloSklUAWHoCs4myYogoSm+kKjfMc6G8apE3JQVXPSP
 40oouNsyKhudCvhjstV8vGQZrkHlCduH0Gn0KstIgquro0Q1Qew9zCAaVM+lTG0MKxaix
 UAdclZwH40xxSwIo3xA70TNIGlpZ1slNU+OXSxJHZhNlEH1T05NCy4MzmD8uH1v+rIA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="s/pcH0nf"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=s/pcH0nf
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7222F405D0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:08 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-53dbe9b8d6eso1950426b6e.1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792430347; x=1793035147; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6VuyXy+ugLuqE2N96zr3wuMrkpwjQjWMAhMgSQ7sN8Q=;
 b=s/pcH0nfQQbNUfgnVKpyZ3uylMtvoz6A1yYbWbsrYQEyKoQcpNoYzh+G1W8IKdLgK6
 LjSraPYowr4oPgk+HiYx/jc5K6hvbM1/H9cRrhVRNw7foJsJNPQFW5lwL9zRxHGoDQHD
 /Og6NklaSMtBRtKU1swERljVX+O1zBzNpp+afrmHmXbAWfgtqsbzn4LDXwjEPNRrU3Ma
 DkWSxauPxxf+UcLnXTgv9MMK9npvcvSW6y8Gd/13B3B/RZqz+9uOLdt+Hk//mPrX7C7u
 VeA2YeuVd9478Bi5JitwNMCeMSgO+LswFHSlPNUx1Ry2WmWqFLg0HK7LUK/4z96IEhCY
 2Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792430347; x=1793035147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6VuyXy+ugLuqE2N96zr3wuMrkpwjQjWMAhMgSQ7sN8Q=;
 b=FqsabSBx7JTM7tBPbKMQ1L/E8Lh2XpJy3JINi9iWQz8jpoy8SSMAQnf204jlSizVqh
 gvIP+2zvayR14kApTZXznV8gMRvcKe8VNMzUXVAg5Dx74nGbmBIKWgK3CGi+ClAwccp8
 bxASe24F7RpW5sHaYEjuHvENNHADTRNZ2CtlJ4UWrJ3oWmIRS59RWoSEpWqHjT/MJ/0U
 YTnIfFdYl0Jkf65RMoN8yx9in69QHS4taqZ7y6C4A/+cTgy/JX9V+5nEwx0Pw+k9kOzl
 62NrTj66CQ4OJq4ehkI5gb7srs0Vad1w1HPJg/3gd/ISCRAcoBGRZ70fkWHRj+T9V7Lf
 TOVw==
X-Gm-Message-State: AFq9FYInjbLcdNp5C1qVKNdfckIJBgf6NiKX+ML6ZsCLdH/t9M+7R2Z3
 hEIVAl5328UZm1uRUfuPvHqngeppTrNrzB4CP0fbOJF4w/4BoLAiSPrv9tcJDQ==
X-Gm-Gg: AYBFou36w9QrjRwXoxejZ/sdD8fWql8T8xbyGDGe1YnXgzUToSizlvMf2jIxFEdfAkV
 LWbFh7XTOLqquRoKAKa1Gf4ewB7n0pe7FX0NVOf0Mn+Tnd4Bsnn8+83fbtimLn3GteLrc0Q3Oxb
 KLFTaA0r6n/2WjtH8tcQAO79oSaCRF9FjEdG4kyHLngSj3w25K4aQgtd1njuBHHmkwgqE1+gySr
 UbuxXKRMME+X+gYjh6o2ctiKJiPQL+emcCasit+Lh8N1F93QqNGMylnkXEOOvfMLF2AeZUzH9SB
 vpjdOjXePCAW4n2HRyg+yvrN77ZZM90BpofbrxIP7eocfegHUPTHmYzp5DWfSoYNetVIKd/Mn5/
 3glwxBC6iOPDtm/eqqTF7Q8W0lpZDSAChfNZ2gZlFepHoNYKUJhBSK1sdA8+/5Lxww0uu3P1oO4
 DOdGInIMaErzG+nV1zysq9rWXsu8pfTFBkr6QvGqIDIqMdseZeBHqcjdCMFDUBVL0SEMz0NgYxr
 P7qSGI86yItxSkpH9HVixspZhdb+VH8z2f25uwCCxzJpuW9PdpcZlzrAv0fmJd8/5Dui+jyx5Pi
 XsF21wgbobk8Nse6P0u5uJbRhQiGQWO0pUxJui5ACuRMc4aKRbxmASqWAbVV3mghb9AgGOdXcCT
 vAKkEdTZd4Fzmrwq8CTkExkIv0+L/GJWYHoVWUvbCoQ==
X-Received: by 2002:a05:6808:4c04:b0:53c:4502:971d with SMTP id
 5614622812f47-53c4502e865mr4342196b6e.36.1792430346940; 
 Mon, 19 Oct 2026 10:19:06 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5397b4ac6c6sm7335142b6e.14.2026.10.19.10.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 10:19:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 11:18:46 -0600
Message-ID: <20261019171854.734871-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-mistune: bump to version 3.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mistune/python-mistune.hash | 4 ++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index 1dc3277c31..a96d43142d 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  d04c3e2670b837ddc418f3a70d4357d3  mistune-3.3.4.tar.gz
-sha256  58b5c96d6fcb61190dfe5fae498d2b2065f99cf61e9649418fd54cf1ada86dfe  mistune-3.3.4.tar.gz
+md5  e1d93cef6a725ca96d983f0022bee284  mistune-3.4.0.tar.gz
+sha256  2eaf7952af928ca8d33b779762effc1da517b62c6ad85ec8ca957e3b07b9782a  mistune-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 30868d8e47..5e72a66842 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 3.3.4
+PYTHON_MISTUNE_VERSION = 3.4.0
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/7b/92/328a294a6de83bacb95bed01f04e0eaff4e3616ee359fc821a5dfc539b02
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/96/eb/749a4e69bf7396e751ae37444abe997eff2254e695a8095b84d1c89c1181
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
