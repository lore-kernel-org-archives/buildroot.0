Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7BECA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF1AF60E9D;
	Sat,  3 Oct 2026 21:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GR8wxL9W-JjY; Sat,  3 Oct 2026 21:09:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3790360E37
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061743;
	b=JAKYr/lVCR9rqQFWh1fJKVr6MHewn883FSfyKA9bFU9CKtrnjBRyARpWmpnKzGObeKBT
	 b+Q5C2uq7ZksHI6azEmAMQc+QaGXt03AEy22RkftilnrR1fxfhUUbBK5hDFZiVI4soxHf
	 Feik0b9JxX9iqJUO3BHFul1+pyqNUm3zNx1wANdK9vXmSMwgxDHx7kKtu/eKHjzPmazfo
	 xuN5gwLjnBFmggiM+JcQ65Vhb9JP7RPThmnKseRJn2oeCjiBrjj11aXDxkaQ3d9fVnixb
	 s0Qmda8dozyc+3f4OIdFGgXY9UNXTwXQuxj9qDMQkUrDOPYm7u1yIamQpwoOK81EXhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061743;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2mK9uWtF3QAm6gE9WYtlHkdp4HWAFU/My9SZw5zSP0c=;
	b=PWkOQiioc/e+B+WJhFMtyEYv2DlBFqVFlyaLfsBGVjBJ/5VaowoZTopcWHpTDb8sMK4C
	 3cKQudFKFI5TEMPmwXvaOXJ5fl1mHicEDjdsd6QBKzjqllWPMBZSepyiQyZPmSc3RVzlD
	 k/kmLCcJ1RoGJs5h/GVyeZ8n8n/lJOw6MiEO97X6yIamliwA4Z/HL6o/rFU0rQn8q3Zut
	 YggwitleV5ApnPZavRz/nF5yDH0F8h1nc9CKtGRNq8PNbXXp+5WEr3N7gcSvynfufmWBW
	 sSm5vkDzFr9e6SpJaCHfja4xlsfJScZpKgdh87WAdy2ne+4BHd3S/fzzYbnklYqDWTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061743;
	bh=2mK9uWtF3QAm6gE9WYtlHkdp4HWAFU/My9SZw5zSP0c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sGBMJMQxa9Tt615z41zobADmpyCjWPIkxbjCLFGokJaELa1nX30ExZvhH2CeFaxl1
	 K+sW9hiIhOIGp07ZTRNflLENnQOobH0lGGeWUkY/uqV1sOKG6IlJIe/DoStpLYjBy/
	 qSFMO7gYDMbGdEgl1p7aeHEF2v+M7j+5Mw4w2dObe+rBnPmtBjphpYvxB4hd+TmFpK
	 jycxNajzpsVRSggBro8BUs8ZYZCceuzvokt+BbJ5El+r716CGrLEIfJLSDWUrJU7K+
	 xSQautO143q8RfjPPT5uW3xn7st4Vzdkq2Cv/+jnEFQYhH6hVaWdZW2gqAnVRd/Utq
	 6M21JuGv15QuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3790360E37;
	Sat,  3 Oct 2026 21:09:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7E362E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D56C8400C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a44q-nwYcuIA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F208140055
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061740;
 b=UNQBh1/aiwMsQk2JIQI+w0rXPR99vXu9FGjPwL2IulQc12MwE4FR+rfJbMAOn5MN8gm2
 NMbav2VoBS0zBXrxyhETYdq48Gfo3iFzxEJJ1oD1YkBtjzdWuEa7nQ7e9WB15CTxKRiDL
 8oyCsXkMFvPJXltslFpf7p+xrHFrZkOsLdAXLQHBjXsvUTTxDSON773cKbC3ikvmfRUjg
 15jnvMyP7+bWt5NTc3P9SNthHaMu4V6t8EoXi1P8wowqRPA4H86eN/RV48jvpm3ADsoUb
 Tix+PkKTcA/3o6cehnCaK0AjuO0/2U9fYSuXAaCfCe/0xkQTXQo1UekFLA9KkmILz7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061740;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=f+YNfykVJ4pJOc8U5FXDZ11aI/gYnOk84vTSTG1nT/I=;
 b=VoazMjywVMvPtZdfv4Nq1QUKnR0EhEqK7Pr9+TQ45q+zpchhuegiaVSDFzC8XwGt8Jdg
 XPRseIxa+duueJWhsomw3PcgHMxlUeGy6sqkIusMhkO+Kdi1qqk+PJ2LZecBbmW4ITFDu
 lyM52Ej44Q9ShGRkOUeJ2NkOkUQrXlHfRk87nAIRvTdL0WBs85lxWPdj5dCgvzJq0CyM4
 AaUUesMF1X8zF4iLtAdZ/aG64oDx9+AOjvyDG8fX8HVjLmPvuDAlsOAAIaVxdPS26RvCz
 l6aCDT9fT28/DACn08Pf0zvMMiDnXORV6oxrT3GVYZeBQ8gfQbNYcUfLbmoTQextrJw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mG8L9w96; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mG8L9w96
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F208140055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:59 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-82380ef9395so523609a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061738; x=1791666538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=f+YNfykVJ4pJOc8U5FXDZ11aI/gYnOk84vTSTG1nT/I=;
 b=mG8L9w96HJeyE81RzpX0odr+f+4tn0MZR5MSPRw1EoKG1qW3GyFB5lyxcZqjkzqefv
 GgjvB08nAyb9KJRzs0GWw/OgDcek42pA4d6DF7TgVs2O7xIq4UPzEa1+EB7zIBYRzA8e
 85U/Ge+raN1+PE2DUre2ixFreWsXsmvxW8CUDDQ2lsWVoHlgVVnqoN2jDcUM281e4XDp
 XU9xqzj0D19kZwZc0aaq0OvkgZhxYFMq0zeRfZhMwEKJHP9p9Ys5At5Hv2h7QG0xj6Tf
 /x/suW9RddkkE4XYdJ+cGXFChiaG/GZgVf9YdV7BQVt+1xWDv6TnEmMtxOIdSIcnlQen
 LEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061738; x=1791666538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f+YNfykVJ4pJOc8U5FXDZ11aI/gYnOk84vTSTG1nT/I=;
 b=rRavIxG54EgXXiwpgFxi3BoV42glZcCKkSVplDFdahvcBasue2//ygswErqxaE9shr
 E3bxiOFYpO6RbkpjHhHyuMDzqbhdArmJlL/evXx+cp6wzxw6V9VEIIXXOUNfvXKP41s3
 9zDRdL8JCBn3vaMAROnS67orOVZ6eISK+76uvMDdw0Bnk+BtFpoTXF+7NoP5u3/sUjTJ
 tIh7jt7VGm9Cb8bbxKN7qQKbCwxCFL6bM1Z1of3sBX/42nSu0SaArzu8CQbhNDywiCzT
 HKc/pN5zwqW5wcJxMuwNmId4r1lNz8Cly7JpqZWxjpCwUPqAg2580BD+0zUq3nt6x6zO
 0g7Q==
X-Gm-Message-State: AFuF++kg7k5U4BceCdDrNq/eYgw72uH42/3ZokghkCkwBXAPA92fJUf6
 +M43wiEhMxPhvlpT5EzMztBapIvy5gvqoCubiah9/dj+z5wOopBLRJ3dJ6rI0g==
X-Gm-Gg: AYBFou0oIdrgQCvZW0lJk93F6M1QFBRdQIZuaI7VmTDf0mbi5eHBxLkJCOQqk39guEA
 osUt/yeB51pCZQpz1hUChAeqOFp42UsVLY43NQXGZHxULCGaMOmu30zsOAiAfEomp9yxeLs+G+r
 pePN5epMkXyNk7QLozEGI+Da23iGKmL6YmgJvPtMF54N/+dt2xukvLZABQFfjdKvpu2CzL86XFl
 4c4UXzSkJlWwOBnytW/5QayHfcLVQQcpTp2KT3SXTztyG5ONsbCIcKsOHhdESUFCcMSKYfP3pqG
 DXmJ6gSrmAacZRpK9XjwuOrn2gZ7zkPktP9y+koofc6Hb4lYcbr+L1b+eOetTIfdFzgysy5CWB/
 /Ho0i8QVUJpfrOh8soEWmV116ekQXykBqlpLXOIEXIu94YwF15nnjA/JvCA6/fOBayPHoiIWBC8
 VwpmaWueqphD0dQFG1dP9P01m4y7D7F+sKuscyhMsk+f6Ctsu/EW7JwAFP3nq2WxzY+5Lj9Yu0C
 tn3ap1AS90/FrB9+mIuIeh14qS2HUj3b7PCM4wHv3+OptBqs8lMyBEOuDGxxIddM4wVUISE+mRM
 qYfpTkFL/kEnS31yEZ9nhlT9lH0HQahabTv24/Adn2hPVVSaiDOi4IjWCalYDKPdkl9RM2ztW9U
 a4bVTR9rRxQASByOmm4Q/2387wI96YCWvGqjWTJgBsw==
X-Received: by 2002:a05:6830:7001:b0:815:e061:e72e with SMTP id
 46e09a7af769-8228595c67fmr6850866a34.23.1791061738530; 
 Sat, 03 Oct 2026 14:08:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:02 -0600
Message-ID: <20261003210833.735937-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: bump to version
 1.2.3
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
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 2b34d6a7c4..1669af796d 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  92fa9532cda14ebc2bc41266481e905b  msgpack-1.2.2.tar.gz
-sha256  9eb0b0e602064527a045ea28c4f174ed69383587e29cebe28947e3b84106eb2a  msgpack-1.2.2.tar.gz
+md5  80009973366d78b6dff0e03ca0a6dfc2  msgpack-1.2.3.tar.gz
+sha256  32edb81a2b5eb7cd7c9d941b2bfbbb082fd2cd09e0e725930316af6b708db186  msgpack-1.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 231d4f564c..92e7cf3b17 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.2.2
+PYTHON_MSGPACK_VERSION = 1.2.3
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/6d/44/ea2100ec54d30c46ee9dba10a3bfb79b655e96c6df237238a3234c75869b
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/0a/e7/bb605a7bab2d8425a64b3fa762b39dc1bf1c7e3f11ba6fb5413d6db0ff8c
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
