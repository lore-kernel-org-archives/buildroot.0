Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81F606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m7tTuW/3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FrNRVkR9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 289B981449;
	Fri,  6 Nov 2026 19:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNWBBEWfGJ-D; Fri,  6 Nov 2026 19:16:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 588138132A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992611;
	b=Ftbn7GkWSovYHNQI0DaNGsqm+4t2SsV7IVqHS926KwEu+Eq2IF29fn17l1Pm/r8OiCH1
	 YTidrHb501e3szb/I0kDpAI0IUm7I5ceOcVMTIajoJuDboQQ+BHat+32Xu2d0gHNsxs6u
	 LsA/I3GDZVemideHD+V9OPieB04w4pVnCzAFwV6xEj+B/hUpdUea75tRk7L33QfcKTxxm
	 YAAImv7lPZTX3jla6m2peD9ydHBc3EUVjN3ZDjHCDq4YdxWvO55BJwQMmxsFBuzhmtBsF
	 QUQzHzS9MK9ryfOs1/h7TcFGFVxF2AK+oHarP1YO6zipsRl9eHXW6MxpWVhMVN9WCzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992611;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MrZ56121WafF14+qzoRFmIps07wWUJSoHoccjYleNr8=;
	b=YLGBxiyGBclaxOF+lox1EcIkYhOW8lMhodeioC5iYbVQ/BSS35HBOLf3cNTvD6r7Fu/T
	 4K8NIiakLCrRkua9QvblTzhXt7mcl+/AejL8VRBtfuNre8FnyDipAnYsoDdr6GPtJrDMj
	 8OgpDJ0kos+wmYwwkNRU9U5RiW33LWpYy/P5wZs+LRybyadMtZb9eR+7gIHH1jiTuhB4I
	 qgWauV3eAzwfMYUkUuVgJQyGaXPDXGpzKbEK5whUbAc/LrF1Ts7RDQPrCAU/RhjPdLlwW
	 am8fMzjSH/xiDv9F1X6carMAjziBtUfbJxTI9onbAK6Vj1hxvp83k/Ftd9zxp4pHjbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992611;
	bh=MrZ56121WafF14+qzoRFmIps07wWUJSoHoccjYleNr8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=m7tTuW/3psmPp0+KJW/924XZshBLNUeR3OpLgQbdLWr4IUA/OX9V0C3+mATevHRoy
	 +XUjR5NS6qspNXvz876zH+Z13fXsxr190UpAJ+Wh8JtjlSoJsNcnb95usOM4F34YM9
	 y8yOi7mGpDPArmHz2ShzuJm6xJ/DsfzP6Mkg4csjZugVQ2ouq4Js8ltkVS8b7se7CD
	 8pyg/m7UOu3pYtnLqJO8GgYfNhm+jD2Ol4QVvXdhKVYmlzBY4sIQw2m+WbyZsOI+2W
	 8Nd4jaQxHLwfD61FSQucluq9SzlKRxYISHpYjAHiE8mCp9/p1GY6ApPo9JbDptsOii
	 I/V8IBrQBXYUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 588138132A;
	Fri,  6 Nov 2026 19:16:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17DA67AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B0B403D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnKykL4peshJ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1E36F400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=FrNRVkR9
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E36F400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:42 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6aa9606ddadso623133eaf.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992602; x=1794597402; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3OwY92mgxqw/jhjqrZ8iZoo5gmYtBe5Ysue2P82i33I=;
 b=FrNRVkR9e+COFKtM0d3gwfoqUu5F0s/5iSgGS+wuRarvBmsTnyTcLlFSLCFNL85R2u
 zqc5sfltzVTiPhEdxYWnjiCp5O1+gkhVRBfA4Vyp+dErvJQIQx/tGJkrWA3NdhOfBo1D
 gUgDtnNmk6ujwN/91Z0bwglNDaheU+m2youVtdRIdS9Tg/IDajAVFhZ8gVaWpB+tQYY1
 dgTjssSxzRWNrBRFxnSOwOiNP10zbn4UJEwOCzvdtGZypavUG1UNV+9jyMxM0rn6Elsp
 QgEzYhcWyEQ4JeFV5t2uGxGgvcQYp0piSvle1yTocZdbW5CwktIfebFJQYRHVqzBEW5P
 SU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992602; x=1794597402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3OwY92mgxqw/jhjqrZ8iZoo5gmYtBe5Ysue2P82i33I=;
 b=BHIMbtONAjGZXqG3do3l2W7WkcDYVo2h5T6pHPY/yegqP8x8AXRISWu5yK/6Fblv/l
 WOjNKQqtjahBznxFaG2IyvL+Djq02zhJUelxTk9SsSD9Mu9fFQjZMe3q/2CB/PN0j4MW
 2yGlnbICrAbAAYH9llGs2p//emL4L8HgujqphtCK4H1wmSwJx0giwdN1uiEA4+R2GEE5
 be+yS8GUJkzndK4pAj82llSSvOJOVybYFJ4Y2sXpPKGdt8gxCjVnCG+xZ/HtW+mxT9cF
 WGUmjPekNxF7ydfBi6Ajdn4Z1jRZjahwQqyAbMKBnYhNXm6LiL6Nan9TQTBnfSt4J7AG
 84UQ==
X-Gm-Message-State: APuU4Z9PZ+d4r2WflpJzaxX89hgJtyKvA8WWf64aEgLgorj7gqOFTr+g
 vq2+19gTwNPiC8xnc+X0xA0zsDV2wkWT7mhALPJBF3WGQ88UAga0APOex2jgAygp
X-Gm-Gg: AYBFou1f+nO/Jcirq28bcjnUUbUqvPkzwNWjaVmcS+IU4KfDcBQqZW2rbEgy0rTGevp
 3m6uWduJsqdrmb7v+KFAWgl7FlKNnRLrrU+PogRHKRdKYYGI+efSuc4w9odc7cSs7znFk3Srsm8
 Bb4PIEf1KywDE/3hGrZzICvejxeaLdoHhL6VkYvnfoPUshkaOZpXNgdlKr9h4fV0rtb65NftV3p
 VGRj4LtLJO/PhpuNgjkjJYBYe1o+3MLqZBGAbMSTRQaU5GYi6OXwjBBuBLlanqe58RSdDumsYCZ
 VAwudKlB58F3vfQtoHNkbcR4LaYdsYXnipUXLjbgXXGQ8iiN8Kpy2+22knq4K2vsJKpF5IucPmo
 HyVTgA+cvGOd8Fyx/PiBsSyYTyRLWZ3FFlDaxVV5LDuiDIg1g7534l8HLQLrVyZSt0hOjXA5MYp
 OIIulMd3NWLlNFtBuxdX5DNy4sZUqUKJyQvOANlzcBbeAvsPAAo2BWjrrwWe/4+RbLpsbhz0vBC
 jn5SSpWl6IAWANjgcaRvWKyaIBimI0GkSOD6qBagGvCnkoDWfjJrdUPCKyMapLvnBbu7veLwQ5n
 gq7ewCuFou1OTh5f+uvSou1rPw36bMaf0gUcTnD7RYizwvMxBejCIqU3I35LInbaczOrKAMe6rr
 7cs8rLZ4yVoyciRK+tIi9flML+anXQOqZ3/FeSAN/rh2Ss3835XXVUVq3p5BiorfOxKuYP/acWc
 0twVjf8bTG1lFhhwT3BfW/1/SO5q0XC7uRlh5oyIxjnmlPVAPDH3GR8ZCsZUHXgGIUkN6R22XB4
 A==
X-Received: by 2002:a05:6820:708f:20b0:70a:4053:52d0 with SMTP id
 006d021491bc7-716e7750a5dmr1742447eaf.12.1793992601949; 
 Fri, 06 Nov 2026 11:16:41 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:15:01 -0700
Message-ID: <20261106191536.2120153-35-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-wtforms: bump to version 3.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>
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
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 48be774f62..19ed245314 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  8251238be8923c56314d24d133546aba  wtforms-3.3.1.tar.gz
-sha256  9d10ccb5740290c9ae6673522d87bcae3b669cf0cb4e4584aee229b4694af10c  wtforms-3.3.1.tar.gz
+md5  a6f11f4e6b9c1d3c158a6ed8c758ad3f  wtforms-3.3.2.tar.gz
+sha256  49bb51d10b7832d497e758736da4d56f7d129a015db24756f36f28992f175404  wtforms-3.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 93b37acd76..0bc84866f0 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.3.1
+PYTHON_WTFORMS_VERSION = 3.3.2
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/ef/5b/588dc20774f4cebeac23908a87e493f2f6fb2a4c54756675cd59afb8cc72
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/52/3f/742cb21320840bcd80bf9de3d0486126f364664fff12b805086371b1fd1a
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
