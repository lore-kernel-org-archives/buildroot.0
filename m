Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F52CF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 02:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 818E540042;
	Sun, 22 Sep 2024 02:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LllkY_xx4NIm; Sun, 22 Sep 2024 02:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3068040449
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3068040449;
	Sun, 22 Sep 2024 02:07:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFCB61BF419
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB6A540449
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NZofnTMsghC for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 02:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74D9640042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D9640042
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74D9640042
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:07:48 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-71798661a52so2491171b3a.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726970868; x=1727575668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwzTq/xYZfVZX/llYqR9W5l+ZGavq0IDCc8fywLlzBw=;
 b=VUkOmRsbIaWZ0TKAgsYMR48Cv1vh+InqjlR0KBvUqHzI/ucqGWE0ndMKG1tRsfEXtt
 JJnldm3nDMrL9xGo+GbIE1Ilw7OhrEUR6RgP1KMeLNpwArReJcJOKxbtjoLzifXpnO7b
 VwVypSfKRIr9p63c5BgOQkYsaGxvvDknx0aFjbHwAAszR545rJH8d4wO5PcBLmk1bQHP
 QIvxcHJ4NzCvFbk9tC8O33BWeZl1b5Ch8edhdA+8ezs0qJtbbo1KHjoQ1MpqfjzBxENT
 P6XFbdlTysyJ+zB5/HziE9lSsQTALZoKrX5b9kSj6zV1349QJqSierhymW2WHGG8h6Km
 lvGw==
X-Gm-Message-State: AOJu0Yx2CdR76FTj68x8DqD80ljlVZjcwZt3nMoP96Z47yH/+hnfwBaZ
 mHJwWNCZ0bMrBA/lbkK84OlJ3X3vunVll8r4ZItflwNi+Gm9n39iCMp4aXBHH74=
X-Google-Smtp-Source: AGHT+IHaLyYLJ+l7y3wgcdDl3ncu/HLNdYHBiVGI8LmM7zONlcs/yo+kIyqDsOv6zgkdBZYa7ORHHQ==
X-Received: by 2002:a05:6a00:460e:b0:717:8a98:8169 with SMTP id
 d2e1a72fcca58-7199b06b62amr11821137b3a.1.1726970867756; 
 Sat, 21 Sep 2024 19:07:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2600:8802:2a05:9000:19d8:5269:4572:b863])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71985b7a2d2sm6193029b3a.155.2024.09.21.19.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 19:07:47 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 19:07:30 -0700
Message-Id: <20240922020730.2420819-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726970868; x=1727575668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vwzTq/xYZfVZX/llYqR9W5l+ZGavq0IDCc8fywLlzBw=;
 b=dpY8vJ+O8aaKmwKaJlR7ybPWN5JyjlukMJ3yURx/v6+kFpgI7YbHx75ApliQ3ECVBp
 CwWNhcRDu2Se7OtmbWJd0OsLu5dpDkFB16wWdxSahgXYbnfNVQhIi1mpqg01g3lE2mhw
 AEu3Dv9HgZ+fWkJr+DCI2aYiI11dqNfJZbsD4n5/R7qvj+hXIiCq+BRzdkQ/a0Py1O/Z
 gHXdMmhKgGKuYWNvJ3hoCjGYejzfshWujmEl7+KcVnW0IcoEjWs+Gp0CUdrn8HZtFTCn
 s/fdXKkplJIhBejA5gHUnJXangAipH4mzWhY/MIs7Snucy2Nh8icSbK1wSwd61eROsob
 qTyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dpY8vJ+O
Subject: [Buildroot] [PATCH 1/1] package/openssh: bump version to 9.9p1
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.openssh.com/txt/release-9.9

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/openssh/openssh.hash | 6 +++---
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 44f9645035..5758ce4f36 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.8
-sha256  dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3  openssh-9.8p1.tar.gz
+# From https://www.openssh.com/txt/release-9.9
+sha256  b343fbcdbff87f15b1986e6e15d6d4fc9a7d36066be6b7fb507087ba8f966c02  openssh-9.9p1.tar.gz
 # Locally calculated
-sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
+sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 7065c3ae4f..95c059e03d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.8
+OPENSSH_VERSION_MAJOR = 9.9
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
