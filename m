Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251A4606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j76cxXNX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLaDRvyi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F317F60640;
	Mon, 23 Nov 2026 18:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQDQB_iBP5XG; Mon, 23 Nov 2026 18:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0DFFB60608
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795458933;
	b=TjXBvZwMadBnzNJ+G/aFTKPKGc9m9O9WVy+9CCc546955xzT7AU9DpOFe04RiTyISxY0
	 yNT5JBtucxMKir2jO/XZl7ukNPxzK5Fv1hFXrLfIbkeghbjQVrropLBPkbGe1w6diSfoY
	 dAzCXIekxbgVCVQlJHowTepVd1O9yQQLeH5TJMa2gYEMQEoliblZu+3JjmjmNtQuiD7q8
	 eFRb5Q11LsIFlqeSMNCrqgzhCMlcSgTeRDQp1ktvQ1LpwKplCTjrbwKw5olkZS85dnFaK
	 d+tzJkdpJWZ8h6NgnRc4aUYjm4TocaQ2lizWpgDFTJipqYEkBHwOQwz4oPu2ceDA/YA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795458933;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=kOndV0wLSVNye6Y9XHcRnFn/zl+OOl2Jf2+L3uTnm7s=;
	b=GTymb1qV5mlWM86zAj7gPkvgdoQE26UmsWRsYV27nb8ZbdNKVWOhA37U9tYALqW2SLKS
	 5L1piKtjn2169N0i4e4b7VUYxt6Z+yhVnNIsjyI+z0ytsO35ykdBqtdoGxLNXEAXofx6C
	 pBXB3EN0GPZX+AnjgHHaSEBs8ZiwD7SpQ1Bt0xQTXA9yMqrge7F39yY94plZ5vRKy3o3O
	 g7iuO5y2tKG+OxhjqPuHm0e7OF6kpUJ6XnlxxPJEWbp9eCzBIRjUD9eB0fGQeANaIPYnB
	 W2obdm4Yct3PN5Rek0mh58emPIi4/DZBFWWHNqbix3hJAK46PFyMqLd6idsDAUuHJZQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795458933;
	bh=kOndV0wLSVNye6Y9XHcRnFn/zl+OOl2Jf2+L3uTnm7s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j76cxXNXqy9fe9lB8IWnPGCmXTcFzLBrHs6aCJVmr/Sr2zDhiB+4jRLG1MlKyODd2
	 2aCeB/4sz3LRYsU6B+LB3q8JKHeEv4QA05Jnwn15sAYBHOFnb8Geygq7ux+G+/0xDT
	 GHHF77iIW+6zUDnD5qTcxDC7XGL70Zgmt+VDjs+0eB7Zk5tob+OMiOLRskg6AnQngq
	 ZXGvMtFiDsle2oDcfRyPpyswCYq6C9v73tvWtwOMlf4FuFMEs/bZWRnE6EyYVrYOEg
	 TIlt2Up8qdSUyJLXSjCmXraPKBvKab+iJo/PZZS7I/jnqmWBkUPunESi3TeI2MKgYu
	 uy4o0gWYyLduw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DFFB60608;
	Mon, 23 Nov 2026 18:35:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76087311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C6B44009B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3EYxH8WAzj6 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 18:35:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7AD8440093
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::132a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132a; helo=mail-dy1-x132a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=lLaDRvyi
Received: from mail-dy1-x132a.google.com (mail-dy1-x132a.google.com
 [IPv6:2607:f8b0:4864:20::132a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AD8440093
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:35:30 +0000 (UTC)
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-386bd881d39so367859eec.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795458929; x=1796063729; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GcnA4YlGciuPY6oazEG8kPjrfsNJVLTKB9siuyEaVRI=;
 b=lLaDRvyiSmul0yPSnyaBkoSbSkdz0iWhWGMmwS9qz9o5h7iSwqxbf4ea+9SAY6CD/o
 pa0k2TCwn/ktAbJrT/qRh3//FHGx0ya1TTITRHwtQFO7q/qpKBjgUDrFNPYLLnSTvURP
 YzzdT4XZqn2aJ1sMQV+vBwldX8K0evd0kQ8w0CMgrSEyjtk69OaYZ6rxVNV2maoMoLjR
 lZzjmje5FW2Y8snHFay4FVgsBJRZpPSChRva7jTCJR6OQU7F5mch0Y9x964Qi0Ab4rxE
 2HNHwF2GDL0ZZpokJik/LEv4Dr2rHy4208fPGR0LmguKXIYgLbFGeLb3FeCKA+ZQCN4T
 GmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795458929; x=1796063729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GcnA4YlGciuPY6oazEG8kPjrfsNJVLTKB9siuyEaVRI=;
 b=z6n72Pv+2DEONYbO/7iI7Hf0LO0bkrKdw8uRIQAtDnuCvw1J3Ok7r7KJO2oyyKdBXu
 LTXLeX+tUksl6VLiaB+UkNLg/N/ecGA2o2SKiCPGfAoQb1rgJGVgg8nrDDppYypFb8Kq
 Id1cr5puEfx+bQXwaOuc4XoLYQavylUsSA39wfthS5hb2wAZHvxFK+J/yTrPkrW471Cc
 2dfikSx7+ZeXhJbEBhhJPkClv6hRlgbOzCqRpX0U+zM7b9AtOy2jdrTorcn77YiCe3TR
 XycVIAoREBeYaPkBKUB5JfOa3KWSN2UF2b+YojTPKTyyKytBY5Fk2x4DI1o6HbmDOMmO
 BGDA==
X-Gm-Message-State: APuU4Z++CW4zj4C26LlqNhXXYaJL6Y9dm5HUCq+FkJpeYTrUinEPOrz2
 1LMoHImhwuXue2eToSq8rGF5msjFFjfTDZ0nGLWwlIjuKNQ6WiCu8MckVooQug==
X-Gm-Gg: AZFdTZd9EYZVJohhy7QlvpE+eTpfd5gpX4SEgPSxQwtaih9SE6heIPWsmY8as39ZmPD
 gqjIdEQmO4NOhSXbzFq6LALcYSYE6S4xpkUfRBGpIiEeXEOjz13PpUHhaSxYss+ZsWuFRtqdQrJ
 NWqjhEfd8FhjoT2ENcARIh0XpglBgmeA09ZNKpEhkvogE4hrXcTWG5RuVAlWNcMrLHeviaYlHc0
 pRFNzM3SkBOPNqUcSzZFQkuxI+M4QmvPDN+1ygULlXmNlZuXG4hOblKdglaLHzivKxfMPn5ETco
 WoZ5IVg3nKEqHpYaJ4wChZpiA2f/CIhJLCQV3b3adBmYw6JB//aE3/QxGHvqoiGMXZExIHFnCIp
 sf2mZcVIwg5/4yoLd+JJ4YBbKvCJQl7xAr7B0eEh1pR/j3zLSvrdMFZ+GXL7AF5CABq9rjzlnB8
 PGf/8TS3nNntflyXgHyUlCUB+LCJZVtM19OejKg6/GsmzQKFzckZd91d1+1b1X68vof81I5FrfV
 qXPwkCF0vjnE3CeQkF6HfupPA00cFg/XqpHCQCl4En/E3S/o5SkZRH06f/OD6ebYkRO9J5iUlGm
 DnZjO3Totc44mfXaEVGpZvkbcdt0yvToH4ujIz7tcfxj68u4IPRFSBH3Rn32In0=
X-Received: by 2002:a05:693c:8604:b0:386:b3e6:e741 with SMTP id
 5a478bee46e88-386b3e6e883mr2629619eec.26.1795458928825; 
 Mon, 23 Nov 2026 10:35:28 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e4:104e:e2d2:fdeb:cf5:e733:e2da])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38566cd46c5sm45816930eec.11.2026.11.23.10.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 10:35:28 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue, 24 Nov 2026 00:05:22 +0530
Message-ID: <20261123183522.26379-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
References: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/unrar: bump to version 7.2.7
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream does not provide a per-release changelog for the unrarsrc
tarball itself, only for WinRAR. Latest release available at:
 - https://www.rarlab.com/rar/unrarsrc-7.2.7.tar.gz
 - https://www.rarlab.com/WhatsNew.txt

Tested with:
 - make unrar-dirclean unrar
 - utils/check-package package/unrar/*

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v1 -> v2:
  - Drop UNRAR_IGNORE_CVES += CVE-2022-30333 (version 7.2.7 is not affected by
    this CVE as it only affected <= 6.12).

 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 65dcab4464..8679c01adc 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d1afa67ef4121ebc5986815699e05db0ce8648499e5dca854f282a4c3f72c003  unrarsrc-7.2.6.tar.gz
+sha256  01d903a7dcf413cb2925696d7796e48e38d471f79bfe7ef3ad2aebf6c12dbefd  unrarsrc-7.2.7.tar.gz
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index c829a2ebbb..94c78337c7 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 7.2.6
+UNRAR_VERSION = 7.2.7
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
