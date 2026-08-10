Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FE9C5AD55
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 16:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EDD605DF;
	Mon, 10 Aug 2026 16:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUrcw7uz_5wi; Mon, 10 Aug 2026 16:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A81C60727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786378251;
	bh=Q/zdTkG1vUUO7SN3OCNKPYeWUx+6nvHbszWM8Im3qdE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tlr8F8tMec90E1QJ7gcLe8lqip3w5BrG1V+zkqvEbB29DaKJMwYdblhNoAsSdTwSt
	 Kfl7BbC+I2C/nF8H6VyxIurNuisyXhnzS1LHDeMcx+6jEbrxHVWWhnySr5SaELN38a
	 aWlqFjxWvsTjiuYCbl7bUMdvg58CvQL3y8OIy1guInivYXO4LpCQ/EmP5cuGQ3honV
	 wXnupJP7mm+Ra+lObWJLjrzzmVeNfvksnML31WH4nxzPvccrqSFVnG2vPwHZchmZOD
	 vqyrnNq1imo37y+X55BDaE5qY9vb5gjPvDmaiBi3p1Ob1szzMZWTVjQ+6Y8CUnAbXp
	 YWOI5l3mp9lHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A81C60727;
	Mon, 10 Aug 2026 16:10:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3257A1AF
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 16:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2434A40642
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 16:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHKbSRY_XgnF for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 16:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2684A40640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2684A40640
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2684A40640
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 16:10:48 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38e88b60121so1784621a91.3
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786378247; x=1786983047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jj23MK1hC4HxT5M9ZbdOzZLc0mEm6SrAgrunAGhPDJg=;
 b=Idovdga+6bR+PeN+j5S00hV2axjIHmYpcXBBVu+1gf14cB7zGjP5lgYgkNTVYg3s5d
 HVNJnKE2DrNa8OYEgD9k1cIDrHRl+DlVn+Ai5tWm29wl39USl+LxUUYaiEuVBeGVSul7
 rgNYO/nFEF9uzjW7MsslWGoxgH2aBJzFXykKSaIuiYjIbRcj6Hb9Saiu3to5bkZ01txs
 9VRdY98G+awno5rt9vHZfd985EdGf5DTUexSVJCE86UWeDOUrdncgHztGf8tOqk+kO/6
 S20c9Eg9j4/NNEsTV7e+4LCzLvztzY9erGYklXH00azGazH4D/vLJ5DpOzQ5D4r+OK/j
 b+zQ==
X-Gm-Message-State: AOJu0Yw2uoB840AXvJUEpUG410m5QFijzjO+iv5jTm6hCb1lb+jZWSy5
 1+KkPuBzWCS/kBSN2jl9/I5JEamkRbmugLNd9cOaFMlSLRs0+KgcNcI1KTdUHn/E
X-Gm-Gg: AR+sD10HCuHWAAE+EJtL2xadsvt0vDcbaL2P36QhdpwzT8p2zHPO/SNNwPTNaWdsRKb
 iu7AK/rEh9vqTOkooGlDVg4gjECmFHMVCSKtrWaroMLqfFqC+PxOAA7OwXkpnlv7ooecQM4rqV3
 LeMmUZKbUpnx2tpijN5syl4L7tvB6cI2iQK8G4Bj4pG+aBckTdRmR1jXEGOupe3ND8C9RNCjS2e
 QEFRvFg9PtHFO+MBBfT1PgrWjkeRpjJ3oRnqRcq5YYr/2a8EaW3rQIqwTK7IpkevRQ+nTIYBrkG
 L5aHhSnp43HUUIplRFvfczg7+blDguXD/xOHT/a7ISVa10QTr8TDKKfQ4pE9XWLnQB4UI54Pht3
 jC7ne+kEGlXSu6r3cdxQezJs1pQR1nslT+GtwmdS6k0+mHVPMR56KeTu8MGvEV+jU6pcnOTHeEJ
 H5pyHbGD9yW7ErrtAM4bq6E/nvAjwtfbPbHZ/BXPmW5ynmVCtIGRD55YkmfLEpFUPK/Jwmdw==
X-Received: by 2002:a17:90b:3881:b0:38e:2517:5d1f with SMTP id
 98e67ed59e1d1-392823aba6fmr19355542a91.9.1786378247157; 
 Mon, 10 Aug 2026 09:10:47 -0700 (PDT)
Received: from fedora ([2409:40e5:1164:f0da:ce1b:8575:cc78:84c8])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-315be8a6809sm46461770eec.10.2026.08.10.09.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 09:10:46 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 10 Aug 2026 21:40:19 +0530
Message-ID: <20260810161022.3779199-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260412182023.96383-1-chakrabortyshubham66@gmail.com>
References: <20260412182023.96383-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786378247; x=1786983047; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jj23MK1hC4HxT5M9ZbdOzZLc0mEm6SrAgrunAGhPDJg=;
 b=Bcbvd8pShVNGZDUgZuqE+h53VtIdCGNbIvFgBs+5pzcg566f/+J9qRWmkG2P3I08Ss
 kD2BhpmCmjXz623mDCx597XaLZ0z+bmud8BI8ccZ9Bbyii700fUQOIULv6Hr74wc0eEj
 gVsJ6kq8tcgwupoxqcFcSxzV0+uv3m1Rq+lZldV1otq0C6KTZuLxvk+Xo7HE7rdI6eGp
 EWJLHJHzxVAVUBhJFVgEhSNHWF8XmJlyUHAbdHmLWRFCbHlDH+YlGlsKa93BkOGRcQwZ
 5UmcWRi5R0QZ1IXAYfj4jqUa/E2zNEDqGTsvyzzXLseXZeq8YwgkHUEPa2e/LC31i1Nm
 WRug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Bcbvd8pS
Subject: [Buildroot] [PATCH v2] package/bash-completion: bump to version
 2.17.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/scop/bash-completion/blob/master/CHANGELOG.md

The hash of COPYING changed due to whitespace (tab to space) formatting
changes.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v1 -> v2:
  - Remove AI-generated changelog descriptions from the commit message.
  - Explain the license file hash change (whitespace adjustments).
  - Fix alphabetic ordering for bash-completion in DEVELOPERS.

 DEVELOPERS                                   | 1 +
 package/bash-completion/bash-completion.hash | 4 ++--
 package/bash-completion/bash-completion.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b7749df319..b4a6adc17a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3053,6 +3053,7 @@ F:	package/ubus/
 F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/bash-completion/
 F:	package/ccache/
 F:	package/dos2unix/
 F:	package/font-awesome/
diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
index 7e952e5b02..294ab65a2b 100644
--- a/package/bash-completion/bash-completion.hash
+++ b/package/bash-completion/bash-completion.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac  bash-completion-2.11.tar.xz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58  bash-completion-2.17.0.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
index 8b0e949416..fd046de8ae 100644
--- a/package/bash-completion/bash-completion.mk
+++ b/package/bash-completion/bash-completion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_COMPLETION_VERSION = 2.11
+BASH_COMPLETION_VERSION = 2.17.0
 BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
 BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
 BASH_COMPLETION_LICENSE = GPL-2.0
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
