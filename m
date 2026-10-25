Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC2D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HUlqRPpE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rGGz4TMG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFFD66061D;
	Sun, 25 Oct 2026 22:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMJgkGr6LXEU; Sun, 25 Oct 2026 22:07:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 798D260604
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966054;
	b=G1hgMRiV5xodhAWJWpp2WL27mykx9dj3wIldtgx0h7og1cgmZRp5+uNHkND99933hdJ0
	 2d30XusAGkBE9dpvZvI/JGjLsME9cniqW+K7ZHoJqC2FaGrYzBk1TSXsbsjClWQ178LTR
	 WOZ2XeQzcWlbaq5BA5cLN288M6T8D+qkALAQv3DhY2o6s/9205iXSOxUbbmYRWKfWWSIP
	 xDTPX6lBRVYYVjkOYCmTIXPlCkBSXlC8QWoESrrvt+M7dOcLlK9hFQOQhm1a7cDA5N/+M
	 eb7vtmlnCkU6CuR01NvHlMYFFPdqnDlXnIhivkK+p47YyQ6Tg7wE1DFw44vvA7L5JdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966054;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OzeCdwQwOijXU8RHwsevkEMeiFCX1/W1UU14Sc8KISc=;
	b=Kf1/YZ37waIvXr3/mCJgfo9rjq4nGgf4vHNGRP5oEAmUIMR5eTFjrYsCp5wpEUwcTzd+
	 otDlxUJSxgjOasiCo8oNgyvRLFTWk2U7VbhgIuOFBIiQ8xlVnuQANOyFM79OmkwLJs4MO
	 gwzx4MaAJu8iNedUdxi4zVo19Xfy9/PWtinxmEgqglC9KEQspv2Qw5lNskuz8Fw7SSv8y
	 YnjzfUrlwydaggJ35+cQSgztljBgjsVguSb1CKO/1i5DhJsAuV2GG5vWyd8TD3BEdg3KN
	 O0Xw6uRoRhOpV5Dsj2MtZBkPJytzI0b2LW4I8sCHqD2zT5YWIfANnUL/uEt4M41Js3A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966054;
	bh=OzeCdwQwOijXU8RHwsevkEMeiFCX1/W1UU14Sc8KISc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUlqRPpEL7KHxBXUxsE7T+gG2+YtNjT6T8Yi/UY4GLiWy6LD024tnfaLqQJZtKI5x
	 q54kZX2ze/Pi2xYADM3xaZlPs+FfU/NQ/IxHWgJhXzcYwbJiSTMnqdoVmiIm2R105x
	 TiWLiaDY/Cs2KWNQKwIX9CnOWdVw5PalB7tKim0u4G3esgVeja+5cdGJxI50y7oa6Z
	 eSJmpaP0e3GCUSniVrgDh/xlIbHrA7wiaIGGOmcAw7vRNUXLjMgfzyGOfJ69Z/1cg5
	 gi0q+RdFtMFO9yCMV0y+kLotXRuJASuWlVgXiJ+Sk0A+4oxGworodhMmd/4P3M5Mmg
	 xr91H+VWCZVKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 798D260604;
	Sun, 25 Oct 2026 22:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37BE1334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D91580744
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1G5sA_DDi6ej for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:07:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B66B80C95
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966052;
 b=pS7YA8wkEfTg7DWTGOUu1JB8SAOrLXZrl1bjhyn++L5pqpOvZOuguLnQrKErAXyDxLW8
 RUlUurw8qXj1anPTOt5qk5MsdxImXuOLiCov6HglMX1icwK4D4GECdyjbckvwtQw8PmWu
 IFY8Dt6OJeunFxnn0XIhqDhDRL8vIULtA3pGXiWqIqVyzsQHzbGJ9hERR7Buy76J2wCdu
 /QgOoofSGRkCCUZitS95zhVGyi8iDljYo2FEGYVDTd5W9TlWaPv9deBqhRV/02GjbpHKQ
 W42PhLYJOVsY/+zPScPpHVnvIKd31Hfh8IJoSURhXsAGa9Dxirn0JoQNIZSY/eo9FEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966052;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oGA56DIUf7fIcT5m0rnnS+Ox2eUGy+FF5pwpisE2xsM=;
 b=ZnCqQe7OIhif5qzor7R0lWEqYkVuvBX5580q+jtrb/RFUL71nNUlJg4Mkr7Si0bt0X4b
 v1CJ8ZMw3U76yUGJUwWj9UIvAzWGJcjH7T0jq7POQQuwxKiR4RlwNCQstnbOPqhLGc7MN
 01AM/wQtjLkJhuHSLutbsbQD7VV/PRya/GTKDrhMgR+/1Ib+t255AaPDE4eFXTV/L0u7N
 dW+SSsmpEH05ulZjidYcP3UrOEdGHMZCDecmzuKDH3ajJoRhUFtJ0xVaYJMgPgJzhBcCB
 QcHGz+NqgIv9VI22728kYzF+E539UC6Fpj1UTce72N/Ra0zQ8R2TujdfxNiiKvdsHkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rGGz4TMG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rGGz4TMG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B66B80C95
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966047;
 bh=oGA56DIUf7fIcT5m0rnnS+Ox2eUGy+FF5pwpisE2xsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rGGz4TMGm7mGlYJKt0mwgr7vHESKe7hdFy60OFFH8EVZqcKBVxfHUtqBsur9PG5YE
 DMXduGE+WXgb3PHGfTkF7RaLeXlaLtNiPYi9CIxzDiOAb84adzz1u0eh20XPspTbll
 iDK5+Z0jAAq6moT1gxuP3llUhT3QLdTIKQpU96k98xMg7v3GLU/ELBZ0G6Key77Tyr
 /f4AnX7bMkyHVSb/SSt6q4YrWTgj2If59UISBj5oGrAQCUlRg14Yaq4FWuPA1ufcIo
 mYzPpNM5k9dc5kjDPKPmrWNY3m3TwSOHIJrkqwXiHRhqZPP5Ate//QmUL6DRaw5IDx
 nYZhFgwhHcoPw==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 oSRqVUaAg2Sm1YAo4ZN1HD5f4rIXPKawb7U+DFmNrdMtfQDpf+ly9F6LJwsBPNiJRorRFUrCB8v
 D/FxoyTK5AhPrYPpFP/nuf2w1FWhaQZdrLRvPd4LzGGRYPlbXG4WKx941dtalIS4Akc791Y6hWb
 RAYQNzNB6ozaFkXmyqtKrZ08p3cJoWveC0DYaTX+K6WCJ1LA5SC+j/KE/RzWZ6Lvmw7pLyeoJPI
 lVD2TlqxvaOh+E8lR2TfmZIWc652wwiwx6wfxrkz4zLBlgNLERKpvF1VZfG9RvUo7SEsilHzqjz
 lxoaWwdxP82Jwfh4iztVsIrRQyLHlLgOyqDBWB+f6DXmCKyH+Ng81P4CTiTMcEKSpDoroc2+KlH
 UWDMvNqcRv/7hdoIGd06GWPG2zsO6wdkxbhI9V2Cor7X1wCahStyvSvEplq9OZlocs2VBOgRv6a
 updL/erddvynMHUmilzHm3q2znQRtujaOU0oN1ayg/aq88seI7W8BdHhDU7dSN5frTyK6kwb8M9
 rsr2yigbMZhev8oUDaD6Rt5dTjv35uQIKWImH0SinxZWpwcekIK6Aln0yWdAKGoHTxg9e0sZScg
 Rw5KMhOqPPiIt0ZshjJKaJGg873WBQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1C6DA4C692B;
 Sun, 25 Oct 2026 23:07:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NC-000000001fP-3au6;
 Sun, 25 Oct 2026 22:07:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>
Date: Sun, 25 Oct 2026 23:06:50 +0100
Message-ID: <20261025220723.1332924-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 01/34] package/docker-engine: Fix go module
 version information
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefan Agner <stefan@agner.ch>

When using Docker engine built by Buildroot, the BuildKit version
information appears as "v0.0.0+unknown" instead of the actual version
(e.g., "v0.22.0").

This occurs because Buildroot's build process doesn't preserve Go module
version information that Docker reads at runtime via debug.ReadBuildInfo()
(see builder/builder-next/worker/worker.go).

Docker's own build system (hack/make/.binary) uses "-mod=vendor
-modfile=vendor.mod" flags, which are crucial for preserving module
dependency information. Adding these flags makes the previous vendoring
workaround obsolete for modern Docker versions.

Note: Use "docker buildx ls" to verify the BuildKit version. This requires
a Docker client with the buildx plugin installed.

Signed-off-by: Stefan Agner <stefan@agner.ch>
[Bernd: rebased]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-engine/docker-engine.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index bf2dc588fb..5502284dc3 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -25,6 +25,7 @@ DOCKER_ENGINE_LDFLAGS = \
 
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
+DOCKER_ENGINE_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
@@ -61,15 +62,6 @@ else
 DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
-# create the go.mod file with language version go1.19
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_ENGINE_FIX_VENDORING
-	printf "module $(DOCKER_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_ENGINE_POST_EXTRACT_HOOKS += DOCKER_ENGINE_FIX_VENDORING
-
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
