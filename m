Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CEB606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z5fwy2hE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RF03F7bz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A68608D6;
	Fri,  6 Nov 2026 19:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXs4X95f6tsW; Fri,  6 Nov 2026 19:15:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CBB2B608D1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992556;
	b=gxhqyI5mYQngeIu10xm2sWF/+Mf4bdsaBDlp9y1eky+C1mmZ8y/+qowhPooDMZ+6ysbn
	 TfqyXdMgyo1W1Y8bhUXLEW0nVqtH220NTZM0jwJqj/5hg4tyihkbnQwFt8Au9523zVCnr
	 5gyuF0CRXG21l/XKpBJwRb1Ksx+KBpA2ve6ou5LwqW6sqdiNhTsK3oA/s767GCdiCrd7a
	 mivbYZSXtQQhrUrOVJd8GLwkewl6Gvk2CLBQg4zvSlVQBY3VNPopiFF+RkrDwDnrGppO4
	 g2s07A6DrN/ZbjETYtKDRGNSXyJwI15ea4diRiUGc2oXIR3a7dmVWTeB0PIqs6DYFoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LXF6Nk4+wLba1+/Lis5dHqXFIQ6A8EGXBY74vN6Eh0M=;
	b=QJ8JYz3FuXT2zP1PHZkNvFQ9+zhaIMVQFSsMsDsDJUBqOFi8MnnU1vVN7Qny/xmCcMBX
	 FrJENEtPpDj1Phfn6GhHzaD2MQksZJFbvggB6ewdSigEuXRuSsU13grjmWESQXoQ8jLI0
	 3I+0AlH1hz8dxN+Y/HqDaEUSKq+Tv6gBHeYoucdblIGCs4ydF7Zg6e/uPl8uUJbbulUR8
	 mYYb+n8njRObiNhhGYCIWDb2bIyweRpOAMajH+/ZKmm8cr0K0LZtwu0DUHnlyM2PsgJje
	 Rs0uHGrP7pFcYAqy2PnGGOJWsrXHL2mJuVqtd9IslB/DsvbK02K5miboVxLOP7cSztA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RF03F7bz;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992555;
	bh=LXF6Nk4+wLba1+/Lis5dHqXFIQ6A8EGXBY74vN6Eh0M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Z5fwy2hEE4MR1uwtD//6+RSWHw8uuFEiS7z9KgWcHcDKcWYAtkMjj5rHZyaov21Do
	 BZNVIzGW0oLGYtvkDOUIrVUbh74UMcHE/mYYuZffk6Rui58ZutzWMgsZzRcJkIim2C
	 cP1bWt8XcRZDFcKWQG4ICzxwodK3B45cjUi4V9bgHT3nOSgbJYHIBvWyktz2Vfi2Yf
	 +HKS2fYBubqoCivj1O5LpA6LKQi1CJjDLrg80Xc3jzQ78I7tBcs79zdfFyeT2NDG8w
	 vXDzdBwW02PoBE7Ynfc6bhq+yAX+R+fKSSth/au2TOSD+5EyxyJ69+RCI0kFJDFUm3
	 Vv3btt3RIbUdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB2B608D1;
	Fri,  6 Nov 2026 19:15:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82C564B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E0B608A5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovgxqWZmpQz3 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:15:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8353A60744
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=RF03F7bz
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8353A60744
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:52 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-843b6f8e2c7so1189682a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992551; x=1794597351; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WurHxBh71pi6yl2ZegjtwX/yKMBwSVgKutyeZ/DEKLk=;
 b=RF03F7bzp+nYd1fCkC1WTGJTTBZEJuO1cyI3Qzv8gIW9VPXE5TH5HvAiGv9iunLtKO
 fqx3ja4URHxHtQKO3mVXpgtgZrPKvqMHMmMojgI+x5qumkZl24vU1yZ75RJEPcduTFuQ
 oCwA2me/HCtEd70zqKzIXL2zeKG+ZVFLjTDVFGUULlkTZStUJ7HkUA06F+G3cqzQBki7
 9FaqY/sbPI0LFuHQkIG6PZeEkz4xqT4lz3uN/XbzAv13fuNa+lzsAutmD2EudouPH9uV
 4ULgafO5q0ZPoeDMokuW+QyV4a/QH1izAKxiJIsldkEFW+03LOrxJnPm/CmiFYkqYKuw
 6Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992551; x=1794597351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WurHxBh71pi6yl2ZegjtwX/yKMBwSVgKutyeZ/DEKLk=;
 b=O7iganEko4dLiNedKvC8K8baZhIaVVRV5F1bplhKDlMu9TXVx48r6VyuBCF/De5LGg
 cTFlk/FFOz1aAQ8ZBhkzqGzlefTr41vv9OPrpriGExxx9jZxReZFXut+KA4rB5iEpAxA
 MrgPedLzpLNLxiW6yP5Y2Dh0sn1kg8WRfLbIzwfF2ZMfGmnNCwdWFTrZXiUfmzmZwJi/
 S44FHRKzjh5KPTcFPkjEb+iszISicfIKyV7X57Ku5/8bXL+UNesBUUDjwFDTYnQwU9Ak
 TLhBq5JDjvcOzPkOfxcWkgmx2xdwVaCGQwAgC4rjdmON0ejBs/U3YInW/0dPDwT4zhEt
 vKYA==
X-Gm-Message-State: APuU4Z/nPHLI0ZVlN1uecdkz1Gjw2oLCbu3UMwb1uCyeVX0jvKZo4Xlm
 uC70/us/Ky8HbrLm1lxYArUBSTnKHa9Gd4mCOBPJFOPysOoVGHjTNu3iHcP1Zw==
X-Gm-Gg: AYBFou1YuLG8kTO+GyZGY8+/E/XZo5vJ4oBK6RjhvZSJzpCZ00APB6PHx9bsr+Ak+FP
 Vm7hHUoRjcH6VC2rbxfezPmaNYg+hIhJLRwWjS1nZbYgJttec9NZtRh72oXiNheZLGXCBowSSy9
 G7+bDw29wxpFnUtQI1m6XuLQbFhbHceMAAbejU+NhCNJPfL4GskhDS+wj9X/L3tYE2XnQ0D3v/5
 qhL5jFJiHVB7TZERyP+oBZxLjcCOTN82H1T5RWaiBYkfZEMa2H8fkB/TINpTsTfqz38iI21aLmu
 3njsfRHEvDXbhP8J4+6GyF/8AANwdNFb6hwJZXLBkimkOn/lKisEa19rfAs8KzWKc5tYNuQm2A4
 au7eHZHtpBcHZ84CRjfJ/zREBSPY4MYrT4uwZieipK/FVnClJEpxuCdG2b/+FIybM3gvF3U3QXS
 PC30zAa3wthV34xxgNZbo8/jqOI5gcOgLMvFj0/heCFb5hDXxoIpQx7ZcQLujcC78GUDhqbG1GS
 i2bIviQVV7cGnEJr8QQAsPPQsrcP7OnT5AY6hMNDvlzlyi3T/z5WrBVpKT3K/Ev0HL/M3kHL0XH
 Cyf1LtIxfLS2CizW0hcj8tdmlctOBx+EXIjh3bcV+GKSv5SvwSmwrjNVlAzLgHCebWn2rb0FfvM
 esl/yd13L+PowpSN9IIN+Ck50mUDJdHqiWllpLdn+knDJZdAzrcWGWTVKcQtwQ1ZYteWcACHTf2
 JdfXsVCXXIZV7YFuqrXeZ1wThD1WMiCip6OTbAGFd4h4lbf+p+bILzylMkpMv/nGVFeb8fOJNXa
 g==
X-Received: by 2002:a05:6830:4c0e:b0:846:7d51:d9d7 with SMTP id
 46e09a7af769-85f1d18bb98mr3073560a34.28.1793992551181; 
 Fri, 06 Nov 2026 11:15:51 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:15:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:29 -0700
Message-ID: <20261106191536.2120153-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-boto3: bump to version 1.43.125
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
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
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 6c79ec9e4b..cb5ffa1f5e 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  7d86080792fe50286be0312f32c26305  boto3-1.43.123.tar.gz
-sha256  055fabb990c5d2f31fce4ca569255bd640cdd11a3ca68c9ecad35f4f8a5b83b5  boto3-1.43.123.tar.gz
+md5  194ff46fe8616fbf7d0c5e96baa75a0b  boto3-1.43.125.tar.gz
+sha256  5a635a0fbbd51f319e465b809cf043668705defbb9dddaf26ae66747f70b2a49  boto3-1.43.125.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index f4ff81d9e2..3bd4b8728c 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.123
+PYTHON_BOTO3_VERSION = 1.43.125
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/fc/8a/64b46f075149f9160da44aa7e1052dd18431b9ad4435beb0cfb02cc48624
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/f2/c2/9285c749ca49c213ad90aa239884d0c5cbbdc58f02c4c44bcc4a3bf59023
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
