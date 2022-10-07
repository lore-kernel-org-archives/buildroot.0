Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B793AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 07:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4416A40360;
	Fri,  7 Oct 2022 07:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4416A40360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNTvYNisjOng; Fri,  7 Oct 2022 07:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 713FA40106;
	Fri,  7 Oct 2022 07:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 713FA40106
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3DA51BF392
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 07:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF53E40106
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 07:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF53E40106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2zqKN6qB6hJ for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 07:27:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7747C400D2
Received: from mailproxy02.manitu.net (mailproxy02.manitu.net [217.11.48.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7747C400D2
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 07:27:45 +0000 (UTC)
Received: from [IPV6:2001:a61:2571:e101:cb62:e29b:df1e:fe65] (unknown
 [IPv6:2001:a61:2571:e101:cb62:e29b:df1e:fe65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy02.manitu.net (Postfix) with ESMTPSA id 125D7C00B3;
 Fri,  7 Oct 2022 09:27:38 +0200 (CEST)
Message-ID: <44ae3630-5f21-54d4-8d77-9cb9fa137289@grandegger.com>
Date: Fri, 7 Oct 2022 09:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: [Buildroot] [PATCH v2] package/udisks: install to staging
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UDisks2 provides a Library API [1] for accessing the UDisks2 service
via "libudisks2.so". For development of UDisks2 clients, install to
staging as well!

[1] http://storaged.org/doc/udisks2-api/2.9.4/ref-library.html

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---

-Changes since v1:
  Remove note about the reported bug and add authors listed by
  "utils/get-developers".

  package/udisks/udisks.mk | 1 +
  1 file changed, 1 insertion(+)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 2bf519a2cc..959333d01f 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -10,6 +10,7 @@ UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisk
  UDISKS_LICENSE = GPL-2.0+
  UDISKS_LICENSE_FILES = COPYING
  UDISKS_CPE_ID_VENDOR = freedesktop
+UDISKS_INSTALL_STAGING = YES
  
  UDISKS_DEPENDENCIES = \
  	host-pkgconf \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
