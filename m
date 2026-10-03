Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7749ECA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F287814BF;
	Sat,  3 Oct 2026 21:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5w6K7EhQo9G; Sat,  3 Oct 2026 21:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4FD628143C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061751;
	b=otul5iRN8+F1xtV/INNAvFKsywL7Y+v8LgptvccUvgoBwG57EalS2OHP8H93xnGiW09D
	 IVt2rru2hafKbRsn+r8npZK0zNORddLzK1Zj9+sUbhHRkCwvKV0f6LyNsgSVSGIYR29Ek
	 b/4v7IbD7xiQPBa/4VO/OSpl7AJE4hxUoIbyqrCyHuRWG8evH9eS7O60KYx35UX0J/UGt
	 QYwQlkmxaDO/vB0tPESejPC/QOEprbe38/uBwZ98s+rKu0vGrJceRXKedcR672lcjPkoS
	 kfN7j+kZ6d9ExsYirTLOfHCFWwJ4qb3XDdtU4QtKCb0BR41vxDuprg6X1rQOvlL2rqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kvd9Qnn1qOFUQBtzYyM8jpZ04ZsLyGdQvNE/aJCTBpA=;
	b=X5ET6zu1Pz5GqfImTbkFM8b2Fmu/SfAWTM8KOlHOxWkDOhkDCgj2wrouKv7NBkGhYVQy
	 jRWMedKtcinSHO3Ey5twRtCbBHx2Cbf16omC2knIcwqGLojGg+Fc5MCLvnnaCwh/si62F
	 1ngy0XyGITnA0H73E23ezAKD+tl05rYHTsjwMowY3ScTZX0FmqarYFnv0L2uW+fTFmqYL
	 4lWeB3D9L18hErqr8skh94AtRiALMewHEnIAgmRCdN9XcTkkHEkWZ6JhvIvFGiv7de6Cp
	 mQPy16BIJv7e/UVnsqWne0VdUWTxNhKij7ZbXil1/7TqmWeH0qAcRddrDF4gZbqoUAA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061751;
	bh=kvd9Qnn1qOFUQBtzYyM8jpZ04ZsLyGdQvNE/aJCTBpA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=J1/8eo8bfWY4PTUh/d1YIV09ELzaw98hjYu2eoO6pHgZphCcwNaml+8i3f0YyYugh
	 oKlh3Zw9glcGVtAz9uifwexlw8bZFAlqdQ3ncBWIOPdumOiwMSHlSZ8Vf8PABcmhIq
	 GKTGwWKnv+UM4wbhl6d0c5MrvXNVrlPSl/CH85di5W6HkjdaSCnfqK59V/vwIzCdnA
	 /3CdmTStCLxqy5nh/Su7hTRn5tFnHlUqz924FWgXi6WhR5kIH8eNfrgkjfDIUoneVs
	 t7H2yzBxDSG+efMIHCRmMprF+GaRwdYhTAdAcPJht0UXiN5aFvety0obIrFT7zJvnU
	 JHarpHTFv//eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FD628143C;
	Sat,  3 Oct 2026 21:09:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C45B92E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9EF840ABB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id em9lG5Qnls-V for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C036940A99
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061748;
 b=q6zty+kyvzep0b/2CVegt2hGOBZQK6/twqnBtb9oWR32RDljQmbMW5+tmc6p3MwhrgTN
 ybbLK7BGg0Gj9GXRPgxdGOHBgzpJMBftTEp3PUJkIczv4yLZtnmryR7dNIyo9G68NBt2S
 KQssbwr5szEwyZK77oPBNGtG+TKxfteGQwOA4wlFIu80HpbjNc8paf1Qd8MvppynpWtF0
 0/ERHnSQw1E3eCfgqXY8rtAyHQvYhq4It2KlHwdRRbUMbSAN27rq8oS+aXvqM6sH0vDXG
 7893nclMR0vGGn6lSJR8briZIt11k45aaSGOnE24/txJkzfHy00MGUJCPyEhvpBFV/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061748;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ZK1xUpqQuIqQdjL523PpSAIcDeJPrSnhC25U42ehQ0w=;
 b=V3kvMPTYqvT3gw0KhFlXu0iexUM0+02b5fxK3GPL3NofiNrxUfVQ3hBcJry2PRjMVXii
 xjsGpt4KV1JyyJZNZQobAujZTbJVH0EE7EEjKsYfZ9L7U8aB4UWaGbT788eppNq/pQVTe
 mS8fLBdVuoN0L9syazBL5c8uFavMBqw7zI33okibyepJfS6WlVF/YCL6A2pjU6L2uEQmL
 D+qrdnVswYC5c2mg+nPOcF+UczP4bRXU3RrBj/x0pl94Yt21avAHRcHNySlUiSQzSNOKd
 paxIinGI/4RBojo6NWDUBtE2Bk3ObqhpyFAN0HsRBJ7k3P7bmx3FAYEsmLg5vu4Biaw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="n912/L9w"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=n912/L9w
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C036940A99
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:07 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-82374c2d7aeso780630a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061746; x=1791666546; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZK1xUpqQuIqQdjL523PpSAIcDeJPrSnhC25U42ehQ0w=;
 b=n912/L9wP+NTRl9g5L10CTL9wOwUHoU5Sv2xxvdktuQiZ/3Sgqa2IMxgmUN9NA9B1I
 C6CHHBDu/m1McKRD6Q944jYVOFyWUgAUDUgy0HnVtqol8vb1XKHamHCAMFhUJgcXvsh+
 GvsWEYK1MfZS2/73aHkU6XUYf9jR2vJ7FN/kZyf+awTInaPmJl9m5hXz87gBhyCsdcOC
 RLg3Ea0Cz6GIPpCmxeeouqmjce90y3vw+eQ7gU5ZaNL0uhXWVYQASvKlUzvXVsqEioMv
 ++vf8LWb6oS1Xdn1Fk6tSP8j4ymluW7vy1uZ+D8QZYngdO1riZMttlLBpVAhZQw6Xtqv
 LPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061746; x=1791666546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZK1xUpqQuIqQdjL523PpSAIcDeJPrSnhC25U42ehQ0w=;
 b=e89q2NUaS9wPeAQccBaubilYIymR0Rc/14dmP4Ny5V4LS8boIeF+Nxeppz0HUGsYrt
 p38sOW/ys184tpQ3/OVW/FjMeY8Lo+CMsirteyA1n7CkbmsyY9BuBr7E3S0q9W/NQFx3
 lqgri/h0ekRV3bB+tmEdqprgj3+3+8jB06HBdC4pZcfJ5iUjmNHz+8l6jf44WNncsOyB
 2ZIEHXaxNUjXZLOFfx6OjxnJm8kKr/i7TTm04B/tmfmYl5x6kvtAz7KghdrWAQQKc5O7
 eX505n+KabMlbtuo6Jmil0LqE0T1BTH7skJDNPg8i0tt/okv2qbsgE79aGwltnRcboBF
 eFgQ==
X-Gm-Message-State: AFuF++n+/TwAYTDaa0EHBsQw613hVjZB5cO8DmUtB1P+fscA0va2paRy
 CxB+upzxxgnb29QJIAG8pcaTdbzJMppVh7Ptq9FpTdOwKf5jWMnsEG4eIugWRw==
X-Gm-Gg: AYBFou35iWPFAQyrj5rMs3mhwPQg8kDBBjGczS/AvfIZSuN5euGXwNH9b00iZzPz3wI
 PZbJ3o54c/Z3wXIJCfJTv+A6aDFZHYzWREjCrGuLqtKPZT0TjrsEiOwumAsJywVXApipuVjTt07
 Rdy3eXPAiiBldR4vvlqhS4fuIjEjOPSmNFkQBx/QLMY5pb9sKXZxU8hN0vvO6JB/b+adTCsgNaT
 NNMMwnuNTb6xuRXkUKSblPnaBfThLz/ZCxicUpV0pK29qOsmllueZd6unLoxCw4BXAvWJUBaGmK
 QzQC71r0pnSoZkhhqLvaLh9j5Gfr6dFdWXc0dGmcTyuYv3OSgXKTzSswk9h1CNnkW+U46BmOYo7
 0yJ0Hpy8KGGV+dNdI7kanBsSg/uJwxlqEd3MS0QAFuFBr4bAXRrpmzV2paEncEhuvt+Lq8r83aJ
 xLAlNMCUQRg+/QCT9RyBxVYsyny/a6wizFXD7J5wSexDkR81kilVzKepKIOnvB/cyPfCoIEaC/J
 uynb5uHeSOzUYZWhJS2zcpTk9DSoh6Wtr9hPMS411aUu3T8lDPO8mfYAiCx2pFuPBUowWqrKHg/
 Ma9CrmsddjcwNlQFYL7wA8X0AeYn7e5ax/fsXwwAVMYcGhclj71bT4q3MZFzyR3wGGhuBNuzkBi
 R1w2O7ilGH8jIi72EZctPot5Xn1Jur37l7nB8QnqX1A==
X-Received: by 2002:a05:6830:91d:b0:81e:a314:7f70 with SMTP id
 46e09a7af769-8211a3519b3mr8729095a34.1.1791061746660; 
 Sat, 03 Oct 2026 14:09:06 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:06 -0600
Message-ID: <20261003210833.735937-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2026.9.29
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index e30af29b65..6c762af95a 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  b3113da02f37c37ae91946626ec4410e  regex-2026.9.10.tar.gz
-sha256  1e321e2c84f0e52c457f5ea5944f796d6e8e09cb99738ea98dcc1bfe402a128d  regex-2026.9.10.tar.gz
+md5  118d130c65d0c98c7dc183433362ce75  regex-2026.9.29.tar.gz
+sha256  8b5fcc4771732191b2b7d1dd68d8f0353f47f8d90b6150f6dce58bf1112442cb  regex-2026.9.29.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 169e62b080..713f81a306 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2026.9.10
+PYTHON_REGEX_VERSION = 2026.9.29
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/b9/5c/f403115361de25809e8f785686ec7096e30fef73be9ae35aa51da4e80abb
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/fc/f2/af1da9d3ceed77bfcdce40427d49ba0be94e4fe84245e3bfef68c10e75b6
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
