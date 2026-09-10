Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAF3C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 21:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50EB780E75;
	Thu, 10 Sep 2026 21:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNoYMPuG3zcs; Thu, 10 Sep 2026 21:57:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0AED080E2C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789077448;
	b=gIfyKx66GzrAGkYqmbq2EZpCiiGFHPFX+FzCXFHiQmwqrO7+yGIDHOjlB3afVsNRe7ed
	 3nRuw7qlE5UwoGVShDzKC6lF/gCGr/fMbseEFH09XW3PEqfv+yWb9u9ukTy4Nydw/LqjN
	 YghpZHAJoSMWVMJpFaZNbrKoUYngeQtLttOwLcyDOJLTTmAKn2/0u2ynqMuqPOU83A6/r
	 DZkCsGWzi7Hv3ki84l2/j+jqZcwiwNqXAfeBw54ZhRdILGM8LcRYoiInSFM8eumuAV49u
	 OpM/WYYlUKoijt9aytLERIxg1Naa/9IKf8S9zIsrcGzMSTfUd8AVWMCYBWJbzuxOffw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789077448;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WhrBAWU0MQSRp3Zcq+zJRBBZ17/qorpHCP5GTCceRNQ=;
	b=qJ8wCP3nHVtAFNxxno/EK0y43b6AjX5K6zIS6GNd5eW8hHz2JbL+op1YcBNaut5J+Q0k
	 b5XSFx3/j/Mqcncs486v0mHdfXqUsLw4hPju+pRcjtnuGJX/8wEUaDkA5t4IEHisfVEmZ
	 7Hb5ZxrqI8Z2BJgXSwlamqrwlPxb8QJMuGNCNT0Q3EaxpMo8hpTY+EHClC8BQ7iajULct
	 r7c+QXp4Ncw4OQ8E2WXUjXSsP1ZxviEXLsjt2x+CY73uNuwvQimjhaOqnzZKT5s+qAFU8
	 1rN3RL4bui4Dd7SZIpa+0dpoH22RnhXDfp1twHj5Y/Sbr8n59j+8nxLSA3XLukD/MFg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789077448;
	bh=WhrBAWU0MQSRp3Zcq+zJRBBZ17/qorpHCP5GTCceRNQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hvulJnhZy+F6J0X9w6D58ram/H1W2bAg5GM8aLMhO5S76nwbiuVUWjlP7vfHWSjUC
	 y+HP8LntdgpE2acrUOqQF6q7pJZY1f7zjxlIt4rIR84FHg/AP0rqJcPVEB8KOlTQ5+
	 g5WoDJI68RuOR/Qjm6Q+FBmlvf0tR3s9oPZAZ+Ty/lXAsA12Ds+EwBiucB5P0RLLkn
	 DCwl9p9G1H/b4FScMipovfWRZyC43yM75QqiHzWlhLqUorVi1doZJiZgjFuTh9If7P
	 hqqZDYSJyW5ZdMYY2h7ihxDeXnPXFToEAHLMlfVWqzqYXB1V/6T3nkEVC4MYcdnGKx
	 ODo0ZdzVT0Umg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AED080E2C;
	Thu, 10 Sep 2026 21:57:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1742049D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09C9D40077
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yp_-irSGQOW8 for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 21:57:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ECBB340073
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789077446;
 b=bM+HxgObfqXXI1+wiOnxB+IMEaBTq0eGKuB9oo+Gg6O5xYAdpJLgkFhomBBpEMvIHmZ+
 PkHNAKpOc64zy+UsmVRBAG617hJbOVr/Zq0NWi/GuBuaSCHGmvV0CB53a2d3F3CHYUC0C
 gQijrHyjEFlx5xeQO0iNIgwWMjLDKE53aEEK1+kfiYmq5yTLO5mGU5cVEtKIuvxBFexUJ
 VF0qxkJdqwo30jIsaja/+TNIVljZHmtFneSaR2wDaBY+AOjqnIm+amxPObbfEAXBb+JAg
 3s1KYwMbbNRW/yGVjfhPpaPS7LL5rRk9Jat1sLhAyT0O53t61wTVvgRtrY0EhfEWBfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789077446;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=T/NXRSr4CNC7uvElejqi+aqkgYuzFuTrjlPkkO27xlw=;
 b=IDpP9+0FptyBOMWuQ8idVhSR/21XNY9XejKPaW10f6JsC/BmkC9hU8RiY2R6lZSS5yaU
 vMj1Kwp/qsORONqoxQz/7/5o5wuDOFOVSb0FIEIth6l7/OUr81MeSn/HHIZpjH8ILG9zi
 pqMej/lU8XEW6rSNrqRXIDK5BkcvLThSrNeLC3Gl7IYQynGgWLPG8fI5wMgPUT76tPU/l
 vfNZGEONL3AsX4qJc6tT5EUzGD799ozbDoLAPrCfD9LCXSXszhiMICeTaFbcpqX5vhtC9
 Bxs8aToD/mdW9Yi5aru8b9khXvuJdnRNP1e+u4oGL6mG70uqmDtx6QiqV8mu/ZKxbJw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=REor9gBq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=REor9gBq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECBB340073
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789077443;
 bh=T/NXRSr4CNC7uvElejqi+aqkgYuzFuTrjlPkkO27xlw=;
 h=From:To:Subject:Date:From;
 b=REor9gBqXqGiXF2sBCGdCXU4Zc9/sbokaCCqmpe2qDw5gSteTdUQAjkxo2NA8uJRB
 FcsyBerqJ/HU6heoUept4sNYPGDzyP1mvHdxSZXBk+/k/k9UR1O2FItPURcTQD/yQU
 CirpMiGekJYI4W4QJRG9DC1awyZ9YRbqv+hxhA0Jkx3jKrT9KudbP4V/tVqlIP+2m7
 78CXHW0wU//CpuhPWWJy2x7TsAo8EjhpxbG85eFDCRMMAhEYt38avpIeKkx8d0evjU
 QcolkbNeycODe0VmyrWilxWnhVclt9uO5zHNRlNUDOODiqYy3mbFLDBzo2PpVwtqdh
 VA7EpC244Pv2Q==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BEDD8A4C1132
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:57:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55764)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4mln-000000007a0-1YIH
 for buildroot@buildroot.org; Thu, 10 Sep 2026 21:57:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 23:57:23 +0200
Message-ID: <20260910215723.2585965-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/apache: renumber patches
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

Buildroot commit 99bfbef093f41f20dff305dea83c7763c8b34a1b removed patch
0002 but forgot to renumber the remaining patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...02-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch} | 0
 ...03-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/apache/{0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch => 0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch} (100%)
 rename package/apache/{0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch => 0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch} (100%)

diff --git a/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch b/package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
similarity index 100%
rename from package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
rename to package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
diff --git a/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch b/package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
similarity index 100%
rename from package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
rename to package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
