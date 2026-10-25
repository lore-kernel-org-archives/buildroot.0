Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02251606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RBcTYO9q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=qb3+mHuJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD846063E;
	Sun, 25 Oct 2026 22:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aj2NMjTftcUa; Sun, 25 Oct 2026 22:08:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E845960617
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966080;
	b=WW0m1I8Egcp4oOYD6SAL8qVqSOWhfJJpXle14x+43JS9AuXhEhAU2FaQuLEYZ7+x8y1x
	 XI10htNF3ACuSn2Ts14C+5xcaBJh8XTUdhFW9QLBaf227d4N6f506faobwVuUnafzkZ8o
	 H/NRgkEIu6ON/s5/8pUmTKJQIK08DJzkExMQRJdAHkX/reKDgs9jIwl2c5GNlc7svWX0C
	 BAJAyYr/rf9kUArAzjedeu8nn0iQHiLF+EiFGqlk0yf8zVWy3SGCEZFez7QeaFtU3bfSG
	 x3QhMNiRurT9TzwtbKq3i3MRC+lqyWmS5ClxfI1YB2qrI5CUTjeq1nCF4YVdC3ZNXSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yc1Ojlv0qe0U7AbG94sHcf954OEaZtDJKE5VXMJOI5M=;
	b=QmrAAL0KlQBKvV00VcRm/La0sTYO8GH8YHcU4x7ex0/YKGnXun07rMYjx2kl0uWilZLt
	 iRncV5qVUsMRNBbirazW2fmb44/Ju+/2seAidlIYxDMPV9dq6/Jv+Ege9F9LDAYW0pTmB
	 idAJP4R2RVklPaX4Yr5H+QNqIpuRVKqRy0N2oRMmfk4JG3SOrL4/6QcYc+H7W91g6LRP/
	 yaUkbroPmshdYv7iCgifiYS4SYLIOahKiPF1r+gD1RvoMuZUBpic2Ht5VkDTOiaUWJ9nK
	 c9vVgRrOlIjg5LehjQDyAgGj3doXpZGBlF+0TNgu8uwCVJkT9Vzo2eZWZX0vqTuOFcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966080;
	bh=yc1Ojlv0qe0U7AbG94sHcf954OEaZtDJKE5VXMJOI5M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RBcTYO9qwL9uU/QkAi+Ka2S7roQDBUxu8VIIPniwHYDqEMVNgpJeAM6NxHOpqp6Ue
	 MVguBbjAxfc/duM3TXgjYyCfBNaDmp6kXmL2iNSa/jUGiwxmBBYx+jHaiiHPLpzCOg
	 jRbSNTn3tgsMo80JnDvDjEIaOhWWTDDMFtG+A9jnpkLMa4nh0mz4JwJWLuA5WEcA2+
	 YCO9frBTYMxeBVXYixgPKLR5RgkfJxtPlTzBAhW+E6ye62EW/sfMseE1/RvSZO8GaU
	 iB1ksSuAgCc8h8j6T0lDsBn1Va18u59zeuX88+qJUGMv/D1iETxp7NtucODXyYKOxV
	 7UkglVHkMWHBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E845960617;
	Sun, 25 Oct 2026 22:07:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 977C8334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DF2D80D62
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAa1X-jQ_8-j for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9298A80CA6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966077;
 b=VRV0p0KHktUJwt+g7xgd6bI8M8F5lf9nZksg1AlvNdYhygFYyLMlyAEl9QVV4lGHZknG
 zn2sAvaOn5rD1LcguveWEaKxk0eEEU6ZX3LVoQTl/JyBL0Mqt+zc1kZHlhDn6cdXWvkn1
 1lriKDtUykUYRGdJ2KyBEbsgYN3p0Uil0odWZIDAIWvGIP4PGKtRVrX9aMqgwr/yOsB3P
 pQDOCpyR59h3OdgQrK5WGA14/MoPvO7oHwo7mFqTD7PMPHTjjW2nyv7Zd7y5J83YPJCXD
 gDdINbVdd4l+tVTKn14G+iS6V1zo62Xam/qmAcT/zQmaBTdeH12+9IEGFmUddR+s1XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966077;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cOt+hwEGNa77wFsH9YD7GvJz8dLEi239br6cClp0SwI=;
 b=RY8KNpAxYWkch+pKWSFNdYyQ54/VqN5QoaT/0Yl+anpB4TXhKxvbHLe1TOriNpLy5S2A
 d+g6DmDLnqiAXKLoAnSUdvolTUyrmyCr7Xeot5Z3eIwRu4Z3sllscCBmeGHTs9a0S/6wI
 qHCzB/dGC1XeAzxX/IMu3rmXXTuu+XhjWkh5U6MjbbB0wndLNz7GpnzaaW09VQYDZyahI
 SFZ5ICSkzK6BcBEJSzuIUkg+3jH5L2V17ORbPDaAHxfDpF5l+UrzHZyG0SNr/15I7TBai
 LyrSXSinYKPSamQpKb9dpvSqHMcBA5ylrj70qRnDQu9KoG+nJYnz36cOrLNBD5BjgIg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qb3+mHuJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qb3+mHuJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9298A80CA6
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966047;
 bh=cOt+hwEGNa77wFsH9YD7GvJz8dLEi239br6cClp0SwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qb3+mHuJuPyHj0xAa9FtJ3Pwobu9iFPgansXlniL4h72syd2O8i1XYZz6dbNrx5oF
 BFbapM9/hSogW23GOPMt/3DBcida2jAsHn8OZoV0UJNa5hnUWSFZDTSog7nL2T3u5w
 Ym1fgOc6rMrZMAXhNvcqwCrLUJj7MZWls6Q3yKhkRs8cPV+DMYj89nYg0PNNPGOsq7
 e3FoK4VRYcJ3NXwgSJ+U5gwGpoOUCY5YMwd4f0fNF8YnMDHrzDRC+ZeHp/SCWyfR7I
 5C/GzFT+O119YPxOqkjzLLoWvFzQSH1Ye9rm44DGpDtbQigWzJy9x60kmEqBThW4wt
 Nft1Rjl29ZTpw==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 8b7KQ995yBi5CFqTJVVNBXVQ6yG0AQKj0G43UMrLZNfzPjhkHnplFkVs5RV60S/Wcm0bXDOAjTe
 bW2HNKGjk4GPE2GsrRF1n+KLHR6vrr25Jlnu08bvcAo3zxSirV5plfgho80Kc6EsN9ydU6wqs2l
 WEu9ZTmLMgsa/Bx/ysZWMco+hN29Q96BbkpSsQgmHzORQJss+z8fskuFK94XZR7HJhDh4pK5if8
 Z+yL5E/fL6PEC4Ny5DKAHTg0xKuyWyftXVqG6wKcZDbf9UeQ9Iwy1LGkM/Og+ELllt5zGGNwL1Q
 vqfH0cxDouZwv7fbL3T34DvgbTFTEVvO+ZhHzjJCoU/RwxMPGB8zjM67eniKrZMuEC9furiIrg3
 DnW0xS5FD39T98o6fuMOsWHNE2fqR6HiOkZrzR6UEpJqBk3wnlYqTzf6fAoRein3J1FmkVlRzMa
 0UaQeXiZXhUMRtCsU77lkNdRHxrRE7zKWC76zdY6kM6NhJkmkhtaPnbu3leuMVpc2qgd3BjIdX2
 YazurqovtOIoT8+z74l8Rrj80XQuiWYcIUjMbCXYXrJnS9tzewBmxx/KQ4ydLbrJuA7RFBTGpG4
 tqGyHi6YhbFxR2RjSAj5SRhGI57l
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0BF5BA4C692D;
 Sun, 25 Oct 2026 23:07:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NC-000000001fP-3yR1;
 Sun, 25 Oct 2026 22:07:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>
Date: Sun, 25 Oct 2026 23:06:51 +0100
Message-ID: <20261025220723.1332924-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 02/34] package/docker-cli: Fix go module version
 information
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

Apply the same change from docker-engine to the docker-cli.

Docker's own build system (hack/make/.binary) uses "-mod=vendor
-modfile=vendor.mod" flags, which are crucial for preserving module
dependency information. Adding these flags makes the previous vendoring
workaround obsolete for modern Docker versions.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-cli/docker-cli.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 8ca74af7d0..216cf70b95 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -17,6 +17,7 @@ DOCKER_CLI_CPE_ID_PRODUCT = docker
 
 DOCKER_CLI_TAGS = autogen
 DOCKER_CLI_BUILD_TARGETS = cmd/docker
+DOCKER_CLI_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 DOCKER_CLI_GOMOD = github.com/docker/cli
 
 DOCKER_CLI_LDFLAGS = \
@@ -29,13 +30,4 @@ DOCKER_CLI_TAGS += osusergo netgo
 DOCKER_CLI_GO_ENV = CGO_ENABLED=no
 endif
 
-# create the go.mod file with language version go1.19
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_CLI_FIX_VENDORING
-	printf "module $(DOCKER_CLI_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
-
 $(eval $(golang-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
