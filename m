Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795F7D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 506D4823C0;
	Thu, 11 Dec 2025 19:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTHqn8V27i1p; Thu, 11 Dec 2025 19:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB828249E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481429;
	bh=l76CcvZIl3TiW4zRDXCNRlRXiwUPcA30KsDRE6wNZ1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TBClsI8Qq0UpjdPEI967sHua+shM1l7if9oBctmzS6beTehuZXlLQz+Z+t0wUltLH
	 TJwdD7RzcMnf+KM/jiWOHiLBMrH/Srj3xGEJu/bavZZj0FEca64LP/QcAO6o/ndhDY
	 mfClqTyHMAvOVRobGzwgcN5VEqZjn2cTuNoywNQu9XYkTkxUum1sbUaiywtvdiLU50
	 XuHpcdzXoIosIksxt8U1ikoq3Y26lwRMZi08SimZPmmlGAzv6uXTtoSdUAmxbteLu3
	 iVVWV2tpygkSTxbheFnNyfri98MhPr2YvpxlbHxoR2qZ4CSpVgpFgk/gwBnASxvkIV
	 Za6AjNznnFMqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB828249E;
	Thu, 11 Dec 2025 19:30:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 117942C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5340480D8A
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JW97N6o5TyOs for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52CD180DAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52CD180DAC
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5237D86BE2; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:38 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: c6f1bc8cb7ac5ecf242a1bc22ba023119d02b763
X-Git-Newrev: 1d13662a5fe393530abeb5896fc52168e1b5730b
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.5237D86BE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/softhsm2: update
 SITE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d13662a5fe393530abeb5896fc52168e1b5730b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Original site is down, unchanged tarball can be downloaded from github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dd2b3607940123a3aa1ab870e55021f454d19fec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/softhsm2/softhsm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
index 5e37e42dde..ae44b93bc4 100644
--- a/package/softhsm2/softhsm2.mk
+++ b/package/softhsm2/softhsm2.mk
@@ -6,7 +6,7 @@
 
 SOFTHSM2_VERSION = 2.6.1
 SOFTHSM2_SOURCE = softhsm-$(SOFTHSM2_VERSION).tar.gz
-SOFTHSM2_SITE = https://dist.opendnssec.org/source
+SOFTHSM2_SITE = https://github.com/opendnssec/opendnssec/releases/download/2.1.14
 SOFTHSM2_LICENSE = BSD-2-Clause
 SOFTHSM2_LICENSE_FILES = LICENSE
 SOFTHSM2_DEPENDENCIES = openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
