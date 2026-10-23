Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E99606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 19:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UBTHhH7C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kPvCzVrG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09FDE60A4C;
	Fri, 23 Oct 2026 19:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKIEOsRLRPij; Fri, 23 Oct 2026 19:03:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21878608FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792782227;
	b=RXCPs6v8FbgClel0uEZpGG8NWQqw8eyvqhtHKxuQowZsZWIRsHmQcfnRF5nZ/XTKHCMK
	 EFUgvp4tcCFJD8oYUc1FIj2hOPujPp8v22Hpi1qcngqAqJiehGW+4O1PgVuGTjSuFV2aS
	 f0kdkz2WO+30+mAPQ7Oys4L7+8AIF7gfmfSxs2SEj2oaDPR+XqIb9o/FDfMVrLcoshM4c
	 BPeYdt0cwnTULGncSG1Ki7HlWulyWVAEvvGujEzcaFykHeeP7E6hu9ycnIFpA5B7djEbC
	 RZ1PxtwVABbvWrYkeAqKhKNxRW8uodBKc41W5kPuTawxbZStL7jyuIUweWncezbTKXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792782227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WxaR0Kd05+JxH6LagZtr1t6nNGR3I1jKK4B5a/UrJOY=;
	b=ckN58NX2kzb1xO1HqB6E6yXAQGmE2XJYmkr9reAezxNyAkjcqLHIG4W6wDhEuZnSqAyD
	 Sj27KPPYp30hdvOCJRVSfFzk9uIvY2s7obKc1VTD+GmBQM3DBc7dLaOmQttt7iQzVte10
	 RLErP9TjmbuzjzP5sIMt7q/cXLCmeiKAtVLgUrFbKIX4/ZcW4ePvLsbAPUBLvRAT03rXd
	 dUsJeyb3IJc97E/c0Dsv4DxQGg0CluQ6WedfVJQcb3VIMSleoAO+/hXy0T4hTyPyLQPbe
	 WLT8u9Bbe6YlLkHTQoYEusG+wVi5bPllZ63ieHf5TkZXoPCXox7XX6aJTHtf0VaYFJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kPvCzVrG;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792782227;
	bh=WxaR0Kd05+JxH6LagZtr1t6nNGR3I1jKK4B5a/UrJOY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UBTHhH7CB8X4rR8SbWXKS+nvuETbXTiicycKb8x7imOiTKEqdyQGk/jsuiOfb+vNV
	 2y86GdJqgC6QGpKgW8Xr8VeDLvNlG8ItMq+LD05YJ4FWHfmhf3+CnkQ4dibTHzdEyt
	 AY8bWWGPMEbtm4R2bHN7GQp9UAm4POk3k3NMi/9lVQsyMnMeDQlxaaMMAfDCdoM2PX
	 ujXs5wABvy6lmxJKsK5c/AtwQ/8SWCC9LhNiVTZzlzftKqcjSFl2xPmL9Tzoz4H9fj
	 KBWYrVnvj0VtbF1OAfjlk/Pi08aWUjEWjaIlwihaMHGQTY7tByiIlU5C2+44z32uRd
	 DPMjQk4sM7nlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21878608FC;
	Fri, 23 Oct 2026 19:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF77C79F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D565260652
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8oSCiaNNtO8 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 19:03:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D37BC608FC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792782224;
 b=OOT8xKZpN8C+hYBc+qwP2NKlD+CoxAin40ip4mQ9HdddC96+plDNnCdrwsTWHYkSRPK/
 9CyKC/JJ0oI+hxLrSY57dnsTpOGrGUhhaeB7eZVqbSaJybyVr8a1oWzGZB3YhG8mgNZLi
 f1N8hdJ9kWz+hVquHvesKi6IOSdsI/5WbQg4LT2qaQiZ7waTe4lC4o54RZCYFshpqIP93
 OQMzTsqjneyKHa7XnjvY29d9BqOOWZ1yIwH1DSRVZaY9dwj18mYFcByQEvPK5216He5YL
 oKl9A9QN+xGIHGPvR/zV3HuLbjiWUZyv66eBe6k5Uce50jyJ/k7oR8sSRV57rpkBodg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792782224;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=0f5+gz1IJlVcezkSR9V/a+fIUrCMU8ve2LrOzmqgdS4=;
 b=g4k+izu7duOhrGpuDBqDNBWsdSvc2qXu8iWzk71+PJvvVCGhDBNPZtSb1m90sCjPIFYI
 veDwxXpxBbaksvEx7e8f3lYXj5jFOaYdK3PPVhoVlftIw+kKBZMls8S0kFP7/pr7rUcSC
 GV6f38XUb0wrBGfmT/ky/f4xTGIToYsrSk4isoVDLgIpUwzLohRFGZyNFhNqgRCe7C3MG
 BQsU/9hoXOcRUThaBmMg8ZxfRwMv4WVQkxH+31UDmeV+KjYkuQ/X3o5oadbGzv8vzJgCl
 kNKOIyx450XxwmWlSLvZIlbO6eQSxFG+h5rDKdFiXOIW9wT7JO8ZM1I581xR1hwXmFw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kPvCzVrG; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=kPvCzVrG
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D37BC608FC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:03:43 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-8479f46ecd8so570171a34.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792782222; x=1793387022; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0f5+gz1IJlVcezkSR9V/a+fIUrCMU8ve2LrOzmqgdS4=;
 b=kPvCzVrG1OhbN0Y3B1JchEtEayOkqz7qYaeri/7UdzrIMY6zMYfYJ2MAvYA1ksra+8
 DvIaNm4kO1yWqFwNWcRRQMcp8NWVb+icrTgI/OHMYE1v+jPwaV87GlqkGcKKhgh4OQxY
 reXY0k/s9gKqQIVvI69rlO7F6C+q82M7O/rUYiVg8r2yt0Xp5rChJu0FOcJ9LurzX7s3
 w0pFpxgnes/xSNxd3hMaTep3tAojZ20v0AB8IBJAo+vC3ys20RVJdhbjcSu90GQ6WkiZ
 6ih5pzwLMyaFCjSB5uUqQ0ZyQ0RAYYcyHtMfvp2otyL1y1mU1ch9KFa4Rxl98666vpzJ
 edhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792782222; x=1793387022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0f5+gz1IJlVcezkSR9V/a+fIUrCMU8ve2LrOzmqgdS4=;
 b=AkY66Ov8HuGKMr4b+QRCFKU6jMLccYsH+wh7hxoV73l4+ZSvXResyX4rZZD7R2EScW
 RM9NFpuYcHuoRK3UoenCXOxS1QlkcK4uAMP3gatb+eVy/h8bJpT4KCNv9fwjIVbQvZUC
 V6Eey303eg1CKO0zbDmiRR2HwN0QuqkG4y8csa1q+GOn97I5LNvMN9ZzKZfOyu0PBExp
 RnlekU9W/xmog/Uc1mIIjuMxva9dNd3psoe2B7kJoam8qBqkBJGPkVrTNhSFFWd5NYdk
 AdF1WfGA39600eig2l8NTChAKPju98JQPVi1sw4UHCKNjjdlKROzbrxoRqHFsBttSVky
 l7nw==
X-Gm-Message-State: AFq9FYIhP5a2mOg6gyYVO2YroErZmcOkItdVeVFGNsEhgIOBzbxRFLs6
 79XfR/ZXrAHZoQaJrmprnqqiJr43e9ltt4eDY2mjSjm2M0C7CsT79qSpHtND33Oo
X-Gm-Gg: AYBFou1I3OWGoIgwkDv2xSD33XqLx+R48gaL7+rQO1VRxeA8JU6wjToYck+qLiaDftb
 HESHUMxeDeRkAc6nhU2VROa1heBd3xiVRQnM4zqqjmMHBWfqD7tSFbmCPBcyiguSrJd3mtbxp5p
 wlMorQe2jK1QQscyAf51EYBB8vpR+hpSV84cqIx4rImdsDCD2ESJTNz/jP7Q5ws0hJSVi0y8U6A
 u/VaCTC4FK0enFoBV5BwQa1SpzWoICOqTYVEyUWOwAxUBkm/5CYXoas8JVj6UVPCtV4Zv1BkGnR
 eEUMHBo2nOVaMlRpTtPU2jWQbbxjTRdTOZGhCYLQiKi3Um6rf78KM5x6iMQPwaBUPC/HjdHXBf/
 rdZGovzTtb7HI6VYKdwst4nfFSyOh06lu+Dtg57hqJoWkxJJmSrEeBw/0VscHydY/m9pfFDo/ZA
 quxmlE6m5817w/t3PYQIBBQBRcv5wa7PR9no+qHO4Q5vqCPge2wAtr9/IlMW8HcsaIPwL4MWJkn
 +ncwlMumHprN0WxbyZ+H7Db8OHhOVql8co7O3UarBkMTUF6O4+lAtIZEQbnf0I1Stw+6sq3+vzl
 Df/hwu7q8bMsEurYCr3/9kCA6eL8hVLkUlJHr2tu3R+WUIekntE60vrOZaFlwxCl+Jw1XePRWmA
 6fDUUMYfF8it7HtPh7ZkBHx2/JSneOWUPGgg1UblFsR0Z1l0ncw9RIxtXn1+5otmFscpyy4ye83
 YBVcv5V7WEbBFG0Sya9iVi0OrS
X-Received: by 2002:a05:6830:6512:b0:81f:138e:77a0 with SMTP id
 46e09a7af769-850fe3f7864mr251437a34.24.1792782222089; 
 Fri, 23 Oct 2026 12:03:42 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fb649402sm251127a34.14.2026.10.23.12.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 12:03:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 13:03:37 -0600
Message-ID: <20261023190337.969832-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023190337.969832-1-james.hilliard1@gmail.com>
References: <20261023190337.969832-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-httpx2: bump to version
 2.16.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httpx2/python-httpx2.hash | 4 ++--
 package/python-httpx2/python-httpx2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpx2/python-httpx2.hash b/package/python-httpx2/python-httpx2.hash
index 3c14598c5a..e347ce95ae 100644
--- a/package/python-httpx2/python-httpx2.hash
+++ b/package/python-httpx2/python-httpx2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx2/json
-md5  3efc94e9a67ec11572873e2f32d50cb7  httpx2-2.14.0.tar.gz
-sha256  47ad61a3c40282cd8d0dc96311531f00f5bfc71a066c6fe3b36d8f63fb9e4f6e  httpx2-2.14.0.tar.gz
+md5  47d96fcace1556149f50a07cd85a5eaf  httpx2-2.16.0.tar.gz
+sha256  0d54c98128e8f2ff7fbbde0fca8c359e5f032edeaaaac443cdb7f31f685bcd7f  httpx2-2.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7e7d6dbaf7fe160d39fd6e84fd02c33cab96bcbea34d36998d545bceb4a19c30  LICENSE.md
diff --git a/package/python-httpx2/python-httpx2.mk b/package/python-httpx2/python-httpx2.mk
index b75a36f26e..c35dd46516 100644
--- a/package/python-httpx2/python-httpx2.mk
+++ b/package/python-httpx2/python-httpx2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX2_VERSION = 2.14.0
+PYTHON_HTTPX2_VERSION = 2.16.0
 PYTHON_HTTPX2_SOURCE = httpx2-$(PYTHON_HTTPX2_VERSION).tar.gz
-PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/e8/67/58353f1848b4ba568e1ec22ea1e0d8e039f0bca5fde7e2d1f07739fd83e7
+PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/43/73/5ca2cedf5e4e50423d1c258877865a6b62793633b561c58499f8aeb33b7e
 PYTHON_HTTPX2_SETUP_TYPE = hatch
 PYTHON_HTTPX2_LICENSE = BSD-3-Clause
 PYTHON_HTTPX2_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
