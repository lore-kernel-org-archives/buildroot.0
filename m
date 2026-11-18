Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18D5606A333
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EwpVipxS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9035F606FF;
	Wed, 18 Nov 2026 21:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlmFagV0YzqD; Wed, 18 Nov 2026 21:37:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9197C6069B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795037871;
	b=LqOLM7fPe+PZaWrbdXTcX3w3gjxyh59DEjVoxx1P2UYWIMxNp+QU0mHZ+PRvw2wUmrBN
	 QJgfh4NraMz6ot5NynE9bIVfi/MoJrA4dGtU0umJ4O+yhB5TBRE7uMd7QX62zJFOoH0k1
	 Wj8A64DF39C23oX0SOuE/WM5xYg181CuiTW2q/8h/suaIVSfiuh//WD2o5yFUaS147P7n
	 aCYMpRH55FGEEt9dI1RYuv7DdBjEdQESCjD31fPvAFKxUo4bzlxE7E59ok+CaqhrkrX27
	 VUR7O9ADlJNaacIsiDCxCXw4i5jp4QbqxMCjEW5tLklEzGkp6kb4TQs529Ri/XRLAMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795037871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RAZ0PD7F/CSWGRP0ibw7kpmlFcj0Wdca8G6Dl9JOA5M=;
	b=EqeK//VLcNGzGh45W08D7hsc/mw0smQCJKL/j+0TkCLH9hU41B0X9TsEHq+keOIYMoP+
	 JwAMYFjT8Lz+Rn1YlpF4sI/Adx+BTSbyVodQvEMievg9RgfG01FTsAs9fHloXJBP2ff4K
	 uYlmIyVaWLqpxLj9hxy13UrFujYqSCFpbf/Xmp/EPte0SSN0gL5cNyE7CRjRskBJ3apN1
	 BvXCrmnq9nD/AwvIFBf/ECZ0aR1cOBYMxeYYHKPL0mmA2y3wLUnjkTnWzvNlSin6YllTk
	 5LbVAsrQ0AWPokg7jbFV0v+o/mKb6GyPjkkzm2eCFf0K0TwlzJfSq27cFSZpCgcFMgw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795037871;
	bh=RAZ0PD7F/CSWGRP0ibw7kpmlFcj0Wdca8G6Dl9JOA5M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EwpVipxSSEOuGL5TqbUlZB20snYQMWRYRiBlw9b6OuJo+zecLHlr6WMSh0KGR7MCw
	 YnlXZBtDjLAbojth4DBNSvUj0+Hegy9wUg3N4q/x3Iu6iENRzO9X5YjXYVuelkz5h9
	 CghZNJK6JHhf4FJ5wuvkKW0lQq3rsMi384pEhwqRQbNBY2EmscPxBPzQv72qBbMVmw
	 BHaHBsZAGxIavsut0gYnTBG2i4SfvIomQEvfeyDBHTgCdp7kfzCFrsUreaI0DCAZ/I
	 KCw+GlmAltAkX1vgU9/X5rGKqHrkG/NIs+p78vL6Rnkt3TuOi1SIIFdhDimQOIxEII
	 3Ap9L8m/aixqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9197C6069B;
	Wed, 18 Nov 2026 21:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BF0061
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DB578104C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2wOUTTYDFtZ for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 21:37:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DFA9E80E8E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFA9E80E8E
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:37:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6b7ddb99db4so16070a12.0
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 13:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795037866; x=1795642666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r+BIPA8GjWykxS2Mvx8l5ejoGxUot+V/RSYenXVdt44=;
 b=QMMcSmt/tCct87bdycRcuHiLmapGuJRsC7pcTC289QnwnjGyf8eJYWWznoOdvt05ZK
 QNc/4Yze1r8UnT919fUtqx0eDZRcw8mek2Z8oJpJG8f5SU4KnjMx/HTggAcAUzRSDbvy
 GnQsaIyAZdZn6QvWMX2Kahgqjb2n2gq+jK0ZGrta2kAJELxKBQ+TJBxLVOpmeKY7+VKn
 h1/eh7xTsblBzdTko3ufvSPC+eyYAmZXHf+J8+TbBHRaRxWacdisbGd81X1g3BJ74CQs
 /xLv9UX+IdbnAT1VEVLRv4OcGZCZXesy8csUrRbS9nSohSH3qUmq+/1YLGtik7aRjU+9
 gchQ==
X-Gm-Message-State: APuU4Z8SANkebgrUeovW+NnAt+hETbg3qr4RSNBMtwRg+8O8nALU3Zwu
 veqH7bz7+x+s0Uenr2WyU2k0BhoJBjFLWeWO7spQbkXTRJf/egVQzsv/t2q+zQ==
X-Gm-Gg: AYBFou1D0EvZx95o3Sv1bOIPcGqHBQlAb1VPyVNTfejIeiK855Fy/evKZ2nI9TgLy5a
 0laEmbOKYAtL2/4+WKtAeP9Lgvwir6pnr2UBkDm+9fsVV0JnZqg3bfxfaRZpzUARXz8z1cFIt8a
 CUoQXFKjcNW3nZtJRB/syceheq3hx2eWy8hUdebf2CCvCDU7+iJ+0Nidmx1Y533eObz0LKeXRye
 GP317BG+0ZJgKH9QuVl86UigMDq0G9wvvRfIEsgBljnjVxDsKKxHoHpkF6270zSMkVaRovhuxe4
 mcJE4RuYwfozgDw9uuRXTPMH1diUXVJ50E7SE20EDvtsbiKSdUuKy0RZcHm1f+RxUW0x3DE5qLS
 U4b82C8Ed04/v8RgWHsOscG1RR1dZ8pZkXVVu0Fgtb/z/TCkLj8O8/aP8+0yyDDP+WzQBBGOmaI
 ghrH35r5S01W4Fint5/X+df5vKt/02Isr7wLaD9EBqbpTylE8WSKXCuVyHXnp1S1yIb3S1c+WZU
 bqA9LnhqeSADfbPRxqnTqz94ipIF8MmOG60FxrMaauALKSOIhKe0zM5HoWqxRv3jUYzpkFq4lCT
 3oZKvcwZ1lUYBCmr1I7Pr2C44lBdQONfwEMOebUHWni938/asZnb2XXtwwwX2UbbBli/wslCrn1
 +QRQ/I2ARRnHLMprfEV11kdvjPqdkBA==
X-Received: by 2002:a05:6402:2115:b0:6b9:c43e:19fb with SMTP id
 4fb4d7f45d1cf-6b9c43e243emr635189a12.25.1795037866262; 
 Wed, 18 Nov 2026 13:37:46 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b88993eba3sm1633283a12.13.2026.11.18.13.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 13:37:45 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 18 Nov 2026 22:37:45 +0100
Message-Id: <20261118213745.2222570-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lmdb: download from the GitHub mirror
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

git.openldap.org regularly rejects the download of the archive, most
often by rate limiting:

  HTTP request sent, awaiting response... 429 Too Many Requests
  ERROR 429: Too Many Requests.

which makes lmdb one of the most frequent download failures on the
autobuilders.

Go back to the official read-only GitHub mirror, LMDB/lmdb, which lmdb
was downloaded from until version 0.9.31. It has the same LMDB_0.9.35
tag, pointing to the same commit, so the sources are identical; only
the hash of the generated archive changes.

This issue has been present since commit ed2013938f59 ("package/lmdb:
bump to version 0.9.33"), which switched the download to
git.openldap.org. It therefore affects 2024.11 and later, and
2025.02.x.

Fixes:
https://autobuild.buildroot.org/results/f415612f01da25fddc437b30e9163b1aa69bc6df

Fixes: ed2013938f5962ad638d85232de96599bde231b5 ("package/lmdb: bump to version 0.9.33")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Note for the maintenance branches still at 0.9.33 (2025.02.x, 2025.11.x
and 2026.02.x): the hash of the GitHub archive there is

sha256  9c352fa9bdad53d920128ac6a62296f2850c7e29862a610d3a72f5f49a1cd7ea  lmdb-0.9.33.tar.gz

 package/lmdb/lmdb.hash | 2 +-
 package/lmdb/lmdb.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lmdb/lmdb.hash b/package/lmdb/lmdb.hash
index e0856136b2..75bc8f2ad5 100644
--- a/package/lmdb/lmdb.hash
+++ b/package/lmdb/lmdb.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98e28ab0a5c23fb2eb8ad12c12d7ad5fc5e4c3563f41d0b91e9420a075974d6f  openldap-LMDB_0.9.35.tar.bz2
+sha256  18b021fd589d30cc08860a9550a30ae51637117451385e9581616da751326632  lmdb-0.9.35.tar.gz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  libraries/liblmdb/LICENSE
diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index 2792c93006..bcf4bc9b83 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LMDB_VERSION = 0.9.35
-LMDB_SOURCE = openldap-LMDB_$(LMDB_VERSION).tar.bz2
-LMDB_SITE = https://git.openldap.org/openldap/openldap/-/archive/LMDB_$(LMDB_VERSION)
+LMDB_SITE = $(call github,LMDB,lmdb,LMDB_$(LMDB_VERSION))
 LMDB_LICENSE = OLDAP-2.8
 LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
 LMDB_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
