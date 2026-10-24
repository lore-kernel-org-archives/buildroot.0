Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A1606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YUM6bL0S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g2V/ImjD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D30F540660;
	Sat, 24 Oct 2026 18:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7A0wpSnQIwO; Sat, 24 Oct 2026 18:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BE7B1407A3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866563;
	b=HiuVgWm2Gwj/0fBITi2ipg/lWbkmO67FyE3OETDpBIpqj25JcN4v/t3ApiyRrNwIBPAm
	 QGLQLTqu5Ml0k7iYfnDRBQ9VmH4gyFuI9ptKTlQqY9Dppfz1+in2lKrRirkiJnM+4jevo
	 l56fNdlKCR+RLHnraes93CrQeMQFtk6X/J7A+u1weyP8AlhKgMDNUEPE2xVIbgzh3bq9C
	 lRo515j0t1sIAipDVx7IPA2TQZEmvKVCz/WF2HxlnGHrVYi4Wsz5yQCm7tNbVHsTHjvKz
	 AOK5cymGVWBtJUetkVJbsY8/rGuJYcvvg59cYif1AfR+fasI026s1coasMkFH+Zb/tQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3kIXBMWCFhe7s8XvN+8p5f1zhQdt/K0rRE/4I2Uuiq0=;
	b=kOTis6AAdiUb3bJmaAD/W3PdnXfgJ8mVJLjrmAfu5mj57adNc8+8T/a8nwSVFDLU6gZO
	 uK6+q9519e97OUwJ5OmJOEcwBfbW+zH5wM+/+40wr/JhXoj1CRWae4jja+CdnA9aVg4sp
	 upxyEeRbdzxEYzZrzyHQthhN3J2uEmLZlXWNiuslgRG4YG6FGivoC6nc1PvtG3ZHoLcfx
	 Ywv0YDT4aTGEBAnC6r5AXIiZzobSqu1gBnkYdA/AjHBeuUvNExLgkUzUG6a/9CqZRwvjq
	 bZgGOJWEIwvlhkBMH8ALgAUES7Fs/6Rw24DgAcy/caQRg1TBQ+U87sySWTcrpXqT0Ng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866563;
	bh=3kIXBMWCFhe7s8XvN+8p5f1zhQdt/K0rRE/4I2Uuiq0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YUM6bL0S2M2s26YNz1iD2G4Eglbk6mKmkrfQzajwR1nST1SjImaR/ybQB4ezBljTL
	 rcKIBtoR6moXAxOTMYAphSqAyxQ079IqXIjGESqwJCS4vSRuMlJf/7QNsfei9y5VwG
	 b9E2EQUhzUcvpTMCn1MmYPo35vax6aofHt/dCL0G6fGyVpWbFDJBuFRHrjCqjThpbb
	 nUWROpy6LMPeYYrgRPwTGPiQXp9Cs11MMyudVfY15LTa3sdrghNLQQM0kVKg0uJtgn
	 ed3/5rYBbhGNFoncaZXtBaNo1OxJ3hF2n13Us//HeCEfj7Jeq/RT9wcZojvpnezmoj
	 0oRZYZ8OCcZxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7B1407A3;
	Sat, 24 Oct 2026 18:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C794C4D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1DF4809B3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NFXXbbiFQ2Y for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BF1188098C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866558;
 b=CuoPTtR3xRr0DX3IQpGdmxEw5V6Y145C63qkfZFeGC6WkMasib12d1cpLi+ksT81DXkS
 a1Qor0aOEKRzeAzKDY5fWw7y5Vma1wCluHPpsHNm9EmQ1dv851SeMwFjMQ5/AzYKQLZeX
 WfHpOgKQ/WkwVbOy28KiR3g1oowMCkCxoP/lQjp9zaKj6b5yQSaYWVfQrZptLlLABQzwt
 c4Kp8/IQ32zrbjRrqr/9ZD7GNYYVw4fEu0k6hlAd7L4UWpzhwfuRitoIOKY82+qM6mZfg
 gqbhGBwkYe2HO2inDF+WHdo+Hi3zS0smWcs23TbTniSyjIalStgj2Z1hjuNzlmhcpBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866558;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=gHp3DbfglVFxbr9er5xXHaGGwvSo72OXfNzSKB8bfqI=;
 b=NYHlSy2NYxL9GTOiKbpU5lr5zz+mAhdqF2QdksXWN0eEUyzx41WP/TWI/MOU7c51X222
 itMfWekb1AGZoy8Sx8Sxw+hOxiEHtp4MVGxrOxoUdmzjBxwnjjCCCZa86glc/QzTl6ln2
 10FDe2/yInC6So1s5JwzvjiEOJ+jHdhxMwcZdFhuxXZJp2RIcuSxS77vBXB37WyYxe+OU
 HMgHqT4KuGrpeEp+2tJYoLi0QyYY0Q/f4rNacKsWIQVr1zXtHnu6CzEHvg8Zsdsi3q7rH
 ldzoDV+W/99OGAbykORrhfXES2WsODHQvjogp6TJDby/epdmQOgZD2FExpuICZfe8Gg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="g2V/ImjD"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=g2V/ImjD
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF1188098C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:15 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-70059e4dab6so1301002eaf.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866555; x=1793471355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gHp3DbfglVFxbr9er5xXHaGGwvSo72OXfNzSKB8bfqI=;
 b=g2V/ImjDHAGYZRpMgQ6KfUx7ov41dk7SaBHiEc7aikPh3SB8Ljar3vcw6/WTwKHVK/
 DkVynmRxYEswuV7z+dR/G8ZWZSC5/T/B5X1DnnrRtDU5Uryagg0h+dfuwbY0KvWdrTXn
 rLcGg0qr80Tjm4DecXYLWOBRcUqDrGRhytWkzdGSv1WbLIbq4xrQiM3sQ2kcy2lDDhY2
 a+CPrhUuCSCLljEiFQlx7wJoV+YtycF6StlyzOiiaiZgZ5RDVJzEKaBXZhNkmzU7MiAe
 WHATI0Lq92lbKAq2P115V/dqS+ktD/nwZJQZ6rYXdOfTEBf9Wa7uHXm4lyOrY5USCVhZ
 cYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866555; x=1793471355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gHp3DbfglVFxbr9er5xXHaGGwvSo72OXfNzSKB8bfqI=;
 b=DPM1km4bvHLkQk+FSTrxQn3IgrCZTDSQvIJZ1PQpPHPGlI6rMpCW5vjp6i+cwb97BI
 Zef7X06LVzL9gUhixf1szAvU4eX011YCG64m4XFuV79MjH3CI7QI9jXMAxUIvDWQJhif
 lBN1ChZETE/tETXQr9ohP0ctWtB98ViACoVQO8qHoyn1BuJZ1ErmUgFCm4QLjCqwbTHt
 FhEayQ1ytLYUPpOlpRd/+HcbVaXLyzStn7cGfRIYfSRPR1W7sZee26pgwWswuYvStZG/
 Rk+CQ8dnzdYLboOlP+WvUn2oOBcnOxbIZGDMGMO/7smbMW2HJ2Ai77hf0J68PFBwTVmW
 keMg==
X-Gm-Message-State: AFq9FYIP+U+VSczT4C5w5EPffBR5t+MGK4JKszOVvly/v33LrFeYBmQx
 qwtpQcRwSzDT9YUScke74Bj4P2OZx9Y3y9Ktz2XF8QPB63mdLR08exo/vH/6e+tO
X-Gm-Gg: AYBFou2LwKzTZKefPPcweMCofcGVqAVv9J/wSnbiMRBt4Y5VcaHvr7mKuz+kRh+pEl2
 edJsEoBsZlHqlpDVU5sZQWsuLuvdJzHp0haZjX2GK3GMHvHikAa5YUbnIj0RJ5XDYtUuXrxMbyF
 tI7lokwaMcS7ILYX1rSIjhBKn7rCf74K6h/Rhyu4SEx0NlmtXc2Rtclo0/t/waBI54KpVZaWuRI
 PdX+0exq3qWStaSHwy/xgwQS8G9F+eCyA5wON3fDNibcPE4LjaokOKnvZveorg0mDuYzfDVCX/W
 RAsULtLZfeUrtgPTKcTBsM/5dxG8frkpqw/p2LSqWcScum4pK5g49/Gbd9Ga+rTiryibuSaHrkN
 PCybDyzxB1YamKxtzOSwwNc8uhJR3WMncWe47NGzB1uGB+PgMf4fJhvofPDMTi005Xcio3J6ffP
 SVPa9Uo2HFLWdJytYm3OU61ekvhuzVn37dPEJGpKcDVGae2WOM8GoBkCWzldwlYN3dvsoJcMkLs
 WRvRIde1EpjqZA4CbtJrXtHcLUJdza9uZAw1M08RXpqusrc8yHA16SDWljEVnmAgyyODtXFDS3x
 5Jc4GpZ+of8nCMeKL58XO9qj+BSF9JrrBT4tZ64fpidcH8lfxrOe6fo1CGaR9XjpdRudvmbNJez
 96LUyUdOQPvih19w9q8q+GIOGIXzNrYhMIXF/gUekDFEdQz1KtPSQ1FgyItiXpw8qFbaz3SlEuH
 NJPq2h7uU7/UnoMKgC3k590cWg
X-Received: by 2002:a05:6820:1c81:b0:6f4:9618:bada with SMTP id
 006d021491bc7-70ba0867e96mr1256925eaf.0.1792866554730; 
 Sat, 24 Oct 2026 11:29:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:28:56 -0600
Message-ID: <20261024182913.1957467-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-aiohttp-sse: bump to version 3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop the Python 3.14 compatibility patch, which is included upstream [1].

Update the license hash for the replacement of the abbreviated notice
with the full Apache-2.0 license text [2].

[1] https://github.com/aio-libs/aiohttp-sse/commit/9eec5f5b0355bb3853d0e4f2af6486c9a5887e38
[2] https://github.com/aio-libs/aiohttp-sse/commit/390f93d64bcb01db32b02195c8c90d2fafe5d8a1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-Fix-build-with-python-3.14.patch     | 35 -------------------
 .../python-aiohttp-sse.hash                   |  6 ++--
 .../python-aiohttp-sse/python-aiohttp-sse.mk  |  6 ++--
 3 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch

diff --git a/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch b/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
deleted file mode 100644
index 76b595c7de..0000000000
--- a/package/python-aiohttp-sse/0001-Fix-build-with-python-3.14.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7a649de6561ec181208a9c4fa712aed614a224d4 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Mon, 8 Dec 2025 18:03:03 +0100
-Subject: [PATCH] Fix build with python 3.14
-
-ast.Str was deprecated in python 3.12 and removed in 3.14. It inherited
-from ast.Constant, `Str.s` was equivalent to `Constant.value`, so we can
-use the latter on both old and newer python versions.
-
-Patch was inspired by
-https://hg-edge.mozilla.org/mozilla-central/rev/dbf9702ed87e
-
-Upstream: https://github.com/aio-libs/aiohttp-sse/commit/9eec5f5b0355bb3853d0e4f2af6486c9a5887e38
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 6843260..fa41025 100644
---- a/setup.py
-+++ b/setup.py
-@@ -25,7 +25,7 @@ class VersionFinder(ast.NodeVisitor):
-     def visit_Assign(self, node):
-         if not self.version:
-             if node.targets[0].id == "__version__":
--                self.version = node.value.s
-+                self.version = node.value.value
- 
- 
- def read_version():
--- 
-2.47.3
-
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
index e8382e7f8e..63aa6bb6d5 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.hash
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
-md5  8c86e737a2f3642941c1d383f42ce6ae  aiohttp-sse-2.2.0.tar.gz
-sha256  a48dd5774031d3f41a29e159ebdbb93e89c8f37c1e9e83e196296be51885a5c2  aiohttp-sse-2.2.0.tar.gz
+md5  86392c1b821f9e2b22b787a295f9beff  aiohttp_sse-3.0.tar.gz
+sha256  4c2158dc7221fbcad225699c2b7c368c15ae45ef195447ddd0ba3dea5af24c70  aiohttp_sse-3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5585eb91ec607b4fdbe97d44a61146a9cc27bb703336628bc3c6a1eaffe60307  LICENSE
+sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
index bf46c98528..a8c27218a4 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.mk
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SSE_VERSION = 2.2.0
-PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
-PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/80/df/4ddb30e689695fd91cf41c072e154061120ed166e8baf6c9a0020f27dffc
+PYTHON_AIOHTTP_SSE_VERSION = 3.0
+PYTHON_AIOHTTP_SSE_SOURCE = aiohttp_sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
+PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/af/6d/01d7f71e38ac91a912dd8c4ed1a1481316dc83cb6c42043bbfa1b647c0e4
 PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
