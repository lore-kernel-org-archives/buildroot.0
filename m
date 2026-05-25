Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B94CD5BB1
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 17:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E375813F8;
	Mon, 25 May 2026 17:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcXtoKvEqQgE; Mon, 25 May 2026 17:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95FC6813D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779729571;
	bh=AunLVTF1Oqg5vFLtcvm1cTKv1QDUERBRCUzcHB1hAH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V6Lsod2/Fr1I5vMx0gFsDF57wpX13/dUsTG2zVAfKfCdZ/hmDCd6Ni9JGHg6VyS6S
	 /hTqiyGtQBI+ls5Ima5qWmjSuh5+7pAzWvpgeHcdsGuyEQ52iU3ObLkqhEJIZtcTG4
	 0B5ONlC9s+aoEHSRSDw4vlKPpQXZ/NI0gAnaTff3qbUuCi7CeBj2nnKAzGKG3i8LWT
	 KeOpCpd9Zd4zCvomCfVM6WcroQCfarGF4UfNUn6g+9QsyMObrv7LmXZxX41/LnxCtA
	 u+tMWDSudbRCkClDRJYBchOKMgnXUUI8UXK7kE1imb7ZK5Ux5kDS0pHjCaISgAkYQM
	 J8q+yLIbv1OYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95FC6813D5;
	Mon, 25 May 2026 17:19:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C34F8265
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F09C040A31
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBRutdcRs7Ss for <buildroot@buildroot.org>;
 Mon, 25 May 2026 17:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A56F40564
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A56F40564
 for <buildroot@buildroot.org>; Mon, 25 May 2026 17:19:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97AC6861B0; Mon, 25 May 2026 17:19:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 May 2026 19:12:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d4a6f8ae675fbc97eb36511395060d7528a846c
X-Git-Newrev: a85bcf789d2ccc844c77a1c6238c53e8518ea380
X-Patchwork-Hint: ignore
Message-Id: <20260525171917.97AC6861B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/snmppp: bump version
 to 3.6.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a85bcf789d2ccc844c77a1c6238c53e8518ea380
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://www.agentpp.com/download/changes_snmp++v3.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/snmppp/snmppp.hash | 2 +-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index e81bd8886f..450d24821a 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  52c038426d6e13d627832aadb905549ee32b5ca4b707ac446bedac05abdfd1bf  snmp++-3.6.3.tar.gz
+sha256  6c1a383085105805302b52ed922e35be00b1fe36981bdf7c34b35ffc635043ac  snmp++-3.6.5.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 9a84d74f95..10d1b6f8d0 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.6.3
+SNMPPP_VERSION = 3.6.5
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
