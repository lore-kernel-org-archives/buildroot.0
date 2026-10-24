Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB99606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E3P2Migf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90BE7816E5;
	Sat, 24 Oct 2026 15:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slkMiH945gaF; Sat, 24 Oct 2026 15:00:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 93F668175C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854059;
	b=Tbzj8Cmwi//fodviE5/fq7OKGYzEfdfsWEz+YMc/jzD6xzHbFIk1iYdV65I8fFvkHDGT
	 s9T3hT86aG98N0tZXHeBcc+G9cWBJpLNBp3ISnNXgYYnluCygQ2aRUkXsqCeovvJdoVt7
	 aF7I3YSECuaeCm6slazPWyY99GniEyg9PaOZZc0ZAm+CUKuUtnHyb9rILIsDQlXdNBUaa
	 OD/qcSObm45uFhX/bmAg7NOkz54BzRSIAPDHTxXYd3Tzx6rbQBRdbrrcOp0XwqKmqaXql
	 Owv/0v873diy30YfDgXiqth/uwlS8ZfgGBfqLXDiHbTj0xtsLYaSutPHHHnGobt7QgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EfYfWmWJfN5WFq6NA3xpdzbneyssWtpM3qwh7+TmUMY=;
	b=MRYZoJ0g1rOeFRZwWyePnTkwYivycfC+B66ocsc8WGpqb4HDcdz2wRyn5aRo9fYTsXOM
	 n5Di+DOuoFxRGXW8QRjcwezq8j64h5XqTFCIUZ3dE5a2w2sL2VOUtFBgTzWSh5APli5xw
	 x19VCZfKIF7Xmkv/aL3TgDTySZsmD9dX/oR6Vq5bMZPlS7etqTACg2gEornYBQl/2HNGh
	 JzaQwu7jitdqHnWOe8jOVFayfOBrSWMuGkObnUK2vUjPy6Uae2aMd+jFA62uQvenMPz4s
	 1lhw5T3xKBYTlVruCghe8IhwuTREFyf2rbqzonUt8GGHbJRtLJPE+wUO+22/vbFC1rA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854059;
	bh=EfYfWmWJfN5WFq6NA3xpdzbneyssWtpM3qwh7+TmUMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E3P2MigfwkoSS2kj8EjLk3gG+zVBZjKJMQ+CK0bMmmoOOEzhujvHvzE+0yKOGtHnT
	 kgf3OLdVnMaY3z/eyI2R5eda1wUv2XxgsGMKsncvcfcGn9aHSSsYWpelfGXUck8Ddu
	 x0WkfH+KRQvpanulB49ZtOgtdN76Lsy5BNxy427gxeVDJOCjILnV68aFO50F5L89bq
	 BiKDhEi1B6whaBO/ujyOJS8aaGfcxrrDyukuaIFgNg+c2KCSIfVoksLC/vjl4thCLA
	 Yq7TZdF3tMrvFGlG/Xubo3yaT8t6OMWC9yxxf/WwwXPKU1mB1oBFah2Qcl22c/mqbA
	 eL/T8rz3y7uww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F668175C;
	Sat, 24 Oct 2026 15:00:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B62FD34
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 595A160688
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSSAGkzmCcoK for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7DEDD60648
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854053;
 b=aQZ5tRbeCkwOnZlTJs2IaqP76H/byl7EA6OSKx7oPizyUElwpkIeoX6vxxidRRvGoiu5
 cVR7YJ7H0dYPeWNpglxA9meVSTzA0/df7c4jXQO65TPizZd4D7MOAkf+E1tA+PrZSAlAE
 bgc85tcn8ug0oXMbsB+tr3BGHuOGkF5isEP5ik3RercpJlPO2DGDuKBK1rfq1JRUHx3CN
 Tuz6ReiMlzWur3KgAwnxV2+jd4nV3CiEfLkCu4gjYS6cU4YtotSgp0YKrGfqNkkluxHCG
 Cphex93xujcjT3UlQuM4jnciHVSXhi28bbh7SlwSLPknOJEBpyg8LxoPxZ88Yc36vlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LwdhC2Ro5rE0OWi8sUUtbB8fkCSJTYte9e8N71HTK/8=;
 b=MDW0UzcFSfzYBQTbuzMHZarFQChWtVgDwJYu6vtRwX9o2JVTlzVDfljM95u6g5qljUBO
 baq2J2KamGpxhN7UxQnPRPt3puDb1MAeGpr7j5I3Xyn+b+Ilg7hLd2ScjeAnJZYsrzw9Y
 SouHqUqgLApKIlBQlclU6P9hqzoA7XB/3ynnkKQ0gHz5uUesGEiNs+i6AwOasX1D7op1t
 OIY5MYlO2RcYKsvyZ2KcDAxiul64EjkjhhUr3PIixlaqsbPSiW0ZsXcRGXocGGKEy3+Mb
 nGrv49dvGxFYVVD0/n7wXcZrIRwz1p/ofdR0Ifckh1NMp+zoda9tedmOP+DxlH1b8bQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DEDD60648
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 709A89C849; Sat, 24 Oct 2026 14:59:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e81751cb905df068d410fac3cbb68406773bb830
X-Git-Newrev: 85554b2b51098d27d13059a862ff13612b0b3e75
X-Patchwork-Hint: ignore
Message-Id: <20261024145928.709A89C849@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: add host
 variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/85554b2b51098d27d13059a862ff13612b0b3e75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for the standalone pkg_resources package and
include the hatch-vcs build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-platformdirs/python-platformdirs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 55aae1e1af..0aebffb6a9 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -11,5 +11,7 @@ PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
 PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
