Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC306606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NtEUvhDG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5ECE8174D;
	Sat, 24 Oct 2026 16:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elmd7swwSrdo; Sat, 24 Oct 2026 16:49:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C3BEC81705
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792860557;
	b=aeSatzTROzA+YJg4Xz5L/cs7H3HpBiKLB/FwKMxooiS1kHI/DtZvc72St5rXN4JTckA3
	 C8opcLL09mZvKB7jY5CbNzq5dHYA5ScgaLkeH94+ackBPTECIxHZt5IKEljtlzCgFt+Yj
	 InhYMG1qW/S4//UOL85zzttNyplQX+0YuwcGTGtexRoNpqP4GsTkgzI+DgCv5S+xM7gKs
	 QRiYD8v3NNk7dZPjAMU4OF+t8FqROJ84I3gv2HfBHFuE6vt5Oox32fUmRTBGiRMc0xBpF
	 0azJHNChZkiQq5+Sl2sA5wt4ErNSigx1c4AvIrYXUUgtXkO/5dOtqhpiicarMDIDx/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792860557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hNvf67sqJzxSNw2igWkT4QrG3LhMTiah7g67bVLNbV0=;
	b=OZy5RPMlF0uUHaYQjbIgDJaN9FOH2hhCvmDHGh92kPhabTH6hLbaYi99gQ9uZor8X3uj
	 XD0F1NmJp3hZUSuxBWmDdWihDdcBQNBivMAuktka3/MyxNUkq9Ds2jm+dnCr2fyBf7pII
	 E3IzIBP0RSOb+6/2JMRPnVmAwOluk+0Q7kQQglKTrstpBdFZCrip6nVbir2atsdk+0nDi
	 y6IIW7vQA92EXsbfrSu/ZwD6liWvlSxmfU1IHQbtWX/iveNYsKczRCd7Z/XAyIBTlUlql
	 D5LZy/1rlydQk5Z8yYjJl3WUHnULUGmCYP1lo9lUDoR0pz5TOQSm+i2TPvjUsT58msA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792860557;
	bh=hNvf67sqJzxSNw2igWkT4QrG3LhMTiah7g67bVLNbV0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NtEUvhDGvDnFprI1D1/t5O3cmw5QadBVYTyeeO89049p8laSFc7zR01nRkMTJF2in
	 EU6Zo6lZKff9Y3ExE76GrVskKM7NjKXNQuFKrXNhDwPr22iB4eiTkhJU3j2+nk+BkP
	 1aLglquCqMxCtnUvzqDyuASXwT3htbtbeev4znybvpJzZLjLUXFlt3jcY1HT6vIxny
	 RJSY8qAabs28Wy4M53S/DZSCEI7batbn6Pa3qxhSmJg9mcAoF7EwHWmMPUYpkEI4Pa
	 CebC1GVUfWjT3TWwR7VG4AWvt0Pj38Jfm9rOYf0fUdJ6aAvFuZm8Z5zWzwdUlpLWSo
	 /RWBesJSzvhzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3BEC81705;
	Sat, 24 Oct 2026 16:49:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 130164D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 16:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0459381705
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 16:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzYbSHLsU8ml for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 16:49:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F2ADA816F8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792860555;
 b=K0Azt6TeS7KOgeTthRC4zaIdpyv4ht1AB3R5hN3kHuOoxc/7Z/tWgQuKNultGDBg6GRr
 4iFXWlkub37h8bxzTOw+NjTOJJTctpDlmdm90S0Pvl7DI/VOIy3e44RR9vIXnGWu4zHOS
 baqw6I/8Sv1AW1n0bNXaHZz1Di34ogmHpdIVcp3bENfI1EVNPTMX4Bzdd19V5BCSvgChy
 VZh/Fea0muHYVV+BdGhT8rReVZJvrPILF15SmwjMlEvz/Y8SrqThwCEMOKa8eTo3f/T/w
 jEF/MT2BaOZ9H+vbjdDf5h2AGZ4qtoSwoLfEv60I5y1REu1tkihhEcYJYlAP3OiSk2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792860555;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=u4rhKpk/yoJaXaRw4350EE5kA6Iu3MqBhH2UErdoDaU=;
 b=ac2t01Yau/hpjrpvgqq+ych2t9abwvkgD7usnTNFEI+S8zu1pOz1N6WmXJCfUHRPGCKE
 HYKQ0UxxRRZBm5I+3iKdhY60IlQEpio/bAjvk5NUBDtA8EbkTxnI1COcPyVG5DEq3oAdR
 kLHZyH8I276yNOFa+TYTstDjxKVQA0JO5fEEpmvi5IaRoGBqG9h0KckYmVhtan/NZ6roE
 pf/7uYa5sjxL1DXYSQadApKRl1ZH339kVe43Pz0n/6tlOaTMI185f0Hfk+HexWQkGh/63
 CembsSe+/bIR2gwnfRLnCYgIY8DBx/0tSsZgfHDhpTPTpEHLvmvNRav0ANpOslrQJCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 arc=none smtp.remote-ip=209.85.128.47
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.47;
 helo=mail-wm1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2ADA816F8
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 16:49:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so2877475e9.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 09:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792860551; x=1793465351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u4rhKpk/yoJaXaRw4350EE5kA6Iu3MqBhH2UErdoDaU=;
 b=LC4nOPs+V/EtMSgeux3v3XLZYdDp3a3RlJ9ZlbeL5W7ynXMy90oP87MUKzci728/E3
 KGntF2gDE9EfHQlEU98Kj0fhPayIVJZ4LZSX1zy0bCKiszqRu3P5BQqUIKt6ZoRXODYU
 XTe0uaOmB1BCIG3qggnOOAPCdscb3yZ3E/fKwIiK2L6RKkCPkMWYPirQbXgHJJR+/4fI
 woSB6J+RH8eZZjyymp1K4mJif25whundmme5Kgpc8c18+GPGS7bzKp0EQrjOOZ5eCrxU
 dZmyC0G982Wa2PXgcUQ/Mn52N/fh7Zl7HzuSKf2msI8fjL7/SnI9aLdPqty61GPvDhrY
 MeFA==
X-Gm-Message-State: AFq9FYKL7b9KLjU1TtWsjlWwpy4zr8eo92mTWWot5y/9MH3kMmJ4RFSS
 cOdm4sbbP+B/AZJzWZCJnHrvsu+oOfv3eaaTuHgRvWPPR3YYwTMT91ixlp6qqw==
X-Gm-Gg: AYBFou1o5wJG2f10vAhUtSv1Nt5M4tzfNUIi8twbVpH7vAQgtubSQFoo7heeDSARwsw
 GAQMxpagW/fe2IQsihWZ7HSRq8/dme8BAew87g7j0lQFQThcaWFLfsocDmb9RBtjnUuNgr17l2R
 dbL3AEsBin09L9UUiwuklUuzdh1wvm07s4OsC95fBcEFf7fb+s7gedG6wzLRvHfVok6+Yi+Ibck
 LV56SmBsiJsasY0M7q46BMV3wuFjshxsE9SZehyatx69+A6hctccI3Une+IVLxgDCFD1vR0/tGD
 OOtD9XfL3obnfaDj8BSljYHvDscDNJqJim39BWhwACb6VyS15/PEA2b4PPs/6zHp+FyQ9nEv0e/
 2kcNARXokCVxFsWYQqOUu12nj9lE1Im5HlVlsVUX6HJErv7WlcQiDW9hxHjeOpTyE9uM6DX/axd
 pxyWN0kNcTlwgkGklPAximaLIPr6l68KArVBQGKB+07V1csJg5+RcgcC6Bs5/T7Qh+wB3tbnTj1
 10bott9WXJMAi1+iPp3l1rQDjCUW5v+g0Ba9yw3UT1VBlz78JAYf7Pba1wTBZi+VqWWuLTYdeqG
 fw3u+xXG8866cOITxMSDmGsqDdnh0NVMLY90Y2U9QyKMetPLqi1C3zZ5s3bN/uxJq/WnsUdQf+a
 BwOQfNjq5k68wGQ==
X-Received: by 2002:a05:600c:4e87:b0:49f:c199:e1e2 with SMTP id
 5b1f17b1804b1-4a35acbea9amr44979665e9.28.1792860551021; 
 Sat, 24 Oct 2026 09:49:11 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb5f:fa00:a625:9f0:b064:c303])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb8d5sm5504729f8f.28.2026.10.24.09.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 09:49:10 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 24 Oct 2026 18:49:05 +0200
Message-ID: <20261024164906.3150226-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1] package/msgpack-c: bump to version 7.0.2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes since 6.1.0:
- 7.0.0: raise the minimum CMake version (3.5-4.0 policy range).
- 7.0.1: set INSTALL_INTERFACE to CMAKE_INSTALL_INCLUDEDIR.
- 7.0.2: fix integer overflow in msgpack_unpacker_expand_buffer().

Switch to the upstream release tarball, as upstream now publishes its
sha256 on the release page.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/msgpack-c/msgpack-c.hash | 3 ++-
 package/msgpack-c/msgpack-c.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/msgpack-c/msgpack-c.hash b/package/msgpack-c/msgpack-c.hash
index e4fe61f4245..da32bdf27cd 100644
--- a/package/msgpack-c/msgpack-c.hash
+++ b/package/msgpack-c/msgpack-c.hash
@@ -1,4 +1,5 @@
+# From https://github.com/msgpack/msgpack-c/releases/tag/c-7.0.2
+sha256  6ae50f69612871aa01de76bec904165cd2a2fc30ff9f653f2f60a663c5c1a86c  msgpack-c-7.0.2.tar.gz
 # Locally computed:
-sha256  c23c4070dbe01f46044bf70c5349f29453d655935b6dc710714c008bca0825a7  msgpack-c-6.1.0.tar.gz
 sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack-c/msgpack-c.mk b/package/msgpack-c/msgpack-c.mk
index f12dcb085f4..e611aa9648d 100644
--- a/package/msgpack-c/msgpack-c.mk
+++ b/package/msgpack-c/msgpack-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MSGPACK_C_VERSION = 6.1.0
-MSGPACK_C_SITE = $(call github,msgpack,msgpack-c,c-$(MSGPACK_C_VERSION))
+MSGPACK_C_VERSION = 7.0.2
+MSGPACK_C_SITE = https://github.com/msgpack/msgpack-c/releases/download/c-$(MSGPACK_C_VERSION)
 MSGPACK_C_LICENSE = BSL-1.0
 MSGPACK_C_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_C_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
