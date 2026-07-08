Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BD5C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD69040BB6;
	Fri, 10 Jul 2026 13:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tR7ES1bUpoxr; Fri, 10 Jul 2026 13:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA23940AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691109;
	bh=PmJaYKzDkLNe0F2hvm9eULAnyY8GYmWqZrG04HUMe40=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kjj65atOZ+Ekad+wyK3fsMLEnYIXUW/rlkztLkAbPr4WFP0lQ4O5QAnAegdSWJKpS
	 ankAlOTR+8Z9aUQ+fUDK9oTxblz31dLNFSFIGkK+l1x3kyp5N2rk1d0iv7oI9y0ue6
	 9elTmyli8tPv05jADYPN5qNAT6tdoYdxmHQhQITduCZmHV1lgxV9x0MCRl1/jCUtvZ
	 EScqFSk5lrh/tZrRuEhPXxvesvH1CHlxPT2zhVTJHrEjz+lb/mXULMF7RbAE8JHNp0
	 eVqy2XB0uKAVifGeca2iBiMa0+jYkJwB0wqD1+xcAEgAIyJgcTwuS3I06Pm3G0Omw0
	 SEEevk6nR46BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA23940AD0;
	Fri, 10 Jul 2026 13:45:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53649A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39E77810C1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glW4NpOHJ3LU for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B100810BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B100810BE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB2F58868B; Fri, 10 Jul 2026 13:44:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:28:18 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e0f6f17ca844c84553ced5464128d6b112240c18
X-Git-Newrev: d10430adb6d016ab17b17c45d55c96387d7649f9
X-Patchwork-Hint: ignore
Message-Id: <20260710134415.BB2F58868B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/asterisk:
 security bump to 22.10.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d10430adb6d016ab17b17c45d55c96387d7649f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

See here for a complete Changelog:
https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22-current.html

Security Fixes:
    GHSA-3g56-cgrh-95p5: chan_unistim DIALPAGE digit handling can overflow phone_number and crash Asterisk
    GHSA-3rhj-hhw7-m6fw: NULL Pointer Dereference in HTTP AMI Digest Authentication
    GHSA-4pgv-j3mr-3rcp: Reflected XSS in Phone Provisioning HTTP Error Pages
    GHSA-589g-qgf8-m6mx: Stack buffer overflow in MWI NOTIFY Message-Account parsing
    GHSA-746q-794h-cc7f: Out-of-Bounds Read in Q.931 Information Element Parser (H.323 Addon)
    GHSA-8jhw-m2hg-vp3h: Heap Buffer Overflow in OGG/Speex File Playback (format_ogg_speex)
    GHSA-8jw3-ccr9-xrmf: Buffer over-read in Asterisk PJSIP MWI body parser
    GHSA-g8q2-p36q-94f6: Heap-use-after-free in Asterisk PJSIP TCP/SDP handling when TCP connection closes during SDP processing
    GHSA-h5hv-jmgj-92q2: CVE-2022-37325 fix is absent from current chan_ooh323 Q.931 party-number parser
    GHSA-j2mm-57pq-jh94: Possible RED T.140 Generation Accumulation OOB Write
    GHSA-mxgm-8c6f-5p8f: Stack buffer overflow in res_xmpp XMPP namespace prefix handling
    GHSA-ph27-3m5q-mj5m: SQL Injection in cel_pgsql and cel_tds via CELGenUserEvent eventtype Field
    GHSA-q9fr-m7g8-6ph5: Asterisk app_sms.c copies externally controlled SMS lengths into fixed in-struct buffers
    GHSA-qf8j-jp7h-c5hx: Out-of-Bounds Write in Codec2 Decoder Due to Floor/Ceil Sample Count Mismatch
    GHSA-r6c2-hwc2-j4mp: LDAP Filter Injection in res_config_ldap via SIP Username (Unauthenticated Information Disclosure)
    GHSA-vfhr-r9x9-c687: Possible RED T.140 Heap Buffer Overflow
    GHSA-vrfp-mg3q-3959: ARI setChannelVar bypasses live_dangerously and permits FILE() writes
    GHSA-wcvv-g26m-wx5c: ARI REST-over-WebSocket read-only bypass allows arbitrary module path load and conditional RCE
    GHSA-x348-j6c9-77f3: Stack Buffer Overflow in H.323 ooTrace() via Unbounded vsprintf into Fixed 2048-byte Buffer
    GHSA-xgj6-2gc5-5x9c: ast_loggrabber executes python script in world writable directory(/tmp) leading to potential privilege escalation And RCE

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7f48325de69ddaed921572edad875694a8154419)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 8d620a0ee3..35aa1282e8 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  dd664a9600874d0b0c0e63a8fda2e08efc9f5fdc95781022fbf39ed9b15196f6  asterisk-22.9.0.tar.gz
+sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
 
 # Locally computed
 sha256  633c3dc34ffb21af8ac9ee160245c9c174379391e35cace1b6c9f516a260f683  pjproject-2.16.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index b15a83f6f8..b6b40645ee 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.9.0
+ASTERISK_VERSION = 22.10.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
