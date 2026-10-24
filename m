Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6199606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jS+7v1HY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M9H+g+AH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB224082B;
	Sat, 24 Oct 2026 18:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_pMl9vZlHvA; Sat, 24 Oct 2026 18:29:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4101840913
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866575;
	b=o8Zt8y8Q4pMfru8I/TRgxyaMQZwXGPppo96RB5U+RQIRvWSksiqQ9vzdDA7PI6l+GLtg
	 NrajM/7ptQCcsNCqpvwgjq675xE9/lnNl7xAXIOnoQaX8CY1iKqjNCEg3nOkcMN2XJ5U2
	 ulAc5te4bKUVDzueAkym5/NBwlBvzSbNAQzA5r6oIZqmrkZpMDW5uiUQTfaaNY+KI8KSN
	 WPi5gf8W0oQDkOmv5okhu5YHJUXnBqW3TchmluBeR7KIFOn5I7MTyCVid5MfQLkvIuxXK
	 /JUXAPSwT/yfgzYHfvFy/i23WyEgw40A70AVFZsF+JKGHKCMbiw3ufZe2jOnSo6V38Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866575;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=S+290SHVl/5wQObyarmE+JtFnoFu2Rhblckn0LtG5CA=;
	b=bTbQ+3A2C33GOAnxdSPHJXWFONlSJoHrrxEOg/+zG1dVK5W/uonZ6PXrEYouErUQXWKc
	 qINln5y9yhEhJQ3taGFy7vVF/Dxf4X8mav8T6F+eFzOFOJQdqY/COLfkyI7Fdb9b/cexx
	 EaK9LSklZj75PvT+eP4cufc1p1bOtetbx/VMu7MdJKXjP3EptzizCx1m5cm1fUmdPnDZK
	 wX4QLMbMsIpHx2hoHog3c5naql3gMgDbNDyCFOYC9ccxWIBSUvIeiI7+HixtfyKgbpZdg
	 +lFrdH2KQvLPjVOffGtzf9gUAqdmEY9epBHBtOxndjZEUTrbyBc7MIi51glRW3p/tug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866575;
	bh=S+290SHVl/5wQObyarmE+JtFnoFu2Rhblckn0LtG5CA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jS+7v1HYibFXFU8xg5pA66byS96Z+X+ODAPTdWouBUaXbohg4XTUb+yO8MIYKPGgQ
	 hYDLhI/DQk9zUyW/2MXq3+mggwv6/8nAgV45av1co8BElENb1V1jtRpqZRQtvNOQuH
	 5MDCgSzL8fTMzqUAmlxm5dYXxAZW/VEdHyKevGFB/k7uDwNLP50W6zbgGVwmvj9pOu
	 +OklHaxLgBKEEnWY4+mnkWJ0McQk3hb9JU0vkCStWJFkFM22E8LR/QQ2h6/T/9h4NG
	 KNR2wy57Qf9iKV4p5vBS9ZUww1xisEboE4w6tdzqa5twJKS+eeYK/fPEHYdQ49yFya
	 z3yJv9jY8NMRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4101840913;
	Sat, 24 Oct 2026 18:29:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBB9380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C476809B3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoC1Omncfh-o for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 558C08098C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866566;
 b=Wg9Wl10K/DJrjoNiq8NpX+GoBgd1uYzB0E6yBE6iuwwjmdS+Xy2XfZk8TYu5YetRdNWa
 X3MbBFKpo/PS5i29Z7M9VSauEmhjPuJN8CTSmLPfVsMqrRh13Jz5Vfwsndpej4u14a4f4
 jEwOVY8ZHN1ISo5hevbNBBq6CJBHZRKA0ErqTFlzez65tK6Qfzb7Jo2QRp4zOs8MlPO0X
 AbPojVFfrB9/gQ2w3H/y9CHtLbSHq7IVElalxOrY1BgAmlu8E+72AJ54VIOupaNyqMro5
 hIMlP35eJWgFZGlNtmSoH+JQWjW6md9ywbXq3UeLr9O4MrkXYfgGAEwfbPiZjHBU1OQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866566;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=RFxOf2A4l4ssn73T1tPInl5kdi+IwZXsRtGkG0iK+0Y=;
 b=qUaRVGVYGKtWtY4jmb7+vbROYPFu1Kyn6nbxWy5we4uBPyT/uNUzHrT3OBlrXfCNrzWb
 wrDEE18zt9E1TjrnD+tvn9xaILNQ8NBIC1McuqbcozXJZ6X5Cn2OHLXBsMM2FNzc8tm9m
 9zqZ6OwqcFjIQ58CPnW0sqQyUZfFzvvJns/fnMYezCKZrUvooIkrYJK1HyOp6mHWtueFL
 m9qbgrg7TLXS16OQEL094Mu7rOqxdLI1oWrusJFfvvjOs5q5v0wE72KuJntCFwlCQTJFP
 nrAPKrM5I7uk/WwOp8oPn9zlqA2vuCNkx1cQZCVw9Iku5upBNUkHDtij+BU18aM3AGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=M9H+g+AH; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=M9H+g+AH
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 558C08098C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:25 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6f5a0893610so1234420eaf.1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866564; x=1793471364; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RFxOf2A4l4ssn73T1tPInl5kdi+IwZXsRtGkG0iK+0Y=;
 b=M9H+g+AHVbZa4kJP4orDvgzLwYLV74Bi4lcwqx1EtRndciuR3BwBw3UXa8ZhRoiqNt
 xWZNDOnRLG4hOySrhnyzEGlRSUZatlxcX3/1vKV8NoawrSnL3jK2q0wmHRXj9dxznlQB
 GT2N5dxvz62QREt24Cxh8BMpwfGA4fvzHe7MWdlpvL3wiFFefciTSGonW5YScQK8zFcv
 FXwPMhaCGIOiV8vzLtGzdalRpTBRFPWvYmnX0cMPim6bWkfsnu6ktYby3xHG8WzHP+Cl
 B9aZF1hld44PDUR5Yf6azjbcuU0qkEPdSmhvKimFk3jn4gSIS8ARgen8OisNfQ2/ho5U
 TPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866564; x=1793471364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RFxOf2A4l4ssn73T1tPInl5kdi+IwZXsRtGkG0iK+0Y=;
 b=zj1zRNG9DvqCtZGMeTYlEftrRxyYr4+VcdPu8FqL6A/z1CX0HRdOduOCXEKmfkx0mt
 DO1RzWUlo5QyQSUX3jpy9i1ZsNFJiwMpah+DkALzbstZ54h0E4pVPDROQWkijpwyrsAt
 JTqR/pN19qSN3EDHIfAGJj3oEq1mnnlJUw/TtQk8zVcdmYiG7ULXa/vN/HIHbPzL9I69
 eq9v9ceWGF6hsJ0JrUFDAfrvDRV/bnhMRg5JHV4O4XRWsg4QcNtZpfpzvprjXz/3HDc5
 k5JBexODEsIhwOhOKRPZ9/IjmFBDlXpdkgiQCcsAlrgjeW0GaqXejDaw+OPkzBhBQBm/
 7uCA==
X-Gm-Message-State: AFq9FYKUn0pRm9vklUY3TbUh0coQUqWM85XnXdWqrqr9xIUOEYDGUNw6
 C9g2H7YwMgJm5vyeBglWGHuJpps/ICLlcFp/UMptM+59gilYOmuGeI4OPg3tHTn1
X-Gm-Gg: AYBFou2BmRuQm4r6hJ6ZzvoGkzxiYEIfiCWrQyURzWgPnbLGZ0W6tx3EqhEhs0vgNgA
 /op1gZwEy0k2VXqvrjA9gW4s2MeRSxx25JB3PMF/F6aSbEkbMyRZXlJqxtTAzjU8Uk9+1XjxMuZ
 AzNIn232Dh01lCcDRazVhE0G3WOI7VsnnAhh0rTo8O68b0KnGbW/2BxqRWPZWLtGSRd9ncqNdIZ
 6Ae99s/qGJTZpdaIfpx9NzJH11S2aXt0fk/fwpaeY+UaEEnfEc0HHm2PIUjYx8ptcFfCfl66h3M
 /RGs959jgFx97ewosuKr1KwkKwUvo4eTSTqFp57BWDDgU8VycbyMiP5JKChlf8G9gCp8MVBLpUq
 XcIJ+Ibr0xud2fCvAigWIuqoJUAjJr3dS9e0kEwZbQl27kbVxc7VgFkwKl3A3CHCABlcb6cfK3z
 DeCVhxMuHpJ9SCLdFLyGDmwthYn7xna+k4Zy68t5TywzvTCNl3hP/ZccXeThqJ8NfIBtMgOqU9T
 x37WtQhZUwjlDcQs/uroFg1WT7+nZLExXO1dhi5rkWEU9QKzO1qlvReXr88VX5VH0bb8IN9Botx
 CVJ6O6WrQ16kfZUt3/nZc84dub/7aLaa3E5EPs6Z8CXC+uH4GKgeyth9eQ9o+WQjd4j95gzxrLX
 UIa+uugP6BC2HKD+sVnNjK+GnSJJYtZWwpLw3XWtmBi2jhrbMU9RmKEfyyDwK/pt8hpqjtYkw1v
 HbmKMPM3zIMxeDRgcM75N7ugyVMYWyemi4cHKQKaqNShoS6Q==
X-Received: by 2002:a05:6820:814:b0:70a:992e:f3d1 with SMTP id
 006d021491bc7-70ba0e635e0mr1216716eaf.20.1792866564451; 
 Sat, 24 Oct 2026 11:29:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:29:01 -0600
Message-ID: <20261024182913.1957467-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-types-python-dateutil: bump to
 version 2.9.0.20261021
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
 .../python-types-python-dateutil.hash                         | 4 ++--
 .../python-types-python-dateutil.mk                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 99eff042b3..dfe2101fab 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  e6fb2bbea5ab3d9c1756cef961e2806c  types_python_dateutil-2.9.0.20260807.tar.gz
-sha256  e0b8a90d464c8684c66b7b8e4556d9074afdddcc56ca45323f0987134f9e7034  types_python_dateutil-2.9.0.20260807.tar.gz
+md5  4f25106ead8ee6917e5015036cfd170a  types_python_dateutil-2.9.0.20261021.tar.gz
+sha256  62d66fcdd293e38745eae644e5da4cb399b98799c0ae61f03a54896fb51b3140  types_python_dateutil-2.9.0.20261021.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index f5b44c836f..dfa8661a5b 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260807
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261021
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/c8/4e/b3fa538f9cb38dfece0d6ccf6d3d0d925bdedb144fb9c8129dfc007cd003
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/65/66/4783d826afabb22f29f47b22514298efaedee4718eac0a76c37bea381a07
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
