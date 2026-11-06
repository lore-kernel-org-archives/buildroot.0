Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6229606A333
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kplNo9Pb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=eO1YIRtd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 701CA8102F;
	Fri,  6 Nov 2026 15:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Vbv2DBVQKHf; Fri,  6 Nov 2026 15:55:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 847098103B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980557;
	b=lRLhjQ0h/J+njhqd+WT4Y5qwZAHAwpWwbESEc8+xx/JGMgpvbzhUmWPqC+/yokY6OHXP
	 ewBhY87SN3uU7c5KYtxC9WN1+6mtPmXVXYMOMat+piqQHeyjS7z2tJ5Za/aLzxaRGprqz
	 FxyaJRCVPvRXOMhIqMWxqE0SDtL8NJI3Zz5LB6a7xcGvCisFrZJCdw5uFH0gtu6ROCxED
	 9+X3ntCAr8atONdyfxWNnRgT23+oiJ7+pi1IofeARgWFl9pnGkn/ln+IElRfnxKYH5WLZ
	 Z0bnYbesIzN1EGiyhEj+qsshh/8Tp3TtOG6sna3q3Hx9noqhZgNlsYrngEQ6IeUcnFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Ab7hDBd9Mfs4PkO2LAoRycJVhvFcjbkv6rtCjEaJ064=;
	b=NzgemfuoiUM/Kl9kj40TTKVWPbDv6agBduuloYbo20x9bA7PSB98AwDJDEYTOuH2n2jV
	 wsuy87YLe+eNDdTzpIF9m/mguJAiJ6jIPO87zIj77i9o4W1GArbJ+pmUJk4LO7kVY3RKd
	 c9XULmQkt67bR9P1ug3DlEjmxKQFh7zuJVj+eJcfVEzhMiI2ebka9DGOL74l3kSvXTdTi
	 OuSsCkZ9izWZ9+Zx4OxI2UzKo539jLOlPh+gebxwe1ofy0NlDsoc7QqJ3zNwCWZhtyXDZ
	 DPu0FuT9BqSM6bMFnWQc9/Z3qJdSHv0j8dqrtIV7fL5xhYA+lGjmC5l3ZC+LSM4xycg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=eO1YIRtd;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980557;
	bh=Ab7hDBd9Mfs4PkO2LAoRycJVhvFcjbkv6rtCjEaJ064=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kplNo9Pb5XfwmBgxWEKBUek32/iQI8YvrZfD6cnPZndrvBHJ1s+H+kCVXIU79OmyB
	 h3EOqpZtWWuQ4Pgnhh/rBh7Ja+cPJjT97baQi/Pv1s96+W+TszKRgimEtvYdMFuAQD
	 3CsLe6Qr9Y0aWk0CXSXL9102N+omUw+bU/GqhNOFvLRnZektMyvPxfjR0tmzbQoDZV
	 jeHgN/klM7SplXn0ymJkWrAHCtjU+uQ6HjMQI+vv+LniXvTTpRoDCNgao7kSBsfdI3
	 7gIo35ymv20oSPtBFai2JNFBMdXTbWjk3iQmsnZ4hseEe+t5N8ROmYtRUJAH44rU7y
	 OrwIMY8XGv+Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 847098103B;
	Fri,  6 Nov 2026 15:55:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94AF42E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 864068103B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5Ipq07cZySJ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:55:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C9708102F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=eO1YIRtd
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C9708102F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:55:51 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id PMI8xiZtstleFPMI8xQf6w; Fri, 06 Nov 2026 16:55:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793980548; bh=TIjFIAmzMwYWgj+O12l1rvapPa8Lg4vpKMlUIGMBOdw=;
 h=From:To:Subject:Date:MIME-Version;
 b=eO1YIRtdM+eRilfatJ/ZpdGu/waHBdnLdx8pi4TMORS2gW7E/5ACW0YP7r5+0aTp4
 wdfCn8tvZs1rAKGDQEvX9EfnZzO8Xr+ntOVVjNOgrRDloJCTbmqx4jU4+bBcBNQqTc
 oleSBupoz0pQZVOV1KsfCr60w03TfcoO3Zq2CF/02fkmaKw8X2v4AhSomnqxrqJ1aQ
 UEO4Ufj/XGlMOqM6w+M6AQVpWdxQVI2WLPn7mqN8ybd0ec4TvmRhG7Gn2Gj9q9EdXg
 gdazU++5Pquv7nykXrOCTpOtmtnAsdMVuctBClXlmhZlTPXULkHp/TAqUG9T9CwSm6
 2K4kP3+wl69Iw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  6 Nov 2026 16:55:47 +0100
Message-ID: <20261106155547.668890-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGWejtFSX4MOcyYL5QAxIqkqY5x1VXc/VuHzw1LhMcoUxAmc+H3imd+dqlIcqmn7isA8sFLxqbD5Uj3VCpVGdrcfbqXKozUWw8xyqOl4cs1zXehCcN+D
 vigFNX11ViSrpj9mAKdHcOYiKLSdljFoeUnFFVOfqKGeiPxmZp7h8zNXiZkH5y0RyfDQlGKsqJ0+B64XBt2QjaXmfkx+BLYcQFn5t+FruLLAk1WaTWXGi0YH
 sNYTZ90QvAGgTGASP2heOI936CRQf+GSAv7RWGoE6fDxN5/vEjuU944HlB7IKCYGs9wUWYWDYPiIiNZ7wkji0w==
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2026-09-11
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

With this version we can build with Linux up to 7.3.
Fix build failure due to GCC version >= 14 by passing -Wno-error to CFLAGS.

Fixes:
https://autobuild.buildroot.net/results/8c7/8c7196cbc64dc9eacd2c4b663e66be6e0da6c8f1/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index d5bd34ac1e..db4001989a 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4d8495b1b5a0c42ff0df775b16abd38103ad8532c53c0527f416484f8c2d477f  rtl8189fs-876e627a5b6a8021700391b4249a4a31edfebe5c.tar.gz
+sha256  491dcdf85f1050fc75cf33058f5636bdf6d259852f8bd4c564aa7475cc207aea  rtl8189fs-13bbdbc750bfaa37ff47dff063edcc857fad0584.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 45ad24e392..b68dba4c83 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 876e627a5b6a8021700391b4249a4a31edfebe5c
+RTL8189FS_VERSION = 13bbdbc750bfaa37ff47dff063edcc857fad0584
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
 RTL8189FS_USER_EXTRA_CFLAGS = \
 	-UCONFIG_LITTLE_ENDIAN \
-	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+	-Wno-error
 
 RTL8189FS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189FS=m \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
