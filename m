Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12351606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z9JWANkl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D37AE6064D;
	Sat, 24 Oct 2026 21:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDhzbV1TcXLp; Sat, 24 Oct 2026 21:32:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E85106062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877530;
	b=Q4m39YG4hSinlh/Iit6I1g6754B2BRirqYm1/rWaUQl/gtq8DWdDqt+BWdXlFjS+Kfjs
	 4alo5MnmACAj8O3gxFZQBWcudSAQQD9QDoLjQn3FxjH78D1TpCMztq9U3nmq3/Lsjcllx
	 9hSz4wdWGU6rdq5jUsG08ym6+bp/X8/n+n79crbRhzdySYCiWLGke1XJGShz/rClBOoFa
	 wQk4rB1Tef6ot2wVUd0fQZOWyiRedH+3Ohs3VkGYhihKk71pSIo2opCIzwXMGPlSC9JyO
	 U7FdnjyavrEbPwJsP1KrdsW5j1WsjKlz3+nEyVq5OuuVkmusqOgmdrnN2AH2OInGT+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877530;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f8uVKIMXW+vlkbupRVK4YVhee3jqRyLusp6XS7RPbZw=;
	b=r2Djhu0Dve3uu/7ElVGuQ53flOEBAznCN7oIUBAEFsSDfo60y9mJ7UD06bW8oRMuZUmG
	 fpVLERVyr6D7XbTSMEdde0BjhoywBOm9TFmrR9QoPcIoazVo6zWe4giKKgd0ZVoBhq5f4
	 1envCpVwxEQLFBVqNgsahH2ICmUVsMIn4QkA2iQgrsuv4o6cWvUgrZh1dpxzIWPajTP4U
	 Y8qq7wuMgdc34steKIiwl8fBDze+INZCpR/84GPaMdtLzQssCEt+HBrpz+UJMqEvrS7+Q
	 ca9p+SCc9OA1bggMxAqOnnLrFEGJC8kkpopF3hwC69Fd0rI4OQ07S3GMEnJwbXnQrMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877530;
	bh=f8uVKIMXW+vlkbupRVK4YVhee3jqRyLusp6XS7RPbZw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z9JWANklDzKcHQX0O6aeDsnblcG0zHWkWO3WxCqQ1e96il13jn61knInJAMqSw8pE
	 Xaau/mUvuqvEozk1APcQ8UCaN8OTNF1UsaSb4bFjmuj9z3wd1CbCgFtvk7ilKziJjq
	 BAzMebDwW8XUbVgf3ve4yLpIlikImdUCZDTrtDuBCoa8jIuS3tYL0XTvHHvZEpTfkR
	 FB9FRVK1o+t+mS7bi5Dbgi17INQsmDAWCmuB22Up5ORsnBpBd550wkSoHw4K3P8FXf
	 Lu2kBUuFbYqPMsNp3OL3sW23YGwEcu3i/wHd0x74PcLr4KGjHUqQ2h2WihRJL8pknA
	 0js2MXCq0d9/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E85106062D;
	Sat, 24 Oct 2026 21:32:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCB6E3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA4A6406E5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9hmoCUIyt0I for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:32:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38FEE406E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877528;
 b=jGm1MhDEp10xI+kdUtyk7nPo6ULyYghlMW3afQqOQTEjVgTthP+x+RzhWio02qSPixkf
 CS7fA3ojOC4UssfSXTWrOYoOKP9jpOiKXZ6jgSNnyzGD+15ptHCCwD3K7T24tn0DYAvhK
 1dQo+AZnL8KX6MSum4FnKncuPgxah7pmXUG+jfkSQ9yoj6QtrcWfpDr/NAM/Db6GAR3Nx
 eGGFCclN4pjmOgx4FcC+yKuzeHGGryf9tF687B2Qz5cfPVpPNhEBZdWaHWzK00U0jm+7H
 rhpny28b8E76Gt0NVj5UIWSqYdRlYm2sOIR7xpQ0N7MdLra4A5eLrtoh7znbHLEAjKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877528;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mNT2h48Bgb7JzahGcd40aZ+N9X2Hz+wFPEsauHhe9oI=;
 b=NaLCuC7ej9c9SnIGxks3OFrkZsK1eBOGNXuVkjw1dxovl6A5B1u/UCZfnrl7m392afWo
 erjkQfF3wTBI4u1DbBYN5Y7+0AC/UImUrYb6dQHV2FgZySYMtJ/c9uSsRIRtKde/zUjIp
 iULkr9uK2TaHYHgVHvqkqYhS6dqcnRubT2JscvIk6nmFjXq6AUr6upV2YC9hkhLwWYOgF
 5pG2IoSHb4DT6Pr4Jw01ixNrgguz9N/6hnUSd/9dfjSFa46gq+daMbStR7gquOY/UQ+yh
 ijaBaTPwrodrJltxnFkfLBqmHxAa9uH8X6AnlsYVxvkuWFrYwgTlmRp0xu7T4jbJ6hw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38FEE406E1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 130099CDF4; Sat, 24 Oct 2026 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:31:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9d5ba526565f9011beccf37209ae0287a0835fc
X-Git-Newrev: b712fd22857dfeda4d95280323d987d060682557
X-Patchwork-Hint: ignore
Message-Id: <20261024213043.130099CDF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jimtcl: install pkg-config file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b712fd22857dfeda4d95280323d987d060682557
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Install jimtcl.pc to staging, so that packages can use pkg-config to
find jimtcl. This is especially needed for static linking, as jimtcl
lists the libraries it links against (e.g. openssl and zlib) in
Libs.private.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jimtcl/jimtcl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index f2d59265ad..5e09e776ad 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -71,6 +71,8 @@ define JIMTCL_INSTALL_STAGING_CMDS
 		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ || exit 1 ; \
 	done; \
 	$(call JIMTCL_INSTALL_LIB,$(STAGING_DIR))
+	$(INSTALL) -m 0644 -D $(@D)/jimtcl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/jimtcl.pc
 endef
 
 define JIMTCL_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
