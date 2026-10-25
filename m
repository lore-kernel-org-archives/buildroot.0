Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF9606A320
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NTWV7Fky;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=GPhHke5Z
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD27E80D3E;
	Sun, 25 Oct 2026 22:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyv_ZLIk_Azc; Sun, 25 Oct 2026 22:14:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED7F080CA2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966448;
	b=tdHmME2NmWlzYHiHUiVZ2d9tLfzLyx62c+Z0CIUu2dKvBOBJstiKDa33iyPrknNXKz4w
	 wvSP7NzJZDdcT/fElpamhigDRMDhkWsN+/X4/t3azTbo6VwBME0/GKJJ+HLtrJzcsnfcd
	 eQvtdv4yOFjBqP7/9bHSyCVjQrm/wlwFL7tOkdf9rSrcILfNxArPvyG56GbYODClmgxPL
	 7+Au4fXWdu+/DAmFvmfflLSy2rF8JyG2HjTPpd6On80VmJz6GNA5IZDnEXQPulpIG08wl
	 6ZFxjH5stKSW1UrU89UGIXKAlgJkguLydvFiq0mFK7sBJEWCqXvLxLd+9h3RCgXZRTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966448;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ARKW+QUvXl3QzDvHKF+BDDpAlVhvw+wCZQ8YnFYCG5c=;
	b=kPm482wXaFSSSwlHvdcgyAkYYirdpI+3EEynlWMzGzNF/R6beG/g6hhhRioFMae9Sf/F
	 BZmH/33zMvPGtz2JwyBBfsYDlxsd8AjLMg7+ptmk4Dosj5kAdEmDbPmKgWuc9pocScCtw
	 e8fs3PMsqHuNS9khTpEeflDCiHgWe072ljkTgRszNLDUy4DqYb3qRkind1614L2eR4d7J
	 HN18tnvRKAf7F24o41gjPwSTx4imKrfYlgg+DThVhskwQW3uS+FOm+Ten2NhtfYqvge1Z
	 RGD6kWbR1qApAqLXBmlKKzkQ0OO7Lqzi9s/qF8Q21JYDX5esW8uvMqEIILdkq93e7/A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966448;
	bh=ARKW+QUvXl3QzDvHKF+BDDpAlVhvw+wCZQ8YnFYCG5c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTWV7FkyMqOV80AkSRBVMzjh5dqMZrPtna4ftbjEhLpCmeMvvn62tOPXZkik3Tmnd
	 Gcg/dRwLa80E5oVagrfk7DcKlxiMXz10T2hIKRX9WoZQ3aZn0JFfXUYh7ejvCPheKK
	 bREOVWw9A5Un9AB/f8rd7Vqd7BouHjyHfKDUuLrojnC8EGWuKCrxdqd0o/aIQ7x5/M
	 jEnl/W6fR0INksh+Ypn6cPOZNibeyLWMorljnvR7y+Oa+kCpfm73pZDzYbQIiY36zb
	 wOQMaKPBwywxAk8K1ctdQ+7/0+fpeKTekGtpJZlGnk14fnb4Tx/wXq4MusYO05QYCK
	 USHql2B3kjAVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED7F080CA2;
	Sun, 25 Oct 2026 22:14:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2FF279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8F1A40528
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veXYZCfaPuBl for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:14:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F13E94051C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966446;
 b=Ug4eLSFai0CsAHdeQTMjF2AYViVxq6VXhQ9Q9zUhd1JAGmrYI8nv7KHbtxfqCnAc5a1J
 25vxpSoU/0F8qypakz1qKxamLAXs8/kca3Yz245BuYwtMNNMRwnsLgZXuhdcHGZY00LV6
 RMbxb1aYcXxF6hgcTVlq3Rwtw0uvz15Bu//RjqoWg/OalDDNuAtNSOTJIgjehJBpM40vB
 f3vLzFnOk7HdBUM2RHTUxHn4SZwZgKn+Rpqq24yrk509Wo6cFUSqeZ/8t/uNoV+7x8foV
 NU9EUVcW5K7MM57gZ8ecAOsfjPJ3FTXfq+TKFwDsX/XZ5aMpQEkSLE2Hvck942J5eEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966446;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=YiUxPUdP4qeYtbXE+7nhFWAnqFmY794QQN4cN7smcYg=;
 b=Kzh65zyxsmdl7ik1OLq+7EYfiPhSX9mYyvV8AqSvnH6Y4P6XFIVRx9alNvKFy0NZEXH7
 1JOr0ZkqvZ9a3+JWLzuL+mRnC63+CuYQNYV+G0CRuMrKRt984wZ8UjiSizxyTLFNLPrI/
 Aam6EuRpDrKtm/53KoTI2Ru2sgb4eK16OrS6nX+sRpzJ05UEXmGqjr7a+FpIqmn+JVmpM
 Yu1hMHBZrlWnBfy90zR7tJUsw5b0CryNO6j0AOsGFgKqNAw/bBtHoWQTIqfwDJtpt9J+1
 lc7pRL8lipdh/N0aORWYRSJjU3G0ye8yT3CDByHt6wVT8tcJkmjzRXm2B1uwr1ObGUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GPhHke5Z; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GPhHke5Z
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F13E94051C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966087;
 bh=YiUxPUdP4qeYtbXE+7nhFWAnqFmY794QQN4cN7smcYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GPhHke5ZG8bYlXdNlTdBYJF1NsfFivLzetEY5B80kW/3aws0zUsSiumEJuQb/jubV
 hjh4+dzkN+2lRxkU0DJ/vWf1YYq4iN7A3YCm0XV/xpMp65upX3/mvZnL3HGSUwNd8o
 n8ceJTHKunvz0zRgxZP12S38U5yHDakEMIkpQjfmi235k/Ab2zxF0DxZwgiiEPYa87
 BO7QS1tGLYjdeGRfeDd9clxISj5Dhe+L31Qg2AQvE+bbcaowrEgD0VQxIjMdySH1qb
 25TeydCynCCYkoF/5i7d16Ob9c+YJUQoB5oLcNc5StaEsM4OZUneI1STDHOfgMIlEp
 GBQL2n+DG/sDQ==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 pTUHmV4J4DySdGXZj3t5ZL2pxCLhfYA8cD3G224JXcINtyBoZrPrAKBGaxb37LykmZ+nA/MD0/r
 2Y5wTNgzLEfh2XV/z5DXmSomA22hrlXAixlPwd3Wrz0Bn+fTg6hiSpivWZIVq4RxMATRtpRaXO3
 twL+J08IXrSKI7bixsBIyaO8QBrfwdNGWJwU2lX8H2IiJ5O9r8OJFZ8JTU9FqY8cuOIqWY/o8Os
 CKE5tmz7MfwhNjjIAeawgPr0Do5fzSKlPvXoIWHx+4QLi4VIJiin5mmCiqtfGZKcP2JaiS1Wxme
 NIQfx7I6aCnEnBY/arLlWrnOt7QaRrGRePRHap6CXRr55CxK/O4b698r6rZR0Yxb7aVCKFBtR+y
 tCkSi05XOjx44ME805Iwsg0N/Swmf9ORZqxCn3B0dzUdgWQVmAlRtXSXDuee697E61t1mMaqNsV
 SJoawzp8r5FeeDJLbBLUbdBSavl+YiFjsEJ8CXvF+6yeZlJeDqWxfIZg92eTWx4enU4n/eFpnaC
 eH6eCX+sLM3kb0xtUkwYPA2g6d4U9NlqY4JcHexniBU+TVTHyhbZNHn0NJ1kN6Wmhhzk3n6BK8b
 hn5oFmCFFmxbvOHc8ATEjA==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C4F0A4C6ABC;
 Sun, 25 Oct 2026 23:08:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NF-000000001fP-0jCY;
 Sun, 25 Oct 2026 22:07:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Sun, 25 Oct 2026 23:07:21 +0100
Message-ID: <20261025220723.1332924-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 32/34] package/docker-engine: bump version to
 29.9.2
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://docs.docker.com/engine/release-notes/29/#2982
https://docs.docker.com/engine/release-notes/29/#2990
https://docs.docker.com/engine/release-notes/29/#2991
https://docs.docker.com/engine/release-notes/29/#2992

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 99e33dddce..6a4931a648 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  94be9d6940b613676335fc494e617b4acf98676435b3744f32649ed72114bd58  docker-engine-29.8.1-go2.tar.gz
+sha256  d7ce182528eb4c182f3884a7a83b7652ffcbc59b21d3d302050564ff949a9689  docker-engine-29.9.2-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c23cf2358a..c6edbaf6db 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 29.8.1
+DOCKER_ENGINE_VERSION = 29.9.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,docker-v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
