Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EFEC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9814A60670;
	Sat, 13 Jul 2024 09:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUpbN8crcKbv; Sat, 13 Jul 2024 09:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A209D6069A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A209D6069A;
	Sat, 13 Jul 2024 09:33:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD751BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 092EC6069A
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMrRB2p6Ricg for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28F1D60670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28F1D60670
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28F1D60670
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:33:23 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0DF573536269; Sat, 13 Jul 2024 11:33:19 +0200 (CEST)
Date: Sat, 13 Jul 2024 11:33:18 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZpJJ3vTjho2fmfAh@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1720863199; bh=ud30x2hBt8hdzUwF21f/XMU3nwKX/zWFJzewepQ9okM=;
 h=Date:From:To:Subject:From;
 b=hYIihjQWWZx5Q4XVF4AjMPvLx8RGrBeZ5JjqjWEdiMjPDqYm5wSnnqckpqCyIgkey
 G8LtdpMqwCDPzHMTjPBXkgwRcufHw4t7gRO+t7A/CIatgHQgOkP+EWI0Be8xBWGFNW
 tt5mvA01goUBUJz4E8dwYdfOCM5gHf9nY3ogZYAF37811T9vBVUTZ3NQ1iJiK8d8m/
 VXuDxo/wlbi8DCEDzp9ApoNg6cwOARbl/npKVBMoKzblgA/96Mq+W8QQRrvmDh/Mp8
 HqGTKapQHeV4uoD5x57h+GgD52Z9N0H+F2mVUG23Va1eeyGcbVNILpd+FqGzzq1FFI
 yhetxVeBEbwFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=hYIihjQW
Subject: [Buildroot] [PATCH] docs: add time64 status of uClibc-ng
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 docs/manual/faq-troubleshooting.adoc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.adoc b/docs/manual/faq-troubleshooting.adoc
index 5f132f99f6..e08c2caa50 100644
--- a/docs/manual/faq-troubleshooting.adoc
+++ b/docs/manual/faq-troubleshooting.adoc
@@ -253,9 +253,10 @@ There are multiple situations to consider:
 
  * On 32-bit architectures, the situation depends on the C library:
 
- ** With _uclibc-ng_, there is no support for 64-bit +time_t+ on
-    32-bit architectures, so systems using _uclibc-ng_ on 32-bit
-    platforms will not be Y2038 compatible.
+ ** With _uclibc-ng_, there is support for 64-bit +time_t+ on
+    32-bit architectures since version 1.0.46, so systems using _uclibc-ng_ on 32-bit
+    platforms will be Y2038 compatible when UCLIBC_USE_TIME64 is y.
+    This is the default since 1.0.49.
 
  ** With _musl_, 64-bit +time_t+ has always been used on 32-bit
     architectures, so systems using _musl_ on 32-bit platforms are
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
