Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9CACA6017
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 22:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43304090A;
	Thu,  8 Oct 2026 22:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0AIiVmiSCw9; Thu,  8 Oct 2026 22:11:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4F354090C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791497468;
	b=N/GaudVjl7PbI0yB7JNZFPu5OPAhxPfhRdx2dKDPiFcaq03mcoIiJ165oVWr5XPOuRG9
	 aBSqOFWtRZB5fQJ2knaDcTr5/FMN+CZ3O4MmRua/UU7MOBAgdJwSXjb9r4uXJgOj0O01w
	 +v4Dk0OnswPLRrHc8vxw8B1UnBOEHFqmdsJmPDIVD2PuVosfErOQx6EbO4wnBEPGszbPC
	 6cceLcXYlIVYminxBpJyWAzzuBwQ7tlIMs7OIIOV/xK/gbJ63a5Xi3JWy30Fgu5WfKh91
	 PoCSXe4yS7KNIQSRp489Hu8jNzFA9WKQyxNlCC7FeB4U7br6GdehU5Ec9lijAbsuD0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791497468;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=KAIqawyXuakpsL9G/cMtHLRmOTrT8PQKf9L3E1C2DgA=;
	b=cA4mc+5XLB68+dzrb1/RXnJFedcgvGoEDY4oVKUqV1nQ0ZmKheBTyP6DaSHL2em3XPxJ
	 VVFcqztPLH4D02+8lw76mXFsoK0sOOWD3KjPTgDoit9HUPnuzl2AzqLQ+mSY/augpXkZz
	 3oYkjbTQYkeMfOTt/lce+auyViwp+O+/G0k36tw2/RzoYqujNK+Vt8grkTqZxc6CHuYPZ
	 qsRbYSpk4ttQix8Eg0Ha0549E/Qys5aX8l3KyUIb1H2CjCUTZdR35AyB3yklP+Jz10VOH
	 sWjCAe8gpJ26dQrwml9brRSjCcuJgTahCXdn0IA0uHRfbe3gRnI5p7iVcVYjNh6YF8Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791497468;
	bh=KAIqawyXuakpsL9G/cMtHLRmOTrT8PQKf9L3E1C2DgA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y+KfFzX96mJEdWlGlUdUBStVRGhQJw2oJJ8c5KRNVLzu8LPrrxKx7eCTnbkCPtHnJ
	 ijNzTCFzqYvos1XIY3K+BIQxkPbk5CqzDDjspfG4m2ong4o+5qFCJvyWYMQw+lRJaG
	 IfFIV/knU4u68PIulSwfjPjuwXYWhNZuofst80vViufiGdbaOBjrWmn/sERnBwdbVj
	 nitiV6njz85TLQYNDmkMuX6prbBARCVMMwn74yi/Jo5eNYp4Ek2kiu1PmxtZiaos8i
	 4oOiLcwgCQNKujgEe8delK62BtzC2uJpleCECE6R9i/GQNHHT4RfLngSl0/lltlBRf
	 8J479cadzwcWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4F354090C;
	Thu,  8 Oct 2026 22:11:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C880A1A6
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8974092B
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAfHXdNwmu5r for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 01D8D4090A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791497465;
 b=E/KMWJcn1DaD4Qq1Gj6xMU2mKoxDKHVCibfr/DON9zUG0sNB177F6+9nLkl5YCVTXSV6
 QPzGUUv2WLG3jPAde6AUUKTyx+c+A/H5NmS8VlXCSomIHinrsveSDrJEPfiY3wl60xKPC
 lEvBq6zF168YRm6vlUzafOyNjR3W8MRJT8NpVckdlJreZ9mzRbLzG+3rSgd0E3qmhvlZG
 ko/6Q/OW86YILPKzl91CaSqcTLayCrhlvylr1hNtvpsFYTgyPKv4bnwBtqwoVDQyvW6Aq
 CbpSxjMaNlpFvvIdabbyXTVlWWPb+zmKtCAB0pTWwo4LyhVu84oNTXZlVKOLsbJJgiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791497465;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Qi1M05ORgxzrrqCGGbCwdLIoYR7MVC7r09GYjUikYHY=;
 b=e/DfZmd5tpURFTejWwp+iFBOqO6XO2vRcj59W8GiD0+ah3NS0NmwPPWn5NMz81QqewI5
 2Bw693BhELDaRhKECFXJEoMhT8K3j/mIvBBLB0sDnVWZfwDfPLgBILWEIsjPG9/P4Wlki
 QTsuCNOICt4xlD2gCbYLCphYJ+Li5bCvgncTUO9GAyAnSl2rfYa/U3C/7tvr+6fAmX/b3
 81jT6di7FWKiyPN2rjksKnpeO315o2AtXV8wVUu38zDNWnezGUR6WDGVK13B8FJFRM9MB
 1ISNEm4jHqB80OPulQvaU21F0gQa1srEcn9mpGhTq5l28/yrRwk2lGqMplNKR3inh9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01D8D4090A
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 22:11:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CE228DBE1; Thu,  8 Oct 2026 22:09:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 00:09:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6525e9cf89394d45e1c74085d0d1d039bd890d0
X-Git-Newrev: dbf47e3028dcfeb3a52419e5ed6ea3a49cf09cbd
X-Patchwork-Hint: ignore
Message-Id: <20261008220947.8CE228DBE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.9.14
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbf47e3028dcfeb3a52419e5ed6ea3a49cf09cbd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.14/ReleaseNotes?ref_type=tags

Fixes TROVE-2026-062, TROVE-2026-064 & TROVE-2026-067.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 92e5fd4782..37dd1e6000 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
-sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
+sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 8de7ba50f9..49b9524c26 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.13
+TOR_VERSION = 0.4.9.14
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
