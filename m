Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2203CA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B7478134B;
	Sat,  3 Oct 2026 08:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W87OW_cdhend; Sat,  3 Oct 2026 08:46:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D9BB98131F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017163;
	b=PFrni6E8QlQp6KM5BIlx1csuo4tsySroaxcIgNq0EmAGhTQF9AGk8tyQEOcjDaYXi5Br
	 dTO0/UrTmFPIuU289xh0B2YvZlTYUAx7MQVv3JHuBKfJR+5Eltd/PoJ/WVZRK8l/mEKsf
	 7GUVeiu+p1qDH6WGM5dfNBxahNmw2GuoSnGfbx7gs3MizhqLCe6JiVEL0hOkEl1OU0Oea
	 +I9OBbM9tfdpawtlgXrTe7iNy3euIlUIxFnPqoHiR0s+1fEHPHOwTbg6ZI6EqsmD4kd5o
	 qMvYuzaCkJOafncgx1hdSrpnAU72zNE4+Ev0cttFeccJ8NQQfe0ecby/BqaLhOHRMkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5+S7yoylnwY2v+o9kj1pNGls+9FaW7WoCYWssfIeeLI=;
	b=qPOH1eSpK/gddSDs8FX/oRHel1AginZ1T4AGcpU4jlFD57HY9Ehg6RqEQfKq2c1L4s+U
	 LDRTP6n88mcmf1pygel90sT1nhIjeiB0cTQu2gESqXH35qM9Z8UZzbkRKXqXS3EVTB9N6
	 3RZfojp9u8RN/A4K0uMaW3LF336GhlSB7Yec5rgjl7IFvwpsXGPCyHfzrc/2gGX3yTm7o
	 Ps8H49hDytBfzwzPDP9/QDUIJs6BSd4n3slTNMfFzlTWwCTtLEs2RgzkbvmFA54iNYeJS
	 tminmyRSQn1pKs8kQbQaTvZ7gAmb7XvACNlByJPJ480fKsIgDRjflUQS+3sq5SjwN2w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017162;
	bh=5+S7yoylnwY2v+o9kj1pNGls+9FaW7WoCYWssfIeeLI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=E7AspKlpw5Qy6Au7GVRuiMi9tSaVSxTMDYc/UaZmCP3vxuIqp+aHhHDrijRUr/ckY
	 Zd7zHStEhtEYxM5Z7dK+H4DrV2AyUH3v40ACx6WOiKuO0LT5DA2xOmpDtQx8TO1D2X
	 6D0VFrsMNug7ynfMZhUgPfrp/GOPlgqF9fpsCNPsoiDnVlAS6zn719/Z7BwYXMcwPR
	 W4b0PquL/u1KZNGEyfXyLV8WYaJe9R1olwvDBMWor7P8PrsKMMX3a24MfP+X/J0aJO
	 rQQaiNYFx0tput2CAgo+pdh8wJVgvMJKY3RuMR2SN0hZaJ3UnUr3Bs/7/ueQSx7o+P
	 X7F/Pdlk1D1lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BB98131F;
	Sat,  3 Oct 2026 08:46:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 419D932F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33C7240070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxhkzPFbn4oP for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:46:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5985340059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017160;
 b=M8T6eqd94aoM0RxSKn+D8doTdo0Yb2RLcl6Ig8x4pK76igOx6JdyOSjptS2ARG9A3/2y
 E4/jMevlmoHE6GpIfTkPCDyliPGkcn/0eXreSn+4jGVJraJaPX43gwVUhb645w7MhdNYz
 1n2Udf4ZF3kbMAulzwrrJcYD2xizMmkxO2SpaVg1yxc7GAat/qEIadW5onQoxkjd42S6V
 1rf1/Fw4j31uAKuHHa7+lhtw1f9bnSTDujVKoGLDsDz9CoQkymtiiu8Pb26G+1rBxndYa
 kM7opochxRi/RHhIO3NZvhNM7B7tmT0iZEyvQCh+qJH8e+K/dxSGwA4bNkxRgfoDAow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017160;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=W2VweuCunLyQNEqzJiUh3jxE5DgjtO9wsMRdrmItCn0=;
 b=Rr+ygxaDcbB5xSaUvjqvSqgt4FYcKdGdcz1ConnvyIorNoLZmOP/iW79/mjyhTuKb5QX
 OsIY0rQZ+z4ASHtsv5rhP5fp/aEBWaq+dHWO12uelhAPqMVJKL8T1EnPS+iTxmZMl5bxI
 eIo2PmilCPU/vcURaG+UZRirtbZSpsPsCHeomBPhxBF4o97nVw/s3oSMVSA9ktwzemaOY
 rjGgMiZclo+M7/jgS7TmXQNUXkfGV2GSF8iK0ZfR0emHGLYssiD2ebg1dNXuEDg/kY4Ow
 lVZct8GbdOWX4c/dYNNx78FlU72e4rP04Xdfw6FFxqBFzmdZQlMOUZQD6vmssPotOzw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HQ82YiXH; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HQ82YiXH
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5985340059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:00 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823d139c181so487611a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017159; x=1791621959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=W2VweuCunLyQNEqzJiUh3jxE5DgjtO9wsMRdrmItCn0=;
 b=HQ82YiXH+LsR4SKrELWkhpVPBR0/fdCexiw4UJDPb1UJ2cmEGrxD4EN+pMsA+Vr38O
 8jI0EfO1O2+oAQBxfYP17+V0rh6URfWzOTriRz2ksrCmQabtb5qeSBtMXVFP2wk7c7s2
 3dSOU8FfFrEzUnvIVYmmvhVGd4bvlglLRr9ztO6WaozTgQUgcGBXGQt9CcJ2zRlhDmty
 G+srmvn6hvCJtwtAgjFCrOkvmiIi1+EX2Qu5rg6xp9YNUafqQ9US2y8SNlqTJXJVajpF
 ErFxVheBzIFc2I5xTawOls+MnSgZ5tPI04BitufcXzjalWo/1fU/oWe1eFvuSdickBsF
 rtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017159; x=1791621959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=W2VweuCunLyQNEqzJiUh3jxE5DgjtO9wsMRdrmItCn0=;
 b=dAckyref6iUPCxUjwouBSp1dxs19VmDc4/eogNOdf5GdBescQubM4DMJYD5KDs5b+9
 zlYer2kOLmPlKVgxQdg15P3POJSSjenGt28GZBmgCljyX8znckUry3Qva0yj4RZbQcjm
 nE1QKWwvD1MNuSUOMEiz//K9Zqf4vAx4vDkEDynJlCCc+ajqtdQh8X1hSdTK/9/J9JXu
 CcVk9lCa4YkzDuiPFSt4c+mA6DP5FKmzEQA39xBb1mFkwpHcb3x7449FjpawWwHvt5oh
 f0Os9pMx2+VOviUwZj9M60oQ+m6M9NN4Ec8jEzkJrS2EYWIJTC6lpITKOJR7hLRMUHIQ
 13nw==
X-Gm-Message-State: AFuF++nG+2siotJU2iE5RYa1OjFQJONDxaEOiUP3ceeUX/3d7vpQGm/q
 dXAnLI4HqRkdHg1ctFrSUSW5UryYlAskXg9ec1bgWklyUja0im+ac1rWWQjiKA==
X-Gm-Gg: AYBFou2kE7XjRnzC3w1py+f8CSMf83FeIelSRCdS4Vkm3Iyyuve/QUkxEQOND2z9Ber
 WTDkvGFF2pGlUFaumSnxuiPfbe7+sq4hqS7d/tX63moYdqH3h02uEx9GrGPX0J1klnG8UmlBvKL
 rA3otAzXDbcM4gozZJVer+ytBtOKewm7+JrCaHyJA+vMNEmBv4aSeRavl6eO+X3Xk5ogazDzqCr
 CQO30TaLjBhwXWVuVWhNZrb5DSuPr4fs8FnLXR98iI+ecwMOZZrhYhqZIaoNlNFtHBenmlDJS7I
 E7ecS+e//XAMuLSG8xMkaQhrVKmPEEj+K18yJ9haznLEwAnIVlUh5Si4D5KApPs+L6Q8Ev1O0Za
 f28ucs8tA5ZJbZn1zPEblOSOYl5a0ZEtqL/kkGiavEQl32hZLrhsVffU2nef4E6qroS7jxBYRK6
 fX3ID+EOqMGEEhcXTPI7xfCAYzecwv4hxLkCL6uWSnquAu4I8Qm6+qjry6CAe+a/3SLGEV+IcPW
 FyPffEFzsLgeMFCnEBfOnt40IL71oO9vfr0ObpB05DFPdvRL//N20J06amYEGsCr+gdFgQJ0k4k
 hZj+vfIXaTTDugJe2TLnYDqg+LNOxGRJzRi+Tr5AruOLbI34dzjfrFni2i5YxqQscQJ7xYkz6KD
 Navg3v3UqnDGVh7C61eVyu4TZvwwNBLpbn/YDY4NqYw==
X-Received: by 2002:a05:6830:927:b0:820:f0ee:1fcf with SMTP id
 46e09a7af769-82285f5b852mr5232655a34.29.1791017159195; 
 Sat, 03 Oct 2026 01:45:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:18 -0600
Message-ID: <20261003084453.545653-33-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 3.1.9
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
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 4cbeb14e23..0761734b39 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  5b3063a0bfc95d46cb35258b03b9f30e  werkzeug-3.1.8.tar.gz
-sha256  9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44  werkzeug-3.1.8.tar.gz
+md5  786765fcf7f7c9fa43cfefdc8147eff0  werkzeug-3.1.9.tar.gz
+sha256  55ca7c70a75689be937aa27f8ff4b018f06ff4838fc73045560bf0f5a1291060  werkzeug-3.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 745e93f443..20d856702c 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.1.8
+PYTHON_WERKZEUG_VERSION = 3.1.9
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/dd/b2/381be8cfdee792dd117872481b6e378f85c957dd7c5bca38897b08f765fd
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/a4/34/4dd12fc8bb7d61c91467ec3efe415ffa7d5456f799954b40c5bbaeae470e
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
