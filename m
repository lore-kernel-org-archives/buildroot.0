Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E4E606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dnK03gy3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=HVDGtW/D
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE0F960A41;
	Fri, 30 Oct 2026 14:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuPVoR3UG9_q; Fri, 30 Oct 2026 14:48:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C3BED60A48
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793371692;
	b=l4Y873eQtAmRGafvDbdFWfB1rEdAOZ9dTB9IeSnWZMhcJHq4g9fu33xZvvrWIjXcJuDo
	 Xg/TF3ERuTXLwXHpzV/reWsiUGTDRu/mpNeFXjTwRoq0fc1rIynYMqZS/OJT4RJq2HcmP
	 ZKRv5z4Y4mfIdYLhMyHT5g9cmXrQe7ZvCG92YNbFCk5RlS11mNtr9RmDcTA71PPMExh0u
	 dw/RGlagUR3ilsGDoWNUa1i1ArByosUos2zqrvqSqFPzHWEM8AXzclZFXaYVI5rqd4cSo
	 AujxyAwmH8eXsffVJCmAX4dK7hE4OfcKmMzJ9d21ITDxnchzPJiS+NHSGYVWIFTtWCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793371692;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nx+F72mc4cpfnG9B5zUng7+UjhobaBC7GsiPBFugEXE=;
	b=QO8VZTPK6yrdxztT8NIadUjWzib5K/+ynxWs3k5u8HFuct/196fLdW52IrneaVvFTXQx
	 NBzWDXnrWCoKsv1wmC8qVydE/xPp1I+GLSfdTOKDCMaMFn/3KscjwnoEm+G5trGbOa0h9
	 gUteFlnC72YL0234rF+DUQGp1yfkqs0w/8qFyaqyG3QUYsJXeOmR9YNv0BScVWZDqNq9Q
	 gIQvCeeyGYpAghmxx9S/ZsnmzmccPSL/kB8AJ1i78rwce7pwVQjFvz4+OESepQcOrqIiG
	 ey07BqVxuz7XYLl+nEMX7uxf1OJw72+uFOG5viEs9iF1MA7sbQfv/PJhz7UR1QiFEZw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793371692;
	bh=nx+F72mc4cpfnG9B5zUng7+UjhobaBC7GsiPBFugEXE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dnK03gy3or7KXhUnG67dHECv6lVmx0ThLj32CYlElSkW6d8+uVyauX3Q1fjsZYxkK
	 Q6eU00X6BhySENIWBXRXb3o1i5CuddmVi9jAa26H5wXKcvW5u3AMC3aPuFQFqm/IhL
	 NtxF4sREZi8rDSYh4D6xAfI1pEkJ0MJNTh5+VS9LWTqsuf0UyUV1SJyURz3Y2a1xpc
	 mpPBaiuPP83lxUNmw78BS3rhUzQqG77TGXhvB/FvZAgiskMYrP36sqetWPuOmwZgMf
	 9x0HZdxT5n7XjQ6jmEBErIH+wyP8rTgR01mM9zIcXYNEUL0imwBNUuphZ720dG4Z1I
	 lOZHCSTFuUx2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BED60A48;
	Fri, 30 Oct 2026 14:48:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C4142AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2184140530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NK7bjG-WERM for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:48:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0451B400D5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793371690;
 b=Z4XvD7vwCzwFOYP7BlhFMYuHUDvPRO2YJQyNOeMYeBJW1kdp+UWcugD3hrpbnGCqfqEQ
 eEoz9At125Fos47qimAXclKUpQDdZ4C0L6SK0c1Rj7rJgfJmJbSYdnwmiAb/AO6QcoNBK
 FtX6j1m6Kt/dbuGC1zyDP1USS8KEJUl4VPrzhFQqETUcMkXpirPPbb0x9KKsAMaJlnt4B
 1C5MMCTAbDkQuHF49Fqi0b46/l4hlKExs38FpdzhEJMUo4NGA8f3l/WZi1+KrQGKpRBDy
 4H3RaRcbCqZBLrpUtDQVfbl2y6H4GJdaYhq1CAHrEN9b/nUPCeGDUr9eRF1F8xnKBPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793371690;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=JNC1Lp0K2b5bnrXReHwsveMGNQvUaPEFdA45ktp8LG0=;
 b=hje9+mCWyZQGjwDU2euCy4R8vUR4QZ6WpH1RTg2hFKG96LOy/zpOG/KK+ZdFYMRnBATP
 bd6jQy2ye9hm8C+xX0xD50TJouy4LrM/EXwAPoNd7YulckixiMjx0w4gyR96gLC4Z9BwH
 Ma6gd92V5HGt3FHBRyYkywkBXt/QaOZ6foOQTFAp4VqFgkY9pdv40suHvzeAAe+9k05oh
 QsyNFgAbwGLuYH19Z27om3jNyBCF10rBcuNvuuO1Uaqjwr26dQW1NiYr8i8ZttEHQsALO
 B0UzrE5uIOQnemz353UL4TV6+ds1GYu9dMq/ipBkXhvlKoT7Ja+tGbvKp544BQfcMHg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b="HVDGtW/D"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=HVDGtW/D
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0451B400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:48:09 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c4395d31228so114024666b.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793371688; x=1793976488; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JNC1Lp0K2b5bnrXReHwsveMGNQvUaPEFdA45ktp8LG0=;
 b=HVDGtW/DqfrOV/rmjm2P7Rc/Te0EXnW61bs7adOK7ZxGuyk6aHCkn30bvCcvSoS3GQ
 Xv8BUgzOAitxelCE+AwbnsOct3eXAymsiEhnGNqC3OULVf6oftLgXP53ZJUqU/qb6ANl
 C5kMub7W7Mi2IEeaMMn+jxHC0hlSb7h5QSVGK3LmDSqwyKChET/rWw5f/Ac+XyfxDpXL
 6mLoZQebDt1QdWVHf2W7JeWXqQJG+y1YVaPgs1LtSLi6HSl8Ez1k1ICYog2hFVs73aWZ
 Okc9KSg7rkuObDWb6YjTKxwwjDMQ94ztfiZvYXtpcG8V6y9lHLOGmOkiffQPHF4Yivb/
 tKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793371688; x=1793976488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JNC1Lp0K2b5bnrXReHwsveMGNQvUaPEFdA45ktp8LG0=;
 b=OwtDl4sXoj9XUK+eTq+CQWUwd5vjt7ATb/Q/agZ0WrLx5/DRZQ4Xh7G8j6Koy6mhYf
 KiGvpwjz5RuoNFsOBU+fR/dSBEGHy8MxOKBLCpcOaAnRBeDBzV3kmMooWNY76C1XpsJ+
 YucrOlVZZQ0zZVRO9bD+L7I8o5xxLTIm0UXB2/IqCjj8I5khtSHqAAopFSA6oJTeKCLa
 BHXoNw437bbMqTEsDDFuU36/C66vyiGI63mClsVhpQdZDX3RWAyry/6MsM925keupxc4
 6AOi8JT06nZXS653NP4389h/JVW977yOelaIXSSWZRI/MrTtZCh5eO/1eA8f3/X+704T
 SFWg==
X-Gm-Message-State: AFq9FYKDDV4FQPl8qZYVv3CDZDWyEbS+9GAmMlWyq37sIHXlB00eoK48
 QVT87IbkCj5/eughDUXsIyT4Qwjxp0M6blo+lGZuAxgm54qO1KAX0Gel0k8kbg==
X-Gm-Gg: AYBFou31eK5PIW7S4ZtNodyO0dnAXPMP7rqX0/gmDGjG4pbhbOavWwVOMfNl0xSEdOQ
 IIU2KsbJnsKIA73unCTK9K5WlKYPrlzACL6gQFNbh5IP3WVy7EJFu4sYNzEweVDwVhtSczfCOzL
 +b6WlsdLUeiKksBMnIUkPdg/NldH55MtGt5gGtcgQ/vjb3v55e2akgVMIYxx/sA1d6LeheRLnLU
 iqOdMo1UUn16QJfyvYvMf8/lZD9ALSwvC7pN1eZH2387fkBjOAPvaT01WbD+wmrcoOFXtviyUjB
 I5106EBTURHF6CJgJnZbiJ6t68d2O19LtOuTWiET6ygpTG6igKpQQdjaZa0On2K+qet/02C7R+8
 zRdlLETHOIC8fbaPP8gFou3uAdjhqYnO3R9Ny4RWHZqYronhoDROWEupvNLLiaE5grAZTNgCUMV
 2GtRIik6gOdKTfC+obekyBmZmfjVVnyml0CX2iOk3Lw7r2jFFMhfuRHjV8sJ8HuqzwGJjX+Md+1
 Tm0DsRmqJ2Nsaa/BeHjv0y2Vc2t+dIWHM82Leb81w3zao5rz2EbGmXb1aT+4YzO1KPsiY5C4k50
 NKdw/OLPrSy/auknaPytGxycqP0AvXzM0uWvEIOoz0uaJGpY4hkvV+c64ag/iXuD57m9pQTntRG
 /jm4+MukU
X-Received: by 2002:a17:907:3e83:b0:c40:560a:462 with SMTP id
 a640c23a62f3a-c4ca7a848bamr234337866b.32.1793371687596; 
 Fri, 30 Oct 2026 07:48:07 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cabe101d4sm72581066b.40.2026.10.30.07.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 07:48:07 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 15:48:06 +0100
Message-Id: <20261030144806.2040536-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030144806.2040536-1-yegorslists@googlemail.com>
References: <20261030144806.2040536-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/mxml: bump to version 4.0.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mini-XML 4.0 is not source or binary compatible with 3.x and installs
as libmxml4 (header in include/libmxml4/, mxml4.pc) so that both
versions can be installed side by side. Both reverse dependencies
support it: lua-lsdbus since 0.9.0 and zynaddsubfx with the backport
from the previous commit.

Update hash of NOTICE (update in year).

https://github.com/michaelrsweet/mxml/releases/tag/v4.0.0
https://github.com/michaelrsweet/mxml/releases/tag/v4.0.6

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/mxml/mxml.hash | 4 ++--
 package/mxml/mxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 412977dff0..8656e2a1f8 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0c663ed1fe393b5619f80101798202eea43534abd7c8aff389022fd8c1dacc32  mxml-3.3.1.tar.gz
+sha256  ec1af6f7a752f63649ad00cf7355cf36366ccf729658a1a4696270de8bd74854  mxml-4.0.6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
-sha256  7dedb0043b0bbed7880bcc9724b3a3dae4d5ab2dce98a7904703109572b626e3  NOTICE
+sha256  0790d949eb83f12c5c6e3ad945c868b1134546db82beeb44b1821674cf2928d9  NOTICE
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index d224cf5308..60fb1d479f 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXML_VERSION = 3.3.1
+MXML_VERSION = 4.0.6
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
