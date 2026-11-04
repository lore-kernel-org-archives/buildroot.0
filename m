Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A68606D16C
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JcPcZLpm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYz1WoHJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66E28408D4;
	Wed,  4 Nov 2026 21:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Tp2CXjqusjQ; Wed,  4 Nov 2026 21:00:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6EFAB408D1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826030;
	b=Q/b+DMA108ukEVJDvTBaNi4wvLx2Ku73qkgHNpuXU5yKmJygo9WDGNclXGKFrAE4+ZwG
	 SIm9vc//Ck0SCnl76z8G9S32Latb9BaLWEyEGaHT0k7vJbzMPP0W8LqpCe1Prm43YkZfz
	 We5KceBMcpwZQbpSKZG3eM4OP7x8AX/tuDnR2PH00xeR7rMUb451lC3uMCVynlOvSx+zo
	 YLJPNFiD4y+GHaS9Jgko/NPChi5IoPjeAZunrsAyU3lbsuIUpnMsE7jRZ/hFq2VIyXha0
	 56mervKH5gLRRmbmtvhYjQo3qxnasar+VfDJh2PptHNUvCUhlfAR0ihCj4/ABaXy5cQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826030;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=oGwV3lBGeEc8hWNbQIL2gWvgSSfXPthMa0FCYFVpDUY=;
	b=d9nxq6MFIeZq4AkxtnGDClACxJs4zWHtIB/xa8hYjV+WVKro5/37X2fMkHSmjqZ0gwtj
	 WdEih1TIs5KRNvp7qlhFm4e4huidQmB+bNlYHmHcXtL4hrzuffN92qWJ0qCrmW7spVOdK
	 Y3qRfB4a1NCKxpV/m4zEbPpLHfn94BPNGEoq8y0l+2/XPX2YOKafubOPLeGBGgFtxWCVi
	 GbLDWd8kT8bfT8ooZVmro2WXW77MhrEBU+lS6LwSj2Ev4JXs9Pi5jheRak6Qnofrsr6LQ
	 psyfrO2fPgvS6qATX2CSwkYhHWSVA1b8ZMQq6rFtO+JQN+5/H07a1EAX37QpMaoBr7w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826030;
	bh=oGwV3lBGeEc8hWNbQIL2gWvgSSfXPthMa0FCYFVpDUY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JcPcZLpmIsZRRPzT72Ru56rYZ3kb50uGAmMtEIWKm5qpV+PxWziYtAw16y2pzAwxA
	 i3FpHe3P51L5rtt2k1/ourlH5Kduq1nA3TWveA83JytTIBsJpDjup64QMx2+GGd9wt
	 7CnHAy9Za7oUFLLLkKRWaV71+l7XKp174178FBhW7J/UeUSqKwLleNy6NUJ8uOgoSf
	 7Dw7jcslr/xruk7maJ5OUSwKa+mELLQiDcqo6g0x8Syo0uB7nH53W/habdUygDowRX
	 4mLLpRV3jNp9XKJTcQDxN2Iamef7/zvarsV4+E4nBLKri/rSVbcUV8MghTIrmZVdvn
	 3rHdWp42gxrLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EFAB408D1;
	Wed,  4 Nov 2026 21:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73BF7B00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 662A76078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90Uow-7VqbKy for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25DD1605C9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=PYz1WoHJ
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25DD1605C9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4910b863b84so7172f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826025; x=1794430825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1FfaMAmWNrheuJoXAts/+Pd8DSzTjsF0ONpg1zLkQxE=;
 b=PYz1WoHJklmWwHwMUewRQhoFFGXVJw9ALk46SnnBNEEwy5Yp3FFmULQQaRDPNYBcvG
 Cxz/Dlpk595rPVzCj9cxTW7r26LjX1SA5lQbvE6LRni0js86YCW+FGhHIMLml451INpK
 EpJ5O55VAVdj3oLZ4ZMyCKQAogD7XpGIal0r1AGDsT4LQglwnVX6bRYiO3j524UbKjdr
 ZMeswv2ZyzBNZ8Giq2KGuNZf/YaNkdnOYEoMdyygsubeao4WmXU7TcImBLnR2ubgDWpG
 pe+Bl8gl8VAeO6tIQTgjXy8UtwXoaAtxbMNZJ7BgigQfTBXFYlnjlEIRkKfaf08q+okG
 SqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826025; x=1794430825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1FfaMAmWNrheuJoXAts/+Pd8DSzTjsF0ONpg1zLkQxE=;
 b=BPZCmrIZsE8iDHwL3NggTg0VRrXK6TUrJ54yOsHDlJ88T/h/XRcmCefCMR1JkqEUUF
 wUHN/Ql9KjdXZyL40FD5tGIcsnF/uE4dU3pTBEx1H6eOiIQdphHEXbwm7jMcBTuJWUZl
 NKCn0VyqBmw82eTT0Wl8CBmTJHDhV8siGLObIdT0uexkRrpkrPzHyXmjD1GpvYRKbKm6
 ff+y7fuGIbr+2teyJiF3S88Mj/XIZ2iC2Hk3xfK0NDJhB4RZbHGTwygbk9KtzLnsHKxT
 Ckpty3p7yUfonKsQiOqq2DPGScxM+nzE30XV79ZHlKaKdriQ65/VHEO45+LuXaWNrjkN
 Fzog==
X-Gm-Message-State: APuU4Z8s9abu7IG2lYqEdGZH6gtQZSRf9MX4nhLgTz88/h4B0cniY0tp
 Cdr/0iqDahapNIdhJT/cTcjemcWBglxZRGmQqRbCgEztwmHWl3s6K2oN3Gdf6A==
X-Gm-Gg: AYBFou2bJr3pOCqg6H3KkqzBCQP6sRxJ4cb1t+2P5b+7q2hka0BhA4HTfYTDOi4uznj
 2RDfoJchofkGd2K7ANE12rJpWmhOqgqFQol2Z+EBZ5jvnUmQK3jnzylaQXu4cIt0JXiWLpBityd
 ED7TaEGV7oaanzkVEyyHV8fJTQM1QDhJtU9UHOB2yjfv3mGmp75zpRdEOUpHePXbCJ8OFajJDDv
 J9k02LdKgPfrJsv4C2AC+EF96ZXa19m0T3aPv4V/GzN6kiC+2YIjPb8kZMs8SHzgx717msPSbWL
 aubnGp6P9TZR55mT0G2vTmgkszRf7R5Hi3cbCCdNOLU7Gp3bU3sNNMEHw9ym1qglM26ezLD75Zl
 T+zhCX2hWntp0ljhLBehTOwWO4Ge5ZonO6qJ4RW3casIxew7cnEnC0u61O2T00eN52XC0h7psVj
 boVRBGdE73nmyYAU7TBR3AN0gbn8vLA+arBR5rQjgU/+vXzUDvHjsKUtC/EvA12h8oyVbVPwJIH
 h4OzqqVMv0d0TdQrmv3nYiokZSSOXSUG1l6ncCTaHDg4IekNTNvPPk2RfV4EVQ5nNU9t4ijPhuo
 N3OHDst4Xxd8Dr/On7cv1z7u/1dfZ4ncQQ48otCwRm8FEKdpGiw8gQ==
X-Received: by 2002:a05:6000:490a:b0:48d:fce6:884e with SMTP id
 ffacd0b85a97d-49115ba1aaemr1039436f8f.12.1793826024572; 
 Wed, 04 Nov 2026 13:00:24 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:23 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:12 +0100
Message-Id: <20261104210019.3509258-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/8] website/download: make the table responsive
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The releases table has the same width on every screen: on phones, the
release dates and the download links are cut off on the right.

Wrap the table in a .table-responsive container, so that it scrolls
horizontally inside its card when it doesn't fit, and hide the "End of
Life" and "Latest release date" columns below the md breakpoint, so
that it fits on most phones without scrolling.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/download.html | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 6bbb7c8a1d..0a47106921 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -7,27 +7,28 @@
   <div class="card mb-4">
     <div class="card-header text-bg-primary rounded-top">Download</div>
     <div class="card-body">
+      <div class="table-responsive">
       <table class="table">
         <tr>
           <td></td>
           <th>Series</th>
-          <th>End of Life</th>
+          <th class="d-none d-md-table-cell">End of Life</th>
           <th>Latest release</th>
-          <th>Latest release date</th>
+          <th class="d-none d-md-table-cell">Latest release date</th>
           <th colspan="2">Downloads</th>
         </tr>
 <!--
         <tr>
           <th>Candidate</th>
           <th>2026.08.x</th>
-          <td>December 2026</td>
+          <td class="d-none d-md-table-cell">December 2026</td>
           <td>
             2026.08.1<br/>
             <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-10-22</td>
+          <td class="d-none d-md-table-cell">2026-10-22</td>
           <td>
             <a href="/downloads/buildroot-2026.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -47,14 +48,14 @@
         <tr>
           <th>Stable</th>
           <th>2026.08.1.x</th>
-          <td>December 2026</td>
+          <td class="d-none d-md-table-cell">December 2026</td>
           <td>
             2026.08.1<br/>
             <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-10-22</td>
+          <td class="d-none d-md-table-cell">2026-10-22</td>
           <td>
             <a href="/downloads/buildroot-2026.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -73,14 +74,14 @@
         <tr>
           <th>Old stable</th>
           <th>2026.05.x</th>
-          <td>September 2026</td>
+          <td class="d-none d-md-table-cell">September 2026</td>
           <td>
             2026.05.3<br/>
             <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.3/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-09-10</td>
+          <td class="d-none d-md-table-cell">2026-09-10</td>
           <td>
             <a href="/downloads/buildroot-2026.05.3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -99,14 +100,14 @@
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
-          <td>March 2028</td>
+          <td class="d-none d-md-table-cell">March 2028</td>
           <td>
             2025.02.19<br/>
             <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.19/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-10-22</td>
+          <td class="d-none d-md-table-cell">2026-10-22</td>
           <td>
             <a href="/downloads/buildroot-2025.02.19.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -123,6 +124,7 @@
           </td>
         </tr>
       </table>
+      </div>
 
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">https://buildroot.org/downloads/</a>.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
