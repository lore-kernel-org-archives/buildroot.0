Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F0CC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC78608E4;
	Wed,  7 Aug 2024 14:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VXle7_14S0q; Wed,  7 Aug 2024 14:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42633608F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42633608F9;
	Wed,  7 Aug 2024 14:34:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EFB91BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC7E8402F4
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihcf1y7viAOw for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C391640184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C391640184
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C391640184
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:36 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so18965301fa.1
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041274; x=1723646074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDO0H7g6HvOhDLFIQWieU7op6I4zAnpFJIu+1DC2YaQ=;
 b=wPGuGnDqxDSpLUyhL2n+XaBrxBWBrxqdhTqUrrfOBmXi9ncJpyvOmULp7NZaTDozmy
 jyRlkVsXgILU+k28r8/9VGCAtdwOESBac1XXrZ2bULynsYLY5/iVNNT4Xm0v0p8oUQ8b
 yJk6BW76pNALaMD+koyrtzmK3EZQJqnUxr787TN9SjSTbPH5zr4dw0V2rCqY4nEOPH+t
 rhczIrxf+HkFy05nPPv/Y/gGVm0SOmWftk6pVLhSI9n3c+tNFQNlLFY8J+GpeEYrH2wC
 XqYWRsgc+7o5Gufw3Pp96mAW5cR48MuIeN7nPPgYawx7hb+bT2iGYcerVqZs7990wZVN
 +zUg==
X-Gm-Message-State: AOJu0Yy/tbRW0kdKU2TUINSSdNz2vycLEhzwjGxYC8x2sAd+BCR8WQfa
 rH8fDdpfZC6r+f2ebT0XCwiHqgRtziZBbaDFm795NPyyR8cI/qPfrKHyMg==
X-Google-Smtp-Source: AGHT+IHRVx2tGS+3cTPBsmi3XV1nvvLUEbEboiX/xfhFWFYuD805DoCJ/aHO5amiL0rcNgl4l4cUSQ==
X-Received: by 2002:a2e:7412:0:b0:2ee:80b2:1e99 with SMTP id
 38308e7fff4ca-2f15ab2a42emr118137401fa.44.1723041273935; 
 Wed, 07 Aug 2024 07:34:33 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:33 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:07 +0200
Message-Id: <20240807143318.439619-8-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041274; x=1723646074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDO0H7g6HvOhDLFIQWieU7op6I4zAnpFJIu+1DC2YaQ=;
 b=NhLhOcAaAHxu0Vad+xyx8jxfe6zv59TnzC8nKa5kYTMzX4Ql03EJZKh8ULPiPXPMuI
 ZdRsD+/yeYtABALzlvARivp1SnINCDD/oX1fQsPr2vNXUGakK97QLyGfLnqcPVeiI2Hg
 Ojn4PmhMhnN81qJMch9RU1ElvOMkljOvWmN1ltncANVhrR7yXgE0wM4Rj7v4F42fLoXn
 Tvw4YupGH70dJGiSSW0dOG8h+DFeZ2rsZ5mh+inxRUmxDJS+aO3l/2AnoSn+ST1UH68Z
 whP/ukfAYWHBIml9xBNS2KqMZnaC3kj0NbhygaVR3Yu/IN7HS3Al9UUyLES2/3V8NwP9
 Gfzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NhLhOcAa
Subject: [Buildroot] [PATCH 07/18] package/erlang-p1-stringprep: bump
 version to 1.0.30
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 +-
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index 50a48af0a4..6df5048dce 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b07daf2148829d513caf2931d463550e70252a78ef99696dcf444d61d93bf940  erlang-p1-stringprep-1.0.29.tar.gz
+sha256  8fc39340e73b0f77c2c77ebb486c5c2309ea3ec46afa16cc03db35d200e3a5f5  erlang-p1-stringprep-1.0.30.tar.gz
 sha256  f44415631770cb818de6d92f3961fdfe6e407a5154f84b87cc06ac27323e919c  LICENSE.ALL
 sha256  42aef2a1337ef1f45ae2832aa5aa268c79b2560fb1f3ebab519629372cb24ffe  LICENSE.TCL
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 09e339f57a..4f925c0682 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.29
+ERLANG_P1_STRINGPREP_VERSION = 1.0.30
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
