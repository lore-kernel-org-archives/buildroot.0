Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E2606A321
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D39bty4D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sqlf2q6o
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 638D5608C4;
	Fri, 27 Nov 2026 15:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4yujVW9WNYO; Fri, 27 Nov 2026 15:07:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 90E78607BC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792045;
	b=UIlVmUSkEKSSJ4S3nUJjsB50k6g1E2/Hw4nRY1B6AQ7Kq6ioeQdvrDraoNDQ6wG8dKVT
	 xS+Bhh9njPd8ecoNL36k2RlNXC0dFJhsYdt/HJFdNoyHrW7TMwkHTpuKdYpLflHJU2JI6
	 E4BjIJikxKnLfF3k0ylQi0FOrV5Yx7zdImP38nelX2ZbaeCZC8s9qRRZDF5vTZ3UJxKYW
	 2cJd8sC0gE0wC31f95/LpEfIImq7p0xIM+FHRB8hjcouftqvw2zFcqLPVL05lFD7+64hH
	 wp5tvcXH0PMGbWid6GhxnN25klMmhuswItlxPIW2ebRpebJYYL5yyb5l7SPw3YXIH4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5zi7iO0JraThBjkZyceYohoT5XPMKGwKYp/UPSgZkSo=;
	b=OC48hfGBiuuYxS2wI9PPUktZe0p1BzJC/ZFOD9SDBGkkmm3nczRuT7MaZwXleklAhldW
	 AIaNX6/96R9BR+QkHieWeHL0QhiD5TTQqMx+Pws3VvujilalStx3ZkN+egu5kMsOYPSxm
	 NZ9VgN0od/R4bazUqXQq87fVojJ/dLaNSUTpQh1wFjhpPvURA8SN9bzsVUrVslrgDsX2p
	 tZ6DF/tiXz8pMq8Uc5QFtTIDQ5RQpr3/e0gaRDytvMagDqNPImJo8Brj+l/uXcLcinEDe
	 fj/vTz2nLA1B/NCPqX/4phrb80t+2lHGcrO8rJGIhIPYn7sZB4WpQFi7DMP2R9RlOCA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sqlf2q6o;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792045;
	bh=5zi7iO0JraThBjkZyceYohoT5XPMKGwKYp/UPSgZkSo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D39bty4De5M4eReZr49SmXZWmIY+Q0RivCYgI4htd8N1589fwSqxyG3yAifB+pqdw
	 pKzpSg6VOEv3A+a334adrZa3DxaBonRzocf0EhL13dvZYXmkSNbGALxX1QkrY+rhTQ
	 GZfcPx6d7e63tCKxisIVvNwFMM4yP7xYBWHQB9CQ6cHixwR1FX73pWsdrsiRX/BIvt
	 QnmcKL1B03xcxx1jTZueRsKvBrkDAZ5iO5Wo5x6CCw+Wc5BHVdz/k2nVwzx/Pzqma3
	 iHoirOpBZL20dYdA03wTAw7+aRk85plyqObOTbTF/gRdlPaQMr+4PWzIWGl3qhRRrZ
	 9QcNag/BWcoUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E78607BC;
	Fri, 27 Nov 2026 15:07:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3A69373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A552B607BC
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4IBSPo2noZV for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:07:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 17557607B0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1232"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1232; helo=mail-dl1-x1232.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Sqlf2q6o
Received: from mail-dl1-x1232.google.com (mail-dl1-x1232.google.com
 [IPv6:2607:f8b0:4864:20::1232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17557607B0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:07:23 +0000 (UTC)
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-1b563e32936so4110733c88.1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 07:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795792043; x=1796396843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HkCwCT9Q7rJXvu6s28Nrb5KQzByFvudM2fkoZS7CgbM=;
 b=Sqlf2q6oW6otNOR88ZZC4FaDlKgvEaTNk+bXed2sLY9XTMLfK0UCVlXueoKMHASi6m
 LnaAExzBo7/ZU07HIpu+TmeT2k98Al3cQNtbSRSCYNPnfP0vu3IW0tQYoNA4/l86S5ZR
 KwsSTu8YvxoX9l2GG9O5T5SRfi8UuIOGWM3b5Z7cZ1d9UZIYWJg072GSTx4elQuQ7LNX
 sk1/dODj6GhN0YMcKmaGQ0W8ttlgwsuYEktOgUxck+ArBbnplbPhdbmVvzP2uO+XYGDt
 54owuOIzqCq6G5gL0uvKRAiir5FniyZl1dW22N5AsQlZELuDGVEfAkCcLP82MGshL0rB
 BaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795792043; x=1796396843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HkCwCT9Q7rJXvu6s28Nrb5KQzByFvudM2fkoZS7CgbM=;
 b=yaH6FkwLoTwCbxEk2xz8cetVRlYAeD+89L917kM25QmQKQpOom1I9ZQEa9iXsDcDkc
 vFSMb2LqQ2vmipQql4AHp5LxHZewUCxOuOxdZ0tXvV38spBN+PSUX3rCQ2boKQSi40xD
 P+//d7fgS2uM6MyNW1LHqdnLTioZpf08qYRUM2qPnr+mYQIC65FmlD0u3Fuuhft0imqx
 NSBWHXnAgQu54baGmF/oWEjhcb8X5vuuywhBIf8Ap+mM6/YCPv3rstOIZaLydNwMsvxb
 TV96DY93+s1wvJV+8yShAhIKtKk/qdosAOFb72tVt/qO29p9fIxkdzaNP18hrbI7wS6U
 A55A==
X-Gm-Message-State: APuU4Z92BzGzddaML9ETwyskNlGGLx4WqrC2vqZX4NvEf6ncFIwaQGdc
 pA3xiAIR5IgQpGppnPrmAhurg0tKJtBvJvBBfsYJa1kEBNU9/38CfR7rz6GMKg==
X-Gm-Gg: AZFdTZeLdAy2YPYtf7ZpCgRfqgY/oq1uMD2wJUBH+ZsDbM/H/kxDYrGUHc+mk076pbh
 aEe8uBuo3uwlKuHi5PRbKZ0n5CB5FBJKxyKPy6ND4/MFLjt5atBKnO8mllrD697sMdFR8XvrF1V
 v3g1hXiRFmlu5/YFZb/W+3vwpvvy2YnmRfSx7JRYMTlvc3U9LzcNKuzYdIMFOTl3YYVXcVxpaLa
 WF8BZ0z3UKIBxYNxvW4WHz4TZ/95ZBEBRzsYvJEruiHEIXzHUoey2VrTUsLVv/RyuNy6nZJmko3
 auYXnnOuS+ZApVwe1P28G+8bAF7I39q3Ma3Fyd8EdspUKbbDi6xmuAjpNXHcHwsjWHCG6Eg7luG
 oGLHkOMba6Z/ZY2VjZLCuVB0/o6SF9Et5bHtdWId+P8uDCp56QWBq1bSVwhDL+nW9MOQKqd2COt
 1q9Ii4r5zIVYCgh9DOJUOBszQzc6I8xIVZGMv6oF80u4imXhaScvVl/cYF3XpCS4DqiBS1hF7BH
 Oc1z5oOoSQPekOROz63gwM1lZ1/17ZL9ALChPSp1M7XSSogVH0xPXs+hLOxDK0TAf6Bhq0gpXMn
 yZHCmLhoHX7FzJv2P27nGu8AZk94JGGIm7Oawi9UCR7TWOc45kqEjAch5NE=
X-Received: by 2002:a05:7022:ea8d:b0:163:c5eb:d42f with SMTP id
 a92af1059eb24-1b5567c02b5mr23567981c88.5.1795792041768; 
 Fri, 27 Nov 2026 07:07:21 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:9a:8d55:be15:fb2f:b58:26f1])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b562a82b3fsm69503836c88.5.2026.11.27.07.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 07:07:21 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 27 Nov 2026 20:37:14 +0530
Message-ID: <20261127150716.2258686-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: merge duplicate Shubham Chakraborty
 entries
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 8ddf1d864770 ("package/zstd: add pzstd support") accidentally
appended a second Shubham Chakraborty block with package/zstd/ at the
end of the file instead of placing it in the existing block.

Move package/zstd/ into the existing Shubham Chakraborty entry in
alphabetical order and drop the duplicate trailing block.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26b..f4b5ae5fad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3128,6 +3128,7 @@ F:	package/pv/
 F:	package/screenfetch/
 F:	package/unrar/
 F:	package/xterm/
+F:	package/zstd/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
@@ -3690,6 +3691,3 @@ F:	package/tinc/
 F:	support/testing/tests/package/test_libusb_compat.py
 F:	support/testing/tests/package/test_libusb_compat/
 F:	support/testing/tests/package/test_quazip.py
-
-N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
-F:	package/zstd/
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
