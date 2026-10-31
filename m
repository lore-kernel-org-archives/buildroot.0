Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34367606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H5Db1v9z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TgukNCXG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FFBD60763;
	Sat, 31 Oct 2026 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Qi998jXqvyc; Sat, 31 Oct 2026 17:21:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECFAE607D1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467269;
	b=L4cnsCtbRh0axKrVE8qn7pOy1/iS2x0HZfalMZkLqEfUQAIksCJKE5YB58zgYopqBQec
	 SiseZF+eu8mi4fj3d497NqX2HCKW0nDwg3SUD7XQ0dQqLBTvp2/PDmDCuTQRA4IG+qBba
	 xW4XLQqP9lQFmPgqzR3fP3yt3xlIhzdVvU/IQcxjKvuctU0vWIynzSLwAUGynuf7odjt9
	 Awz96bn3ZGDYUsfBNvxg4SKb9WxPHJZuxpUHcuF2JjzbJW36UCJnyLmGaYA144/koHsXe
	 ygi+kiIwwyp1uaFwF/ODt4sXYaaiI+T46YssHxINYxDeIJYXdZYgYUQNgWvJDIPz4HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CWNGimB6H9zUgKuZd5EFHIkzZ69vxUZoQvH3ljbqgx0=;
	b=D3rqPMjMkArIoiojEW0K7Axl2vFqR0gMcZxQQQWaP7JV0lTw2RA14h3rLg0mbZY5jiKH
	 FGk4riMM/h3KU+dZ/wGf1+R3nSxQFJLWCXQXtTrwIgcBMbKNkxVqiY40bt2OXqWJW8h7b
	 gOaRkAxM9hr0kb2T9fXrXZ8xBG6A+ttYEgO5P5gA/GOdnx48cJ6oF2sZygAzO7P4X/eua
	 4vPs+NpYyuE+wZzGi96Ag9MH6PNyncIKItuLr7HAD0Zl5HSbKlvgSrqCPF0GFu+7RQ119
	 t/qkLovoAy0UxsHFvOq/3dJ9mOzg3SRUFbEphAgaA1N/zvLSnd5Biej8CX6vrOBDKfw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TgukNCXG;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467269;
	bh=CWNGimB6H9zUgKuZd5EFHIkzZ69vxUZoQvH3ljbqgx0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=H5Db1v9zpdkCmoIoSg4Z9iZLJIvMiYvJHN6kZU7nm63lYC1uPwOqGCY0P4aNlttKn
	 8iQzkwtyUEqXBuO/EDf+Hh7a/5YAzweqG1PVz/Eoe0J4koBvq+Zt/wwP3C7rVig7CA
	 lcbiCGcZEDRqztLWtmaYdv0Wr9sqKC0euvq3Zsjfevsi5C/8+bPPnzm8FkPyu2hAkg
	 bCyxR3ZEzFqEhjmrkwoFvSjZmwmpsA3bcBEaSO2GZ2TGyiVlhWohReSO8LPcBRuNVW
	 /EFcsrO27K9ofKaOiiLNX7CCZOyfYAoc3s+ciGVhwi8TsimrGINUqznVmnkVJ4r6KQ
	 fK6pPvqilW1nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECFAE607D1;
	Sat, 31 Oct 2026 17:21:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C27274E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A84606078F
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPwIRwMfpHiI for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A08E660801
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467254;
 b=qhmFDFVI3OP2yMQPuzMRIDB2xf27D6p+YI1QqztUWv96VABpaE3zbv/FcOCEFyD8KFdO
 381Bi7GjeyJAP/DRPZn76fm45D8zqjsWCAUwUzBHDVxrhkhtUIVyBo/r2/KRkcZxupDXH
 Me++FmFEp4JGlMItj7aIhj009bgYwM9pHryhpUZ1aumRQq9R4VR0czX77DNIbqGPBFM0P
 odgRsF5sgSLAWrtLZE8llWIqFThedA9npqfzV/wLZMf0qHugACBoUlDBaPfUN9AtnRu2n
 DXhDo2SPyBchkic+AnXHB4zhp+2asyhVkfuj513lP7FzY55FrpS8AxOHQhkaSf6aM4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467254;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=WWCXjmMmm3BQaglyF8uZ9gyOzdrf9tGOB4eYOBU/jIE=;
 b=DkufgJ71dyat7gkgKhXx6IR7AvaGtI1WTvm1gwJ4rpjN1W7AJ0Qei37VGmibzGECinjB
 BlURN4tj5T3qFu5ImSbiLyc9ehgFbrRxaUstoHtoABqbOJ9KM/7WeYV+ZUeKorimQ12tU
 fcrqqeeV02vwYv494bPwIy/wgPc85Qa3Xs3zEnLi2Z5iJc26+UzThBeJf79NMN9IlGVpg
 iiMzb6KaKfDJIFflmuITdxORH/jSBaxUD+mSe6bpNWaLxbzp7YKZh6Wr3ysbz0zA0Jf1v
 8v6pYk9etLxA+T/l+ULZnXuD94cNInFAIuen5wv16u3Mmy2jYBXWN54bFVCTRh8bX5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=TgukNCXG; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=TgukNCXG
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A08E660801
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:54 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7f84a55e31aso1167383a34.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467253; x=1794072053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WWCXjmMmm3BQaglyF8uZ9gyOzdrf9tGOB4eYOBU/jIE=;
 b=TgukNCXGo6U5f3io+Kk0WinRvBcdu4FLHGok6lwB4p/8dx62gDYNSCgZGwkvc6GtIp
 hi+paCeeWNFUPnsPmJGaXSU0xkAldKpB5U+9f43FEWCGbviruQ6+DdqXARmVbz4eEQLh
 /wH9pSSicmFfq2+FAz+YTDwLYawt21P5wOiiRXDEKEi9iQrXZ0lqh7mP5x5zOdZvmQL6
 j7QcEkR3xzKqpiCAWTlisa67Sm/WQHabaXftEfQXWwzlZ1ttg2TA0hrpHWAStY4sRRfD
 bT3GzGlBdKl+B3rT5GLcNsfDtcSwNbaUqwyMTQ6KGA8dIy21FbdU+8bo3qTgpR/WgYin
 60WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467253; x=1794072053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WWCXjmMmm3BQaglyF8uZ9gyOzdrf9tGOB4eYOBU/jIE=;
 b=xxudJV+7XENWIdii1qbIOvMBk7cXfrmTbMDCJ7f6TpdQx/SFvuFSc48c1V3Vu3D0xj
 jEzJMN5wzI20WHaQVcwv7UT8/BLWGF0MkafV+cMgWBvS35HGSbGaIpbn2SXv0rQDpH89
 TxpvucAIOnT/mgKNRFqD27BYsqr725AEeETJVijwJ5Sl/d0QUpe/o0Sc9rX35rHHTCFN
 PKYMibnPGrFgi/To31CvNEbfMZr04QM56YuCyS7vczLOveBxkhe1P7ZrCYSTGN0ir+yg
 sdac7o5zd2GWQ8Vu785ZAB7BOJwmMdnFTf0Nn0S3V18hf5YuBWcKi8mdnnCL1Xd3OZJ3
 2CMg==
X-Gm-Message-State: AFq9FYJtWtzeTkdE2R4iQlv5u6PTE/tloplAQVwGxk/VfwzUIjlYE+3J
 dXypRuj05ZQyLCThq58R5BUuiWOa0GH1ECHzij9Z5t3HHqUcFfiybwtjo3nHUw==
X-Gm-Gg: AYBFou2pnSn1ZWzu7V2c61xU3ZCbOXJwpo+B29zn1evJnRufolxYt0fszxAktXurGsn
 M9UeUOpmxc6zgk0YWiGwE1UoL7+TbfUGEXORt/v/YT+LtlprqViaqSYQntFPBxH7XuaOTNvHID6
 YwsmHyAf//KvvNIDLGQBQgSpPf8ZyTSFYez3gF9ejMC+ODyDqGeYcNoTJr6zA1NnBBujE3epmrw
 v/IZE8e2XC266P/6MDWeVYmSh4S0sIriHzOXKQ6L9gHY+9cIQGGK+i0Amy/Z810LkEGFrPmiR/y
 f1+SSdM40+CnrskMxKd4qxMjCWrDMwAEREdbWPXvvxV+OX8Y2cqyjH3VRU9qX2asSCJ85V5L/pw
 4gNVLj2R5KdYBkf6006eNcD5PLI2zGuGKRzDAP3ZE58RTpZyzWLhZusPxSJa37ybiTTWkwZCV07
 qG2CaMEQE1T5pP5ZnlzxhMC6BCp2E3q8FugfgDj808AO76Bws8GkBigqtiuf13HkoVcjecvqDPM
 Ekrc03B+qu+e0acW0XORDnJ5FtWd3JhSAuUqojVlPizXZpzlXO60D3FxjUBwxQNyO5/aZdXO2ey
 ua5lDjuNh82HHbpT//I6C6EhKkJxbXNHP6EV9qraTOJb6IhwkFLLvP29rOidMi+rsRSNxCWVsMI
 YJ0kbFUNQCi4gf2jLqX5g5z0a+n98Dfr0HAX+WySb8dh+kdRYeDLjI5mjv+WSks1mHjsLtYfKv1
 D9BGaBMrMFddpjd53+Dl7tXmUQT933cOZTtmgUfC/mUX0dUUaSWAB9EqEfA7VuWMtslSyOsuqF9
 n8=
X-Received: by 2002:a05:6830:34a2:b0:81e:a323:f3bc with SMTP id
 46e09a7af769-85d3652ceffmr4125770a34.13.1793467253044; 
 Sat, 31 Oct 2026 10:20:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:47 -0600
Message-ID: <20261031172019.2683287-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pytest: bump to version 9.2.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index b1cb9d8cfe..d803261d18 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  31f635913c0b1bce9438be52d44398a8  pytest-9.1.1.tar.gz
-sha256  1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d71f0ffda5fe313  pytest-9.1.1.tar.gz
+md5  5a576b1720677d76c1974ab13242416d  pytest-9.2.0.tar.gz
+sha256  97c4f3b1f3c7414aa36465e09b8220f1d03627993bd51b1282e193753c80557b  pytest-9.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 6de425cd23..ac5a538979 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 9.1.1
+PYTHON_PYTEST_VERSION = 9.2.0
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/e4/47/b9efed96c114afcfa3c9d3fe98a76a1d14c74a9e266d397cf6eb64be5e01
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/79/42/bb4641652e58dedeac2ec51abc1f8cae4fee4ec63899a0999016229a0f2a
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
