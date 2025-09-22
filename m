Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE269CAC5AA
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 22:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D84B400BE;
	Mon, 22 Sep 2025 22:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPIXuRDRLqLq; Mon, 22 Sep 2025 22:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55A1400B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B55A1400B4;
	Mon, 22 Sep 2025 22:26:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DBE8E7
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B08660777
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_V7hC4u2z3N for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 22:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B2F960760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B2F960760
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B2F960760
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:01 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v0oyq-00FwCS-TF; Tue, 23 Sep 2025 00:25:57 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c491a9eb;
 Mon, 22 Sep 2025 22:25:55 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 23 Sep 2025 01:25:47 +0300
Message-ID: <20250922222555.351974-1-aperez@igalia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vTRdyUnuQ+eIkD2Jj+hcIREkm+GDOmFOLmhsUBKkRm0=; b=sJWNQBcsGmwHw3ufPEYh74cqY3
 z6fbR+ByANRLVUpn9xMIxQzHxnbHh3tPxFQgo3mLjQsYxY6l5TJsEhhf2902AC+zDWJv8ZuZ/+Lvg
 Rtp0SEsRruVYPTZftUIjqcxs/1ZZD7h/oi1Nc9NFhSDOyaiBdk0H2r65SlfPNU8WtCqVzp6NvQYl7
 HlPrf8BUkHqjNEqATQJXNpVArGHvz+i1UHglEgaEmexQhO6SHG3KeD9GFK1rlPYMlq4rsTBK0F2yf
 2coRCdgy2+IEF+NsWesTmi4h2joI1hgJr0Czqt4joMUKV5VA91mElwcMUQ0JbKczdwrPO77aKzT/o
 rTScT1LA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=sJWNQBcs
Subject: [Buildroot] [PATCH 0/2] Fix sysprof build
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

Hi,

Sysprof was incorrectly trying to use libdebuginfod, which is not
built as part of Buildroot's elfutils package; and also it has a
hard dependency on libdw, which is provided by elfutils.

The two patches in this series correct these mistakes.

Cheers,
-Adrian

Adrian Perez de Castro (2):
  package/sysprof: disable debuginfod support
  package/sysprof: unconditionally select elfutils

 package/sysprof/Config.in  |  7 ++++---
 package/sysprof/sysprof.mk | 10 ++--------
 2 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
