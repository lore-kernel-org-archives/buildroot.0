Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1AE606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fikOfsAj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SjXREc36
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCBF940917;
	Sat, 24 Oct 2026 18:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id If35zupDj57m; Sat, 24 Oct 2026 18:29:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C71254095A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866573;
	b=bxAEWSxaTjIMhmZFLCweEBu16iW92HO6TrP/YauYghu5ITggN3ZnJgneCKp/8F1AP0l5
	 Hc13e4y5POaeZqjnIuCJQoOyV+sMq2LHQPjsjnVBFHxNeIkIX0rlPZrLvi/I1ZjFECkBW
	 mmkvz9XWfmgYmrUJK8QBKn0pmpW0sCWoelwOHEjNpss3dS4IUwI91wqQgJI/r/BYp91vF
	 2yURzmBeug+pB5neQhUgnEu4FRPaAB0ZoGhDmQSsZmpjBdcCnh71m0vJQHLcz8tBVRnmy
	 LkGbumfyCQhwLu82MfiOKShTIQhenZ/L4Wk2n+G0H44xLF5o+xtWMk0vAE6tKoegnIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866573;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8WYcMQvQJcXZFMRg3wVcYvwcWp08fKVRr9ESBLpR7M4=;
	b=UXkyaLJSo6QpC7Ss45/7z/SDcs+4Oin4Yo72ODgeHgMoahZTOjb1ppGrYJlKDOok7XY1
	 uPLqFzEnJaZqxhk/67ufvr0no6YN/1/kku+PK+Gsr9Wr1mq0dxwQKL18gEW6ErGt8hK7F
	 ssIREazsbZhNC8WskzuNVrEzLEWFqdaTVqG8KUtU8u4Auab7g0YhQx2yKkFgGVwxG3d5Y
	 3gSrplUB4Sh2HPg/csgTPajeOzDKShQO+uFpgfehI8oFAR8IkhEZGpcG2f0HEGQk/hNIJ
	 y0jZg9CZVd/BpWvbXLdY+HOJNgRKiDAHkpRh2K7/fyVCKXD804Q/zVQa7h//kpe3f+w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866572;
	bh=8WYcMQvQJcXZFMRg3wVcYvwcWp08fKVRr9ESBLpR7M4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fikOfsAjKP+lvD1H5lwuVV2I96qKGsF+xDDrGADNz4WSyLcitBvoSNyu/UqGtSylt
	 cl+IRHHwMdDu95X4XsYy2yBHLgo8eVOgiGlbj/Z7ZUNeGxsLwGDR7wO+dbLraB+hSf
	 LxFKk12iya9GxBZnEtmPbVYRejBDm1ZaeaaOLJyrphnPGm2sWhJhi/4QhfMaPNIGXv
	 0GfsaWRTCuesORm91M+t7O3zGCBaIG4+Ud4/KDgnLFWNNQSZn2xt62SWWJZm0jeyNg
	 GSIoGdneD8iBxDaj0dCMX7qYkN5cnxPwWk/3ayBgxikICDhWpFXjZG0nhOq1n5bDO5
	 rlQ7odx24irIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71254095A;
	Sat, 24 Oct 2026 18:29:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D981F380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF98660635
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYMUopA4k3XA for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DC2E16062D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866568;
 b=qwC7VPkq8/5IDorjo0618BzaZaWtx2cjQ9o9Ow/5lLAMENUo0+TZYwNcPBSuUAvdmfRW
 9lUMh95oGFtntZlLtfTTt7DvhLds1pBCK0myXoZXacQJBENCjJlbfKCW+4sLb5UVgEn9E
 ErP8A/rZnJ7/AfEkVlDIV6i1a6Trkf1AHSKUZS4m82NLedTjr0l9YE0/d0ommEBng8Ii0
 iRY5+H21uqU1Hg3dfnBc1ZwIiXQAVx1H0MEu2ZfO1QzvtENoaheVAVlpEY0N9BtOi7EAj
 WTb0ByRoDWRJjJPgeAkcntEHnCR2O/Te//NcWl+ZxNLiN//37hjGTkhbEWfm8PjsJQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866568;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yufCAPbCTETf4yb89jHA/Kr1M8bt8dw5csp4esKtGdk=;
 b=Pr9AvtVua/zQsf09io34TquJzAGvZRUqi/eIqsdLqUbYTfbMkFshRqB8DiEWqL5n1Jqb
 KJtftWm2IFK/zugiBvoFFQacuHusUfQ8G9no5FWJYRRMj5HT/oZ2M50kat+gvuPnAoPP5
 26XUCGJ/Wb2Co7v1s+neJw2MQXfvB9gpAOA1tZ95LH5UtVKwgACTk0iasUNO0tEzgolb8
 OLPLNzr9M9VSgrEaUm23oD2fWihG+a28mBfSe+hxsLvm3GHXLF9W0VMcF+TbaSAsNOLLS
 nyLh1+M3osv9ZPef68iXu2hs8a34/4FXsS6Skmro6D1SqckCFZ0KmRR1Y+n1dGHxCkg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SjXREc36; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SjXREc36
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC2E16062D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:27 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-843ea301d60so1367295a34.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866566; x=1793471366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yufCAPbCTETf4yb89jHA/Kr1M8bt8dw5csp4esKtGdk=;
 b=SjXREc36HRu+M2dwPc0O04UYMiLkJBgOwkXQN+tyunczIY9Et75+JfwG3tXrd2QaSq
 zSDgv7gLtQjwoj1FLNknQXPAsyzUb85eNdhZyzUOd1ohbXB1zN6oM/zFm6jPhdfGH8Lj
 7WAFRQ6j0mKmedu7UfCSQRkTeoKqawri0Tj+9nR28hVwF+YuAcMeoGRvteMGJgv7KGhg
 Sovjr/7xQMBjIn6+SUtKbSiQ6JDlTuhLi+5SFKQbSSIYGCxqs58zYQBrY3wR1QdpTmMw
 saP9yypXdvCuXyX/8HhY5txVjB7BBN6c8OlqhQci3urdHgEbo0Y9ueoAQD0FFcGsOaOL
 rp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866566; x=1793471366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yufCAPbCTETf4yb89jHA/Kr1M8bt8dw5csp4esKtGdk=;
 b=JBdGbxUzw1Rs+vfC/Rg+wRXenwoCp1ZxGtuHRbT7/E7/7Y4N92Zf3F41Wkbnys4pDr
 Rv+JmOjETrC0i3vUGRV3ZDq9vQiixY3eVdiNRTwVw+Pw6ZUUySnbZbg+fnjoi8CytH5y
 CH7IM1r/Gf9SRXYo3Y146eIIIWHp/2hr2ittCUelqHA3jaXePNttCkQx/wbAVnxEKTMe
 4zK0x4eqhl6SXZwGKfU3UABiphcJNP8hGwP19JJUAV1l4ba573MEicjnv53P7EGH6/Pl
 ZHO+3G0lFbJNDt4SJEDwNG/iDnniNxI2LVlGv75sti/gpOGBpoExFLBjwzBnvgsO0Mw5
 u+zQ==
X-Gm-Message-State: AFq9FYJyTtnWEpbTzifAtbYSDbnDoG+1VeymMatN4ulGSas7hJumYTt8
 Z3O3fa8Z3k02MAGMG+xxQ6dzAS+6S1ERp5774Nt2hVLG6az7lxH4vp7XXi9wOmka
X-Gm-Gg: AYBFou2dqIX8jNtbD6yxE3t/wuNs4x4iga1Jzyg7LpDO7lrKza13Fpe/bK+uOHL+PX7
 qRHsRsRc8OZcVqgdXfQwGl0DXX16UvQ0E6L7WS+7kKUFUWYHLS3NIB+3rxbe88ifpSSaYttXoJI
 JCloidG5W6OoeEdRXGDhIbLkSiMmvHtjBk1oA3qvSIUW74fUPzRRtTq9LYTO9VTRjvfrZiZ1LqJ
 fwgxAm4OTbe7yfGCYqXz5//QsdkoGZ7RGwAIcIQaqBZZJxeheaY4NE0f4sfv+RQ6gwmJXchU5Lf
 fkuMEXdhxpe7Tve6/c4f826evIxTh0ImgDCzAeY+tJ188ii0FNVtg1CyY/8KklDBtXlUGFzuXz5
 LY7dUQBXpQnWea0TrRbWw49aMkwQnj2t7Md6P5G960+ljLJjPhrTaU3QHFQsX4BL1Bi2HQ8Cus0
 PBNhVe/ECqqNrkS+IzO4pSfN/Wyo+zs7IbWCyGjh0GwZnFEw/TP3ofi8Jdpb+7SmEnJKhpRydjc
 xlYcFTKx+uPW4gJ+01ZlvgYinNbDPTnGqCYy34WEOtaUh8i3fMQb/JgyDi170QJxUv4+TeMGlUq
 5Gl5HOuIiLmkC/V2Vj+zss7IMLsBSGibHd4ee8+i0LddSYwUOiWqKiUPB5gBQ8Lg9+pK1Q8TuEB
 AN/jfKujAUKCnaRtZqzswrHsldRWfT0sLvyLCm9E1q8pWqkTGdGX4wHhMw+5t8u6FYDpubUjMRC
 x9qR5ph15TlakFyo0ub56KOcy3aSGw351vh7rWMyzeiE0S0w==
X-Received: by 2002:a05:6820:1391:b0:6e4:fdc6:6bb4 with SMTP id
 006d021491bc7-70ba0e918f7mr1417155eaf.44.1792866566374; 
 Sat, 24 Oct 2026 11:29:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:29:02 -0600
Message-ID: <20261024182913.1957467-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-types-setuptools: bump to
 version 84.0.0.20261006
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index 6e330831fe..b16553abfb 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  9a93e89b935a6a02dbfb4a143fbe0ccd  types_setuptools-84.0.0.20260812.tar.gz
-sha256  09bedc248ebbb7a232c9419dfcdca329706e61bf2aa5743e9424d027f1d956b4  types_setuptools-84.0.0.20260812.tar.gz
+md5  c2d13d00413ef92673581c250430493c  types_setuptools-84.0.0.20261006.tar.gz
+sha256  0f123655f44390a15ec62c9fa30b57f6dafe53014524d28b62cab1edbc303059  types_setuptools-84.0.0.20261006.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index d0cfdba1bc..0ca0056c54 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 84.0.0.20260812
+PYTHON_TYPES_SETUPTOOLS_VERSION = 84.0.0.20261006
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4f/cd/3b2a3362a526f91c33f785a291462b2ec448ae531101c62372fc30a21f53
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/36/012e992d81f3c3575e6428d53c2bbe266858cf1b7df7335476ab99f17908
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
