Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC845CD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 09:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6560C83C30;
	Sat,  2 May 2026 09:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ANUaO73bwI2; Sat,  2 May 2026 09:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB8A83C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777715287;
	bh=VdHlFAnFEiRhz3ZnVxHmKB5X1n+PrRf48YPk377K4Pw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XwIR1x5L2pLjBESCCuwNz/9zTZlwPZ8Ngy8lhJcBIzlwRRyFhurly7trJOT38/YFu
	 vnOqCaK3b7b5GCIQuu92guRV5sNpoRlLgX1anmP3yl0Yk5PguhVvRAyl1nDmMpESuc
	 TpFe7xgK8x8LQWKyvlqz8Izf10o69/GPTuiL/Jz9mW01RMQPZbmTQZEBigB1+S/TrA
	 WX2Kv8JenxHjnRne+yOOeHQV1PnNrE6xlZPOlZb2lFqCJ5wTOxPOFII8hQjzDMpd7t
	 RCNfATbV+czqPDDHl8L1vRtb9t2qbAEh6LEH9WQc+FfL+j2ktDjXR0dV+lpUDGPYa6
	 x7JFf7xc/ZAsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB8A83C34;
	Sat,  2 May 2026 09:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 348C524E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA0983C34
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7YX1JqJznC7 for <buildroot@buildroot.org>;
 Sat,  2 May 2026 09:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4300983C30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4300983C30
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:48:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D816C7FB68; Sat,  2 May 2026 09:48:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 11:44:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f9fff2234506cbe975d69ac315fdd15737ca2e2
X-Git-Newrev: 3f6d37ab9a322562dfdc49a391c6e218f44fb54c
X-Patchwork-Hint: ignore
Message-Id: <20260502094804.D816C7FB68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: security bump version to
 4.99.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f6d37ab9a322562dfdc49a391c6e218f44fb54c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.exim.org/lurker/message/20260429.121733.f58d9686.en.html

Fixes CVEs:

CVE-2026-40684     Possible crash with malicious DNS data when using musl libc

   On systems using musl libc (not glibc) due to an oddity in octal printing
   it is possible to crash the connection instance when malformed DNS data
   is present in PTR records.

CVE-2026-40685     Possible OOB read/write on corrupt JSON in header

   configurations using json operators on invalid externally-provided input
   could trigger heap corruption.

CVE-2026-40686     Possible OOB read with large UTF8 trailing characters

   configurations using utf8 operators on malformed utf8 in headers could
   trigger OOB reads and might trigger some data leak if error
   messages are required for subsequent emails in the current connection
   and similar malformed headers are present.

CVE-2026-40687     Possible OOB read/write with SPA authenticator

   in configurations using the SPA authentication driver to a hostile/compromised
   external SPA/NTLM connnection it is possible to trigger an OOB read/write
   and crash the connection instance or possibly leak heap data to the instance.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index f9a62e0188..745b9f0977 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  eae967bd49a5f879933b8c6ec88c30475a1c6646232135f37f05b55dbc4e3447  exim-4.99.1.tar.xz
+sha256  25364f19988270d846965689dd29c662cf5de152639875d0d5352a69fd753a47  exim-4.99.2.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  41a280673b23a79684124dba9ba1db4da57047eefd7bac8560fab3e399659698160386c5369deb4aabdbcba1ba9278fb0a61fc1667dc2745c280b3004d02f45d  exim-4.99.1.tar.xz
+sha512  e5c80a77dca642c132dda82166c919ba9f553436038b734ef66ae41666b8c9f5818e2cd6080e4c7c8b52e866f7f89d271233fb183c7e405feb15536d507098a3  exim-4.99.2.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 47fe17b372..7129e2ebf6 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99.1
+EXIM_VERSION = 4.99.2
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
