Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA4606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VIiHCO0Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L94LvyBF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB9B780C46;
	Thu, 26 Nov 2026 07:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5SZeiPbDBLz; Thu, 26 Nov 2026 07:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 09BCB80CA6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795677252;
	b=IpDQ/fpJPrcGsVdQX/AjBXGwudg5CdbESx8j9mky1oaAyB46LA7kEEN+NRNSuGWBAv9w
	 eZCBcMnP7zDAWXT1GQHNDD847CxfBLY4fzvsMJTW3V68KU2A6T5lgurojgSt/lYvTqbyF
	 hlT44wtJx9vOyNzGYTUAU5pKBhHGe2aM6ktcsU7+I9obazjmBWFAx0Zjb1InBy8K/0CGN
	 C9LWuGBHWllMGehm4s3HaOeFmyDz6erG2zI83nco2fmeGNk6jvXsBqd7GkJeF5S24ncXl
	 MYeg6hu8I6dSI18Ww78S7cwmSaRsME8jzlRJPS4jLb5WXfGXCzn5zS3ttY2ta0Du2BA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795677252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AHYFoQEIe+qvlZtH9cGmjPtlxnNgTQiKufJ/pHtzrAY=;
	b=alBqXaPdJwvV8FTPu+Gw8Gymh4vTeUQLFjDZHVawhsD4bSFy8nYKCqh/fEl79f/kRx6b
	 2itcrLNsBA80h5zE5aE3JMoXPIqTwJU4kdCjTH9D59XofiHWWCs78RL1y60EuR+k19kRp
	 7y+kD0ZaqczHG0c8xdFHul6gmTGfqBvUUIhQtXlQ69yHAlZrd41tiPHSd4ijSwgOBZX2U
	 p08KUg0YOXlk+yaf1f0hfsnXu6F01rwVgXlx4SHAyG3G1ZXIhCUvpYliXXmqeSNPyeUrR
	 IQzFnxOgesc08O/cckiK5LT3Q9PlfP1yECobWb7lsfYm97DWA0P4ZNwsq2zxSf+N5/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L94LvyBF;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795677252;
	bh=AHYFoQEIe+qvlZtH9cGmjPtlxnNgTQiKufJ/pHtzrAY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VIiHCO0Z7/MVyOkSSQpzgXdBNVMpHJ3zcL0qUBXv8ISii1vpqZS+bHPupp9mvriqE
	 6ZIVt1XRFJcRdm024mr9J8DfiaDXO/i44GhT0POc1ZVasEKDjwHM70kBsKX7PJ69od
	 WfnSsje6suoYeiSOBpLnBmLgrSwAaGXD8NArUTCl0S7zmfaO+PWUkll6QKEzXlZu34
	 ldouc/TDPcPaVOh4FUMkC+O/mzWHCOWA80StPTTi6laoUyiTAU2/a31Jd7p3+sSKPT
	 urEG3SGJOCrLuyaZvwWDO2JRF43CI02EnWQ+RM/F5Q4t7fUKNco/UeQ9qiWAH7JAn+
	 KNzPkqz7+xciw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09BCB80CA6;
	Thu, 26 Nov 2026 07:14:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2926D1C9
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 07:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19DD980CA6
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 07:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qdk3MJjDGkcD for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 07:14:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 21FE080C46
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1233"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1233; helo=mail-dl1-x1233.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=L94LvyBF
Received: from mail-dl1-x1233.google.com (mail-dl1-x1233.google.com
 [IPv6:2607:f8b0:4864:20::1233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21FE080C46
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 07:14:08 +0000 (UTC)
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-1a2af4c8d00so6046337c88.0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 23:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795677248; x=1796282048; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AwO8BRvYXWf6jbnqc3Ea2hXAa4A0VaxHA3vp92ILi6w=;
 b=L94LvyBFa/cjUlkMnbPaZKBOV3gQxUUrg0ZkgRts+FQm5DDByOYL5d/9oYcmkeQfXO
 ZfNYTtNQbwLItB5OReBc9DF//NIQCoY1tKuaByyB9RK3XO854Xh1G3/XPbCWbe7cq4Jq
 AvrYUkLJkevarlxpbl9Z8ZF7vQDLn37F5m+jnThr7G3SYtXrQRuAEQLlxgkWVjsbhRN7
 2Bcjh+Y+G5ICwjhGG+KM5yZNGO6LiigdHXVU536RL95rtoS/mpjg7A0PK0z4DNNZ4mg5
 BazVkaQRcN9gbqLW9aqS4QKWKJsigKDyyzFPzSqp0HXQtREAFtdK0vEoNf2ptVOn57UJ
 oL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795677248; x=1796282048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AwO8BRvYXWf6jbnqc3Ea2hXAa4A0VaxHA3vp92ILi6w=;
 b=StAwi8UMGt8Ee9qxhrzfd2d/Qa8re/7GVLC4G53ToTRJ1a2BSau/aKMBk7U5HbUVCJ
 pRLUNL5YADI6eYdrgkFXcKjC4uFa5nD+f4AFTAyYsLEKV6uutDy1GwHy2VXqElZRmt4q
 F7jj4yo4+i6dGQifSI1HfJn3/RLNOK0I9GpkdunDHDD/zfd5AlFQCnrAx7bhae/pPNq2
 vpjHN8H75r+4WJyOEqiwwVZ3FLy2OuxOnUXEQC+QKysJRUrhRfmKeYMX53hdcWqCzlB1
 yv6v7fR4387huUtRlYrIcQyTZLkC2hmSNh0af9u9oVX67oS6zkfI+ZZ6AoH50+6GSGYf
 uz2A==
X-Gm-Message-State: APuU4Z9XoWrOJPu5wMC1+OJUB2r7mCMP+dsxbaqG/LMAUOHL1M8N9IHd
 WRNSarW6EGjDMmZs3yptAJPbBs79yaWUzgvOzjZCWyBB9BrgvQKJn6Y8h3aauw==
X-Gm-Gg: AZFdTZewVtfI+CSK8oaJoC3f4KFxkQNPvLIqOslqClR/QuZpQT2DzXBKXLTaE5Ap+Nl
 n/pQMp7SIW3TYmf+17NzBvwkjCRMJ61hXsw2reGDSQtAwOMxLVE6J6YV+CrmL9dxcqA0StTwrzj
 /Q4SUhu7trrGb7gEgl8XjFpGMlVstNBKzjYvIXiEIKIgMnAk8XO45lBmiOzpvvA7ETw8BCORIHB
 3rAl2JPhlB5pitL3K0QCX3JTWdZYmVNYUemzm1dcoBcqafBEyfNMu0EEor+uM99KZV7n5qdrqfd
 2S9zbFJHi4yMMgXejj2cNK0Af+OPWftu263AtIQvXjaHIlP0/Bs9Wxjq419s3EHjOomzg8ycbrE
 k7iZr+tf6f16q1sbRXqeJSFWCtfY43KEwsn1Yv7iXT/6u7EfSdsblzqMy6LVW0n/t74xbWU7kc8
 xp4tXiE5KToQtckkn/7K8FCcbY3XlgBuak971a4G2NPBHdZ82iMqrf2ylsDOGOZWF8cMKXkZw5q
 3t3kHDVd9wvX9vowwezQXsCiqQQgkwteRrxArs8iwKvyAZEDXsM+KAJ7kh+6BCkwl8VQ2j6R9LO
 LOhx8J5RxxWEWGOD/CVQH+OJ+/AsDw0rFpwsWTsA6xAgeulovNU1yx2AzWfAprnFxQqpjBHwvV3
 EGUQ00+MlPw==
X-Received: by 2002:a05:7022:171c:b0:1b3:bdd9:cc6d with SMTP id
 a92af1059eb24-1b5568fcd74mr18886855c88.32.1795677247784; 
 Wed, 25 Nov 2026 23:14:07 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e4:2045:e80e:4a6e:5538:6cfb:9bf5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b5569bffd2sm43939636c88.0.2026.11.25.23.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 23:14:07 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 26 Nov 2026 12:44:01 +0530
Message-ID: <20261126071402.151487-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pv: bump to version 1.12.7
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For change log, see:
https://codeberg.org/ivarch/pv/src/tag/v1.12.7/docs/NEWS.md

Tested using:
 utils/test-pkg -p pv
 (Result: 6 builds, 1 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/pv/pv.hash | 2 +-
 package/pv/pv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 4ddce35f89..4fb75bbd43 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
 # using key: D8FF44A79CC8A61EF694FA7EB883E01314DA8E84
 # from: https://codeberg.org/a-j-wood.gpg
-sha256  ab21b4f8662280646b6a02e1b9f096790918f89c952bbe0d06fef75d3b52fb15  pv-1.10.5.tar.gz
+sha256  5326ed7ee95ef18039390c0b17891ac28985ac7c7a4235070fab767c1fe37bd8  pv-1.12.7.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index efe305cf6e..242a4c84c3 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.10.5
+PV_VERSION = 1.12.7
 PV_SITE = https://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
